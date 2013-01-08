/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

class blockOopClass: public slotsOopClass {
private:
  smiOop scopeHomeFr; // this does double duty as a scope and a pointer
                      // to the home frame
public:
  // constructor
  static blockOop as_blockOop(void* p) { return (blockOop) as_slotsOop(p); }
  
  // accessors
  blockOopClass* addr()    { return (blockOopClass*) slotsOopClass::addr(); }
  frame*         homeFr()  { return (frame*)scopeHomeFr; }
  void setHomeFr(smiOop s) { scopeHomeFr= s; }

  // block operations
  // scope(true) can return 0; scope() will fail an assertion in that case.
  // note: scope frames may be not same frame as home frame! -- dmu
  frame* scope(bool orNone = false);
  void setScope(frame* newScope);

  frame* parentFrame(frame* currentFrame, bool orNone = false);
  abstract_vframe* parentVFrame(frame* currentFrame, bool orNone = false);

  stringOop outermostMethodSelector(); // selector of method lexically containing the block

  inline smiOop desc();
  inline slotsOop value();
  
# ifdef UNUSED
  // cloning operation
  // This is used by a user-level clone primitive, it ends up at the map
  // which does nothing. -- dmu
  blockOop clone(bool mustAllocate= true) {
    return (blockOop) slotsOopClass::clone(mustAllocate); }
# endif

  // killable operations
  void kill_block()    { setScope(0); }         // Use kill(); not this fct.
  bool is_live_block() { return scope(true) != 0; } // Use is_live().
  
  // primitives
private:
  inline oop really_clone_block(smiOop fp);
public:
  oop clone_block(smiOop fp);
  oop clone_block_for_interpreter(frame* f);

  // copy() is for the compilers, not for the user
  blockOop copy()  { return (blockOop) clone_block(smiOop(0)); }

  // compiler support
  static int32 scope_offset() {
    blockOopClass* p = 0;
    return (int32) (& (p->scopeHomeFr) ) - Mem_Tag; }
  blockOop clone_and_set_desc(smiOop);
  void remap(nmethod* nm, frame* newHome);
  void remap(Map* newMap, frame* newHome);
};

inline blockOop as_blockOop(void* p) { return blockOopClass::as_blockOop(p); }
inline int32 scope_offset() { return blockOopClass::scope_offset(); }

oop clone_block_prim(oop rcvr, smiOop fp);
oop catch_interprocess_returns(oop blk);
  
