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
CMAKE_SOURCE_DIR = /Users/yangjiang/CLionProjects/cs110-assign3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/cs110_assign3.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/cs110_assign3.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cs110_assign3.dir/flags.make

CMakeFiles/cs110_assign3.dir/pipeline.c.o: CMakeFiles/cs110_assign3.dir/flags.make
CMakeFiles/cs110_assign3.dir/pipeline.c.o: ../pipeline.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/cs110_assign3.dir/pipeline.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cs110_assign3.dir/pipeline.c.o   -c /Users/yangjiang/CLionProjects/cs110-assign3/pipeline.c

CMakeFiles/cs110_assign3.dir/pipeline.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cs110_assign3.dir/pipeline.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign3/pipeline.c > CMakeFiles/cs110_assign3.dir/pipeline.c.i

CMakeFiles/cs110_assign3.dir/pipeline.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cs110_assign3.dir/pipeline.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign3/pipeline.c -o CMakeFiles/cs110_assign3.dir/pipeline.c.s

CMakeFiles/cs110_assign3.dir/pipeline-test.c.o: CMakeFiles/cs110_assign3.dir/flags.make
CMakeFiles/cs110_assign3.dir/pipeline-test.c.o: ../pipeline-test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/cs110_assign3.dir/pipeline-test.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cs110_assign3.dir/pipeline-test.c.o   -c /Users/yangjiang/CLionProjects/cs110-assign3/pipeline-test.c

CMakeFiles/cs110_assign3.dir/pipeline-test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cs110_assign3.dir/pipeline-test.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign3/pipeline-test.c > CMakeFiles/cs110_assign3.dir/pipeline-test.c.i

CMakeFiles/cs110_assign3.dir/pipeline-test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cs110_assign3.dir/pipeline-test.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign3/pipeline-test.c -o CMakeFiles/cs110_assign3.dir/pipeline-test.c.s

CMakeFiles/cs110_assign3.dir/subprocess.cc.o: CMakeFiles/cs110_assign3.dir/flags.make
CMakeFiles/cs110_assign3.dir/subprocess.cc.o: ../subprocess.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/cs110_assign3.dir/subprocess.cc.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cs110_assign3.dir/subprocess.cc.o -c /Users/yangjiang/CLionProjects/cs110-assign3/subprocess.cc

CMakeFiles/cs110_assign3.dir/subprocess.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cs110_assign3.dir/subprocess.cc.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign3/subprocess.cc > CMakeFiles/cs110_assign3.dir/subprocess.cc.i

CMakeFiles/cs110_assign3.dir/subprocess.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cs110_assign3.dir/subprocess.cc.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign3/subprocess.cc -o CMakeFiles/cs110_assign3.dir/subprocess.cc.s

CMakeFiles/cs110_assign3.dir/subprocess-test.cc.o: CMakeFiles/cs110_assign3.dir/flags.make
CMakeFiles/cs110_assign3.dir/subprocess-test.cc.o: ../subprocess-test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/cs110_assign3.dir/subprocess-test.cc.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cs110_assign3.dir/subprocess-test.cc.o -c /Users/yangjiang/CLionProjects/cs110-assign3/subprocess-test.cc

CMakeFiles/cs110_assign3.dir/subprocess-test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cs110_assign3.dir/subprocess-test.cc.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign3/subprocess-test.cc > CMakeFiles/cs110_assign3.dir/subprocess-test.cc.i

CMakeFiles/cs110_assign3.dir/subprocess-test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cs110_assign3.dir/subprocess-test.cc.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign3/subprocess-test.cc -o CMakeFiles/cs110_assign3.dir/subprocess-test.cc.s

CMakeFiles/cs110_assign3.dir/trace.cc.o: CMakeFiles/cs110_assign3.dir/flags.make
CMakeFiles/cs110_assign3.dir/trace.cc.o: ../trace.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/cs110_assign3.dir/trace.cc.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cs110_assign3.dir/trace.cc.o -c /Users/yangjiang/CLionProjects/cs110-assign3/trace.cc

CMakeFiles/cs110_assign3.dir/trace.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cs110_assign3.dir/trace.cc.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign3/trace.cc > CMakeFiles/cs110_assign3.dir/trace.cc.i

CMakeFiles/cs110_assign3.dir/trace.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cs110_assign3.dir/trace.cc.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign3/trace.cc -o CMakeFiles/cs110_assign3.dir/trace.cc.s

