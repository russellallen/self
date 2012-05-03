/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


extern "C" {
  oop scavenge_prim(oop);
}

// Forward-declaration for friend
oop unwind_protect_prim(oop doBlock, oop protectBlock);


class oopClass {
 public:
  // _mark moved up here from memOop to avoid C++ bogosity --dmu
  // (C++ makes sizeof(oopClass) == 4 if it is empty, thus messing up all
  // the subclasses; both Sun C++ and gcc do this)
  markOop _mark;


  // dummy constructor - cannot create instances of oop classes
  oopClass()            { ShouldNotCallThis(); }
  oopClass(oopClass &o) { Unused(o); ShouldNotCallThis(); }
  
  // accesses
  fint tag() { return maskBits(int32(this), Tag_Mask); }
  
  // tag dispatchers (inlined in oop.h)
  inline Map* map();
  inline smi identity_hash();
  inline oop scavenge();
  inline oop gc_mark();
  inline oop gc_mark_derived(oop* ptr, int32 offset);
  inline oop gc_unmark();
  inline oop gc_unmark_derived(oop* ptr);
  inline oop relocate();
  
  // derived pointer support
  inline int32 derived_offset();

  // extend the following operations to immediates for enumeration--dmu
  inline void unmarkThisObject();
  inline void   markThisObject();
  inline bool    is_objectMarked();

  // tag checks
  bool is_smi()   { return tag() == Int_Tag; }
  bool is_mem()   { return tag() == Mem_Tag; }
  bool is_float() { return tag() == Float_Tag; }
  bool is_mark()  { return tag() == Mark_Tag; }
  
  // tag mutation (functional)
  markOop markify()  { return markOop(clearTag(this) | Mark_Tag); }
   memOop  memify()  { return  memOop(clearTag(this) |  Mem_Tag); }
  
  // generation testers (inlined in oop.h)
  inline bool is_old();
  inline bool is_new();
  inline generation* my_generation(); // This one not by Pete Townshend
  
  // map operations (inlined in oop.h)
  inline bool is_assignment();
  inline bool is_block();
  inline bool is_byteVector();
  inline bool is_map();
  inline bool is_objVector();
  inline bool is_slots();
  inline bool is_string();
  inline bool is_mirror();
  inline bool is_programmable_slots();
  inline bool is_process();
  inline bool is_vframe();
  inline bool is_method_like();
  inline bool is_killable();      // See comment below.
  inline bool is_foreign();
  inline bool is_proxy();
  inline bool is_fctProxy();
  inline bool is_profiler();
  
  inline bool is_block_with_code();     // inlined in blockOop.h

  inline fint size();
  inline fint byte_size(); // how many bytes in the heap?

  inline fint arg_count();
  
  
  inline slotDesc* find_slot(stringOop name);
  inline slotDesc* find_nonVM_slot(stringOop name); // remove when you remove VM slots
  
  inline oop* get_slot_data_address(slotDesc* slot);
  inline oop* get_slot_data_address(stringOop name);
  inline oop* get_slot_data_address_if_present(stringOop name, bool &inObj);
  oop* get_slot_data_address_if_present(const char*name, bool &inObj);
  inline oop get_slot(slotDesc* slot);
  inline oop get_slot(stringOop name);

  inline void set_slot(slotDesc* sd,  oop x);
  
  // programming prims
  oop define_prim(oop contents, void *FH);
  oop define(oop contents);
  inline oop add_slots(oop contents, bool new_only, void *FH);
  inline oop copy_add_slot(stringOop name, slotType t, oop contents,
                           oop anno, bool mustAllocate= false);
  inline oop copy_remove_slot(stringOop name, bool mustAllocate= false);
  friend oop unwind_protect_prim(oop doBlock, oop protectBlock);

  void switch_pointer(oop* where, oop to); // part of define

  // used by programming prims

  oop fix_up_method( oop old_optimized_method, 
                     bool isOKToBashLiteralVector= false,
                     bool mustAllocate= true,
                     IntBList* stack_deltas = NULL);

  oop evaluate_in_context_prim(oop meth);

  inline fint length_obj_array();
  inline void obj_at_put(fint which, oop contents);
  
  inline char byte_at(fint which);
  
  inline bool          has_code();

  inline byteVectorOop codes();
  inline objVectorOop  literals();
  inline stringOop     file();
  inline smiOop        line();
  inline stringOop     source();  
   
