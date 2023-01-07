# ifdef __i386__
#/* Sun-$Revision: 1.3 $ */

#/* Copyright 1992-2012 AUTHORS.
#   See the LICENSE file for license information. */


# if TARGET_IS_PROFILED

# include "_allocZone_i386.S.incl"
# include "asmDefs_gcc_i386.hh"


start_exported_function(CompiledSelfCode)
  .space ProfiledZoneSize, 0

start_exported_function(CompiledSelfCodeEnd)

# endif


# endif // TARGET_ARCH == I386_ARCH
