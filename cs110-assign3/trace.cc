/**
 * File: trace.cc
 * ----------------
 * Presents the implementation of the trace program, which traces the execution of another
 * program and prints out information about ever single system call it makes.  For each system call,
 * trace prints:
 *
 *    + the name of the system call,
 *    + the values of all of its arguments, and
 *    + the system calls return value
 */

#include <cassert>
#include <iostream>
#include <sstream>
#include <map>
#include <set>

#include <unistd.h> // for fork, execvp
#include <string.h> // for memchr, strerror
#include <sys/ptrace.h>
#include <sys/reg.h>
#include <sys/wait.h>
#include "trace-options.h"
#include "trace-error-constants.h"
#include "trace-system-calls.h"
#include "trace-exception.h"

using namespace std;

long accessRegister(int &argid){

    if (argid > 5) {
        fprintf(stderr, "system call argument id should be < 6");
        return -1;
    }
    switch(argid){
        case 0: return RDI * sizeof(long);
        case 1: return RSI * sizeof(long);
        case 2: return RDX * sizeof(long);
        case 3: return R10 * sizeof(long);
        case 4: return R8 * sizeof(long);
        case 5: return R9 * sizeof(long);
        default: return -1;
    }
}

string processRetVal(map<int, string> &errorConstants, int &sc_id, string &sc_name, long &retval){
    if (sc_id == 12 || sc_id == 9){
        stringstream ss;
        ss << hex << retval;
        return "0x" + ss.str();
    } else {
        if (retval >= 0) return to_string(retval);
        if (retval == -38) return "0";
        string retMessage = errorConstants[abs(retval)];
        return to_string(retval) + " " + retMessage;
    }
}

void printSyscall(pid_t &pid, int& sc_id, string& sc_name,
        systemCallSignature &signature, map<int, string> &errorConstants, bool& simple){

    long sc_return = ptrace(PTRACE_PEEKUSER, pid, RAX * sizeof(long), 0);

    if (simple){
        cout << "syscall(" << sc_id << ") = ";
        if (sc_id == 60 || sc_id == 231) {
            cout << "<no return>";
        } else {
            cout << sc_return;
        }
        cout << endl;
    } else {
        cout << sc_name << "(";
        for (int i = 0; i < signature.size(); ++i){
            if (signature[i] == SYSCALL_STRING){
                int str_iter = 0;
                char arg_char;
                cout << '"';
                while(true){
                    arg_char = ptrace(PTRACE_PEEKDATA, pid,
                            ptrace(PTRACE_PEEKUSER, pid, accessRegister(i), 0) + str_iter*sizeof(char), 0);
                    arg_char = arg_char & 0xFF;
                    if (arg_char == '\0') break;
                    ++str_iter;
                    cout << arg_char;
                }
                cout << '"';
            } else {
                long arg = ptrace(PTRACE_PEEKUSER, pid, accessRegister(i), 0);
                if (signature[i] == SYSCALL_INTEGER) {
                    cout << int(arg);
                } else {
                    cout << arg;
                }
            }

            if (i < signature.size() -1) {
                cout << ", ";
            } else {
                cout << ") = ";
            }
        }

    }
}


void trace(bool& simple, bool& rebuild, char *argv[]){

    map<int, string> systemCallNumbers;
    map<std::string, int> systemCallNames;
    map<std::string, systemCallSignature> systemCallSignatures;
    compileSystemCallData(systemCallNumbers, systemCallNames, systemCallSignatures, rebuild);

    map<int, string> errorConstants;
    compileSystemCallErrorStrings(errorConstants);

    pid_t pid = fork();

    if (pid == 0){
        ptrace(PTRACE_TRACEME, 0, 0, 0);
        execvp(argv[0], argv);
    }

    while(true){
        int stat;
        waitpid(pid, &stat, 0);
        if (WIFSTOPPED(stat) && WSTOPSIG(stat) == SIGTRAP){
            long syscall_id = ptrace(PTRACE_PEEKUSER, pid, ORIG_RAX * sizeof(long), 0);
            long syscall_ret = ptrace(PTRACE_PEEKUSER, pid, RAX * sizeof(long), 0);
            ptrace(PTRACE_SYSCALL, pid, 0, 0);
        }
        if (WIFEXITED(stat) || WIFSIGNALED(stat)) break;
    }
}

int main(int argc, char *argv[]) {
    bool simple = false, rebuild = false;
    int numFlags = processCommandLineFlags(simple, rebuild, argv);
    if (argc - numFlags == 1) {
        cout << "Nothing to trace... exiting." << endl;
        return 0;
    }


    return 0;
}
