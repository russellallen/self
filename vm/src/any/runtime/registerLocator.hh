/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// On machines that use callee-save registers such as the PPC,
// we need an object that holds the addresses where a frame's callee-save
// registers have been saved.

class RegisterLocator: public ResourceObj {
 private:
  frame* my_frame; // the frame I am for; I describe the addresses of the callee-saved regs for a specific frame
  
  # if GENERATE_DEBUGGING_AIDS
  RegisterLocator* sendee;
  int              setHow;
  # endif
  
 private:
  fint index_for_reg(Location);
  void set_address(Location, oop*);
  RegisterLocator* clone();
  void be_for_sender();
  
  void update_addresses_from_self_frame();
  void update_addresses_from_VM_frame();
  void forget_everything();

  
 public:
  RegisterLocator(bool clear = true);
  frame* fr() { return my_frame; }
  static RegisterLocator* for_sender_of(frame* f);
  static RegisterLocator* for_frame(frame* r); // slow, but convenient
  RegisterLocator* climb_to_frame(frame* f);
  oop* address_of(Location reg);
  RegisterLocator* sender(); // return new RL for sender frame
  bool are_all_defined();
  RegisterLocator* for_copied_frame(frame* f);
  
# include "_registerLocator_pd.hh.incl"
};
