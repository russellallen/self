# Sun-$Revision: 30.3 $
 
# Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.
 
# Makefile for the Self svr4 optimized object directory

ROOT         = ../../..
FILES        = Makefile
AOUT         = Self
UPDATE_EXCL  = ${AOUT}

include        ${ROOT}/vm/templates/svr4.make
include        ${ROOT}/vm/templates/optimized.make
include        ${ROOT}/templates/sources.make
include        ../generated/Dependencies
include        ${ROOT}/vm/templates/svr4_write.make

CONFIGDEFS = \
             ${DYNAMIC} -DXLIB  \
	     -DDYNLINK_SUPPORTED -DDEBUG \
             -DCOMPILER=${COMPILER} -DASSEMBLER=${ASSEMBLER} \
             -DMANUFACTURER=${MANUFACTURER}
