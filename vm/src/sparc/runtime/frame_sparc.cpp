/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "frame_sparc.hh"

# include "_frame_sparc.cpp.incl" 


// things in the various pieces:

frame** frame::nmethod_frame_chain_addr(nmethod* /*unused for sparc*/) {
  assert(is_compiled_self_frame(), "frame link only in compiled frame");
  return my_fp()->nmethod_frame_chain_addr(); 
}

objVectorOop* frame::patched_frame_saved_outgoing_args_addr(nmethod* /* unused for sparc */) {
  return my_fp()->patched_frame_saved_outgoing_args_addr(); 
}

char**  frame::currentPC_addr() { 
  //  The assert below does not work because it relies on return_address
  //   which checks to see if the real return address is == to
  //   the asm ReturnTrap routines. But if the frame has called the trap
  //   routine which has called C, the return address is in the midst
  //   of the asm routine, and so return address does not realize
  //   it is patched. -- dmu
  //  assert(is_compiled_self_frame(), "currentPC only in compiled frame");
  //  Also, there is a recursion problem with the assert.
  return my_fp()->currentPC_addr(); 
}

  
// this may not be a self frame
oop*  frame::location_addr_of_incoming_argument(Location r, RegisterLocator* /*rl*/) { 
 return (oop*)location_addr(r);
} 


// real return address, where the pc for returning TO ME is

char**  frame::real_return_addr_addr() {
  return callees_sp()->return_addr_addr(); 
}

char* frame::return_addr() {
  return platform_independent_return_addr();
}


// registers

void** frame::location_addr(Location r, RegisterLocator*) {
  return
    isInFrame(r)
    ?      my_sp()->location_addr( r )
    : callees_sp()->location_addr( IRegisterFromORegister[r] ); }



// called from recompile.c:
// copy the receiver to the new place and adjust all block homes
// (the receiver must contain references to every live block belonging
// to this frame for zapping purposes)

void frame::copy_to( char* sp,
                     char* caller,
                     char* pc,
                     bool adjust) {

  sparc_sp *new_sp = (sparc_sp*)sp;

  if (adjust) {
    // make sure all memoized blocks exist, then adjust their scope
    abstract_vframe* callee = 0;
    OopOopTable* dummy = EMPTY;
    for ( abstract_vframe* vf = new_vframe(this);
          vf  &&  vf->fr == this;
          callee = vf,  vf = vf->sender()) {
      vf->createBlocks(callee, dummy);
    }
    frame* new_f = new_sp->as_callers_frame();
    ResourceMark rm; // for RegisterLocator
    adjust_blocks(block_scope_of_home_frame(), new_f, RegisterLocator::for_frame(new_f));
  }
  copy_oops(my_sp()->as_oops(), new_sp->as_oops(), frame_size());

  new_sp->set_link( (sparc_fp*) caller );
  new_sp->set_return_addr( pc );
}
  

// adjust fp of copied frames so they don't refer to the original stack

void frame::adjust_frame_links_of_copied_frames( frame* last_frame_to_copy,
                                                 frame* first_copied_frame) {
  
  sparc_sp* osp =                     callees_sp();
  sparc_sp* nsp = first_copied_frame->callees_sp();
  int32 diff = (char*)first_copied_frame - (char*)this;
  
  while ( osp  <=  last_frame_to_copy->my_sp() ) {

    nsp->adjust_link(diff);

    osp = osp->link()->as_callers_sp();
    nsp = nsp->link()->as_callers_sp();
  }
  // note last copied link should just be what it was so don't do anything
}

// end of copy() helpers


// stack operations

frame* frame::home_frame_of_block_scope(frame* currentFrameHint) {
  return sendee(currentFrameHint); }

frame* frame::block_scope_of_home_frame() { return sender(); }

frame* frame::home_frame_of_vfo_locals(frame* currentFrameHint) {
  return sendee(currentFrameHint); }

frame* frame::vfo_locals_of_home_frame() { return sender(); }

frame*  frame::sender() { return my_sp()->as_callers_frame(); }


