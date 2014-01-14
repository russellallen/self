# Sun-$Revision: 10.2 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.
 
# Make file for the foreign function (server) demo.
# An example application using dynamic linking.

ROOT         = ../../..
FILES        = Makefile
SELF_MODULES = server
C_MODULES    = socks toself
include        ${ROOT}/vm/templates/svr4.make
include        ${ROOT}/vm/templates/optimized.make
include        ${ROOT}/templates/sources.make

OBJECT_FILES = socks.so toself

NAME       = socks
INCLUDES  += -I${ROOT}/glueDefs

# Builds the dynamic library socks.so from socks.o using the default linker ld.
# Static constructors in the dynamic library is NOT working

toself: toself.o
	@echo Linking toself
	@gcc -o toself toself.o $(EXTRA_LIBS)

ifeq (${OS_VARIANT},SOLARIS)
  EXTRA_LIBS = -lsocket -lnsl
endif

