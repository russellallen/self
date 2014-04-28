# Sun-$Revision: 20.2 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.

# 2012-07-11 topa: note: this is left for historical purposes.

XGLHOME?=/usr

templates: 
	markNotImplemented.perl ${XGLHOME}/include/xgl/xgl.h | 		  \
	stripComments.perl | stripIncludes.perl | stripBlankLines.perl |  \
	convertDefinesToEnums.perl | $(CPP) -D__cplusplus -Dsun -Dsparc   \
	-Dunix -D__svr4__ -D__sun__ -D__sparc__ -D__unix__ -D__svr4__     \
	-DSOLARIS -DHOST_ARCH=sun4 -DHOST_MACH=sparc -DTARGET_ARCH=sun4   \
        -DTARGET_MACH=sparc | stripBlankLines.perl | convertCtoPerl.perl |\
	printSelfTemplates.perl > /tmp/xglTemplates_generated.self
	cat xglTemplates_ops.self /tmp/xglTemplates_generated.self > xglTemplates.self 	
	rm /tmp/xglTemplates_generated.self

proxies:
	markNotImplemented.perl ${XGLHOME}/include/xgl/xgl.h | 		  \
	stripComments.perl | stripIncludes.perl | stripBlankLines.perl |  \
	convertDefinesToEnums.perl | $(CPP) -D__cplusplus -Dsun -Dsparc   \
	-Dunix -D__svr4__ -D__sun__ -D__sparc__ -D__unix__ -D__svr4__     \
	-DSOLARIS -DHOST_ARCH=sun4 -DHOST_MACH=sparc -DTARGET_ARCH=sun4   \
        -DTARGET_MACH=sparc | stripBlankLines.perl | convertCtoPerl.perl |\
	printSelfDefinitions.perl > /tmp/xgl_proxies.self
	cat xgl_header.self /tmp/xgl_proxies.self > xgl.self 	
	rm /tmp/xgl_proxies.self

glue:
	markNotImplemented.perl ${XGLHOME}/include/xgl/xgl.h | 		  \
	stripComments.perl | stripIncludes.perl | stripBlankLines.perl |  \
	convertDefinesToEnums.perl | $(CPP) -D__cplusplus -Dsun -Dsparc   \
	-Dunix -D__svr4__ -D__sun__ -D__sparc__ -D__unix__ -D__svr4__     \
	-DSOLARIS -DHOST_ARCH=sun4 -DHOST_MACH=sparc -DTARGET_ARCH=sun4   \
        -DTARGET_MACH=sparc | stripBlankLines.perl | convertCtoPerl.perl |\
	printCWrappers.perl > xgl_glue.c
