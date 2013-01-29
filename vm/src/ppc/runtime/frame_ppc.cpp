# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.17 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "frame_ppc.hh"

# include "_frame_ppc.cpp.incl"


frame* frame::sender() { return my_sp()->link()->as_frame(); }
char**  frame::real_return_addr_addr() { return my_sp()->return_addr_addr(); }

char* frame::return_addr() {
  if (!InterruptedContext::the_interrupted_context->is_set())
    return platform_independent_return_addr();
    
  // Profiler uses this from interrupts, but last return address may not be right,
  // so return null.
  if ((frame*)InterruptedContext::the_interrupted_context->sp() == this)
    return NULL;
    
  // C compiler moves sp, but does not save pc for leaves
  if ( InterruptedContext::the_interrupted_context->sp()->sender()  ==  this
  &&   !Memory->code->contains(InterruptedContext::the_interrupted_context->pc()))
    return NULL;
    
  return platform_independent_return_addr();
}

  
// Return the address I was entered at, assuming I am a C++ frame

char* frame::c_entry_point() {
  frame* s = sender();
  if ( s == NULL ) return NULL;
  
  char* r = s->real_return_addr(); // where sender will return into
  
  if ( Memory->code->contains(r))   
    return NULL;
  if ( r == (char*)&SaveNVRet )   {
    // If I was called by a frame that returns into the SaveNV asm stub,
    // then I cannot get the entry point in the usual way, because it was passed into SaveNV
    // via a register. But SaveNV stores this incoming argument (arg5) into its caller's frame
    // following the standard PPC convention.
    return (char*)s->sender()->my_sp()->locals()[SaveNV_fn_arg_index]; 
  }   
  int32* callp = (int32*)r - 1;
  if (callp == NULL  ||  !isImmediateCall(callp)) return NULL;
  return  get_target_of_C_call_site(callp);
}

# pragma warn_unusedarg off

frame** frame::nmethod_frame_chain_addr(nmethod* nm) { 
  return (frame**)first_saved_nonvolatile_register_addr(nm) + nmethod_frame_chain_offset;
}


objVectorOop* frame::patched_frame_saved_outgoing_args_addr(nmethod* nm) { 
  if (nm == NULL)  nm = code();
  return (objVectorOop*)first_saved_nonvolatile_register_addr(nm) + patched_frame_saved_outgoing_args_offset;
}


char**  frame::currentPC_addr() { 
  //  The assert below does not work because it relies on return_address
  //   which checks to see if the real return address is == to
  //   the asm ReturnTrap routines. But if the frame has called the trap
  //   routine which has called C, the return address is in the midst
  //   of the asm routine, and so return address does not realize
  //   it is patched. -- dmu
  //  Also, there is a recursion problem with the assert.
  //  assert(is_compiled_self_frame(), "currentPC only in compiled frame");
  return (char**)this + current_pc_offset;
}
 
 
// this may not be a self frame
oop*  frame::location_addr_of_incoming_argument(Location r, RegisterLocator* rl) { 
  if (is_IArgStackLocation(r)) {
    // stored in sender's frame no matter what
    fint i = arg_index_for_IArgStackLocation(r);
    return &sender()->my_sp()->as_oops()[rcvr_and_argument_offset(i + 1 /* rcvr */)];
  }
  if (is_self_frame()) 
    return rl->address_of(r);
 return location_addr_of_incoming_argument_register(Location(ReceiverReg + IReceiverReg - r));
} 


