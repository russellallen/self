/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "frame_iterator_sparc.hh"

# include "_frame_iterator_sparc.cpp.incl" 

void FrameIterator::do_vm_frame() { 
  if (!SaveOutgoingArgumentsOfPatchedFrames)
    return;
  frame* s = f->sender();
  if (s == NULL  ||  !s->is_self_frame())
    return;
  // hit the outgoing args of the self frame in case it is later patched
  // (when a frame is patched we grab its outgoing args)
  // How can old sparc verison every have worked without this? -- dmu 2/03
  // As of 2/16/03, this fails on testVMSuite in debug mode for SPARC.
  fint n = s->outgoing_arg_count(f);
  for (fint i = 0;  i < n + 1 /*rcvr*/;  ++i)
    oop_closure->do_oop(
      f->location_addr_of_incoming_argument(LocationOfSavedOutgoingArgInSendee(i-1), NULL));
}


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

  void FrameIterator::do_compiled() {
             do_local_registers();
    fint r = do_stack_locations();
             do_above_saved_registers(r);
             do_patched_frame_saved_outgoing_args();
  }
  
  void FrameIterator::do_local_registers() {
    /* scavenge the local registers */
    oop* p = (oop*)f->location_addr(L0);

    for ( fint r = L0; r <= I7;  r++, p++) {
      if (isSet(mask,  r - L0)) {
        oop_closure->do_oop(p);
      }
      else if (zap && !isGloballyAllocatedRegister(Location(r))) {
        *p = badOop;
      }
    }
  }
  
  
  fint FrameIterator::do_stack_locations() {
    sparc_sp* sp = f->my_sp();
    sparc_fp* fp = sp->link();

    /* scavenge the ntraced memory locations */
    /* The first ntraced stack locations are marked by the sendDesc mask;
       scavenge only the ones marked as used */

    oop* end_oop = &sp->as_oops()[top_oop_offset - 1];
    oop* p       = &fp->as_oops()[bottom_oop_offset];

    fint r = NumInRegisters + NumLocalRegisters;
    int ntraced = BitsPerWord - r;
    int traced_oop_count = min(p - end_oop,  ntraced);
    int endBit = r + traced_oop_count;

    assert(p >= end_oop, "stack frame too small??");
    for (  ;  r < endBit;  ++r, --p) {
      if (isSet(mask, r)) {
        oop_closure->do_oop(p);
      } else if (zap) {
        *p = badOop;
      }
    }
    /* scavenge the untraced stack locations */

    for (  ;   p > end_oop;   --p )
      oop_closure->do_oop(p);
      
    return r;
  }
  
  
  void FrameIterator::do_above_saved_registers(fint r) {

    /* Since Self never uses the 7 words above the saved regs (C stuff),
       let's check that the register mask does not claim they are live,
       and let's zap 'em.
    */
    # if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions)
        for ( ;  r < BitsPerWord;  ++r )
          assert(!isSet(mask, r),
                "mask says a word in callee reg args or aggr ret is live");
    # endif
    if (zap) {
      sparc_sp* sp = f->my_sp();
      oop* p = &sp->as_oops()[NumInRegisters + NumLocalRegisters];
      oop* end_oop = &sp->as_oops()[WindowSize];
      for ( ;  p < end_oop;  ++p)  *p = badOop;
    }
  }                             
# endif
