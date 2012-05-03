# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# pragma implementation "addrDesc_ppc.hh"

# include "_addrDesc_ppc.cpp.incl"


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


bool addrDesc::isShiftNeededAfterMovingMe(OopNCode* m) {
  return isBranch((inst_t*)addr(m));
}


pc_t addrDesc::instr_referent(OopNCode* m) {
  inst_t* instp = (int32*)addr(m);
  assert(m->contains(instp), "not in this nmethod");
  if (isShifted()) {
    // should be a lis followed by a load/store/addi/ori
    assert(is_immediate_pair(instp), "");
    return (pc_t) immediate_pair_target(instp);
  }
  else {
    // should be an immediate, uncond branch
    assert( isUnconditionalImmediateBranch( *instp), "");
    return (pc_t) unconditionalImmediateBranch_target(instp);
  }
}


void addrDesc::set_instr_referent(OopNCode* m, void* newVal) {
  inst_t* instp = (int32*)addr(m);
  assert(m->contains(instp), "not in this nmethod");
  if (isShifted()) {
    // should be a lis followed by a load/store/addi/ori
    assert(is_immediate_pair(instp), "");
    set_immediate_pair_target(instp, (int32) newVal);
  }
  else {
    // should be an immediate, uncond branch
    assert( isUnconditionalImmediateBranch( *instp), "");
    set_unconditionalImmediateBranch_target(instp, (int32)newVal);
  }
}


void addrDesc::relocateTarget(OopNCode* m, int32 delta) {
  // shift only if need be
  if (isEmbedded()  &&  !isShifted()  && !absoluteBit(*(inst_t*)addr(m))) {
    assert(isUnconditionalImmediateBranch(*(inst_t*)addr(m)), "");
    set_instr_referent(m, instr_referent(m) - delta);
  }
}
  

bool addrDesc::verify(nmethod* m) {
  bool flag = true;
  if (offset() >= m->instsLen() + m->scopes->length()) {
    error1("bad offset in addrDesc at %#lx", (long)this);
    flag = false;
  }
  if (isSendDesc()) {
    flag = asSendDesc(m)->verify() && flag;
  }
  else if (isDIDesc()) {
    flag = asDIDesc(m)->dependency()->verify_list_integrity() && flag;
  }
  else if (isPrimitive())
    ;
  else 
    flag = oop(referent(m))->verify_oop() && flag;
    
  inst_t* instp = (int32*)addr(m);
  if (!isEmbedded()) 
    ;
  else if (isShifted()) {
    if (!is_immediate_pair(instp)) {
      error("could not find immediate pair for shifted addrDesc");
      flag = false;
    }
  }
  else {
    if (!isUnconditionalImmediateBranch(*instp)) {
      error("could not find uncond. imm. branch for unshifted addrDesc");
      flag = false;
    }
  }
  return flag;
}

static int32 offset_to_call_inst(bool is_shifted) {
  return
    is_shifted ? 3  // magic! sequence is: lis + ori + mtlr + balwlrl
               : 0; // the branch itself
}

// not inlined to reduce .h dependencies
sendDesc* addrDesc::asSendDesc(OopNCode* m) {
  assert(isSendDesc(), "not a sendDesc location");
  return sendDesc::sendDesc_from_call_instruction((inst_t*)addr(m) + offset_to_call_inst(isShifted()));
}
  
sendDesc* addrDesc::asPrimitiveSendDesc(OopNCode* m) {
  // note that it's not really an inline cache, just a primitive call
  assert(isPrimitive(), "not a primitive location");
  return sendDesc::sendDesc_from_call_instruction((inst_t*)addr(m) + offset_to_call_inst(isShifted()));
}
  
DIDesc* addrDesc::asDIDesc(nmethod* m) {
  assert(isDIDesc(), "not a diDesc location");
  return DIDesc::DIDesc_from_call_instruction((inst_t*)addr(m) + offset_to_call_inst(isShifted()));
}





# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == PPC_ARCH
