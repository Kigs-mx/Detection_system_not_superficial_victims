# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kigs/detection_system_not_superficial_victims/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kigs/detection_system_not_superficial_victims/catkin_ws/build

# Include any dependencies generated for this target.
include system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/depend.make

# Include the progress variables for this target.
include system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/progress.make

# Include the compile flags for this target's objects.
include system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/flags.make

system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o: system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/flags.make
system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o: /home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web/src/my_publisher.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o"
	cd /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/video_web && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o -c /home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web/src/my_publisher.cpp

system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_publisher.dir/src/my_publisher.cpp.i"
	cd /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/video_web && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web/src/my_publisher.cpp > CMakeFiles/my_publisher.dir/src/my_publisher.cpp.i

system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_publisher.dir/src/my_publisher.cpp.s"
	cd /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/video_web && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web/src/my_publisher.cpp -o CMakeFiles/my_publisher.dir/src/my_publisher.cpp.s

system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o.requires:
.PHONY : system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o.requires

system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o.provides: system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o.requires
	$(MAKE) -f system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/build.make system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o.provides.build
.PHONY : system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o.provides

system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o.provides.build: system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o

# Object files for target my_publisher
my_publisher_OBJECTS = \
"CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o"

# External object files for target my_publisher
my_publisher_EXTERNAL_OBJECTS =

/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/build.make
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /opt/ros/indigo/lib/libcv_bridge.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /opt/ros/indigo/lib/libimage_transport.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /opt/ros/indigo/lib/libmessage_filters.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /opt/ros/indigo/lib/libclass_loader.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/libPocoFoundation.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libdl.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /opt/ros/indigo/lib/libroscpp.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /opt/ros/indigo/lib/librosconsole.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/liblog4cxx.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /opt/ros/indigo/lib/libroslib.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /opt/ros/indigo/lib/librostime.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /opt/ros/indigo/lib/libcpp_common.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_viz.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_videostab.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_video.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_superres.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_stitching.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_photo.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_ocl.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_objdetect.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_nonfree.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_ml.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_legacy.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_imgproc.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_highgui.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_gpu.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_flann.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_features2d.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_core.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_contrib.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_calib3d.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_nonfree.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_ocl.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_gpu.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_photo.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_objdetect.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_legacy.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_video.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_ml.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_calib3d.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_features2d.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_highgui.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_imgproc.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_flann.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: /usr/local/lib/libopencv_core.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher: system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher"
	cd /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/video_web && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/my_publisher.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/build: /home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/video_web/my_publisher
.PHONY : system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/build

system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/requires: system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/src/my_publisher.cpp.o.requires
.PHONY : system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/requires

system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/clean:
	cd /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/video_web && $(CMAKE_COMMAND) -P CMakeFiles/my_publisher.dir/cmake_clean.cmake
.PHONY : system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/clean

system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/depend:
	cd /home/kigs/detection_system_not_superficial_victims/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kigs/detection_system_not_superficial_victims/catkin_ws/src /home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web /home/kigs/detection_system_not_superficial_victims/catkin_ws/build /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/video_web /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : system_nsv_detector/video_web/CMakeFiles/my_publisher.dir/depend

