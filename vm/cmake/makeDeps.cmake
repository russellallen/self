#!/usr/bin/env cmake

# sets ${SELF_PREFIX_HEADER}

set(makeDeps makeDeps)
set(_orig_incldb ${SELF_BUILD_SUPPORT_DIR}/includeDB.in)
set(_incl_parent_dir ${CMAKE_BINARY_DIR})
set(_incl_dest_dir ${_incl_parent_dir}/incls)
set(_incldb ${CMAKE_BINARY_DIR}/includeDB)


set(SRC_makeDeps ${SELF_BUILD_SUPPORT_DIR}/makeDeps.cpp)

add_executable(${makeDeps} ${SRC_makeDeps})
setup_target(${makeDeps})
set_target_properties(${makeDeps} PROPERTIES FOLDER "${SELF_HELPER_FOLDER}")



configure_file(${_orig_incldb} ${_incldb})

set(
  SELF_GENERATED_INLCUDE_FILES_DIR 
  "${_incl_dest_dir}"
  CACHE PATH
  "Path to the generated include files"
)


set(
  SELF_PREFIX_HEADER 
  ${SELF_GENERATED_INLCUDE_FILES_DIR}/_precompiled.hh
  CACHE PATH 
  "The directory where to find the glue files emitted by the primitiveMaker"
)
include_directories(${SELF_GENERATED_INLCUDE_FILES_DIR})


#
# to be compatible with old process:
#
#
set(SELF_PREFIX_PREFIX_THRESHOLD 
  ${SELF_PREFIX_PREFIX_THRESHOLD_INIT} # DO NOT SET ABVOE 20. Breaks X-includes!
  CACHE STRING
  "The minimum number of times for an include file to occur bein included to be included in the prefix header"
)


mark_as_advanced(SELF_GENERATED_INLCUDE_FILES_DIR SELF_PREFIX_HEADER SELF_PREFIX_PREFIX_THRESHOLD)


set(_incl_threshold -${SELF_PREFIX_PREFIX_THRESHOLD})

#
# HACK: for now, we only use the Prefix header as output,
# we have yet no way to know which headers are all produced.
#
add_custom_command(
  OUTPUT ${SELF_PREFIX_HEADER}
  COMMAND mkdir -p ${_incl_dest_dir}
  COMMAND ${makeDeps} ${_incl_threshold} ${_incldb}
  WORKING_DIRECTORY ${_incl_parent_dir}
)