CMakeFiles/cs110_assign3.dir/trace-error-constants-test.cc.o: CMakeFiles/cs110_assign3.dir/flags.make
CMakeFiles/cs110_assign3.dir/trace-error-constants-test.cc.o: ../trace-error-constants-test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/cs110_assign3.dir/trace-error-constants-test.cc.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cs110_assign3.dir/trace-error-constants-test.cc.o -c /Users/yangjiang/CLionProjects/cs110-assign3/trace-error-constants-test.cc

CMakeFiles/cs110_assign3.dir/trace-error-constants-test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cs110_assign3.dir/trace-error-constants-test.cc.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign3/trace-error-constants-test.cc > CMakeFiles/cs110_assign3.dir/trace-error-constants-test.cc.i

CMakeFiles/cs110_assign3.dir/trace-error-constants-test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cs110_assign3.dir/trace-error-constants-test.cc.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign3/trace-error-constants-test.cc -o CMakeFiles/cs110_assign3.dir/trace-error-constants-test.cc.s

CMakeFiles/cs110_assign3.dir/trace-error-constants.cc.o: CMakeFiles/cs110_assign3.dir/flags.make
CMakeFiles/cs110_assign3.dir/trace-error-constants.cc.o: ../trace-error-constants.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/cs110_assign3.dir/trace-error-constants.cc.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cs110_assign3.dir/trace-error-constants.cc.o -c /Users/yangjiang/CLionProjects/cs110-assign3/trace-error-constants.cc

CMakeFiles/cs110_assign3.dir/trace-error-constants.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cs110_assign3.dir/trace-error-constants.cc.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign3/trace-error-constants.cc > CMakeFiles/cs110_assign3.dir/trace-error-constants.cc.i

CMakeFiles/cs110_assign3.dir/trace-error-constants.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cs110_assign3.dir/trace-error-constants.cc.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign3/trace-error-constants.cc -o CMakeFiles/cs110_assign3.dir/trace-error-constants.cc.s

CMakeFiles/cs110_assign3.dir/trace-system-calls.cc.o: CMakeFiles/cs110_assign3.dir/flags.make
CMakeFiles/cs110_assign3.dir/trace-system-calls.cc.o: ../trace-system-calls.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/cs110_assign3.dir/trace-system-calls.cc.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cs110_assign3.dir/trace-system-calls.cc.o -c /Users/yangjiang/CLionProjects/cs110-assign3/trace-system-calls.cc

CMakeFiles/cs110_assign3.dir/trace-system-calls.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cs110_assign3.dir/trace-system-calls.cc.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign3/trace-system-calls.cc > CMakeFiles/cs110_assign3.dir/trace-system-calls.cc.i

CMakeFiles/cs110_assign3.dir/trace-system-calls.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cs110_assign3.dir/trace-system-calls.cc.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign3/trace-system-calls.cc -o CMakeFiles/cs110_assign3.dir/trace-system-calls.cc.s

CMakeFiles/cs110_assign3.dir/trace-system-calls-test.cc.o: CMakeFiles/cs110_assign3.dir/flags.make
CMakeFiles/cs110_assign3.dir/trace-system-calls-test.cc.o: ../trace-system-calls-test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/cs110_assign3.dir/trace-system-calls-test.cc.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cs110_assign3.dir/trace-system-calls-test.cc.o -c /Users/yangjiang/CLionProjects/cs110-assign3/trace-system-calls-test.cc

CMakeFiles/cs110_assign3.dir/trace-system-calls-test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cs110_assign3.dir/trace-system-calls-test.cc.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign3/trace-system-calls-test.cc > CMakeFiles/cs110_assign3.dir/trace-system-calls-test.cc.i

CMakeFiles/cs110_assign3.dir/trace-system-calls-test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cs110_assign3.dir/trace-system-calls-test.cc.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign3/trace-system-calls-test.cc -o CMakeFiles/cs110_assign3.dir/trace-system-calls-test.cc.s

CMakeFiles/cs110_assign3.dir/trace-options.cc.o: CMakeFiles/cs110_assign3.dir/flags.make
CMakeFiles/cs110_assign3.dir/trace-options.cc.o: ../trace-options.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/cs110_assign3.dir/trace-options.cc.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cs110_assign3.dir/trace-options.cc.o -c /Users/yangjiang/CLionProjects/cs110-assign3/trace-options.cc

