/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "registerString.hh"

# include "_registerString.cpp.incl"

# ifdef FAST_COMPILER


void printAllocated(RegisterString rs) {
  lprintf("{");
  bool first = true;
  unsigned r = rs;              // safer for >>
  for (fint d = 0; r; d++, r >>= 1) {
    if (isSet(r, 0)) {
      if (first) {
        first = false;
      } else {
        lprintf(",");
      }
      lprintf("%s", RegisterNames[d]);
      Location d1 = Location(d);
      for (char c = RegisterNames[d][0];
           isSet(r, 1) && c == RegisterNames[d + 1][0];
           d ++, r >>= 1)
        ;
      if (d > d1) lprintf("-%s", RegisterNames[d]);
    }
  }
  lprintf("}");
}



Location pick(RegisterString& alloc, RegisterString mask) {
  unsigned r = mask & ~alloc;
  if (r == 0) return UnAllocated;
  fint reg;
  for (reg = 0; ! isSet(r, 0); reg ++, r >>= 1) ;
  setNth(alloc, reg);
  return Location(reg);
}
  

// ppc uses ldm, stm to save/restore nonvol regs, so must allocate
// them from top (r31 downwards)_:

Location pickReverse(RegisterString& alloc, RegisterString mask) {
  unsigned r = mask & ~alloc;
  if (r == 0) return UnAllocated;
  fint reg;
  for (reg = 31; ! isSet(r, 31); --reg, r <<= 1) ;
  setNth(alloc, reg);
  return Location(reg);
}


# endif // FAST_COMPILER
