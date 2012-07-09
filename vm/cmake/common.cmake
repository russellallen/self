#!/usr/bin/env cmake

# cmake-custom directory
get_filename_component(LOCAL_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH) 

set(SRC)
set(SRC_src)
set(_flags)
set(_defines)

set(SELF_BUILD_SUPPORT_DIR 
  "${CMAKE_SOURCE_DIR}/build_support" 
  CACHE PATH
  "Path where to find build support files, like for vmDate, Mac OSX etc."
)
option(SELF_PROFILE     "Select whether to do a profiled build"         OFF)
option(SELF_COVERAGE    "Select whether to do a coverage build"         OFF)
option(SELF_FAST_FLOATS "Select whether to do a build with fast floats" OFF)

set(
  SELF_GLUE_DIRECTORY 
  "${CMAKE_CURRENT_SOURCE_DIR}/../objects/glue" 
  CACHE PATH 
  "The directory where to find the glue files emitted by the primitiveMaker"
)

set_property(GLOBAL PROPERTY USE_FOLDERS On)


include(platform)
include(policies)
include(functions)
include(assemblerSupport)
# setup configuration-specific (release/debug) stuff
include(configurations)

# TODO: the incls still need to be built manually.
# get around this soon!
set(
  SELF_GENERATED_INLCUDE_FILES_DIR 
  "${CMAKE_CURRENT_SOURCE_DIR}/${platform}/generated/incls" 
  CACHE PATH
  "Path to the generated include files (preliminary)"
)

include_directories(${SELF_GENERATED_INLCUDE_FILES_DIR})


set(
  SELF_PREFIX_HEADER 
  ${SELF_GENERATED_INLCUDE_FILES_DIR}/_precompiled.hh
  CACHE PATH 
  "The directory where to find the glue files emitted by the primitiveMaker"
)

mark_as_advanced(SELF_BUILD_SUPPORT_DIR SELF_PREFIX_HEADER SELF_GLUE_DIRECTORY)

set(EXTRA_LIBRARIES)

#
# To be run at the very end of the main Listfile
#
macro(configure_end)
    if(NOT CONFIG_HAS_BEEN_RUN_BEFORE)
        set(CONFIG_HAS_BEEN_RUN_BEFORE 1 CACHE INTERNAL 
        "Flag to track whether this is the first time running CMake or if CMake has been configured before")
    endif(NOT CONFIG_HAS_BEEN_RUN_BEFORE)
endmacro(configure_end)

macro(setup_target_common target)
  add_definitions(${_defines} ${_flags})
  set_target_properties(${target} PROPERTIES LINKER_LANGUAGE CXX)
  # we _know_ we have to deal with assembler.
  setup_target_assembler_support(${target})
endmacro()

macro(include_prefix_header_common target file)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -include ${file} -Winvalid-pch")
endmacro()

# read the version info
parse_version_information(${CMAKE_SOURCE_DIR}/src/any/memory/universe.cpp SELF_VERSION_MAJOR SELF_VERSION_MINOR SELF_VERSION_SNAPSHOT)
determine_build_information(SELF_BUILD)
set(SELF_VERSION_MAJOR    ${SELF_VERSION_MAJOR}    CACHE STRING "Self VM major version"    FORCE)
set(SELF_VERSION_MINOR    ${SELF_VERSION_MINOR}    CACHE STRING "Self VM minor version"    FORCE)
set(SELF_VERSION_SNAPSHOT ${SELF_VERSION_SNAPSHOT} CACHE STRING "Self VM snapshot version" FORCE)
set(SELF_BUILD            ${SELF_BUILD}            CACHE STRING "Self VM build number"     FORCE)
message(STATUS "Preparing Self VM ${SELF_VERSION_MAJOR}.${SELF_VERSION_MINOR}.${SELF_VERSION_SNAPSHOT} (build ${SELF_BUILD})")
