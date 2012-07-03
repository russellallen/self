#!/usr/bin/env cmake

# TODO: these are frome the project file, reconsider
set(DYNAMIC           "-DDYNLINK_SUPPORTED")
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

set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -m32")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -m32)
#set(CMAKE_EXE_LINKER_FLAGS ${CMAKE_LD_FLAGS} -m32)

if(clang)
  # 
  # clang 3.0 integrated assembler on linux
  # seems not to produce 32bit jump targets 
  # for global labels, so revert back to
  # binutils as. *sigh*
  #
  set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -no-integrated-as -DNO_INTEGRATED_AS_clang")
endif()

#
# check for ubunut 12.
# 
execute_process(COMMAND lsb_release
  RESULT_VARIABLE _lsb_release_not_here
  OUTPUT_VARIABLE _  ERROR_VARIABLE _) 
if(NOT _lsb_release_not_here)
  execute_process(COMMAND lsb_release -c -s
    RESULT_VARIABLE _lsb_release_result
    OUTPUT_VARIABLE linux_codename
    ERROR_VARIABLE _error 
    OUTPUT_STRIP_TRAILING_WHITESPACE) 
  if(_lsb_release_result) 
    message(WARNING "Failed to determine Linux version:\n${_error}") 
  endif() 
  if(linux_codename MATCHES ".*precise.*")
    #
    # pkg-config is necessary on unbuntu 12
    #
    set(NEEDS_PKGCONFIG YES)
  endif()
endif()

  
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
