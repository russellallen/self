/* Sun-$Revision: 30.14 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "interpreter.hh"
# include "_interpreter.cpp.incl"


oop sneaky_method_argument_to_interpret;


inline frame* interpreter::block_scope_or_NLR_target() {
  return _block_scope_or_NLR_target 
    ?  _block_scope_or_NLR_target
    :  _block_scope_or_NLR_target
         = currentProcess->last_self_frame(true)->block_scope_of_home_frame();
}

  
// called as a result of inline cache miss in compiled code

oop interpret_from_compiled_sender() {
  // need to invoke sneaky method_argument_to_interpret
  // args are passed in in registers, etc
  fatal("XXX not implemented yet (interp from compiled IC miss)");
  return smiOop_zero;
}
  

void InterpreterLookup_cont( simpleLookup *L, int32 arg_count) {
  L->perform_full_lookup_n(arg_count);
}


inline interpreter::interpreter( oop rcv,
                                 oop sel,
                                 oop del,
                                 oop meth,
                                 oop _mh,
                                 oop* _args,
                                 int32 _nargs)
: abstract_interpreter(meth) {
  
  assert( meth->is_method_like()  &&  !meth->is_assignment(),
          "method must be method");

  
  receiver= rcv;
  selector= sel;
  delegatee= del;
  method_object = meth;
  set_methodHolder( _mh);
  args= _args;
  length_args= _nargs;
  rcvToSend= rcv;
  selToSend= VMString[VALUE]; // just a placeholder
  return_patch_reason= not_patched;
  current_primDesc = NULL;
  _block_scope_or_NLR_target = NULL;
  
  if (mi.map()->kind() == OuterMethodType) {
    setup_for_method();
  }
  else {
    assert( receiver->is_block_with_code(), "receiver must be block" );
    setup_for_block();
  }

    
  // init non-const locals
  // because there is no good way to find the min offset, must
  //   find it here--argh! XXXX
  // must do this AFTER setup_for_block/method cause it may set hasParentLocalSlot
  
  minOffset = smiOop_max->value();
  { // macro needs scope
    FOR_EACH_SLOTDESC(mi.map(), sd) {
      if (sd->is_obj_slot()) {
        minOffset = min(minOffset, smiOop(sd->data)->value());
      }
      if ( !sd->is_vm_slot() && sd->is_parent() )
        hasParentLocalSlot = true;
    }
  }
  if (minOffset == smiOop_max->value())
    minOffset = 0; // so range checks can fail properly

  _length_locals= mi.map()->length_obj_slots();
}


inline int32 interpreter::length_cloned_blocks() { return mi.length_literals; }

inline void  interpreter::set_cloned_blocks(void* p) { 
  cloned_blocks= (oop*)p; 
  for (int32 i = 0;  i < length_cloned_blocks();  ++i)   
    cloned_blocks[i] = NULL;
}


// code length is good guess for stack size

inline void  interpreter::set_stack(void* p) { stack= (oop*)p; }


inline void interpreter::set_locals(void* p) {
  locals = (oop*)p;
  { // macro FOR_EACH_SLOTDESC needs the new C-scope ({})
    FOR_EACH_SLOTDESC(mi.map(), sd) {
      if (sd->is_obj_slot()) {
        set_slot(sd, method_object->get_slot(sd));
      }
    }
  }
}
  

// top-level interpreter routine
// Note: callers must arrange for _args to be scavenged, etc

oop interpret( oop rcv,
               oop sel,
               oop del,
               oop meth,
               oop _mh,
               oop* _args,
               int32 _nargs) {
  
  interpreter interp(rcv, sel, del, meth, _mh, _args, _nargs);

  interp.set_cloned_blocks( alloca(interp.length_cloned_blocks() * sizeof(oop)));
  interp.set_stack (        alloca(interp.length_stack()         * sizeof(oop)));
  interp.set_locals(        alloca(interp.length_locals()        * sizeof(oop)));

  ((interpreter*)save1Arg(&interp))->interpret_method();
  return interp.top();
}


void interpreter::setup_for_method() {
  self = receiver;
  hasParentLocalSlot = false;
  parentI = NULL;
}


void interpreter::setup_for_block() {
  blockOop b = blockOop(receiver);
  if ( ! b->is_live() ) {
    currentProcess->nonLifoError();
  }
  interpreter* p;
  p = b->scope()->get_interpreter_of_block_scope();
  if (p) { // parent is interp
    parentI = p;
    self = p->self;
    _methodHolder = p->methodHolder();
    // if any enclosing methods (or me) have parents, need to use slower lookup
    hasParentLocalSlot = p->hasParentLocalSlot;
  }
  else {
    parentI = NULL;
    ResourceMark rm; // for vf
    abstract_vframe* vf = parentVF();
    self = vf->self();
    _methodHolder = vf->methodHolder_object();
    hasParentLocalSlot = true; // be conservative
  }
}



void interpreter::interpret_method() {
  
  do {
    sp = 0;
    pc = PrologueBCI;
  
    if (fastPreemptionCheck() /* || PendingSelfSignals::are_any_pending() XXX right? */ ) {
      // save non vol regs cause ctrl C causes abort which NLR's 
      //  through c frames -- dmu 1/96
      SaveNonVolRegsAndCall0(interruptCheck);
      if (NLRSupport::have_NLR_through_C()) {
        continue_NLR();
        stack[sp++] = NLRSupport::NLR_result_from_C();
        pc= return_pc();
      }
    }
    pc = mi.firstBCI();
    abstract_interpreter::interpret_method();
  } while ( pc == restart_pc() + 1); // interpret_method incremented it

  // zap blocks
  for ( oop* cb = cloned_blocks;  
        cb < cloned_blocks + mi.length_literals;  
        cb++ ) {
    if (*cb != NULL) {
      assert_block(*cb, "must be a block");
      blockOop(*cb)->kill_block();
    }
  }
}


