# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = D:/Environment/cmake-3.23.1-windows-x86_64/bin/cmake.exe

# The command to remove a file.
RM = D:/Environment/cmake-3.23.1-windows-x86_64/bin/cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = E:/OS/x86os/start/start

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = E:/OS/x86os/start/start/build

# Include any dependencies generated for this target.
include source/loader/CMakeFiles/loader.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include source/loader/CMakeFiles/loader.dir/compiler_depend.make

# Include the progress variables for this target.
include source/loader/CMakeFiles/loader.dir/progress.make

# Include the compile flags for this target's objects.
include source/loader/CMakeFiles/loader.dir/flags.make

source/loader/CMakeFiles/loader.dir/start.S.obj: source/loader/CMakeFiles/loader.dir/flags.make
source/loader/CMakeFiles/loader.dir/start.S.obj: source/loader/CMakeFiles/loader.dir/includes_ASM.rsp
source/loader/CMakeFiles/loader.dir/start.S.obj: ../source/loader/start.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:/OS/x86os/start/start/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building ASM object source/loader/CMakeFiles/loader.dir/start.S.obj"
	cd E:/OS/x86os/start/start/build/source/loader && D:/Environment/x86_64-elf-tools-windows/bin/x86_64-elf-gcc.exe $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/loader.dir/start.S.obj -c E:/OS/x86os/start/start/source/loader/start.S

source/loader/CMakeFiles/loader.dir/start.S.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing ASM source to CMakeFiles/loader.dir/start.S.i"
	cd E:/OS/x86os/start/start/build/source/loader && D:/Environment/x86_64-elf-tools-windows/bin/x86_64-elf-gcc.exe $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E E:/OS/x86os/start/start/source/loader/start.S > CMakeFiles/loader.dir/start.S.i

source/loader/CMakeFiles/loader.dir/start.S.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling ASM source to assembly CMakeFiles/loader.dir/start.S.s"
	cd E:/OS/x86os/start/start/build/source/loader && D:/Environment/x86_64-elf-tools-windows/bin/x86_64-elf-gcc.exe $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S E:/OS/x86os/start/start/source/loader/start.S -o CMakeFiles/loader.dir/start.S.s

source/loader/CMakeFiles/loader.dir/loader_16.c.obj: source/loader/CMakeFiles/loader.dir/flags.make
source/loader/CMakeFiles/loader.dir/loader_16.c.obj: source/loader/CMakeFiles/loader.dir/includes_C.rsp
source/loader/CMakeFiles/loader.dir/loader_16.c.obj: ../source/loader/loader_16.c
source/loader/CMakeFiles/loader.dir/loader_16.c.obj: source/loader/CMakeFiles/loader.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:/OS/x86os/start/start/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object source/loader/CMakeFiles/loader.dir/loader_16.c.obj"
	cd E:/OS/x86os/start/start/build/source/loader && D:/Environment/x86_64-elf-tools-windows/bin/x86_64-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT source/loader/CMakeFiles/loader.dir/loader_16.c.obj -MF CMakeFiles/loader.dir/loader_16.c.obj.d -o CMakeFiles/loader.dir/loader_16.c.obj -c E:/OS/x86os/start/start/source/loader/loader_16.c

source/loader/CMakeFiles/loader.dir/loader_16.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/loader.dir/loader_16.c.i"
	cd E:/OS/x86os/start/start/build/source/loader && D:/Environment/x86_64-elf-tools-windows/bin/x86_64-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:/OS/x86os/start/start/source/loader/loader_16.c > CMakeFiles/loader.dir/loader_16.c.i

source/loader/CMakeFiles/loader.dir/loader_16.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/loader.dir/loader_16.c.s"
	cd E:/OS/x86os/start/start/build/source/loader && D:/Environment/x86_64-elf-tools-windows/bin/x86_64-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:/OS/x86os/start/start/source/loader/loader_16.c -o CMakeFiles/loader.dir/loader_16.c.s

