# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "video_web: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ivideo_web:/home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web/msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(video_web_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web/msg/ResizedImage.msg" NAME_WE)
add_custom_target(_video_web_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "video_web" "/home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web/msg/ResizedImage.msg" "std_msgs/Header:sensor_msgs/Image"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(video_web
  "/home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web/msg/ResizedImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/video_web
)

### Generating Services

### Generating Module File
_generate_module_cpp(video_web
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/video_web
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(video_web_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(video_web_generate_messages video_web_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web/msg/ResizedImage.msg" NAME_WE)
add_dependencies(video_web_generate_messages_cpp _video_web_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(video_web_gencpp)
add_dependencies(video_web_gencpp video_web_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS video_web_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(video_web
  "/home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web/msg/ResizedImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/video_web
)

### Generating Services

### Generating Module File
_generate_module_lisp(video_web
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/video_web
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(video_web_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(video_web_generate_messages video_web_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web/msg/ResizedImage.msg" NAME_WE)
add_dependencies(video_web_generate_messages_lisp _video_web_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(video_web_genlisp)
add_dependencies(video_web_genlisp video_web_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS video_web_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(video_web
  "/home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web/msg/ResizedImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/video_web
)

### Generating Services

### Generating Module File
_generate_module_py(video_web
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/video_web
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(video_web_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(video_web_generate_messages video_web_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kigs/detection_system_not_superficial_victims/catkin_ws/src/system_nsv_detector/video_web/msg/ResizedImage.msg" NAME_WE)
add_dependencies(video_web_generate_messages_py _video_web_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(video_web_genpy)
add_dependencies(video_web_genpy video_web_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS video_web_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/video_web)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/video_web
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(video_web_generate_messages_cpp sensor_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/video_web)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/video_web
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(video_web_generate_messages_lisp sensor_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/video_web)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/video_web\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/video_web
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(video_web_generate_messages_py sensor_msgs_generate_messages_py)
