/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "ncode.hh"
# include "_ncode.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

void NCodeBase::moveTo(NCodeBase* to, int32 size) {
  int32 delta = (char*) to - (char*) this;
  moveTo_inner(to, delta, size);
  copy_words_overlapping(  (int32*)this,  (int32*)to,  size / sizeof(int32));
  // must use "to"; cannot use "this" anymore since there may be overlap
  if (to->isNMethod())
    ; // cannot do this simple check because moveTo_inner fixes up branches in place for nmethods()
  else if (CheckAssertions || 1 /* turn this on for now, since PPC has been buggy */)
    check_branch_relocation( (char*)to->insts() - delta,  to->insts(),  instsLen() );

  MachineCache::flush_instruction_cache_range(to->insts(), to->instsEnd());
}
  

void OopNCode::moveTo_inner(NCodeBase* /*to*/, int32 delta, int32 /*size*/) {
  rememberLink.shift(delta);
}
  

void OopNCode::remember() {
  if (rememberLink.isEmpty()) Memory->code->rememberLink.add(&rememberLink);
}

// The LocChange stuff is necessary because several setHis can share
// a single add/or.

class LocChange {
 public:
  addrDesc* p;
  oop newOop;
};

bool OopNCode::scavenge_contents() {
  ResourceMark m;
  bool needToInvalICache = false;
  char* bound = Memory->new_gen->boundary();
  rememberLink.init();
  addrDesc* p = locs(), *end = locsEnd();
  LocChange* changes = NEW_RESOURCE_ARRAY( LocChange, end - p);
  int32 locLen = 0;
  for (; p < end; p++) {
    if (p->isOop()) {
      oop oldOop = (oop)p->referent(this);
      oop newOop = oldOop->scavenge();
      if (newOop != oldOop) {
        changes[locLen].p = p;
        changes[locLen].newOop = newOop;
        locLen ++;
        needToInvalICache = true;
      }
      check_store(newOop, bound);
    }
  }
  for (LocChange* l = &changes[0]; locLen > 0; locLen--, l++) {
    l->p->set_referent(this, (char*)l->newOop);
  }
  return needToInvalICache;
}

void OopNCode::gc_mark_contents() {
  ResourceMark m;
  addrDesc* p = locs(), *end = locsEnd();
  LocChange* changes = NEW_RESOURCE_ARRAY( LocChange, end - p);
  int32 locLen = 0;
  for (; p < end; p++) {
    if (!p->isOop()) {
      // no oops here
    } else {
      oop oldOop = (oop)p->referent(this);
      oop newOop = oldOop;
      MARK_TEMPLATE(&newOop);
      if (newOop != oldOop) {
        changes[locLen].p = p;
        changes[locLen].newOop = newOop;
        locLen++;
      }
    }
  }
  for (LocChange* l = &changes[0]; locLen > 0; locLen--, l++) {
    l->p->set_referent(this, (char*)l->newOop);
  }
}

bool OopNCode::gc_unmark_contents() {
  ResourceMark m;
  bool needToInvalICache = false;
  addrDesc* p = locs(), *end = locsEnd();
  LocChange* changes = NEW_RESOURCE_ARRAY( LocChange, end - p);
  int32 locLen = 0;
  for (; p < end; p++) {
    if (!p->isOop()) {
      // no oops here
    } else {
      oop oldOop = (oop)p->referent(this);
      oop newOop = oldOop;
      UNMARK_TEMPLATE(&newOop);
      if (newOop != oldOop) {
        changes[locLen].p = p;
        changes[locLen].newOop = newOop;
        locLen ++;
        needToInvalICache = true;
      }
    }
  }
  for (LocChange* l = &changes[0]; locLen > 0; locLen--, l++) {
    l->p->set_referent(this, (char*)l->newOop);
  }
  return needToInvalICache;
}

