#!/usr/bin/env cmake

# TODO: these are frome the project file, reconsider
set(DYNAMIC           "-DDYNLINK_SUPPORTED -DDYNAMIC")
set(COMPILER          "GCC_COMPILER")
set(ASSEMBLER         "")
set(MANUFACTURER      "")
set(TARGET_OS_VERSION "LINUX_VERSION")
set(TARGET_OS_FAMILY  "UNIX_FAMILY")
set(TARGET_ARCH       "I386_ARCH")
set(HOST_ARCH         "I386_ARCH")


mark_as_advanced(DYNAMIC COMPILER ASSEMBLER MANUFACTURER TARGET_OS_VERSION TARGET_OS_FAMILY)

year(YEAR)

# Threads
find_package(Threads REQUIRED)
set(EXTRA_LIBRARIES ${EXTRA_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})


#
# Linux compile definitons
#
add_definitions(
  -DDEBUG
  -DGLUE_CHECKSUM=0
)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_CXX_FLAGS}")
#set(CMAKE_EXE_LINKER_FLAGS ${CMAKE_LD_FLAGS} -m32)


#
# "API". Set up target specific stuff.
#
macro(setup_target target)
  # "super"
  setup_target_common(${target}) 
  
endmacro()





# TODO: this is potenitally dangerous
set(_prefixFile "${SELF_GENERATED_INLCUDE_FILES_DIR}/_precompiled.hh")

macro(include_prefix_header target)
  get_filename_component(_fullPrefixFile ${_prefixFile} ABSOLUTE)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -include ${_fullPrefixFile} -Winvalid-pch")
endmacro()



#TBD
# elseif ("${_compilerID}" MATCHES "GNU|Clang")
#     # GCC / Clang options used
#     # -x specify the source language
#     # -c compile but do not link
#     # -o place output in file
#     set (_xLanguage_C "c-header")
#     set (_xLanguage_CXX "c++-header")
#     if (_flags)
#       # append to list
#       list (APPEND _flags "-x" "${_xLanguage_${_language}}" "-c" "${_prefixFile}" -o "${_pchFile}")
#     else()
#       # return as a flag string
#       set (_flags "-x ${_xLanguage_${_language}} -c \"${_prefixFile}\" -o \"${_pchFile}\"")
#     endif()
#   else()
