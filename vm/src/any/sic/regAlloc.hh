/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// register allocator for the SIC
// currently a simple usage count thing

# ifdef SIC_COMPILER

class SICAllocator;
extern SICAllocator* theAllocator;

class RegisterPair;
typedef BoundedListTemplate<RegisterPair*> RegisterPairList;

  class SICAllocator : public ResourceObj {
    PRegBList* globals;
    fint firstRegisterIndexToUse;
    RegisterString incoming;
   public:
    RegisterPairList* pairs;
    RegisterEqClassBList* regClasses;
    int32 stackTemps;           // number of stack temps used

    SICAllocator();
    
    void allocate(PRegBList* g, RegisterString incoming);
    bool allocateConst(ConstPReg* r, Location preferred = UnAllocated);
    static bool keepUplevelRPRegsInMemory;

   protected:
    void allocateToStack(PReg* r);
    void handlePairs();
  };

  
  // helper structure for local register allocation
  class RegCandidate : public ResourceObj{
   public:
    PReg* r;            // preg to be allocated
    Location loc;       // possible location for it
    fint ndefs;         // required # defs of loc

    RegCandidate(PReg* reg, Location l, fint n) {
      r = reg; loc = l; ndefs = n;
    }
  };

  class RegisterEqClass : public ResourceObj {
   public:
    // holds pregs beloning to equivalence class
    // PRegs are linked through regClassLink
    PReg* first;
    PReg* last;

    RegisterEqClass(PReg* f);
    void append(PReg* other);
  };

class RegisterPair : public ResourceObj {
 public:
  // holds candidates to help register targeting; lhs is formal arg of a
  // call, rhs is actual arg
  // if rhs has no definitions in lhs' live range, can allocate them
  // to same register
  SAPReg* lhs;
  PReg* rhs;

  RegisterPair(SAPReg* l, PReg* r) { lhs = l; rhs = r; add(); }
 protected:
  void add();
};


# endif
