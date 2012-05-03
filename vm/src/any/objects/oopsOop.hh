/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// Forward-declaration for friend
oopsOop as_oopsOop(void* p);


class oopsOopClass: public memOopClass {
 public:
  // constructor
  friend oopsOop as_oopsOop(void* p) { return (oopsOop) as_memOop(p); }
  
  // accessors
  oop* oops(fint which = 0) { return &((oop*) addr())[which]; }
  
  oop at(fint which) { return *oops(which); }
  inline void at_put(fint which, oop contents, bool cs = true);
  
  void record_promotion(fint size);
  void fix_generation(fint size) { if (is_old()) record_promotion(size); }
  
  // allocators
  oopsOop copy(fint size, bool mustAllocate= true, oop genObj= NULL, 
               bool cs= true) {
    oop* x= genObj
      ? genObj->my_generation()->alloc_objs(size, mustAllocate)
        : Memory->alloc_objs(size, mustAllocate);
    if (x == NULL)
      return oopsOop(failedAllocationOop);
    copy_oops(oops(), x, size);
    oopsOop r= as_oopsOop(x);
    if (cs) r->fix_generation(size);
    return r; }
  oopsOop grow(fint size, fint delta, bool mustAllocate= true) {
    oop* x= Memory->alloc_objs(size + delta, mustAllocate);
    if (x == NULL)
      return oopsOop(failedAllocationOop);
    copy_oops(oops(), x, size);
    oopsOop r = as_oopsOop(x);
    // can't do fix_generation(), since grown space isn't initialized yet
    return r; }
  oopsOop shrink(fint size, fint delta, bool mustAllocate= true) {
    oop* x= Memory->alloc_objs(size - delta, mustAllocate);
    if (x == NULL)
      return oopsOop(failedAllocationOop);
    copy_oops(oops(), x, size - delta);
    oopsOop r = as_oopsOop(x);
    r->fix_generation(size - delta);
    return r; }
  oopsOop insert(fint size, fint change_point, fint delta,
                 bool mustAllocate= true, bool sameGen= false) {
    oop* x= sameGen
      ? my_generation()->alloc_objs(size + delta, mustAllocate)
        : Memory->alloc_objs(size + delta, mustAllocate);
    if (x == NULL)
      return oopsOop(failedAllocationOop);
    oop* p = oops();
    copy_oops(p, x, change_point);
    copy_oops(p + change_point, x + change_point + delta, size - change_point);
    oopsOop r = as_oopsOop(x);
    // can't do fix_generation(), since inserted space isn't initialized yet
    return r; }
  oopsOop remove(fint size, fint change_point, fint delta,
                 bool mustAllocate= true, bool sameGen= false) {
    oop* x= sameGen
      ? my_generation()->alloc_objs(size - delta, mustAllocate)
        : Memory->alloc_objs(size - delta, mustAllocate);
    if (x == NULL)
      return oopsOop(failedAllocationOop);
    oop* p = oops();
    copy_oops(p, x, change_point);
    copy_oops(p + change_point + delta, x + change_point,
              size - change_point - delta);
    oopsOop r = as_oopsOop(x);
    r->fix_generation(size - delta);
    return r; }
  
  // memory operations
  oopsOop scavenge(fint size);
  void gc_mark_referents();
  bool verify();
};
