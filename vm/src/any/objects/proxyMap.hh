/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// Forward-declaration for friend
proxyOop create_proxy();

class proxyMap: public foreignMap {
 public:
  // testing operations
  bool is_proxy()     { return true; }
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(proxyMap); }

  
  // creation operation
  friend proxyOop create_proxy();             // To create initial proxy

  // mirror operation
  mirrorOop mirror_proto() { return Memory->proxyMirrorObj; }
  
  bool can_inline_clone() { return false; }
  // sizing
  fint empty_object_size();

  // killable operations
  virtual void    kill(oop p) { proxyOop(p)->kill_proxy();           }
  virtual bool is_live(oop p) { return proxyOop(p)->is_live_proxy(); }
  
  // printing
  void print(oop obj);

  // profiler operation
  void dummy_initialize(oop obj, oop filler);
};
