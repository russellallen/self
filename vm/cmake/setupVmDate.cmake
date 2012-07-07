#!/usr/bin/env cmake
#
# out:
#	$SRC_VMDATE
#
# in:
#	$SELF_GENERATED_INLCUDE_FILES_DIR
#	$SELF_BUILD_SUPPORT_DIR
#	$LOCAL_CMAKE_DIR
#	($CMAKE_BINARY_DIR)

set(SRC_VMDATE ${SELF_GENERATED_INLCUDE_FILES_DIR}/vmDate.cpp)
set(SRC_VMDATE_IN ${SELF_BUILD_SUPPORT_DIR}/vmDate.cpp.in)
configure_file(
  "${LOCAL_CMAKE_DIR}/configureVmDate.cmake.in"
  "${CMAKE_BINARY_DIR}/configureVmDate.cmake" @ONLY
) 

add_custom_target(create_vmDate
    COMMAND "${CMAKE_COMMAND}" -P "${CMAKE_BINARY_DIR}/configureVmDate.cmake" 
    DEPENDS ${SRC}
    COMMENT "Creating ${SRC_VMDATE}"
) 

set_source_files_properties(${SRC_VMDATE} 
  PROPERTIES 
  GENERATED TRUE
  OBJECT_DEPENDS "${SRC}"
)
