#!/usr/bin/env cmake
#
# setup all necessary build definition variables
#

if(SELF_X11)
    message(STATUS "Using X11 plaform windows.")
    list(APPEND _defines -DXLIB)
endif()

list(APPEND _defines
  -DFAST_COMPILER
  -DSIC_COMPILER
  -DNATIVE_ARCH=${platform_processor}
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
  list(APPEND _flags -Wabi=11)
endif()
list(APPEND _flags
  -Wall
  -Wextra

  # probably ok, but needs auditing
  -Wno-delete-non-virtual-dtor

  # old use of "volatile" in lieu of attribute((noreturn))
  -Wno-ignored-qualifiers

  # TODO: just add FALLTHROUGH annotation comments
  -Wno-implicit-fallthrough

  # these are often hit or miss...
  -Wno-maybe-uninitialized

  # complains about a few cases of existing idiomatic layout
  -Wno-misleading-indentation

  # cf. -fno-delete-null-pointer-checks above
  -Wno-nonnull

  # these are a pain to fix properly...
  -Wno-sign-compare

  # this is old code from the time of less opinionated compilers
  # cf. no -fno-strict-aliasing above
  -Wno-strict-aliasing

  # vm/src/any/parser/parser.cpp uses some literal chars not in enum
  -Wno-switch

  # there are few, marked "for debugging", and they probably need to
  # be marked volatile so that those assignments are not elided and
  # the values are actually available to be inspected from the
  # debugger
  -Wno-unused-but-set-variable

  # mostly spammy for C++, needs a rainy day cleanup round
  -Wno-unused-parameter

  # needs a rainy day cleanup round
  -Wno-unused-variable
)
