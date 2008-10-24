# Sun-$Revision: 1.1 $
 
# Copyright 2007 David Ungar
# See the LICENSE file for license information.
 
# Makefile for the linux Self utilities
#

ROOT         = ../..
FILES        = Makefile
VPATH        = ../src
AOUT         = cmprev dangling isLink linked makeDeps \
               lock_run obj_patch resetTime getRevision UpdateFiles cwdRootedIn zap \
               skipComments removeUnderscore AddTrailingNewline rself

NET_LIBS = -lnsl 
# -lsocket ?

CPP_LIBS = -lstdc++



default: ${AOUT}


include        ${ROOT}/vm/templates/linux.make
FLAGS += ${INCLUDES}
include        ../src/MakefileBinList
include        ${ROOT}/templates/sources.make
