/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "frame.hh"
# include "interruptedCtx.hh"
# include "label_inline.hh"
# include "nmethod.hh"
# include "registerLocator.hh"

void RegisterLocator::update_addresses_from_self_frame() {
}


void RegisterLocator::update_addresses_from_VM_frame() {
}


RegisterLocator* RegisterLocator::for_frame(frame* f) {
  RegisterLocator* r = new RegisterLocator;
  r->my_frame = f;
  return r;
}
