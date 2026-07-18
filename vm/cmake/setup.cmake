#!/usr/bin/env cmake
#
# setup all necessary build definition variables
#

if(SELF_PHKMALLOC)
  message(STATUS "Using bundled PHK malloc.")
  list(APPEND _defines USE_BUNDLED_PHKMALLOC)
endif()

if(SELF_X11)
    message(STATUS "Using X11 plaform windows.")
    list(APPEND _defines XLIB)
    if(SELF_XFT)
      message(STATUS "Using Xft fonts.")
      list(APPEND _defines USE_XFT)
    endif()
endif()

list(APPEND _defines
  FAST_COMPILER
  SIC_COMPILER
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

# Version-gated warning suppressions for gcc and clang.
#
#   VersionedFlag(GCC <min-ver> CLANG <min-ver> <flag...>)
#
macro(VersionedFlag)
  cmake_parse_arguments(VF "" "GCC;CLANG" "" ${ARGN})
  # NB: nested ifs — in a single condition an absent ${VF_GCC}/${VF_CLANG}
  # would expand to nothing and leave VERSION_GREATER_EQUAL malformed
  if (gcc AND VF_GCC)
    if (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL ${VF_GCC})
      list(APPEND _flags ${VF_UNPARSED_ARGUMENTS})
    endif()
  elseif (clang AND VF_CLANG)
    if (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL ${VF_CLANG})
      list(APPEND _flags ${VF_UNPARSED_ARGUMENTS})
    endif()
  endif()
endmacro()

VersionedFlag(GCC 4.7 CLANG 3.5 -Wno-delete-non-virtual-dtor)

# old use of "volatile" in lieu of attribute((noreturn))
VersionedFlag(GCC 4.3 CLANG 3.5 -Wno-ignored-qualifiers)

# TODO: just add FALLTHROUGH annotation comments
# (clang does not put -Wimplicit-fallthrough in -Wall, so gcc-only)
VersionedFlag(GCC 7.0 -Wno-implicit-fallthrough)

# these are often hit or miss...  (gcc-only diagnostic)
VersionedFlag(GCC 4.7 -Wno-maybe-uninitialized)

# complains about a few cases of existing idiomatic layout
VersionedFlag(GCC 6.0 CLANG 10 -Wno-misleading-indentation)

# cf. -fno-delete-null-pointer-checks above
# (it was supported in earlier gcc versions, but not for C++)
VersionedFlag(GCC 5.0 -Wno-nonnull)

# there are few, marked "for debugging", and they probably need to be
# marked volatile so that those assignments are not elided and the
# values are actually available to be inspected from the debugger
VersionedFlag(GCC 4.6 CLANG 13 -Wno-unused-but-set-variable)

VersionedFlag(CLANG 7.0 -Wno-undefined-bool-conversion)
VersionedFlag(CLANG 7.0 -Wno-tautological-undefined-compare)
