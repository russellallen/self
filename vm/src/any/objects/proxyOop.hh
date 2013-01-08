/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// "Foreign" oops (below) are killable objects containing an arbitrary 
// A proxyOop is a foreignOop that associate a type with the pointer
// to a C structure (in foreignOopClass). Note that a dead proxyOop is
// designated by a special value in the type_seal field, so if the user for
// some reason tries to store this exact value here, he will be badly
// surprised.
// Also note that a dead proxy becomes live if given a (new) type seal.


extern const void *deadProxyObject; // Do not use directly. Placed here only to
                                    // enable inlining of member fct's.
                                    // This const is stored in the type_seal 
                                    // field to indicate when a proxy is dead.



class proxyOopClass: public foreignOopClass {

  private:

    C_pointer  type_seal; // type of object in C heap pointed to by my parent

  protected:

    proxyOopClass* addr() { 
      return (proxyOopClass*)foreignOopClass::addr(); 
    }

    void kill_proxy() {
      // Don't call this function. Call kill() instead.
      set_pointer(0);    /* Just a precaution. */
      set_type_seal(deadProxyObject);
    }

    bool is_live_proxy() {
      // Don't call this function. Call is_live() instead.
      assert_smi(deadProxyObject, "deadProxyObject should be a smi");
      return get_type_seal() != deadProxyObject;
    }

  public:
    void* get_type_seal() { 
      return addr()->type_seal.get();
    }

    void set_type_seal(const void *ptr) {
      addr()->type_seal.set(ptr);
    }

    proxyOop clone(bool mustAllocate= true) { 
      return (proxyOop) foreignOopClass::clone(mustAllocate); 
    }

    bool verify();

  friend class proxyMap;
};