source/loader/CMakeFiles/loader.dir/loader_32.c.obj: source/loader/CMakeFiles/loader.dir/flags.make
source/loader/CMakeFiles/loader.dir/loader_32.c.obj: source/loader/CMakeFiles/loader.dir/includes_C.rsp
source/loader/CMakeFiles/loader.dir/loader_32.c.obj: ../source/loader/loader_32.c
source/loader/CMakeFiles/loader.dir/loader_32.c.obj: source/loader/CMakeFiles/loader.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:/OS/x86os/start/start/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object source/loader/CMakeFiles/loader.dir/loader_32.c.obj"
	cd E:/OS/x86os/start/start/build/source/loader && D:/Environment/x86_64-elf-tools-windows/bin/x86_64-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT source/loader/CMakeFiles/loader.dir/loader_32.c.obj -MF CMakeFiles/loader.dir/loader_32.c.obj.d -o CMakeFiles/loader.dir/loader_32.c.obj -c E:/OS/x86os/start/start/source/loader/loader_32.c

source/loader/CMakeFiles/loader.dir/loader_32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/loader.dir/loader_32.c.i"
	cd E:/OS/x86os/start/start/build/source/loader && D:/Environment/x86_64-elf-tools-windows/bin/x86_64-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:/OS/x86os/start/start/source/loader/loader_32.c > CMakeFiles/loader.dir/loader_32.c.i

source/loader/CMakeFiles/loader.dir/loader_32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/loader.dir/loader_32.c.s"
	cd E:/OS/x86os/start/start/build/source/loader && D:/Environment/x86_64-elf-tools-windows/bin/x86_64-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:/OS/x86os/start/start/source/loader/loader_32.c -o CMakeFiles/loader.dir/loader_32.c.s

# Object files for target loader
loader_OBJECTS = \
"CMakeFiles/loader.dir/start.S.obj" \
"CMakeFiles/loader.dir/loader_16.c.obj" \
"CMakeFiles/loader.dir/loader_32.c.obj"

# External object files for target loader
loader_EXTERNAL_OBJECTS =

source/loader/loader.exe: source/loader/CMakeFiles/loader.dir/start.S.obj
source/loader/loader.exe: source/loader/CMakeFiles/loader.dir/loader_16.c.obj
source/loader/loader.exe: source/loader/CMakeFiles/loader.dir/loader_32.c.obj
source/loader/loader.exe: source/loader/CMakeFiles/loader.dir/build.make
source/loader/loader.exe: source/loader/CMakeFiles/loader.dir/linklibs.rsp
source/loader/loader.exe: source/loader/CMakeFiles/loader.dir/objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=E:/OS/x86os/start/start/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable loader.exe"
	cd E:/OS/x86os/start/start/build/source/loader && x86_64-elf-ld @CMakeFiles/loader.dir/objects1.rsp -m elf_i386  -Ttext=0x8000 -o E:/OS/x86os/start/start/build/source/loader/loader.elf
	cd E:/OS/x86os/start/start/build/source/loader && x86_64-elf-objcopy -O binary loader.elf E:/OS/x86os/start/start/../../image/loader.bin
	cd E:/OS/x86os/start/start/build/source/loader && x86_64-elf-objdump -x -d -S -m i8086 E:/OS/x86os/start/start/build/source/loader/loader.elf > loader_dis.txt
	cd E:/OS/x86os/start/start/build/source/loader && x86_64-elf-readelf -a E:/OS/x86os/start/start/build/source/loader/loader.elf > loader_elf.txt

# Rule to build all files generated by this target.
source/loader/CMakeFiles/loader.dir/build: source/loader/loader.exe
.PHONY : source/loader/CMakeFiles/loader.dir/build

source/loader/CMakeFiles/loader.dir/clean:
	cd E:/OS/x86os/start/start/build/source/loader && $(CMAKE_COMMAND) -P CMakeFiles/loader.dir/cmake_clean.cmake
.PHONY : source/loader/CMakeFiles/loader.dir/clean

source/loader/CMakeFiles/loader.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" E:/OS/x86os/start/start E:/OS/x86os/start/start/source/loader E:/OS/x86os/start/start/build E:/OS/x86os/start/start/build/source/loader E:/OS/x86os/start/start/build/source/loader/CMakeFiles/loader.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : source/loader/CMakeFiles/loader.dir/depend

