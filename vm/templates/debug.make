# Sun-$Revision: 30.10 $
 
# Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

# Makefile template for compiling directories for debugging

SYSDEFS = -DGENERATE_DEBUGGING_AIDS=1 \
	  -DSPEND_TIME_FOR_DEBUGGING_BY_DEFAULT=1 \
	  -DTARGET_IS_PROFILED=0 \
	  -DTARGET_IS_OPTIMIZED=0

ifeq (${COMPILER}, GCC_COMPILER)
  CFLAGS = -g -fkeep-inline-functions
else
  CFLAGS = -g
endif

CFLAGSnog = $(CFLAGS)

FILELISTTYPE = debug

include        ${ROOT}/vm/templates/compile.make
include        ${ROOT}/vm/templates/link.make
