# Sun-$Revision: 1.1 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.
 
ROOT         = ../..
FILES        = Makefile
DIRECTORIES  = debug optimized profiled interpreter generated links

default:
	@cd debug;     ${MAKE}
	@cd optimized; ${MAKE}
	@cd interpreter; ${MAKE}
	@cd generated; ${MAKE}

include        ${ROOT}/templates/sources.make

