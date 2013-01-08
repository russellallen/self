/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

class smiMap: public immediateMap {
 public:
  // creation operation
  static Map* create_smiMap(oop parent);
  
  // testing
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(smiMap); }
  
  // mirror operation
  mirrorOop mirror_proto() { return Memory->smiMirrorObj; }

  // profiler operation
  oop dummy_obj(oop filler) { Unused(filler); return smiOop_zero; }
  
  // printing operations
  void print_string(oop obj, char* buf);
  void print_oop(oop obj);
  void print(oop obj);
};
