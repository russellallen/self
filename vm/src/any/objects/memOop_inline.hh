#pragma once
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "memOop.hh"
# include "oTable_inline.hh"



inline oop memOopClass::gc_mark() {
  return is_gc_marked() ?
    oop(gc_forwardee()) : oop(Memory->object_table->add(this));
}

inline oop memOopClass::gc_mark_derived(oop* ptr, int32 offset) {
  assert(!Memory->is_heap(ptr), "should have derived pointers only on stack");
  if (offset != 0) {
    Memory->object_table->record_derivation((memOop*) ptr, offset);
  }
  return gc_mark();
}

inline oop memOopClass::gc_unmark() {
  return oop(as_oTableEntry()->obj);
}

inline oop memOopClass::gc_unmark_derived(oop* ptr) {
  assert(!Memory->is_heap(ptr), "should have derived pointers only on stack");
  memOop p = memOop(gc_unmark());
  p = Memory->object_table->restore_derivation(p, (memOop*) ptr);
  return oop(p);
}

inline smi memOopClass::identity_hash() {
  // don't clean up the addr()->_mark below to mark(), 
  // since hash_markOop can modify its argument
  return hash_markOop(addr()->_mark);
}

