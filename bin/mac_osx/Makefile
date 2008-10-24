# Sun-$Revision: 30.10 $
 
# Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.
 
# Makefile for the mac_osx Self utilities
#

ROOT         = ../..
FILES        = Makefile
VPATH        = ../src
AOUT         = cmprev dangling isLink linked makeDeps \
               lock_run obj_patch resetTime getRevision UpdateFiles cwdRootedIn zap \
               skipComments removeUnderscore AddTrailingNewline rself runBinary 

NET_LIBS = 
#NET_LIBS = -lsocket -lnsl 
# jaguar:
CPP_LIBS = -lstdc++
FLUSH_LIBS = -framework CoreServices

default: ${AOUT}

include        ${ROOT}/vm/templates/mac_osx.make
include        ../src/MakefileBinList
include        ${ROOT}/templates/sources.make
