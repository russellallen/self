# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "cacheStub_ppc.hh"
# pragma implementation "cacheStub_inline_ppc.hh"
# include "_cacheStub_ppc.cpp.incl"
  
# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


// -no SIC type tests for now

Label* CacheStub::br_if_not_smi()
{
  assert(Int_Tag == 0, "???");
  a->andi_(R0, ReceiverReg, Tag_Mask, NumberOperand);
  Label* not_smi = new Label(a->printing);
  a->bne(*not_smi);
  return not_smi;
}

Label* CacheStub::br_if_not_float()
{
  assert((Float_Tag & Mem_Tag) == 0  &&  (Float_Tag & Int_Tag) == 0, "???");
  a->andi_(R0, ReceiverReg, Float_Tag, NumberOperand);
  Label* not_float = new Label(a->printing);
  a->beq(*not_float);
  return not_float;
}


void CacheStub::add_case(nmethod* nm, CountStub* stArg, pc_t addr)
{
  n[newMethods] = nm;  st[newMethods] = stArg;  ++ newMethods;
  jump(addr);
}


Label* CacheStub::prologue(bool immediateOnly) {
  assert(((Float_Tag | Int_Tag) & Mem_Tag) == 0, "tagging scheme changed");
  Label* miss = NULL;
  Label* loadMapAfterHandlingImmediates = NULL;
  pc_t floatAddr, smiAddr;
  computeJumpAddr(nsmi, theSendDesc,   stsmi,   smiAddr);
  computeJumpAddr(nfloat, theSendDesc, stfloat, floatAddr);

  // Load map if needed
  if (immediateOnly)
    ;
  else if (FastMapTest  &&  nsmi == NULL  &&   nfloat == NULL) {
    a->lwz(Temp1, map_offset(), NumberOperand, ReceiverReg);
    return NULL;
  }
  else {
    a->andi_(R0, ReceiverReg, Mem_Tag, NumberOperand);
    loadMapAfterHandlingImmediates = new Label(a->printing);
    a->bne(*loadMapAfterHandlingImmediates, predict_weird); // usually branches, most selectors don't have int cases
  }

  if (nsmi  &&  nfloat) {
    Label* not_smi = br_if_not_smi();
    add_case(nsmi, stsmi, smiAddr);
    
    not_smi->define();
    // if immediateOnly = false and we're down here, we've already tested for memOop
    // and hence there's no need to test for the float tag.
    if (immediateOnly)
      miss = br_if_not_float(); // br if mem
    else if (FastMapTest)
      fatal("would have to test for float and go to next case but cannot happen");
    else
      miss = NULL;
    add_case(nfloat, stfloat, floatAddr);
  }
  else if (nsmi)   { miss = br_if_not_smi();    add_case(nsmi,   stsmi,     smiAddr);  }
  else if (nfloat) { miss = br_if_not_float();  add_case(nfloat, stfloat, floatAddr);  }
  else {
    // tested for Oop above, so rcvr is int or float,
    // but there are no smi or float cases, so must be a miss
    miss = new Label(a->printing);
    a->b(*miss, NumberOperand);
  }
  if (loadMapAfterHandlingImmediates) {
    loadMapAfterHandlingImmediates->define();
    // CacheStub::test expects Temp1 to contain the receiver's map
    a->lwz(Temp1, map_offset(), NumberOperand, ReceiverReg);
  }
  return miss;
}


Label* CacheStub::test(oop map, pc_t addr, Label* prev) {
  if (prev)
    prev->define();
  a->load_immediate(Temp2, (int32)map, OopOperand);
  a->cmplw(Temp1, Temp2); // Temp1 contains the receiver under test (filled by prologue)
  Label* next_test = new Label(a->printing);
  a->bne(*next_test);
  jump(addr);
  return next_test;
}

void CacheStub::finish(Label* miss, Label* prev) {
  if (prev)
    prev->define();
  if (miss)
    miss->define();
  a->branch_to(theSendDesc->lookupRoutine(), PVMAddressOperand, Temp2, false);
}

  
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == PPC_ARCH
