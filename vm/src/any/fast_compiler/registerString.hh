/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef FAST_COMPILER

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


inline RegisterString& allocate(RegisterString& s1, RegisterString s2) {
  setBits(s1, s2);
  return s1;
}

inline bool isAllocated(RegisterString s, Location l) {
  return isSet(s, l);
}

inline RegisterString& deallocate(RegisterString& s1, RegisterString s2) {
  clearBits(s1, s2);
  return s1;
}

inline RegisterString& allocateRegister(RegisterString& s, Location r) {
  if (isRegister(r)) setNth(s, r);
  return s;
}

inline RegisterString& deallocateRegister(RegisterString& s1, Location r) {
  assert(isRegister(r), "not a register");
  clearNth(s1, r);
  return s1;
}

// Some platforms allocate registers in reverse order, so define a special pick
// to use the right order.
Location pick(RegisterString& alloc, RegisterString mask = ~0); // picks low-to-high
Location pickReverse(RegisterString& alloc, RegisterString mask = ~0); // picks high-to-low
Location pickRegister(RegisterString& alloc, RegisterString mask = ~0); // picks in correct order for register picking

void printRegister(Location r);
void printAllocated(RegisterString r);
    

# include "_registerString_pd.hh.incl"


# endif // FAST_COMPILER
