/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

class floatMap: public immediateMap {
 public:
  // creation operation
  static Map* create_floatMap(oop parent);
  
  // testing operation
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(floatMap); }

  
  // mirror operation
  mirrorOop mirror_proto() { return Memory->floatMirrorObj; }

  // profiler operation
  oop dummy_obj(oop filler) { Unused(filler); return as_floatOop(0.0); }
  
  // printing operations
  void print_string(oop obj, char* buf);
  void print_oop(oop obj);
  void print(oop obj);
};
