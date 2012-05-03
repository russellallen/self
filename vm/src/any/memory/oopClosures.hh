/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



// New style closures (someday will elim the macros altogether!)
// First, define the closure:


class OopClosure: public StackObj {  
public:
  virtual void do_oop( oop* p ) = 0; 
  OopClosure* a() { return this; } // needed to bypass a warning in gcc
};


// LocationsDoer uses OOPS_DO, not DERIVED_OOPS_DO_TEMPLATE because it is comparing ADDRESSES of oops
  
  
class OopScavenger:      public OopClosure { public: void do_oop(oop* p) { DERIVED_SCAVENGE_TEMPLATE(p);        }  };
class OopGCMarker:       public OopClosure { public: void do_oop(oop* p) { DERIVED_MARK_TEMPLATE(p);            }  };
class OopGCUnmarker:     public OopClosure { public: void do_oop(oop* p) { DERIVED_UNMARK_TEMPLATE(p);          }  };
class OopZapper:         public OopClosure { public: void do_oop(oop* p) { Unused(p);                           }  };

class OopVerifier:       public OopClosure { 
  private: bool* rp;
  public: OopVerifier(bool& r): OopClosure() { rp = &r; }
  public: void do_oop(oop* p) { 
                 bool derived_verify_template_result = true;
                 DERIVED_VERIFY_TEMPLATE(p);
                 *rp &= derived_verify_template_result;
           }  
};
 
 
class OopSwitcher:       public OopClosure { public: oop from, to;  OopSwitcher     (oop f, oop t)   { from = f; to = t; }  void do_oop(oop* p) { DERIVED_SWITCH_POINTERS_TEMPLATE(p); }  };
class OopDoer:           public OopClosure { public: oopsDoFn fn;   OopDoer         (oopsDoFn fnarg) { fn = fnarg;       }  void do_oop(oop* p) { DERIVED_OOPS_DO_TEMPLATE(p, fn); }  };
class OopLocationsDoer:  public OopClosure { public: oopsDoFn fn;   OopLocationsDoer(oopsDoFn fnarg) { fn = fnarg;       }  void do_oop(oop* p) {         OOPS_DO_TEMPLATE(p, fn); }  };


class OopBlockAdjuster: public OopClosure {
 public:
  frame *olds, *news;
  OopBlockAdjuster(frame* oarg, frame* narg) { olds = oarg; news = narg; }
  void do_oop(oop* p);
};
