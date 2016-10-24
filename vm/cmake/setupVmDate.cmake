#!/usr/bin/env cmake
#
# out:
#    $SRC_VMDATE
#
# in:
#   $SELF_BUILD_SUPPORT_DIR
#   $SELF_GENERATED_INCLUDE_FILES_DIR
#   $LOCAL_CMAKE_DIR
#   ($CMAKE_BINARY_DIR)

set(_incl_parent_dir ${CMAKE_BINARY_DIR})
set(_incl_dest_dir ${_incl_parent_dir}/incls)
set(
  SELF_GENERATED_INCLUDE_FILES_DIR 
  "${_incl_dest_dir}"
  CACHE PATH
  "Path to the generated include files"
)
set(SRC_VMDATE ${SELF_GENERATED_INCLUDE_FILES_DIR}/vmDate.cpp)
set(SRC_VMDATE_IN ${SELF_BUILD_SUPPORT_DIR}/vmDate.cpp.in)
configure_file(
  "${LOCAL_CMAKE_DIR}/configureVmDate.cmake.in"
  "${CMAKE_BINARY_DIR}/configureVmDate.cmake" @ONLY
) 

add_custom_target(create_vmDate
    COMMAND mkdir -p ${_incl_dest_dir}
    COMMAND "${CMAKE_COMMAND}" -P "${CMAKE_BINARY_DIR}/configureVmDate.cmake" 
    DEPENDS ${SRC}
    COMMENT "Creating ${SRC_VMDATE}"
) 
set_target_properties(create_vmDate PROPERTIES FOLDER "${SELF_HELPER_FOLDER}")

set_source_files_properties(${SRC_VMDATE} 
  PROPERTIES 
  GENERATED TRUE
  OBJECT_DEPENDS "${SRC}"
)