void interpreter::do_SELF_CODE()  { stack[sp++]= self; }

void interpreter::do_POP_CODE()  { --sp; assert(sp >= 0, "too many pops"); }

void interpreter::do_NONLOCAL_RETURN_CODE() {
  start_NLR(stack[sp - 1]);
  pc= return_pc();
}


void interpreter::do_branch_code( int32 target_PC, oop target_oop ) {
  if ( target_oop != badOop ) { // conditional
    assert(sp > 0, "conditional branch needs stack element");
    if ( stack[--sp] != target_oop )
      return;
  }
  pc = target_PC;
}


void interpreter::do_BRANCH_INDEXED_CODE() {
  assert(sp > 0, "indexed branch needs stack element");
  oop p = stack[--sp];
  if (!p->is_smi())
    return;
  objVectorOop v= get_branch_vector();
  int32 index= smiOop(p)->value();
  if ( 0 <= index  &&  index <= v->length())
    ;
  else
    return;
  
  oop npco= v->obj_at(index);
  pc = smiOop(v->obj_at(smiOop(npco)->value()))->value();
}
 
 
void interpreter::do_literal_code(oop lit) {
  if (lit->is_block()) {
    oop cb = cloned_blocks[is.index];
    if (cb == NULL ) {
      // When mix w/ compiled code may need to clone_and_set_desc(smiOop(0))
      //  to give it new map to avoid false cache hits
      //  No, I think it's OK, cause the COMPILERS change the map
      // Note that this half-frame is recognizable as interp frame,
      //  AND is exactly the right half-frame for getting whole-frame
      //  of top interp frame.
      // If change this, must also change methods in vframe.c

      // XXX too eager, clones fail blocks, and too slow for mixed
      
      cloned_blocks[is.index] = cb =
        blockOop(lit)->clone_block_for_interpreter(block_scope_or_NLR_target());
    }
    lit= cb;
  }
  stack[sp++]= lit;
  assert(stack[sp-1] != badOop,  "no bad oops on the stack");
}


abstract_vframe* interpreter::parentVF() {
  assert_block(receiver, "must be block receiver");
  assert( mi.map()->kind() == BlockMethodType, "must be block method");
  return blockOop(receiver)->parentVFrame(currentFrame());
}

// access a local slot


