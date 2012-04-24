/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// slotType describes each slot's properties (in the map) 
// see slotDesc.h 

const fint slot_type_bits  = 2;             // obj,map,arg
const fint is_vm_slot_bits = 1;             // VM slot?
const fint is_parent_bits  = 1;             // bits for parent-ness

const fint slot_type_shift  = Tag_Size;
const fint is_vm_slot_shift = slot_type_shift + slot_type_bits;
const fint is_parent_shift = is_vm_slot_shift + is_vm_slot_bits;

const int32 slot_type_mask  = nthMask(slot_type_bits)  << slot_type_shift;
const int32 is_parent_mask  = nthMask(is_parent_bits)  << is_parent_shift;
const int32 is_vm_slot_mask = nthMask(is_vm_slot_bits) << is_vm_slot_shift;

const int32 obj_slot_type = 0 << slot_type_shift;
const int32 map_slot_type = 1 << slot_type_shift;
const int32 arg_slot_type = 2 << slot_type_shift;

const int32 data_slot_type   = 0 << is_parent_shift;
const int32 parent_slot_type = 1 << is_parent_shift;

const int32 vm_slot_type = nthBit(is_vm_slot_shift);

class slotTypeClass {
 public:
  // dummy constructor
  // slotType looks like a pointer but really is an integer
  // this way, we can define operations on it (like smiOops)
  // cannot dynamically allocate slotTypes
  slotTypeClass()                 { ShouldNotCallThis(); }
  slotTypeClass(slotTypeClass &s) { Unused(s);  ShouldNotCallThis(); }
  
  // accessors
  fint slot_type()    { return maskBits(int32(this), slot_type_mask); }
  bool is_obj_slot()  { return slot_type() == obj_slot_type; }
  bool is_map_slot()  { return slot_type() == map_slot_type; }
  bool is_arg_slot()  { return slot_type() == arg_slot_type; }
  bool is_vm_slot()   { return isSet(int32(this), is_vm_slot_shift); }
  bool is_parent()    { return isSet(int32(this), is_parent_shift); }
  
};

// some useful slot type constants
# define obj_slotType                                                         \
    slotType(obj_slot_type)
# define map_slotType                                                         \
    slotType(map_slot_type)
# define arg_slotType                                                         \
    slotType(arg_slot_type)
# define parent_obj_slotType                                                  \
    slotType(obj_slot_type | parent_slot_type)
# define parent_map_slotType                                                  \
    slotType(map_slot_type | parent_slot_type)
# define vm_obj_slotType                                                      \
    slotType(obj_slot_type | vm_slot_type)
# define vm_map_slotType                                                      \
    slotType(map_slot_type | vm_slot_type)
# define vm_parent_obj_slotType                                               \
    slotType(obj_slot_type | parent_slot_type | vm_slot_type)
# define vm_parent_map_slotType                                               \
    slotType(map_slot_type | parent_slot_type | vm_slot_type)

// other macros

# define MAP_SLOT(stype)  (slotType( int32(stype) & ~slot_type_mask \
                                   | map_slot_type))

# define ARG_SLOT(stype)  (slotType( int32(stype) & ~slot_type_mask \
                                   | arg_slot_type))

# define OBJ_SLOT(stype)  (slotType( int32(stype) & ~slot_type_mask \
                                   | obj_slot_type))

# define SET_BASIC_SLOT_TYPE(stype, t)  \
     (slotType( int32(stype) & ~slot_type_mask \
              | int32(t    ) &  slot_type_mask ))
