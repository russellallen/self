/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

  
# pragma implementation "cacheStub_sparc.hh"
# pragma implementation "cacheStub_inline_sparc.hh"
# include "_cacheStub_sparc.cpp.incl"
  
# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


static pc_t prevAddr;

Label* CacheStub::prologue(bool immediateOnly) {
  // prologue:  andcc  rcvr, 1
  //  bnz,a  _mapTest
  //          load   [rcvr+map_offset], t
  // *if nsmi
  //    andcc  rcvr, Tag_Mask
  //    bne    _next
  //    <jmpl smi_addr>
  //  *if nfloat
  // next:
  //    <jmpl float_addr>
  //  *endif float
  // *else if nfloat
  //    andcc  rcvr, Float_Mask
  //    beq    _next
  //    <jmpl float_addr>
  // *endif
  // * if !(nsmi && nfloat)
  // next:
  //   nop
  //   bra,a   _miss
  // *endif
  // mapTest:  
  //  setHi  ..., t1                       (may be delay slot)
  assert(((Float_Tag | Int_Tag) & Mem_Tag) == 0, "tagging scheme changed");
  prevAddr = NULL;
  Label* result = NULL;
  Label* next = NULL;
  Label* mapTest = NULL;
  char *floatAddr, *smiAddr;
  computeJumpAddr(nsmi, theSendDesc, stsmi, smiAddr);
  computeJumpAddr(nfloat, theSendDesc, stfloat, floatAddr);
  
  if (immediateOnly)
    ;
  else if (FastMapTest  &&  nsmi == NULL  &&  nfloat == NULL)
    a->LoadI(ReceiverReg, map_offset(), Temp1);

  else {
    a->AndCCI(ReceiverReg, Mem_Tag, G0);
    mapTest = a->BneForward(true);
    a->LoadI(ReceiverReg, map_offset(), Temp1); // in delay slot, only do me if branch goes
  }
 
  if (nsmi) {
    n[newMethods] = nsmi;
    st[newMethods++] = stsmi;
    if (SICCountIntTagTests) a->markTagTest(1);
    a->AndCCI(ReceiverReg, Tag_Mask, G0);
    next = a->BneForward(true);
    a->AndCCI(ReceiverReg, Float_Tag, G0);    // test for float (delay slot)
    jump(smiAddr);
    a->Nop();
    if (nfloat) {
      n[newMethods] = nfloat;
      st[newMethods++] = stfloat;
      next->define();
      if (immediateOnly) {
        // need to test float tag (test done in delay slot of int case)
        result = a->BeqForward(false);
      } else {
        // already tested for memTag, so it must be a float
      }
      jump(floatAddr);
      a->Nop();
    } else {
      result = next;
    }
  } else if (nfloat) {
    n[newMethods] = nfloat;
    st[newMethods++] = stfloat;
    a->AndCCI(ReceiverReg, Float_Tag, G0);
    result = a->BeqForward(false);
    jump(floatAddr);
    a->Nop();
  } else {
    assert(!nsmi && !nfloat, "just checkin'");
    if (next) next->define();
    if (FastMapTest) {
      assert(!next && !mapTest, "should not be set");
    } else {
      result = a->BraForward(true);
    }
  }
  if (mapTest) mapTest->define();
  return result;
}

Label* CacheStub::test(oop map, pc_t addr, Label* prev) {
  // first map test:
  //  cmp    t, map
  //  bne,a  _next
  
  // all others:
  //  <jump  prevAddr>        generate jump for prev case (in delay slot)
  //  cmp    t, map
  //  bne,a  _next

  if (prevAddr != NULL) {
    jump(prevAddr);
    prev->define();
  }
  a->SetHiO(map, Temp2);                      // load map
  a->AddO(Temp2, map, Temp2);
  a->SubCCR(Temp1, Temp2, G0);                // test
  prevAddr = addr;
  return a->BneForward(false);
}

void CacheStub::finish(Label* miss, Label* prev) {
  if (prevAddr) {
    jump(prevAddr);
    prev->define();
  }
  if (miss) miss->define();
  void* addr = theSendDesc->lookupRoutine();
  a->SetHiP(addr, Temp2);
  a->JmpLP(Temp2, addr, G0);
  if (SICCountTypeTests) {
    a->endTypeTest();
  } else {
    a->Nop();
  }
}
  
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
