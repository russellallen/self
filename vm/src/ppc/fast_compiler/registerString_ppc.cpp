# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "registerString_ppc.hh"

# include "_registerString_ppc.cpp.incl"

# ifdef FAST_COMPILER

void printRegister(Location r) {
  if (is_StackLocation(r)) {
    lprintf("T%ld", long(index_for_StackLocation(r)));
  } else if (r >= ArgStackLocations) {
    lprintf("A%ld", long(r - ArgStackLocations));
  } else if (r >= IArgStackLocations) {
    lprintf("I%ld", long(r - IArgStackLocations));
  } else {
    lprintf("%s", RegisterNames[r]);
  }
}


RegisterString registerMaskBit(Location l, fint stackLocs, fint nonRegisterArgs) {
  Unused(nonRegisterArgs);
  if (isRegister(l)) {
    assert(l >= LowestLocalNonVolReg && l <= HighestNonVolReg, "unexpected register");
    return nthBit(l);
  } else {
    // The Sparc version of this function returns a mask bit for some stack locations.
    // But it seems that on the PPC, we only return mask bits for registers (i.e. not
    // for stack locations).
    // A look at registerState{,_ppc}.cpp shows that the NIC's mask only contains
    // registers, not stack locations.  See RegisterState::mask for a supporting comment.
    
    // Dave: why don't we put stack loc's info in the registerMask?  I haven't
    // looked at the GC code too closely.  Even on the Sparc, I'm confused because if the
    // required mask bit doesn't fit in a word, we don't return it.  Do we manually
    // go through the stack locations at GC for locations not contained in the mask?
    
    // Mike: the compiler must initialize all stack locations, that way they are always GC'ed.
    // This was an optimization on the SPARC. -- dmu
    return 0;
  }
}

# endif // FAST_COMPILER
# endif // TARGET_ARCH == PPC_ARCH
