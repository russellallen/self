/* Sun-$Revision: 30.5 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "longRegString_sparc.hh"

# include "_longRegString_sparc.cpp.incl"

# ifdef SIC_COMPILER


void LongRegisterString::allocate(Location l) { doAllocate(l); }


# endif // SIC_COMPILER
