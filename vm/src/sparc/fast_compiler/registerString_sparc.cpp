/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "registerString_sparc.hh"

# include "_registerString.cpp.incl"

# ifdef FAST_COMPILER

void printRegister(Location r) {
  if (r >= StackLocations) {
    lprintf("T%ld", long(r - StackLocations));
  } else if (r <= ExtraArgLocations) {
    lprintf("E%ld", long(ExtraArgLocations - r));
  } else if (r <= ExtraIArgLocations) {
    lprintf("I%ld", long(ExtraIArgLocations - r));
  } else {
    lprintf("%s", RegisterNames[r]);
  }
}


RegisterString registerMaskBit(Location l, fint stackLocs, fint nonRegisterArgs) {
  if (isRegister(l)) {
    if (l >= I0 && l < I0 + NumInRegisters) {
      // an in register
      return nthBit(l - I0 + NumLocalRegisters);
    } else {
      assert(l >= L0 && l < L0 + NumLocalRegisters, "unexpected register");
      return nthBit(l - L0);
    }
  } else if (isStackRegister(l)) {
    l = Location(l - StackLocations);
    if (l < BitsPerWord - (NumInRegisters + NumLocalRegisters)) {
      return nthBit(l + NumInRegisters + NumLocalRegisters);
    }
  } else if (isExtraArgRegister(l)) {
    fint which = ExtraArgLocations - l;
    assert(which <= nonRegisterArgs, "nonRegisterArgs too small");
    which = stackLocs + (nonRegisterArgs - which);  // translate into stack temp
    assert(which >= 0, "should be non-negative");
    if (which < BitsPerWord - (NumInRegisters + NumLocalRegisters)) {
      return nthBit(which + NumInRegisters + NumLocalRegisters);
    }
  }
  return 0;
}


# endif // FAST_COMPILER