void OopNCode::relocate() {
  ResourceMark m;
  addrDesc* p = locs(), *end = locsEnd();
  LocChange* changes = NEW_RESOURCE_ARRAY( LocChange, end - p);
  int32 locLen = 0;
  for (; p < end; p++) {
    if (!p->isOop()) {
      // no oops here
    } else {
      oop oldOop = (oop)p->referent(this);
      oop newOop = oldOop;
      RELOCATE_TEMPLATE(&newOop);
      if (newOop != oldOop) {
        changes[locLen].p = p;
        changes[locLen].newOop = newOop;
        locLen ++;
      }
    }
  }
  for (LocChange* l = &changes[0]; locLen > 0; locLen--, l++) {
    l->p->set_referent(this, (char*)l->newOop);
  }
}

// go through any oops embedded in the actual machine code -- dmu 7/93

bool OopNCode::switch_pointers(oop from, oop to,
                               nmethodBList* nmethods_to_invalidate) {
  Unused(nmethods_to_invalidate);
  ResourceMark m;
  bool needToInvalICache = false;
  char* bound = Memory->new_gen->boundary();
  addrDesc* p = locs(), *end = locsEnd();
  LocChange* changes = NEW_RESOURCE_ARRAY( LocChange, end - p);
  int32 locLen = 0;
  for (; p < end; p++) {
    if (!p->isOop()) {
      // no oops here
    } else {
      oop oldOop = (oop)p->referent(this);
      if (oldOop == from) {
        changes[locLen].p = p;
        locLen ++;
        check_store(to, bound);
        needToInvalICache = true;
      }
    }
  }
  for (LocChange* l = &changes[0]; locLen > 0; locLen--, l++) {
    l->p->set_referent(this, (char*)to);
  }
  return needToInvalICache;
}

bool OopNCode::code_oops_do(oopsDoFn f) {
  ResourceMark m;
  bool needToInvalICache = false;
  char* bound = Memory->new_gen->boundary();
  addrDesc* p = locs(), *end = locsEnd();
  LocChange* changes = NEW_RESOURCE_ARRAY( LocChange, end - p);
  int32 locLen = 0;
  for (; p < end; p++) {
    if (!p->isOop()) {
      // no oops here
    } else {
      oop oldOop = (oop)p->referent(this);
      oop newOop = oldOop;
      OOPS_DO_TEMPLATE(&newOop, f);
      if (newOop != oldOop) {
        changes[locLen].p = p;
        changes[locLen].newOop = newOop;
        locLen ++;
        check_store(newOop, bound);
        needToInvalICache = true;
      }
    }
  }
  for (LocChange* l = &changes[0]; locLen > 0; locLen--, l++) {
    l->p->set_referent(this, (char*)l->newOop);
  }
  return needToInvalICache;
}


bool NCodeBase::verify2(const char* name) {
  bool r = true;
  if ((int32)this & (oopSize - 1)) {
    error2("alignment error in %s at %#lx", name, this);
    r = false;
  }
  if (instsLen() > 256 * K) {
    error3("instr length of %s at %#lx seems too big (%ld)", name, this, instsLen());
    r = false;
  }
  return r;
}
  
bool OopNCode::verify() {
  bool r = true;
  const char* name = isNMethod() ? "nmethod" : (isCacheStub() ? " PIC" : "count stub");
  NCodeBase::verify2(name);
  if (!rememberLink.verify_list_integrity()) {
    lprintf("\tof rememberLink of %s %#lx\n", name, this);
    r = false;
  }
  
  for (addrDesc* l = locs(); l < locsEnd(); l++) {
    bool ok = isNMethod() ?
      l->verify((nmethod*)this) : l->verify((CacheStub*)this);
    if (! ok) {
      lprintf("\t\tin %s at %#lx\n", name, this);
      r = false;
    } else if (l->isOop() && // not no oops here
               oop(l->referent(this))->is_new() &&
               rememberLink.isEmpty()) {
      error2("%s %#lx should be remembered", name, this);
      r = false;
    }
  }
  return r;
}

NCodeBase* findThing(void* addr) {
  if (Memory->code->stubs->contains(addr)) {
    return findStub(addr);
  } else if (Memory->code->contains(addr)) {
    nmethod* n= nmethod_from_insts((char*)addr);
    assert(isNMethod(n), "not a method");
    return n;
  } else {
    return NULL;
  }
}  


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