  inline MethodKind    kind();
  
  // more for enums, and _Define
  inline bool is_enumerable(oop* matching_cell);
  
#define CANFAIL false

  inline oop clone_into_same_gen(oop obj, bool mustAllocate= true);
  inline oop clone(bool mustAllocate= true);
  inline oop cloneSize(fint length, bool mustAllocate= true, oop filler= NULL);

  inline bool verify_oop(bool expectErrorObj = false);
  inline bool verify_oop_mark_ok();
  inline bool verify();
  inline bool verifyBytesPart(char*& b);

  // printing functions
  void print();            // Normal Self level _Print.
  void print_real();       // Like print, but always prints address. 
  void print_oop();        // Second level print, used e.g. for printing slot
                           // contents. Normally shorter form than print().
                           // Defaults to <objectID>.
  void print_real_oop();   // Like print_oop, but always prints address. 
  void print_string(char* buf); // for printing oops in error messages to
                                // the programmer, e.g. bad labels
  char* debug_print();     // for internal VM debugging use
  
  // mirror functions
  mirrorOop as_mirror(bool mustAllocate= true); // return a mirror on this object
  mirrorOop as_mirror_or_fail() { return as_mirror(false); }
  
  inline oop mirror_reflectee();
  inline oop mirror_codes();
  inline oop mirror_literals();
  inline oop mirror_source();
  inline oop mirror_source_offset();
  inline oop mirror_source_length();
  inline oop mirror_file();
  inline oop mirror_line();

  inline oop mirror_names();
  inline oop mirror_name_at(smi inx);

  inline oop mirror_contents_at(stringOop name);
  inline oop mirror_is_parent_at(stringOop name);
  inline oop mirror_is_argument_at(stringOop name);
  inline oop mirror_is_assignable_at(stringOop name);
  
  // activation mirror primitives
  inline oop mirror_sender();
  inline oop mirror_parent();
  inline oop mirror_selector();
  inline oop mirror_bci();
  inline oop mirror_receiver();
  inline oop mirror_expr_stack();
  inline oop mirror_methodHolder();

  // annotation primitives
  inline oop mirror_get_annotation();
  inline oop mirror_copy_set_annotation(oop a, bool mustAllocate= false);
  inline oop mirror_annotation_at(stringOop name);

  // killable functions 
  // An oop subclass for which is_killable() returns true, must specialize
  // the functions kill() and is_live() (they have virtual counterparts in
  // class map). Ideally, we would have a mixin class, killableClass to
  // localize this behavior, but this requires multiple inheritance. That's 
  // why it is here instead.
  // Oop instances that return is_killable() == true, will be sent kill()
  // after reading in a snapshot.                           Ole, 29/10/91.
  inline void kill();  // After kill(), is_live() must be false. Should be idempotent.
  inline bool is_live();
  
  inline int32 debug_size();    // statistics; to measure debugging-related space cost

  // primitives
  bool eq_prim(oop arg)       { return this == arg; }
  smi objectID_prim();
  oop clone_prim(void *FH);
  oop print_prim();
  oop all_prim(oop lim);
  
  oop garbage_collect_prim();
  oop tenure_prim();

  oop verify_prim();
  oop compact_prim();
  oop flush_prim();
  oop markAllUnused_prim();
  oop flushUnused_prim();
  oop flush_inline_cache_prim();
  oop print_memory_prim();
  oop print_memory_histogram_prim(smi size);
  oop print_nmethod_histogram_prim(smi size);
  oop print_slot_stats_prim();
  oop print_zone_stats_prim();
  oop manufacturer_prim();
  oop operating_system_prim();
  
  oop credits_prim();
  oop print_option_primitives_prim();
  oop print_changed_option_primitives_prim();
  
  oop quit_prim();
  
};

oop bad_prim(oop rcvr);

# define DeclareDebugPrim(                                                    \
    flagName, flagType, flagTypeName, primReturnType,                         \
    initialValue, getCurrentValue, checkNewValue, setNewValue,                \
    explanation, wizardOnly)                                                  \
                                                                              \
    oop CONC3(get_,flagName,_prim)(oop rcvr);                                 \
    oop CONC3(set_,flagName,_prim)(oop rcvr, oop flag);
  
  FOR_ALL_DEBUG_PRIMS(DeclareDebugPrim)
    
# undef DeclareDebugPrim
    