oop*  frame::location_addr_of_incoming_argument_register(Location r, fint offset) { 
  assert(r == ReceiverReg || isArgRegister(r), "just checking");
  fint o = offset ? offset : volatile_register_sp_or_fp_offset(return_addr());
  if (o == 0)
    fatal1("unexplainable VM frame 0x%x", this);
 return &(o > 0  ?  this  :  sender())->my_sp()->as_oops()[o + r - ReceiverReg];
} 

 
void**  frame::location_addr(Location r, RegisterLocator* rl) { 
  nmethod* nm = code();
  if ( is_ArgStackLocation(r)
  ||   is_IArgStackLocation(r)
  ||   is_StackLocation(r)     )
    return  (void**) ((char*)my_sp() +
                      spOffset(r, nm->frameSize(), nm->max_no_of_outgoing_args_and_rcvr()));
    
  if (isLocalNonVolatileRegister(r)) {  
    if ( nm->are_register_arguments_saved_on_stack()  
         &&  R31 - r  <  nm->incoming_arg_register_count() + 1 /* for rcvr */ ) {
      // This location corresponds to an incoming argument, and
      // since the nic saves these (for methods with blocks) in the caller's frame,
      // we can find it there.
      return (void**)my_sp()->link()->as_oops() + receiver_stack_offset + (R31 - r);
    }
    if (rl != NULL) {
      assert(this == rl->fr(), "");
      return (void**) rl->address_of(r);
    }
    else {
      ResourceMark rm;
      return (void**) RegisterLocator::for_frame(this)->address_of(r);
    }
  }
  fatal("unexpected kind of location");
  return NULL;
}
 
 
// Nmethods that spawn blocks cache their incoming arguments in the 
// saved-argument region of their callers' frames so they can keep these
// values in non-vol regs (instead of memory) while the block accesses them
// via the saved-argument region. (These values are immutable and so can be duplicated.)
//
// But, when performing a Conversion (i.e. deoptimizing a frame) the value needs to
// be placed into both locations. Hence this function, that returns the "other"
// address of location (if there is one).
//
// This routine parallels location_addr above.

void**  frame::location_secondary_addr(Location r, RegisterLocator* rl) { 
  nmethod* nm = code();
  if (is_ArgStackLocation(r)  ||  is_StackLocation(r))
    return  NULL;
    
  if (is_IArgStackLocation(r))
    return  NULL;
    
  if (isLocalNonVolatileRegister(r)) {  
    if ( nm->are_register_arguments_saved_on_stack()  
         &&  R31 - r  <  nm->incoming_arg_register_count() + 1 /* for rcvr */ ) {
      // This location corresponds to an incoming argument, and
      // since the nic saves these (for methods with blocks) in the caller's frame,
      // we can find it there.
      // So, return the SECONDARY address:
      assert(rl != NULL, "cannot cons up rl during a conversion");
      assert(this == rl->fr(), "");
      return (void**) rl->address_of(r);
    }
    return NULL;
  }
  fatal("unexpected kind of location");
  return NULL;
}



// called from recompile.c:
// copy the receiver to the new place and adjust all block homes
// (the receiver must contain references to every live block belonging
// to this frame for zapping purposes)

void frame::copy_to( char* sp,
                     char* caller,
                     char* pc,
                     bool adjust) {

  frame* new_f = (frame*)sp;
  warning("untested frame::copy_to:"); // need SIC to test this

  if (adjust) {
    // make sure all memoized blocks exist, then adjust their scope
    abstract_vframe* callee = NULL;
    OopOopTable* dummy = EMPTY;
    for ( abstract_vframe* vf = new_vframe(this);
          vf  &&  vf->fr == this;
          callee = vf,  vf = vf->sender()) {
      vf->createBlocks(callee, dummy);
    }
    ResourceMark rm; // for RegisterLocators
    adjust_blocks(block_scope_of_home_frame(), new_f, RegisterLocator::for_frame(new_f) );
  }
  copy_oops( (oop*)this, (oop*)new_f, frame_size());

  my_sp()->set_link( ((frame*)caller)->my_sp() );
  set_return_addr( pc );
}
  

// adjust fp of copied frames so they don't refer to the original stack

void frame::adjust_frame_links_of_copied_frames( frame* last_frame_to_copy,
                                                 frame* first_copied_frame) {
  
  ppc_sp* osp =                     my_sp(); // this frame
  ppc_sp* nsp = first_copied_frame->my_sp(); // copied frame's this
  int32 diff = (char*)nsp - (char*)osp;
  
  while ( osp  <  last_frame_to_copy->my_sp() ) {

    nsp->adjust_link(diff);

    osp = osp->link();
    nsp = nsp->link();
  }
  // note last copied link should just be what it was so don't do anything
}

// end of copy() helpers


