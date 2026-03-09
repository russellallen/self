#!/bin/env cmake

# Prologue
 cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

project(SelfDistribution)

set(SELF_MACOSX_XCODEPROJECTNAME SelfDistribution)
option(BUILD_64BIT "Build 64-bit VM (vm64) instead of 32-bit VM (vm)" OFF)

if(BUILD_64BIT)
  add_subdirectory(vm64)
else()
  add_subdirectory(vm)
endif()
add_subdirectory(tools)
