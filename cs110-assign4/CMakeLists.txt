cmake_minimum_required(VERSION 3.15)
project(cs110_assign4)

set(CMAKE_CXX_STANDARD 14)

add_library(cs110_assign4 library.cpp  library.h stsh_v1.cc int.cc stsh-signal.cc
        stsh-job-list.cc stsh-job.cc stsh-process.cc stsh-parse-utils.cc stsh-parser/stsh-readline.cc
        stsh-parser/stsh-parse.cc stsh-parser/scanner.cc)