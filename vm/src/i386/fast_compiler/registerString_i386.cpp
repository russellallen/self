# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "bitVector.hh"
# include "registerString.hh"

# ifdef FAST_COMPILER

void printRegister(Location r) {
  fatal("Unused Intel -- see Assembler::printR");
}


RegisterString registerMaskBit(Location l, fint stackLocs, fint nonRegisterArgs) {
  return is_StackLocation(l)  ?  nthBit(index_for_StackLocation(l)) : 0;
}

# endif // FAST_COMPILER
# endif // TARGET_ARCH == I386_ARCH
