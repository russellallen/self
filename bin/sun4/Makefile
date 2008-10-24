# Sun-$Revision: 30.7 $
 
# Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.
 
# Makefile for the sun4 Self utilities
#

ROOT         = ../..
FILES        = Makefile
VPATH        = ../src
AOUT         = cmprev dangling isLink linked makeDepsAndIncs \
               lock_run obj_patch resetTime getRevision UpdateFiles cwdRootedIn zap \
               skipComments removeUnderscore AddTrailingNewline rself

NET_LIBS = 

default: ${AOUT}

include        ${ROOT}/vm/templates/sun4.make
include        ../src/MakefileBinList
include        ${ROOT}/vm/templates/optimized.make
include        ${ROOT}/templates/sources.make
