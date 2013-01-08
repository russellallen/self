/* Sun-$Revision: 30.13 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "conversion.hh"
# include "_conversion.cpp.incl"


void Conversion::doit() {
  if (VerifyBeforeConversion) Memory->verify();
  FlushRegisterWindows();
  lastFrame = currentFrame()->sender();
  convert();
  if (VerifyAfterConversion) Memory->verify();
  returnToSelf(result, sp, nlr, nlrHome, nlrHomeID, sd, isInterpreting);
  ShouldNotReachHere(); 
}




void Conversion::fixConversionStack(pc_t pc, char* sp_) {
  assert(isOnVMStack(lastFrame), "will be overwritten");
  lastFrame->fix_frame( pc, sp_);
}


void Conversion::convert() {
  // Convert the convertFrame into a sequence of frames (with one scope per
  // frame, i.e. no inlining).  Frame must be bottommost frame on stack. 
  
  // do not need ResourceMark (for RegisterLocator) because ConvertFrame has it
  convertFrame = currentProcess->last_self_frame(true, &convertFrame_rl);

  if (isInterpreting) {
    // already interpreted frame
    vdepth = 0;
    sd = convertFrame->send_desc();
    convertFrame_rl = NULL; // deallocating it
    return;
  }
  
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

  stk = currentProcess->stack();
  char* returnPC = convertFrame->currentPC();
  convertNM = convertFrame->code();
  EventMarker em("converting frame %#lx nm %#lx", convertFrame, convertNM);
  assert(convertNM->contains(returnPC), "return PC not in nmethod");
    if (convertNM->isValid() && convertNM->isDebug()) {
    // already in debug form
    sd = convertFrame->send_desc();
    vdepth = 0;
    convertFrame_rl = NULL;
    return;
  }
  if (PrintFrameConversion) {
    lprintf("*converting frame %#lx (nmethod %#lx)...",
           (long unsigned)convertFrame, (long unsigned)convertNM);
  }
  
  Memory->code->chainFrames();
  assert(convertNM->frame_chain != NoFrameChain, "should be on stack");
  init();
  convertVFrames();
  finish();
  Memory->code->unchainFrames();

  if (PrintFrameConversion) {
    lprintf("done.\n");
  }  
  assert( ((frame*)sp)->is_aligned(), "should be aligned");
  convertFrame_rl = NULL;
# else // defined(FAST_COMPILER) || defined(SIC_COMPILER)
  ShouldNotReachHere();
# endif
}



# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

void Conversion::build_vfs_to_convert() {
  // build vframe array of frames to convert
  vdepth = convertFrame->vdepth(true);
  vf = NEW_RESOURCE_ARRAY(compiled_vframe*, vdepth+1);
  vf[vdepth] = new_vframe(convertFrame, convertFrame_rl)->as_compiled();
  int32 i;
  for ( i = vdepth-1; i > 0; i--) {
    // when interop w/ interp, immediateSender can return C frame (nil?)
    vf[i] = vf[i+1]->immediateSender()->as_compiled();
    assert(vf[i]->fr == convertFrame, "should be same frame");
  }
}


void Conversion::create_previously_optimized_blocks() {
  // create all blocks which were completely optimized away in convertNM
  blockValues = NULL;
  { abstract_vframe* callee= NULL;
    for (fint i= vdepth; i > 0; i--) {
      vf[i]->createBlocks(callee, blockValues);
      callee= vf[i];
    }
  }
}


void Conversion::retarget_vfs_to_convert(frame* copiedFrame, RegisterLocator* copiedFrame_rl) {
  // build array of vframes to convert (overwrite the optimized vframes)
  vf[vdepth] = new_vframe(copiedFrame, copiedFrame_rl)->as_compiled();
  for (fint i = vdepth-1;  i > 0;  i--) {
    // XXX when interop w/ interp, immediateSender can return C frame (nil?)
    vf[i] = vf[i+1]->immediateSender()->as_compiled();
    assert(vf[i]->fr == copiedFrame, "should be same frame");
  }
}


void Conversion::copy_caller() {
  frame* callerFrame = convertFrame->immediateSelfSender();
  // callerFrame can be NULL e.g. when convertNM = doIt
  // also, callerFrame is only a piece of a frame because we popped the
  // convertLocals; thus we better use a copy of it
  
  // XXXX May get an interpreter frame here, then what?
  
  if (callerFrame == NULL) {
    sd = sendDesc::first_sendDesc();
    nonvols_for_caller = convertFrame_rl->sender()->for_copied_frame(convertFrame->sender());
    vf[0] = NULL;
  }
  else {
    sd = callerFrame->send_desc();
    frame* copied_callerFrame = callerFrame->copy();
    nonvols_for_caller = convertFrame_rl->sender()->for_copied_frame(copied_callerFrame);
    vf[0] = new_vframe(copied_callerFrame, nonvols_for_caller)->as_compiled();
  }
}


void Conversion::init() {
  build_vfs_to_convert();
  create_previously_optimized_blocks();

  oldBlockHome  = convertFrame->block_scope_of_home_frame();
  convertLocals = convertFrame->vfo_locals_of_home_frame();

  // copy the frame to convert
  frame*           copiedFrame    = convertFrame   ->copy();
  RegisterLocator* copiedFrame_rl = convertFrame_rl->for_copied_frame(copiedFrame);
  
  assert(copiedFrame->code() == convertNM &&
         copiedFrame->vdepth(true) == convertFrame->vdepth(true),
         "frame copy doesn't work");

  // pop off the frame to be converted; use copiedFrame for the conversion
  // because the original frame will be overwritten
  sp += copiedFrame->frame_size() * oopSize;    // assume stack grows downwards
  
  retarget_vfs_to_convert(copiedFrame, copiedFrame_rl);

  copy_caller();

  nms   = NEW_RESOURCE_ARRAY(         nmethod*, vdepth+1);
  newVF = NEW_RESOURCE_ARRAY( compiled_vframe*, vdepth+1);
  for (fint i = 0; i <= vdepth; i++) { nms[i] = NULL;  newVF[i] = NULL; }

  newFr = NULL;
}


void Conversion::convertVFrames() {  // convert all vframes
  FlagSetting f1(Inline, false);
    
  for (fint i = 1; i <= vdepth; i++) {
    // generate new (unoptimized) nmethod
    nmethod *newNM = nms[i] = newCodeForVframe(i);
    
    // create new stack frame
    bool wasInInterruptCheck= createFrame(i, newNM);
    fixConversionStack_for_vframe_conversion();
    
    // copy values to new frame
    copyVFrame(i, newNM, wasInInterruptCheck);
  }
}


nmethod* Conversion::newCodeForVframe(fint i) {
  // construct lookup and generate nmethod for vf[i]
  // (cannot repeat lookup because it might find different result)
  oop receiver;
  if (vf[i]->is_interpreted()) {
    receiver = vf[i]->receiver();
  } else {
    NameDesc* rnd = vf[i]->get_receiver_name();
    receiver = vf[i]->get_contents(rnd, false);
    if (receiver->is_block()) {
      if (rnd->isBlockValue() || rnd->isMemoizedBlock()) {
        // wasn't a real block in old frame - must substitute real block now
        blockOop block = blockOop(receiver);
        oop clone = blockValues->lookup(block);
        assert(clone, "should have been cloned");
        assert_block(clone, "should be a block");
        receiver = clone;
      }
    }
  }
  compilingLookup* L= new cacheProbingLookup( receiver,
                                              vf[i]->selector(),
                                              vf[i]->delegatee(),
                                              MH_TBD, // method holder
                                              vf[i-1],
                                              sd, 
                                              NULL, // DIDesc
                                              true,  // need a debug method
                                              // gen reusable iff orig reusable
                                              convertNM->reusable()
                                            );
  // Setting the result this way indicates we don't really want a lookup.
  L->setResult(vf[i]->method(), vf[i]->methodHolder_or_map());
  nmethod *new_nm= L->lookupNMethod();
  assert(new_nm->isDebug(), "must be debug method");
  new_nm->save_frame_chain();   // protect from flushing
  return new_nm;
}


void Conversion::copyVFrame(fint i, nmethod *newNM, bool wasInInterruptCheck) {
  // create the new vframe and copy over the values of its locals etc
  // from the old vframe

  // create new vframe

  ScopeDesc* s= newNM->correspondingScopeDesc(vf[i]->desc);
  assert(s && s->s_equivalent(vf[i]->desc), "not the same scope");
  // When investigating a bug, Michael Abd-El-Malek & I (Dave)
  // thought vf[i]->bci() below should really be vf[i]->real_bci()
  // in order to make a faithful copy (e.g. prolog BCI vs. 0).
  // But, we are too afraid to make this change.
  // Maybe copied vframes are supposed to be different from discovered vframes.
  // Anyway, the rest of the system tolerates 0 for prolog just fine.
  // -- dmu 6/03
  newVF[i] = new compiled_vframe(newFr, newNM, s, vf[i]->bci(), newFrRl );
  // copy values from old to new frame

  abstract_vframe* calleeOrNull = i < vdepth ? vf[i + 1] : NULL;

  // XXXX must redo for interp

  newVF[i]->as_compiled()
    ->copyValuesFrom(vf[i]->as_compiled(), 
                     calleeOrNull->as_compiled(),
                     oldBlockHome,
                     blockValues,
                     i==vdepth && wasInInterruptCheck);
  
  // adjust NLR registers if necessary

  if (nlr && oldBlockHome == nlrHome && vf[i]->scopeID() == nlrHomeID) {
    abstract_vframe* newHome = newVF[i]->home();
    nlrHome = newHome->fr->block_scope_of_home_frame();
    nlrHomeID = newHome->scopeID();
  }
  
  if (PrintFrameConversion2  ||  traceV) {
    lprintf("***old vframe:\n");
    vf[i]->print_frame(i);
    lprintf("***new vframe:\n");
    newVF[i]->print_frame(i);
  }
}


void Conversion::ensure_death_of_conversion_nmethods() {
  fint i;
  for ( i = 1; i <= vdepth; i++) {
    if (nms[i] == NULL) continue;
    assert(nms[i]->is_frame_chain_saved(), "should be set");
    nms[i]->clear_frame_chain();
    // Conversion nmethods are flushed as soon as they are off the stack;
    // they can't be cached because their dependencies are empty since
    // they don't do a lookup.
    // Also, DI methods can't be cached because their debug versions don't
    // have the DI prologue (since the conversion doesn't redo the lookup,
    // it can't rebuild the adeps).
    // (However, debug methods created via the normal lookup process are
    // cached.)
    nms[i]->makeZombie();
  }
  if (!convertNM->isValid()) convertNM->makeZombie();
  convertNM->clear_frame_chain();
}


void Conversion::patch_caller() {
  // reinstall return patch if caller of converted nmethod also needs conversion
  // XXX when interop w/ interp, immediateSender can return C frame (nil?)
  abstract_vframe* sender = newVF[1]->immediateSender();
  if (sender) {
    assert(newVF[1]->fr != sender->fr, "should be a different real frame");
    assert(newVF[1]->fr->sender() == sender->fr, "should be the calling frame");
    if (sender->as_compiled()->code->isInvalid()) {
      sender->fr->patch(newVF[1]->fr, true);
    }
  }
  
}


void Conversion::finish() {
  ensure_death_of_conversion_nmethods();
  fix_new_vfs();
  patch_caller();
 
  // convert old frame's vframeOops
  currentProcess->convertVFrameOops(convertFrame, convertLocals, convertNM,
                                    vdepth,
                                    (abstract_vframe**)vf,
                                    (abstract_vframe**)newVF);
}


char* Conversion::copyArgsAndGetContinuationPC(sendDesc *sd_arg) {
  // work out continuationPC, copy outgoing args
  char *continuationPC;
  nmethod* nm= nmethod::findNMethod(sd_arg);
  PcDesc* pcd= nm->containingPcDescOrNULL((char*)sd_arg);
  assert(pcd, "shouldn't be in prologue");
  continuationPC= nm->insts() + pcd->pc;
  // initialize arguments of pending send / prim call
  // because the call is going to be re-executed
  if (this && vdepth) {
    newVF[vdepth]->copyOutgoingArgs(vf[vdepth], oldBlockHome,
                                    blockValues, false);
  } else {
    // no conversion was necessary, expr stack is still there
  }
  return continuationPC;
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

void Conversion::returnToSelf(oop res, char* self_sparc_fp_or_ppc_sp,
                              bool nlr_arg, frame* nlrHome_arg,
                              int32 nlrHomeID_arg, sendDesc* self_sd,
                              bool isInterpretingArg) {

  // All values are passed on the stack so that we can safely reset
  // the resource mark below ("this" is in the resource area!).
  // Also, this method can be called with this == NULL (in this case, no
  // conversion was performed and we just want to return to the Self
  // program).
  assert(zone::frame_chain_nesting == 0, "frames shouldn't be chained");
  frame* dest_self_fr =
                 this == NULL       ?  currentProcess->last_self_frame(true)
              :  isInterpretingArg  ?  convertFrame  // for interpreter, needs to be the official interp frame
                                    :  fixConversionStack_for_returning_to_self( self_sparc_fp_or_ppc_sp, self_sd );
  
  bool wasUncommon, restartSend;
  int32* uncommonPC;
  currentProcess->prepare_to_return_to_self_after_conversion(dest_self_fr, restartSend, wasUncommon, uncommonPC);
 
  if (  currentProcess->is_done_with_killing_or_deoptimizing(dest_self_fr) ) {
     restartSend = true; // need to restart send at top of stack
     nlr_arg = false;    // peace! stop the senseless killing of innocent frames
     assert(currentProcess->preemptionPending(),  "should stop immediately after send");
  }
  
  if (isInterpretingArg)
    return_to_interpreted_self( dest_self_fr, restartSend,
                                self_sparc_fp_or_ppc_sp,  res, nlrHome_arg,  nlrHomeID_arg);
  else if (nlr_arg)
    nlr_to_compiled_self(res, restartSend, nlrHome_arg, nlrHomeID_arg,
                          self_sd, self_sparc_fp_or_ppc_sp);
  else
    return_to_compiled_self(res, restartSend, nlr_arg,
                            wasUncommon, uncommonPC,
                            dest_self_fr, self_sd,
                            self_sparc_fp_or_ppc_sp);

  ShouldNotReachHere();
}

  
  
// this may be NULL
void Conversion::return_to_interpreted_self(frame* dest_self_fr, bool restartSend,
                                                   char* self_sparc_fp_or_ppc_sp, oop res, frame* nlrHome_arg, int32 nlrHomeID_arg) {
   // a bit slow, for sparc f is just callee of self_sparc_fp_or_ppc_sp, same frame on ppc
    frame* f= currentProcess->stack()
                ->interpreter_frame_for_continuing_from_return_trap();
    assert(f, "must have frame to return to");
    char* continuationPC = f->c_return_pc();
    dest_self_fr->get_interpreter()->set_restartSend(restartSend);
    if (restartSend)
      NLRSupport::reset_have_NLR_through_C();
    ConversionInProgress = false;
    if (this) delete rm; // free all resources
    OutgoingArgsOfReturnTrapOrRecompileFrame = NULL; // done
    ContinueNLRAfterReturnTrap( continuationPC, self_sparc_fp_or_ppc_sp, res, nlrHome_arg, nlrHomeID_arg );
    ShouldNotReachHere();
}
 
// this may be NULL
void Conversion::nlr_to_compiled_self( 
                      oop res, bool restartSend, frame* nlrHome_arg, int32 nlrHomeID_arg,
                      sendDesc* self_sd,
                      char* self_sparc_fp_or_ppc_sp) {

  assert(!restartSend, "cannot be uncommon/killing");
  ConversionInProgress = false;
  if (this) delete rm; // free all resources

  # if defined(FAST_COMPILER) || defined(SIC_COMPILER)
    char* continuationPC = (char*)self_sd + sendDesc::non_local_return_offset;
    OutgoingArgsOfReturnTrapOrRecompileFrame = NULL; // done with this
    ContinueNLRAfterReturnTrap( continuationPC, self_sparc_fp_or_ppc_sp, res, nlrHome_arg, nlrHomeID_arg );
  # endif
  ShouldNotReachHere();
}


// this may be NULL
void Conversion::return_to_compiled_self( 
                    oop res, bool restartSend, bool nlr_arg,
                    bool wasUncommon, int32* uncommonPC,
                    frame* dest_self_fr, sendDesc* self_sd,
                    char* self_sparc_fp_or_ppc_sp) {

  # if !defined(FAST_COMPILER) && !defined(SIC_COMPILER)
    ShouldNotReachHere(); return 0;
  # else

    char* continuationPC;
    if (restartSend)
      setup_compiled_restart( continuationPC, res, nlr_arg, self_sd, wasUncommon, uncommonPC);
 
    else if (self_sd->isPrimCall()) {
      // not a real inline cache but a primitive call
      // continue after prim call
      char* fn_start = self_sd->jump_addr();
      continuationPC = (char*)self_sd + getPrimCallEndOffset(fn_start);
    }
    else {
      assert(self_sd->verify(), "should be a sendDesc");
      continuationPC = (char*)self_sd + self_sd->endOffset();
    }
    
    ConversionInProgress = false;
    if (this) delete rm; // free all resources

    assert(Byte_Map_Base() == Memory->remembered_set->byte_map_base(),
           "byte map base reg corrupted");
    LOG_EVENT1("continuationPC=%#lx", continuationPC);
    continue_after_return_trap_with_result(res, continuationPC, self_sparc_fp_or_ppc_sp);

  # endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
}


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

void Conversion::setup_compiled_restart( char*& continuationPC,
                                         oop&   res,
                                         bool nlr_arg,
                                         sendDesc* sd_arg,
                                         bool wasUncommon,
                                         int32* uncommonPC ) {
  if (sd_arg->isPrimCall() && wasUncommon) {
    setup_compiled_restart_for_uncommon_prim(
                continuationPC, res, nlr_arg, sd_arg, uncommonPC );
    return;
  }

  // I don't understand how you could get here w/o the SIC -- dmu 6/99

  stringOop sel = NULL;
  if (this && vdepth) {
    methodMap* mm = (methodMap*)vf[vdepth]->method()->map();
    sel = mm->get_selector_at(vf[vdepth]->bci());
  }
  if (  sel
    &&  sel->is_prim_name()
    && !sel->has__Perform_prefix()
    && !vf[vdepth]->is_primCall()) {

    // primitive failure: just returned from value:With:
    // saved_outregs contains correct args (vframe expr stack gives
    // wrong stack, i.e. prim call args)

    continuationPC = (char*)sd_arg;
    assert(wasUncommon || !sd_arg->isPrimCall(), "should be a send");
    assert(!nlr_arg, "shouldn't be nlr");
    res = get_result();
    LOG_EVENT1("continuing after primitive failure block eval, continuationPC=%#lx",
                continuationPC);
  } 
  else {
    // must redo the send - restart at beginning of call bytecode
    // so that arg registers etc are set correctly
    // must do computation here because of resource mark dealloc

    continuationPC= copyArgsAndGetContinuationPC(sd_arg);
    LOG_EVENT1("continue by redoing send, continuationPC=%#lx",
                continuationPC);
  }
}

void Conversion::setup_compiled_restart_for_uncommon_prim(
                    char*& continuationPC,
                    oop&   res,
                    bool nlr_arg,
                    sendDesc* sd_arg,
                    int32* uncommonPC ) {
  # if !defined(SIC_COMPILER)
    ShouldNotReachHere();
    Unused(continuationPC); Unused(res); Unused(nlr_arg); Unused(sd_arg); Unused(uncommonPC);
  # else
    if (shouldRestartSend(uncommonPC)) {
      // redo the entire primitive call (was inlined [eg _IntAdd:])
      continuationPC= copyArgsAndGetContinuationPC(sd_arg);
      LOG_EVENT1("continuing by redoing primitive, continuationPC=%#lx",
                  continuationPC);
      return;
    }
    // uncommon trap in primitive failure branch (happens only with SIC)
    // do NOT redo the primitive call, just return the failure oop
    oop s = failure_oop_for_restarting_uncommon_prim();    
    assert(s->is_mark(), "should be error mark");
    memOop m= s->memify();
    assert(m->verify_oop(), "bad error oop");
    assert(!nlr_arg, "shouldn't be NLR");
    
    // need to initialize outgoing args; only last arg (fail
    // block) is really needed: if it is a non-literal, the receiver
    // of the fail message is taken from the expr stack
    // NB: don't copy other args because they may be bad oops
    newVF[vdepth]->copyOutgoingArgs(vf[vdepth], oldBlockHome,
                                  blockValues, true);
    res = get_result();
    m= res->memify();
    LOG_EVENT1("continue after uncommon primitive failure %#lx", m);
    
    // continue after prim call
    char* fn_start = sd_arg->jump_addr();
    continuationPC = (char*)sd_arg + getPrimCallEndOffset(fn_start);
  # endif
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

