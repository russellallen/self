# Sun-$Revision: 1.1 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.

ROOT         = ../../..
FILES        = Makefile
VPATH        = ..:
STATIC_LIBS  = stat termcap transcendental xlib
#SHARED_LIBS  = xgl 
OBJECT_FILES = $(STATIC_LIBS:%=%_glue.o) $(SHARED_LIBS:%=%_glue.so)
ARCH	     = linux
#XGLHOME      = /opt/SUNWits/Graphics-sw/xgl-3.0
#DYNAMIC      = -DDYNAMIC

include        ${ROOT}/vm/templates/${ARCH}.make
include        ${ROOT}/vm/templates/optimized.make
include        ${ROOT}/templates/sources.make

#EXTRA_LIBS   = 
#INCLUDES    += -I${XGLHOME}/include
#GLUE_LD_FLAGS += 

#xgl_glue_libs            = -L${XGLHOME}/lib -lxgl
termcap_glue_libs        = -L/usr/ucblib -ltermcap -lucb
transcendental_glue_libs = -lm

stat_glue.o:    	stat.primMaker.hh
termcap_glue.o: 	termcap.primMaker.hh
transcendental_glue.o:  transcendental.primMaker.hh
#xgl_glue.o:       	xgl.primMaker.hh
xlib_glue.o:    	xlib.primMaker.hh
