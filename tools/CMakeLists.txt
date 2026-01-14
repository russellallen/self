#!/usr/bin/env cmake
set(PROJECT_NAME SelfTools)

# This is for a cmake compatibility check
cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

project(${PROJECT_NAME} C CXX)


if(APPLE)
  if(NOT CONFIG_HAS_BEEN_RUN_BEFORE)
    set(CMAKE_OSX_ARCHITECTURES i386 CACHE STRING "Build architectures for OSX" FORCE)
  endif()
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")


#
# Copy all shellscripts in shell/
#
file(GLOB scripts shell/*)
set(dest_scripts)
foreach(script ${scripts})
  get_filename_component(script_name ${script} NAME)
  set(dest ${CMAKE_CURRENT_BINARY_DIR}/${script_name})
  add_custom_command(
    OUTPUT ${dest}
    COMMAND ${CMAKE_COMMAND} -E copy "${script}" "${dest}" 
    DEPENDS ${script} 
  ) 
 list(APPEND dest_scripts ${dest}) 
endforeach()
add_custom_target(shellscripts ALL DEPENDS ${dest_scripts}) 

add_executable(AddTrailingNewline src/AddTrailingNewline.cpp)
add_executable(cmprev             src/cmprev.c)
add_executable(dangling           src/dangling.c)
add_executable(isLink             src/isLink.cpp)
add_executable(linked             src/linked.c)
add_executable(rself              src/rself.cpp)
if(CMAKE_SYSTEM_NAME MATCHES "SunOS")
  target_link_libraries(rself socket nsl)
endif()
add_executable(runBinary          src/runBinary.cpp)
add_executable(zap                src/zap.cpp)
foreach(target 
  AddTrailingNewline cmprev dangling isLink linked rself runBinary zap
  shellscripts)
  set_target_properties(${target} PROPERTIES FOLDER "Tools")
endforeach()


# Rerun-detection
if(NOT CONFIG_HAS_BEEN_RUN_BEFORE)
  set(CONFIG_HAS_BEEN_RUN_BEFORE 1 CACHE INTERNAL "Has CMake been run before")
endif(NOT CONFIG_HAS_BEEN_RUN_BEFORE)

