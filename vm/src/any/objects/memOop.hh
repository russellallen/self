/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


extern "C" {
  // enumeration: the next two are coded in assember for speed

  oop* find_this_object(oop* middle);
  //  for ( ; !(*middle)->is_mark(); --middle) return middle;

  oop* find_next_object(oop* middle);
  //  for ( ++middle; !(*middle)->is_mark(); ++middle) return middle;

  oop* find_prior_reference(oop* middle, oop target);
  //  for ( ; (*middle) != target; --middle) return middle;
}

class memOopClass: public oopClass {
 public:
  // instance variable
  // markOop _mark;
  // moved up to oopClass to avoid C++ bogosity of uneeded dummy in this class
  // --dmu 7/91
  mapOop _map;
  
  // add_families_1 relies on the layout of this class:
  // friend void enumeration_list::add_families_1(oop* bottom, oop* top);
  
  // constructor
  static memOop as_memOop(void* p) { return memOop(int32(p) + Mem_Tag); }
  
  // "destructor"
  memOopClass* addr() { return (memOopClass*) (int32(this) - Mem_Tag); }
  
  // space operations, is_old/new work since oop > pointer!
  bool is_old() { return (char*)this >= Memory->old_gen->low_boundary;  }
  bool is_new() { return (char*)this <  Memory->new_gen->high_boundary; }

  memOop relocate() { return Memory->relocate(this); }

  // memOop marking (to mark beginning of object if forwarded,
  //   and DerivedPointers are allowed)
 private: 
  static const int mark_memOop_bit = BitsPerWord - 1;
  void assert_marked_memOop() {
    assert(is_marked_memOop(this), "should have the mark_memOop bit set");
  }
  void assert_unmarked_memOop() {
    assert(!is_marked_memOop(this), "should no have the mark_memOop bit set");
  }
 public:
  friend memOop mark_memOop(memOop p) {
    p->assert_unmarked_memOop();
    int32 bits = (int32) p;
    setNth(bits, mark_memOop_bit);
    memOop(bits)->assert_marked_memOop();
    return memOop(bits); 
  }
  friend memOop unmark_memOop(memOop p) {
    p->assert_marked_memOop();
    int32 bits = (int32) p;
    clearNth(bits, mark_memOop_bit);
    memOop(bits)->assert_unmarked_memOop();
    return memOop(bits); 
  }
  friend bool is_marked_memOop(memOop p) {
    int32 bits = (int32) p;
    return isSet(bits, mark_memOop_bit); 
  }

  // mark accessors
  markOop mark() { return addr()->_mark; }
  void set_mark(markOop m) { addr()->_mark = m; }
  
  void set_mark_to_marked_memOop(memOop p) { set_mark(markOop(mark_memOop(p))); }
  
  memOop unmarked_memOop_from_my_mark() {
    assert(mark()->is_mem(), "mark isn't a forwarding memOop");
    return unmark_memOop(memOop(mark())); 
  }
  bool is_mark_a_marked_memOop() {
    markOop m = mark();
    return m->is_mem() && is_marked_memOop(memOop(m));
  }
    
  // map accessors
  Map* map();

  void set_map(Map* m, bool cs = true);
  void set_canonical_map(Map* new_map);

  void canonicalize_map();

  // mark ops
  
  // use this after a copy to get a new mark
  void init_mark() { set_mark(initial_markOop); }
  
  // mark operations
  inline smi identity_hash();   // inlined in memOop.h
  void set_identity_hash(smi);
  bool is_objectMarked()  { return mark()->is_objectMarked(); }
  void   markThisObject() { set_mark(mark()->with_objectIsMarked()); }
  void unmarkThisObject() { set_mark(mark()->without_objectIsMarked()); }
  
  // memory operations
  oop scavenge();
  bool verify();
  bool verify_oop(bool expectErrorObj = false);
  void print_oop();
  void print_string(char* buf);
  
  // forwarding operations
  bool is_forwarded() { return is_mark_a_marked_memOop(); }
  void forward_to(memOop p) {
    assert(p->is_mem(), "forwarding to something that's not a memOop");
    set_mark_to_marked_memOop(p); }
  memOop forwardee() { return unmarked_memOop_from_my_mark(); }
  
  // marking operations
  bool is_gc_marked() { return is_mark_a_marked_memOop(); }
  void gc_forward_to(oTableEntry* p) { set_mark_to_marked_memOop(as_memOop(p)); }
  memOop gc_forwardee() { return unmarked_memOop_from_my_mark(); }
  oTableEntry* as_oTableEntry() { return (oTableEntry*) addr(); }
  
  // garbage collection operations
  inline oop gc_mark();                         // inlined in memOop.h
  inline oop gc_mark_derived(oop* ptr, int32 offset);
  inline oop gc_unmark(); 
  inline oop gc_unmark_derived(oop* ptr);
  void gc_moved() {
    oTableEntry* e = gc_forwardee()->as_oTableEntry();
    e->obj = this;
    set_mark(e->mark); }
  
  // derived pointer support
  int32 compute_derived_offset();
  static bool is_object_start(oop p) {
    assert(((int)p & 0xffffff00) != 0x21212100, "catching a bug!");
    return p->is_mark() || (p->is_mem() && is_marked_memOop(memOop(p))); } 
  int32 derived_offset() {
    assert(((int)this & 0xffffff00) != 0x21212100, "bug catching");
    return is_object_start(mark()) ? 0 : compute_derived_offset(); }

  // compiler support
  static int32 map_offset() {
    // byte offset from a tagged memOop (i.e. returns 3)
    return int32(&memOop(0)->addr()->_map); }
};

static inline memOop as_memOop(void* p) {
  return memOopClass::as_memOop(p);
}

static inline int32 map_offset() {
  return memOopClass::map_offset();
}

static inline bool is_object_start(oop p) {
  return memOopClass::is_object_start(p);
}

