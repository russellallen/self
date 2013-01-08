# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "registerState_i386.hh"
# include "_registerState_i386.cpp.incl"

# ifdef FAST_COMPILER

# undef  MAX
# define MAX ((maxDepth >> LogBitsPerWord) + 1)


void RegisterState::initialize_for_platform(fint /*maxTemps*/) {
  rcvrDepth = 0;
}


void RegisterState::genMask() {
  RegisterString m = mask();
  theAssembler->Data(m);
}


RegisterString RegisterState::mask() {
  assert(sizeof(allocated) == oopSize, "");
  return stackAllocs[0];
}


Location RegisterState::pickLocal() {
  // do not currently use registers, just go to stack
  Location r = pickStackTemp();
  allocate(r);
  return r;
}


void RegisterState::allocateArgs(fint nargs, bool isPrimCall) {
  Unused(isPrimCall);
  argDepth = max(argDepth, nargs);
  rcvrDepth = 1;
}


void RegisterState::allocate(Location r) {
  if (isRegister(r)) {
    ::allocateRegister(allocated, r);
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
# endif // TARGET_ARCH == I386_ARCH