// Receiver is last frame in the stack.
// Set lastFrame's return address / FP register.
// This is typically used when manipulating the stack during conversions
// to make stack traversals work out (i.e. connect VM stack to Self stack).
// (The last Self activation only has a sparc_sp; need to add a fake
// vm sparc_sp below it so we can refer to the full frame.)
// Note that the lastFrame frame will never be returned to, so we can
// bash its registers.  But a dummy frame is needed to make the stack
// look right (to serve as the frame of the last sparc_sp).
// (used to be fixStack)

void frame::fix_frame( char* pc, char* sp) {
  FlushRegisterWindows();
  assert(isOnVMStack(this), "will be overwritten");
  callees_sp()->set_link((sparc_fp*)sp);
  set_real_return_addr(pc);
}


int32 frame::frame_size_of_uncopied_frame() {
  oop* sl = my_fp()->as_oops();
  oop* l =  my_sp()->as_oops();
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      assert(sl > l || isOnVMStack(l) && !isOnVMStack(sl),
               "frame size cannot be zero or negative!");
          // NB: C frames can have neg. size: top frame on VM stack
      if (is_compiled_self_frame()) {
        int32 rf = sl - l;
        int32 nf = code()->frameSize();
        if (rf != nf && !ConversionInProgress) {
          fatal3("frame %#lx: wrong size: nmethod says %ld, really is %ld",
                 this, nf, rf);
        }
      }
    }
# endif
  return sl - l; 
}



// Return the address I was entered at, assuming I am a C++ frame
//  Since sparc frames are one below the sp (to access saved outs)
//  will have to go to up 1 to access saved ins (%i7).

char* frame::c_entry_point() {
  frame* s = sender();
  if ( s == 0 ) return 0;
  char* r = s->real_return_addr(); // where sender will return into
  if (Memory->code->contains(r)) return 0;
  int32* callp = (int32*) r;
  if (callp == 0  ||  !isCall(callp)) return 0;
  return (char*)getCallImm(callp);
}

// for a C frame, here is the address in me to return to

char* frame::c_return_pc() {
  // 2 words: the call, the delay slot
  return return_addr() + 8;
}


// called after a trap, makes a full frame

frame* frame::make_full_frame_after_trap(char* pc) {
  FlushRegisterWindows();
  return make_full_frame(pc);
}


frame* frame::make_full_frame(char* pc) {
  return callees_sp()->push_new_sp(pc)->as_callers_frame();
}


// if frame crosses stacks (VM stack --> user stack);
//  create a dummy frame on user stack

frame* frame::make_full_frame_on_user_stack() {
  if (!isOnVMStack(this))
    return this;
  
  assert(!isOnVMStack(my_sp()), "must cross stacks");

  return  my_sp()->push_new_sp(return_addr(), 0, false)
            -> as_callers_frame();
}


void frame::print_compiled() {
  if (is_compiled_self_frame())
    lprintf(" chain = %#lx;", nmethod_frame_chain(code()));
  lprintf("\n\tlocals = [%#lx, %#lx], currPC = %#lx, size = %ld words\n",
         (long unsigned)(my_sp()),
         (long unsigned)(my_fp()),
         (long unsigned)(currentPC()),
         long(frame_size()));
}


oop frame::get_lookup_arg(fint index) {
  frame* f = sendee();
  fint offset = spOffset(IArgLocation(index), f->frame_size()) / oopSize;
  return callees_sp()->as_oops()[offset];
}


void frame::printRegs() {
  sparc_sp *sp= my_sp();
  
  const fint step = 4;
  fint i= 0;
  for (Location l= L0;  l <= I7;  i++, l= Location(l+1)) {
    int32* p= (int32*)location_addr(l);
    if (i % step == 0) {
      lprintf("%#0lx ", p);
      printLocation(l);
      lprintf("-");
      printLocation(Location(l+step-1));
      lprintf(": ");
    }
    lprintf("%#10x", (void*)*p);
    if ((i + 1) % step == 0) lprintf("\n");
  }
}


