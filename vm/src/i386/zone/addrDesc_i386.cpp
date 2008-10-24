# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# pragma implementation "addrDesc_i386.hh"

# include "_addrDesc_i386.cpp.incl"


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


bool addrDesc::isShiftNeededAfterMovingMe(OopNCode* m) {
  return isRelative();
}


pc_t addrDesc::instr_referent(OopNCode* m) {
  pc_t* dispp = addr(m);
  assert(m->contains(dispp), "not in this nmethod");
  return *dispp + (isRelative() ? int32(dispp + 1) : 0);
}


void addrDesc::set_instr_referent(OopNCode* m, void* newVal) {
  pc_t* dispp = addr(m);
  assert(m->contains(dispp), "not in this nmethod");
  *dispp = pc_t( int32(newVal) - (isRelative() ?  int32(dispp) + oopSize  :  0) );
}


void addrDesc::relocateTarget(OopNCode* m, int32 delta) {
  pc_t* dispp = addr(m);
  assert(m->contains(dispp), "not in this nmethod");
  if (!isRelative())
    return;
  *dispp -= delta;  
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
    
  inst_t* instp = (inst_t*)addr(m);
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
# endif // TARGET_ARCH == I386_ARCH
