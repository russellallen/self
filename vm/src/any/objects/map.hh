/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// Map*'s are UNTAGGED! but mapOop's are tagged.

extern "C" {    
  void printObjectID(oop obj);
  void SetNumObjectIDs(int32 length);
  int32 getObjectID(oop obj);
}


class Map {
 public:
  // testing operations
  bool is_smi()   { return this == Memory->  smi_map; }
  bool is_float() { return this == Memory->float_map; }
  
  virtual bool is_assignment()         { return false; }
  virtual bool is_block()              { return false; }
  virtual bool is_byteVector()         { return false; }
  virtual bool is_map()                { return false; }
  virtual bool is_objVector()          { return false; }
  virtual bool is_slots()              { return false; }
  virtual bool is_string()             { return false; }
  virtual bool is_mirror()             { return false; }
  virtual bool is_programmable_slots() { return false; }
  virtual bool is_process()            { return false; }
  virtual bool is_vframe()             { return false; }
  virtual bool is_method_like()        { return false; }
  virtual bool is_killable()           { return false; }
  virtual bool is_foreign()            { return false; }
  virtual bool is_proxy()              { return false; }
  virtual bool is_fctProxy()           { return false; }
  virtual bool is_profiler()           { return false; }

  virtual bool should_canonicalize()   { return false; }
  virtual bool can_have_dependents()   { return false; }
  
  virtual VtblMapType vtblMapType() = 0;
  
  // map comparison
  bool compare(Map* m);

  // are the two maps the same modulo block map cloning?
  bool equal(Map* other);
  
  // virtual pointer value
  VtblPtr_t    vtbl_value() { return ((VtblPtr_t*) this)[0]; }
    
  void set_vtbl_value(VtblPtr_t vtbl) {((VtblPtr_t*) this)[0] = vtbl; }

  // constructor
  static Map* create_map(fint size, slotList *slots, Map *mm, oop *obj);

  // creation op
  virtual oop fill_in_slots(slotList* slist, fint slotCount) = 0;

  // accessors
  mapOop enclosing_mapOop() { return mapOopClass::enclosing_mapOop(this); }
  
  virtual fint length_slots() = 0;      // number of slots in map
  virtual fint length_nonVM_slots();    // number of user-level slots
                                        // (assignable slots count as two)
  fint    length_obj_slots();           // number of data slots in object
  virtual slotDesc* slots() { return (slotDesc*) (this + 1); }
  slotDesc *slot(fint i) { return slots() + i; }
  
  virtual SlotIterator *slotIterator() { return new SlotIterator(this); }

protected:
  fint find_slot_index_binary_for(stringOop name, bool &found);
  fint find_slot_index_linear_for(stringOop name, bool &found);
  inline slotDesc* find_slot_linear(stringOop name);
  inline slotDesc* find_slot_binary(stringOop name);
  friend void findSlot_init();

public:
  fint find_slot_index_for(stringOop name, bool &found);
  virtual slotDesc* find_slot(stringOop name);
  slotDesc* find_nonVM_slot(stringOop name);

  slotDesc* find_assignee_slot(  stringOop name);
 
  virtual oop  get_annotation() { return Memory->objectAnnotationObj; }
  // Do not call set_annotation directly--you will violate the
  // map canonicalization invariants.  Use mirror_copy_set_annotation below
  // instead! -- dmu 11/14/93
  virtual void set_annotation(oop a) {
    Unused(a); } // noop, except for slotsMaps

  // annotation primitives
  virtual oop mirror_get_annotation(oop obj);
  virtual oop mirror_copy_set_annotation(oop obj, oop a,
                                         bool mustAllocate= false);
  virtual oop mirror_annotation_at(oop obj, stringOop name);

  // programming prims
  virtual oop define(oop obj, oop contents);
  oop add_slots_to(oop src, oop dst, bool new_only, void *FH);
  virtual oop copy_add_slot(oop obj, stringOop name, slotType t, oop contents,
                            oop anno, bool mustAllocate= false);
  virtual oop copy_remove_slot(oop obj, stringOop name,
                               bool mustAllocate= false);


