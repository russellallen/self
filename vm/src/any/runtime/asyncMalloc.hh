/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// A simple allocator which allows you to use malloc in signal handlers
// as long as you don't exceed the buffer capacity (the buffer is refilled
// at every allocation if possible).

class AsyncAllocator {
  int32  size;          // size of elements
  int32  capacity;      // buffer capacity
  int32  n;             // current size of buffer
  char** buf;

 public:
  void* operator new(size_t size) { return ::selfs_malloc(size); }
  AsyncAllocator(int32 elemSize, int32 bufSize);
  ~AsyncAllocator();

  char* async_malloc(size_t s) {
    if (s != size) fatal("wrong size");
    return 
      MallocInProgress || n != capacity
        ?  async_malloc_elem()
        : (char*)::selfs_malloc(s);
  }

  void async_free(void* ptr) {
    if (MallocInProgress || n != capacity) {
      async_free_elem(ptr);
    } else {
      ::selfs_free(ptr);
    }
  }
 protected:
  char* async_malloc_elem();
  void  async_free_elem(void* ptr);
  void  balanceBuffer(int32 howMany);
};
