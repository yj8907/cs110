# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/yangjiang/CLionProjects/cs110-assign2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/cs110_assign2.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/cs110_assign2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cs110_assign2.dir/flags.make

CMakeFiles/cs110_assign2.dir/diskimageaccess.c.o: CMakeFiles/cs110_assign2.dir/flags.make
CMakeFiles/cs110_assign2.dir/diskimageaccess.c.o: ../diskimageaccess.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/cs110_assign2.dir/diskimageaccess.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cs110_assign2.dir/diskimageaccess.c.o   -c /Users/yangjiang/CLionProjects/cs110-assign2/diskimageaccess.c

CMakeFiles/cs110_assign2.dir/diskimageaccess.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cs110_assign2.dir/diskimageaccess.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign2/diskimageaccess.c > CMakeFiles/cs110_assign2.dir/diskimageaccess.c.i

CMakeFiles/cs110_assign2.dir/diskimageaccess.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cs110_assign2.dir/diskimageaccess.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign2/diskimageaccess.c -o CMakeFiles/cs110_assign2.dir/diskimageaccess.c.s

CMakeFiles/cs110_assign2.dir/chksumfile.c.o: CMakeFiles/cs110_assign2.dir/flags.make
CMakeFiles/cs110_assign2.dir/chksumfile.c.o: ../chksumfile.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/cs110_assign2.dir/chksumfile.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cs110_assign2.dir/chksumfile.c.o   -c /Users/yangjiang/CLionProjects/cs110-assign2/chksumfile.c

CMakeFiles/cs110_assign2.dir/chksumfile.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cs110_assign2.dir/chksumfile.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign2/chksumfile.c > CMakeFiles/cs110_assign2.dir/chksumfile.c.i

CMakeFiles/cs110_assign2.dir/chksumfile.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cs110_assign2.dir/chksumfile.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign2/chksumfile.c -o CMakeFiles/cs110_assign2.dir/chksumfile.c.s

CMakeFiles/cs110_assign2.dir/unixfilesystem.c.o: CMakeFiles/cs110_assign2.dir/flags.make
CMakeFiles/cs110_assign2.dir/unixfilesystem.c.o: ../unixfilesystem.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/cs110_assign2.dir/unixfilesystem.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cs110_assign2.dir/unixfilesystem.c.o   -c /Users/yangjiang/CLionProjects/cs110-assign2/unixfilesystem.c

CMakeFiles/cs110_assign2.dir/unixfilesystem.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cs110_assign2.dir/unixfilesystem.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign2/unixfilesystem.c > CMakeFiles/cs110_assign2.dir/unixfilesystem.c.i

CMakeFiles/cs110_assign2.dir/unixfilesystem.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cs110_assign2.dir/unixfilesystem.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign2/unixfilesystem.c -o CMakeFiles/cs110_assign2.dir/unixfilesystem.c.s

CMakeFiles/cs110_assign2.dir/diskimg.c.o: CMakeFiles/cs110_assign2.dir/flags.make
CMakeFiles/cs110_assign2.dir/diskimg.c.o: ../diskimg.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/cs110_assign2.dir/diskimg.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cs110_assign2.dir/diskimg.c.o   -c /Users/yangjiang/CLionProjects/cs110-assign2/diskimg.c

CMakeFiles/cs110_assign2.dir/diskimg.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cs110_assign2.dir/diskimg.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign2/diskimg.c > CMakeFiles/cs110_assign2.dir/diskimg.c.i

CMakeFiles/cs110_assign2.dir/diskimg.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cs110_assign2.dir/diskimg.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign2/diskimg.c -o CMakeFiles/cs110_assign2.dir/diskimg.c.s

CMakeFiles/cs110_assign2.dir/inode.c.o: CMakeFiles/cs110_assign2.dir/flags.make
CMakeFiles/cs110_assign2.dir/inode.c.o: ../inode.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/cs110_assign2.dir/inode.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cs110_assign2.dir/inode.c.o   -c /Users/yangjiang/CLionProjects/cs110-assign2/inode.c

CMakeFiles/cs110_assign2.dir/inode.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cs110_assign2.dir/inode.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign2/inode.c > CMakeFiles/cs110_assign2.dir/inode.c.i

CMakeFiles/cs110_assign2.dir/inode.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cs110_assign2.dir/inode.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign2/inode.c -o CMakeFiles/cs110_assign2.dir/inode.c.s