void frame::printVerbose_on_this_platform() {
  // print stackTemps
  oop* first=      &my_sp()->as_oops()[top_oop_offset];
  oop* last=  &callees_sp()->as_oops()[bottom_oop_offset];
  Location t = Location(StackLocations + (last - first));
  oop* temp = first;
  while (temp <= last) {
    lprintf("%#9lx: ", temp);
    fint excess_of_4 = (t - StackLocations) & 3;
    fint n = excess_of_4 ? excess_of_4  : 3;
    if (temp == last) n = 0;
    printLocation(t); lprintf("-"); printLocation(Location(t - n));lprintf(": ");
    for (fint i = 0; i <= n; i++, temp++) {
      lprintf("%s%#10lx", i ? "\t" : "", *temp);
    }
    lprintf("\n");
    t = Location(t - (n + 1));
  }
}



sendDesc* frame::send_desc() { 
  assert(RecompilationInProgress  ||  is_self_frame(), "Only Self frames have sendDescs");
  
  if (is_interpreted_self_frame())
    return sendDesc::sendDesc_from_return_PC( return_addr()); // for Conversion::convert (& new_dummy_vframe)
    
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

  int32* callp = (int32*)sendDesc::sendDesc_from_return_PC( return_addr())->call_instruction_addr();

  if (!isCall(callp)) {
    callp--;                // prim frames get ret pc bumped so C can return
  }
  if (!isCall(callp)) {   // nlr code
    callp -= 2;             // 2 instructions
    if (!isCall(callp)) {
      // usually an error, but some callers tolerate it so don't break here
      return 0;
    }
  } else if (isCall(callp - 2)) {
    // the "call" might be the register mask of a send/prim call
    return slow_send_desc(callp);
  }
  // assert(((sendDesc*)callp)->verify(), "doesn't verify");
  // wouldn't always work (e.g. during GCs)
  return sendDesc::sendDesc_from_call_instruction(callp); 

# else

  ShouldNotReachHere(); // compiled frame but no compiler?
  return 0;

# endif
}


  
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)


sendDesc* frame::slow_send_desc(int32* callp) {
  // The instruction at callp looks like a call, but it could be the register
  // mask of a sendDesc at callp - 2.  Figure out which one is the true call.
  nmethod* nm = code();
  int32 offset2 = (char*)callp - nm->insts();
  int32 offset1 = offset2 - 2*oopSize;
  addrDesc *l, *end;
  for (l = nm->locs(), end = nm->locsEnd(); l->offset() < offset1; l++)
    ;
  assert(l < end, "didn't find sendDesc");
  if (l->offset() == offset1) {
    // offset1 must be a call, but maybe offset2 is, too (then offset1 must
    // be a two-instruction prim call)
    assert(l->isCall(), "not a call");
    if (l < end - 1 && l[1].offset() == offset2 && l[1].isCall()) {
      return sendDesc::sendDesc_from_call_instruction(callp);
    }
    return sendDesc::sendDesc_from_call_instruction(callp - 2);
  } else if (l->offset() == offset2) {
    assert(l->isCall(), "not a call");
    return sendDesc::sendDesc_from_call_instruction(callp);
  } else {
    fatal("call must be either at offset1 or at offset2");
    return 0;
  }
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)


// used for scavenging, must return allocated location
//  for every interpreter state struct that may exist
//  return IllegalLocation for non-interp frame

Location frame::location_of_interpreter_of_block_scope(void* entry_point) {
  return  entry_point == first_inst_addr(interpret)  
            ?  CReceiverReg
            :  IllegalLocation;
}


frame* frame::get_patched_self_frame(char* /*sp_of_patched_frame*/ ) {
  // sparc: currentFrame = HRT's sp, sender = ReturnTrap's SP, which is frame of patched_self_frame
  // (recall that frames are sp of callee in SPARC)
  return sender();
}


int32  frame::copy_through_oop_count(frame* last_frame_to_copy) {
  return  (oop*)last_frame_to_copy->my_fp() - (oop*)this;
}


void frame::fix_current_return_address(char* addr) {
  sender()->set_real_return_addr(addr);
}


oop frame::perform_selector_of_SendMessage_stub_frame() {
  return *(oop*)callees_sp()->location_addr(nonvolatile_selector_for_performs);
}  


