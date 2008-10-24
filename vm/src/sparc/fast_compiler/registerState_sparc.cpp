/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "registerState_sparc.hh"
# include "_registerState_sparc.cpp.incl"

# ifdef FAST_COMPILER

# undef  MAX
# define MAX ((maxDepth >> LogBitsPerWord) + 1)

void RegisterState::initialize_for_platform(fint maxTemps) {
  // maxTemps > # byte codes; in the worst case we'll have 2*maxTemps
  // inline caches (if all bcs are prim calls) plus 1 in prologue.
  // To be safe, allocate twice that in anticipation of debugging hooks.
  maskList = new AddressList(4 * (maxTemps + 10));
}


void RegisterState::genMask() {
  RegisterString m = mask();
  maskList->append(theAssembler->addr());
  theAssembler->Data(m);
}



RegisterString RegisterState::mask() {
    assert(NumInRegisters + NumLocalRegisters == 16 && I0 > L0,
           "changed SPARC definition");
    RegisterString regs =
      (unsigned(allocated) >> L0) & nthMask(NumInRegisters + NumLocalRegisters);
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
        RegisterString test = 0;
        setNth(test, 0);
        assert(test == 1, "different bit ordering - change this code");
        assert(MAX > 0, "no word for stack locals");
    }
#   endif
    RegisterString stackLocals =
      stackAllocs[0] << (NumInRegisters + NumLocalRegisters);
    assert((regs & (-1 << (NumInRegisters + NumLocalRegisters))) == 0,
           "regs overlap stackLocals");
    return regs | stackLocals;
}


void RegisterState::fixupMasks(fint stackTempSize) {
  // The mask in the inline cache marks the regs + the first 16 stack locs.
  // If we have fewer than 16 temps and have extra args, the bits for the
  // extra args must be set.
  fint ntemps = BitsPerWord - (NumInRegisters + NumLocalRegisters);
  assert(stackDepth < ntemps && argDepth > 0, "shouldn't patch");
  int32 extraMask = 0;
  for (fint i = 1; i <= argDepth; i++) {
    fint bitNo = stackTempSize - i;
    if (bitNo < ntemps) {
      setNth(extraMask, NumInRegisters + NumLocalRegisters + bitNo);
    }
  }
  assert((extraMask & nthMask(NumInRegisters + NumLocalRegisters)) == 0,
         "invalid mask overlap");
  for (fint j = 0, len = maskList->length(); j < len; j++) {
    int32* mask = (int32*)maskList->nth(j);
    assert((*mask & extraMask) == 0, "none of these bits should be set");
    *mask |= extraMask;
  }
}


Location RegisterState::pickLocal() {
  // pick a local
  Location r = ::pickRegister(allocated, LocalMask);
  if (r == UnAllocated) {
    r = pickStackTemp();
    allocate(r);
  }
  return r;
}
  

void RegisterState::allocateArgs(fint nargs, bool isPrimCall) {
  Unused(isPrimCall);
  argDepth = max(argDepth, nargs - NumArgRegisters);
}


void RegisterState::allocate(Location r) {
  if (isRegister(r)) {
    ::allocateRegister(allocated, r);
  } 
  else if (r >= StackLocations) {
    assert(!isSet(stackAllocs[whichMask(r)], whichBit(r)),
           "already allocated");
    setNth(stackAllocs[whichMask(r)], whichBit(r));
    fint tempNo = r - StackLocations + 1;
    if (tempNo >= stackDepth) 
      stackDepth = tempNo;
    curDepth++;
    assert(curDepth <= stackDepth, "curDepth too big");
  } 
  else if (r <= ExtraArgLocations) {
    fatal("don't need to allocate extra args");
  } 
  else if (r <= ExtraIArgLocations) {
    // already allocated
  } 
  else {
    fatal("cannot allocate a pseudo-register");
  }
}


void RegisterState::deallocate(Location r) {
  if (isRegister(r)) {
    ::deallocateRegister(allocated, r);
    allocated = ::allocate(allocated, permanent); // ensure we do not deallocate a permanent reg
  } 
  else if (r >= StackLocations) {
    if (isSet(stackPerms[whichMask(r)], whichBit(r))) {
      // permanent -- don't deallocate
    } 
    else {
      assert(isSet(stackAllocs[whichMask(r)], whichBit(r)), "not allocated");
      clearNth(stackAllocs[whichMask(r)], whichBit(r));
      --curDepth;
      assert(curDepth >= 0, "negative depth");
    }
  } 
  else if (r <= ExtraArgLocations) {
    fatal("shouldn't deallocate extra args");
  } 
  else {
    // ignore extra incoming args - they are permanent
  }
}

# endif // FAST_COMPILER
