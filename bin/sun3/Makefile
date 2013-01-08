# Sun-$Revision: 30.4 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.
 
# Makefile for the sun3 Self utilities
#

ROOTDIR	= ../..
SRCDIR = ../src

AOUT   = cmprev dangling isLink linked makeDepsAndIncs \
	 lock_run obj_patch resetTime getRevision UpdateFiles cwdRootedIn zap

default: ${AOUT}

RCS_FILES = Makefile

FTP_VM_FILES = ${RCS_FILES} ${AOUT}

include ${ROOTDIR}/MakefileSun3Template
include ${SRCDIR}/MakefileBinList
include ${ROOTDIR}/MakefileFTPTemplate
include ${ROOTDIR}/MakefilePublishTemplate
