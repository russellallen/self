# Sun-$Revision: 22.3 $
 
# Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

ROOT         = ../../..
FILES        = Makefile
CLEAN_EXPR   = *.c *.h *.s

default:
	@echo Create source links
	@echo ${SRC_DIRS}
	@echo ${SRC_PATH}
	@createSourceLinks ${SRC_PATH}

include        ${ROOT}/templates/sources.make
include        ${ROOT}/vm/templates/svr4.make
