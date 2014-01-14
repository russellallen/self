# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "registerState_ppc.hh"
# include "_registerState_ppc.cpp.incl"

# ifdef FAST_COMPILER

# undef  MAX
# define MAX ((maxDepth >> LogBitsPerWord) + 1)


void RegisterState::initialize_for_platform(fint /*maxTemps*/) {
  _number_of_saved_nonvolatile_registers = 0;
}


void RegisterState::genMask() {
  RegisterString m = mask();
  theAssembler->Data(m);
}


RegisterString RegisterState::mask() {
  assert(sizeof(allocated) == oopSize, "");
  return allocated; // just the registers, have enough to worry about
}


Location RegisterState::pickLocal() {
  // pick a local
  Location r = ::pickRegister(allocated, LocalMask);
  if (r == UnAllocated) 
    r = pickStackTemp();
  allocate(r);
  return r;
}


void RegisterState::allocateArgs(fint nargs, bool isPrimCall) {
  Unused(isPrimCall);
  argDepth = max(argDepth, nargs);
}


void RegisterState::allocate(Location r) {
  if (isRegister(r)) {
    ::allocateRegister(allocated, r);
    // allocate nonvols down from R31, must save/restore them, so track depth
    _number_of_saved_nonvolatile_registers = max(_number_of_saved_nonvolatile_registers, 32 - r);
  } 
  else if (is_StackLocation(r)) {
    assert(!isSet(stackAllocs[whichMask(r)], whichBit(r)),
           "already allocated");
    setNth(stackAllocs[whichMask(r)], whichBit(r));
    fint tempNo = index_for_StackLocation(r) + 1;
    if (tempNo >= stackDepth) 
      stackDepth = tempNo;
    curDepth++;
    assert(curDepth <= stackDepth, "curDepth too big");
  } 
}
  

void RegisterState::deallocate(Location r) {
  if (isRegister(r)) {
    ::deallocateRegister(allocated, r);
    allocated = ::allocate(allocated, permanent); // ensure we do not deallocate a permanent reg
  } 
  else if (is_StackLocation(r)) {
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
}


# endif // FAST_COMPILER
# endif // TARGET_ARCH == PPC_ARCH
