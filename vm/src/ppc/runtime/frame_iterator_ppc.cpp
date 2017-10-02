# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# include "frame_iterator.hh"
# include "label_inline.hh"
# include "nmethod.hh"
# include "oopClosures.hh"
# include "registerLocator.hh"


void FrameIterator::do_vm_frame() {
  // Can ignore nonvols here because register locators ensure that
  // they are accessed when visiting the Self frame that uses them.
  // -- dmu 2/03
  assert(!processSemaphore, "oopClosure will not be called on resultOop in HandleReturnTrap");
  // SendMessage/SendDIMessage frame saves the args to be given to the send in ITS frame
  fint offset = volatile_register_sp_or_fp_offset(f->real_return_addr());
  if (offset != 0)
    do_saved_volatile_outgoing_argument_registers(offset);
}


void FrameIterator::do_saved_volatile_outgoing_argument_registers(fint vol_reg_sp_or_fp_offset) {
  if (!SaveOutgoingArgumentsOfPatchedFrames) {
    return;
  }
  fint nargs = f->sender()->outgoing_arg_count(f);
  if (nargs == -1)
    return; // internal prim, don't know how many args, will not be using them, so don't scavenge, don't zap
  assert(nargs >= 0, "just checking");
  fint num_reg_args_and_rcvr = 1 /* rcvr */ + min(nargs, NumArgRegisters);
  oop* p = f->location_addr_of_incoming_argument_register(ReceiverReg, vol_reg_sp_or_fp_offset);
  fint i = 0;
  for ( ;  i < num_reg_args_and_rcvr;  ++i)
    oop_closure->do_oop(&p[i]);
  if (zap)
    for ( ; i < NumRcvrAndArgRegisters;  ++i)
      p[i] = badOop; // zap dead vol regs
}


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  void FrameIterator::do_compiled() {
    nm = f->code();

    do_saved_nonvolatile_registers();
    do_incoming_arguments();
    do_memory_locals();
    do_patched_frame_saved_outgoing_args();
  }
  
  
  void FrameIterator::do_saved_nonvolatile_registers() {
    assert(rl->fr() == f, "");
    fint nsaved = nm->number_of_saved_nonvolatile_registers();
    Location first_saved_reg = Location(HighestNonVolReg + 1 - nsaved);
    # if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        for (fint i = 0;  i < first_saved_reg;  ++i)  {
          if (isSet(mask, i))
            fatal3("bit %d in mask 0x%x is set, send desc = 0x%x", i, mask, f->send_desc());
        }
      }
    # endif
    for (Location r = first_saved_reg;  r <= HighestNonVolReg;  r = Location(r + 1)) {
      oop* p = rl->address_of(r);
      assert(check_for_overwriting_patched_frame_saved_outgoing_args(p, fint(r)),
            "overwriting patched_frame_saved_outgoing_args");
           if ( isSet(mask, r) )  oop_closure->do_oop(p);
      else if ( zap            )  *p = badOop;
    }
  }

  
  void FrameIterator::do_incoming_arguments() {
    // Cannot get arg count from method because might be in midst of scavenge/gc
    fint num_args_and_rcvr = nm->incoming_arg_count() + 1;
    oop* rcvr_and_arg_base = ((oop*)f) + nm->frameSize() + rcvr_and_argument_offset(0);

    # if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions  &&  f->is_patched()) {
        for ( fint i = 0;  i < num_args_and_rcvr;  ++i )
            assert(check_for_overwriting_patched_frame_saved_outgoing_args(&rcvr_and_arg_base[i], i),
                   "overwriting patched_frame_saved_outgoing_args");
      }
    # endif

    // Zap allocated but unused words in frame for incoming args
    if ( zap  &&  !nm->are_register_arguments_saved_on_stack() ) {
      fint num_to_zap = min(num_args_and_rcvr,  NumRcvrAndArgRegisters);
      for (fint i = 0;  i < num_to_zap;  ++i)
        rcvr_and_arg_base[i] = badOop;
    }
    // Visit saved args
    fint first_saved_arg =  nm->are_register_arguments_saved_on_stack() 
                              ? 0  // all saved
                              : NumRcvrAndArgRegisters;  
    for ( fint i = first_saved_arg;  i < num_args_and_rcvr;  ++i )
      oop_closure->do_oop(&rcvr_and_arg_base[i]);
    // Note: unsaved args do not need visiting, because they are moved to
    // nonvols in prologue, which were visited in above routine.
  }
  
  
  void FrameIterator::do_memory_locals() {
    fint nlocals = nm->number_of_memory_locals();
    oop* start = ((oop*)f) + stackLocation_offset(0, nm->max_no_of_outgoing_args_and_rcvr());
    oop* p = start;
    for ( fint i = 0;   i < nlocals;   ++i, ++p) {
        assert(check_for_overwriting_patched_frame_saved_outgoing_args(p, i),
               "overwriting patched_frame_saved_outgoing_args");
      oop_closure->do_oop(p);
    }
    if (zap) {
      oop* limit = ((oop*)f) + f->frame_size() - nm->number_of_saved_nonvolatile_registers() + last_extra_offset;
      for ( ; p < limit;  ++p)  {
        assert(check_for_overwriting_patched_frame_saved_outgoing_args(p, p - start),
               "overwriting patched_frame_saved_outgoing_args");
        *p = badOop;
      }
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
# endif // TARGET_ARCH == PPC_ARCH
