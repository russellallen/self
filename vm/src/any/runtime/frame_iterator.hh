#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "frame.hh"




class FrameIterator: public StackObj {
 private:
  frame* f;
  RegisterLocator* rl; // for callee-saved registers
  bool zap;
  RegisterString mask;
  bool reinit;
  OopClosure* oop_closure;
  
 public:
  FrameIterator( frame* _f, RegisterLocator* _rl, bool z, RegisterString m, bool r, OopClosure* c );
  
 private:
  void do_all();
  void do_vm_frame();
  void do_interpreted();
  void do_compiled();
  void do_patched_frame_saved_outgoing_args();

# if defined(__ppc__)
# include "frame_iterator_ppc.hh"
# elif defined(__i386__)
# include "frame_iterator_i386.hh"
# else
# include "frame_iterator_sparc.hh"
# endif
};
