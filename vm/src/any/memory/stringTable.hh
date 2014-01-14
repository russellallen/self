/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// The string table (Memory->string_table) holds all canonical strings. 
// It is implemented as an open hash table with a fixed number of buckets.
// A bucket (stringTableEntry) is a union containing either:
//   NULL             => bucket is empty.
//   stringOop        => bucket has one element.
//   stringTableLink* => bucket has more than one element.

// SPACE HACK:
//  - stringTableLinks are allocated in blocks to reduce the malloc overhead.

const int32 string_table_size = 20011;

int32 hash(const char* name, int32 len);

class stringTableLink {
 public:
  // instance variable
  stringOop string;
  stringTableLink* next;
  
  // memory operations
  bool verify(fint i);
};

class stringTableEntry {
 public:
  void* string_or_link;
  bool is_string() { return oop(string_or_link)->is_mem(); }
  void clear()     { string_or_link = NULL; }

  stringOop get_string() {
    return stringOop(string_or_link); }
  void set_string(stringOop s) {
    string_or_link = (void*) s; }

  stringTableLink* get_link() {
    return (stringTableLink*) string_or_link; }
  void set_link(stringTableLink* l) {
    string_or_link = (void*) l; }

  // memory operations
  bool verify(fint i);
# ifdef UNUSED
  void deallocate();
#endif
  
  fint length();
};

class stringTable: public CHeapObj {
 private:
  // instance variables
  stringTableEntry buckets[string_table_size];
  stringTableLink* free_list;
  stringTableLink* first_free_link;
  stringTableLink* end_block;
 public:
  // constructor
  stringTable();

  // operations
  stringOop lookup(const char* name, int32 len, bool mustAllocate= true);
 protected:
  stringOop basic_add(const char *name, int32 len, int32 hashValue,
                      bool mustAllocate= true);
  stringOop basic_add(stringOop s, int32 hashValue);
  stringTableEntry* bucketFor(int32 hashValue) {
    assert(hashValue % string_table_size >= 0, "must be positive");
    return &buckets[hashValue % string_table_size]; }
  stringTableEntry* firstBucket() { return &buckets[0]; }
  stringTableEntry* lastBucket()  { return &buckets[string_table_size-1]; }
 public:
  void add(stringOop s);
  
  // memory operations
  void switch_pointers(oop from, oop to);
  void scavenge_contents() {}   // nothing to scavenge; all tenured
  void gc_mark_contents();
  void gc_unmark_contents();
  void relocate();
  bool verify();

  // snapshot operations
  void read_snapshot(FILE* file);
  void write_snapshot(FILE* file);

  // memory management for stringTableLinks
  stringTableLink* new_link(stringOop s, stringTableLink* n = NULL);
  void             delete_link(stringTableLink* l);

  // histogram
  void print_histogram();
};
