#!/bin/env cmake

# Prologue
 cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

project(SelfDistribution)

set(SELF_MACOSX_XCODEPROJECTNAME SelfDistribution)
add_subdirectory(vm)
add_subdirectory(vm64)
add_subdirectory(tools)
