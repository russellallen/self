#!/usr/bin/env cmake
#
# setup all necessary build definition variables
#

if(SELF_X11)
    message(STATUS "Using X11 plaform windows.")
    list(APPEND _defines XLIB)
    if(SELF_XFT)
      message(STATUS "Using Xft fonts.")
      list(APPEND _defines USE_XFT)
    endif()
endif()

if(NOT TARGET_ARCH STREQUAL "X86_64_ARCH")
  list(APPEND _defines
    FAST_COMPILER
    SIC_COMPILER
  )
endif()

list(APPEND _defines
  NATIVE_ARCH=${platform_processor}
  ${DYNAMIC}
)

add_definitions_if_cmakevar(
  COMPILER
  TARGET_OS_VERSION
  TARGET_OS_FAMILY
  TARGET_ARCH
  HOST_ARCH
)


#
# setup all necessary build flags
#
list(APPEND _flags
  -fvisibility=default
  -fno-delete-null-pointer-checks	# NB: critical
  -fno-exceptions
  -fno-omit-frame-pointer		# frames are inspected (NB: critical)
  -fno-stack-protector			# frames are inspected
  -fno-strict-aliasing			# compilers used to be less opinionated
  -fno-threadsafe-statics
)

if(SELF_COVERAGE)
  list(APPEND _flags --coverage)
endif()

if(SELF_PROFILE)
  list(APPEND _flags -pg)
endif()

#
# setup all warning flags
#
if (clang)
  list(APPEND _flags -Wabi)
elseif(gcc)
  if (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 8.0)
    list(APPEND _flags -Wabi=11)
  endif()
endif()

# These warning options are accepted by the latest xcode for MacOS X
# 10.5 with gcc 4.2.  The compiler versions for the rest of them were
# picked from inspecting the gcc docs and should not be too wrong.
list(APPEND _flags
  -Wall
  -Wextra

  # these are a pain to fix properly...
  -Wno-sign-compare

  # this is old code from the time of less opinionated compilers
  # cf. no -fno-strict-aliasing above
  -Wno-strict-aliasing

  # vm/src/any/parser/parser.cpp uses some literal chars not in enum
  -Wno-switch

  # mostly spammy for C++, needs a rainy day cleanup round
  -Wno-unused-parameter

  # needs a rainy day cleanup round
  -Wno-unused-variable
)

# NB: XXX: For now this only handles gcc.  Recent clang cannot be used
# to compile Self b/c they insist on this != null.  Older clang
# versions should probably be fine, but I currently don't have
# bandwidth spelunking throgh clang docs/rtfs in search of the right
# versions.
macro(VersionedFlag FirstVersion)
  if (gcc)
    if (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL ${FirstVersion})
      list(APPEND _flags ${ARGN})
    endif()
  endif()
endmacro()

# probably ok, but needs auditing
VersionedFlag(4.7 -Wno-delete-non-virtual-dtor)

# old use of "volatile" in lieu of attribute((noreturn))
VersionedFlag(4.3 -Wno-ignored-qualifiers)

# TODO: just add FALLTHROUGH annotation comments
VersionedFlag(7.0 -Wno-implicit-fallthrough)

# these are often hit or miss...
VersionedFlag(4.7 -Wno-maybe-uninitialized)

# complains about a few cases of existing idiomatic layout
VersionedFlag(6.0 -Wno-misleading-indentation)

# cf. -fno-delete-null-pointer-checks above
# (it was supported in earlier gcc versions, but not for C++)
VersionedFlag(5.0 -Wno-nonnull)

# there are few, marked "for debugging", and they probably need to be
# marked volatile so that those assignments are not elided and the
# values are actually available to be inspected from the debugger
VersionedFlag(4.6 -Wno-unused-but-set-variable)
