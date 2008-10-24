/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "registerState.hh"
# include "_registerState.cpp.incl"

# ifdef FAST_COMPILER

# undef  MAX
# define MAX ((maxDepth >> LogBitsPerWord) + 2) // added an extra 1 for I386, which has no regs


RegisterState::RegisterState(fint maxTemps) {
  allocated = permanent = 0; maxDepth = maxTemps;
  argDepth = stackDepth = curDepth = initStackTemps = 0;
  assert(sizeof(unsigned) == oopSize, "changed this");
  stackAllocs = NEW_RESOURCE_ARRAY( unsigned, MAX);
  stackPerms =  NEW_RESOURCE_ARRAY( unsigned, MAX);
  for (fint i = 0; i < MAX; i++) {
    stackAllocs[i] = stackPerms[i] = 0;
  }
  initialize_for_platform(maxTemps);
}


void RegisterState::allocatePermanent(Location r) {
  if (isRegister(r)) {
    ::allocateRegister(permanent, r);
  } 
  else if (is_StackLocation(r)) {
    setNth(stackPerms[whichMask(r)], whichBit(r));
  } 
  else {
    // extra incoming arg etc -- ignore
  }
  allocate(r);
}


Location RegisterState::pickPermanent() {
  // pick a permanent local
  RegisterString s = allocated;
  Location r = ::pickRegister(s, LocalMask);
  if (r == UnAllocated) {
    r = pickStackTemp();
  } 
  allocatePermanent(r);
  return r;
}

Location RegisterState::pickStackTemp() {
  Location r;
  fint base = StackLocations;
  for (fint i = 0; i < MAX; i++) {
    RegisterString m = stackAllocs[i];
    # if GENERATE_DEBUGGING_AIDS
      RegisterString old_m = m;
    # endif
    r = ::pick(m, AllBits);
    if (r != UnAllocated) break;
    # if GENERATE_DEBUGGING_AIDS
      assert(m == old_m, "pick did not find one, but changed m");
    # endif
    base += BitsPerWord;
  }
  assert(r != UnAllocated, "couldn't allocate stack temp");
  return Location(base + r);
}

void RegisterState::print() {
  ::printAllocated(allocated);
  ::printAllocated(permanent);
  lprintf("+%ld(%ld/%ld)+%ld:", curDepth, stackDepth,
         maxDepth, argDepth);
}
  


# endif // FAST_COMPILER
