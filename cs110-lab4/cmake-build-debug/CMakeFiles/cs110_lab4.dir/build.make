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
CMAKE_SOURCE_DIR = /Users/yangjiang/CLionProjects/cs110-lab4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/yangjiang/CLionProjects/cs110-lab4/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/cs110_lab4.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/cs110_lab4.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cs110_lab4.dir/flags.make

CMakeFiles/cs110_lab4.dir/quicksort.cc.o: CMakeFiles/cs110_lab4.dir/flags.make
CMakeFiles/cs110_lab4.dir/quicksort.cc.o: ../quicksort.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-lab4/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/cs110_lab4.dir/quicksort.cc.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cs110_lab4.dir/quicksort.cc.o -c /Users/yangjiang/CLionProjects/cs110-lab4/quicksort.cc

CMakeFiles/cs110_lab4.dir/quicksort.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cs110_lab4.dir/quicksort.cc.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-lab4/quicksort.cc > CMakeFiles/cs110_lab4.dir/quicksort.cc.i

CMakeFiles/cs110_lab4.dir/quicksort.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cs110_lab4.dir/quicksort.cc.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-lab4/quicksort.cc -o CMakeFiles/cs110_lab4.dir/quicksort.cc.s

# Object files for target cs110_lab4
cs110_lab4_OBJECTS = \
"CMakeFiles/cs110_lab4.dir/quicksort.cc.o"

# External object files for target cs110_lab4
cs110_lab4_EXTERNAL_OBJECTS =

cs110_lab4: CMakeFiles/cs110_lab4.dir/quicksort.cc.o
cs110_lab4: CMakeFiles/cs110_lab4.dir/build.make
cs110_lab4: CMakeFiles/cs110_lab4.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/yangjiang/CLionProjects/cs110-lab4/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable cs110_lab4"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cs110_lab4.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/cs110_lab4.dir/build: cs110_lab4

.PHONY : CMakeFiles/cs110_lab4.dir/build

CMakeFiles/cs110_lab4.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cs110_lab4.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cs110_lab4.dir/clean

CMakeFiles/cs110_lab4.dir/depend:
	cd /Users/yangjiang/CLionProjects/cs110-lab4/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/yangjiang/CLionProjects/cs110-lab4 /Users/yangjiang/CLionProjects/cs110-lab4 /Users/yangjiang/CLionProjects/cs110-lab4/cmake-build-debug /Users/yangjiang/CLionProjects/cs110-lab4/cmake-build-debug /Users/yangjiang/CLionProjects/cs110-lab4/cmake-build-debug/CMakeFiles/cs110_lab4.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/cs110_lab4.dir/depend

