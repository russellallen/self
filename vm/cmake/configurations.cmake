#!/usr/bin/env cmake

set(_is_profiled 0)
set(_is_optimized 0)
set(_is_debug 0)

#
# include profiling for profiler-stuff
#
option(PROFILE "Select whether to do a profiled build" OFF)
if(PROFILE)
  set(_is_profiled 1)
endif(PROFILE)


option(FAST_FLOATS "Select whether to do a build with fast floats" OFF)



if(CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE)
  #
  # Default build type to release if supported
  #
  if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build, options are: None(CMAKE_CXX_FLAGS or CMAKE_C_FLAGS used) Debug Release RelWithDebInfo MinSizeRel." FORCE)
  endif(NOT CMAKE_BUILD_TYPE)
  
  #
  # include optimizations for releases
  if(CMAKE_BUILD_TYPE MATCHES "Rel")
    set(_is_optimized 1)
  endif(CMAKE_BUILD_TYPE MATCHES "Rel")
  
  #
  # include debug symbols for debug builds
  if(CMAKE_BUILD_TYPE MATCHES "Deb")
    set(_is_debug 1)
  endif(CMAKE_BUILD_TYPE MATCHES "Deb")

  ##
  # Release definitions
  get_property(_defs TARGET ${PROJECT_NAME} PROPERTY COMPILE_DEFINITIONS_RELEASE)
  if(FAST_FLOATS)
    list(APPEND _defs "FAST_FLOATS")
  endif(FAST_FLOATS)
  list(APPEND _defs 
    "GENERATE_DEBUGGING_AIDS=0"
    "SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT=0"
    "TARGET_IS_OPTIMIZED=1"
    "TARGET_IS_PROFILED=${_is_profiled}"
    "TARGET_IS_FOR_DEBUGGING=0")
  set_property(TARGET ${PROJECT_NAME} PROPERTY COMPILE_DEFINITIONS_RELEASE ${_defs})
  
  ##
  # Release definitions, size optimized
  get_property(_defs TARGET ${PROJECT_NAME} PROPERTY COMPILE_DEFINITIONS_MINSIZEREL)
  if(FAST_FLOATS)
    list(APPEND _defs "FAST_FLOATS")
  endif(FAST_FLOATS)
  list(APPEND _defs 
    "GENERATE_DEBUGGING_AIDS=0"
    "SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT=0"
    "TARGET_IS_OPTIMIZED=1"
    "TARGET_IS_PROFILED=${_is_profiled}"
    "TARGET_IS_FOR_DEBUGGING=0")
  set_property(TARGET ${PROJECT_NAME} PROPERTY COMPILE_DEFINITIONS_MINSIZEREL ${_defs})
    
  ##
  # Debug definitions
  get_property(_defs TARGET ${PROJECT_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG)
  if(FAST_FLOATS)
    list(APPEND _defs "FAST_FLOATS")
  endif(FAST_FLOATS)
  list(APPEND _defs 
    "GENERATE_DEBUGGING_AIDS=1"
    "SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT=1"
    "TARGET_IS_OPTIMIZED=0"
    "TARGET_IS_PROFILED=${_is_profiled}"
    "TARGET_IS_FOR_DEBUGGING=1"
    "GENERATE_ASSERTIONS=")
  set_property(TARGET ${PROJECT_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG ${_defs})
  
  ##
  # Release definitions, with debug infos
  get_property(_defs TARGET ${PROJECT_NAME} PROPERTY COMPILE_DEFINITIONS_RELWITHDEBINFO)
  if(FAST_FLOATS)
    list(APPEND _defs "FAST_FLOATS")
  endif(FAST_FLOATS)
  list(APPEND _defs 
    "GENERATE_DEBUGGING_AIDS=1"
    "SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT=1"
    "TARGET_IS_OPTIMIZED=1"
    "TARGET_IS_PROFILED=${_is_profiled}"
    "TARGET_IS_FOR_DEBUGGING=1"
    "GENERATE_ASSERTIONS=")
  set_property(TARGET ${PROJECT_NAME} PROPERTY COMPILE_DEFINITIONS_RELWITHDEBINFO ${_defs})



else(CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE)

  # we are under a makefile-like config.
  # let the user decide
  set(BUILD_LEVEL "optimized" CACHE STRING "Select the build level for ${PRODUCT_NAME} from 'optimized', 'debug'" FORCE)
  if(BUILD_LEVEL STREQUAL "debug")
    set(_is_debug 1)
  else(BUILD_LEVEL STREQUAL "debug")
    set(_is_optimized 1)
  endif(BUILD_LEVEL STREQUAL "debug")


  add_definitions(-DGENERATE_DEBUGGING_AIDS=${_is_debug})
  add_definitions(-DSPEND_TIME_FOR_DEBUGGING_BY_DEFAULT=${_is_debug})
  add_definitions(-DTARGET_IS_OPTIMIZED=${_is_optimized})
  add_definitions(-DTARGET_IS_PROFILED=${_is_profiled})
  add_definitions(-DTARGET_IS_FOR_DEBUGGING=${_is_debug})
  
  if(FAST_FLOATS)
    add_definitions(-DFAST_FLOATS)
  endif(FAST_FLOATS)

  if(_is_debug)
    add_definitions(-DGENERATE_ASSERTIONS)
  endif(_is_debug)
  

endif(CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE)