  // map side of define
  virtual void switch_pointer(oop obj, oop* where, oop to) = 0;
  virtual void switch_pointer_in_map(oop* where, oop to);
protected:
  virtual void switch_pointer_in_map_slot(slotDesc *s, oop* where, oop to);

public:
  // used by programming prims

  virtual oop fix_up_method( oop obj, 
                             oop old_optimized_method,
                             bool isOKToBashLiteralVector= false,
                             bool mustAllocate= true,
           IntBList* stack_deltas = NULL);
  
  // obj array operations -- none make sense on maps
  virtual fint length_obj_array(oop obj) {
    Unused(obj); ShouldNotCallThis(); return 0; }
  virtual oop* obj_array(oop obj, fint which = 0) {
    Unused(obj); Unused(which);
    ShouldNotCallThis(); return NULL; }
  virtual oop obj_at(oop obj, fint which) {
    Unused(obj); Unused(which);
    ShouldNotCallThis(); return NULL; }
  virtual void obj_at_put(oop obj, fint which, oop contents) {
    Unused(obj); Unused(which); Unused(contents);
    ShouldNotCallThis(); }
  
  // byte array operations -- none make sense on maps
  virtual fint length_byte_array(oop obj) {
    Unused(obj); ShouldNotCallThis(); return 0; }
  virtual char* byte_array(oop obj, fint which = 0) {
    Unused(obj); Unused(which);
    ShouldNotCallThis(); return NULL; }
  virtual char byte_at(oop obj, fint which) {
    Unused(obj); Unused(which);
    ShouldNotCallThis(); return 0; }
  virtual void byte_at_put(oop obj, fint which, char contents) {
    Unused(obj); Unused(which); Unused(contents);
    ShouldNotCallThis(); }
  
  // code operations -- most don't make sense here
  virtual bool has_code() { return false; }
  virtual byteVectorOop codes() { 
    ShouldNotCallThis(); return byteVectorOop(NULL); }
  virtual objVectorOop literals() {
    ShouldNotCallThis(); return objVectorOop(NULL); }
  virtual stringOop file() {
    ShouldNotCallThis(); return stringOop(NULL); }
  virtual smiOop line() {
    ShouldNotCallThis(); return smiOop_zero; }
  virtual stringOop source() { 
    ShouldNotCallThis(); return stringOop(NULL); }
  virtual MethodKind kind() {
    ShouldNotCallThis(); return MethodKind(NULL); }
  
  // cloning operations
  virtual oop clone(oop obj, bool mustAllocate= true, oop genObj= NULL) = 0;
  virtual bool can_inline_clone() { return false; }
  // If this returns true, the compiler may replace _Clone by _CloneN.
  // This means that the actual definition of clone() is ignored!!
  virtual oop cloneSize(oop obj, fint length, bool mustAllocate= true,
                        oop filler= NULL);
  
  virtual Map* initialize() { return this; }
  virtual void init(stringOop name, slotsOop method) { 
    Unused(name);  Unused(method);  SilenceOverrideWarning(); }

  
  // mirror operations
  virtual mirrorOop mirror_proto() = 0;
  virtual oop mirror_reflectee(oop r) { return r; }
  virtual oop mirror_codes(oop r);
  virtual oop mirror_literals(oop r);
  virtual oop mirror_source(oop r);
  virtual oop mirror_source_length(oop r);
  virtual oop mirror_source_offset(oop r);
  virtual oop mirror_file(oop r);
  virtual oop mirror_line(oop r);

  virtual oop mirror_names(oop r);
  virtual oop mirror_name_at(oop obj, smi inx);

  virtual oop mirror_contents_at(oop r, stringOop name);
  virtual oop mirror_is_parent_at(oop r, stringOop name);
  virtual oop mirror_is_argument_at(oop r, stringOop name);
  virtual oop mirror_is_assignable_at(oop r, stringOop name);
  virtual oop mirror_sender(oop r);
  virtual oop mirror_parent(oop r);
  virtual oop mirror_selector(oop r);
  virtual oop mirror_bci(oop r);
  virtual oop mirror_receiver(oop r);
  virtual oop mirror_expr_stack(oop r);
  virtual oop mirror_methodHolder(oop r);

