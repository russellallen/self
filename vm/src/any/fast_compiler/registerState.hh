/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef FAST_COMPILER

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// Keeps track of the current allocations state for the NIC

class RegisterState: public ResourceObj {
 public:
  RegisterString permanent;             // fixed regs (cannot be deallocated)
  RegisterString allocated;             // registers
  int32 stackDepth; // depth beyond the registers  // max # stack temps needed (sparc)
  int32 curDepth;                       // current # stack temps
  int32 maxDepth; // the most it could ever be for this method (based on # bytecodes)  // size of stackAllocs array (sparc)
  unsigned* stackAllocs;                // allocation status for stack locs
  unsigned* stackPerms;                 // permanent stack locations
  int32 initStackTemps;                 // # initialized stack temps (e.g. 
                                        // locals; don't need to zero them)
  int32 argDepth; //  # extra outgoing args (on sparc), excludes rcvr

  RegisterState(fint maxTemps);
  
  Location pickLocal();                 // any local reg or stack temp
  Location pickPermanent();             // same, but mark as permanent
  Location pickStackTemp();
  Location pickPermanentStackTemp() {
    Location l = pickStackTemp();
    allocatePermanent(l);
    return l;
  }
  void allocate(Location l);            // mark l as allocated
  void allocatePermanent(Location l);   // mark l as being alloc'd permanently
  void allocateArgs(fint nargs,
                    bool isPrimCall);   // reserve nargs arg locations for call
  void deallocate(Location l);          // mark l as free

  RegisterString mask();                // mask for inline cache
  void genMask();                       // generate mask for inline cache
    
  void print();
  
 private:
  void initialize_for_platform(fint maxTemps);

# include "_registerState_pd.hh.incl"
};


inline fint whichMask(Location r) {
  // gives index into stackAllocs array
  fint l = index_for_StackLocation(r);
  assert(l >= 0, "invalid temp number");
  return l >> LogBitsPerWord;
}

inline fint whichBit(Location r) {
  // gives bit number within stackLocs element
  fint l = index_for_StackLocation(r);
  assert(l >= 0, "invalid temp number");
  return lowerBits(l, LogBitsPerWord);
}


# endif // FAST_COMPILER
