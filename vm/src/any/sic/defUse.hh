/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// PDefs represent PReg definitions, PUses the uses.  Each basic block
// has a list of the defs and uses it contains, and a PReg has a list
// of the BBs it is used/defined in.

# ifdef SIC_COMPILER

  typedef BoundedListTemplate<PDef*        > PDefBList;
  typedef BoundedListTemplate<PUse*        > PUseBList;
  typedef BoundedListTemplate<PDefUse*     > PDefUseBList;
  typedef BoundedListTemplate<PRegBBIndex* > PRegBBIndexBList;
  typedef BoundedListTemplate<DUInfo*      > DUInfoBList;

  class PDefUse : public ResourceObj {         // abstract
  public:
    Node* node;
    PDefUse(Node* n) { node = n; }
  };

  class PDef : public PDefUse {
   public:
    PDef(Node* n) : PDefUse(n) { }

    void print();
    bool canCopyPropagate(PReg* pr);
  };

  class PUse : public PDefUse {
   public:
    PUse(Node* n) : PDefUse(n) { }
    virtual bool isSoft()       { return false; }
    void print();
  };

  class PSoftUse : public PUse {
   public:
    // a debugger-related use; doesn't prevent block elimination
    PSoftUse(Node* n) : PUse(n) { }
    bool isSoft()       { return true; }
    void print();
  };

  class DUInfo : public ResourceObj {// represents PReg's defs/uses within BB
   public:
    PReg* reg;
    PUseList uses;      // uses (in order of nodes within BB)
    PDefList defs;
    DUInfo(PReg* r) { reg = r; }

    void getLiveRange(int32& firstNodeID, int32& lastNodeId);
    void propagateTo(BB* bb, PReg* r, PDef* def, PUse* use, bool global);
    void propagateTo(BB* useBB, PUse* use, Node* fromNode, PReg* src,
                     Node* toNode, bool global);
    void print_short();
    void print();
  };

  class DUInfoList;

  // a BBDUTable contains all defs and uses of a BB
  class BBDUTable : public ResourceObj {        
   unknown:
    DUInfoBList* info;          // one element per PReg used/defd
    BBDUTable() { info = NULL; }

    void print_short() { lprintf("BBDUTable %#lx", this); }
    void print();    
  };

  // a PRegBBIndex is an index into a particular element of a BBDUTable
  class PRegBBIndex : public ResourceObj {
   public:
    BB* bb;                     // BB containing some of PReg's defs/uses
    int32 index;                // index into BB's BBDUTable

    PRegBBIndex(BB* b, int32 i, PReg* pr) { Unused(pr);  bb = b; index = i; }
    DUInfo* defUseInfo();
    void print_short();
    void print();
  };

  class CPInfo : public ResourceObj {
    // keeps track of effects of copy propagation
   public:                      // (for debugging info)
    Node* def;                  // eliminated definition
    PReg* r;                    // equivalent PReg

    CPInfo(Node* d, PReg* r1) { def = d; r = r1; }
    bool isConstant();
    oop  constant();
    void print();
    static CPInfo* new_CPInfo(Node* def); // may return NULL if def isn't suitable
   protected:
    CPInfo(Node* def);
  };

  static inline CPInfo* new_CPInfo(Node* def) {
    return CPInfo::new_CPInfo(def);
  }

  void forAllDefsDo(PRegBBIndexBList* l, defDoFn f);
  void forAllUsesDo(PRegBBIndexBList* l, useDoFn f);
  void printDefsAndUses(PRegBBIndexBList* l);   // for debugging
# endif
