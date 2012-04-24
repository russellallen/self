/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# ifdef SIC_COMPILER

  // SExprs denote the results of expressions in the SIC.  Their main
  // purpose is to annotate the PRegs with type information.

# define BASIC_FLAG_DEF(name, prot)                                           \
 protected:                                                                   \
    static const fint CONC(name,Bit);                                         \
 prot                                                                         \
  bool CONC(is,name)() { return flags & CONC(name,Bit); }                     \
  void CONC(set,name)(bool b) {                                               \
    if (b) flags |= CONC(name,Bit); else flags &= ~CONC(name,Bit); }          \

# define FLAG_DEF(name)       BASIC_FLAG_DEF(name, public:)
# define PFLAG_DEF(name)      BASIC_FLAG_DEF(name, protected:)

  class SExpr : public ResourceObj {
   protected:
    PReg* _preg;                // PReg holding it
    Node* _node;                // defining node or NULL if unknown
    SSelfScope* unlikelyScope;  // scope/bci making unknown unlikely
    fint unlikelyBCI;           // (only set if isUnknownUnlikely())
   public:
    SExpr* next;                // used for splittable MergeSExprs
    int32 flags;

    SExpr(PReg* p, Node* n) { _preg = p; _node = n; next = NULL; flags = 0; }

    SExpr* copyMergeWith(SExpr* other, PReg* p, Node* nod);

    virtual bool isUnknownSExpr()       { return false; }
    virtual bool isNoResultSExpr()      { return false; }
    virtual bool isMapSExpr()           { return false; }
    virtual bool isClonedBlockSExpr()   { return false; }
    virtual bool isConstantSExpr()      { return false; }
    virtual bool isMergeSExpr()         { return false; }

    virtual bool hasMap()               { return false; }
    virtual bool really_hasMap(SSelfScope* s) { Unused(s);  return hasMap(); }
    virtual mapOop myMapOop()           { return map()->enclosing_mapOop(); }
    virtual Map* map()                  { return myMapOop()->map_addr(); }
    virtual bool hasConstant()          { return false; }
    virtual oop constant()              { ShouldNotCallThis(); return 0; }
    virtual bool containsUnknown()      = 0;
    virtual SExpr* makeUnknownUnlikely(SSelfScope* s) {
      Unused(s); ShouldNotCallThis(); return 0;}
    virtual bool isUnknownUnlikely()    { return false; }

    virtual UnknownSExpr* findUnknown() { return NULL; }
    virtual SExpr* findMap(mapOop map)  { Unused(map);  return NULL; }

    virtual SExpr* asReceiver() { return this; }
    virtual MapSExpr* asMapSExpr() { ShouldNotCallThis(); return NULL; }
    virtual ConstantSExpr* asConstantSExpr() {
      ShouldNotCallThis(); return NULL; }
    virtual MergeSExpr* asMergeSExpr() {
      ShouldNotCallThis(); return NULL; }

    virtual SExpr* shallowCopy(PReg* p, Node* n) = 0;
    
    // n must be the node where the merge happens, the merge node
    // or NULL to disallow splitting -- dmu
    virtual SExpr* mergeWith(SExpr* other, Node* n) = 0;
    virtual SExpr* mapify(PReg* p, Node* n) = 0;
    virtual bool equals(SExpr* other) = 0;

    Node* node()                        { return _node; }
    PReg* preg()                        { return _preg; }
    void  setNode(Node* n, PReg* p)     { _node = n; _preg = p; }
    SSelfScope* scope();
    virtual NameNode* nameNode(bool mustBeLegal = true);
    void print_expr(const char* type);
  };

  class UnknownSExpr : public SExpr {
   public:
    UnknownSExpr(PReg* p, Node* n = NULL, bool u = false) : SExpr(p, n) {
      setUnlikely(u); }
    bool isUnknownSExpr()       { return true; }
    bool containsUnknown()      { return true; }
    FLAG_DEF(Unlikely);    // true e.g. if this is the "unknown" branch of a
                        // type-predicted receiver, or result of prim. failure
    UnknownSExpr* findUnknown() { return this; }
    bool isUnknownUnlikely()    { return isUnlikely(); }
    SExpr* shallowCopy(PReg* p, Node* n);
    SExpr* mergeWith(SExpr* other, Node* n);
    SExpr* mapify(PReg* p, Node* n) { return shallowCopy(p, n); };
    SExpr* makeUnknownUnlikely(SSelfScope* s);
    bool equals(SExpr* other);
    void print();
  };

  class NoResultSExpr : public SExpr {
   public:
    NoResultSExpr(Node* n = NULL);
    bool isNoResultSExpr()      { return true; }
    bool containsUnknown()      { return false; }
    SExpr* shallowCopy(PReg* p, Node* n);
    SExpr* mergeWith(SExpr* other, Node* n);
    SExpr* mapify(PReg* p, Node* n) { return shallowCopy(p, n); };
    bool equals(SExpr* other);
    void print();
  };

  class MapSExpr : public SExpr {
    friend class SVFrameScope;
   protected:
    mapOop _myMapOop;
   public:
    MapSExpr(mapOop m, PReg* p, Node* n);
    
    bool isMapSExpr()           { return true; }
    bool containsUnknown()      { return false; }

    MapSExpr* asMapSExpr()      { return this; }
    bool hasMap()               { return true; }
    mapOop myMapOop()           { return _myMapOop; }
    SExpr* shallowCopy(PReg* p, Node* n);
    SExpr* mergeWith(SExpr* other, Node* n);
    SExpr* mapify(PReg* p, Node* n) { return shallowCopy(p, n); };
    SExpr* findMap(mapOop map)  { return _myMapOop == map ? this : NULL; }
    bool equals(SExpr* other);
    void print();
  };

  class ClonedBlockSExpr : public MapSExpr {
    // a cloned block literal (result of BlockClone node)
   protected:
    SCodeScope* _blockScope;   // block's parent scope
    ClonedBlockSExpr(mapOop m, PReg* p, Node* n, SCodeScope* ps)
      : MapSExpr(m, p, n) { _blockScope = ps; }
   public:
    ClonedBlockSExpr(mapOop m, PReg* p, Node* n);
    bool isClonedBlockSExpr()   { return true; }
    SCodeScope* blockScope() { return _blockScope; }
    SExpr* shallowCopy(PReg* p, Node* n);
    SExpr* mergeWith(SExpr* other, Node* n);
    bool equals(SExpr* other);
    void print();
  };

  class ConstantSExpr : public SExpr {
    oop _c;
   public:
    ConstantSExpr(oop c, PReg* p, Node* n) : SExpr(p, n) { _c = c; }
    
    bool isConstantSExpr()              { return true; }
    bool containsUnknown()              { return false; }
    bool hasMap()                       { return true; }
    MapSExpr* asMapSExpr();
    Map*   map()                        { return _c->map(); }
    ConstantSExpr* asConstantSExpr()    { return this; }
    bool hasConstant()                  { return true; }
    oop constant()                      { return _c; }
    NameNode* nameNode(bool mustBeLegal = true);
    SExpr* shallowCopy(PReg* p, Node* n);
    SExpr* mergeWith(SExpr* other, Node* n);
    SExpr* mapify(PReg* p, Node* n);
    SExpr* findMap(mapOop map);
    bool equals(SExpr* other);
    void print();
  };

  class MergeSExpr : public SExpr {
   public:
    SExprBList* exprs;

    MergeSExpr(PReg* p = NULL, Node* n = NULL);
    
    bool isMergeSExpr()         { return true; }
    FLAG_DEF(Splittable);
    PFLAG_DEF(UnknownSet);
    PFLAG_DEF(ContainingUnknown);
   public:
    bool containsUnknown();
    MergeSExpr* asMergeSExpr()  { return this; }
    bool hasMap();
    bool really_hasMap(SSelfScope* s);
    mapOop myMapOop();
    SExpr* asReceiver();
    bool hasConstant();
    oop constant();
    SExpr* shallowCopy(PReg* p, Node* n);
    SExpr* mergeWith(SExpr* other, Node* n);
    void   resetTo(Node* n, SExprBList* e);
    SExpr* mapify(PReg* p, Node* n);
    SExpr* makeUnknownUnlikely(SSelfScope* s);
    bool equals(SExpr* other);
    void print();

    UnknownSExpr* findUnknown();    // returns NULL if no expression found
    SExpr* findMap(mapOop map);

   protected:
    void initialize();
    void add(SExpr* s);
  };


  class SExprStack : public SExprBList {
    // keeps track of live ranges by recording bci on push/pop
    SCodeScope* scope;
   public:
    SExprStack(SCodeScope* s, fint size) : SExprBList(size) { scope = s; }
    void push(SExpr* e);
    void append(SExpr* e)   { push(e); }
    SExpr* pop();
  };
  
  
  class BranchBCTargetStack : public SExprBList {
    // keeps track of s exprs in expr stack at target of a branch bytecode
   friend BranchBCTargetStack* new_BranchBCTargetStack(
              SCodeScope* s,
              bool  isTargetOfBackwardsBranch,
              int32 len,
              int32 targetBCI );
   public:
     BranchBCTargetStack( int32 len );
     void mergeInExprsFromStack( SExprStack* stk, 
                                 Node*       mergeNode, 
                                 bool        isBackwards );
     void moveExprsToStack( SExprStack* stk );
     
   protected:
     virtual SExpr* new_expr(SCodeScope*, int32 targetBCI) = 0;
     BranchBCTargetStack* initialize( int32 len, SCodeScope*, 
                                      int32 targetBCI);
     virtual SExpr* mergeInExpr( 
                      SExpr* myExpr, 
                      SExpr* stkExpr,
                      Node*  mergeNode,
                      bool   isBackwards ) = 0;
  };

  class FBranchBCTargetStack : public BranchBCTargetStack {
    // keeps track of s exprs in expr stack at target of a branch bytecode
    // that only goes forward
    // This is an optimization; since branches only go forward, can use
    // MergeSExprs for my elements, enabling possible further optimizations.
    
   public:
     FBranchBCTargetStack( int32 len ) : BranchBCTargetStack( len ) {}
   
   protected:
     SExpr* new_expr(SCodeScope*, int32 targetBCI);
     SExpr* mergeInExpr( SExpr*  myExpr, 
                         SExpr*  stkExpr, 
                         Node*   mergeNode,
                         bool    isBackwards );
  };
  
  class BBranchBCTargetStack : public BranchBCTargetStack {
    // keeps track of s exprs in expr stack at target of a branch bytecode
    // that my be backwards.
    // Since branch may be backwards to this point and
    // MergeSExprs are functional, cannot use them in this case.
    // Go with UnknownSExprs instead.
    
   public:
     BBranchBCTargetStack( int32 len ) : BranchBCTargetStack( len ) {}
   
   protected:
     SExpr* new_expr(SCodeScope*, int32 targetBCI);
     SExpr* mergeInExpr( SExpr*  myExpr, 
                         SExpr*  stkExpr, 
                         Node*   mergeNode,
                         bool    isBackwards );
  };
  
    
# undef BASIC_FLAG_DEF
# undef FLAG_DEF
# undef PFLAG_DEF

# endif
