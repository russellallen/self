/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// "Foreign" oops (below) are killable objects containing an arbitrary 
// machine pointer. foreignOopClass is an abstract class.
// Warning: do not attempt to store an oop where the C pointer is supposed to
// be. This will not work, since the pointer is not scavenged!

class C_pointer {
  // In general C pointer requires 32 bits precision, but we also have to
  // tag it. We therefore store it as two smiOop's, one holding the upper
  // 16 bits, the other holding the lower 16 bits.
  // When converting to/from a pointer, a long is used as an intermediate
  // step, since this is the only integer C type, that is guaranteed to
  // hold any pointer value.
  // NB: Actual numbers may not be 16 and 32 bits.
  //
  // Promised to write here that Urs' thinks this is an unnecessary 
  // precaution to take; we should just put in an assertion checking that
  // the pointer can fit in a smiOop. Anyway, localizing the concept to this
  // class, will make it easy to change.
  // He made the point that either we do it everywhere in the VM (i.e. use
  // instances of this class everywhere we store a pointer), or we never
  // care about it.
  //                                                    Ole Agesen, 10/18/91.

 private:
  smiOop hi, lo;

  static const smi  shifts;
  static const long low_mask;

 public:

  void set(const void *ptr) {
    assert(BitsPerByte * sizeof(ptr) <= 
           2 * (BitsPerByte * sizeof(smiOop) - Tag_Size), "Really?");
    hi = as_smiOop(long(ptr) >> shifts);
    lo = as_smiOop(long(ptr) & low_mask);
  }

  void *get() {
    return (void *)( (long(hi->value()) << shifts) | long(lo->value()) );
  }

  bool verify();
};
    


class foreignOopClass: public slotsOopClass {  // Abstract class.

 private:

  C_pointer cObject;     // object in C heap pointed to by me.

 protected:

  foreignOopClass* addr() { 
    return (foreignOopClass*)slotsOopClass::addr();
  }

  // Default implementation of kill/is_live. May be overridden.
  void kill_foreign() {  
    set_pointer(NULL);
  }

  bool is_live_foreign() {
    return get_pointer() != NULL;
  }


 public:

  void *get_pointer() { 
    return addr()->cObject.get(); 
  }

  void  set_pointer(const void *ptr) { 
    addr()->cObject.set(ptr);
  }

  bool is_null() {
    return get_pointer() == NULL;
  }

  foreignOop clone(bool mustAllocate) { 
    return (foreignOop) slotsOopClass::clone(mustAllocate);
  }

  smi foreign_hash() {
    return smi(get_pointer()) >> Tag_Size;
  }

  bool same_pointer_as(foreignOop x) {
    return get_pointer() == x->get_pointer();
  }
  
  bool verify();
  
  // to help _RunNative
  oop pointer_in_bytevector_prim(byteVectorOop bv);
  
  friend class foreignMap;
};
