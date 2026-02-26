# if  TARGET_ARCH == I386_ARCH || TARGET_ARCH == X86_64_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "frame_iterator_amd64.hh"

# include "_frame_iterator_amd64.cpp.incl"


void FrameIterator::do_vm_frame() {
  assert(!processSemaphore, "oopClosure will not be called on resultOop in HandleReturnTrap");
  assert(SaveOutgoingArgumentsOfPatchedFrames, "always true for I386");
  if (!SaveOutgoingArgumentsOfPatchedFrames)
    return;
  do_incoming_arguments_of_vm_frame_called_from_self();
}


void FrameIterator::do_incoming_arguments_of_vm_frame_called_from_self() {
  frame* s = f->sender();
  if (s == NULL  ||  !s->is_self_frame())
    return;
  // hit the outgoing args of the self frame in case it is later patched
  // (when a frame is patched we grab its outgoing args)
  fint n = s->outgoing_arg_count(f);
  for (fint i = 0;  i < n + 1 /*rcvr*/;  ++i)
    oop_closure->do_oop(
      f->location_addr_of_incoming_argument(LocationOfSavedOutgoingArgInSendee(i-1), NULL));
}


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
            
  void FrameIterator::do_incoming_arguments() {
    fint nargs = nm->incoming_arg_count();
    oop* p = f->first_incoming_arg_addr() - 1 /* rcvr */;
    for (fint i = -1 /* rcvr */;  i < nargs;  ++i, ++p) {
      assert(check_for_overwriting_patched_frame_saved_outgoing_args(p, i), "");
      oop_closure->do_oop(p);
    }
  }


  void FrameIterator::do_compiled() {
    nm = f->code();

    do_incoming_arguments();
    do_memory_locals();
    do_patched_frame_saved_outgoing_args();
  }
  
  
  void FrameIterator::do_memory_locals() {
    fint n = min(nm->number_of_memory_locals(),  sizeof(RegisterString) * BitsPerByte);
    oop* p = f->first_local_addr();
    fint i;
    for (i = 0;  i < n;  ++i, --p) {
      assert(check_for_overwriting_patched_frame_saved_outgoing_args(p, i), "");

           if ( isSet(mask, i) )  oop_closure->do_oop(p);
      else if ( zap            )  *p = badOop;
    }      
    # if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions)
        for ( fint j = i; j  <  sizeof(RegisterString) * BitsPerByte;  ++j)  {
          assert( !isSet(mask, j), "nonsensical bit set in mask");
        }
    # endif
    
    for (  ;  i < nm->number_of_memory_locals();  ++i, --p ) {
      assert(check_for_overwriting_patched_frame_saved_outgoing_args(p, i), "");
      oop_closure->do_oop(p);
    }
  }
  

  bool FrameIterator::check_for_overwriting_patched_frame_saved_outgoing_args(oop* p, fint idx) {
    if (!f->is_patched())                                         return true;
    if (p != (oop*)f->patched_frame_saved_outgoing_args_addr(nm)) return true;
    WizardMode = true;
    lprintf("****** about to die at index %d, frame = 0x%x, next_frame = 0x%x, frame size = 0x%x (%d)\n",
            idx, f, f->sender(), f->frame_size(), f->frame_size());
    if (nm != f->code()) {
      lprintf("****** nm (0x%x) != f->code() (0x%x)\n", nm, f->code());
      nm = f->code();
    }
    if (!GCInProgress && !ScavengeInProgress) { // cannot do these when the heap is all weird
      lprintf("nmethod of offending frame is:\n");
      nm->verify();
      nm->print(); 
      lprintf("\n\n\ncode: \n");
      nm->printCode();
    }
    return false;
  }

  
# endif // either compiler
# endif // TARGET_ARCH == I386_ARCH
