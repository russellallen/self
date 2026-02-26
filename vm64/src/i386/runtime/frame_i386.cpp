# if  TARGET_ARCH == I386_ARCH || TARGET_ARCH == X86_64_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "frame_i386.hh"

# include "_frame_i386.cpp.incl"


frame* frame::sender() { return my_sp()->link()->as_frame();  }

char**  frame::real_return_addr_addr() { return my_sp()->return_addr_addr();  }

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

  if ( r == NULL || Memory->code->contains(r))
    return NULL;
  char* callp = r - 1;
  if (!isImmediateCall((inst_t*)callp)) return NULL;
  return  get_target_of_C_call_site((inst_t*)callp);
}

# pragma warn_unusedarg off

frame** frame::nmethod_frame_chain_addr(nmethod* nm) { 
  return (frame**)my_bp() + nmethod_frame_chain_offset;
}


objVectorOop* frame::patched_frame_saved_outgoing_args_addr(nmethod* nm) { 
  return (objVectorOop*)my_bp() + patched_frame_saved_outgoing_args_offset; 
}


char**  frame::currentPC_addr() { 
  return (char**)my_bp() + current_pc_offset;
}
 
 
// this may not be a self frame ????
oop*  frame::location_addr_of_incoming_argument(Location r, RegisterLocator* rl) { 
  oop* bp = (oop*)my_bp();
  if (r == IReceiverReg)
    return bp + ircvr_offset;
  assert(is_IArgLocation(r), "???");
  fint i = index_for_IArgLocation(r);
  return bp + first_iarg_offset + i;
} 

 
void**  frame::location_addr(Location r, RegisterLocator* rl) {
  Location base; int32 d; OperandType t;
  reg_disp_type_of_loc(&base, &d, &t, r);
  assert(t != RegisterOperand, "???");
  return (base == esp ? (void**)my_sp() : (void**)my_bp())  +  d / oopSize;
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
  if (SpendTimeForDebugging)
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
  
  i386_sp* osp =                     my_sp(); // this frame
  i386_sp* nsp = first_copied_frame->my_sp(); // copied frame's this
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
  my_sp()->set_link((i386_sp*)sp);
  set_real_return_addr(pc);
}
 
// I386 uses bp for block home, but sp for frame*
/* Here's the deal:
   SPARC uses bp cause sp is not constant.
   This makes the VM work harder to find the block_scope (home method's frame)
   from what is stored in the block (home method's caller's frame).
   See, the home method's frame is the sp of the frame but the sp can vary, while the frame pointer cannot.
   So we store the frame pointer of the home frame in the block and crawl the stack to recover the stack pointer
   when needed by the VM.
   PPC uses the sp, which saves a lot of work.
   Intel COULD use the sp, because it doesn't change.
   BUT, at block creation time (see loadBlockOop in codeGen_i388.cpp), we have the sp BEFORE
   pushing the pc and old base pointer, so would have to subtract 8 from what we have to create the block.
   That isn't so bad, but then at NLR time, would have to compare what is in the NLRHomeReg to sp-8, would be slower.
   So for Intel, use the base pointer (frame pointer) as SPARC does.
   Could revisit this, use the sp, and just add 8 when setting the NLRHomeReg.
   Cannot use the sp+8 value in the block because the VM expects this to be a frame in various places.
   -- dmu 4/25/06
*/   

frame* frame::block_scope_of_home_frame() {
# if TARGET_ARCH == X86_64_ARCH
  // On x86_64 interpreter-only builds, the interpret() frame IS both
  // the home frame and the block scope — there are no separate JIT Self frames.
  return this;
# else
   return sender();
# endif
}

frame* frame::home_frame_of_block_scope(frame* currentFrameHint) {
# if TARGET_ARCH == X86_64_ARCH
  // On x86_64 interpreter-only builds, the block scope IS the home frame.
  Unused(currentFrameHint);
  return this;
# else
  return sendee(currentFrameHint);
# endif
}


frame* frame::home_frame_of_vfo_locals(frame* currentFrameHint) {
  return this; }

frame* frame::vfo_locals_of_home_frame() { return this; }

int32 frame::frame_size_of_uncopied_frame() { return (oop*)sender() - (oop*)this; }

char* frame::c_return_pc() {  
  return return_addr(); 
}

frame* frame::make_full_frame(char* pc)            {  
  return this; 
}
frame* frame::make_full_frame_after_trap(char* pc) {  
  return (frame*)
       (smi(this)
    -   ((smi(this) - frame_alignment_offset*oopSize) & (frame_word_alignment*oopSize - 1)));
}
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
// basically used for printing (tracing)
// "this" is the LOOKUP FRAME, doing the sending
oop frame::get_lookup_arg(fint index) { 
  return ((oop*)my_sp())[first_iarg_offset + index];
}


void frame::printRegs() {
}


void frame::printVerbose_on_this_platform() {
  warning("unimp intel (debugging only, anyway)");
}


oop* frame::first_incoming_arg_addr() {
  return (oop*)my_bp() + first_iarg_offset;
}

oop* frame::first_local_addr() {
  return (oop*)my_bp() + first_local_offset;
}



sendDesc* frame::send_desc() { 
  return sendDesc::sendDesc_from_return_PC( return_addr());  // it is always the same here
}



// used for scavenging, must return allocated location
//  for every interpreter state class that may exist
//  return IllegalLocation for non-interp frame

Location frame::location_of_interpreter_of_block_scope(void* entry_point) {
  return  entry_point == first_inst_addr(interpret)  
            ?  Location(IArgLocation(0))  
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


void frame::fix_current_return_address(char* ) {  }

oop frame::perform_selector_of_SendMessage_stub_frame() {
  return  ((oop*)sender()->my_sp())[PerformSelectorLoc_sp_offset / oopSize];
}  

# endif // TARGET_ARCH == I386_ARCH