void interpreter::local_slot_desc( interpreter*& r, 
                                   abstract_vframe*& rvf,
                                   slotDesc*& sd) {
  
  bool flushed = false;
  interpreter* interp = this;
  abstract_vframe* vf = NULL;
  
  for ( fint i = 0;  i < is.lexical_level;  ++i) {
    if ( interp ) 
      if ( interp->parentI )    
        interp = interp->parentI;
      else {
        vf = interp->parentVF();  
        interp = NULL; 
      }
    else {
      vf = vf->parent();
      if ( vf->is_interpreted() )
        interp= vf->as_interpreted()->interp();
    }
  }
  r = interp;
  rvf = vf;
  Map* m =  interp  ?  interp->mi.map() 
                    :  vf->method()->map();
  sd = m->slot(is.index);
}


void interpreter::do_read_write_local_code(bool isWrite) {
  interpreter* interp;
  slotDesc* sd;
  ResourceMark rm; // for vf
  abstract_vframe* vf;
  local_slot_desc(interp, vf, sd);
  assert(interp || vf, "must have vframe if not interpreted");
  if (isWrite) {
    assert(sp > 0, "need argument to write");
    if (interp)   interp->set_slot(sd, stack[--sp]);
    else          vf    ->set_slot(sd, stack[--sp]);
    stack[sp++] = self;
  }
  else 
    stack[sp++] = interp  ?  interp->get_slot(sd)  
                          :  vf    ->get_slot(sd);
}

 
void interpreter::do_send_code(bool isSelfImplicit, stringOop selector, fint arg_count) {
  LookupType type;
  
  if      ( !isSelfImplicit )          type =         NormalLookupType;
  else if ( is.is_undirected_resend)   type =         ResendLookupType;
  else if ( is.delegatee != NULL)      type = DirectedResendLookupType;
  else                                 type =   ImplicitSelfLookupType;
        
      
  if (selector == VMString[_RESTART])
    pc= restart_pc();
  else {
    selToSend= selector;
    send(type, is.delegatee, arg_count);
    assert(stack[sp-1] != badOop  ||  NLRSupport::have_NLR_through_C(),
           "no bad oops on the stack");
    if (NLRSupport::have_NLR_through_C()) {
      continue_NLR();
      pc= return_pc();
    }
  }
}


void interpreter::block_scope_and_desc_of_home( frame*& block_scope_frame, 
                                                 int32& block_desc) {
  interpreter* interp= this;
  // try fast case first
  frame* f;
  do {
    assert_block(interp->receiver, "must be a block"); 
    f = blockOop(interp->receiver)->scope();
    interp= f->get_interpreter_of_block_scope();
  } while ( interp  &&  interp->mi.map()->kind() == BlockMethodType );
  
  if (interp) {
      block_scope_frame= f;
      block_desc = BLOCK_PROTO_DESC->value();
  }
  else {
    ResourceMark rm; // for vf
    abstract_vframe* vf = blockOop(interp->receiver)->parentVFrame(currentFrame())->home();
    block_scope_frame = vf->fr->block_scope_of_home_frame();
    block_desc = vf->scopeID();
  }
}
  
  
void interpreter::start_NLR(oop res) {
  // is receiver block?
  if ( method_object->map()->kind() == OuterMethodType )
    return;
  frame* block_home_scope_frame;
  int32  block_home_desc;
  if (CatchInterprocessReturns)
    catch_interprocess_returns(receiver);
  block_scope_and_desc_of_home( block_home_scope_frame, block_home_desc);
  NLRSupport::save_NLR_results( res,  int32(block_home_scope_frame),  block_home_desc);
}


void interpreter::continue_NLR() {
  if ((int32)block_scope_or_NLR_target() == NLRSupport::NLR_home_from_C()) {
    // this is the home frame (mixed) of the block
    NLRSupport::reset_have_NLR_through_C();  // home, that's it
  }
}