CMakeFiles/cs110_assign2.dir/file.c.o: CMakeFiles/cs110_assign2.dir/flags.make
CMakeFiles/cs110_assign2.dir/file.c.o: ../file.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/cs110_assign2.dir/file.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cs110_assign2.dir/file.c.o   -c /Users/yangjiang/CLionProjects/cs110-assign2/file.c

CMakeFiles/cs110_assign2.dir/file.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cs110_assign2.dir/file.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign2/file.c > CMakeFiles/cs110_assign2.dir/file.c.i

CMakeFiles/cs110_assign2.dir/file.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cs110_assign2.dir/file.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign2/file.c -o CMakeFiles/cs110_assign2.dir/file.c.s

CMakeFiles/cs110_assign2.dir/pathname.c.o: CMakeFiles/cs110_assign2.dir/flags.make
CMakeFiles/cs110_assign2.dir/pathname.c.o: ../pathname.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/cs110_assign2.dir/pathname.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cs110_assign2.dir/pathname.c.o   -c /Users/yangjiang/CLionProjects/cs110-assign2/pathname.c

CMakeFiles/cs110_assign2.dir/pathname.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cs110_assign2.dir/pathname.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign2/pathname.c > CMakeFiles/cs110_assign2.dir/pathname.c.i

CMakeFiles/cs110_assign2.dir/pathname.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cs110_assign2.dir/pathname.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign2/pathname.c -o CMakeFiles/cs110_assign2.dir/pathname.c.s

CMakeFiles/cs110_assign2.dir/directory.c.o: CMakeFiles/cs110_assign2.dir/flags.make
CMakeFiles/cs110_assign2.dir/directory.c.o: ../directory.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/cs110_assign2.dir/directory.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cs110_assign2.dir/directory.c.o   -c /Users/yangjiang/CLionProjects/cs110-assign2/directory.c

CMakeFiles/cs110_assign2.dir/directory.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cs110_assign2.dir/directory.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign2/directory.c > CMakeFiles/cs110_assign2.dir/directory.c.i

CMakeFiles/cs110_assign2.dir/directory.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cs110_assign2.dir/directory.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign2/directory.c -o CMakeFiles/cs110_assign2.dir/directory.c.s

# Object files for target cs110_assign2
cs110_assign2_OBJECTS = \
"CMakeFiles/cs110_assign2.dir/diskimageaccess.c.o" \
"CMakeFiles/cs110_assign2.dir/chksumfile.c.o" \
"CMakeFiles/cs110_assign2.dir/unixfilesystem.c.o" \
"CMakeFiles/cs110_assign2.dir/diskimg.c.o" \
"CMakeFiles/cs110_assign2.dir/inode.c.o" \
"CMakeFiles/cs110_assign2.dir/file.c.o" \
"CMakeFiles/cs110_assign2.dir/pathname.c.o" \
"CMakeFiles/cs110_assign2.dir/directory.c.o"

# External object files for target cs110_assign2
cs110_assign2_EXTERNAL_OBJECTS =

cs110_assign2: CMakeFiles/cs110_assign2.dir/diskimageaccess.c.o
cs110_assign2: CMakeFiles/cs110_assign2.dir/chksumfile.c.o
cs110_assign2: CMakeFiles/cs110_assign2.dir/unixfilesystem.c.o
cs110_assign2: CMakeFiles/cs110_assign2.dir/diskimg.c.o
cs110_assign2: CMakeFiles/cs110_assign2.dir/inode.c.o
cs110_assign2: CMakeFiles/cs110_assign2.dir/file.c.o
cs110_assign2: CMakeFiles/cs110_assign2.dir/pathname.c.o
cs110_assign2: CMakeFiles/cs110_assign2.dir/directory.c.o
cs110_assign2: CMakeFiles/cs110_assign2.dir/build.make
cs110_assign2: CMakeFiles/cs110_assign2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking C executable cs110_assign2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cs110_assign2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/cs110_assign2.dir/build: cs110_assign2

.PHONY : CMakeFiles/cs110_assign2.dir/build

CMakeFiles/cs110_assign2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cs110_assign2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cs110_assign2.dir/clean

CMakeFiles/cs110_assign2.dir/depend:
	cd /Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/yangjiang/CLionProjects/cs110-assign2 /Users/yangjiang/CLionProjects/cs110-assign2 /Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug /Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug /Users/yangjiang/CLionProjects/cs110-assign2/cmake-build-debug/CMakeFiles/cs110_assign2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/cs110_assign2.dir/depend

