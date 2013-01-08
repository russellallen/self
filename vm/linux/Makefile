# Sun-$Revision: 1.1 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.
 
ROOT         = ../..
FILES        = Makefile
DIRECTORIES  = generated debug optimized profiled interpreter links

default:
	@cd generated; ${MAKE}
	@cd debug;     ${MAKE}
	@cd optimized; ${MAKE}
	@cd interpreter; ${MAKE}


include        ${ROOT}/templates/sources.make

