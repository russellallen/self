#!/usr/bin/env cmake


set(SELF_PREFIX_PREFIX_THRESHOLD_INIT
  "35" # DO NOT SET BELOW 35. Breaks X-includes!
)

set(SELF_X11_INIT ON)


enable_language(C)

# Threads
# find_package(Threads REQUIRED)
# set(EXTRA_LIBRARIES ${EXTRA_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})


#
# FreeBSD compile definitons
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

if(TARGET_ARCH MATCHES "I386_ARCH")
  # FreeBSD doesn't enforce 16 byte stack alignment by default.
  # Explicitly request it here and also give main() and signal
  # handlers the "force_align_arg_pointer" attribute.
  if (gcc)
    list(APPEND _flags -mpreferred-stack-boundary=4)
    list(APPEND CMAKE_REQUIRED_DEFINITIONS -mpreferred-stack-boundary=4)
  endif()
  if (clang)
    list(APPEND _flags -mstack-alignment=16)
    list(APPEND CMAKE_REQUIRED_DEFINITIONS -mstack-alignment=16)
  endif()
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