CMakeFiles/cs110_assign3.dir/trace-options.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cs110_assign3.dir/trace-options.cc.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign3/trace-options.cc > CMakeFiles/cs110_assign3.dir/trace-options.cc.i

CMakeFiles/cs110_assign3.dir/trace-options.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cs110_assign3.dir/trace-options.cc.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign3/trace-options.cc -o CMakeFiles/cs110_assign3.dir/trace-options.cc.s

CMakeFiles/cs110_assign3.dir/farm.cc.o: CMakeFiles/cs110_assign3.dir/flags.make
CMakeFiles/cs110_assign3.dir/farm.cc.o: ../farm.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/cs110_assign3.dir/farm.cc.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cs110_assign3.dir/farm.cc.o -c /Users/yangjiang/CLionProjects/cs110-assign3/farm.cc

CMakeFiles/cs110_assign3.dir/farm.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cs110_assign3.dir/farm.cc.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yangjiang/CLionProjects/cs110-assign3/farm.cc > CMakeFiles/cs110_assign3.dir/farm.cc.i

CMakeFiles/cs110_assign3.dir/farm.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cs110_assign3.dir/farm.cc.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yangjiang/CLionProjects/cs110-assign3/farm.cc -o CMakeFiles/cs110_assign3.dir/farm.cc.s

# Object files for target cs110_assign3
cs110_assign3_OBJECTS = \
"CMakeFiles/cs110_assign3.dir/pipeline.c.o" \
"CMakeFiles/cs110_assign3.dir/pipeline-test.c.o" \
"CMakeFiles/cs110_assign3.dir/subprocess.cc.o" \
"CMakeFiles/cs110_assign3.dir/subprocess-test.cc.o" \
"CMakeFiles/cs110_assign3.dir/trace.cc.o" \
"CMakeFiles/cs110_assign3.dir/trace-error-constants-test.cc.o" \
"CMakeFiles/cs110_assign3.dir/trace-error-constants.cc.o" \
"CMakeFiles/cs110_assign3.dir/trace-system-calls.cc.o" \
"CMakeFiles/cs110_assign3.dir/trace-system-calls-test.cc.o" \
"CMakeFiles/cs110_assign3.dir/trace-options.cc.o" \
"CMakeFiles/cs110_assign3.dir/farm.cc.o"

# External object files for target cs110_assign3
cs110_assign3_EXTERNAL_OBJECTS =

cs110_assign3: CMakeFiles/cs110_assign3.dir/pipeline.c.o
cs110_assign3: CMakeFiles/cs110_assign3.dir/pipeline-test.c.o
cs110_assign3: CMakeFiles/cs110_assign3.dir/subprocess.cc.o
cs110_assign3: CMakeFiles/cs110_assign3.dir/subprocess-test.cc.o
cs110_assign3: CMakeFiles/cs110_assign3.dir/trace.cc.o
cs110_assign3: CMakeFiles/cs110_assign3.dir/trace-error-constants-test.cc.o
cs110_assign3: CMakeFiles/cs110_assign3.dir/trace-error-constants.cc.o
cs110_assign3: CMakeFiles/cs110_assign3.dir/trace-system-calls.cc.o
cs110_assign3: CMakeFiles/cs110_assign3.dir/trace-system-calls-test.cc.o
cs110_assign3: CMakeFiles/cs110_assign3.dir/trace-options.cc.o
cs110_assign3: CMakeFiles/cs110_assign3.dir/farm.cc.o
cs110_assign3: CMakeFiles/cs110_assign3.dir/build.make
cs110_assign3: CMakeFiles/cs110_assign3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Linking CXX executable cs110_assign3"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cs110_assign3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/cs110_assign3.dir/build: cs110_assign3

.PHONY : CMakeFiles/cs110_assign3.dir/build

CMakeFiles/cs110_assign3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cs110_assign3.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cs110_assign3.dir/clean

CMakeFiles/cs110_assign3.dir/depend:
	cd /Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/yangjiang/CLionProjects/cs110-assign3 /Users/yangjiang/CLionProjects/cs110-assign3 /Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug /Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug /Users/yangjiang/CLionProjects/cs110-assign3/cmake-build-debug/CMakeFiles/cs110_assign3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/cs110_assign3.dir/depend

