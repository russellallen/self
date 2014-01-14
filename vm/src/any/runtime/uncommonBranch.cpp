/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "uncommonBranch.hh"
# include "_uncommonBranch.cpp.incl"


# if !defined(SIC_COMPILER)

  void uncommonBranch_init() {}

  bool handleUncommonTrap() { return false; }

# else //  defined(SIC_COMPILER)


  // uncommon branches are "unimp" instructions, and their immediate field
  // is used to count how many times the uncommon branch was taken.
  // MaxUncommonCount is an upper limit on the count to help detect
  // compiler bugs generating "real" unimplemented instructions.
  const fint MaxUncommonCount = 1000;

  // defined in uncommonBranch_<arch>.cpp
  void setTrapCount(int32* instp, unsigned count);

  extern "C" char* recompileUncommon(char* pc) {
    // called from assembly glue via trap handler; pc contains trap address
    // (can't handle trap in trap handler itself - stack is messed up)
    BlockProfilerTicks bpt(exclude_uncommon_branch);
    ResourceMark rm;
    assert(continuePC == NULL, "should have been reset by glue");
    frame* fr = currentProcess->last_self_frame(false);
    compiled_vframe* vf = new_vframe(fr)->as_compiled();
    nmethod* oldNM = vf->code;
    if (PrintUncommonBranches) {
      lprintf("*uncommon branch in nmethod %#lx \"%s\":\n",
             (long unsigned)oldNM,
             selector_string(oldNM->key.selector));
      vf->print_frame();
    }
    assert(oldNM == nmethod::findNMethod(pc), "should be the same");
    assert(!oldNM->isDI(), "can't handle DI yet");
    vf = vf->top()->as_compiled();
    compiled_vframe* vfs = vf->sender()->as_compiled();
    assert(vfs->fr == fr->sender(), "oops");
    recompilee = oldNM;
    if (Interpret) fatal("XXXX cannot recompile when interping yet");
    char* newInsts = Recompile(vfs->fr->send_desc(), vfs->fr, vf->receiver(),
                               NULL, pc);
    // should replace on stack if in loop - fix this
    // for now, just convert
    assert(currentProcess->isUncommon(), "should be in uncommon mode");
    return first_inst_addr(ReturnTrap2);
  }

  bool handleUncommonTrap() {
    // handle SIC uncommon trap; return false if the trap wasn't a SIC trap
    int32* instp = (int*)InterruptedContext::the_interrupted_context->pc();
    if (!Memory->code->contains(instp)) {
       return false;
    }
    if (!isUnimp(instp)) {
      return false;
    }

    // sanity check: trap must be in an nmethod
    nmethod* trapNM = nmethod::findNMethod(instp);
    if (trapNM->insts() > (char*)instp || trapNM->instsEnd() <= (char*)instp)
      fatal("got trap which isn't in any nmethod");

    unsigned count = trapCount(instp) + 1;
    if (count > MaxUncommonCount) {
      if (WizardMode) error("uncommon count > max");
    }

    assert(!currentProcess->isUncommon(), "shouldn't be in uncommon mode");
    currentProcess->setUncommon((char*)instp);

    // update the counter in the instruction
    if (count < MaxUncommonCount) {
      setTrapCount(instp, count);
      MachineCache::flush_instruction_cache_word(instp);
      assert(trapCount(instp) == count, "setTrapCount failed");
    }

    frame* bottom = InterruptedContext::the_interrupted_context->sp()
      ->make_full_frame_after_trap((char*)instp);

    if (count >= UncommonTrapLimit) {

      // need to recompile the method to eliminate uncommon case
      // easier to do outside of signal handler

      if (!Memory->code->contains(bottom->return_addr())) {
        // sender isn't in Self, must be a doIt nmethod
        warning("shouldn't use uncommon traps in doIt methods");
      } else {

        bottom->set_currentPC(InterruptedContext::the_interrupted_context->pc());
        if (InterruptedContext::the_interrupted_context->next_pc() == first_inst_addr(HandleUncommonTrap)) {
          error1("uncommon trap found in delay slot at pc %#lx.",
                 InterruptedContext::the_interrupted_context->sp());
          lprintf("(Will try to recover from error.)\n");
          InterruptedContext::the_interrupted_context->set_pc(first_inst_addr(HandleUncommonTrap));
          InterruptedContext::the_interrupted_context->set_next_pc(first_inst_addr(HandleUncommonTrap) + 4);
        } else {
          InterruptedContext::set_continuation_address(first_inst_addr(HandleUncommonTrap), true, true);
        }
        return true;
      }
    }
    // deoptimize the frame and continue execution

    bottom->set_currentPC((char*)instp);
    InterruptedContext::the_interrupted_context->set_pc(first_inst_addr(ReturnTrap2));
    InterruptedContext::the_interrupted_context->set_next_pc(first_inst_addr( ReturnTrap2 ) + 4);
    
    return true;
  }


