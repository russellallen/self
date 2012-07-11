#!/bin/env cmake

# This is for a cmake compatibility check
if(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.4)
    message(FATAL_ERROR "${PROJECT_NAME} requires at least CMake v2.8")
endif(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.4)
cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

project(SelfDistribution)

set(SELF_MACOSX_XCODEPROJECTNAME SelfDistribution)
add_subdirectory(vm)
add_subdirectory(tools)
