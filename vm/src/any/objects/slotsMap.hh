#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "map.hh"
# include "slotsOop.hh"
# include "smiOop.hh"



class slotsMap: public Map {
 public:
  // instance variables
  smiOop object_length;
  smiOop slots_length;
 protected:
  oop annotation;

 public:  
  // testers
  bool is_slots()              { return true; }
  bool is_programmable_slots() { return true; }
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(slotsMap); }


  // programming operations
  oop copy_add_slot(oop obj, stringOop name, slotType t, oop contents,
                    oop anno, bool mustAllocate= false);
  oop copy_remove_slot(oop obj, stringOop name, bool mustAllocate= false);

  // accessors
  oop  get_annotation() { return annotation; }
  void set_annotation(oop a) {Memory->store(&annotation, a); }

 protected:
  slotsMap* copy_for_changing(bool mustAllocate= true);

  oop copy_add_argument_slot(slotsOop obj, stringOop name, slotType t,
                             oop cont, oop anno, bool mustAllocate= false);
  oop copy_add_assignment_slot(slotsOop obj, stringOop name, slotType t,
                               oop anno, bool mustAllocate= false);
  oop copy_add_new_assignment_slot(slotsOop obj, stringOop name, slotType t,
                                   oop anno, bool mustAllocate= false);
  oop copy_add_method_slot(slotsOop obj, stringOop name, slotType t, oop cont,
                           oop anno, bool mustAllocate= false);
  oop copy_add_data_slot(slotsOop obj, stringOop name, slotType t, 
                         oop cont, oop anno, bool mustAllocate= false);
  slotsOop copy_remove_one_slot(slotsOop obj, slotDesc *slot,
                                bool mustAllocate= false);

  slotsOop copy_add_new_slot(slotsOop obj, stringOop name, slotType t, 
                             oop cont, oop anno, bool mustAllocate= false);

 public:
  virtual oop change_slot(oop obj, slotDesc *s, slotType t, oop contents, 
                          oop anno, bool mustAllocate= true);

  void switch_pointer(oop obj, oop* where, oop to);
  virtual void switch_pointer_in_map(oop* where, oop to);

  virtual fint size() {
    return (oop*) (slots() + length_slots()) - (oop*) this; }

  virtual slotDesc* slots()   { return (slotDesc*) (this + 1); }
  fint length_slots()         { return slots_length->value(); }

 protected:
  // for insertions and deletions
  virtual void shift_obj_slots(smiOop offset, fint delta);
  
  // dependents
  virtual void init_dependents() {}

 public:
  // cloning operations
  oop clone(oop obj, bool mustAllocate= true, oop genObj= NULL);
  bool can_inline_clone() { return true; }
  oop cloneSize(oop obj, fint length, bool mustAllocate= true,
                oop filler= NULL);
  
  // creation operations
  virtual oop fill_in_slots(slotList* slist, fint slotCount);
  // create_object sets only the mark, not the map.
  virtual slotsOop create_object(fint size) { return create_slots(size); }
  
  // size operations
  fint object_size(oop obj) { Unused(obj); return object_length->value(); }
  fint empty_vector_object_size() { return object_length->value(); }
  fint empty_object_size();
  
  // mirror operation
  mirrorOop mirror_proto() { return Memory->slotsMirrorObj; }

  // annotation primitives
  oop mirror_copy_set_annotation(oop obj, oop a,  bool mustAllocate= false);

  // profiler operation, initialize instance variables
  virtual void dummy_initialize(oop obj, oop filler);

 public:
  
  // memory operations
  virtual oop scavenge(oop obj);
  bool verify(oop obj);
  
  // printing operations
  void print(oop obj);

  // profiler operation
  oop dummy_obj(oop filler);

  // enumerating
  virtual bool is_enumerable(oop obj, oop* matching_cell) {
    return  matching_cell  >=  slotsOop(obj)->oops() + empty_object_size(); }
};

