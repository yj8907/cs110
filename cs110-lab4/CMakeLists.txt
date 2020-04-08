cmake_minimum_required(VERSION 3.15)
project(cs110_lab4)

set(CMAKE_CXX_STANDARD 14)
include_directories(../extra/include)

add_executable(cs110_lab4 quicksort.cc)