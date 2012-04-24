/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


inline memOop offsetEntry::add_offset(memOop p, memOop* _ptr) {
  if (this == NULL) return p;
  if (ptr == _ptr) return memOop(REDERIVE(p, offset));
  return next->add_offset(p, _ptr);
}

inline memOop oTable::add(memOop p) {
  assert( Memory->is_obj_heap((oop*)p->addr()), "Objects must be in heap");
  if (!bottom || point.index == object_table_size) grow();
  oTableEntry* e = &point.buffer->entries[point.index++];
  e->obj = p;
  e->mark = p->mark();
  p->gc_forward_to(e);
  return as_memOop(e);
}

inline void oTable::record_derivation(memOop* ptr, int32 offset) {
  // record derived pointer
  offsets = new offsetEntry(ptr, offset, offsets);
}

inline memOop oTable::restore_derivation(memOop p, memOop* ptr) {
  return offsets->add_offset(p, ptr);
}
