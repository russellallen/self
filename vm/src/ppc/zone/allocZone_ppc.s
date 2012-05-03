# ifdef __ppc__`
;/* Sun-$Revision: 30.10 $ */

;/* Copyright 1992-2012 AUTHORS.
;   See the LICENSE file for license information. */


# if TARGET_IS_PROFILED

# include "_allocZone_ppc.s.incl"
# include "asmDefs_gcc_ppc.hh"


 .globl _CompiledSelfCode, _CompiledSelfCodeEnd
  
_CompiledSelfCode: .space ProfiledZoneSize, 0

_CompiledSelfCodeEnd:

# endif


# endif // TARGET_ARCH == PPC_ARCH
