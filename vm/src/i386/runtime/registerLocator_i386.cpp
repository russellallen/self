# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "registerLocator_i386.hh"

# include "_registerLocator_i386.cpp.incl"


void RegisterLocator::update_addresses_from_self_frame() {}


void RegisterLocator::update_addresses_from_VM_frame() {
}




RegisterLocator* RegisterLocator::for_frame(frame* f) {
  RegisterLocator* r = new RegisterLocator;
  r->my_frame = f;
  return r;
}
# endif // TARGET_ARCH == I386_ARCH
