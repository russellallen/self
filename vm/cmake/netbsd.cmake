#!/usr/bin/env cmake


set(SELF_PREFIX_PREFIX_THRESHOLD_INIT
  "35" # DO NOT SET BELOW 35. Breaks X-includes!
)

set(SELF_X11_INIT ON)


enable_language(C)

# Threads
# Nothing in Self VM uses pthreads, so don't drag them in as they come
# with locking overhead and expose bugs in gdb's NetBSD support.  They
# might be required if any of the foreign libraries use them though -
# in that case adjust InterruptedContext::forwarded_to_self_thread in
# vm/src/unix/runtime/interruptedCtx_unix.cpp and uncomment the lines
# below.
# find_package(Threads REQUIRED)
# set(EXTRA_LIBRARIES ${EXTRA_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})


#
# NetBSD compile definitons
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
  # NetBSD doesn't enforce 16 byte stack alignment by default.
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

# true_size_of_malloced_obj() needs to peek at malloc internals.
# NB: only available since NetBSD 9
list(APPEND EXTRA_LIBRARIES jemalloc)

# if(clang)
#   #
#   # clang 3.0 integrated assembler on linux
#   # seems not to produce 32bit jump targets
#   # for global labels, so revert back to
#   # binutils as. *sigh*
#   #
#   set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -no-integrated-as -DNO_INTEGRATED_AS_clang")
# endif()

#
# "API". Set up target specific stuff.
#
macro(setup_target target)
  # "super"
  setup_target_common(${target})

  add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND paxctl +m "$<TARGET_FILE:${PROJECT_NAME}>"
    VERBATIM)
endmacro()


#
# "API". Setup prefix headers
#
macro(include_prefix_header target file)
  # "super"
  include_prefix_header_common(${target} ${file})
endmacro()
