#!/bin/env cmake

# Prologue
if(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.4) # old style:
    message(FATAL_ERROR "${PROJECT_NAME} requires at least CMake v2.8, you use v${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.")
endif(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.4)
if(APPLE)
  cmake_minimum_required(VERSION 2.8.8 FATAL_ERROR) # it has to be 2.8.8 on OSX 
  set(CMAKE_TRY_COMPILE_OSX_ARCHITECTURES i386)
else()
  cmake_minimum_required(VERSION 3.12 FATAL_ERROR)
endif()

project(SelfDistribution)

set(SELF_MACOSX_XCODEPROJECTNAME SelfDistribution)
add_subdirectory(vm)
add_subdirectory(tools)
