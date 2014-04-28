# Sun-$Revision: 9.1 $

# Copyright 1993:
#   The Cecil Group
#   University of Washington

# Makefile for the Cecil source code

default:
	@echo 'no default target'

ROOTDIR	= ../../..

RCS_FILES    = Makefile

RCS_SUFFIXES = .cecil
RCS_NAMES    = \
	array \
	boolean \
	character \
	closure \
	collection \
	comparable \
	float \
	general \
	indexed \
	integer \
	list \
	number \
	predefined \
	sequence \
	sorted \
	stack \
	string \
	system \
	table \
	ui \
	unordered


FTP_VM_FILES    = ${RCS_FILES}
FTP_VM_SUFFIXES = ${RCS_SUFFIXES}
FTP_VM_NAMES    = ${RCS_NAMES}

include ${ROOTDIR}/MakefileSrcTemplate
include ${ROOTDIR}/MakefileFTPTemplate
include ${ROOTDIR}/MakefilePublishTemplate
