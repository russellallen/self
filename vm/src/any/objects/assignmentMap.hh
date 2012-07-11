/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



class assignmentMap: public codeLikeSlotsMap {
 public:
  // accessors
  bool is_assignment()  { return true; }
  bool is_method_like() { return true; }
  bool is_programmable_slots()  { return false; }

  fint arg_count() { return 1; }
  
  VtblMapType vtblMapType()  { return MAP_TYPE_NAME(assignmentMap); }


  // cloning
  oop clone(oop obj, bool mustAllocate= true, oop genObj= 0) {
    Unused(obj); Unused(mustAllocate); Unused(genObj);
    ShouldNotCallThis(); return 0;}
  oop cloneSize(oop obj, fint length, bool mustAllocate= true,
                oop filler= 0);
  
  // creation operation
  static assignmentOop create_assignment();
  
  // mirror operations
  mirrorOop mirror_proto() { return Memory->assignmentMirrorObj; }

  // programming -- has no slots, so do not have to define switch_pointer
  // it will never find a hit anyway -- dmu 2/93
};  
