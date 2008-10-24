# ifdef __i386__
#/* Sun-$Revision: 1.3 $ */

#/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
#   See the LICENSE file for license information. */


# if TARGET_IS_PROFILED

# include "_allocZone_i386.s.incl"
# include "asmDefs_gcc_i386.hh"


 .globl _CompiledSelfCode, _CompiledSelfCodeEnd
  
_CompiledSelfCode: .space ProfiledZoneSize, 0

_CompiledSelfCodeEnd:

# endif


# endif // TARGET_ARCH == I386_ARCH
