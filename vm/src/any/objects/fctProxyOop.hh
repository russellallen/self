/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// A fctProxy represents a foreign function in the Self world. It contains an
// entry point (just an address), and understands a number of primitive
// messages that calls the function at this address. A fctProxy also contains
// a smiOop: noOfArgs. It says how many arguments this fctProxy expects.
// Like any foreignOop, a fctProxy can be dead or live. It can only be called 
// if it is live. 

// fctProxies are (typically) produced by calling fctLookup (in dynLink.[ch]). 


typedef oop (*fctType)(...);

const smi unknownNoOfArgs = -1;
/* For use with set_noOfArgs. If this value is used, the function can be */
/* called with any number of arguments. Warning: foreign.self has a comment
  that reveals the value of this constant (_NoOfArgs:), so don't change it! */


class fctProxyOopClass: public proxyOopClass {

  private:

    smiOop noOfArgs;    /* How many args to give, when calling this fct. */

  protected:

    fctProxyOopClass* addr() { 
       return (fctProxyOopClass*)proxyOopClass::addr(); 
    }

    void kill_fctProxy() {
      // Don't call this function. Call kill() instead.
      set_pointer(NULL);    /* Just a precaution. */
      set_type_seal(deadProxyObject);
      set_noOfArgs(0); // to init the word during universe::genesis
    }

  public:

    fctType get_pointer() {
      return fctType(proxyOopClass::get_pointer());
    }
 
    void set_pointer(fctType entryPt) {
      proxyOopClass::set_pointer((void *)entryPt);
    }

    smi get_noOfArgs() {
      return addr()->noOfArgs->value();
    }

    void set_noOfArgs(smi nargs) {
      addr()->noOfArgs = as_smiOop(nargs);
    }


    smi get_noOfArgs_prim(void *FH);
    oop set_noOfArgs_prim(smi n, void *FH);

    oop call0_prim ();
    oop call1_prim (oop a1);
    oop call2_prim (oop a1, oop a2);
    oop call3_prim (oop a1, oop a2, oop a3);
    oop call4_prim (oop a1, oop a2, oop a3, oop a4);
    oop call5_prim (oop a1, oop a2, oop a3, oop a4, oop a5);
    oop call6_prim (oop a1, oop a2, oop a3, oop a4, oop a5, oop a6);
    oop call7_prim (oop a1, oop a2, oop a3, oop a4, oop a5, oop a6, oop a7);
    oop call8_prim (oop a1, oop a2, oop a3, oop a4, oop a5, 
                    oop a6, oop a7, oop a8);
    oop call9_prim (oop a1, oop a2, oop a3, oop a4, oop a5, 
                    oop a6, oop a7, oop a8, oop a9);
    oop call10_prim(oop a1, oop a2, oop a3, oop a4, oop a5, 
                    oop a6, oop a7, oop a8, oop a9, oop a10);

    oop call_and_convert0 ();
    oop call_and_convert1 (void *a1);
    oop call_and_convert2 (void *a1, void *a2);
    oop call_and_convert3 (void *a1, void *a2, void *a3);
    oop call_and_convert4 (void *a1, void *a2, void *a3, void *a4);
    oop call_and_convert5 (void *a1, void *a2, void *a3, void *a4, void *a5);
    oop call_and_convert6 (void *a1, void *a2, void *a3, void *a4, void *a5, 
                           void *a6);
    oop call_and_convert7 (void *a1, void *a2, void *a3, void *a4, void *a5, 
                           void *a6, void *a7);
    oop call_and_convert8 (void *a1, void *a2, void *a3, void *a4, void *a5,
                           void *a6, void *a7, void *a8);
    oop call_and_convert9 (void *a1, void *a2, void *a3, void *a4, void *a5,
                           void *a6, void *a7, void *a8, void *a9);
    oop call_and_convert10(void *a1, void *a2, void *a3, void *a4, void *a5,
                           void *a6, void *a7, void *a8, void *a9, void *a10);
                           
#   ifdef UNUSED
    fctProxyOop clone(bool mustAllocate= true) { 
      return (fctProxyOop) proxyOopClass::clone(mustAllocate); 
    }
#   endif

    friend class fctProxyMap;

# if  GENERATE_DEBUGGING_AIDS
    bool verify();
#   endif
};

oop call0_prim (oop rcvr);
oop call1_prim (oop rcvr, oop a1);
oop call2_prim (oop rcvr, oop a1, oop a2);
oop call3_prim (oop rcvr, oop a1, oop a2, oop a3);
oop call4_prim (oop rcvr, oop a1, oop a2, oop a3, oop a4);
oop call5_prim (oop rcvr, oop a1, oop a2, oop a3, oop a4, oop a5);
oop call6_prim (oop rcvr, oop a1, oop a2, oop a3, oop a4, oop a5, oop a6);
oop call7_prim (oop rcvr, oop a1, oop a2, oop a3, oop a4, oop a5,
                oop a6, oop a7);
oop call8_prim (oop rcvr, oop a1, oop a2, oop a3, oop a4, oop a5,
                oop a6, oop a7, oop a8);
oop call9_prim (oop rcvr, oop a1, oop a2, oop a3, oop a4, oop a5, 
                oop a6, oop a7, oop a8, oop a9);
oop call10_prim(oop rcvr, oop a1, oop a2, oop a3, oop a4, oop a5, 
                oop a6, oop a7, oop a8, oop a9, oop a10);

