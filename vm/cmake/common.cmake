#!/usr/bin/env cmake

# cmake-custom directory for find_package() and other config stuff
get_filename_component(LOCAL_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH) 

option(SELF_PROFILE "Select whether to do a profiled build" OFF)
option(SELF_FAST_FLOATS "Select whether to do a build with fast floats" OFF)

set(
  SELF_GLUE_DIRECTORY 
  "${CMAKE_CURRENT_SOURCE_DIR}/../objects/glue" 
  CACHE PATH 
  "The directory where to find the glue files emitted by the primitiveMaker"
)



#include(force_clang)
include(platform)
include(policies)
include(functions)
include(assemblerSupport)

set_property(GLOBAL PROPERTY USE_FOLDERS On)

# TODO: the incls still need to be built manually.
# get around this soon!
set(
  SELF_GENERATED_INLCUDE_FILES_DIR 
  "${CMAKE_CURRENT_SOURCE_DIR}/${platform}/generated/incls" 
  CACHE PATH
  "Path to the generated include files (preliminary)"
)
include_directories(${SELF_GENERATED_INLCUDE_FILES_DIR})

set(EXTRA_LIBRARIES)


macro(setup_target_common target)
  set_target_properties(${target} PROPERTIES LINKER_LANGUAGE CXX)
  # we _know_ we have to deal with assembler.
  setup_target_assembler_support(${target})
endmacro()