  // profiler operation, returns a dummy object matching this map
  virtual oop dummy_obj(oop filler) = 0;

  // allocation operations
  virtual fint size() = 0;                      // size of map

  virtual fint empty_object_size() = 0;         // size of obj if no slots
  virtual fint object_size(oop obj) = 0;        // size of obj (incl. mark etc)
  virtual fint object_byte_size(oop obj) {      // size of obj (incl. mark and
    return object_size(obj) * oopSize; }        // bytes area, in bytes)

  // number of arguments this object takes (0 if not a method)
  virtual fint arg_count() { return 0; }
  
protected:
  Map *allocInit(mapOop new_map) { 
    return new_map == mapOop(failedAllocationOop)
             ? NULL
             : new_map->map_addr()->initialize(); }

public:
  Map* copy(bool mustAllocate= true, oop genObj= NULL) {
    // return a copy of the receiver
    return allocInit( enclosing_mapOop()->copy( enclosing_mapOop()->size(), mustAllocate, genObj) );
  }
  
  Map* grow(fint delta, bool mustAllocate= true) {
    // return a copy of the receiver with delta new slots at the end
    return allocInit( enclosing_mapOop()->grow( enclosing_mapOop()->size(),
                                            delta * sizeof(slotDesc)/oopSize,
                                            mustAllocate) );
  }

  Map* insert(fint index, bool mustAllocate= true) {
    // return a copy of the receiver with a new slot inserted at index
    mapOop mo = enclosing_mapOop();
    return allocInit(mo->insert( mo->size(),
                                 (oop*)slot(index) - (oop*)mo->addr(),
                                 sizeof(slotDesc) / oopSize,
                                 mustAllocate));
  }

  Map* remove(slotDesc* slot, fint delta, bool mustAllocate= true) {
    // return a copy of the receiver without this slot
    mapOop mo = enclosing_mapOop();
    return allocInit(mo->remove( mo->size(),
                                 (oop*) slot - (oop*)mo->addr(),
                                 delta * sizeof(slotDesc)/oopSize,
                                 mustAllocate));
  }

  
  // memory operations
  virtual bool verify(oop obj) = 0;
  virtual bool verifyBytesPart(oop obj, char*& b);
  virtual oop scavenge(oop obj) = 0;
  virtual void delete_map() {}
  virtual void shift_map(Map* target) { Unused(target); }
  virtual void gc_mark_contents(oop p) { Unused(p); } // do nothing by default

  virtual void fixup() { initialize(); }
  
  // killable operations
  virtual void    kill(oop p) { Unused(p); ShouldNotCallThis(); }
  virtual bool is_live(oop p) { Unused(p); ShouldNotCallThis(); return false;}

  virtual int32 debug_size(oop p) { Unused(p);  return 0; }
  
  // printing operations
  virtual void print_string(oop obj, char* buf);
  virtual void print_oop(oop obj);
  virtual void print(oop obj);
  virtual void print_objVector(oop obj) { Unused(obj); }
  virtual void print_byteVector(oop obj) { Unused(obj); }
  virtual void print_code(oop obj) { Unused(obj); }
  void print_map() { print(enclosing_mapOop()); }
  
  // primitive enumeration operations:
  bool has_assignment_slots();
  bool matching_slots_data(oop match);
  bool matching_slots_name(oop match);
  bool matching_slots_assignment_name(oop match);

  virtual bool is_enumerable(oop obj, oop* matching_cell) = 0;
};


static inline Map* create_map(fint size, slotList *slots, Map *mm, oop *obj) {
  return Map::create_map(size, slots, mm, obj);
}


// Because repeated searches for the same selector are common,
// we cache the unary selector corresponding to the last searched-for
// 1arg keyword selector.
class FindSlotCache {
private:
  stringOop last1ArgKW, lastUnary;
public:
  FindSlotCache() { clear(); }
  void clear() { last1ArgKW= lastUnary= stringOop(badOop); }
  inline bool checkFor1ArgKW(stringOop name, stringOop &unary);
  bool verify();
};

extern FindSlotCache findSlotCache;
