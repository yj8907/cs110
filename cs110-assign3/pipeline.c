/**
 * File: pipeline.c
 * ----------------
 * Presents the implementation of the pipeline routine.
 */

#include "pipeline.h"
#include <stdio.h>
#include <stdbool.h>
#include <errno.h>

void pipeline(char *argv1[], char *argv2[], pid_t pids[]) {

    int fd[2];
    pipe(fd);

    for (int iprocess = 0;iprocess<2;++iprocess){
        pid_t process_id = fork();

        if (process_id == 0){
            if (iprocess == 0){
                close(fd[0]);
                dup2(fd[1], STDOUT_FILENO);
                close(fd[1]);
                execvp(argv1[0], argv1);
            }
            else{
                close(fd[1]);
                dup2(fd[0], STDIN_FILENO);
                close(fd[0]);
                execvp(argv2[0], argv2);
            }
        }
        pids[iprocess] = process_id;
    }
    close(fd[0]);
    close(fd[1]);
}

