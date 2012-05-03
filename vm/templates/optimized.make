# Sun-$Revision: 30.9 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.

# Makefile template for compiling directories with optimization

#with optimization versions
SYSDEFS = -DGENERATE_DEBUGGING_AIDS=0 \
          -DSPEND_TIME_FOR_DEBUGGING_BY_DEFAULT=0 \
	  -DTARGET_IS_PROFILED=0 \
	  -DTARGET_IS_OPTIMIZED=1

FILELISTTYPE = optimized

include        ${ROOT}/vm/templates/compile.make

ifeq (${COMPILER}, GCC_COMPILER)
  #g++ allows -g with -O -- makes it easier to locate bugs in optimized version
  CFLAGSnog = ${GNUOPTFLAGS}   # no -g for some files -- compiles much faster
  CFLAGS   = ${CFLAGSnog} -g
else
  CFLAGSnog = -O 
  CFLAGS   = ${CFLAGSnog}
endif

include        ${ROOT}/vm/templates/link.make
