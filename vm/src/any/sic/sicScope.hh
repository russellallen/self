#pragma once
/* Sun-$Revision: 30.16 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "basicBlock.hh"
# include "blist.hh"
# include "longRegString.hh"
# include "node.hh"
# include "preg.hh"
# include "registerString.hh"
# include "sic.hh"
# include "slist.hh"
# include "types.hh"
# include "vframe.hh"



# ifdef SIC_COMPILER

  // SScopes represent the source-level scopes compiled by the SIC. 

  class SScope;
  class   SSelfScope;
  class     SCodeScope;
  class       SMethodScope;
  class       SBlockScope;
  class         SDeadBlockScope;
  class     SAccessScope;
  class       SDataSlotAccessScope;
  class       SConstantSlotAccessScope;
  class       SDataSlotAssignScope;
  class     SPrimScope;
  class       SPerformPrimScope;
  class       SRestartPrimScope;
  class   SVFrameScope;
  class     SVFrameMethodScope;
  class     SVFrameBlockScope;
 
  typedef BoundedListTemplate<    SScope*>     SScopeBList;
  typedef BoundedListTemplate<SSelfScope*> SSelfScopeBList;

  typedef BoundedListTemplate<SExpr*> SExprBList;
  class ClonedBlockSExpr;
  class BranchBCTargetStack;

  // SendInfo holds various data about a send before/while it is being
  // inlined
  class SendInfo : public ResourceObj {
   public:
    SExpr* rcvr;
    MethodLookupKey* key;
    LookupType l;
    bool isSelfImplicit;
    bool isUndirectedResend;
    stringOop sel;
    stringOop del;
    PReg* resReg;               // register where result should end up
    bool needRealSend;          // need a real (non-inlined) send
    CountType countType;        // countType for real send
    fint nsends;                // estimated # of invocations (< 0 == unknown)
                                // This is not decremented when sends are eliminated,
                                //  so it is conservative.
                                //  It also is not incremented when sends are copied
                                //  (for splitting, e.g.).
    bool predicted;             // was receiver type-predicted?
    bool uninlinable;           // was send considered uninlinable?
    bool primFailure;           // primitive failure send?
    bool restartPrim;           // restart primitive if uncommon?

    void init() {
      resReg = NULL; needRealSend = false; countType = NonCounting;
      nsends = -1; primFailure = predicted = uninlinable = false;
    }

    SendInfo( SExpr* r, LookupType lt, 
              bool isSelfIm, bool isUR, 
              stringOop s, stringOop d) {
      rcvr = r; l = lt; isSelfImplicit = isSelfIm; isUndirectedResend = isUR; 
      sel = s; del = d; key = NULL;
      init();
    }
    SendInfo(MethodLookupKey* k);
    void computeNSends(RScope* rscope, fint bci);
    void print();
  };

  class SScope : public ResourceObj {
   public:
    static fint currentScopeID;         // for descs

    virtual bool isSelfScope()          { return false; }
    virtual bool isCodeScope()          { return false; }
    virtual bool isPrimScope()          { return false; }
    virtual bool isMethodScope()        { return false; }
    virtual bool isBlockScope()         { return false; }
    virtual bool isVFrameScope()        { return false; }
    virtual bool isVFrameMethodScope()  { return false; }   
    virtual bool isVFrameBlockScope()   { return false; }

    virtual SExpr* receiverExpr()       { ShouldNotCallThis(); return NULL;}
    virtual mapOop receiverMapOop()             = 0;
    Map*   receiverMap() { return receiverMapOop()->map_addr(); }
    virtual oop      selfMapOop()               = 0;
    virtual oop      selector()                 = 0;
    virtual oop      method()                   = 0;
    virtual oop      methodHolder_or_map()      = 0;
    virtual void     set_methodHolder_or_map(oop mh)    = 0;
    virtual SScope*  parent()                   = 0;    // lexical parent
    virtual SCodeScope* sender()                = 0;    // caller
    bool isTop()                        { return sender() == NULL; }
    bool isInlined()                    { return sender() != NULL; }
    
    virtual smi      scopeID()                  = 0;
    virtual smi      homeID()                   = 0;
    virtual compiled_vframe*  vf()              = 0;

    virtual RegisterString mask(fint bci) {
      Unused(bci); ShouldNotCallThis(); return 0; }
    
    virtual SScope* lookup(stringOop sel, slotDesc*& sd) = 0;
    // lexical scoping: search for sel in this scope, return scope if found
    // Search parent up to an outer method

    virtual SExpr* genLocal(SScope* target, SCodeScope* sender,
                            slotDesc* sd, fint argc, PReg* t)   = 0;
    // generate code for loading/storing a lexically-scoped variable

    virtual bool isRecursiveCall(oop method, oop rcvrMap, fint n) = 0;
    virtual void loadParentScope(PReg* t) {
      Unused(t);  ShouldNotCallThis(); }
    virtual void genCode() { ShouldNotCallThis(); }
  };
  
  
  class SSelfScope: public SScope { // abstract
   protected:
    SCodeScope* _sender;
    fint _senderBCI;            // call position in sender (if inlined)
   public:
    RScope* rscope;             // equiv. scope in recompilee (if any)
    VScope* vscope;             // equiv. scope on stack (if any)
    bool predicted;             // was receiver type-predicted?
    ScopeInfo  scopeInfo;
    fint   depth;               // call nesting level (top = 0)
    fint   loopDepth;           // loop nesting level (top = 0)
    SExpr* receiver;
    SExpr* result;              // result of normal return (NULL if none)
    SExpr* nlrResult;           // NLR result (non-NULL only for blocks)
    PReg *resultPR;

    SSelfScope(SCodeScope* sender, RScope* rs, SendInfo* info);

    SCodeScope* sender()        { return _sender; }
    fint senderBCI()            { return _senderBCI; }
    bool isSelfScope()          { return true; }
    virtual bool isSenderOf(SSelfScope* s) { Unused(s);  return false; }
            // isSenderOf = this is a proper caller of s 
    bool isSenderOrSame(SSelfScope* s) {
      return s == this || isSenderOf(s); }
    virtual fint bci()          { return IllegalBCI; }

    void addResult(SExpr* e);

   protected:
    fint calleeSize(RScope* rs);
    virtual void markReg(PReg* r, fint start, fint end) = 0;
    inline void allocateUp(PReg* r, bool okToOverlap);
    void computeVScope();
   public:
    virtual void allocateDown(PReg* r, fint start, fint end,
                              bool okToOverlap) = 0;
    virtual bool isRegAvailable(PReg* r, Location reg, RegisterString incoming) = 0;
    virtual Location findReg(PReg* r, fint firstRegisterIndexToUse, RegisterString inc) = 0;
    virtual Location findStackTemp(PReg* r) = 0;
    virtual void allocateReg(PReg* r, bool okToOverlap = false) = 0;
    virtual void computeMaskFor(SAPReg* r, fint stackLocs, fint nonRegisterArgs) {
      Unused(r); Unused(stackLocs); Unused(nonRegisterArgs); }
    virtual void computeMasks(RegisterString incoming, fint stackLocs,
                              fint nonRegisterArgs) {
      Unused(incoming); Unused(stackLocs); Unused(nonRegisterArgs); }
    virtual void computeUplevelAccesses(BlockPRegBList* l, BlockPReg* r) {
      Unused(l); Unused(r); ShouldNotCallThis(); }
    virtual void describe() {}
    fint descOffset();
    virtual void fixupBlocks() {}            // fix descs in blocks
    virtual bool haveNLRPoint() { return false; }
  };

  class SCodeScope: public SSelfScope { // abstract
   friend class sic_code_generator;
   
   public:
    SSelfScopeBList* subScopes; // inlined scopes
   protected:
    ConstInitNode* constInitNode;
   public:
    MethodLookupKey* _key;
    oop _method;
    methodMap *method_map;
    bool containsNLR;           // does method contain a NLR?
    bool endsDead;              // method ends with dead code
    bool primFailure;           // in a prim. failure branch? (transitive)
    smi nslots;                 // # of slots in _method
    smi _scopeID;
    smi _bci;                   // current bci being compiled
    bool inEpilogue;            // compilation is in or past epilogue
    fint nargs;                 // number of incoming arguments (excluding self)
    fint ncodes;                // number of byte codes in method
    
    SExpr* self;
    SExpr** args;               // indexed by arg slot indices
    PReg** locals;              // same for locals
    PRegBList* uplevelAccessed; // uplevel-accessed locals
    SExprStack* exprStack;      // current expression stack
    SExprBList* exprStackElems; // expression stack elems for debugging info
    SExprBList*     blockElems; // same for live blocks
    SExpr**         blockExprs; // if have branches, must prealloc exprs
                                // This holds expr indexed by bci
    BlockPRegBList* blocks;     // blocks to kill (up to current bci)
                                // If method has branches, init blocks
                                // at start of compile and memoize all.
                                // (Cause branches invalidate normal zap
                                //  optimization.)
    MergeNode** nlrPoints;      // nth elem = NLR point for sends with n
                                // live blocks
    MergeNode* startOfScope;    // for _Restart
    MergeNode* endOfScope;      // last node of scope (for inlined scopes)
    bool _haveNLRPoint;         // cache for haveNLRPoint()
    Node* flushPoint;           // place to insert reg. flushes
    fint nsends;                // # of exposing sends in this method and
                                // inlined subscopes
    PReg** expressions;         // expressions produced (indexed by bci)
    PReg** pushedLocal;         // != 0 if nth expression is pushed local var
    bool   hasBranchBC;         // true if method has a branch bytecode
    // Here is the plan for branches:
    // For each branch target, branchTargets holds a merge node, and
    // branchTargetStacks holds an object
    // used to merge the expr stack values.
    MergeNode** branchTargets;  // For each branch bytecode,
                                // branchTargets[i] holds a merge node that is
                                // the target of the branch.
                                // When node-building gets to bytecode i,
                                // branchTargets[i] needs too be inserted
                                // into node stream.
                                // Has ncodes+1 elements, last elem is for
                                // branch to return. -- dmu
                                
                                
   // At each branch bc merge point, need a list of MergeSExprs for each
   // expr stack elem.
    BranchBCTargetStack** branchTargetStacks;
    BoolBList*            backwards_branch_targets;
    
    RegisterString incoming;    // allocations for incoming regs
    RegisterString* allocs;     // reg. *mask* for all bcis (indexed by bci+1)
                                // (excluding expr stack, but including blocks)
                                // used to compute sendDesc masks
    LongRegisterString** regs;  // locations that are busy in this scope
                                // (indexed by bci)
    MarkerNode* marker;         // restart node marker
    PRegBList* splitRegs;       // this scope's SplitPRegs
    SplitSig* sig;
    
    SCodeScope(oop m, SCodeScope* sender, RScope* rs, SendInfo* info);
    
   public:
    bool isCodeScope()          { return true; }
    SExpr* receiverExpr()       { return receiver; }
    mapOop receiverMapOop()     { return _key->receiverMapOop(); }
    oop selfMapOop()            { return _key->receiverMapOop(); }
    oop method()                { return _method; }
    oop selector()              { return _key->selector; }
    oop delegatee()             { return _key->delegatee; }
    smi scopeID()               { return _scopeID; }
    smi homeID()                { return _scopeID; }
    compiled_vframe* vf()       { ShouldNotCallThis(); return NULL; }
    fint bci()                  { return _bci; }
    bool isLite()               { return nsends == 0; }
    RegisterString mask(fint bci) {
      if (bci == PrologueBCI) return allocs[0];
      assert(0 <= bci && bci < ncodes, "bci invalid");
      assert(nsends == 0  ||  allocs[bci]  ||  TARGET_ARCH == I386_ARCH, "should be nonempty");
      assert(allocs, "cannot be NULL");
      return allocs[bci];
    }
    void computeMasks(RegisterString base, fint stackLocs, fint nonRegisterArgs);
    void computeMaskFor(SAPReg* r, fint stackLocs, fint nonRegisterArgs);
    bool isRegAvailable(PReg* r, Location reg, RegisterString incoming);
    Location findReg(PReg* r, fint firstRegisterIndexToUse, RegisterString incoming);
    Location findStackTemp(PReg* r);
    void allocateReg(PReg* r, bool okToOverlap = false);
    void allocateConst(ConstPReg* r);
    bool isDeleted();
    
    void genCode();
    void prepareForBytecode(fint pc);
    inline MergeNode* nlrPoint();       // current nlr catch point
    MergeNode* nlrPoint(fint n);        // nlr catch point for n blocks
    PRegBList* currentExprStack(fint exclude = 0); // copy current expr stack
    bool isSenderOf(SSelfScope* s);
    bool haveNLR()      { return containsNLR; }
    bool haveNLRPoint();
    void addSend(PRegBList* exprStack);
   protected:
    void markLocals(PRegBList* exprStack);
   public:
    
    void describe();
    ValueLocationNameDesc* nameDescFor(PReg* r);
    void fixupBlocks();
    virtual void genScopeInfo() = 0;
    void doUplevelAccesses(BlockPReg* r, pregDoFn f);
    
   protected:
    void init_branch_targets();
    void initialize();
    void initLocals();
    void preallocateBlockExprs();

   public:  // for perform
    void flushUplevelAccessed();
   protected:
    virtual void prologue();
    virtual void postPrologue();
    virtual void epilogue();
   public:
    SExpr* inlineSend(SendInfo* info);
   protected:
    void insertMarker();
    oop valueFor(PReg* r, SExpr*& expr);
    SSelfScope* tryLookup(SendInfo* info, SExpr* rcvr);
    SSelfScope* tryLookupOfOuterMethod(SendInfo* info, SExpr* rcvr, 
                                       RScope* rs, oop methodObj, 
                                       SICLookup* L);
    SSelfScope* tryLookupOfBlockMethod(SendInfo* info, SExpr* rcvr, 
                                       RScope* rs, oop methodObj,
                                       SICLookup* L);
    SExpr* picPredict(SendInfo* info);
    SExpr* picPredictUnlikely(SendInfo* info, RUntakenScope* uscope);
    SExpr* typePredict(SendInfo* info);
    SExpr* inlineMerge(SendInfo* info, MergeNode*& merge);
    
    SExpr* splitMerge (SendInfo* info, MergeNode*& merge);
    
    void  splitInlinablePaths( MergeNode*  newMerge,
                               SendInfo*   info,
                               MergeSExpr* oldRcvr,
                               Node*       lastNodeToSplit,
                               
                               OopBList*   splitRcvrMaps,
                               SExprBList* splitRcvrs,
                               NodeBList*  splitHeads,
                               bool&       needMapLoad,
                               SExpr*&     resultOfInlinedSends);
                               
   
    bool splitPathIfInlinable( MergeNode*  newMerge,
                               SendInfo*   info,
                               MergeSExpr* oldRcvr, 
                               fint        i,
                               Node*       lastNodeToSplit,
                               
                               OopBList*   splitRcvrMaps,
                               SExprBList* splitRcvrs,
                               NodeBList*  splitHeads,
                               bool&       needMapLoad,
                               SExpr*&     resultOfInlinedSends );
                               
                               
    void   splitPathsWithSameMap( Node*         mapMerge,
                                  MergeSExpr*    oldRcvr,
                                  SExpr*      nthOldRcvr,
                                  SExpr*      nthNewRcvr,
                                  SplitPReg*      newPR  );
                                  
                                  
    void addTypeTestWhereUnknownsMerge( SendInfo*     info,
                                        MergeSExpr*   oldRcvr, 
                                        UnknownSExpr* unknownOldRcvr,
                                        bool          needMapLoad,
                                        OopBList*     splitRcvrMaps,
                                        SExprBList*   splitRcvrs,
                                        NodeBList*    splitHeads,
                                                  
                                        Node*&        lastNodeToSplit);

                                  
    Node*  copyPath(Node* n, Node* start, Node* end, PReg* oldPR, PReg* newPR,
                    MergeSExpr* rcvr, SExpr* newRcvr);
    SExpr* doInline(SSelfScope* s, SExpr* rcvr, Node* start, MergeNode* end);
    SSelfScope* notify(stringOop sel, const char* msg);
    void memoizeBlocks(stringOop sel);
    
    bool calleeTooBig      (SendInfo* info, RScope* rs, InlineLimitType t);
    bool calleeIsSmall     (SendInfo* info, RScope* rs, InlineLimitType t);
    bool shouldInlineMethod(SendInfo* info, RScope* rs, SExpr* rcvr, oop meth);
    bool shouldInlineBlock (SendInfo* info, RScope* rs, SExpr* rcvr, oop meth);
    bool shouldInlineSend  (SendInfo* info, RScope* rs, SExpr* rcvr, oop meth,
                            InlineLimitType t);
    bool shouldSplit(SendInfo* info);
    
    SExpr* genSend( bool isReceiverImplicit, bool isUndirectedResend, 
                    stringOop sel, stringOop del, fint argument_count);
    SExpr* genRealSend(SendInfo* info);
    SExpr* genPrim(SendInfo* info);
    SExpr* genLocalSend(bool isRead, fint lexicalLevel, fint index);
    SExpr* genLocalSend(stringOop sel, slotDesc* sd = NULL,  SScope* s = NULL);
    SExpr* blockLiteral(blockOop literal);

    bool testMemoization(u_char* bytes, u_char* end, oop* literals);
    void mergeInBranchTo(int32 pc);
    BranchBCTargetStack* getBranchTargetStack(int32 pc);
    void branchCode(int32 pc, int32 target_pc, oop target_oop);
    void branchIndexedCode(int32 pc, objVectorOop targets);
    virtual void returnCode() = 0;
    void handleNLR(Label* nlr);
    void continue_NLR();
    void genNLRPoints();
    SExpr* local(SCodeScope* sender, slotDesc* sd, fint argc, PReg* res);
    bool checkPerform(const char* sel, fint len, fint prefix, LookupType& l);
    bool checkPerformPrim(stringOop sel, LookupType& performLookupType);
    inline void allocateDown(PReg* r, fint start, fint end, bool okToOverlap);
    inline void getLiveRange(PReg* r, fint& start, fint& end);
    SplitPReg* coveringRegFor(SExpr* expr, SplitSig* sig);
   public:
    void markReg(PReg* r, fint start, fint end);
   public:
    void print();
    
    friend class SVFrameScope;
  };
  
  class SMethodScope: public SCodeScope { // normal method
   protected:
    oop _methodHolder_or_map;
    
   public:
    SMethodScope(oop m, oop mh_or_map, SCodeScope* sen, RScope* rs,
                 SendInfo* info);
    
    bool isMethodScope()        { return true; }
    
    SScope* parent()            { return NULL; }
    oop  methodHolder_or_map()  { return _methodHolder_or_map; }
    void set_methodHolder_or_map(oop mh_or_map) { _methodHolder_or_map = mh_or_map; }
    SScope* lookup(stringOop sel, slotDesc*& sd);
    bool isRecursiveCall(oop method, oop rcvrMap, fint n);

    void genCode();
    SExpr* genLocal(SScope* target, SCodeScope* sender, slotDesc* sd,
                    fint argc, PReg* t);
    void loadParentScope(PReg* t) { Unused(t);  ShouldNotCallThis(); }
    void genScopeInfo();
    
    void print_short();
    void print();
   protected:
    void returnCode();
  };
  
  class SBlockScope: public SCodeScope {  // block method
   protected:
    SScope* _parent;
   public:
    SBlockScope(oop m, SScope* p, SCodeScope* s, RScope* rs,
                SendInfo* info);
    
    bool isBlockScope()         { return true; }
    
    SScope* parent()            { return _parent; }
    oop methodHolder_or_map()   { return _parent->methodHolder_or_map(); }
    void set_methodHolder_or_map(oop mh) { _parent->set_methodHolder_or_map(mh); }
    oop selfMapOop()            { return _parent->selfMapOop(); }
    smi homeID()                { return _parent->homeID(); }
    bool isRecursiveCall(oop method, oop rcvrMap, fint n);
    SScope* lookup(stringOop sel, slotDesc*& sd);
    
    void genCode();
    SExpr* genLocal(SScope* target, SCodeScope* sender, slotDesc* sd,
                    fint argc, PReg* t);
    void loadParentScope(PReg* t);
    void postPrologue();
    void genScopeInfo();
    
    void print_short();
    void print();
   protected:
    void returnCode();
  };
  
  class SDeadBlockScope: public SBlockScope {
   public:
    SDeadBlockScope(oop m, SendInfo* info);
    void genCode();
    
    oop methodHolder_or_map()   { return 0; }  // so that dummy genDesc works
    oop selfMapOop()            { return 0; }
    smi homeID()                { return 0; }
    void postPrologue();
    void genScopeInfo();
    SScope* lookup(stringOop sel, slotDesc*& sd);
    
    void print_short();
  };
  
  class SAccessScope: public SSelfScope {// abstract superclass for slot access
   public:
    SICLookup* L;
    LongRegisterString regs;

    SAccessScope(SICLookup* l, SCodeScope* s, RScope* rs, SExpr* r,
                 SendInfo* info)
      : SSelfScope(s, rs, info) {
      L = l; receiver = r; }

    mapOop receiverMapOop();
    oop selector();
    oop selfMapOop()    { return receiverMapOop(); }
    oop method()        { ShouldNotCallThis(); return 0; }
    oop methodHolder_or_map()  { return receiverMapOop(); }
    void set_methodHolder_or_map(oop mh) { // can't set method holder
      Unused(mh); ShouldNotCallThis(); }
    SScope* parent()    { return NULL; }
    smi scopeID()       { ShouldNotCallThis(); return 0; }
    smi homeID()        { ShouldNotCallThis(); return 0; }
    compiled_vframe* vf()  { ShouldNotCallThis(); return NULL; }
    bool isRecursiveCall(oop method, oop rcvrMap, fint n) {
      Unused(method); Unused(rcvrMap); Unused(n);  return false; }
    SScope* lookup(stringOop sel, slotDesc*& sd) {
      Unused(sel); Unused(sd);  ShouldNotCallThis(); return NULL; }
    SExpr* genLocal(SScope* target, SCodeScope* sender,
                    slotDesc* sd, fint argc, PReg* t) {
      Unused(target); Unused(sender); Unused(sd); Unused(argc); Unused(t);
      ShouldNotCallThis(); return NULL; }
    void allocateReg(PReg* r, bool okToOverlap = false);
    bool isRegAvailable(PReg* r, Location reg, RegisterString incoming);
    Location findReg(PReg* r, fint firstRegisterIndexToUse, RegisterString incoming);
    Location findStackTemp(PReg* r);
   protected:
    inline void allocateDown(PReg* r, fint start, fint end, bool okToOverlap);
    void markReg(PReg* r, fint start, fint end);    
  };

  class SDataSlotAccessScope: public SAccessScope {
   public:
    SDataSlotAccessScope(SICLookup* l, SCodeScope* s, RScope* rs, SExpr* r,
                         SendInfo* info) : SAccessScope(l, s, rs, r, info) {}
    void genCode();
    void describe();
    void print_short();
  };
  
  class SConstantSlotAccessScope: public SAccessScope {
   public:
    SConstantSlotAccessScope(SICLookup* l, SCodeScope* s, RScope* rs, 
                             SExpr* r,
                             SendInfo* info)
      : SAccessScope(l, s, rs, r, info) {}
    void genCode();
    void describe();
    void print_short();
  };
  
  class SDataSlotAssignScope: public SAccessScope {
   protected:
    SExpr* arg;
   public:
    SDataSlotAssignScope(SICLookup* L, SCodeScope* s, RScope* rs, 
                         SExpr* r, SExpr* a, SendInfo* info);
    
    void genCode();
    void describe();
    void print_short();
  }; 

  class SVFrameScope: public SScope {  // abstract; a scope on execution stack
   protected:
    compiled_vframe* _vf;
    
   public:
    SVFrameScope(compiled_vframe* f);
    bool isVFrameScope()                { return true; }
    compiled_vframe* vf()               { return _vf; }
    oop selector()                      { return _vf->selector(); }
    SExpr* receiverExpr();
    oop method();
    oop methodHolder_or_map();
    void set_methodHolder_or_map(oop mh)        { // cannot set method holder
      Unused(mh); ShouldNotCallThis(); }
    SCodeScope* sender()                { return NULL; }
    
    SExpr* genLocal(SScope* target, SCodeScope* sender, slotDesc* sd,
                    fint argc, PReg* t);
    void print();
  };
  
  class SVFrameMethodScope: public SVFrameScope {
   public:
    
    SVFrameMethodScope(compiled_vframe* f) : SVFrameScope(f) {}
    
    bool isVFrameMethodScope() { return true; }
    bool isRecursiveCall(oop method, oop rcvrMap, fint n);
    mapOop receiverMapOop() { return _vf->receiver()->map()->enclosing_mapOop(); }
    oop selfMapOop()    { return _vf->self()->map()->enclosing_mapOop(); }
    smi scopeID()       { return _vf->desc->scopeID(); }
    smi homeID()        { return _vf->desc->scopeID(); }
    SScope* parent()    { return NULL; }
    SScope* lookup(stringOop sel, slotDesc*& sd);
    
    void print_short();
    void print();
  };
  
  
  class SVFrameBlockScope: public SVFrameScope {
   protected:
    SScope* _parent;
   public:
    
    SVFrameBlockScope(compiled_vframe* f);
    
    bool isVFrameBlockScope()   { return true; }   
    bool isRecursiveCall(oop method, oop rcvrMap, fint n) {
      return _parent->isRecursiveCall(method, rcvrMap, n); }
    SScope* parent()    { return _parent; }
    mapOop receiverMapOop()     { return _parent->receiverMapOop(); }
    oop selfMapOop()    { return _parent->selfMapOop(); }
    smi scopeID()       { return _vf->desc->scopeID(); }
    smi homeID()        { return _parent->homeID(); }
    SScope* lookup(stringOop sel, slotDesc*& sd);
    
    SExpr* genLocal(SScope* target, SCodeScope* sender, slotDesc* sd,
                    fint argc, PReg* t);
    void loadParentScope(PReg* t);
    
    void print_short();
    void print();
  };
  
  extern SVFrameScope* new_SVFrameScope(compiled_vframe* parentVFrame);
  
  class SPrimScope: public SSelfScope {
    // protected:
   public:
    oop _selector;
    PrimDesc* pd;
    fint nargs;                 // number of args (excluding self + fail block)
    SExprBList* args;           // args (in reverse order)
    fint npop;                  // # expr stack elems to pop after call
    bool lastBCI;               // true if last bci in method
    bool hasFailBlock;          // explicit failure block?
    SExpr* failBlock;
    oop failSelector;
    Node* successNode;          // node defining success result
    bool needZap;               // zap fail block after failure?
    
   public:
    SPrimScope(SCodeScope* s, oop sel, SExpr* rcvr, bool last);
    
    bool isPrimScope()                  { return true; }
    bool isRecursiveCall(oop method, oop rcvrMap, fint n) {
      Unused(method); Unused(rcvrMap); Unused(n);  return false; }
    oop selector()                      { return _selector; }
    
    mapOop   receiverMapOop()           { return _sender->receiverMapOop(); }
    SExpr*   self()                     { return _sender->self; }
    oop      selfMapOop()               { return _sender->selfMapOop(); }
    oop      method()                   { return _sender->method(); }
    oop      methodHolder_or_map()      { return _sender->methodHolder_or_map(); }
    void     set_methodHolder_or_map(oop mh)    { _sender->set_methodHolder_or_map(mh); }
    SScope*  parent()                   { return _sender->parent(); }
    SCodeScope* sender()                { return _sender; }
    smi      scopeID()                  { return _sender->scopeID(); }
    smi      homeID()                   { return _sender->homeID(); }
    compiled_vframe*  vf()              { return _sender->vf(); }
    SExprStack* exprStack()             { return _sender->exprStack; }
    fint bci()                          { return _sender->_bci; }
    RegisterString mask(fint bci)       { return _sender->mask(bci); }
    PRegBList* currentExprStack(fint n) { return _sender->currentExprStack(n);}
    
    SScope* lookup(stringOop sel, slotDesc*& sd) {
      Unused(sel); Unused(sd); ShouldNotCallThis(); return NULL; }
    SExpr* genLocal(SScope* target, SCodeScope* sender, slotDesc* sd,
                    fint argc, PReg* t) {
      Unused(target); Unused(sender); Unused(sd); Unused(argc); Unused(t);
      ShouldNotCallThis(); return NULL; }
    void loadParentScope(PReg* t) { Unused(t);  ShouldNotCallThis(); }
    
    void genCode();
   protected:
    virtual void initialize();
    virtual void loadArgs(PRegBList* blocks = NULL);
    virtual SExpr* genCall();
    SExpr* tryConstantFold();
    SExpr* tryTypeCheck();
    SExpr* tryInline();
    SExpr* inlineClone();
    SExpr* inlineIntComparison();
    SExpr* inlineIntArithmetic();
    SExpr* inlineEQ();
    SExpr* inlineVectorSize(bool objVector);
    SExpr* inlineAt(bool objVector);
    SExpr* inlineAtPut(bool objVector);
    SExpr* genPrimFailure(PrimNode* call, PReg* error, Node*& test,
                          MergeNode*& done, PReg* result, bool failure = true);
    ConstPReg* truePR();
    ConstPReg* falsePR();
    void markReg(PReg*, int, int) {}
    void allocateDown(PReg*, int, int, bool) {}
   public:
    void allocateReg(PReg*, bool okToOverlap = false) {
      Unused(okToOverlap);  ShouldNotCallThis(); }
    bool isRegAvailable(PReg* r, Location reg, RegisterString incoming) {
      Unused(r); Unused(reg); Unused(incoming);
      ShouldNotCallThis(); return false; }
    Location findReg(PReg* r, fint firstRegisterIndexToUse, RegisterString incoming) {
      Unused(r); Unused(firstRegisterIndexToUse); Unused(incoming);
      ShouldNotCallThis(); return UnAllocated; }
    Location findStackTemp(PReg* r) {
      Unused(r); ShouldNotCallThis(); return UnAllocated; }
    bool haveNLRPoint()                 { return pd->needsNLRCode(); }
    void print_short();
  };
  
  class SPerformPrimScope: public SPrimScope {
   protected:
    LookupType lookupType;
    oop _delegatee;
    SExpr* sel, *del;
    
   public:
    SPerformPrimScope(SCodeScope* s, LookupType l, oop sel, oop del,
                      SExpr* r);
    oop delegatee()     { return _delegatee; }
    void initialize();
    void print_short();
   protected:
    SExpr* genCall();
    void loadArgs(PRegBList* blocks = NULL);
  };

  class SRestartPrimScope: public SPrimScope {
   public:
    SRestartPrimScope(SCodeScope* s, oop sel, SExpr* rcvr);
    void print_short();
   protected:
    void genCode();
  };

# endif
