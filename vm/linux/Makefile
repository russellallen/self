# Sun-$Revision: 1.1 $
 
# Copyright 1994-2006 Sun Microsystems, Inc. and Stanford University.
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

