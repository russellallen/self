# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "longRegString_i386.hh"

# include "_longRegString_i386.cpp.incl"


# ifdef SIC_COMPILER


void LongRegisterString::allocate(Location l) {
  doAllocate(l);
}


# endif // SIC_COMPILER
# endif // TARGET_ARCH == I386_ARCH
