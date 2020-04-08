/**
 * File: stsh.cc
 * -------------
 * Defines the entry point of the stsh executable.
 */

#include "stsh-parser/stsh-parse.h"
#include "stsh-parser/stsh-readline.h"
#include "stsh-parser/stsh-parse-exception.h"
#include "stsh-signal.h"
#include "stsh-job-list.h"
#include "stsh-job.h"
#include "stsh-process.h"
#include <cstring>
#include <iostream>
#include <string>
#include <algorithm>
#include <fcntl.h>
#include <unistd.h>  // for fork
#include <signal.h>  // for kill
#include <sys/wait.h>

using namespace std;

static STSHJobList joblist; // the one piece of global data we need so signal handlers can access it

/**
 * Function: handleBuiltin
 * -----------------------
 * Examines the leading command of the provided pipeline to see if
 * it's a shell builtin, and if so, handles and executes it.  handleBuiltin
 * returns true if the command is a builtin, and false otherwise.
 */
static const string kSupportedBuiltins[] = {"quit", "exit", "fg", "bg", "slay", "halt", "cont", "jobs"};
static const size_t kNumSupportedBuiltins = sizeof(kSupportedBuiltins) / sizeof(kSupportedBuiltins[0]);

static bool handleBuiltin(const pipeline &pipeline) {
    const string &command = pipeline.commands[0].command;
    auto iter = find(kSupportedBuiltins, kSupportedBuiltins + kNumSupportedBuiltins, command);
    if (iter == kSupportedBuiltins + kNumSupportedBuiltins) return false;
    size_t index = iter - kSupportedBuiltins;

    switch (index) {
        case 0:
        case 1:
            exit(0);
        case 7:
            cout << joblist;
            break;
        default:
            throw STSHException("Internal Error: Builtin command not supported."); // or not implemented yet
    }

    return true;
}

/**
 * Function: installSignalHandlers
 * -------------------------------
 * Installs user-defined signals handlers for four signals
 * (once you've implemented signal handlers for SIGCHLD, 
 * SIGINT, and SIGTSTP, you'll add more installSignalHandler calls) and 
 * ignores two others.
 */
static void installSignalHandlers() {
    installSignalHandler(SIGQUIT, [](int sig) { exit(0); });
    installSignalHandler(SIGTTIN, SIG_IGN);
    installSignalHandler(SIGTTOU, SIG_IGN);
    installSignalHandler(SIGCHLD, foregroundProcessHandler);
}

/**
 * Function: waitForegroundProcess
 * Wait for foreground process to be reaped
 */
static void waitForegroundProcess(){
    sigset_t childmask, oldmask;
    sigemptyset(&childmask);
    sigaddset(&childmask, SIGCHLD);

    while(joblist.hasForegroundJob()){
        sigsuspend(&childmask);
    }
}

void runPipelines(const pipeline &p, vector<pid_t> &pids) {

    int numCommands = p.commands.size();
    int pgpid;

    if (numCommands == 1) {
        pids.push_back(getpid());
        setpgid(getpid(), getpid());
        execvp(p.commands[0].command, p.commands[0].tokens);
    } else {
        int fds[numCommands-1][2];

        for (int iprocess = 0;iprocess<numCommands;++iprocess){
            pid_t pid;

            pipe(fds[iprocess]);
            if ((pid = fork()) == 0){
                if (iprocess == 0){
                    close(fds[iprocess][0]);
                    dup2(fds[iprocess][1], STDOUT_FILENO);
                } else {
                    dup2(fds[iprocess-1][0], STDIN_FILENO);
                    dup2(fds[iprocess][1], STDOUT_FILENO);

                    close(fds[iprocess-1][1]);
                    close(fds[iprocess][0]);
                }
                execvp(p.commands[iprocess].command, p.commands[iprocess].tokens);
            } else {
                if (iprocess > 0){
                    close(fds[iprocess-1][0]);
                    close(fds[iprocess-1][1]);
                }
                pids.push_back(pid);
            }
            // set group id to the pid of first child process
            pgpid = pids[0];
            setpgid(pid, pgpid);

        }
    }
}



/**
 *
 * Function: runJob
 * Creates STSHProcess and run the processes
 */
static void runJob(STSHJob &job, const pipeline &p){
    vector<pid_t> pids;

    setpgid(getpid(), getpid());
    runPipelines(p, pids);

    int numProc = p.commands.size();
    for (int i = 0;i < numProc; ++i){
        job.addProcess(STSHProcess(pids[i], p.commands[i]));
    }
}


/**
 * Function: createJob
 * -------------------
 * Creates a new job on behalf of the provided pipeline.
 */
static void createJob(const pipeline &p) {
//    cout << p; // remove this line once you get started

    STSHJob& job = joblist.addJob(p.background ? kBackground: kForeground);

    sigset_t childmask, oldmask;
    sigemptyset(&childmask);
    sigaddset(&childmask, SIGCHLD);
    sigprocmask(SIG_BLOCK, &childmask, &oldmask);

    pid_t pid;
    if ((pid = fork()) == 0){
        runJob(job, p);
    } else if (!p.background){
        waitForegroundProcess();
    }
    sigprocmask(SIG_UNBLOCK, &childmask, &oldmask);

}



/**
 * Function: main
 * --------------
 * Defines the entry point for a process running stsh.
 * The main function is little more than a read-eval-print
 * loop (i.e. a repl).  
 */
int main(int argc, char *argv[]) {
    pid_t stshpid = getpid();
    installSignalHandlers();
    rlinit(argc, argv);
    while (true) {
        string line;
        if (!readline(line)) break;
        if (line.empty()) continue;
        try {
            pipeline p(line);
            bool builtin = handleBuiltin(p);
            if (!builtin) createJob(p);
        } catch (const STSHException &e) {
            cerr << e.what() << endl;
            if (getpid() != stshpid) exit(0); // if exception is thrown from child process, kill it
        }
    }

    return 0;
}
