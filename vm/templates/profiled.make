# Sun-$Revision: 30.8 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.

# Makefile template for compiling directories with profiling

SYSDEFS = \
	  -DGENERATE_DEBUGGING_AIDS=0 \
          -DSPEND_TIME_FOR_DEBUGGING_BY_DEFAULT=0 \
	  -DTARGET_IS_PROFILED=1 \
	  -DTARGET_IS_OPTIMIZED=0

CFLAGSnog = -pg ${GNUOPTFLAGS}

FILELISTTYPE = profiling

include        ${ROOT}/vm/templates/compile.make
include        ${ROOT}/vm/templates/link.make
ifeq (${COMPILER},GCC_COMPILER)
  CFLAGS	  = ${CFLAGSnog} -g
else
  CFLAGS	  = ${CFLAGSnog} -g0
endif
ifeq (${TARGET_OS_VERSION},SOLARIS_VERSION)
  LDFLAGS += -pg ${LIBDIRS} # -L/usr/openwin/lib/libp -L/usr/lib/libp 
   # Sun libs refce _mcount which isn't in the gcc lib
else
  DYNLINKLIBS =	# no dynamic linking with profiled/statically-linked version
  UNDEFS = -UDYNLINK_SUPPORTED
  MATHLIBS = -lm_p
  LDFLAGS += -pg -Xlinker -N ${LIBDIRS}  # -N implies -Bstatic
  # The -Bstatic is necessary because of a bug in SUNOS
  #     (see email from hgs, 9/18/91).
endif


