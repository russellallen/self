/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "conversion_sparc.hh"
# include "_conversion_sparc.cpp.incl"


  
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)


  void Conversion::fix_new_vfs() {
    // because sparc frames are one lower than actual frame, 
    //  and because these were built one-by-one going down the stack
    //  all new vfs except last one contain bogus frame ptr.
    // fix them up

    // (can't compare frames directly (VM stack vs real stack)
    assert(newVF[vdepth]->fr->sender() ==
           currentProcess->last_self_frame(true)->sender(),
           "should be bottom frame");

    frame* f = newVF[vdepth]->fr;
    for (fint i = vdepth-1; i >= 1; i--) {
      if (newVF[i]) {
        f = f->sender();
        newVF[i]->fix_frame(f);
      }
    }
  }


  void Conversion::fixConversionStack_for_vframe_conversion() {
    fixConversionStack(sd->return_pc(), sp);
  }
  


  bool Conversion::createFrame(fint i, nmethod *newNM) {    
    // create new frame, store it in newFr and initialize it
    // (for sparc actually have to create TWO regions,
    //  the sp area of the new frame and a dummy area below it)
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

    sendDesc* sd_of_created_frame = newNM->sendDescFor(vf[i], isInInterruptCheck);
    
    
    // this piece of sparc frame holds ret addr for caller, so pass in sd->return_pc()
    sparc_sp* newSP = ((sparc_sp*)sp)->push_new_sp( sd->return_pc(),
                                                    newNM->frameSize(),
                                                    true );

    if (stk->isStackOverflow(newSP)) {
      fatal("stack overflow while converting stack frame");
    }

    sp = (char*)newSP;
    
    newFr = newSP->push_new_sp(0)->as_callers_frame(); // Sparc needs extra frame
    rlFr  = 0;
    newFrRl = RegisterLocator::for_frame(newFr);
    
    sd = sd_of_created_frame;
    
    return isInInterruptCheck;
  }
	

  frame* Conversion::fixConversionStack_for_returning_to_self( 
           char* self_sparc_fp_or_ppc_sp, 
           sendDesc* self_sd ) {
    // need frame below real last frame:
    fixConversionStack((char*)self_sd, self_sparc_fp_or_ppc_sp);
    return lastFrame;
  }

 
  void Conversion::continue_after_return_trap_with_result( 
                     oop res, 
                     char* continuationPC, 
                     char* self_sparc_fp_or_ppc_sp ) {
                                               
    saved_outregs[0] = res;
    OutgoingArgsOfReturnTrapOrRecompileFrame = 0; // done with this                                           
    ContinueAfterReturnTrap(continuationPC, self_sparc_fp_or_ppc_sp);
  }
  
  
  oop Conversion::get_result() {
    return saved_outregs[0];
  }
  
  
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

