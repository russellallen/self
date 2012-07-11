/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// A lookup target represents an object visited during a lookup.
// By standing between the lookup routines and the real object,
//   these classes allow the lookup routines to handle vframes,
//   and to record paths (for DI, I think)

class lookupTarget: public ResourceObj {
 protected:
  Map* targetMap; // used for lookup

  void set_map(Map* m) { targetMap = m;}

 public:
  Map*     map() {return targetMap;}
  
 public:
  lookupTarget(Map* m) {
    set_map(m);
  }
  
 public:
  // EQ used by lookup to see if prev hit is same as this one
  virtual bool EQ(lookupTarget* t) = 0; // used by lookup
  
  // used for lookup
  
  virtual bool check_cycle_mark() { return false; }
  virtual void   set_cycle_mark() {}
  virtual void clear_cycle_mark() {}

  virtual lookupTarget* get_target_for_slot(slotDesc* s, simpleLookup* L) = 0;
  
  virtual void add_slot_dependency(simpleLookup* L) { Unused(L); }
  
  virtual void add_dependency(slotDesc* s, simpleLookup* L) {
    Unused(s); Unused(L); }
  


  // for code gen, & to decide whether to cache method


  // for code gen

  virtual bool is_receiver()      { return false;}

  virtual bool is_object()        { return false; }
  
  virtual bool is_map()           { return false; }
  virtual bool is_vframe()        { return false; }
  virtual bool is_object_or_map() { return false; } // & for caching decision


  // for interpretation & al
  
  virtual oop  get_slot(slotDesc* sd) {
    Unused(sd); ShouldNotCallThis(); return 0; }
  virtual void set_slot(slotDesc* sd, oop x) {
    Unused(sd); Unused(x); ShouldNotCallThis(); }

  // used for equality predicates
  
  virtual bool is_scope()              { return false; }

  
  virtual void print() = 0;
  
 protected:
  void printStatus();
};

class objectOrMapLookupTarget: public lookupTarget {
 protected:
  // records if this target is guaranteed to be the same
  //   object or map as the receiver of the lookup
  bool _is_receiver; // easier to keep it in here
  
 public:
  objectOrMapLookupTarget(Map* m) : lookupTarget(m) { _is_receiver = false; }

 public:
  void add_slot_dependency(simpleLookup* L) { L->add_slot_dependency(map()); }
  void add_dependency(slotDesc* s, simpleLookup* L) {
    L->add_dependency(s, map()); }
  
  bool is_object_or_map() { return true; }
  
  lookupTarget* get_target_for_slot(slotDesc* s, simpleLookup* L) = 0;

  bool is_receiver() { return _is_receiver; }
  objectOrMapLookupTarget*  be_receiver() { _is_receiver = true; return this; }
};


class assignableSlotLink: public ResourceObj {
public:
  slotDesc* slot;
  objectLookupTarget* target;
  assignableSlotLink* next;
  
  assignableSlotLink(slotDesc* s, objectLookupTarget* t) {
    slot = s; target = t; next = 0; }
  assignableSlotLink* add(slotDesc* s, objectLookupTarget* t);
  
  void print();
};

class objectLookupTarget: public objectOrMapLookupTarget {
 public:
  oop obj;
  realSlotRef* prevTargetSlot; // used to generate code, set by lookup
  assignableSlotLink* links; // set by lookup, used to gen DI verify code

  // used to optimize DI check, records when exact identity of object
  //  (as opposed to its map) is known statically
  // set upon compiler creation if lookup found a method (why?) -- dmu
  // also set mysteriously by EQ
  
  bool value_constrained;
  
 public:
  objectLookupTarget(oop p)
  : objectOrMapLookupTarget(p->map()) {
      obj = p; prevTargetSlot = 0;
      links = 0; value_constrained = false; }
  
  bool EQ(lookupTarget* t) {
    if (t->is_object()) {
      value_constrained = true;
      ((objectLookupTarget*) t)->value_constrained = true;
      return obj == ((objectLookupTarget*) t)->obj;
    } else {
      return false;
    }
  }

  bool check_cycle_mark() {
    return obj->is_mem() && memOop(obj)->is_objectMarked(); }
  void set_cycle_mark() {
    if (obj->is_mem()) {
      assert(! memOop(obj)->is_objectMarked(), "already marked!");
      memOop(obj)->markThisObject(); } }
  void clear_cycle_mark() {
    if (obj->is_mem()) {
      assert(memOop(obj)->is_objectMarked(), "not already marked!");
      memOop(obj)->unmarkThisObject(); } }
  
  bool is_object() { return true; }

  lookupTarget* get_target_for_slot(slotDesc* s, simpleLookup* L);
  
  oop  get_slot(slotDesc*);
  void set_slot(slotDesc*, oop);

 public:
  virtual void print_short();
  void print();
};


class mapLookupTarget: public objectOrMapLookupTarget {
 public:
  mapLookupTarget(Map* m) : objectOrMapLookupTarget(m) {}
 public:
  bool EQ(lookupTarget* t) { return t->is_map()  &&  map() == t->map(); }
  
  lookupTarget* get_target_for_slot(slotDesc* s, simpleLookup* L);
  
 protected:
  bool is_map() { return true; }
  
 public:
  void print();
};

class vframeLookupTarget: public lookupTarget {
 public:
  abstract_vframe* vf;
  oop receiver;
  
  vframeLookupTarget(abstract_vframe* f, oop r)
    : lookupTarget(f->method()->map())
       { vf = f; receiver = r; }
  
  bool EQ(lookupTarget* t) {
    return t->is_vframe() && vf->EQ(((vframeLookupTarget*) t)->vf); }
  
  lookupTarget* get_target_for_slot(slotDesc* s, simpleLookup* L);

  oop get_slot(slotDesc*);
  void set_slot(slotDesc*, oop);
  
 protected:
  bool is_vframe() { return true; }
  
 public:
  void print();
};

# ifdef SIC_COMPILER
  class sicScopeLookupTarget: public lookupTarget {
  public:
    SScope* scope;
    
    sicScopeLookupTarget(SScope* s);
    
    bool EQ(lookupTarget* t) {
      return t->is_scope() && scope == ((sicScopeLookupTarget*) t)->scope; }
    
    lookupTarget* get_target_for_slot(slotDesc* s, simpleLookup* L);
    
  protected:
    bool is_scope() { return true; }
    
  public:
    void print();
  };
# endif

