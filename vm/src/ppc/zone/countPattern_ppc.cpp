# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# include "asm_inline.hh"
# include "countPattern.hh"
# include "fields.hh"
# include "label_inline.hh"
# include "regs.hh"
# include "zone.hh"


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)
 

  void CountCodePattern::initCounting() {
    // general count stub; 8 instructions.
    // 0: lis     Temp1, high(count_addr)
    // 1: lwz     Temp2, [low(count_addr) + Temp1]
    // 2: addi    Temp2, Temp2, 1
    // 3: stw     Temp2, [low(count_addr) + Temp1]
    // 4: lis     Temp1, high(jump_addr)
    // 5: ori     Temp1, Temp1, low(jump_addr)
    // 6: mtctr   Temp1
    // 7: balwctr

    instsSize         = 8 * 4;
     countAddr_offset = 0;
           lwz_offset = 1;
           stw_offset = 3;
        nm_lis_offset = 4;
        nm_ori_offset = 5;
         limit_offset = recompile_lis_offset = recompile_ori_offset = BadOffset;

    Assembler* oldAssembler = theAssembler;
    Assembler* a = theAssembler = new Assembler(instsSize, instsSize, false, true);
    a->load_from_address(Temp2, 0, VMAddressOperand, Temp1);      // 2 instructions
    a->addi(Temp2, Temp2, 1, NumberOperand);
    a->stw(Temp2, 0, VMAddressOperand, Temp1);
    a->long_branch_to((pc_t)0, CodeAddressOperand, Temp1, false); // 4 instructions

    pattern = (pc_t)AllocateHeap(instsSize, "countStub pattern");
    copy_words((int32*)a->instsStart, (int32*)pattern, instsSize / 4);
    a->finalize();
    theAssembler = oldAssembler;
  }


  void CountCodePattern::initComparing() {
    // general count stub; 8 instructions.
    // 0: lis     Temp1, high(count_addr)
    // 1: lwz     Temp2, [low(count_addr) + Temp1]
    // 2: addi    Temp2, Temp2, 1
    // 3: stw     Temp2, [low(count_addr) + Temp1]
    // 4: cmpwi   Temp2, limit
    // 5: beq     10
    // 6: lis     Temp1, high(jump_addr)
    // 7: ori     Temp1, Temp1, low(jump_addr)
    // 8: mtctr   Temp1
    // 9: balwctr
    //10: mflr    RecompileTempReg
    //11: stw     RecompileTempReg, SP + saved_pc_offset * 4
    //12: bl      13
    //13: mflr    RecompileLinkReg
    //14: mtlr    RecompileTempReg
    //15: lis     R0, high(recompile_addr)
    //16: ori     R0, R0, low(recompile_addr)
    //17: mtctr   R0
    //18: balwctrl

    instsSize            = 19 * 4;
    
    countAddr_offset = 0;
          lwz_offset = 1;
          stw_offset = 3;
            limit_offset = 4;
           nm_lis_offset = 6;
           nm_ori_offset = 7;
    recompile_lis_offset = 15;
    recompile_ori_offset = 16;

    Assembler* oldAssembler = theAssembler;
    Assembler* a = theAssembler = new Assembler(instsSize, instsSize, false, true);
    { // make a new block so that the Label's destructor gets called before we reset theAssembler in Assembler::finalize
      a->load_from_address(Temp2, 0, VMAddressOperand, Temp1);      // 2 instructions
      a->addi(Temp2, Temp2, 1, NumberOperand); 
      a->stw(Temp2, 0, VMAddressOperand, Temp1);
      a->cmpwi( Temp2, 0, NumberOperand ); // assuming limit fits in si (assert in countStub_ppc)
      Label recompile(a->printing);
      a->beq(recompile, predict_usual);   // not likley to recompile, so expect to fall through
      a->long_branch_to((pc_t)0, CodeAddressOperand, Temp1, false); // 4 instructions
      recompile.define();

      // save link so can use link to get address of this code
      // also key to profiler -- dmu 2/04
      a->mflr(RecompileTempReg);
      a->stw(RecompileTempReg, saved_pc_offset * oopSize, NumberOperand, SP);
      Label next;
      a->bl(next, NumberOperand); // needed to get addr of this code
      next.define();
      a->mflr(RecompileLinkReg);
      a->mtlr(RecompileTempReg);

      // call recompiler
      char* fnaddr = Memory->code->trapdoors->Recompile_stub_td(R0);
      a->long_branch_to(fnaddr, CodeAddressOperand, R0, false);
    }
    pattern = (pc_t)AllocateHeap(instsSize, "countStub pattern");
    copy_words((int32*)a->instsStart, (int32*)pattern, instsSize / 4);
    a->finalize();
    theAssembler = oldAssembler;
  }
    

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == PPC_ARCH
