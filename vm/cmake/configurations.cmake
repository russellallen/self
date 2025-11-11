#!/usr/bin/env cmake

set(_is_profiled 0)
set(_is_optimized 0)
set(_is_debug 0)

if(SELF_PROFILE)
  set(_is_profiled 1)
endif()

if(CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE)
  #
  # Default build type to release if supported
  #
  if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build, options are: None(CMAKE_CXX_FLAGS or CMAKE_C_FLAGS used) Debug Release RelWithDebInfo MinSizeRel." FORCE)
  endif()

  # include optimizations for releases
  #
  if(CMAKE_BUILD_TYPE MATCHES "Rel")
    set(_is_optimized 1)
  endif()

  # include debug symbols for debug builds
  #
  if(CMAKE_BUILD_TYPE MATCHES "Deb")
    set(_is_debug 1)
  endif()

  # Build list of definitions for each config
  set(_release_defs
          "GENERATE_DEBUGGING_AIDS=0"
          "SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT=0"
          "TARGET_IS_OPTIMIZED=1"
          "TARGET_IS_PROFILED=${_is_profiled}"
          "TARGET_IS_FOR_DEBUGGING=0"
  )

  set(_debug_defs
          "GENERATE_DEBUGGING_AIDS=1"
          "SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT=1"
          "TARGET_IS_OPTIMIZED=0"
          "TARGET_IS_PROFILED=${_is_profiled}"
          "TARGET_IS_FOR_DEBUGGING=1"
          "GENERATE_ASSERTIONS="
  )

  set(_relwithdebinfo_defs
          "GENERATE_DEBUGGING_AIDS=1"
          "SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT=1"
          "TARGET_IS_OPTIMIZED=1"
          "TARGET_IS_PROFILED=${_is_profiled}"
          "TARGET_IS_FOR_DEBUGGING=1"
          "GENERATE_ASSERTIONS="
  )

  if(SELF_FAST_FLOATS)
    list(APPEND _release_defs "FAST_FLOATS")
    list(APPEND _debug_defs "FAST_FLOATS")
    list(APPEND _relwithdebinfo_defs "FAST_FLOATS")
  endif()

  # Use generator expressions properly with add_compile_definitions
  add_compile_definitions(
          "$<$<CONFIG:Release>:${_release_defs}>"
          "$<$<CONFIG:MinSizeRel>:${_release_defs}>"
          "$<$<CONFIG:Debug>:${_debug_defs}>"
          "$<$<CONFIG:RelWithDebInfo>:${_relwithdebinfo_defs}>"
  )

  add_definitions(${_flags} ${_defines})


else()

  # we are under a makefile-like config.
  # let the user decide
  set(SELF_BUILD_LEVEL "optimized"
          CACHE STRING
          "Select the build level for ${PRODUCT_NAME} from 'optimized', 'debug','optimized_with_debug'")
  if(SELF_BUILD_LEVEL MATCHES "debug")
    set(_is_debug 1)
  endif()

  if(SELF_BUILD_LEVEL MATCHES "optimized")
    set(_is_optimized 1)
  endif()

  if(SELF_FAST_FLOATS)
    list(APPEND _defines -DFAST_FLOATS)
  endif()

  if(_is_debug)
    list(APPEND _defines -DGENERATE_ASSERTIONS)
  endif()


  list(APPEND _defines
          -DGENERATE_DEBUGGING_AIDS=${_is_debug}
          -DSPEND_TIME_FOR_DEBUGGING_BY_DEFAULT=${_is_debug}
          -DTARGET_IS_OPTIMIZED=${_is_optimized}
          -DTARGET_IS_PROFILED=${_is_profiled}
          -DTARGET_IS_FOR_DEBUGGING=${_is_debug}
  )

  foreach(_flag ${_flags})
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${_flag}")
  endforeach()
  add_definitions(${_defines})

endif()

if(CMAKE_BUILD_TYPE)
  message(STATUS "Configuring for default ${CMAKE_BUILD_TYPE}")
else()
  message(STATUS "Configuring for build level ${SELF_BUILD_LEVEL}")
endif()