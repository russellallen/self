/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// RScopes represent the inlined scopes of a nmethod during recompilation.
// Essentially, they are another view of the ScopeDesc information, in a
// format more convenient for the (re)compiler and extended with additional
// info from PICs and uncommon branches.

# ifdef SIC_COMPILER

  class RAbstractSelfScope;

  typedef BoundedListTemplate<RScope*> RScopeBList;

  RAbstractSelfScope* constructRScopes(nmethod* nm,
                                       bool trusted = true,
                                       fint level = 0);

  class RScope : public ResourceObj {
   unknown:
    RAbstractSelfScope* _sender;
    fint _senderBCI;
   public:
    fint nsends;        // estimated # of invocations (-1 == unknown)
    
    RScope(RAbstractSelfScope* s, fint bci);
    virtual bool isSelfScope()  { return false; }
    virtual bool isNullScope()  { return false; }
    virtual bool isPICScope()   { return false; }

    // added by dmu 4/96 to avoid letting in uncommon arith prim failures
    virtual bool isTrusted() { return true; }

    virtual bool isUntakenScope(){ return false; }
            RAbstractSelfScope* sender() { return _sender; }
    virtual bool equivalent_scope(SScope* s) = 0;
    virtual bool equivalent_lookup(simpleLookup* l) = 0;
    virtual RScope* subScope(fint bci, simpleLookup* l) {
      Unused(bci); Unused(l); ShouldNotCallThis(); return NULL;}
    virtual RScopeBList* subScopes(fint bci) {
      Unused(bci); ShouldNotCallThis(); return NULL;}
    virtual bool  hasSubScopes(fint bci) {
      Unused(bci); ShouldNotCallThis(); return false;}
    virtual bool isUncommonAt(fint bci, bool primCall) {
      Unused(bci); Unused(primCall); ShouldNotCallThis(); return false; }
    virtual SExpr* receiverExpr() { ShouldNotCallThis(); return NULL; }
    virtual oop method() { ShouldNotCallThis(); return 0; }
    virtual void print();
    virtual void print_short() = 0;
    virtual void printTree(fint bci, fint level);
    virtual void extend() {}
  
    friend RAbstractSelfScope* constructRScopes(nmethod* nm,
                                                bool trusted,
                                                fint level);
  };
  
  typedef BoundedListTemplate<RUncommonBranch*> RUncommonBranchBList;

  class RAbstractSelfScope : public RScope {
    // a non-dummy scope in the recompilee
   public:
    RScopeBList** _subScopes;   // indexed by bci
    fint ncodes;                // # byte codes in method
    RUncommonBranchBList uncommon;
    mapOop _receiverMapOop;     // hack to handle cloned block maps
    ScopeDesc* desc;

    RAbstractSelfScope(RAbstractSelfScope* s, fint bci, ScopeDesc* d,
                       mapOop m);
    RScope* subScope(fint bci, simpleLookup* l);  // returns NullScope if no scope
    RScopeBList* subScopes(fint bci);
    bool  hasSubScopes(fint bci);
    void addScope(fint bci, RScope* s);
    bool equivalent_lookup(simpleLookup* l);
    bool isUncommonAt(fint bci, bool primCall);
    SExpr* receiverExpr();

    mapOop receiverMapOop() { return _receiverMapOop; }
    Map*   receiverMap()    { return receiverMapOop()->map_addr(); }
    
    oop method();
    void printTree(fint bci, fint level);
   protected:
    void printSubScopes();
    friend RAbstractSelfScope* constructRScopes(nmethod* nm,
                                                bool trusted,
                                                fint level);
  };
  
  class RSelfScope : public RAbstractSelfScope {
    // an inlined scope in the recompilee
   public:
    RSelfScope(RAbstractSelfScope* s, fint bci, ScopeDesc* d);
    bool isSelfScope()          { return true; }
    bool equivalent_scope(SScope* s);
    void print();
    void print_short();
  };
  
  class RPICScope : public RAbstractSelfScope {
    // a scope called by the recompilee via a PIC
   public:
    nmethod* caller;
    LookupType lookupType;
    sendDesc* sd;               // calling sendDesc
    PcDesc* pcDesc;             // calling pcDesc
    nmethod* callee;
    fint level;                 // distance from root
    bool trusted;               // is PIC info trusted?
    bool extended;              // subScopes computed?
    
    RPICScope(nmethod* caller, PcDesc* pc, sendDesc* s, mapOop rcvrMap, 
              nmethod* callee, CountStub *cs, fint level, bool trusted);
    bool isPICScope()           { return true; }
    bool isTrusted()            { return trusted; }
    fint bci()                  { return pcDesc->byteCode; }
    bool equivalent_scope(SScope* s);
    void unify(RAbstractSelfScope* s);
    void extend();
    void print();
    void print_short();
  };

  class RUntakenScope : public RPICScope {
    // stands for a non-existing PIC scope, i.e. a send/inline cache that was
    // never executed
   public:
    RUntakenScope(nmethod* caller, PcDesc* pc, sendDesc* s, fint level);
    bool isUntakenScope()       { return true; }
    bool isUnlikely();
    bool equivalent_scope(SScope* s)  { Unused(s);  return false; }
    bool equivalent_lookup(simpleLookup* l)  { Unused(l);  return false; }
    SExpr* receiverExpr();
    void extend() {}
    void print();
    void print_short();
  };

  class RNullScope : public RScope {
    // dummy scope for convenience; e.g. can call subScope() w/o checking for
    // this==NULL
   public:
    RNullScope(RAbstractSelfScope* s) : RScope(s, 0) {}
    bool isNullScope()          { return true; }
    bool equivalent_scope(SScope* s)  { Unused(s);  return false; }
    bool equivalent_lookup(simpleLookup* l)  { Unused(l);  return false; }
    RScope* subScope(fint bci, simpleLookup* l)  {
      Unused(bci); Unused(l);  return this; }
    RScopeBList* subScopes(fint bci);
    bool  hasSubScopes(fint bci){ Unused(bci);  return false; }
    bool isUncommonAt(fint bci, bool primCall) {
      Unused(bci); Unused(primCall);  return true; }
    void print()                { print_short(); }
    void printTree(fint bci, fint level);
    void print_short();
  };
  

  class RUncommonBranch : public ResourceObj {
    // represents a taken uncommon branch
   public:
    RScope* scope;
    PcDesc* pcDesc;         // where the trap instruction is

    RUncommonBranch(RScope* r, PcDesc* pc) { scope = r; pcDesc = pc; }

    fint bci()              { return pcDesc->byteCode; }
    void print();
  };


  // vscopes represent the scopes on the stack when the recompilation occurs

  class VScope : public ResourceObj {
   public:
    compiled_vframe* vf;
    VScope* callee;

    VScope(abstract_vframe* v, VScope* c) { vf = v->as_compiled(); callee = c;}
    void print();
    void print_short();
  };

# define BadVScope  ((VScope*)0x1)

# endif
