/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation  "oopsOop.hh"
# pragma implementation  "oopsOop_inline.hh"

# include "_oopsOop.cpp.incl"

oopsOop oopsOopClass::scavenge(fint size) {
  assert(Memory->should_scavenge(this) && !is_forwarded(), 
         "shouldn't be scavenging"); 
  bool is_new;
  space *copySpace= Memory->survivor_space(this, size, 0, is_new);
  oop *x= copySpace->alloc_objs_local(size);
  if (x == NULL) fatal("out of space in scavenge");
# if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions  &&  x == (oop*)catchThisOne) {
    warning1("oopsOopClass::scavenge caught 0x%lx", x);
  }
# endif
  copy_oops(oops(), x, size);
  oopsOop p= as_oopsOop(x);
  if (is_new) { 
    p->set_mark(p->mark()->incr_age()); 
    Memory->age_table->add(p); 
  } 
  forward_to(p); 
  return p;
}

void oopsOopClass::gc_mark_referents() {
  oop* p = oops();
  oop* end = p + size();
  for (p ++; p < end; p ++)
    MARK_TEMPLATE(p);
}

bool oopsOopClass::verify() {
  bool flag = memOopClass::verify();
  if (flag) {
    oop* p = oops() + 1;
    oop* end = oops() + size();
    if (p > end) {
      error1("oopsOop 0x%lx has incorrect size", this);
      flag = false;
    }
    for (; p < end; p ++) {
      if (! (*p)->verify_oop()) {
        lprintf("\tof oopsOop 0x%lx\n", long(this));
        flag = false;
      }
    }
  }
  return flag;
}

void oopsOopClass::record_promotion(fint size) {
  Memory->record_multistores((oop*)addr(), (oop*)addr() + size);
}
