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
include system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/depend.make

# Include the progress variables for this target.
include system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/progress.make

# Include the compile flags for this target's objects.
include system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/flags.make

system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o: system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/flags.make
system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o: /home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/flir_gige/src/calib_proc/calib_proc_main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o"
	cd /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/flir_gige && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o -c /home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/flir_gige/src/calib_proc/calib_proc_main.cpp

system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.i"
	cd /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/flir_gige && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/flir_gige/src/calib_proc/calib_proc_main.cpp > CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.i

system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.s"
	cd /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/flir_gige && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/flir_gige/src/calib_proc/calib_proc_main.cpp -o CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.s

system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o.requires:
.PHONY : system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o.requires

system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o.provides: system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o.requires
	$(MAKE) -f system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/build.make system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o.provides.build
.PHONY : system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o.provides

system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o.provides.build: system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o

# Object files for target calib_proc_node
calib_proc_node_OBJECTS = \
"CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o"

# External object files for target calib_proc_node
calib_proc_node_EXTERNAL_OBJECTS =

/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/build.make
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/libflir_gige.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/libnodeletlib.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/libbondcpp.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libuuid.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/libcamera_info_manager.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/libdynamic_reconfigure_config_init_mutex.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/libimage_transport.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/libmessage_filters.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/libclass_loader.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/libPocoFoundation.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libdl.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/libroslib.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/libroscpp.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/libcv_bridge.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/librosconsole.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/liblog4cxx.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/librostime.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/ros/indigo/lib/libcpp_common.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_viz.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_videostab.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_superres.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_stitching.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_contrib.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_nonfree.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_ocl.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_gpu.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_photo.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_objdetect.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_legacy.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_video.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_ml.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_calib3d.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_features2d.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_highgui.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_imgproc.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_flann.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /usr/local/lib/libopencv_core.so.2.4.9
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/pleora/ebus_sdk/Ubuntu-14.04-x86_64/lib/libPvSerial.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/pleora/ebus_sdk/Ubuntu-14.04-x86_64/lib/libPvPersistence.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/pleora/ebus_sdk/Ubuntu-14.04-x86_64/lib/libPvStream.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/pleora/ebus_sdk/Ubuntu-14.04-x86_64/lib/libPvVirtualDevice.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/pleora/ebus_sdk/Ubuntu-14.04-x86_64/lib/libPvDevice.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/pleora/ebus_sdk/Ubuntu-14.04-x86_64/lib/libPvBuffer.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/pleora/ebus_sdk/Ubuntu-14.04-x86_64/lib/libPvAppUtils.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/pleora/ebus_sdk/Ubuntu-14.04-x86_64/lib/libPvBase.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/pleora/ebus_sdk/Ubuntu-14.04-x86_64/lib/libPvGenICam.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/pleora/ebus_sdk/Ubuntu-14.04-x86_64/lib/libPvTransmitter.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: /opt/pleora/ebus_sdk/Ubuntu-14.04-x86_64/lib/libPvGUI.so
/home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node: system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node"
	cd /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/flir_gige && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/calib_proc_node.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/build: /home/kigs/detection_system_not_superficial_victims/catkin_ws/devel/lib/flir_gige/calib_proc_node
.PHONY : system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/build

system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/requires: system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/src/calib_proc/calib_proc_main.cpp.o.requires
.PHONY : system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/requires

system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/clean:
	cd /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/flir_gige && $(CMAKE_COMMAND) -P CMakeFiles/calib_proc_node.dir/cmake_clean.cmake
.PHONY : system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/clean

system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/depend:
	cd /home/kigs/detection_system_not_superficial_victims/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kigs/detection_system_not_superficial_victims/catkin_ws/src /home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/flir_gige /home/kigs/detection_system_not_superficial_victims/catkin_ws/build /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/flir_gige /home/kigs/detection_system_not_superficial_victims/catkin_ws/build/system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : system_nsv_detector/flir_gige/CMakeFiles/calib_proc_node.dir/depend

