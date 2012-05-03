/* Sun-$Revision: 30.19 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

// This file defines the intermediate language used by the SIC

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class Node;
class    PrologueNode;          // entire method prologue
class    ConstInitNode;         // initializes constants allocated to registers
  
class    LoadNode;              // abstract
class      LoadOffsetNode;      // load slot of some object
class      LoadIntNode;         // load vm constant
class      LoadStackNode;       // load up-level accessed variable
class    StoreNode;
class      StoreOffsetNode;     // store into slot of object
class      AssignNode;          // general assignment (e.g. into temp)
class      StoreStackNode;      // store up-level accessed variable

class    ReturnNode;            // abstract
class      InlinedReturnNode;   // inlined method return
class      InlinedNonLocalReturnNode;   // inlined NLR
class      MethodReturnNode;    // method return 
class      NonLocalReturnNode;  // NLR leaving this compiled method

class    ArithNode;             // all computations (incl comparisons)
class      ArithRRNode;
class      ArithRCNode;
class    AbstractBranchNode;    // nodes with (potentially) >1 sucessors
class      TArithRRNode;
class      CallNode;            // abstract
class        SendNode;          // Self call
class        PrimNode;          // primitive call
class          BlockCloneNode;  // inital block clone (possibly memoized)
class            BlockCreateNode;// create block (testing for memoization)
class          InterruptCheckNode;// interrupt check / stack overflow test
class            RestartNode;   // _Restart (= unconditional branch)
class      AbstractArrayAtNode;
class        ArrayAtNode;       // _At: primitive
class        ByteArrayAtNode;   // _ByteAt: primitive
class        AbstractArrayAtPutNode;
class          ArrayAtPutNode;  // _At:Put: primitive
class          ByteArrayAtPutNode;// _ByteAt:Put: primitive

class      BranchNode;          // machine-level conditional branches
class        TBranchNode;       // tagged compare&branch (for IntLT etc.)
class      TypeTestNode;        // type tests (compare maps, incl int/float)
class      IndexedBranchNode;   // implements indexed branch bytecode
class    BlockZapNode;          // kill (possibly memoized) block
class    DeadBlockNode;         // generates non-LIFO trap
class    DeadEndNode;           // "dead end" marker
class    FlushNode;             // flush reg to stack (SPARC)

class    MergeNode;             // nop; can have >1 predecessors
class    UncommonNode;          // uncommon branch
class    MarkerNode;            // marks current position of VScopes
class    NopNode;               // generates no code (place holders etc)
class    CommentNode;           // for debugging
    
# ifdef SIC_COMPILER

  typedef BoundedListTemplate<      Node* >       NodeBList;
  typedef BoundedListTemplate<MarkerNode* > MarkerNodeBList;

  void initNodes();             // to be called once at startup time
  
  class BasicNode : public ResourceObj  {
    friend class PNode;
   protected:   
    int32 _id;                  // unique node id for debugging
    BB* _bb;                    // basic block to which I belong
    int32 _num;                 // node number within basic block
    SSelfScope* _scope;         // scope to which we belong
    fint _bci;                  // bci within that scope
   public: // used by various clone()s
    PReg* _dest;                // not all nodes actually have src & dest,
   protected:
    PReg* _src;                 // but they're declared here for convenience
    PUse* srcUse;               // and easier code sharing
    PDef* destDef;
    static int32 thisFrameSize; // theSIC->frameSize() for convenience
   public:      
    Label* l;                   // for jumps to this node
    bool hasSideEffects_now;    // for special cases where state varies:
                                //  even though result is unused, 
                                //  still need this node
    bool deleted;               // node has been deleted
    
    bool isReachable();
    
    static int32 currentID;
    static int32 currentCommentID;
    static int32 cumulCost;             // cumulative cost of all nodes
    static ScopeInfo lastScopeInfo;     // for pcDesc generation
    static fint lastBCI;

    BasicNode();

    virtual bool isPrologueNode()       { return false; }
    virtual bool isAssignNode()         { return false; }
    virtual bool isReturnNode()         { return false; }
    virtual bool isRestartNode()        { return false; }
    virtual bool isExitNode()           { return false; }
    virtual bool isMergeNode()          { return false; }
    virtual bool isFlushNode()          { return false; }
    virtual bool isBranchNode()         { return false; }
    virtual bool isBlockCloneNode()     { return false; }
    virtual bool isBlockZapNode()       { return false; }
    virtual bool isMarkerNode()         { return false; }
    virtual bool isCommentNode()        { return false; }
    virtual bool isSendNode()           { return false; }
    virtual bool isDeadEndNode()        { return false; }
    virtual bool isTypeTestNode()       { return false; }
    virtual bool isIndexedBranchNode()  { return false; }
    virtual bool isUncommonNode()       { return false; }

    // can the node be split?
    virtual bool isSplittable()         { return true; }

    // on-stack replacement: can node occur between marker and following send?
    virtual bool canBeBetweenMarkerAndSend() { return false; }
    
    // is node the head of a loop?
    virtual bool isLoopHead()           { return false; }
    
    // eliminate unreachable (preds of merge) nodes
    virtual void eliminateUnreachableNodes() {}
    

    Node* copy(PReg* from, PReg* to);
   protected:
    virtual Node* clone(PReg* from, PReg* to) = 0;
    void genPcDesc();
   public:
    void removeUpToMerge();
    // for splitting: rough estimate of space cost of node (in bytes)
    virtual fint  cost()                { return oopSize; }     

    virtual bool hasDest()              { return false; }
            PReg* dest();
            void  setDest(BB* bb, PReg* d);
    virtual bool canCopyPropagate()     { return false; }
        // canCopyPropagate: can node replace a use with copy-propagated PReg?
        // if true, must implement copyPropagate below
    virtual bool copyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);
    virtual bool canCopyPropagateOop()  { return false; }
        // canCopyPropagateOop: can node replace a use with a copy-propagated 
        // oop?  if true, must handle ConstPRegs; implies canCopyPropagate
    virtual bool canCopyPropagateFrom(PReg* /* d */) { return true; }
        // PPC ArrayAt/Put nodes use extra temp regs
        // Consider:
        //   r27 := r3
        //   ...
        //   _At: xxx Put: r27
        // Local copy propagation will change to:
        //   r27 := r3
        //   ...
        //   _At: xxx Put: r3
        // Since AtPut on PPC uses r3 as a temp (Temp3) this breaks!
        // So I'm adding a PReg-specific test that can be customized per platform
        // -- dmu 1/2003
    virtual bool isAssignmentLike()     { return false; }
        // isAssignmentLike: node copies src to dest (implies hasSrc/Dest)
    virtual bool hasSrc()               { return false; }
            PReg* src();
    virtual bool hasConstantSrc()       { return false; }
    virtual oop  constantSrc()          { ShouldNotCallThis(); return 0; }
    virtual bool canChangeDest()        { return true; }

    virtual bool hasSplitSig()          { return false; }
    virtual SplitSig* splitSig()        { ShouldNotCallThis(); return 0; }

    BB* bb()                            { return _bb; }
    void setBB(BB* b)                   { _bb = b; }
    virtual bool endsBB() = 0;
    virtual bool startsBB()             { return false; }

    virtual BB* newBB() = 0;
    
    virtual void makeUses(BB* bb)   { Unused(bb); }
    virtual void removeUses(BB* bb) { Unused(bb); }
    
    // After eliminating a node, checkUses sees if any pregs that were used
    // are now unused.
    // It is concerned with uses, not defs.
    // It a def is eliminated, the nodes containing the use will
    // be found by removeUpToMerge, don't need to follow through pregs -- dmu
    virtual void checkUses(PReg* r) { Unused(r); }
    
    virtual void eliminateNodeAndUsedPRs(BB* bb, PReg* r, bool removing = false,
                                         void* misc = NULL);
   protected:
    virtual void eliminateNode(BB* bb, PReg* r, bool removing = false,
                               void* misc = NULL) = 0;
    
   public:
    virtual bool hasSideEffects() { return hasSideEffects_now; }
    virtual void eliminateDest(BB*); // do not need result but need node, use G0
    virtual void computeExposedBlocks(BlockPRegBList* lst) { Unused(lst); }
    virtual void markAllocated(fint* use_count, fint* def_count) = 0;
    virtual void addFlushNode(FlushNode* n);
    virtual void gen();
    void genBranch();               // generate a branch to me
    
    // for type test elimination
    virtual bool isTypeTestLike()       { return false; }
    virtual bool isFailureUncommon()    { fatal("subclass"); return false; }
                        // will incorrect type produce uncommon trap?
    virtual fint numTested()            { fatal("subclass"); return 0; }
    virtual PReg* testedReg(fint n)     { fatal("subclass"); return NULL; };
    virtual oop testedType(fint n)      { fatal("subclass"); return NULL; }
                        // mapOop of expected type for nth tested reg
    virtual void simplify(PReg* r, oop m) { fatal("subclass"); }
                        // r has map m; simplify/eliminate test if possible
    bool endsWithUncommonTrap(Node* n); // helper function

    void print_short();
    virtual char* print_string(char* buf, bool printAddr = true) = 0;
    virtual bool isTrivial()            { return false; }

    int32 id()              { return this == NULL ? -1 : _id; }
    int32 num()             { return _num; }
    SSelfScope* scope()     { return _scope; }
    fint bci()              { return _bci; }
    void setScope(SSelfScope* s);
    void setNum(int32 n)    { _num = n; }

    fint spOffset(Location l);
    fint spOffset(Location l, nmethod* nm);

    virtual void verify() {}
    void printID();
    virtual void print_succs(Node* n = NULL); // for debugging
    virtual void print_preds(Node* n = NULL); // for debugging

