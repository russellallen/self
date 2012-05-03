/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



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

  # include "_frame_iterator_pd.hh.incl"
};
