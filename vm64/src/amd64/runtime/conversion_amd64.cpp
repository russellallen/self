# if  TARGET_ARCH == I386_ARCH || TARGET_ARCH == X86_64_ARCH || TARGET_ARCH == AARCH64_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "conversion_amd64.hh"
# include "_conversion_amd64.cpp.incl"


  
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)


  void Conversion::fix_new_vfs() { }
  
  
  void Conversion::fixConversionStack_for_vframe_conversion() {
    fixConversionStack(sd->return_pc(), sp);
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
    
    // Intel frames contain their own return addresses, so use sd_of_created_frame
    i386_sp*   newSP = ((i386_sp*)  sp)->push_new_sp( sd_of_created_frame->return_pc(),
                                                    newNM->frameSize(),
                                                    true );
    if (stk->isStackOverflow(newSP)) {
      fatal("stack overflow while converting stack frame");
    }
    sp = (char*)newSP;
    
    newFr = (frame*)newSP;
    rlFr  = NULL;
    newFrRl = RegisterLocator::for_frame(newFr);    
    sd = sd_of_created_frame;    
    return isInInterruptCheck;
  }


  frame* Conversion::fixConversionStack_for_returning_to_self( 
           char* self_sparc_fp_or_ppc_sp, 
           sendDesc* self_sd ) {
    // need frame below real last frame:
    fixConversionStack((char*)self_sd, self_sparc_fp_or_ppc_sp);
    return (frame*)self_sparc_fp_or_ppc_sp;
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

# endif // TARGET_ARCH == I386_ARCH || TARGET_ARCH == X86_64_ARCH || TARGET_ARCH == AARCH64_ARCH
