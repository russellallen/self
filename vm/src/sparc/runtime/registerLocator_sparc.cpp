/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "registerLocator_sparc.hh"

# include "_registerLocator_sparc.cpp.incl"


void RegisterLocator::update_addresses_from_self_frame() {
}


void RegisterLocator::update_addresses_from_VM_frame() {
}


RegisterLocator* RegisterLocator::for_frame(frame* f) {
  RegisterLocator* r = new RegisterLocator;
  r->my_frame = f;
  return r;
}
