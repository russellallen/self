/* Sun-$Revision: 30.5 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# pragma implementation "countPattern_sparc.hh"
# include "_countPattern_sparc.cpp.incl"


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)
 

  void CountCodePattern::initCounting() {
    // general count stub; 7 instrs = 12 cycles on SS-2.  Could be reduced to
    // 6 insts / 10 cy if one additional register were available (e.g. could
    // use %o5 for sends with < 5 args).
    // 0: sethi count_addr, Temp1
    // 1: ld    [Temp1+lo(count_addr)], Temp2
    // 2: inc   Temp2
    // 3: st    Temp2, [Temp1+lo(count_addr)]
    // 4: sethi jump_addr, Temp1
    // 5: jmpl   Temp1 + low(jump_addr), g0
    // 6: nop
    instsSize = 7 * 4;
    countAddr_offset = 0;
    ld_offset = 1;
    st_offset = 3;
    nm_sethi_offset = 4;
    nm_jmp_offset = 5;
    limit_sethi_offset = countAddr_offset2 = recompile_offset = BadOffset;

    Assembler* a = new Assembler(instsSize, instsSize, false, true);
    a->SetHiA(0, Temp1);
    a->LoadI(Temp1, 0, Temp2);
    a->AddI(Temp2, 1, Temp2);
    a->StoreI(Temp1, 0, Temp2);
    a->SetHiX(0, CodeAddressOperand, Temp1);
    a->JmpLC(Temp1, 0, G0);
    a->Nop();

    pattern = (pc_t)AllocateHeap(instsSize, "countStub pattern");
    copy_words((int32*)a->instsStart, (int32*)pattern, instsSize / 4);
    a->finalize();
  }


  void CountCodePattern::initComparing() {
    instsSize = 13 * 4;
    // 0: sethi count_addr, Temp1
    // 1: ld    [Temp1+lo(count_addr)], Temp2
    // 2: setHi limit, Temp1
    // 3: inc   Temp2
    // 4: cmp   Temp2, Temp1
    // 5: sethi count_addr, Temp1
    // 6: st    Temp2, [Temp1+lo(count_addr)]
    // 7: beq   10
    // 8: sethi jump_addr, Temp1
    // 9: jmpl   Temp1 + low(jump_addr), g0
    //10: sethi recompile_addr, Temp2
    //11: jmpl   Temp2 + low(recompile_addr), linkReg
    //12: nop
    countAddr_offset = 0;
    countAddr_offset2 = 5;
    ld_offset = 1;
    st_offset = 6;
    nm_sethi_offset = 8;
    nm_jmp_offset = 9;
    limit_sethi_offset = 2;
    recompile_offset = 10;

    Assembler* a = new Assembler(instsSize, instsSize, false, true);
    a->SetHiA(0, Temp1);
    a->LoadI(Temp1, 0, Temp2);
    a->SetHiA(0, Temp1);
    a->AddI(Temp2, 1, Temp2);
    a->SubCCR(Temp2, Temp1, G0);
    a->SetHiA(0, Temp1);
    a->StoreI(Temp1, 0, Temp2);
    Label* l = a->BgeForward(false);
    a->SetHiX(0, CodeAddressOperand, Temp1);
    a->JmpLC(Temp1, 0, G0);
    l->define();
    a->SetHiP(Memory->code->trapdoors->Recompile_stub_td(), Temp2);
    a->JmpLP(Temp2, Memory->code->trapdoors->Recompile_stub_td(), RecompileLinkReg);
    a->Nop();
    pattern = (pc_t)AllocateHeap(instsSize, "countStub pattern");
    copy_words((int32*)a->instsStart, (int32*)pattern, instsSize / 4);
    a->finalize();
  }
    

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
