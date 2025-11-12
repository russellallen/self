set(_is_profiled 0)
set(_is_optimized 0)
set(_is_debug 0)

if(SELF_PROFILE)
  set(_is_profiled 1)
endif()

# Default build type for single-config generators
if(NOT CMAKE_CONFIGURATION_TYPES AND NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING
          "Choose the type of build: Debug Release RelWithDebInfo MinSizeRel" FORCE)
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

# Add compile definitions we have just created
add_compile_definitions(
        "$<$<CONFIG:Release>:${_release_defs}>"
        "$<$<CONFIG:MinSizeRel>:${_release_defs}>"
        "$<$<CONFIG:Debug>:${_debug_defs}>"
        "$<$<CONFIG:RelWithDebInfo>:${_relwithdebinfo_defs}>"
)

# Add definitions and flags created elsewhere
add_compile_definitions(${_defines})
add_compile_options(${_flags})

#
# We load the definitions into _define so they can be used in functions.cmake add_pch_rule
#

# Select definitions based on current build type
if(CMAKE_BUILD_TYPE MATCHES "^(Release)$")
  set(_current_defs ${_release_defs})
elseif(CMAKE_BUILD_TYPE STREQUAL "MinSizeRel")
  set(_current_defs ${_release_defs})
elseif(CMAKE_BUILD_TYPE STREQUAL "Debug")
  set(_current_defs ${_debug_defs})
elseif(CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
  set(_current_defs ${_relwithdebinfo_defs})
else()
  message(WARNING "Unknown build type: ${CMAKE_BUILD_TYPE}")
endif()

# Add -D prefix
foreach(_def ${_current_defs})
  list(APPEND _defines "-D${_def}")
endforeach()

message(STATUS "_flags = ${_flags}")
message(STATUS "_defines = ${_defines}")

#
#  Finish
#

message(STATUS "Configuring for default ${CMAKE_BUILD_TYPE}")