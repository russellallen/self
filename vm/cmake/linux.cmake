#!/usr/bin/env cmake

set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS OFF)


set(SELF_PREFIX_PREFIX_THRESHOLD_INIT
  "35" # DO NOT SET BELOW 35. Breaks X-includes!
)

set(SELF_X11_INIT ON)


# Threads
enable_language(C)
find_package(Threads REQUIRED)
set(EXTRA_LIBRARIES ${EXTRA_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})


#
# Linux compile definitons
#
list(APPEND _defines
  -DDEBUG
  -DGLUE_CHECKSUM=0
)

set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -m32")
list(APPEND _flags -m32)
list(APPEND CMAKE_REQUIRED_DEFINITIONS -m32)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -m32")

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
# "API". Set up target specific stuff.
#
macro(setup_target target)
  # "super"
  setup_target_common(${target}) 
endmacro()


#
# "API". Setup prefix headers
#
macro(include_prefix_header target file)  
  # "super"
  include_prefix_header_common(${target} ${file})
endmacro()

