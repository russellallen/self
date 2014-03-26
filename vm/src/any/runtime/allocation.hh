#pragma once
/* Sun-$Revision: 30.14 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "debugPrintable.hh"
# include "os_includes.hh"
# include "top.hh"




// Superclass for all (or most) VM objects.
// Used for debugging purposes: objects can can be printed with pp()
// (and with C-c C-p in emacs/gdb).  -Urs

class VMObj {
 public:
  virtual void print();

  virtual void print_short();
  
  void print_zero();
  void print_short_zero();
  void print_short_null() { if (this != NULL) print_short(); }  
  void print_null()     { if (this != NULL) print(); }

  virtual void oops_do(oopsDoFn f) { Unused((void*)f); }

  VtblPtr_t vtbl_value() { return *((VtblPtr_t*) this); }
  void set_vtbl_value(VtblPtr_t v) { *((VtblPtr_t*) this) = v; }
  void kill_vtbl_value() { set_vtbl_value(0); }

  MACOSX_DESTRUCTOR_BUG(VMObj)
};


class ResourceArea;

// Base class for all objects using the resource area.

class ResourceObj: public VMObj {
public:
  ResourceObj() {} // needed for linking under GCC 3 in Mac OS X -mabdelmalek 5/2003

  void* operator new(size_t size);
  void  operator delete(void* p);
  void* new_array(size_t size);

  MACOSX_DESTRUCTOR_BUG(ResourceObj)
};


// Base class for all objects allocated in the c-heap.

class CHeapObj: public VMObj {
public:
  CHeapObj() {} // needed for linking under GCC 3 in Mac OS X -mabdelmalek 5/2003

  void* operator new(size_t size);
  void  operator delete(void* p);
  void* new_array(size_t size);

  MACOSX_DESTRUCTOR_BUG(CHeapObj)
};


// Base class for catching new or delete.
// Calling new or delete will result in fatal error.

class NoExplicitAllocationObj: public VMObj {
 public:
  void* operator new(size_t size) {
    Unused(size);
    ShouldNotCallThis();
    return (void*)17; // to silence gcc
  };

  void  operator delete(void* p) {
    Unused(p);
    ShouldNotCallThis();
  };

  MACOSX_DESTRUCTOR_BUG(NoExplicitAllocationObj)
};

// Base class for all objects allocated on the stack only.
// Calling new or delete will result in fatal error.

class StackObj: public NoExplicitAllocationObj {
 public:
  MACOSX_DESTRUCTOR_BUG(StackObj)
};


// Base class for all objects allocated as part of another object only.
// Added after main framework, dmu 6/96.

class PartObj: public NoExplicitAllocationObj {
 public:
};


// Base class for class that is no general, cannot commit
// to whether it is a StackObj, ResourceObj, or whatever.

class AnywhereObj: public VMObj {
 public:
};


// One of the following macros must be used when allocating an array to
// determine which area the array should reside in.
char* allocateResource(size_t); // for GCC 4
# define NEW_RESOURCE_ARRAY( type, size )\
    (type*) allocateResource( (size) * sizeof(type))

# define NEW_C_HEAP_ARRAY( type, size )\
    (type*) AllocateHeap( (size) * sizeof(type), XSTR(type) " in " __FILE__)

# define NEW_RESOURCE_OBJ( type ) NEW_RESOURCE_ARRAY( type, 1 )

// The resource area holds temporary data structures of the VM.  Things
// in the resource area can be deallocated very efficiently using
// ResourceMarks.  (The destructor of a ResourceMark will deallocate
// everything that was created since the ResourceMark was created.)

const fint min_resource_chunk_size = 100 * K;
const fint min_resource_free_size  =  32 * K;

class ResourceAreaChunk: VMObj {
  friend class ResourceMark;
  friend class ResourceArea;
  friend class Resources;
  char* bottom;
  char* top;
  char* first_free;
  ResourceAreaChunk* prev;

  fint _allocated;     // Allocated bytes in this and previous chunks.
  fint _previous_used; // Used bytes in previous chunks.

  void clear(char *start, char *endArg) { memset(start, 33, endArg - start); }
  void clear() { clear(bottom, first_free); }
  void freeTo(char *new_first_free);

public:
  char* allocate_bytes(fint size) {
    char* p = first_free;
    if (first_free + size  >  top)
      return NULL;

# if  GENERATE_DEBUGGING_AIDS
      extern bool PrintResourceAllocation; // to break cycle in includeDB
      if (PrintResourceAllocation)
        lprintf("allocating %ld bytes at 0x%lx\n", (long)size, p);
#   endif

#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions  &&  p == (char*)catchThisOne)
        warning1("ResourceAreaChunk::allocate_bytes caught 0x%lx", p);
#   endif

    first_free += size;
    return p;
  }

  ResourceAreaChunk(fint min_capacity, ResourceAreaChunk* previous);
  ~ResourceAreaChunk();

  void initialize(ResourceAreaChunk* previous);

  fint capacity() { return top        - bottom; }
  fint used()     { return first_free - bottom; }
  
  bool contains(void* p) {
    if (p >= (void*) bottom && p < (void*) top) return true;
    else if (prev) return prev->contains(p);
    else return false; }

  void print();
  void print_short() { lprintf("ResourceAreaChunk %#lx", this); }
};

class ResourceArea {
 public:
  ResourceAreaChunk* chunk;       // current chunk
  fint nesting;      // current # of nested ResourceMarks
                          // (will warn if alloc with nesting == 0)
  
  ResourceArea();
  ~ResourceArea();

  char* allocate_more_bytes(int32 size);
  char* allocate_bytes(int32 size) {
    assert(size    >= 0, "negative size in allocate_bytes");
    assert(nesting >= 0, "memory leak!");
    if (size == 0) {
      // want to return an invalid pointer for a zero-sized allocation,
      // but not NULL, because routines may want to use NULL for failure.
      return (char*) 1;
    }
    size = roundTo(size, oopSize);
    if (chunk) {
      char* p = chunk->allocate_bytes(size);
      if (p)
        return p;
    }
    return allocate_more_bytes(size);
  }

  fint capacity() { return chunk ? chunk->_allocated : 0; }
  
  int32 used();
  bool contains(void* p) { return chunk != NULL && chunk->contains(p); }
};

// A resource mark releases all resources allocated after it was created
// when the mark is deleted.  Typically used as a local variable.
class ResourceMark: public ResourceObj {
 private:
  ResourceArea* area;
  ResourceAreaChunk* chunk;
  char* top;
 public:
  ResourceMark();
  ~ResourceMark();
};

class Resources {
 private:
  ResourceAreaChunk* freeChunks;  // list of unused chunks
  fint               _allocated;    // total number of bytes allocated
  bool               _in_consistent_state;
  ResourceAreaChunk* getFromFreeList(fint min_capacity);
 public:
  Resources();
  ResourceAreaChunk* new_chunk(fint min_capacity, ResourceAreaChunk* area);
  
  void addToFreeList(ResourceAreaChunk* c);
  bool in_consistent_state() { return _in_consistent_state; }

  bool  contains(char* p);
  int32 capacity();
  int32 used();
};

extern Resources resources;

extern void* selfs_malloc(size_t size);
extern void selfs_free(void* ptr);
extern void malloc_init();
extern bool MallocInProgress;  // allocating on C heap right now?


inline char* AllocateHeap(int32 size, const char* name, bool mustAllocate= true) {
  char* b = (char *) selfs_malloc(size);
  if (mustAllocate && b == NULL) OS::allocate_failed(name);
# if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions  &&  b && (char*)catchThisOne == b) warning("AllocateHeap caught one");
# endif
  return b;
}

inline void FreeHeap(void* p) {
# if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions  &&  (void*)catchThisOne == p) warning("FreeHeap caught one");
# endif
 selfs_free((char*) p);
}


