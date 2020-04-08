#include <cassert>
#include <ctime>
#include <cctype>
#include <cstdio>
#include <iostream>
#include <cstdlib>
#include <vector>
#include <sys/wait.h>
#include <unistd.h>
#include <sched.h>
#include "subprocess.h"
#include <signal.h>
#include <ext/stdio_filebuf.h>

using namespace __gnu_cxx;
using namespace std;

struct worker {
    worker() {}

    worker(char *argv[]) : sp(subprocess(argv, true, false)), available(false) {}

    subprocess_t sp;
    bool available;
};

static const size_t kNumCPUs = sysconf(_SC_NPROCESSORS_ONLN);
// restore static keyword once you start using these, commented out to suppress compiler warning
static vector<worker> workers;
static size_t numWorkersAvailable = 0;

static void markWorkersAsAvailable(int sig) {
    while (true) {
        pid_t child_pid = waitpid(-1, NULL, WNOHANG | WUNTRACED);
        if (child_pid <= 0) break;
        for (auto &w: workers) {
            if (w.sp.pid == child_pid) {
                w.available = true;
                ++numWorkersAvailable;
                break;
            }
        }
    }
}

// restore static keyword once you start using it, commented out to suppress compiler warning
static char *kWorkerArguments[] = {"./factor.py", "--self-halting", NULL};

static void spawnAllWorkers() {
    cout << "There are this many CPUs: " << kNumCPUs << ", numbered 0 through " << kNumCPUs - 1 << "." << endl;
//    int numWorkerArguments = sizeof(kWorkerArguments) / sizeof(kWorkerArguments[0]);
//    char *workerArguments[numWorkerArguments];
//    copy(kWorkerArguments, kWorkerArguments + numWorkerArguments, workerArguments);
    for (size_t i = 0; i < kNumCPUs; i++) {
        try {
            worker worker_cpu(kWorkerArguments);
            workers.push_back(worker_cpu);
            cout << "Worker " << workers[i].sp.pid << " is set to run on CPU " << i << "." << endl;
        } catch (SubprocessException e){
            cout << e.what() << endl;
        }
    }

}

static void blockSignal(sigset_t &sigset){
    sigemptyset(&sigset);
    sigaddset(&sigset, SIGCHLD);
    sigprocmask(SIG_BLOCK, &sigset, NULL);
}

static void unBlockSignal(sigset_t &sigset){
    sigprocmask(SIG_UNBLOCK, &sigset, NULL);
}

// restore static keyword once you start using it, commented out to suppress compiler warning
static size_t getAvailableWorker() {
    sigset_t sigset;
    blockSignal(sigset);

    sigset_t empty;
    sigemptyset(&empty);

    size_t worker_id;
    while(true){
        if (numWorkersAvailable > 0){
            for (int i = 0; i < workers.size(); ++i) {
                if (workers[i].available) {
                    --numWorkersAvailable;
                    workers[i].available = false;
                    unBlockSignal(sigset);
                    worker_id = i;
                    return worker_id;
                }
            }
        }
        sigsuspend(&empty);
    }
}

static void publishWordsToChild(int to, string &word) {
    stdio_filebuf<char> outbuf(to, std::ios::out);
    ostream os(&outbuf); // manufacture an ostream out of a write-oriented file descriptor so we can use C++ streams semantics (prettier!)
    os << word << endl;
} // stdio_filebuf destroyed, destructor calls close on desciptor it owns


static void broadcastNumbersToWorkers() {
    while (true) {
        string line;
        getline(cin, line);
        if (cin.fail()) break;
        size_t endpos;
        /* long long num = */ stoll(line, &endpos);
        if (endpos != line.size()) break;
        size_t worker_id = getAvailableWorker();
        kill(workers[worker_id].sp.pid, SIGCONT);
        publishWordsToChild(workers[worker_id].sp.supplyfd, line);
        // you shouldn't need all that many lines of additional code
    }
}

static void waitForAllWorkers() {
    sigset_t sigset;
    blockSignal(sigset);

    sigset_t empty;
    sigemptyset(&empty);

    while(numWorkersAvailable != kNumCPUs){
        sigsuspend(&empty);
    }
    unBlockSignal(sigset);
}

static void closeAllWorkers() {
    signal(SIGCHLD, SIG_DFL);
    for (auto &w: workers){
        kill(w.sp.pid, SIGCONT);
        close(w.sp.supplyfd);
    }

    while(true){
        pid_t pid = waitpid(-1, NULL, 0);
        if (pid < 0) break;
    }
}

int main(int argc, char *argv[]) {
    signal(SIGCHLD, markWorkersAsAvailable);
    spawnAllWorkers();
    broadcastNumbersToWorkers();
    waitForAllWorkers();
    closeAllWorkers();
    return 0;
}
