# Sun-$Revision: 30.5 $
 
# Copyright 1992-2001 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.
 
# Makefile for the Self documentation

ROOT         = ..
FILES        = Makefile	\
	       stackFormat \
	       Makefile \
	       vmUseDoc.tex \
	       vmUseDoc.txt
OBJECT_FILES = vmUseDoc.dvi vmUseDoc.ps vm-debugging.doc

default: ${OBJECT_FILES}

#run latex twice to get cross refs processed
%.dvi: %.tex
	@echo Latex\'ing $<
	@latex $< > /dev/null
	@latex $< > /dev/null

%.ps: %.dvi
	@echo Creating $@
	@dvitps -q -C $< > $@

include        ${ROOT}/templates/sources.make