void interpreter::send(LookupType type, oop delOrNameToSend, fint arg_count ) {

  assert_string(selToSend, "better be string");

  // NormalLookupType means rcvr is on stack
  
  rcvToSend = type == NormalLookupType ? stack[sp - arg_count - 1] : self;
  
  if (mi.instruction_set != TWENTIETH_CENTURY_PLUS_ARGUMENT_COUNT_INSTRUCTION_SET)
    arg_count = stringOop(selToSend)->arg_count(); // XXXX slow, fix w/ lookup cache 
  
  int32 resSP = sp - arg_count - (type == NormalLookupType);
    
  oop res;
  for (;;) {

    res =
        stringOop(selToSend)->is_prim_name()
        ? send_prim()
        : lookup_and_send( type, methodHolder(), delOrNameToSend);
    

    if (!is_return_patched())
      break;
    if (get_return_patch_reason() == patched_for_profiling) {
      break; // don't handle profiling interp yet XXX
    }
    // save non vol regs because HandleReturnTrap can call convert which
    //  can call continueNLRAfterReturnTrap which (I think) cuts back the stack
    // -- dmu 2/96

    SaveNonVolRegsAndCall5( HandleReturnTrap,
                            NLRSupport::have_NLR_through_C() ? NLRSupport::NLR_result_from_C() : stack[sp-1],
                            (char*)currentFrame(),
                            NLRSupport::have_NLR_through_C(),
                            (frame*)NLRSupport::NLR_home_from_C(),
                            NLRSupport::NLR_home_ID_from_C());
    if (!restartSend)
      break;
  }
  stack[resSP] = res;
  sp = resSP + 1; // sp points one past top
}



oop interpreter::send_prim() {
  
  bool hasFailBlock = false;
  assert_string(selToSend, "must be a string by now");
  if ( stringOop(selToSend)->has_IfFail() ) {
    selToSend = stringOop(selToSend)->without_IfFail();
    hasFailBlock = true;
  }
  
  oop res;
  
  bool is_perform;
  res = try_perform_prim( hasFailBlock, is_perform );
  if (is_perform ||  NLRSupport::have_NLR_through_C()) return res;
  
  current_primDesc = ::getPrimDescOfSelector(stringOop(selToSend));

  /* (see runtime.h) was:
    res = CallPrimitiveFromInterpreter( first_inst_addr(current_primDesc->fn()),
                                        rcvToSend,
                                        &stack[sp - arg_count],
                                        arg_count - (hasFailBlock == true));
  */
  
  res = SaveNonVolRegsAndCall4 ( CallPrimitiveFromInterpreter,
                                 (void*)first_inst_addr((void*)current_primDesc->fn()),
                                 rcvToSend,
                                 &stack[sp - arg_count],
                                 arg_count - (hasFailBlock == true));
  
  if (NLRSupport::have_NLR_through_C()) { // for tests unwindProtectFn2
    return NLRSupport::NLR_result_from_C(); // might be returning badOop if killing proc
  }
  current_primDesc = NULL;
  if (!res->is_mark())
    return res;
    
  // cope with failure:
  
  res = res->memify(); // cvt to string
  assert_string(res, "prim fail must return string");

  if (hasFailBlock) rcvToSend = stack[sp-1];
  
  sp -= arg_count;
  stack[sp++] = res;
  stack[sp++] = selToSend;
  arg_count = 2;

  selToSend = VMString[
                       hasFailBlock
                       ? VALUE_WITH_
                       : PRIMITIVE_FAILED_ERROR_NAME_];
  
  return lookup_and_send( NormalLookupType,
                          rcvToSend,
                          NULL);
}


// do the perform, return result, set is_perform if is a perform

oop interpreter::try_perform_prim( bool hasFailBlock,
                                   bool& is_perform ) {            
  assert_string(selToSend, "must be a string");
  char* sel = stringOop(selToSend)->bytes();
  fint performKeywordLen = 0;
  bool isResend = false;
  LookupType t;
  if (stringOop(selToSend)->has__Perform__prefix()) {
    performKeywordLen = 9;
    t = NormalPerformType;
  } else if (stringOop(selToSend)->has__PerformResend__prefix()) {
    performKeywordLen = 15;
    isResend = true;
    t = ResendPerformType;
  } else  {
    is_perform = false;
    return smiOop_zero;
  }
  is_perform = true;
    
  selToSend = stack[sp - arg_count];  --arg_count;
  oop delToSend = NULL;
  if ( strncmp(sel + performKeywordLen, "DelegatingTo:", 13) == 0) {
    performKeywordLen += 13;
    t = DelegatedPerformType;
    delToSend = stack[sp - arg_count]; --arg_count;
  }
  
  if ( hasFailBlock) --arg_count, --sp; // ignore perform fail block
  return lookup_and_send( t, rcvToSend, delToSend );
}


