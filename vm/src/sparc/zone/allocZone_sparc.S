/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

#if TARGET_IS_PROFILED

# include "_allocZone_sparc.S.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


        .text

        .global _CompiledSelfCode, _CompiledSelfCodeEnd
#   if TARGET_OS_VERSION == SOLARIS_VERSION
        .align 8192
#   else
        .align 4
#   endif
 

_CompiledSelfCode:
        .skip ProfiledZoneSize
#   ifdef SOLARIS
        .align 8192
#   endif

_CompiledSelfCodeEnd:

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

#endif


