#!/usr/bin/env cmake
#
# out:
#    $SRC_VMDATE
#
# in:
#   $SELF_BUILD_SUPPORT_DIR
#   $LOCAL_CMAKE_DIR
#   ($CMAKE_BINARY_DIR)

set(SRC_VMDATE ${SELF_GENERATED_INLCUDE_FILES_DIR}/vmDate.cpp)
set(SRC_VMDATE_IN ${SELF_BUILD_SUPPORT_DIR}/vmDate.cpp.in)
# The build configuration is part of the VM's build ID: the build type and
# a short hash of everything else that shapes the binary.
string(TOUPPER "${CMAKE_BUILD_TYPE}" _vmdate_build_type)
string(MD5 _vmdate_config
  "${_defines};${_flags};${CMAKE_CXX_COMPILER_ID};${CMAKE_CXX_COMPILER_VERSION};${CMAKE_CXX_FLAGS};${CMAKE_CXX_FLAGS_${_vmdate_build_type}}")
string(SUBSTRING "${_vmdate_config}" 0 8 _vmdate_config)
if(CMAKE_BUILD_TYPE)
  set(SELF_BUILD_CONFIG_ID "${CMAKE_BUILD_TYPE}.${_vmdate_config}")
else()
  set(SELF_BUILD_CONFIG_ID "${_vmdate_config}")
endif()

configure_file(
  "${LOCAL_CMAKE_DIR}/configureVmDate.cmake.in"
  "${CMAKE_BINARY_DIR}/configureVmDate.cmake" @ONLY
) 

add_custom_target(create_vmDate
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
