/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// The SIC is yet another Self compiler ("simple inlining compiler" or 
// "second, inlining compiler"; also, SIC rhymes with PIC and NIC :-)
// The SIC structure holds global state associated with the current
// compilation.

# ifdef SIC_COMPILER

  extern SICompiler* theSIC;

  oop get_sic_params_prim(oop, char* which, void* FH);
  oop set_sic_params_prim(oop, char* which, objVectorOop params, void* FH);

  enum InlineLimitType {
    NormalFnLimit,                  // "size" of normal method (see msgCost)
    BlockArgFnLimit,                // size of method with block args
    BlockFnLimit,                   // size of block method (value, value: etc)
    SplitCostLimit,                 // max total cost of copied nodes
    NormalFnInstrLimit,             // size (instructions) of normal method
    BlockArgFnInstrLimit,           // ditto for method with block args
    BlockFnInstrLimit,              // ditto for block method
    NmInstrLimit,                   // desired max. nmethod size
    LastLimit                       // sentinel
  };

  typedef BoundedListTemplate<VScope*> VScopeBList;

  class SICompiler : public AbstractCompiler {
   public:
    RScope* recompileeScope;            // recompilee's rscope (or 0)
    VScopeBList* vscopes;               // recompilee VScopes (or 0)
    int32 countID;                      // recompile counter ID
    bool needRegWindowFlushes;          // compile reg-window flushing blocks
    
    fint ncodes;                        // total # of byte codes compiled
                                        // (for statistics)
    fint nextLevel;                     // optimization level for next recomp.
    bool noInlinableSends;              // no inlinable sends remaining?
    bool useUncommonTraps;              // ok to use uncommon traps?

    fint inlineLimit[LastLimit];        // limits for current compilation
    
    NodeGen* nodeGen;
    ScopeDescRecorder* rec;
    SCodeScope* topScope;               // top scope 
    BB*  firstBB;                       // first basic block

    SplitSig* splitSig;                 // used during splitting
    
    int32 stackLocCount;                // max # stack locations needed
    int32 argCount;                     // max # of outgoing args (on stack and in registers)
    
    BBIterator* bbIterator;             // my bb iterator (used to be a global)

    // max # outgoing args on stack
    int32 nonRegisterArgCount() { return max(0, argCount - NumArgRegisters); }
    int32 stackTempCount();
    int32 frameSize() { return stackTempCountToFrameSize(stackTempCount()); }
    int32 _verifiedOffset;
    int32 _diCheckOffset;
    int32 verifiedOffset() { return _verifiedOffset; }
    int32 diCheckOffset() { return _diCheckOffset; }

    int32 _frameCreationOffset;
    int32 frameCreationOffset() { return _frameCreationOffset; }
    Assembler* instructions();
    ScopeDescRecorder* scopeDescRecorder();
      
    SICompiler(compilingLookup* k, sendDesc* sd, nmln* d);

    ~SICompiler() { finalize(); }
    
   protected:
    void initialize();
    void initializeForPlatform();
    void initTopScope();
    void initLimits();
    void computeMarkers();
    void buildBBs();

    void   constantCode() { fatal("should not use sic for access methods"); }
    void       dataCode() { fatal("should not use sic for access methods"); }
    void assignmentCode() { fatal("should not use sic for access methods"); }
    void     methodCode() { ; } // sic does this at init time

    
   public:
    nmethod* compile();
    void finalize();
    fint name()     { return SIC; }
    nm_compiler nmName() { return nm_sic; }
    fint level();
    fint estimatedSize();
    int32  incoming_arg_count();

    void allocateArgs(fint nargs, bool isPrimCall);
    void registerUninlinable(SendInfo* info, InlineLimitType t, fint cost);
    void check_flushability(PReg*);
    void cope_with_uplevel_access_to(PReg*);
    
    void print();
    void print_short();
    void print_code(bool suppressTrivial);
    void print_vcg_code(bool suppressTrivial);

# include "_sic_pd.hh.incl"

  };

  void read_sic_limits();
  
# else // SIC_COMPILER

  inline void read_sic_limits() {}

# endif

fint selectCompiler(fint compiler,
                    compilingLookup* L,
                    sendDesc* sd,
                    bool generateDebugCode);

class BlockPReg;
typedef BoundedListTemplate<BlockPReg* >  BlockPRegBList;
