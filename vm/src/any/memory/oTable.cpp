/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation  "oTable.hh"
# pragma implementation  "oTable_inline.hh"

# include "_oTable.cpp.incl"

void* oTableObj::operator new(size_t size){ 
  assert(Memory->object_table, "object_table must exist");
  return Memory->object_table->resource_area.allocate_bytes(size);
}

void oTable::grow() {
  if (!bottom) {
#  if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
     // Since resource marks can not be used on this separate resource area
     // the nesting level is incremented manually to prevent warnings.
     resource_area.nesting++;
    }
#   endif
   bottom = new oTableBuffer; 
   point.buffer = bottom; 
   offsets = NULL; 
 } else {
   point.buffer->next = new oTableBuffer;
   point.buffer = point.buffer->next;
   point.index = 0;
 }
}

void oTable::gc_mark_contents() {
  current.buffer= bottom;  current.index= 0;
  gc_mark_rest();
}

void oTable::gc_mark_rest() {
  for (; current.buffer;
         current.buffer= current.buffer->next, current.index= 0) {
    for (; current.index < object_table_size; current.index++) {
      if (   current.buffer == point.buffer
          && current.index == point.index) return;
      oopsOop p = (oopsOop) current.buffer->entries[current.index].obj;
#     if GENERATE_DEBUGGING_AIDS
        if (CheckAssertions) {
          LOG_EVENT2("Marking map of 0x%x index %d", p, current.index);
        }
#     endif
      p->map()->gc_mark_contents(p);
#     if GENERATE_DEBUGGING_AIDS
        if (CheckAssertions) {
          LOG_EVENT1("Marking referents of 0x%x", p);
        }
#     endif
      p->gc_mark_referents();
    }
  }
}

bool oTable::contains(memOopClass* p) {
  for (oTableBuffer* b = bottom; b; b = b->next) {
    if (b == point.buffer) {
      if ((oTableEntry*)p >= &b->entries[0] && 
          (oTableEntry*)p < &b->entries[point.index]) {
        return true;
      }
    } else if ((oTableEntry*)p >= &b->entries[0] && 
               (oTableEntry*)p < &b->entries[object_table_size]) {
        return true;
      }
  }
  return false;
}
      
