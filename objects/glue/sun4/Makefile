# Sun-$Revision: 30.7 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.

ROOT         = ../../..
FILES        = Makefile
VPATH        = ..:
STATIC_LIBS  = stat termcap transcendental xlib
SHARED_LIBS  = 
OBJECT_FILES = $(STATIC_LIBS:%=%_glue.o) $(SHARED_LIBS:%=%_glue.so)
ARCH	     = svr4
#DYNAMIC      = -DDYNAMIC

include        ${ROOT}/vm/templates/${ARCH}.make
include        ${ROOT}/vm/templates/optimized.make
include        ${ROOT}/templates/sources.make

#EXTRA_LIBS   = -ltermcap -lm
termcap_glue_libs        = -ltermcap
transcendental_glue_libs = -lm

stat_glue.o:    	stat.primMaker.hh
termcap_glue.o: 	termcap.primMaker.hh
transcendental_glue.o:  transcendental.primMaker.hh
xlib_glue.o:    	xlib.primMaker.hh