// From Sparc: Note that the lastFrame frame will never be returned to, so we can
// bash its registers.  But a dummy frame is needed to make the stack
// look right (to serve as the frame of the last sparc_sp).
// (used to be fixStack)


void frame::fix_frame(char* pc, char* sp) { 
  // Although conversion happens in VM process, 
  // currentProcess still says orig Self process.
  // So, unchain_frames which does Stack::first_VM_frame (sp?)
  // will go from current (conversion) frame looking for a self frame.
  // Thus, zap a conversion frame (which we never return from anyway)
  // to lead traversal back to self frame.
  assert(isOnVMStack(this), "will be overwritten");
  my_sp()->set_link((ppc_sp*)sp);
  set_real_return_addr(pc);
}
 
// PPC uses actual SP, since it is stable

frame* frame::home_frame_of_block_scope(frame* hint) { return this; }
frame* frame::block_scope_of_home_frame()            { return this; }

frame* frame::home_frame_of_vfo_locals(frame* hint)  { return this; }
frame* frame::vfo_locals_of_home_frame()             { return this; }


int32 frame::frame_size_of_uncopied_frame() { return (oop*)sender() - (oop*)this; }

char* frame::c_return_pc() {  
  // link reg points to next inst
  return return_addr(); 
}

frame* frame::make_full_frame(char* pc)            {  return this; }
frame* frame::make_full_frame_after_trap(char* pc) {  return this; }
frame* frame::make_full_frame_on_user_stack()      {  return this; }



void frame::print_compiled() {
  if (is_compiled_self_frame())
    lprintf(" chain = %#lx;", (nmethod_frame_chain(code())));
  lprintf("\n\tlocals = [%#lx, %#lx], currPC = %#lx, size = %ld words\n",
         (long unsigned)(my_sp()),
         (long unsigned)(currentPC()),
         long(frame_size()));
}

// 0 = first arg
// basically used for printing
oop frame::get_lookup_arg(fint index) { 
  return *sendee()->location_addr_of_incoming_argument(LocationOfSavedOutgoingArgInSendee(index), NULL);
}


void frame::printRegs() {
  fatal("unimp mac (debugging only, anyway, and cannot call code from mac debugger)");
}


void frame::printVerbose_on_this_platform() {
  fatal("unimp mac (debugging only, anyway, and cannot call code from mac debugger)");
}


// return addr of first (lowest) saved nonvol reg

// pass in nm for correctness;
// when compacting the zone, code() cannot work, since the invariants are broken:
// called by frame::nmethod_frame_chain_addr()
// called by frame::nmethod_frame_chain()
// called by frame::nmethod_moved_by()
// called by nmethod::moveTo_inner
// called by NCodeBase::moveTo
// called by moveInsts
// called by Heap::compact
oop*  frame::first_saved_nonvolatile_register_addr(nmethod* nm) {
  // cannot check is_compiled_frame here, no assert
  return ((oop*)sender()) - nm->number_of_saved_nonvolatile_registers();
}



sendDesc* frame::send_desc() { 
  return sendDesc::sendDesc_from_return_PC( return_addr());  // it is always the same on PPC
}



// used for scavenging, must return allocated location
//  for every interpreter state class that may exist
//  return IllegalLocation for non-interp frame

Location frame::location_of_interpreter_of_block_scope(void* entry_point) {
  return  entry_point == first_inst_addr(interpret)  
            ?  Location(ArgStackLocations + 0)  
            :  IllegalLocation;
}


frame* frame::get_patched_self_frame(char* sp_of_patched_frame) {
  if (Interpret)
    warning("next line may be wrong for interpreter, was currentFrame()->sender()");
  return (frame*)sp_of_patched_frame;
}


int32  frame::copy_through_oop_count(frame* last_frame_to_copy) {
  return (oop*)last_frame_to_copy + last_frame_to_copy->frame_size() - (oop*)this;
}


void frame::fix_current_return_address(char* ) { }

oop frame::perform_selector_of_SendMessage_stub_frame() {
  return  sender()->my_sp()->as_oops()[PerformSelectorLoc_sp_offset / oopSize];
}  

# endif // TARGET_ARCH == PPC_ARCH
