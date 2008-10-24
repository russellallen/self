# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "registerString_i386.hh"

# include "_registerString_i386.cpp.incl"

# ifdef FAST_COMPILER

void printRegister(Location r) {
  fatal("Unused Intel -- see Assembler::printR");
}


RegisterString registerMaskBit(Location l, fint stackLocs, fint nonRegisterArgs) {
  return is_StackLocation(l)  ?  nthBit(index_for_StackLocation(l)) : 0;
}

# endif // FAST_COMPILER
# endif // TARGET_ARCH == I386_ARCH
