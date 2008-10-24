/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# pragma implementation "addrDesc_sparc.hh"

# include "_addrDesc_sparc.cpp.incl"


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


  bool addrDesc::isShiftNeededAfterMovingMe(OopNCode* m) {
    return isBranch((inst_t*)addr(m));
  }
  
  
  pc_t addrDesc::instr_referent(OopNCode* m) {
    int32* instp = (int32*)addr(m);
    assert(m->contains(instp), "not in this nmethod");
    int32 val;
    
    if (::isCall(instp)) {
      val = getCallImm(instp);

    } else {
      assert(isSetHi(instp), "strange instruction for addr desc");

      int32* inst2p;
      if (inDelaySlot()) {
        // set-hi in branch delay slot
        int32* inst1p = &instp[-1];
        assert(isBranch(inst1p) &&
               (isConditionalBranch(inst1p) ?
                annulled(inst1p) : !annulled(inst1p)),
               "unexpected previous instruction");
        inst2p = getBranchTarget(inst1p);
      } else {
        inst2p = &instp[1];
      }
      while (isBranch(inst2p)) {
        if (isConditionalBranch(inst2p) || !annulled(inst2p)) {
          // skip into delay slot of call instruction after set-hi
          inst2p ++;
          assert(!isBranch(inst2p), "shouldn't have a branch in the delay slot");
          break;
        } else {
          // go to target of unconditional branch
          inst2p = getBranchTarget(inst2p);
        }
      }
      if (::isCall(inst2p) ||
          isJump(inst2p) && getSetHiD(instp) != getArithS1(inst2p)) {
        // skip into delay slot of call/unrelated jump instruction after set-hi
        inst2p ++;
      }
      assert(isAdd(inst2p) || isOr(inst2p) ||
             isLoadStore(inst2p) || isJump(inst2p),
             "strange instruction after setHi");
      assert(isImmed(inst2p), "setHi must immediately preceed rest of address");
      assert(getSetHiD(instp) == getArithS1(inst2p),
             "setHi and arith/jump/load/store should use the same register");
      
      val = getSetHiImm(instp);
      
      int32 val2 = getArithImm(inst2p);
      if (isOr(inst2p)) {
        val |= val2;
      } else {
        val += val2;
      }
    }
    
    return (pc_t)val;
  }
  
  
  void addrDesc::set_instr_referent(OopNCode* m, void* newVal) {
    int32* instp = (int32*)addr(m);
    assert(m->contains(instp), "not in this nmethod");
    
    if (::isCall(instp)) {
      setCallImm(instp, int32(newVal));

    } else {
      assert(isSetHi(instp), "strange instruction for addr desc");

      setSetHiImm(instp, int32(newVal));
      int32* inst2p;
      if (inDelaySlot()) {
        // set-hi in branch delay slot
        int32* inst1p = &instp[-1];
        assert(isBranch(inst1p) &&
               (isConditionalBranch(inst1p) ?
                annulled(inst1p) : !annulled(inst1p)),
               "unexpected previous instruction");
        inst2p = getBranchTarget(inst1p);
      } else {
        inst2p = &instp[1];
      }
      while (isBranch(inst2p)) {
        if (isConditionalBranch(inst2p) || !annulled(inst2p)) {
          // skip into delay slot of call instruction after set-hi
          inst2p ++;
          assert(!isBranch(inst2p), "shouldn't have a branch in the delay slot");
          break;
        } else {
          // go to target of unconditional branch
          inst2p = getBranchTarget(inst2p);
        }
      }
      if (::isCall(inst2p) ||
          isJump(inst2p) && getSetHiD(instp) != getArithS1(inst2p)) {
        // skip into delay slot of call/unrelated jump instruction after set-hi
        inst2p ++;
      }
      assert(isAdd(inst2p) || isOr(inst2p) ||
             isLoadStore(inst2p) || isJump(inst2p),
             "strange instruction after setHi");
      assert(isImmed(inst2p), "setHi must immediately preceed rest of address");
      assert(getSetHiD(instp) == getArithS1(inst2p),
             "setHi and arith/jump/load/store should use the same register");
      setArithImm(inst2p, int32(newVal));
    }
  }
  
  
  void addrDesc::relocateTarget(OopNCode* m, int32 delta) {
    int32* instp = (int32*)addr(m);
//    if (! m->contains(instp)) return;
    assert(m->contains(instp), "if not here, where?");
    if (::isCall(instp)) {
      int32 val= getCallImm(instp);
      val -= delta;
      setCallImm(instp, val);
    }
  }
  

bool addrDesc::verify(nmethod* m) {
  bool flag = true;
  if (offset() >= m->instsLen() + m->scopes->length()) {
    error1("bad offset in addrDesc at %#lx", (long)this);
    flag = false;
  }
  if (isUncommonTrap()) {
      if (!isUnimp((int32*)addr(m))) {
        error1("bad unimp addrDesc at %#lx", (long)this);
        flag = false;
      }
  } 
  else if (!oop(referent(m))->verify_oop()) {
    lprintf("\tin addrDesc at %#lx\n", (long)this);
    flag = false;
  }
  if (isDIDesc() &&
      !asDIDesc(m)->dependency()->verify_list_integrity()) {
    lprintf("\tin bad di cache addrDesc at %#lx\n", (long)this);
    flag = false;
  }
  return flag;
}


// not inlined to reduce .h dependencies
sendDesc* addrDesc::asSendDesc(OopNCode* m) {
  assert(isSendDesc(), "not a sendDesc location");
  return sendDesc::sendDesc_from_addrDesc_addr(addr(m));
}
  
sendDesc* addrDesc::asPrimitiveSendDesc(OopNCode* m) {
  // note that it's not really an inline cache, just a primitive call
  assert(isPrimitive(), "not a primitive location");
  return sendDesc::sendDesc_from_addrDesc_addr(addr(m));
}
  
DIDesc* addrDesc::asDIDesc(nmethod* m) {
  assert(isDIDesc(), "not a diDesc location");
  return DIDesc::DIDesc_from_addrDesc_addr(addr(m));
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
