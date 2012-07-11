/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "addrDesc.hh"
# include "_addrDesc.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


pc_t* addrDesc::addr(OopNCode* m) {
  int32 off = offset();
  assert(off >= 0, "negative offset in addrDesc");
  if (off < m->instsLen()) {
    return (pc_t*) (m->insts() + off);
  }
  assert(m->isNMethod(), "must be a nmethod");
  nmethod* nm = (nmethod*)m;
  off -= nm->instsLen();
  if (off < nm->scopes->length()) {
    return (pc_t*) nm->scopes->at(off);
  }
  ShouldNotReachHere(); // there should be no addrDescs beyond scopes
  return 0;
}

bool addrDesc::verify(CacheStub* m) {
  bool flag = true;
  if (offset() >= m->instsLen()) {
    error1("bad offset in addrDesc at %#lx", (long)this);
    flag = false;
  }
  if (isUncommonTrap()) {
    lprintf("bad type at %#lx\n", (long)this);
    flag = false;
  } else if (isOop() && !oop(referent(m))->verify_oop()) {
    lprintf("\tin addrDesc at %#lx\n", (long)this);
    flag = false;
  }
  if (isDIDesc()) {
    lprintf("bad type at %#lx\n", (long)this);
    flag = false;
  }
  return flag;
}

void addrDesc::print(nmethod* m) {
  printIndent();
  lprintf("%s%s%s%s%slocation %#lx = %#lx (offset: %ld)",
         isEmbedded() ? "embedded " : "",
         isSendDesc() ? "sendDesc " : "",
         isPrimitive() ? "primitiveSendDesc " : "",
         isDIDesc() ? "diDesc " : "",
         isUncommonTrap() ? "uncommonTrap " : "",
         (long unsigned)this, (long unsigned)addr(m), long(offset()));
  if (isSendDesc()) {
    lprintf("\n");
    Indent ++;
    asSendDesc(m)->print();
    Indent --;
  } else if (isPrimitive()) {
    lprintf(" (%s)\n", getPrimName((pc_t)referent(m)));
  } else if (isDIDesc()) {
    lprintf("\n");
    Indent ++;
    asDIDesc(m)->print();
    Indent --;
  } else {
    lprintf(": ");
    assert(isOop(), "should be oop addrDesc");
    oop(this->referent(m))->print_real_oop();
    lprintf("\n");
  }
}
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
