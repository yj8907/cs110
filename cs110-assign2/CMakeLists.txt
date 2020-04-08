cmake_minimum_required(VERSION 3.15)
project(cs110_assign2)

set(CMAKE_CXX_STANDARD 14)

add_executable(cs110_assign2 filsys.h ino.h direntv6.h diskimageaccess.c
        chksumfile.h chksumfile.c unixfilesystem.c diskimg.c inode.c file.c pathname.c directory.c)