# if defined(__ppc__) || defined(__powerpc__)
;/* Sun-$Revision: 30.10 $ */

;/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
;   See the LICENSE file for license information. */


# if TARGET_IS_PROFILED

# include "_allocZone_ppc.S.incl"
# include "asmDefs_gcc_ppc.hh"


 .globl _CompiledSelfCode, _CompiledSelfCodeEnd
  
_CompiledSelfCode: .space ProfiledZoneSize, 0

_CompiledSelfCodeEnd:

# endif


# endif // TARGET_ARCH == PPC_ARCH
