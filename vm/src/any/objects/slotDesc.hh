/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class slotDesc {
 public:
  stringOop name; // the slot's name
  slotType type;  // type and properties (slotType.h)
  oop data;
  oop annotation; // the VM does not care what is here; just for the Self world

  slotDesc() {}

  slotDesc(stringOop n, slotType t, oop d, oop a) {
    assert(!Memory->is_heap((oop*)this), "use init for slotDescs in the heap");
    name=n; type= t; data= d; annotation= a; }

  // accessors
  oop get_annotation() {return annotation; }
  void set_annotation(oop a, bool cs = true) {
    Memory->store(&annotation, a, cs);}

  // initializer
  void init(stringOop n, slotType t, oop d, oop a, bool cs = true) {
    Memory->store((oop*)&name, oop(n), cs);
    type = t;
    Memory->store(&data, d, cs);
    set_annotation(a, cs);
    assert(verify(0), "verify failed");
  }

  // testers
  bool is_obj_slot() { return type->is_obj_slot(); }    // assignable data slot
  bool is_map_slot() { return type->is_map_slot(); }    // constant data slot
  bool is_arg_slot() { return type->is_arg_slot(); }    // argument slot

  bool is_vm_slot()  { return type->is_vm_slot(); }    // VM slot?

  bool is_parent()   { return type->is_parent(); }

  stringOop assignment_slot_name();
  bool is_assignment_slot_name(stringOop n);

  bool compare(slotDesc* obj);
  
  slotDesc* shift(Map* old_map, Map* new_map) {
    return (slotDesc*) ((char*)this - (char*)old_map + (char*)new_map); }

  // memory operations
  bool verify(Map* m);

  // printing
  void printAugmentedName();    // print name w/prefix and postfix (parents)
  char* augmentedName();        // name w/prefix and postfix (parents)
};