# include "_basicNode_pd.hh.incl"
  };

  // the NODE_COST junk is brought to you by the C++ ARM - no virtuals
  // in constructors...sigh
# define NODE_COST(class)   cumulCost += class::cost()

  NodeClassTemplate(Node, BasicNode)    // supplies the linking code

  class PNode : public Node {           // supplies default printing etc.
   public: 
    BB* newBB();
    bool endsBB()               { return ! next() || next()->startsBB(); }
    Node* clone(PReg* from, PReg* to) = 0;
    void makeUses(BB* bb);
    void removeUses(BB* bb);
    
   protected:
    void eliminateNode(BB* bb, PReg* r, bool removing, void* misc = NULL);
    
   public:
    void verify();
    void print_succs(Node* n = NULL); // for debugging
    void print_preds(Node* n = NULL); // for debugging
  };

  class PrologueNode : public PNode {
   public:
    compilingLookup* L;
    bool needToFlushRegWindow;
    bool isAccessMethod;
    fint nargs;

    PrologueNode(bool fr, bool am, fint n, compilingLookup* l) {
      needToFlushRegWindow = fr; isAccessMethod = am; nargs = n;
      L = l; thisFrameSize = 0;
      NODE_COST(PrologueNode);    
    }
    SCodeScope* scope()         { return (SCodeScope*)_scope; }
    bool isPrologueNode()       { return true; }
    Node* clone(PReg* from, PReg* to);
    void makeUses(BB* bb);
    void gen();
    bool hasSideEffects()      { return true; }
    void markAllocated(fint* use_count, fint* def_count) {
      Unused(use_count); Unused(def_count); }
    char* print_string(char* buf, bool printAddr = true);

   protected:
    bool haveStackFrame() { return !isAccessMethod; }

    void checkReceiverMap();
    void clearStackLocations();
    void createStackFrame();
    void doMapSelectorDelegateeChecks();
    void generateCountCode();
    void postPrologue();
    void prePrologue();
    void resetUnusedBit();
    void verifyAssignableParents();

# include "_prologueNode_pd.hh.incl"

  };

  class ConstInitNode : public PNode {
    // initializes register-allocated constants
    // really just a place holder (e.g. doesn't carry defs etc because these
    // depend on register allocation)
   public:
    ConstInitNode* nextCopy;            // see ConstInitNode::clone
    ConstPRegBList constants;           // constants allocated to registers

    ConstInitNode() : constants(5) {
      nextCopy = NULL; // NODE_COST();    
    }
    bool isTrivial()            { return constants.isEmpty(); }
    fint cost()                 { return 0; }
    Node* clone(PReg* from, PReg* to);
    void addConstant(ConstPReg* r);
    void gen();
    bool hasSideEffects()      { return true; }
    void markAllocated(fint* use_count, fint* def_count) {
      Unused(use_count); Unused(def_count); }
    char* print_string(char* buf, bool printAddr = true);
  };
    
  class LoadNode : public PNode {
   unknown:
    LoadNode(PReg* d) {
      _dest = d; assert(d, "dest is NULL"); }

    bool hasDest()              { return true; }
    bool canCopyPropagate()     { return true; }
    bool canCopyPropagateOop()  { return true; }
    void makeUses(BB* bb);
    void removeUses(BB* bb);
    void markAllocated(fint* use_count, fint* def_count);

   protected:
    void genLoad(PReg* source, fint srcOffset);
  };
  
  class LoadOffsetNode : public LoadNode {
   public:
    PReg* base;         // base address (e.g. object containing a slot)
    PUse* baseUse;
    fint offset;        // (slot) offset

    LoadOffsetNode(PReg* b, fint o, PReg* d) : LoadNode(d) {
      base = b; offset = o; 
      NODE_COST(LoadOffsetNode); }
    Node* clone(PReg* from, PReg* to);
    void makeUses(BB* bb);
    void removeUses(BB* bb);
    void checkUses(PReg* r);
    void markAllocated(fint* use_count, fint* def_count);
    bool copyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);
    void gen();
    void verify();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class LoadIntNode : public LoadNode {
   unknown:
    int32 value;        // constant (vm-level, not an oop) to be loaded
   public:
    LoadIntNode(int32 v, PReg* d) : LoadNode(d) {
      value = v; NODE_COST(LoadIntNode); }
    Node* clone(PReg* from, PReg* to);
    void gen();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class LoadStackNode : public LoadNode {
   unknown:
    PReg* frame;        // frame pointer of stack frame
    PUse* frameUse;
    nmethod* nm;        // nmethod of that frame (used to retrieve frame's frame size (and
                        // max # of outgoing register args - for PPC))
    NameDesc* nd;       // name to load
    oop name;           // slot name (for printing)
   public:
    LoadStackNode(PReg* f, nmethod* nm_, NameDesc* n, PReg* d, oop nam)
      : LoadNode(d) {
      frame = f; assert(f, "frame is NULL"); nm = nm_;
      nd = n; name = nam; 
      NODE_COST(LoadStackNode); }
    Node* clone(PReg* from, PReg* to);
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    inline void markAllocated(fint* use_count, fint* def_count);
    bool copyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);
    void gen();

    void verify();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class StoreNode : public PNode {
   unknown:
    StoreNode(PReg* s)          {
      _src = s; assert(_src, "src is NULL"); }
    bool canCopyPropagate()     { return true; }
    bool canCopyPropagateOop()  { return true; }
    bool hasSrc()               { return true; }
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    inline void markAllocated(fint* use_count, fint* def_count);
    void computeExposedBlocks(BlockPRegBList* l);
  };
  
  class StoreOffsetNode : public StoreNode {
    // store into data slot, do check-store if necessary
    // _src may be a ConstPReg*
   public:
    PReg* base;         // base address (object containing the slot)
    PUse* baseUse;
    fint offset;        // (slot) offset
    bool needCheckStore;

    StoreOffsetNode(PReg* s, PReg* b, fint o, bool ncs) : StoreNode(s) {
      base = b; assert(b, "base is NULL"); offset = o; needCheckStore = ncs; }
    Node* clone(PReg* from, PReg* to);
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    inline void markAllocated(fint* use_count, fint* def_count);
    bool copyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);
    bool hasSideEffects()      { return true; }
    void gen();
    void verify();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class StoreStackNode : public StoreNode {
    // _src may be a ConstPReg*
   unknown:
    PReg* frame;        // frame pointer of stack frame
    PUse* frameUse;
    nmethod* nm;        // nmethod of that frame (used to retrieve frame's frame size (and
                        // max # of outgoing register args - for PPC))
    NameDesc* nd;       // name to store into
    oop name;           // slot name (for printing)
   public:
    StoreStackNode(PReg* s, PReg* f, nmethod* nm_, NameDesc* n, oop nam)
      : StoreNode(s) {
      frame = f; assert(f, "frame is NULL"); nm = nm_;
      nd = n; name = nam; NODE_COST(StoreStackNode); }
    Node* clone(PReg* from, PReg* to);
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    inline void markAllocated(fint* use_count, fint* def_count);
    bool copyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);
    void gen();
    void verify();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class AssignNode : public StoreNode {
    // _src may be a ConstPReg*
   public:

    AssignNode(PReg* s, PReg* d) : StoreNode(s) {
      _dest = d; assert(d, "dest is NULL");
      assert(s != d, "creating dummy assignment");
      NODE_COST(AssignNode); }
    fint cost()                 { return oopSize/2; }  // assume 50% eliminated
    bool isAssignNode()         { return true; }
    bool canBeBetweenMarkerAndSend() { return true; }
    bool hasDest()              { return true; }
    bool hasSrc()               { return true; }
    bool hasConstantSrc()       { return _src->isConstPReg(); }
    bool isAssignmentLike()     { return true; }
    oop  constantSrc();
    Node* clone(PReg* from, PReg* to);
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void markAllocated(fint* use_count, fint* def_count);
    void gen();
    char* print_string(char* buf, bool printAddr = true);
   protected:
    void genOop();
  };
  
  MergeNodeClassTemplate(AbstractMergeNode, Node, NodeBList, PNode, MaxPICSize)

  class MergeNode : public AbstractMergeNode {
   public:
    bool _isLoopHead;
    bool didStartBB;            // used for debugging / assertion checks
    const char* why;            // help find where these come from -- dmu

    MergeNode(const char* why);
    MergeNode(Node* prev1, Node* prev2);

    fint cost()                 { return 0; }
    bool isTrivial()            { return _prevs->length() <= 1; }
    bool startsBB()             { return _prevs->length() > 1 || _isLoopHead; }
    bool isMergeNode()          { return true; }
    bool isLoopHead()           { return _isLoopHead; }

    void markAllocated(fint* use_count, fint* def_count) {
      Unused(use_count); Unused(def_count); }
    BB* newBB();
    Node* clone(PReg* from, PReg* to);
    void eliminateUnreachableNodes();
    void gen();

    void verify();
    char* print_string(char* buf, bool printAddr = true);
  };
    
  class ReturnNode : public PNode {
   public:
    ReturnNode(PReg* src, PReg* dest) { _src = src; _dest = dest; }
    bool hasSideEffects()  { return true; }
    bool isReturnNode()         { return true; }
    bool endsBB()               { return true; }
    bool canCopyPropagate()     { return true; }
    bool canCopyPropagateOop()  { return true; }
    bool hasSrc()               { return true; }
    bool isAssignmentLike()     { return true; }
    bool hasDest()              { return true; }
    void computeExposedBlocks(BlockPRegBList* l);
    void markAllocated(fint* use_count, fint* def_count) {
      Unused(use_count); Unused(def_count); }
  };
  
  class InlinedReturnNode : public ReturnNode {
   public:
    InlinedReturnNode(PReg* src, PReg* dest) : ReturnNode(src, dest) {}
    bool endsBB()               { return PNode::endsBB(); }
    bool isTrivial()            { return true; }
    fint  cost()                { return 0; }
    Node* clone(PReg* from, PReg* to);
    void gen();
    void verify();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class InlinedNonLocalReturnNode : public ReturnNode {
   public:
    InlinedNonLocalReturnNode(PReg* src, PReg* dest) : ReturnNode(src, dest) {}
    bool endsBB()               { return PNode::endsBB(); }
    bool isTrivial()            { return true; }
    fint  cost()                { return 0; }
    Node* clone(PReg* from, PReg* to);
    void gen();
    void verify();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class NonLocalReturnNode : public ReturnNode {
    PUse* resultUse;
   public:
    NonLocalReturnNode(PReg* src, PReg* dest)
      : ReturnNode(src, dest) { NODE_COST(NonLocalReturnNode); }

    bool isExitNode()           { return true; }
    // uses hardwired regs, has no src or dest
    bool canCopyPropagate()     { return false; }
    bool canCopyPropagateOop()  { return false; }
    bool hasSrc()               { return false; }
    bool isAssignmentLike()     { return false; }
    bool hasDest()              { return false; }
    Node* clone(PReg* from, PReg* to);
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    void gen();
    void verify();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class MethodReturnNode : public ReturnNode {
    PUse* resultUse;
    fint offset;                // size of calling sendDesc
    bool haveStackFrame;
   public:
    MethodReturnNode(fint o, bool hsf, PReg* r);
    Node* clone(PReg* from, PReg* to);
    bool isExitNode()           { return true; }
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    inline void markAllocated(fint* use_count, fint* def_count);
    void gen();
    void verify();
    char* print_string(char* buf, bool printAddr = true);
  };

  class ArithNode : public PNode {      // abstract
    // NB: ArithNodes are not used for tagged int arithmetic -- see TArithNode
   unknown:
    ArithOpCode op;
    ConstPReg* constResult;     // non-NULL if constant-folded
   public:
    ArithNode(ArithOpCode o, PReg* s, PReg* d) {
      op = o; _src = s; _dest = d; constResult = NULL; }

    bool canCopyPropagate()     { return true; }
    bool canCopyPropagateOop()  { return true; }
    bool hasSrc()               { return true; }
    bool hasDest()              { return true; }
    bool isAssignmentLike()     { return constResult != NULL; }
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    inline void markAllocated(fint* use_count, fint* def_count);
    bool copyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);
    virtual bool operIsConst() = 0;
    virtual int32 operConst() = 0;
    virtual bool doCopyPropagate(BB* bb, PUse* u, PReg* d, bool repl);
    const char* opName();
  };

  class ArithRRNode : public ArithNode {  // reg op reg => reg
   unknown:
    PReg* oper;
    PUse* operUse;
   public:
    ArithRRNode(ArithOpCode o, PReg* s, PReg* o2, PReg* d)
      : ArithNode(o, s, d) {
      oper = o2; NODE_COST(ArithRRNode); }

    Node* clone(PReg* from, PReg* to);
    bool operIsConst();
    int32 operConst();
    bool doCopyPropagate(BB* bb, PUse* u, PReg* d, bool replace);
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    inline void markAllocated(fint* use_count, fint* def_count);
    void gen();
    void verify();
    char* print_string(char* buf, bool printAddr = true);
  };

  class ArithRCNode : public ArithNode {  // reg op const => reg
    // used to compare against non-oop constants
   unknown:
    int32 oper;
   public:
    ArithRCNode(ArithOpCode o, PReg* s, int32 o2, PReg* d)
      : ArithNode(o, s, d) {
      oper = o2; NODE_COST(ArithRCNode); }
    Node* clone(PReg* from, PReg* to);
    void gen();
    bool operIsConst() { return true; }
    int32 operConst()  { return oper; }
    char* print_string(char* buf, bool printAddr = true);
  };

  BranchNodeClassTemplate(BranchNodeClass, Node, PNode, MaxPICSize)

  class AbstractBranchNode : public BranchNodeClass {
    // next() is the fall-through case, next1() the taken branch
   public:
    bool endsBB()               { return true; }
    void verify();
    
   protected:
    // put in the = 0 to force each subclass to be explicit about this
    // Each must remove the 2nd-nth successors before supering to me.
    // dmu (& Urs) 8/96
    // AbstractBranchNode's subclasses are the only nodes that may have >1 successor
    // But the more general eliminateNode routine above only works if node has
    // <= 1 successor.
    // So, but the time code gets here, node had better have just one successor.
    // If node is already deleted, I don't care.

    inline void eliminateNode(BB* bb, PReg* r, bool removing, 
                              void* misc = NULL) = 0; 
  };
  
  class TArithRRNode : public AbstractBranchNode {  
    // tagged arithmetic operation; next() is success case, next1()
    // is failure (leaving ORed operands in Temp1 for tag test)
   unknown:
    ArithOpCode op;
    PReg* oper;
    PUse* operUse;

   public:
    bool arg1IsInt, arg2IsInt;
    ConstPReg* constResult;     // non-NULL if constant-folded
    TArithRRNode(ArithOpCode o, PReg* s, PReg* o2, PReg* d, bool a1, bool a2);

    static bool isOpInlinable(ArithOpCode o);
    
    bool isAssignmentLike()     { return constResult != NULL; }
    bool canCopyPropagate()     { return true; }
    bool canCopyPropagateOop()  { return true; }
    bool canCopyPropagateFrom(PReg* d);
    bool hasSrc()               { return true; }
    bool hasDest()              { return true; }
    bool isTypeTestLike()       { return true; }
    bool isFailureUncommon();

    fint numTested()            { return 1; }
    PReg* testedReg(fint n);
    oop testedType(fint n)      { return Memory->smi_map->enclosing_mapOop(); }
    void simplify(PReg* r, oop m);

    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    void markAllocated(fint* use_count, fint* def_count);
    Node* clone(PReg* from, PReg* to);
    bool copyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);
    void gen();
    void verify();
    char* print_string(char* buf, bool printAddr = true);

   protected:
    inline void eliminateNode(BB* bb, PReg* r, bool removing, void* misc = NULL); 
    bool doCopyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);
  };

  class CallNode : public AbstractBranchNode {
    // next1 is the NLR branch (if there is one)
   public:
    PRegBList* exprStack;       // current expr. stack (NULL if not needed)
    fint argc;                  // number of args (excluding receiver)
    SplitSig* sig;      

    CallNode(MergeNode* n, fint nargs, PRegBList* e, SplitSig* sig);

    bool hasDest()              { return true; }
    bool canChangeDest()        { return false; }
    bool hasSideEffects()       { return true; }
    bool hasSplitSig()          { return true; }
    SplitSig* splitSig()        { return sig; }

    SCodeScope* scope()         { return (SCodeScope*)_scope; }
    MergeNode* nlrPoint();
    inline void makeUses(BB* bb);
    void removeUses(BB* bb);
    inline void markAllocated(fint* use_count, fint* def_count);
    virtual RegisterString mask();      // compute mask for inline cache
    void nlrCode();             // generate NLR code sequence
    
   protected:
    inline void eliminateNode(BB* bb, PReg* r, bool removing, void* misc = NULL); 
  };
  
  class SendNode : public CallNode {
   unknown:
    LookupType l;
    oop sel, del, mh;
    fint offset;
   public:
    SendNode(LookupType lt, oop s, oop d, oop m, MergeNode* n,
             fint argc, PRegBList* e, SplitSig* sig);
    bool isSendNode()           { return true; }
    fint  cost()                { return sendDesc::normal_sendDesc_end_offset; }
    Node* clone(PReg* from, PReg* to);
    void gen();
    char* print_string(char* buf, bool printAddr = true);
    
  private:
    void genBreakpointBeforeCall();
    void verifySendInfo();
  };
  
  class PrimNode : public CallNode {
   unknown:
    PrimDesc* pd;
    BlockPReg* primFailBlock;   // needed to compute correct register mask
   public:
    PrimNode(PrimDesc* d, MergeNode* n, fint a, PRegBList* e, SplitSig* sig, 
             BlockPReg* failBlock);
    bool hasSideEffects();
    fint  cost()                { return 5 * oopSize; }
    Node* clone(PReg* from, PReg* to);
    RegisterString mask();
    
   protected:
    void eliminateNode(BB* bb, PReg* r, bool removing, void* misc = NULL);
    
   public:
    void gen();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class InterruptCheckNode : public PrimNode {
   public:
    static PrimDesc* intrCheck;
    
    InterruptCheckNode(PRegBList* e, SplitSig* signal)
      : PrimNode(intrCheck, NULL, 0, e, signal, NULL) {}
    Node* clone(PReg* from, PReg* to);
    void gen();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class RestartNode : public InterruptCheckNode {
   unknown:
    MergeNode* loopStart;
   public:
    RestartNode(PRegBList* e, SplitSig* signal, MergeNode* start)
      : InterruptCheckNode(e, signal) {
        loopStart = start; start->_isLoopHead = true; 
      }
    bool isRestartNode()          { return true; }
    bool endsBB()                 { return true; }
    bool isSplittable()           { return false; }
    void markAllocated(fint* use_count, fint* def_count) {
      Unused(use_count); Unused(def_count); }
    Node* clone(PReg* from, PReg* to);
    void gen();
    bool hasSideEffects()         { return true; }
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class BlockCloneNode : public PrimNode {
    // create block or initialize memoized location
   public:
    static ConstPReg* deadBlockPR;
    static PrimDesc* blockClone;
    PUse* deadBlockUse;
    bool clonePrimFailBlock;        // true if special prim. fail. blk clone

    BlockCloneNode(BlockPReg* b, SplitSig* signal, bool pfb = false)
      : PrimNode(blockClone, NULL, 0, NULL, signal, NULL) {
      // call to block clone primitive takes 2 arguments (only "allocate" 1 because
      // we always have at least one other argument - the rcvr) -mabdelmalek
      theSIC->allocateArgs(1, true);
      _dest = b; clonePrimFailBlock = pfb; }
    bool isBlockCloneNode()     { return true; }
    // block clones are like assignments if memoized, so don't end BBs here
    bool endsBB()               { return !isMemoized() || PNode::endsBB(); }
    BlockPReg* block() {
      assert(_dest->isBlockPReg(), "not a block"); return (BlockPReg*)_dest; }
    bool isMemoized()           { return block()->memoized; }
    bool hasConstantSrc()       { return true; }
    oop  constantSrc()          { return (oop)block()->block; }
    fint  cost()                { return 2*oopSize; }    // hope it's memoized 
    Node* clone(PReg* from, PReg* to);
    bool hasSideEffects()  { return hasSideEffects_now; }
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    void addFlushNode(FlushNode* n);
    void gen();
    void genCall();
    void verify();
    char* print_string(char* buf, bool printAddr = true);
   protected:
    inline ConstPReg* deadPR();
  };
  
  class BlockCreateNode : public BlockCloneNode {
    // create block (possibly checking for memoization)
   public:

    BlockCreateNode(BlockPReg* b, SplitSig* signal) : BlockCloneNode(b, signal) {
      _dest = b; }
    bool canBeBetweenMarkerAndSend() { return true; }
    bool endsBB()               { return true; }
    bool hasConstantSrc()       { return false; }
    fint  cost()                { return 5*oopSize; } // assume blk is memoized
    Node* clone(PReg* from, PReg* to);
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    inline void markAllocated(fint* use_count, fint* def_count);
    void gen();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class BlockZapNode : public PNode {
   public:
    BlockZapNode(BlockPReg* b)  { _dest = b;  NODE_COST(BlockZapNode); }

    bool hasDest()              { return true; }
    bool isBlockZapNode()       { return true; }
    BlockPReg* block() {
      assert(_dest->isBlockPReg(), "not a block"); return (BlockPReg*)_dest; }
    bool isMemoized()           { return block()->memoized; }
    bool canChangeDest()        { return false; }
    Node* clone(PReg* from, PReg* to);
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    
   public:
    inline void markAllocated(fint* use_count, fint* def_count);
    void gen();
    void addFlushNode(FlushNode* n);
    void verify();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class BranchNode : public AbstractBranchNode {
    // next() is the target of an untaken branch, next1() the taken
   unknown:
    BranchOpCode op;
   public:

    BranchNode(BranchOpCode p)          { op = p; NODE_COST(BranchNode); }
    bool isSplittable()                 { return false; }
    bool isBranchNode()                 { return true; }
    void eliminateBranch(int32 op1, int32 op2, int32 res);
    
   protected:
    inline void eliminateNode(BB* bb, PReg* r, bool removing, void* misc = NULL);
    
   public:
    void markAllocated(fint* use_count, fint* def_count) {
      Unused(use_count); Unused(def_count); }
    Node* clone(PReg* from, PReg* to);
    void gen();

    char* print_string(char* buf, bool printAddr = true);
  };
  
  class TBranchNode : public BranchNode {
    // tagged compare&branch - args must be smis; next2() is type failure case
    // (or none if no failure possible)
    // src is receiver
   unknown:
    PReg* arg;
    PUse* argUse;
    bool intRcvr, intArg;               // rcrv/arg known to be int?
   public:

    TBranchNode(BranchOpCode opn, PReg* r, bool ir, PReg* a, bool ia)
      : BranchNode(opn) {
      intRcvr = ir; intArg = ia; _src = r; arg = a; }

    bool hasSrc()               { return true; }
    bool canCopyPropagate()     { return true; }
    bool canCopyPropagateOop()  { return true; }
    bool copyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);
    Node* clone(PReg* from, PReg* to);

    bool isTypeTestLike()       { return true; }
    bool isBranchNode()         { return false; }
    bool isFailureUncommon();
    fint numTested()            { return 1; }
    PReg* testedReg(fint n);
    oop testedType(fint n)      { return Memory->smi_map->enclosing_mapOop(); }
    void simplify(PReg* r, oop m);

    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    inline void markAllocated(fint* use_count, fint* def_count);
    void gen();

    char* print_string(char* buf, bool printAddr = true);
   protected:
    bool doCopyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);    

    void genCompare(bool haveImmediate, Location rcvrReg, Location argReg);
    void testTagsIfNecessary(bool haveImmediate, Location rcvrReg, Location argReg);
  };
  
  class TypeTestNode : public AbstractBranchNode {
    // n-way map test; next(i) is the ith map/oop [i=1..n], next() is the
    // "otherwise" branch
    // Immediate maps (int/float) must be first in the list.
    // _src is the register containing the receiver
   unknown:
    OopBList* maps;             // maps or oops to test for
    ConstPRegBList* mapPRs;     // for code generation
    bool needMapLoad;           // true if >= 1 map in maps list
    Location r;                 // location of receiver during test sequence
    bool hasUnknown;            // can rcvr be anything? (if false, rcvr map is
                                // guaranteed to be in maps list)
   public:

    TypeTestNode(PReg* r, OopBList* m, bool nml, bool u);
    bool isTypeTestNode()       { return true; }
    bool hasSrc()               { return true; }
    bool canCopyPropagate()     { return true; }
    bool canCopyPropagateOop()  { return true; }
    bool isSplittable()         { return false; }
    fint cost()                 {
      return 2 * oopSize * (maps->length() + (needMapLoad ? 1 : 0) ); }
    SCodeScope* scope()         { return (SCodeScope*)_scope; }
    Node* clone(PReg* from, PReg* to);
    bool copyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);

    bool isTypeTestLike()       { return true; }
    bool isFailureUncommon();
    fint numTested()            { return 1; }
    PReg* testedReg(fint n)     { return _src; }
    oop testedType(fint n);
    void simplify(PReg* r, oop m);
    
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    inline void markAllocated(fint* use_count, fint* def_count);
    
   protected:
    void eliminateNode(BB* bb, PReg* r, bool removing, void* misc = NULL);
    void eliminateAllBut(BB* bb, PReg* r, ConstPReg* c, mapOop m);
    
   public:
    void eliminateUnnecessary(mapOop m);
    void gen();
    void verify();

    char* print_string(char* buf, bool printAddr = true);
   protected:
    static const Location RcvrMapReg;
    static const Location MapReg;
    fint prologue(Assembler* a, Location rcvr, fint smiIndex,
                  fint floatIndex, bool immediateOnly, Label*& firstMemOopTest);
    void define(fint index, Label* l);
    void testMap(ConstPReg* map, fint index);
    void testOop(ConstPReg* oop, fint index);
    
    void br_if_smi(  Assembler* a, Location rcvr, fint smiIndex);
    void br_if_float(Assembler* a, Location rcvr, fint floatIndex);
    void br_to_unknown_case(Assembler* a);
  };
  
  
  class IndexedBranchNode : public AbstractBranchNode {
    // implements indexed branch bytecode
    // testPR contains an oop
    // if oop is not int or is negative or is >= nCases,
    //  fall through to successor i.e. next(0)
    // Otherwise, if oop is i, branch to next(i+1).
    // _src is the register containing the testPR
    // inspired by TypeTestNode -- dmu 9/96
   unknown:
    Location r;                 // location of receiver during test sequence
    int32    nCases;
    bool     srcMustBeSmi;      // if true, do not need map test

   public:

    IndexedBranchNode(PReg* testPR, int32 n);
    bool isIndexedBranchNode()  { return true; }
    bool hasSrc()               { return true; }
    bool canCopyPropagate()     { return true; }
    bool canCopyPropagateOop()  { return true; }
    bool isSplittable()         { return false; }
    fint cost()                 {
      return oopSize * ( 2*nCases +  11 - (srcMustBeSmi ? 2 : 0) ); }
    SCodeScope* scope()         { return (SCodeScope*)_scope; }
    Node* clone(PReg* from, PReg* to);
    bool copyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);

    bool isTypeTestLike()       { return true; }
    bool isFailureUncommon()    { return false; } // possible optimization opportunity
    fint numTested()            { return 1; }
    PReg* testedReg(fint n)     { return _src; }
    oop testedType(fint n);
    void simplify(PReg* r, oop m);
    
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    inline void markAllocated(fint* use_count, fint* def_count);
    
   protected:
    void eliminateNode(BB* bb, PReg* r, bool removing, void* misc = NULL);
    void eliminateAllBut(BB* bb, PReg* r, oop constSrc);
    
   public:
    void gen();
    void verify();

    char* print_string(char* buf, bool printAddr = true);
   protected:
    static const Location IndexReg;
    static const Location BoundsReg;
  };


  class AbstractArrayAtNode : public AbstractBranchNode {
    // array access: test index type & range, load element
    // next() is the success case, next1() the failure
   unknown:
                                // _src is the array, _dest the result
    PReg* arg;                  // index value
    PUse* argUse;
    bool intArg;                // need not test for int if true
    PReg* error;                // where to move the error string
    PDef* errorDef;
    fint  dataOffset;           // where start of array is (byte offset)
    fint  sizeOffset;           // where size of array is (byte offset)
   public:

    AbstractArrayAtNode(PReg* r, PReg* idx, bool ia, PReg* res,
                        PReg* err, fint dataOff, fint sizeOff) {
      _src = r; arg = idx; intArg = ia; _dest = res; error = err;
      dataOffset = dataOff; sizeOffset = sizeOff; hasSideEffects_now = true; }
    bool hasSrc()               { return true; }
    bool hasDest()              { return true; }
    bool isSplittable()         { return true; }
    fint cost()                 { return 20 + (intArg ? 0 : 12); } // approx
    bool canCopyPropagate()     { return true; }
    bool copyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);
    bool canCopyPropagateFrom(PReg* d);

    bool isTypeTestLike()       { return true; }
    bool isFailureUncommon();
    fint numTested()            { return 2; }
    PReg* testedReg(fint n);
    void simplify(PReg* r, oop m);

    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    void markAllocated(fint* use_count, fint* def_count);
    
   protected:
    void eliminateNode(BB* bb, PReg* r, bool removing, void* misc = NULL);
    
   public:
    void addFlushNode(FlushNode* n);
    void gen();
   protected:
    virtual bool genAccess(Location arr, Location index, Location dest) = 0;
    virtual Label* testArg2() { return NULL; }
  };

  class ArrayAtNode : public AbstractArrayAtNode {
   public:
    ArrayAtNode(PReg* r, PReg* idx, bool ia, PReg* res, PReg* err,
                fint dataOff);
    Node* clone(PReg* from, PReg* to);
    oop testedType(fint n);
    bool genAccess(Location arr, Location index, Location dest);
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class ByteArrayAtNode : public AbstractArrayAtNode {
   public:
    ByteArrayAtNode(PReg* r, PReg* idx, bool ia, PReg* res, PReg* err);
    Node* clone(PReg* from, PReg* to);
    oop testedType(fint n);
    bool genAccess(Location arr, Location index, Location dest);
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class AbstractArrayAtPutNode : public AbstractArrayAtNode {
    // array store: test index type & range, store element
    // next() is the success case, next1() the failure
   unknown:
    PReg* elem;
    PUse* elemUse;
   public:

    AbstractArrayAtPutNode(PReg* r, PReg* idx, bool ia, PReg* el,
                           PReg* res, PReg* err, fint doff, fint soff)
      : AbstractArrayAtNode(r, idx, ia, res, err, doff, soff) { elem = el; }
    bool copyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);
    bool canCopyPropagateOop()  { return true; }
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    inline void markAllocated(fint* use_count, fint* def_count);
  };

  class ArrayAtPutNode : public AbstractArrayAtPutNode {
   public:
    ArrayAtPutNode(PReg* r, PReg* ix, bool ia, PReg* el, PReg* res, PReg* err,
                   fint dataOff);
    Node* clone(PReg* from, PReg* to);
    oop testedType(fint n);
    bool genAccess(Location arr, Location index, Location dest);
    char* print_string(char* buf, bool printAddr = true);
    void computeExposedBlocks(BlockPRegBList* l);
  };
  
  class ByteArrayAtPutNode : public AbstractArrayAtPutNode {
    bool intElem;
   public:
    ByteArrayAtPutNode(PReg* r,PReg* ix, bool ia, PReg* el, bool ie,
                       PReg* res, PReg* err);
    Node* clone(PReg* from, PReg* to);
    fint numTested()            { return 3; }
    oop testedType(fint n);
    PReg* testedReg(fint n);
    void simplify(PReg* r, oop m);
    bool genAccess(Location arr, Location index, Location dest);
    Label* testArg2();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class FlushNode : public PNode {
   protected:
    bool readOnly;              // r is read-only (e.g. arg slot)
    bool eliminated;
   public:
    FlushNode(PReg* r, SSelfScope* s, fint bci) {
      _src = _dest = r; readOnly = r->isSAPReg(); _scope = s; _bci = bci;
      eliminated = false;
    }

    bool isFlushNode()          { return true; }
    bool canBeBetweenMarkerAndSend() { return true; }
    bool hasSrc()               { return true; }
    bool copyPropagate(BB* bb, PUse* u, PReg* d, bool replace = false);
    bool canCopyPropagate()     { return true; }
    Node* clone(PReg* from, PReg* to);
    inline void makeUses(BB* bb);
    inline void removeUses(BB* bb);
    inline void checkUses(PReg* r);
    inline void markAllocated(fint* use_count, fint* def_count);
    void computeExposedBlocks(BlockPRegBList* l);
    
    void eliminateNodeAndUsedPRs(BB* bb, PReg* r, bool removing, 
                                 void* misc = NULL);
   protected:
    inline void eliminateNode(BB* bb, PReg* r, bool removing, void* misc = NULL);
    
    void flushRegister(PReg*);

   public:
    void addFlushNode(FlushNode* n);
    void gen();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  
// On SPARC, execution of a non-lifo block is signaled by a "trap" instruction.
// However, we can't do that on PPC - we use a primitive call instead.  As a result,
// there's two different definitions of DeadEndNode. -mabdelmalek 1/03

# include "_deadBlockNode_pd.hh.incl"


  class DeadEndNode : public PNode {
   public:
    bool isExitNode()           { return true; }
    bool isDeadEndNode()        { return true; }
    Node* clone(PReg* from, PReg* to);
    void gen();
    void markAllocated(fint* use_count, fint* def_count) {
      Unused(use_count); Unused(def_count); }
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class UncommonNode : public PNode {
    PRegBList* exprStack;
    bool restartSend;
   public:
    UncommonNode(PRegBList* e, bool restartSend);

    bool isUncommonNode()       { return true; }
    fint  cost()                { return 4; }
    bool isExitNode()           { return true; }
    Node* clone(PReg* from, PReg* to);
    void markAllocated(fint* use_count, fint* def_count) {
      Unused(use_count); Unused(def_count); }
    void gen();
    void verify();
    char* print_string(char* buf, bool printAddr = true);
  };
  
  class NopNode : public PNode {
   public:
    bool isTrivial()            { return true; }
    bool canBeBetweenMarkerAndSend() { return true; }
    fint  cost()                { return 0; }
    Node* clone(PReg* from, PReg* to);
    void markAllocated(fint* use_count, fint* def_count) {
      Unused(use_count); Unused(def_count); }
    void gen();
    char* print_string(char* buf, bool printAddr = true);
  };

  class MarkerNode : public PNode {
   public:
    bool invalid;               // true if this node should be ignored
    bool active;                // true if this is the real restart point
    NameDescBList* locs;        // describes all locations in the frame
    SExprStack* exprStack;
    fint pcOffset;              // PC offset of restart point (if active)
    SplitSig* sig;      
    
    MarkerNode(SExprStack* e, SplitSig* sig);
    bool isMarkerNode()         { return true; }
    bool isTrivial()            { return true; }
    bool hasSplitSig()          { return true; }
    SplitSig* splitSig()        { return sig; }
    fint  cost()                { return 0; }
    SCodeScope* scope()         { return (SCodeScope*)_scope; }
    fint depth();
    Node* clone(PReg* from, PReg* to);
    void checkSplitting(MergeSExpr* m, SExpr* split);
    void markAllocated(fint* use_count, fint* def_count) {
      Unused(use_count); Unused(def_count); }
    void gen();
    void describe();
    sendDesc* send_desc(nmethod* nm);
    char* print_string(char* buf, bool printAddr = true);
    void check();
   protected:
    void checkMap(SExpr* expr, oop p, const char* msg, fint n = 0);
    bool checkContents(ValueLocationNameDesc* nd);
    void fail(const char* msg, const void* arg);
    bool describePReg(PReg* r, SCodeScope** scopes,
                      ValueLocationNameDesc*& nd, bool describeUnallocated);
  };
  
  class CommentNode : public PNode {
   unknown:
    const char* comment;
   public:
    CommentNode(const char* s);
    bool isTrivial()            { return true; }
    bool isCommentNode()        { return true; }
    bool canBeBetweenMarkerAndSend() { return true; }
    fint  cost()                { return 0; }
    void markAllocated(fint* use_count, fint* def_count) {
      Unused(use_count); Unused(def_count); }
    Node* clone(PReg* from, PReg* to);
    void gen();
    char* print_string(char* buf, bool printAddr = true);
  };
  
# endif
