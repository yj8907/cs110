/**
 * File: thread-pool.cc
 * --------------------
 * Presents the implementation of the ThreadPool class.
 */

#include <numeric>
#include "thread-pool.h"
#include "ostreamlock.h"

using namespace std;

ThreadPool::ThreadPool(size_t numThreads) :
        wts(numThreads),
        workerAvailable(numThreads, true),
        allWorkerFinished(-numThreads), jobAvailable(numThreads),
        workLoad(numThreads) {

    dt = thread(&ThreadPool::dispatcher, this);

    for (size_t workerID = 0; workerID < numThreads; ++workerID){
        wts[workerID] = thread(&ThreadPool::worker, this, workerID);
    }

    cout << oslock << "successfully initialized" << endl << osunlock;

    cout << oslock << "detaching threads" << endl << osunlock;
    dt.detach();
    for (auto &t: wts) t.detach();
    cout << oslock << "successfully detached" << endl << osunlock;

}

void ThreadPool::schedule(const function<void(void)>& thunk) {
    cout << oslock << "scheduling jobs" << endl << osunlock;
    queueMtx.lock();
    workQueue.push(thunk);
    queueMtx.unlock();
    queueCV.notify_all();
    cout << oslock << "successfully scheduled" << endl << osunlock;
}

void ThreadPool::wait() {
    queueMtx.lock();
    waitCV.wait(queueMtx, [this](){ return workQueue.empty();});
    queueMtx.unlock();
    cout << "wait finished" << endl;
}


void ThreadPool::dispatcher() {

    while(true){

        cout << oslock << "test1 empty: " << endl << osunlock;
        cout << oslock << isQueueEmtpy() << endl << osunlock;

        queueMtx.lock();
        if (workQueue.empty())
        {
            waitCV.notify_all();
            queueCV.wait(queueMtx, [this](){
                dispatchIdle = true;
                descructorCV.notify_all();
                return !workQueue.empty() || threadExist; });

            if (threadExist) {
                allWorkerFinished.signal(on_thread_exit);
                break;
            }
        }
        queueMtx.unlock();

        anyWorkerMtx.lock();
        anyWorkerAvailable.wait(anyWorkerMtx, [this](){
            return accumulate(workerAvailable.begin(), workerAvailable.end(), 0) > 0; });
        anyWorkerMtx.unlock();

        cout << oslock << "test2" << endl << osunlock;

        if (!isQueueEmtpy()){

            queueMtx.lock();
            dispatchIdle = false;
            queueMtx.unlock();

            for (size_t i = 0; i<wts.size();++i){
                if ( getWorkerState(i)){
                    setWorkerState(false, i);
                    if (!isQueueEmtpy()) {
                        cout << oslock << "dispatching job " << i << endl << osunlock;
                        queueMtx.lock();
                        workLoad[i] = workQueue.front();
                        workQueue.pop();
                        queueMtx.unlock();
                        jobAvailable[i].signal();
                        cout << oslock << "dispatched job " << i << endl << osunlock;
                    } else {
                        workLoad[i] = NULL;
                    }
                }
            }
        }

    }

}


void ThreadPool::worker(int workerID) {

    while(true){
        jobAvailable[workerID].wait();

        if (threadExist) {
            allWorkerFinished.signal(on_thread_exit);
            break;
        }

        if (workLoad[workerID]) workLoad[workerID]();
        setWorkerState(true, workerID);
        anyWorkerAvailable.notify_all();
    }
}

void ThreadPool::setWorkerState(bool state, int workerID) {
    workerMtx.lock();
    workerAvailable[workerID] = state;
    workerMtx.unlock();
}

bool ThreadPool::getWorkerState(int workerID) {
    bool state;
    workerMtx.lock();
    state = workerAvailable[workerID];
    workerMtx.unlock();
    return state;
}

bool ThreadPool::isQueueEmtpy() {
    bool queueEmpty;
    queueMtx.lock();
    queueEmpty = workQueue.empty();
    queueMtx.unlock();
    return queueEmpty;
}

ThreadPool::~ThreadPool() {

    wait();

    queueMtx.lock();
    descructorCV.wait(queueMtx, [this](){return dispatchIdle;});
    queueMtx.unlock();

    anyWorkerMtx.lock();
    anyWorkerAvailable.wait(anyWorkerMtx,
                            [this](){ return accumulate(workerAvailable.cbegin(), workerAvailable.cend(), 0) == wts.size();});
    anyWorkerMtx.unlock();

    threadExist = true;

    for (auto &t: jobAvailable){
        t.signal();
    }

    workQueue.push(NULL);
    queueCV.notify_all();

    allWorkerFinished.wait();
    cout << "destructor finished" << endl;

}
