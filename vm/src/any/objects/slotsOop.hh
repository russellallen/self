/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

class slotsOopClass: public oopsOopClass {
 public:
  // constructor
  static slotsOop as_slotsOop(void* p) { return (slotsOop) as_oopsOop(p); }
  
  // accessors
  slotsOopClass* addr() { return (slotsOopClass*) oopsOopClass::addr(); }
  
  // creation operation
  static slotsOop create_slots(fint size);
  
  // cloning operation (just putting a nice return type on the fn's)
  slotsOop clone(bool mustAllocate= true) {
    return (slotsOop) oopsOopClass::clone(mustAllocate); }
  slotsOop cloneSize(fint length, bool mustAllocate= true, oop filler= 0) {
    return (slotsOop) oopsOopClass::cloneSize(length, mustAllocate, filler); }
  
  // primitives
  oop add_slots_prim(oop contents, void *FH);
  oop add_slots_if_absent_prim(oop contents, void *FH);
  oop copy_add_slot_prim(stringOop name,
                         oop contents, 
                         bool isP,
                         bool isA,
                         oop anno,
                         void *FH);
  // called by above
  oop copy_add_slot_fixing_up_method( stringOop name, slotType t, oop contents,
                                      oop anno, bool mustAllocate= false);
  oop copy_remove_slot_fixing_up_method(stringOop name, bool mustAllocate);

  oop remove_slot_prim(stringOop name, void *FH);
  oop remove_all_slots_prim(void *FH);
  oop copy_remove_slot_prim(stringOop name, void *FH);
  oop create_block_prim();
};

static inline slotsOop as_slotsOop(void* p) {
  return slotsOopClass::as_slotsOop(p);
}

static inline slotsOop create_slots(fint size) {
  return slotsOopClass::create_slots(size);
}



# define EMPTY_SLOTS_OOP_SIZE   (sizeof(slotsOopClass)/oopSize)

oop clone0_prim(slotsOop rcvr);
oop clone1_prim(slotsOop rcvr);
oop clone2_prim(slotsOop rcvr);
oop clone3_prim(slotsOop rcvr);
oop clone4_prim(slotsOop rcvr);
oop clone5_prim(slotsOop rcvr);
oop clone6_prim(slotsOop rcvr);
oop clone7_prim(slotsOop rcvr);
oop clone8_prim(slotsOop rcvr);
oop clone9_prim(slotsOop rcvr);
