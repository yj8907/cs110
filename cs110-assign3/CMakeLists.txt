cmake_minimum_required(VERSION 3.15)
project(cs110_assign3)

set(CMAKE_CXX_STANDARD 14)

add_executable(cs110_assign3 pipeline.c pipeline-test.c subprocess.cc subprocess-test.cc trace.cc
        trace-error-constants-test.cc trace-error-constants.cc trace-system-calls.cc trace-system-calls-test.cc
        trace-options.cc farm.cc)