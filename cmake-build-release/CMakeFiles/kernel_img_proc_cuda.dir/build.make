# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "E:\Program Files\JetBrains\CLion 2019.2.5\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "E:\Program Files\JetBrains\CLion 2019.2.5\bin\cmake\win\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\Matteo\Dropbox\University\11\PC\kernel_img_proc_cuda

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Matteo\Dropbox\University\11\PC\kernel_img_proc_cuda\cmake-build-release

# Include any dependencies generated for this target.
include CMakeFiles\kernel_img_proc_cuda.dir\depend.make

# Include the progress variables for this target.
include CMakeFiles\kernel_img_proc_cuda.dir\progress.make

# Include the compile flags for this target's objects.
include CMakeFiles\kernel_img_proc_cuda.dir\flags.make

CMakeFiles\kernel_img_proc_cuda.dir\main.cu.obj: CMakeFiles\kernel_img_proc_cuda.dir\flags.make
CMakeFiles\kernel_img_proc_cuda.dir\main.cu.obj: ..\main.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Matteo\Dropbox\University\11\PC\kernel_img_proc_cuda\cmake-build-release\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CUDA object CMakeFiles/kernel_img_proc_cuda.dir/main.cu.obj"
	C:\PROGRA~1\NVIDIA~2\CUDA\v10.2\bin\nvcc.exe  $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -x cu -c C:\Users\Matteo\Dropbox\University\11\PC\kernel_img_proc_cuda\main.cu -o CMakeFiles\kernel_img_proc_cuda.dir\main.cu.obj -Xcompiler=-FdCMakeFiles\kernel_img_proc_cuda.dir\,-FS

CMakeFiles\kernel_img_proc_cuda.dir\main.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CUDA source to CMakeFiles/kernel_img_proc_cuda.dir/main.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles\kernel_img_proc_cuda.dir\main.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CUDA source to assembly CMakeFiles/kernel_img_proc_cuda.dir/main.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

CMakeFiles\kernel_img_proc_cuda.dir\processing.cu.obj: CMakeFiles\kernel_img_proc_cuda.dir\flags.make
CMakeFiles\kernel_img_proc_cuda.dir\processing.cu.obj: ..\processing.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Matteo\Dropbox\University\11\PC\kernel_img_proc_cuda\cmake-build-release\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CUDA object CMakeFiles/kernel_img_proc_cuda.dir/processing.cu.obj"
	C:\PROGRA~1\NVIDIA~2\CUDA\v10.2\bin\nvcc.exe  $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -x cu -c C:\Users\Matteo\Dropbox\University\11\PC\kernel_img_proc_cuda\processing.cu -o CMakeFiles\kernel_img_proc_cuda.dir\processing.cu.obj -Xcompiler=-FdCMakeFiles\kernel_img_proc_cuda.dir\,-FS

CMakeFiles\kernel_img_proc_cuda.dir\processing.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CUDA source to CMakeFiles/kernel_img_proc_cuda.dir/processing.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles\kernel_img_proc_cuda.dir\processing.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CUDA source to assembly CMakeFiles/kernel_img_proc_cuda.dir/processing.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

# Object files for target kernel_img_proc_cuda
kernel_img_proc_cuda_OBJECTS = \
"CMakeFiles\kernel_img_proc_cuda.dir\main.cu.obj" \
"CMakeFiles\kernel_img_proc_cuda.dir\processing.cu.obj"

# External object files for target kernel_img_proc_cuda
kernel_img_proc_cuda_EXTERNAL_OBJECTS =

kernel_img_proc_cuda.exe: CMakeFiles\kernel_img_proc_cuda.dir\main.cu.obj
kernel_img_proc_cuda.exe: CMakeFiles\kernel_img_proc_cuda.dir\processing.cu.obj
kernel_img_proc_cuda.exe: CMakeFiles\kernel_img_proc_cuda.dir\build.make
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Matteo\Dropbox\University\11\PC\kernel_img_proc_cuda\cmake-build-release\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CUDA executable kernel_img_proc_cuda.exe"
	"E:\Program Files\JetBrains\CLion 2019.2.5\bin\cmake\win\bin\cmake.exe" -E vs_link_exe --intdir=CMakeFiles\kernel_img_proc_cuda.dir --rc=C:\PROGRA~2\WI3CF2~1\8.1\bin\x64\rc.exe --mt=C:\PROGRA~2\WI3CF2~1\8.1\bin\x64\mt.exe --manifests  -- C:\PROGRA~2\MICROS~1.0\VC\bin\amd64\link.exe /nologo $(kernel_img_proc_cuda_OBJECTS) $(kernel_img_proc_cuda_EXTERNAL_OBJECTS) @<<
 /out:kernel_img_proc_cuda.exe /implib:kernel_img_proc_cuda.lib /pdb:C:\Users\Matteo\Dropbox\University\11\PC\kernel_img_proc_cuda\cmake-build-release\kernel_img_proc_cuda.pdb /version:0.0 /machine:x64 /INCREMENTAL:NO /subsystem:console kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib  -LIBPATH:"C:/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v10.2/lib/x64" "cudadevrt.lib" "cudart_static.lib" 
<<

# Rule to build all files generated by this target.
CMakeFiles\kernel_img_proc_cuda.dir\build: kernel_img_proc_cuda.exe

.PHONY : CMakeFiles\kernel_img_proc_cuda.dir\build

CMakeFiles\kernel_img_proc_cuda.dir\clean:
	$(CMAKE_COMMAND) -P CMakeFiles\kernel_img_proc_cuda.dir\cmake_clean.cmake
.PHONY : CMakeFiles\kernel_img_proc_cuda.dir\clean

CMakeFiles\kernel_img_proc_cuda.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" C:\Users\Matteo\Dropbox\University\11\PC\kernel_img_proc_cuda C:\Users\Matteo\Dropbox\University\11\PC\kernel_img_proc_cuda C:\Users\Matteo\Dropbox\University\11\PC\kernel_img_proc_cuda\cmake-build-release C:\Users\Matteo\Dropbox\University\11\PC\kernel_img_proc_cuda\cmake-build-release C:\Users\Matteo\Dropbox\University\11\PC\kernel_img_proc_cuda\cmake-build-release\CMakeFiles\kernel_img_proc_cuda.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles\kernel_img_proc_cuda.dir\depend
