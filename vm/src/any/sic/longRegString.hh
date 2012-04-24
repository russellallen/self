/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# ifdef SIC_COMPILER

// like a RegisterString, but has arbitrary length (i.e., bits for
// stack temps and regs)
// this file should be called longRegisterString.hh, since the class
// name is LongRegisterString.  But an auxillarly file (_longRegString_sparc.cpp.incl)
// would have a filename length that's too long.  so we use longRegString as the
// filename instead.  -mabdelmalek 10/02
class LongRegisterString : public ResourceObj {
  BitVector* bv;
public:
  LongRegisterString();
  void allocate  (Location l);
# ifdef UNUSED
  void deallocate(Location l);
# endif
  bool isAllocated(Location l);
  RegisterString regs(); // returns string for registers
  void print();
    
private:
  void doAllocate(Location l);

  void grow(fint desiredIndex);
  friend fint findFirstUnused(LongRegisterString** strings, fint len, fint start);

# include "_longRegString_pd.hh.incl"

};


Location findFirstUnusedTemp(LongRegisterString** strings, fint len);


# endif // SIC_COMPILER
