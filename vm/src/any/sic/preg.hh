/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# ifdef SIC_COMPILER

  // A PReg is a pseudo register.  All IL operations work on PRegs.

  void initPRegs();             // initialization (before every compile)

  typedef BoundedListTemplate<ConstPReg*      >       ConstPRegBList;
  typedef BoundedListTemplate<RegisterEqClass*> RegisterEqClassBList;

  // PRegs are standard pseudo regs; the different kinds of PRegs differ
  // mainly in their purpose and in their live ranges
  // PReg: locals etc., multiply assigned, live range is the entire scope
  // SAPReg: single source-level assignment, live range = arbitrary subrange
  // SplitPReg: used for splitting
  // BlockPRegs: for blocks, live range = creating bci .. end
  // TempPRegs: local to one BB, used for certain hard-coded idioms (e.g.
  // loading an uplevel-accessed value)
  

  // Forward-declaration for friend  
  SCodeScope* findAncestor(SSelfScope* s1, fint& bci1,
                           SSelfScope* s2, fint& bci2);

  class PReg : public ResourceObj {
   protected:
    fint _id;                   // unique id
    fint _nuses, _ndefs;        // number of defs & uses (including soft uses)
                                // (negative means incorrect/unknown values,
                                // e.g. hardwired regs)
    fint _nsoftUses;            // number of "soft" uses
    static const fint AvgBBIndexLen; // estimated # of BBs in which I appear
   public:
    static fint currentNo;      // id of next PReg created
    PRegBBIndexBList dus;       // defs and uses
    SSelfScope* scope;          // scope to which I belong (or NULL)
    Location loc;               // real location assigned to this preg
    CPInfo* cpInfo;             // to follow effects of copy propagation
    PRegBList* cpRegs;          // regs cp-ed away by me
    fint regClass;              // register equivalence class number
    PReg* regClassLink;         // next element in class
    fint weight;                // weight (importance) for reg. allocation
                                // (-1 if targeted register)
    bool uplevelR, uplevelW;    // uplevel-read/written? (uplevelW implies uplevelR -- dmu)
    bool debug;                 // value/loc needed for debugging info?
    
   protected:
    void initialize() {
      _id = currentNo++; 
      uplevelR = uplevelW = debug = false;
      _nuses = _ndefs = _nsoftUses = weight = 0; cpInfo = NULL; regClass = 0;
      regClassLink = 0; cpRegs = NULL;
    }
    static const fint VeryNegative;
    
   public:
    PReg(SSelfScope* s) : dus(AvgBBIndexLen) {
      initialize(); scope = s; loc = UnAllocated; }
    PReg(SSelfScope* s, Location l, bool incU, bool incD) : dus(AvgBBIndexLen){
      initialize(); scope = s; loc = l;
      if (incU) _nuses = VeryNegative;
      if (incD) _ndefs = VeryNegative;
    }

    fint id()                   { return _id; }
    virtual bool isSAPReg()     { return false; }
    virtual bool isArgSAPReg()  { return false; }
    virtual bool isSplitPReg()  { return false; }
    virtual bool isTempPReg()   { return false; }
    virtual bool isNoPReg()     { return false; }
    virtual bool isBlockPReg()  { return false; }
    virtual bool isConstPReg()  { return false; }
    virtual bool isMemoized()   { return false; }

    virtual bool canCopyPropagate();

  public: 
    void attemptGlobalCopyPropagate();

  protected:
    PDef* getDefinitionForGlobalCopyPropagation();

  public:
    bool incorrectDU()          { return _nuses < 0 || _ndefs < 0; }
    bool incorrectD()           { return               _ndefs < 0; } 
    bool incorrectU()           { return _nuses < 0; }
    fint nuses()                { return _nuses; }
    fint nsoftUses()            { return _nsoftUses; }
    fint ndefs()                { return _ndefs; }
    void incUses(PUse* use); 
    void decUses(PUse* use); 
    void incDefs(PDef* def); 
#   ifdef UNUSED
    void decDefs(PDef* def); 
#   endif

    // incremental update of def-use info
    PUse* addUse(DUInfo* info, Node* n);
    PUse* addUse(BB* bb, Node* n);
    void removeUse(DUInfo* info, PUse* u);
    void removeUse(BB* bb, PUse* u);
    PDef* addDef(DUInfo* info, Node* n);
    PDef* addDef(BB* bb, Node* n);
    void removeDef(DUInfo* info, PDef* d);
    void removeDef(BB* bb, PDef* d);
    virtual bool extendLiveRange(Node* n) { Unused(n);  return false; }
    
    bool isUnused()                     { return _ndefs + _nuses == 0; }
    virtual bool isSinglyAssigned()     { return _ndefs == 1; }
    bool isLocalTo(BB* bb);
    fint hardUses()                     { return _nuses - _nsoftUses; }
    void makeSameRegClass(PReg* other, RegisterEqClassBList* classes);
    void targetUses(RegisterString incoming, bool recursive);
    virtual void targetDef();
    virtual void allocateTo(Location r) {  
      assert(!cpInfo, 
             "should not allocate to a PReg that has been copy-propagated");
      loc = r; 
      theSIC->check_flushability(this);
    }
    
    virtual bool canEliminateAndStillDebug();
  protected:
    bool canRuntimeValueBeReconstructed();
    bool if_why(bool, const char*);
  public:
  
    void eliminatePR( bool removingUnreachableCode );
    
    /* 
        Pass in false to eliminatePR because defs may still be executed;
        it is merely that result value is no longer needed .
        This message is sent to the _dest register of many kinds of nodes,
        although it is only really needed if the node create a use,
        and the only such ones are MethodReturnNode and BlockCreateNode.
        -- dmu 8/96
    */
    void eliminateDefsIfUnused( PReg* recursionStopper ) {
      if ( this != recursionStopper  &&  hardUses() == 0)
        eliminatePR(false);
    }
    
  protected:
    void eliminateUses(DUInfo* info, BB* bb, bool removingUnreachableCode);
  public:

    bool isCPEquivalent(PReg* r);
    bool checkEquivalentDefs();
    bool slow_isLiveAt(Node* n);
    virtual bool isLiveAt(Node* n);
   protected:
    void addDUHelper(Node* n, PDefUseList* l, PDefUse* el);
    virtual NameNode* locNameNode(bool mustBeLegal);

   public:
    virtual void print();
    virtual void print_short()  { lprintf("%s", name()); }
    virtual char* name();       // string representing the preg name
    virtual const char* prefix()      { return "P"; }
    virtual bool verify();
    virtual NameNode* nameNode(bool mustBeLegal = true); // for debugging info
    PReg* cpReg();                  // return "cp-equivalent" PReg

    friend SCodeScope* findAncestor(SSelfScope* s1, fint& bci1,
                                    SSelfScope* s2, fint& bci2);
      // find closest common ancestor of s1 and s2, and the
      // respective sender bcis in that scope
  };

  // A temp preg is exactly like a PReg except that it is live for only
  // a very short (hard-wired) code sequence such as loading a frame ptr etc.
  class TempPReg : public PReg {
   public:
    TempPReg(SSelfScope* s) : PReg(s) {}
    TempPReg(SSelfScope* s, Location l, bool incU, bool incD)
      : PReg(s, l, incU, incD) {}
    bool isTempPReg()           { return true; }
    bool isLiveAt(Node* n)      { Unused(n);  return false; }
    bool canCopyPropagate()     { return false; }
    const char* prefix()              { return "TempP"; }
  };
  
  
  // singly-assigned PReg (in source-level terms, e.g. expr. stack entry, arg;
  // may have several defs because of splitting etc.
  // makes copy propagation simpler
  
  // Suppose there is an assignment of r1's value to r2 ( r1 = r2).
  // Suppose the SIC wants to optimize away r1 by substituting r2
  // for every use of r1.
  // Since the SIC does no flow analysis (because local variables
  // were not used that much in Self),
  // it relies on a simpler scheme: the compiler-writer makes r1 and
  // r2 SAPRegs. This is a guarantee that all uses of r2 are equivalent,
  // (you cannot have use(r2), r2 <- 17, use2(r2), and that
  // all uses of r1 are equivalent. In other words,
  // that once a SAPReg is assigned to, all of its uses
  // must see the same value. If there is a def followed by
  // aa backwards branch
  // it must not branch into the middle of the uses.
  // Because an expression stack value can only be used once
  // (in source terms), there cannot be any intervening defs,
  // and so an expr stack element can always be a SAPReg.
  // -- dmu 9/96 (as explained by Urs)
  
  // Forward-declaration for friend  
  SplitPReg* regCovering(SCodeScope* s1, fint bci1,
                         SCodeScope* s2, fint bci2,
                         SplitSig* sig);


  class SAPReg : public PReg {
   public:
    SCodeScope* creationScope;  // source scope to which receiver belongs
    fint creationStartBCI;      // startBCI in creationScope 
    fint startBCI, endBCI;      // live range = [startBCI, endBCI] in scope
                                // (for reg. alloc. purposes)
    
    SAPReg(SCodeScope* s, fint st = IllegalBCI, fint en = IllegalBCI);
    SAPReg(SCodeScope* s, Location l, bool incU, bool incD,
           fint st, fint en) : PReg((SSelfScope*)s, l, incU, incD) {
      startBCI = creationStartBCI = st; endBCI = en; creationScope = s;
    }

    bool isSinglyAssigned()     { return true; }
    bool extendLiveRange(Node* n);
    bool isLiveAt(Node* n);
    bool isSAPReg()             { return true; }
    SCodeScope* nscope()        { return (SCodeScope*)scope; }
    const char* prefix()              { return "SAP"; }
    bool verify();
   protected:
    bool basic_isLiveAt(SCodeScope* s, fint bci);
    friend SplitPReg* regCovering(SCodeScope* s1, fint bci1,
                                  SCodeScope* s2, fint bci2,
                                  SplitSig* sig);
  };

  // like SAPReg, but only used for outgoing arguments
  // (needed for on-stack replacement code)
  class ArgSAPReg : public SAPReg {
   public:
    ArgSAPReg(SCodeScope* s, Location l, bool incU, bool incD,
              fint st, fint en) : SAPReg(s, l, incU, incD, st, en) {}
    bool isArgSAPReg()          { return true; }
    const char* prefix()              { return "ArgSAP"; }
  };
  
  // SplitPRegs hold the receiver of a split message send; their main
  // purpose is to make register allocation/live range computation simple
  // and efficient without implementing general live range analysis
  class SplitPReg : public SAPReg {
   public:
    SplitSig* sig;

    SplitPReg(SCodeScope* s, fint st, fint en, SplitSig* signal)
      : SAPReg(s, st, en) {
      sig = signal; }
    bool isSinglyAssigned()     { return true; }
    bool extendLiveRange(Node* n);
    bool isLiveAt(Node* n);
    bool isSplitPReg()          { return true; }
    const char* prefix()              { return "SplitP"; }
    char* name();
  };

  // Forward-declaration for friend  
  SCodeScope* scopeFromBlockMap(mapOop blockMap);

  class BlockPReg : public SAPReg {
   public:
    blockOop block;
    bool memoized;              // memoized block?
    bool isMaterialized;    // ensures that all materialized blocks are exposed
    bool isEliminated;      // needed to avoid assert bug
    SCodeScope* primFailBlockScope;
        // if non-NULL, block is exposed only by prim failure in this scope
    bool escapes;
    static fint numBlocks;
    
    BlockPReg(SCodeScope* s, blockOop b, fint st, fint e) : SAPReg(s, st, e) {
      block = b; memoized = escapes = false; numBlocks++;
      isMaterialized = isEliminated = false;
      primFailBlockScope = NULL; }
    bool isBlockPReg() { return true; }
    NameNode* locNameNode(bool mustBeLegal);
    SCodeScope* parent();
    void memoize();         // memoize this block if possible/desirable
    void markEscaped();     // mark this block as escaping
    bool isMemoized()           { return memoized; }
    bool canEliminateAndStillDebug();
    const char* prefix()              { return "BlkP"; }
    char* name();
    bool verify();

    friend SCodeScope* scopeFromBlockMap(mapOop blockMap);
  };
  

  // move this class to a PD-preg.hh and also move all of its users (Sparc instructions)
  class NoPReg : public PReg {  // "no result" register (e.g. GO)
   public:
    NoPReg() : PReg(NULL) {
        loc = NoReg;
        initialize();
    }
    virtual bool isNoPReg()     { return true; }
    bool canCopyPropagate() { return false; }
    char* name()                { return (char*) "nil"; }
    bool verify();
  };



  // Forward-declaration for friend
  ConstPReg* new_ConstPReg(SSelfScope* s, oop c);
  #   ifdef UNUSED
  ConstPReg* findConstPReg(Node* n, oop c);
  #   endif

  class ConstPReg : public PReg {
    // ConstPRegs are used to CSE constants; at register allocation time,
    // they can either get a register (if one is available), or they're
    // treated as literals by code generation, i.e. loaded into a temp reg
    // before each use.
   public:
    oop constant;

   protected:
    ConstPReg(SSelfScope* s, oop c) : PReg(s) { constant = c; }
   public:
    friend ConstPReg* new_ConstPReg(SSelfScope* s, oop c);
#   ifdef UNUSED
    friend ConstPReg* findConstPReg(Node* n, oop c);
#   endif
    bool isConstPReg()          { return true; }
    // def cannot be targeted - source is a constant
    void targetDef() {}
    void allocateTo(Location r);
    void extendLiveRangeForScope(SSelfScope* s);
    bool extendLiveRange(Node* n);
#   ifdef UNUSED
    bool covers(Node* n);
#   endif
    bool needsRegister();
    NameNode* nameNode(bool mustBeLegal = true);
    const char* prefix()              { return "ConstP"; }
    char* name();
    bool verify();
  };
  
# endif
  
