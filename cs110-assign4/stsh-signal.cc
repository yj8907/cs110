/**
 * File: stsh-signal.cc
 * --------------------
 * Presents the implementation of the installSignalHandler
 * routine, which appears on page 752 of B&O, 2nd edition.
 *
 * This is a slightly more robust version of the signal system call.
 */

#include <signal.h>
#include "stsh-signal.h"
#include "stsh-exception.h"
#include "stsh-job-list.h"
#include "stsh-job.h"
#include "stsh_v1.cc"

using namespace std;

void installSignalHandler(int signum, handler_t handler) {
    struct sigaction action;
    action.sa_handler = handler;
    sigemptyset(&action.sa_mask);
    action.sa_flags = SA_RESTART; // restart system calls if possible
    if (sigaction(signum, &action, NULL) < 0)
        throw STSHException("Failed to install a handler for signal with number " + to_string(signum) + ".");
}

void foregroundProcessHandler(int sig) {
    while(true){
        pid_t pid;
        int stat;
        if ( (pid = waitpid(-1, &stat, WNOHANG | WUNTRACED)) < 0) break;

        if (joblist.containsProcess(pid)){
            STSHJob &job = joblist.getJobWithProcess(pid);
            if (job.containsProcess(pid)){
                STSHProcess &process = job.getProcess(pid);
                if (WIFSTOPPED(stat)) {
                    process.setState(kStopped);
                } else if (WIFEXITED(stat)){
                    process.setState(kTerminated);
                }
                joblist.synchronize(job);
            }
        }
    }
}
