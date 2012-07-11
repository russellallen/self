#!/bin/env cmake

if(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.8)
    message(FATAL_ERROR "${PROJECT_NAME} requires at least CMake v2.8.")
endif(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.8)
cmake_minimum_required(VERSION 2.8.8 FATAL_ERROR)

if(NOT APPLE)
  message(FATAL_ERROR "The Self Control application is only available on OS X")
else(NOT APPLE)
  message("
  
  Please build the Self Control.xcodeproj by using XCode.
  
  ")
endif(NOT APPLE)