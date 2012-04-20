#!/bin/env cmake

# Older versions have a different signature for CMAKE_MINIMUM_REQUIRED,
# check it manually just to make sure
if(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.4)
    message(FATAL_ERROR "${PROJECT_NAME} requires at least CMake v2.4."
        " You are running v${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}."
        " Please upgrade." )
endif(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.4)

# If we get this far, use the modern signature.  This will also cause newer
# CMake versions to try to be backwards-compatible with the desired version
cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

project(Self)

add_subdirectory(vm)
add_subdirectory(controller)