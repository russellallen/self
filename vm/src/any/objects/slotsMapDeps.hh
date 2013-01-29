/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

class slotsMapDeps: public slotsMap {
 protected:
  nmln _add_slot_dependents;
  nmln _map_chain;
  nmln *dependents;

 public:
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(slotsMapDeps); }

  nmln *add_slot_dependents() { return &_add_slot_dependents; }
  nmln *map_chain() { return &_map_chain; }

  // Don't canonicalize the map for the empty object!
  // Otherwise, programs that add slots to the empty object will
  // invalidate a bunch of stuff that has an empty object on the lookup
  // path. -- dmu 12/5/92
  // Also, bootstrapping may break if you canonicalize empties.
  virtual bool should_canonicalize()   { return slots_length != smiOop_zero; }
  
  // this is called from read_snapshot so don't init dependents
  // must be public because superclass has a public one
  Map* initialize() {
    Memory->new_gen->add_map(this);
    map_chain()->init(); // maps are recanonicalized at end of startup
    return this; }

 protected:
  // chain functions
  static int32 map_chain_offset() {
    return (int32) (((slotsMapDeps*) NULL)->map_chain());
  }

  friend slotsMapDeps* map_from_map_chain(nmln* p);
  static slotsMapDeps* map_from_map_chain(nmln* p) {
    return (slotsMapDeps*) (int32(p) - map_chain_offset());
  }
  
 public:
  oop define(oop obj, oop contents);

  virtual slotDesc* slots()   { return (slotDesc*) (this + 1); }

 protected:
  void switch_pointer_in_map_slot(slotDesc *s, oop* where, oop to);
  void shift_obj_slots(smiOop offset, fint delta);

 public:
  // creation operations
  static slotsOop create_slots(slotList* slots, const char* annotation = "");
  oop fill_in_slots(slotList* slist, fint slotCount);
  
  // map chain and dependents
  void shift_map(Map* target);
  void forward_map(Map* oldMap);
  void delete_map();

  // dependents operations
  virtual bool can_have_dependents() { return true; }
  bool has_slot_dependents() { return dependents != NULL; }
  nmln *dependents_for_slot(slotDesc *);
  void moveDeps(nmln* newDeps, int32 delta);

  void init_dependents();
  bool verify_dependents();
  void deallocate_slot_dependents();

  // memory operations
  void fixup() { // after snapshot: do this
    if (!okToUseCodeFromSnapshot) init_dependents();
    initialize(); }
};

inline slotsMapDeps* map_from_map_chain(nmln* p) {
  return slotsMapDeps::map_from_map_chain(p);
}

static inline slotsOop create_slots(slotList* slots, 
                                    const char* annotation = "") {
  return slotsMapDeps::create_slots(slots, annotation);
}


