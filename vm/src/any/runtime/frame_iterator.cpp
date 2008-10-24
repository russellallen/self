/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "frame_iterator.hh"

# include "_frame_iterator.cpp.incl"


FrameIterator::FrameIterator( frame* _f, RegisterLocator* _rl, bool z, RegisterString m, bool r, OopClosure* c ) {
  f = _f; rl = _rl;  zap = z;  mask = m;  reinit = r;  oop_closure = c;
  do_all();
}


void FrameIterator::do_all() {
       if (f->is_interpreted_self_frame())  do_interpreted();
  else if (f->is_compiled_self_frame())     do_compiled();
  else                                      do_vm_frame();
}
  
  
void FrameIterator::do_interpreted() {
  interpreter* interp = f->get_interpreter();
  InterpreterIterator ii(interp, oop_closure, zap, reinit);
}


# if !(defined(FAST_COMPILER) || defined(SIC_COMPILER))
  void do_compiled() { ShouldNotReachHere(); }
# endif  

void FrameIterator::do_patched_frame_saved_outgoing_args() {
  if ( !SaveOutgoingArgumentsOfPatchedFrames )
    return;
  if ( f->is_patched() ) {
    oop* p = (oop*)f->patched_frame_saved_outgoing_args_addr();
    oop_closure->do_oop(p);
  }
}
