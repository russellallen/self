/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// BBs (Basic Blocks) are used by the SIC to perform local optimizations and
// code generation

# ifdef SIC_COMPILER

  typedef BoundedListTemplate<AbstractBB*> AbstractBBBList;
  typedef BoundedListTemplate<BB*        >         BBBList;
  typedef BoundedListTemplate<BitVector* >  BitVectorBList;
  typedef BoundedListTemplate<     PReg* >       PRegBList;
  typedef BoundedListTemplate<RegCandidate*> RegCandidateBList;

  class BasicBlockBase : public ResourceObj {
   unknown:
    Node *first, *last;
    fint backwardBranches;      // number of backward branches to us
    fint nnodes;                // number of nodes in this BB
    BBDUTable duInfo;           // defs/uses of PRegs
    int32 _id;                  // unique BB id
   public:      
    void init(Node* f, Node* l, fint n);
    int32 id() { return this == 0 ? -1 : _id; }
  };
  
  NodeClassTemplate(AbstractBB, BasicBlockBase)
  BranchNodeClassTemplate(AbstractBranchBB, AbstractBB, AbstractBB, MaxPICSize)
  MergeNodeClassTemplate(AbstractMergeBranchBB, AbstractBB, AbstractBBBList,
                         AbstractBranchBB, MaxPICSize)

  class BB : public AbstractMergeBranchBB {
   public:
    BB(Node* f, Node* l, fint n) { init(f, l, n); }

    bool hasSingleSuccessor()   { return next1() == 0; }
    bool hasSinglePredecessor() { return _prevs->length() <= 1; }
    
    void localCopyPropagate();

    void makeUses();
    PUse* addUse(Node* n, PReg* r, bool soft = false);
    PDef* addDef(Node* n, PReg* r);
    inline DUInfo* defUseInfo(PRegBBIndex* whichPReg);
    void remove(Node* n);                       // remove node
    void addAfter(Node* prev, Node* newNode);   // add node after prev
    void allocateTempRegisters(BitVector** hardwired, PRegBList* localRegs,
                               BitVectorBList* lives);
   protected:
    RegisterString compute_usedTwice();
    void localCopyPropagateOnePReg(DUInfo* dui, RegisterString usedTwice);
    PUseListElem* localCopyPropagateEachUseOfThisDef(DUInfo* dui, 
                                                       PDefListElem* d,
                                                       PUseListElem* firstUseToConsider,
                                                       RegisterString usedTwice);
    static bool isSourceOfDefUsedTwice(PDef* def, RegisterString usedTwice);
    static PUseListElem* findFirstUseOfDef(PDef* def, PUseListElem* startingUse);
    static fint IDOfDefAfter(PDefListElem* d);
                                                       
    void allocate_to_preferred_candidates_if_possible(fint use_count[], fint def_count[]);
    void pick_candidates_for_assignment_node(Node* n, fint use_count[], fint def_count[],
                                             RegCandidateBList &cands);

    void slowAllocateTempRegisters(BitVector** hardwired, PRegBList* localRegs,
                                        BitVectorBList* lives);
    void doAlloc(PReg* r, Location l);
   public:
    void computeExposedBlocks(BlockPRegBList* l);
    void eliminateUnreachableNodes();

    void gen();

    bool contains(Node* n);
    void verify();
    void dfs(BBBList* list);
    void print_short();
    void print_code(bool suppressTrivial);
    void print_vcg_nodes(FILE* f, bool suppressTrivial);
    void print_vcg_edges(FILE* f, bool suppressTrivial);
    void print();

   protected:
    fint addUDHelper(PReg* r);
    void renumber();
  };


  typedef void (*BBDoFn)(BB* b);
  
  class BBIterator : public ResourceObj {
   unknown:
    BBBList* bbTable;           // BBs sorted in topological order
    int32 bbCount;              // number of BBs
    PRegBList* pregTable;       // holds all PRegs; indexed by their id
    PRegBList* globals;         // holds globally allocated PRegs; indexed by
                                // their num()
    bool usesBuilt;             // true after uses have been built
    BlockPRegBList* exposedBlks;// list of escaping blocks
    BitVector** dominators;     // BB dominator relationship
    
   public:
    BBIterator() {
      bbTable = 0; dominators = 0; bbCount = 0; usesBuilt = false; 
    }

    void build(Node* first);            // build bbTable
   protected:
    void buildBBs(Node* first);
    void buildTable(BB* first);
   public:
    void addBBPostHoc(BB* bb, BB* predBB,  BB* nextBB);
    void clear();                       // clear bbTable
    void apply(BBDoFn f);
    
    void makeUses();
    void eliminateUnreachableNodes();
    void eliminateUnneededResults();
    void computeExposedBlocks();
    void computeUplevelAccesses();
    void allocateTempRegisters();
    void localCopyPropagate();
    void globalCopyPropagate();
    void computeMasks(fint stackLocs, fint nonRegisterArgs);
    void computeDominators();
    void optimizeTypeTests();
    void gen();
    
    void print();
    void print_code(bool suppressTrivial);
    void print_vcg_code(FILE* f, bool suppressTrivial);
    void printDominators();
    void verify(bool theWoiks = true);
    void checkTail();
    void checkReturnSomewhere();

   protected:
  };

# endif

