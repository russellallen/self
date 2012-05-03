# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "conversion_ppc.hh"
# include "_conversion_ppc.cpp.incl"


  
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)


  void Conversion::fix_new_vfs() { }
  
  
  void Conversion::fixConversionStack_for_vframe_conversion() {
    fixConversionStack( (pc_t)&ReturnTrap_returnPC, (char*)rlFr->my_sp() );
  }


  bool Conversion::createFrame(fint i, nmethod *newNM) {    
    // create new frame, store it in newFr and initialize it
    // XXXX what if fr is interp frame?

    // this routine seems to use sd and sp,
    //  and to set sd, sp, and newFr

    // figure out new value for sd and if isInInterruptCheck

    sendDesc* prev_sd= vf[i]->fr->send_desc();

    // Have to be careful when converting a frame at the bottom of the
    // stack which has just returned from interruptCheck, after a process
    // switch, or while single stepping -- otherwise the next send is
    // omitted.  MIW 6/8/94

    bool isInInterruptCheck=
              prev_sd // eliminate uncommon branches
          && prev_sd->isPrimCall()
          && prev_sd->jump_addr() == first_inst_addr(interruptCheck);

    assert(vf[i]->fr->is_aligned(), "frame alignment check");
    sendDesc* sd_of_created_frame = newNM->sendDescFor(vf[i], isInInterruptCheck);	  
  
    assert( i == 1   ||  newVF[i-1],  "Mac has no null check");
    
    RegisterLocator* caller_rl_before_creating_frame = 
      i == 1
        ?  nonvols_for_caller // vf[0] could be null, so don't do vf[0]->reg_loc()
           // going to be smashing regs saved below last created frame, so copy them
        :  newVF[i-1]->reg_loc()->for_copied_frame(NULL);

    // ppc frames contain their own return addresses, so use sd_of_created_frame
    ppc_sp*   newSP = ((ppc_sp*)  sp)->push_new_sp( sd_of_created_frame->return_pc(),
                                                    newNM->frameSize(),
                                                    true );
    if (stk->isStackOverflow(newSP)) {
      fatal("stack overflow while converting stack frame");
    }
    sp = (char*)newSP;
    
    newFr = (frame*)newSP;
    rlFr  = (frame*)newSP->push_new_sp((char*)&ReturnTrap_returnPC,
                                       ReturnTrap_frame_size,
                                       true); // PPC needs frame for all saved regs
    newFrRl = RegisterLocator::for_NonVolSaving_frame(rlFr);    
    RegisterLocator* caller_rl_after_creating_frame  = newFrRl->sender();
    
    // make sure all saved non vol regs for higher frames
    // are saved in either this frame or the spoof SaveNonVolRegs frame
    for (fint i = LowestLocalNonVolReg;  i <= HighestNonVolReg;  ++i ) {
      oop* srcp = caller_rl_before_creating_frame->address_of(Location(i));
      oop* dstp = caller_rl_after_creating_frame ->address_of(Location(i));
      *dstp = *srcp;
    }
    sd = sd_of_created_frame;    
    return isInInterruptCheck;
  }


  frame* Conversion::fixConversionStack_for_returning_to_self( 
           char* self_sparc_fp_or_ppc_sp, 
           sendDesc* /*self_sd*/ ) {
    frame* returnTrap_frame = (frame*)((oop*)self_sparc_fp_or_ppc_sp -  ReturnTrap_frame_size);
    assert(returnTrap_frame->return_addr() == (pc_t)&ReturnTrap_returnPC, "");
    fixConversionStack( (pc_t)&ReturnTrap_returnPC, (char*)returnTrap_frame);
    
    return (frame*)self_sparc_fp_or_ppc_sp; // first self frame we are returning to
  }


  void Conversion::continue_after_return_trap_with_result( 
                     oop res, 
                     char* continuationPC, 
                     char* self_sparc_fp_or_ppc_sp ) {
    OutgoingArgsOfReturnTrapOrRecompileFrame = NULL; // done with this                                           
    ContinueAfterReturnTrap(res, continuationPC, self_sparc_fp_or_ppc_sp);
  }
  
  
  oop Conversion::get_result() {
    fatal("Unimplemented"); return NULL;
  }
  
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

# endif // TARGET_ARCH == PPC_ARCH
