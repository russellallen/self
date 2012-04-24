/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// Forward-declaration for friend
fctProxyOop create_fctProxy(); // To create initial proxy

class fctProxyMap: public proxyMap {
 public:
  // testing operations
  bool is_fctProxy() { return true; }
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(fctProxyMap); }

  
  // creation operation
  friend fctProxyOop create_fctProxy(); // To create initial proxy

  // mirror operation
  mirrorOop mirror_proto() { return Memory->fctProxyMirrorObj; }
  
  // sizing
  fint empty_object_size();
  
  // killable operations
  virtual void    kill(oop p) { fctProxyOop(p)->kill_fctProxy(); }
  
  // printing
  void print(oop obj);

  // enumerating
  virtual bool is_enumerable(oop obj, oop* matching_cell);

  // profiler operation
  void dummy_initialize(oop obj, oop filler);
};
