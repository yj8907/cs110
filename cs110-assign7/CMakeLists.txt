cmake_minimum_required(VERSION 3.15)
project(cs110_assign7)

set(CMAKE_CXX_STANDARD 14)

add_executable(cs110_assign7 main.cc blacklist.cc cache.cc client-socket.cc header.cc ostreamlock.cpp proxy.cc
        proxy.cc proxy-options.cc request.cc request-handler.cc request.cc scheduler.cc thread-pool.cc
        payload.cc response.cc)