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
  DEBUG
  GLUE_CHECKSUM=0
)

set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
if(TARGET_ARCH STREQUAL "I386_ARCH")
  set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -m32")
  list(APPEND _flags -m32)
  list(APPEND CMAKE_REQUIRED_DEFINITIONS -m32)
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -m32")
endif()

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

  # disable mprotect(2) restrictions using paxctl(1) but only for the Self binary
  if(${target} STREQUAL ${PROJECT_NAME})
    add_custom_command(TARGET ${target} POST_BUILD
      COMMAND paxctl +m "$<TARGET_FILE:${target}>"
      VERBATIM)
  endif()
endmacro()


#
# "API". Setup prefix headers
#
macro(include_prefix_header target file)
  # -include on the command line creates a problem: headers from the
  # _precompiled.hh are processed before the source file had a chance
  # to state its #pragma implementation, hence the kludge with the
  # INTERFACE_PRAGMAS ifdefs in the sources.  Instead makeDeps is now
  # changed to includeGIInEachIncl so that #pragma's DTRT.  The ifdefs
  # should probably be disposed of, but for now keep them and supply
  # the -D instead as a quick, small, low risk change.

  # "super"
  # include_prefix_header_common(${target} ${file})
endmacro()

list(APPEND _defines INTERFACE_PRAGMAS)
list(APPEND _flags   -Winvalid-pch)
