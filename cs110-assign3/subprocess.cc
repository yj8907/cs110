/**
 * File: subprocess.cc
 * -------------------
 * Presents the implementation of the subprocess routine.
 */


#include <unistd.h>
#include "subprocess.h"

using namespace std;

subprocess_t subprocess(char *argv[], bool supplyChildInput, bool ingestChildOutput) throw (SubprocessException) {
    int childInputFds[2];
    int childOutputFds[2];
    pipe(childInputFds);
    pipe(childOutputFds);

    pid_t process_id;

    process_id = fork();
    if (process_id < 0) throw SubprocessException("pid < 0");

    if (process_id == 0) {
        if (supplyChildInput) {
            dup2(childInputFds[0], STDIN_FILENO);
        } else {
            close(childInputFds[0]);
        }
        close(childInputFds[1]);

        if (ingestChildOutput) {
            dup2(childOutputFds[1], STDOUT_FILENO);
        } else {
            close(childOutputFds[1]);
        }
        close(childOutputFds[0]);

        execvp(argv[0], argv);
        throw SubprocessException("execvp failed to exit properly");
    }

    subprocess_t process = {process_id,
                                   supplyChildInput? childInputFds[1] : kNotInUse,
                                   ingestChildOutput ? childOutputFds[0] : kNotInUse};
    if (!supplyChildInput) close(childInputFds[1]);
    close(childInputFds[0]);
    if (!ingestChildOutput) close(childOutputFds[0]);
    close(childOutputFds[1]);

    return process;
}
