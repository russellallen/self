# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "longRegString_ppc.hh"

# include "_longRegString_ppc.cpp.incl"


# ifdef SIC_COMPILER


void LongRegisterString::allocate(Location l) {
  theSIC->update_number_of_saved_nonvolatile_registers_for(l);
  doAllocate(l);
}


# endif // SIC_COMPILER
# endif // TARGET_ARCH == PPC_ARCH
