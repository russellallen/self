/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// The object table is used for pointer forwarding during a full GC.

class oTableObj {
public: 
 void* operator new(size_t size);
};

class oTableEntry {
 public:
  // instance variables
  memOop obj;
  markOop mark;
};

// Make sure oTableBuffer can be allocated in a minimal resource chunk
const int32 object_table_size = min_resource_chunk_size / sizeof(oTableEntry) - 1;

class oTableBuffer: public oTableObj {
 public:
  oTableBuffer* next;
  oTableEntry entries[object_table_size];

  oTableBuffer() { next = NULL; }

  bool is_oTableEntry(void* p) {
    return (p >= (void*) &entries[0] && p < (void*) &entries[object_table_size])
      || (next && next->is_oTableEntry(p)); }
};

class oTablePoint {
 public:
  oTableBuffer* buffer;
  int32 index;
  
  oTablePoint() { index = 0; }
};

class offsetEntry: public oTableObj {
 public:
  memOop* ptr;
  int32 offset;
  offsetEntry* next;

  offsetEntry(memOop* p, int32 o, offsetEntry* n) {
    ptr = p; offset = o; next = n; }

  inline memOop add_offset(memOop p, memOop* _ptr);     // in oTable.h
};

class oTable: public ResourceObj {
 public:
  oTableBuffer* bottom;
  oTablePoint   point;
  oTablePoint   current;
  offsetEntry*  offsets;

  // Since gc marking utilize nested resource marks oTable has to
  // use its own resource area.
  ResourceArea resource_area;
  
  oTable()  { bottom = NULL; }

  void grow();
  
  inline memOop add(memOop p);
  inline void record_derivation(memOop* ptr, int32 offset);
  inline memOop restore_derivation(memOop p, memOop* ptr);
  bool contains(memOopClass* p);

  oTableEntry* as_oTableEntry(memOopClass* p) {
    assert(contains(p),"should be a pointer to an object in the objectTable");
    return (oTableEntry*)p;
  }
  
  void gc_mark_contents();
  void gc_mark_rest();

  bool is_oTableEntry(void* p) { return bottom->is_oTableEntry(p); }
};