# if  TARGET_OS_VERSION == SOLARIS_VERSION \
   || TARGET_OS_FAMILY == MACOS_FAMILY \
   || TARGET_OS_VERSION == MACOSX_VERSION \
   || TARGET_OS_VERSION == LINUX_VERSION
  void uncommonBranch_init() { }
# elif  TARGET_OS_VERSION == SUNOS_VERSION
  extern "C" {
    void G1_mapLoadHandler();
    void G2_mapLoadHandler();
    void G3_mapLoadHandler();
    void G4_mapLoadHandler();
    void G5_mapLoadHandler();
    
    void O0_mapLoadHandler();
    void O1_mapLoadHandler();
    void O2_mapLoadHandler();
    void O3_mapLoadHandler();
    void O4_mapLoadHandler();
    void O5_mapLoadHandler();
    
    void L0_mapLoadHandler();
    void L1_mapLoadHandler();
    void L2_mapLoadHandler();
    void L3_mapLoadHandler();
    void L4_mapLoadHandler();
    void L5_mapLoadHandler();
    void L6_mapLoadHandler();
    void L7_mapLoadHandler();
  
    void I1_mapLoadHandler();
    void I2_mapLoadHandler();
    void I3_mapLoadHandler();
    void I4_mapLoadHandler();
    void I5_mapLoadHandler();
  }

  void uncommonBranch_init() {
    mapLoadHandler[G0] = NULL;
    mapLoadHandler[G1] = G1_mapLoadHandler;
    mapLoadHandler[G2] = G2_mapLoadHandler;
    mapLoadHandler[G3] = G3_mapLoadHandler;
    mapLoadHandler[G4] = G4_mapLoadHandler;
    mapLoadHandler[G5] = G5_mapLoadHandler;
    mapLoadHandler[G6] = NULL;
    mapLoadHandler[G7] = NULL;
    
    mapLoadHandler[O0] = O0_mapLoadHandler;
    mapLoadHandler[O1] = O1_mapLoadHandler;
    mapLoadHandler[O2] = O2_mapLoadHandler;
    mapLoadHandler[O3] = O3_mapLoadHandler;
    mapLoadHandler[O4] = O4_mapLoadHandler;
    mapLoadHandler[O5] = O5_mapLoadHandler;
    mapLoadHandler[O6] = NULL;
    mapLoadHandler[O7] = NULL;
    
    mapLoadHandler[L0] = L0_mapLoadHandler;
    mapLoadHandler[L1] = L1_mapLoadHandler;
    mapLoadHandler[L2] = L2_mapLoadHandler;
    mapLoadHandler[L3] = L3_mapLoadHandler;
    mapLoadHandler[L4] = L4_mapLoadHandler;
    mapLoadHandler[L5] = L5_mapLoadHandler;
    mapLoadHandler[L6] = L6_mapLoadHandler;
    mapLoadHandler[L7] = L7_mapLoadHandler;
    
    mapLoadHandler[I0] = NULL;
    mapLoadHandler[I1] = I1_mapLoadHandler;
    mapLoadHandler[I2] = I2_mapLoadHandler;
    mapLoadHandler[I3] = I3_mapLoadHandler;
    mapLoadHandler[I4] = I4_mapLoadHandler;
    mapLoadHandler[I5] = I5_mapLoadHandler;
    mapLoadHandler[I6] = NULL;
    mapLoadHandler[I7] = NULL;
  }
# else
  # error what?
  
# endif  // SIC && (OS is Mac or Solaris)

# endif //  defined(SIC_COMPILER)
