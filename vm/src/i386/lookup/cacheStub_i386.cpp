# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

  
# pragma implementation "cacheStub_i386.hh"
# pragma implementation "cacheStub_inline_i386.hh"
# include "_cacheStub_i386.cpp.incl"
  
# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


// -no SIC type tests for now


Label* CacheStub::br_if_not_smi() {
  Label* not_smi = new Label(a->printing);
  assert(Int_Tag == 0, "???");
  a->testl( Tag_Mask, NumberOperand, Temp1);
  a->jnz(not_smi);
  return not_smi;
}

Label* CacheStub::br_if_not_float() {
  assert((Float_Tag & Mem_Tag) == 0  &&  (Float_Tag & Int_Tag) == 0, "???");
  Label* not_float = new Label(a->printing);
  a->btl( Float_Tag_bit_i386, Temp1);
  // if bit set must be hit, otherwise is mark
  a->jnc(not_float);
  return not_float;
}


void CacheStub::add_case(nmethod* nm, CountStub* stArg, pc_t addr) {
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

  // put rcvr in Temp1
  a->movl(esp, leaf_rcvr_offset * oopSize, NumberOperand, Temp1);
  // Load map if needed
  if (immediateOnly)
    ;
  else {
    a->btl(Mem_Tag_bit_i386, Temp1);
    loadMapAfterHandlingImmediates = new Label(a->printing);
    a->jc(loadMapAfterHandlingImmediates); // jump if memOop    
  }

  if (nsmi  &&  nfloat) {
    Label* not_smi = br_if_not_smi();
    add_case(nsmi, stsmi, smiAddr);
    
    not_smi->define();
    // if immediateOnly = false and we're down here, we've already tested for memOop
    // and hence there's no need to test for the float tag.
    if (immediateOnly)
      miss = br_if_not_float(); // br if mem
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
    a->jmp(miss);
  }
  if (loadMapAfterHandlingImmediates) {
    loadMapAfterHandlingImmediates->define();
    // CacheStub::test expects Temp1 to contain the receiver's map
    a->movl(Temp1, map_offset(), NumberOperand, Temp1);
  }
  return miss;
}


Label* CacheStub::test(oop map, pc_t addr, Label* prev) {
  if (prev)
    prev->define();
  a->cmpl((int32)map, OopOperand, Temp1);
  Label* next_test = new Label(a->printing);
  a->jne(next_test);
  jump(addr);
  return next_test;
}

void CacheStub::finish(Label* miss, Label* prev) {
  if (prev)
    prev->define();
  if (miss)
    miss->define();
  a->jmp((int32)theSendDesc->lookupRoutine(), PVMAddressOperand);
}

  
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == I386_ARCH
