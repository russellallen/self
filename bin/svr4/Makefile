# Sun-$Revision: 30.8 $
 
# Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.
 
# Makefile for the svr4 Self utilities
#

ROOT         = ../..
FILES        = Makefile
VPATH        = ../src
AOUT         = cmprev dangling isLink linked makeDeps \
               lock_run obj_patch resetTime getRevision UpdateFiles cwdRootedIn zap \
               skipComments removeUnderscore AddTrailingNewline rself

NET_LIBS = -lsocket -lnsl 

default: ${AOUT}


include        ${ROOT}/vm/templates/svr4.make
include        ../src/MakefileBinList
include        ${ROOT}/templates/sources.make