oop interpreter::lookup_and_send( LookupType type,
                                         oop mh,
                                         oop delOrNameToSend ) {
  ResourceMark rm; // for sub-objects of L and vf
  // since we come here from perform, selToSend may not be a string!
   
  if (UseLocalAccessBytecodes && !hasParentLocalSlot) {
    simpleLookup L( type,
                    rcvToSend,
                    selToSend,
                    delOrNameToSend,
                    mh );
    
    // XXXXXX check code table, use compiled method, get compiler to call me

    switchToVMStack_intSend( &L, arg_count, InterpreterLookup_cont);
    if (NLRSupport::have_NLR_through_C()) { // recursive lookup error 
      return NLRSupport::NLR_result_from_C();
    }
    return  L.evaluateResult(&stack[sp - arg_count], arg_count, NULL);
  }
  else {
    FlushRegisterWindows();
    interpreted_vframe ivf(currentProcess->last_self_frame(true));
    vframeLookup L( type,
                    rcvToSend,
                    selToSend,
                    delOrNameToSend,
                    mh,
                    &ivf,
                    NULL,
                    NULL);
                  
    // XXXXXX check code table, use compiled method, get compiler to call me

    /* see runtime.h for explanation of SaveNonVol...
       used to be:
       switchToVMStack_intSend( (simpleLookup*)&L, arg_count, InterpreterLookup_cont);
    */
    SaveNonVolRegsAndCall3( switchToVMStack_intSend, 
                            (simpleLookup*)&L, 
                            arg_count, 
                            InterpreterLookup_cont);
                            
    if (NLRSupport::have_NLR_through_C()) { // recursive lookup error 
      return NLRSupport::NLR_result_from_C();
    }
  
    return L.evaluateResult(&stack[sp - arg_count], arg_count, NULL);
  }
  return NULL; // silence compiler
}


oop interpreter::get_slot(slotDesc* sd) {
  if (sd->is_map_slot())  
    return method_object->get_slot(sd);
  int32 off = smiOop(sd->data)->value();
  if (sd->is_arg_slot()) {
    assert( off < length_args,  "offset too big");
    return args[off];
  }
  off -= minOffset;
  assert( off  <  length_locals(),  "offset too big");
  return locals[off];
}
  

void interpreter::set_slot(slotDesc* sd, oop x) {
  int32 off = smiOop(sd->data)->value();
  off -= minOffset;
  assert( off  <  length_locals(),  "offset too big");
  locals[off] = x;
}


void interpreter::print() {
  lprintf("Interpreter state:\n");
  lprintf("\n\trcv: ");  receiver->print_oop();
  lprintf("\n\tself: "); self->print_oop();
  lprintf("\n\tsel: ");  selector->print_oop();
  if (delegatee != NULL) { lprintf("\n\tdel: ");  delegatee->print_oop(); }
  abstract_interpreter::print();
  lprintf("\n\tmethodHolder: ");  methodHolder()->print_oop();
  lprintf("\n\tpc: %d", pc);

  int i;
  FOR_EACH_SLOTDESC(mi.map(), sd) {
    if (sd->is_arg_slot()) {
      lprintf("\n\t:"); sd->name->print_oop();  lprintf(" = ");
      get_slot(sd) -> print_oop();
    }
    else if (sd->is_obj_slot()) {
      lprintf("\n\t"); sd->name->print_oop();  lprintf(" = ");
      get_slot(sd) -> print_oop();
    }
  }
  for (i = 0;  i < mi.length_literals;  i++) {
    if (cloned_blocks[i] != NULL) {
      lprintf("\n\tcloned_blocks[%d] = ", i); cloned_blocks[i]->print_oop();
    }
  }
  for (i = 0;  i < sp;  i++) {
    lprintf("\n\tstack[%d] = ", i); stack[i]->print_oop();
  }
  lprintf("\n\trcvToSend: "); rcvToSend->print_oop();
  lprintf("\n\tselToSend: "); selToSend->print_oop();
}

// XXX look at these:
// all 4 sends
// sending to interp
// sending to native

// nl return
//   must zap blocks when method returns
//   must check id, continue or not

// primitives
//   incl stack check,

// lookup caching, no stack switching


// spy

