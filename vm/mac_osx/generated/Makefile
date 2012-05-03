# Sun-$Revision: 30.3 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.
 
# Makefile for the Self mac_osx generated directory

ROOT          = ../../..
FILES         = Makefile glueCheckSum glueFileList
DIRECTORIES   = incls
CLEAN_EXPR    = Tags Objs.* out.* Dependencies.cpp incls/* deps/*
INCLUDEDB     = ${ROOT}/vm/src/includeDB
PLATFORM      = ${ROOT}/vm/src/Platform_mac_osx

BINDIR = $(ROOT)/bin/mac_osx
SHELLDIR = $(ROOT)/bin/shell

default:	includeDB  Platform_mac_osx

# for SRC_DIRS
include        ${ROOT}/vm/templates/mac_osx.make


lists:
	@echo Creating include and dependency files
	@$(SHELLDIR)/makeFileLists ${SRC_DIRS}
	@rm -f includeDB Platform_mac_osx
	@$(BINDIR)/makeDeps -20 Platform_mac_osx includeDB ${PLATFORM} ${INCLUDEDB}
	@${CPP} Dependencies.cpp > Dependencies

includeDB Platform_mac_osx:	${INCLUDEDB} ${PLATFORM}
	@echo Updating include dependency database
	@$(BINDIR)/makeDeps -20 Platform_mac_osx includeDB ${PLATFORM} ${INCLUDEDB}
	@${CPP} Dependencies.cpp > Dependencies

include        ${ROOT}/templates/sources.make
