/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// Forward-declaration for friend
Map* create_floatMap(oop parent);

class floatMap: public immediateMap {
 public:
  // creation operation
  friend Map* create_floatMap(oop parent);
  
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
