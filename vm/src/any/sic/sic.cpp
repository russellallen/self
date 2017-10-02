/* Sun-$Revision: 30.13 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "abstract_interpreter_inline.hh"
# include "asm.hh"
# include "basicBlock_inline.hh"
# include "complexLookup.hh"
# include "genHelper.hh"
# include "glueSupport.hh"
# include "inlining.hh"
# include "itimer.hh"
# include "nlrSupport.hh"
# include "node.hh"
# include "nodeGen.hh"
# include "preg.hh"
# include "print.hh"
# include "recompile.hh"
# include "regAlloc.hh"
# include "registerString.hh"
# include "rscope.hh"
# include "scopeDescRecorder.hh"
# include "selfMonitor.hh"
# include "sic.hh"
# include "sicScope.hh"
# include "slotRef.hh"
# include "spaceSize.hh"
# include "timer.hh"

# ifdef SIC_COMPILER

  bool verifyOften = false;

  SICompiler* theSIC = NULL;
  SICompiler* lastSIC = NULL;       // for debugging
  BBIterator* last_bbIterator;

  static const int32 SICScopesSize              = 25 * K;
  static const int32 SICPCsSize                 =  5 * K;

  static const fint DefaultSICMaxSplitCost        =   50;
  static const fint DefaultSICMaxBlockInstrSize   =  600;
  static const fint DefaultSICMaxFnInstrSize      =  400;
  static const fint DefaultSICMaxBlockFnInstrSize =  600;
  static const fint DefaultSICMaxNmethodInstrSize = 5000;

  // inlining parameters (set via primitives)
  static IntBList* limits[LastLimit];

  void sic_init() {
    assert(bootstrapping, "should be allocating on C heap");
    for (fint i = NormalFnLimit; i < LastLimit; i++) {
      limits[i] = new IntBList(MaxRecompilationLevels, true);
      limits[i]->push(0);
    }    
    read_sic_limits();
  }
  
 // read_sic_limits exists so these can by set by prims
 
 void read_sic_limits() {
    limits[        NormalFnLimit ]->nthPut(0,      MaxFnInlineSize);
    limits[      BlockArgFnLimit ]->nthPut(0, MaxBlockFnInlineSize);
    limits[         BlockFnLimit ]->nthPut(0,   MaxBlockInlineSize);
    
    limits[   NormalFnInstrLimit ]->nthPut(0,      DefaultSICMaxFnInstrSize);
    limits[ BlockArgFnInstrLimit ]->nthPut(0, DefaultSICMaxBlockFnInstrSize);
    limits[          NmInstrLimit ]->nthPut(0, DefaultSICMaxNmethodInstrSize);
    limits[     BlockFnInstrLimit ]->nthPut(0,   DefaultSICMaxBlockInstrSize);
    limits[       SplitCostLimit ]->nthPut(0,   DefaultSICMaxSplitCost);
  }

  inline fint getLimit(IntBList* l, fint which) {
    if (which >= l->length()) which = l->length() - 1;
    return l->nth(which);
  }

  inline IntBList* stringToList(char* which) {
    if (strcmp(which, "Fn") == 0) {
      return limits[NormalFnLimit];
    } else if (strcmp(which, "BlockFn") == 0) {
      return limits[BlockArgFnLimit];
    } else if (strcmp(which, "Block") == 0) {
      return limits[BlockFnLimit];
    } else if (strcmp(which, "FnInstrs") == 0) {
      return limits[NormalFnInstrLimit];
    } else if (strcmp(which, "BlockFnInstrs") == 0) {
      return limits[BlockArgFnInstrLimit];
    } else if (strcmp(which, "BlockInstrs") == 0) {
      return limits[BlockFnInstrLimit];
    } else if (strcmp(which, "NMInstrs") == 0) {
      return limits[NmInstrLimit];
    } else if (strcmp(which, "Split") == 0) {
      return limits[SplitCostLimit];
    } else {
      return NULL;
    }
  }

# define SIC_PARAMS_ERROR_MSG \
    "arg1 should be Fn | BlockFn | Block | FnInstrs | BlockFnInstrs | BlockInstrs | Split"

  oop get_sic_params_prim(oop, char* which, void* FH) {
    IntBList* l = stringToList(which);
    if (!l) {
      failure(FH, SIC_PARAMS_ERROR_MSG);
      return 0;
    }
    objVectorOop res= Memory->objVectorObj->cloneSize(l->length());
    for (fint i = 0; i < l->length(); i++) {
      res->obj_at_put(i, as_smiOop(l->nth(i)));
    }
    return res;
  }
    
  oop set_sic_params_prim(oop r, char* which, objVectorOop params, void* FH) {
    ResourceMark rm;
    IntBList* l = stringToList(which);
    if (!l) {
      failure(FH, SIC_PARAMS_ERROR_MSG);
      return 0;
    }
    fint len = params->length();
    fint *n= NEW_RESOURCE_ARRAY(fint, len);
    fint i;
    for (i = 0; i < len; i++) {
      oop param = params->obj_at(i);
      if (!param->is_smi() || smiOop(param)->value() < 1) {
        char msg[BUFSIZ];
        sprintf(msg, "arg2[%ld]: invalid parameter (not a positive integer)",
                long(i));
        failure(FH, msg);
        return 0;
      }
      n[i] = smiOop(param)->value();
    }
    oop res = get_sic_params_prim(r, which, NULL);
    l->clear();
    for (i = 0; i < len; i++) l->push(n[i]);
    return res;
  }

  ScopeDescRecorder* SICompiler::scopeDescRecorder() { return rec; }
  Assembler* SICompiler::instructions() { return genHelper->a; }
    
  SICompiler::SICompiler(compilingLookup* k, sendDesc* sd, nmln* d)
    : AbstractCompiler(k, sd, d) {
    if (VMSICProfiling) OS::profile(true);
    initialize();
  }
  
  
  void SICompiler::finalize() {
    theSIC = NULL;
    theNodeGen = NULL;
    genHelper = NULL;
    theAssembler->finalize();
    last_bbIterator = bbIterator;
    bbIterator = NULL;
    AbstractCompiler::finalize();
    if (VMSICProfiling) OS::profile(false);
  }

  fint SICompiler::level() {
    return noInlinableSends ? MaxRecompilationLevels - 1  :  nextLevel;
  }
  
  fint SICompiler::estimatedSize() {
    // estimated target nmethod size (bytes)
    return BasicNode::cumulCost;
  }

  void SICompiler::initialize() {
    assert(theSIC == NULL, "shouldn't have but one compiler at a time");
    theSIC = lastSIC = this;
    theAssembler = new Assembler(SICInstructionsSize, SICInstructionsSize / 2,
                                 PrintSICCompiledCode, true);
    stackLocCount = argCount = 0;
    countID = 0;
    nodeGen = new NodeGen(L, send_desc, diLink);
    topScope = NULL;
    splitSig = NULL;
    bbIterator = new BBIterator;
    /* theAllocator = */ new SICAllocator();
    if (theRecompilation && theRecompilation->recompileeVScopes) {
      vscopes = theRecompilation->recompileeVScopes;
    } else {
      vscopes = NULL; 
    }
    if (baseLookupType(L->lookupType()) == NormalBaseLookupType) {
      // ignore the receiver static bit (same nmethod covers both cases)
      L->clearReceiverStatic();
    }

    dispatchToCode();
    

    SScope::currentScopeID = 0;
    ncodes = 0;
    rec = new ScopeDescRecorder(SICScopesSize, SICPCsSize);

    initTopScope();
    initLimits();

    initializeForPlatform();
  }

  void SICompiler::initLimits() {
    fint level;
    if (currentProcess->isUncommon()) {
      // when recompiling because of an uncommon trap, reset level
      level = nextLevel = 0;
    } else {
      level = AbstractCompiler::level();
      nextLevel = MaxRecompilationLevels - 1;
      if (nstages > 1 && recompilee == NULL) {
        // always use a counter in first version
        nextLevel = nstages - 1;
      }
    }
    noInlinableSends = true;

    inlineLimit[NormalFnLimit]         = getLimit(limits[NormalFnLimit],
                                                  level);
    inlineLimit[BlockFnLimit]          = getLimit(limits[BlockFnLimit],
                                                  level);
    inlineLimit[BlockArgFnLimit]       = getLimit(limits[BlockArgFnLimit],
                                                  level);
    inlineLimit[NormalFnInstrLimit]    = getLimit(limits[NormalFnInstrLimit],
                                                  level);
    inlineLimit[BlockFnInstrLimit]     = getLimit(limits[BlockFnInstrLimit],
                                                  level);
    inlineLimit[BlockArgFnInstrLimit]  = getLimit(limits[BlockArgFnInstrLimit],
                                                  level);
    inlineLimit[SplitCostLimit]        = getLimit(limits[SplitCostLimit],
                                                  level);
    inlineLimit[NmInstrLimit]          = getLimit(limits[NmInstrLimit],
                                                  level);
    if (SICAdjustLimits) {
      // adjust NmInstrLimit if top-level method is large
      fint cost = sicCost( method(), topScope, costP);
      if (cost > NormalMethodLen) {
        float l = (float)cost / NormalMethodLen * inlineLimit[NmInstrLimit];
        inlineLimit[NmInstrLimit] = min(int(l), SICInstructionsSize / 3);
      }
    }
  }

  void SICompiler::allocateArgs(fint nargs, bool isPrimCall) {
    Unused(isPrimCall);
    argCount = max(argCount, nargs);
  }

  void SICompiler::registerUninlinable(SendInfo* info, InlineLimitType t,
                                       fint cost) {
    // All sends that aren't inlined for some reason are registered here
    // to determine the minimum optimization level needed for recompilation
    // (i.e. if the send wouldn't be inlined even at the highest optimization
    // level there's no point in recompiling).
    // At the end of compilation, nextLevel will contain the lowest
    // optimization level that will generate better code than the current
    // level.
    // Also decides if this send should trigger a recompilation, and if so,
    // sets the count type of info to comparing.

    if (cost > 0) {
      info->uninlinable = true;

      while(    nextLevel > 0
            &&  getLimit(limits[t], nextLevel - 1) >= cost)
        --nextLevel;
    }
    else {
      // cost == 0 means unknown receiver 
      nextLevel = min(nextLevel, min(recompileLevel() + 2, nstages));
    }

    if ( nextLevel < nstages - 1
    &&   info->countType == NonCounting
    // The next line needs is here for performance: to quote Urs:
    // "for an doIt nmethod called by the VM it
    //  doesn't make sense to have counting sends because it can't be replaced
    //  on the stack (I think) and it won't be called again so the
    //  optimization effort would be wasted.  At least that's what I *think*
    //  the test was there for."
    &&   topScope->selector() != VMString[DO_IT]
    &&   getLimit( limits[t], MaxRecompilationLevels - 1) >= cost )
      info->countType = Comparing;

  }
  
  nmethod* SICompiler::compile() {
    EventMarker em("SIC-compiling %#lx %#lx", L->selector(), NULL);
    ShowCompileInMonitor sc(L->selector(), "SIC", recompilee != NULL);

    // cannot recompile uncommon branches in DI nmethods & top nmethod yet 
    FlagSetting fs2(SICDeferUncommonBranches,
                    SICDeferUncommonBranches &&
                    diLink == NULL && L->adeps->length() == 0 &&
                    L->selector() != VMString[DO_IT]);
    // don't use uncommon traps when recompiling because of trap
    useUncommonTraps = 
      SICDeferUncommonBranches && !currentProcess->isUncommon();
    
    // don't inline into doIt
    FlagSetting fs3(Inline, Inline && L->selector() != VMString[DO_IT]);

    # if TARGET_ARCH != I386_ARCH // no FastMapTest possible on I386
      // don't use fast map loads if this nmethod trapped a lot
      FlagSetting fs4(FastMapTest, FastMapTest &&
                      (recompilee == NULL ||
                      recompilee->flags.trapCount < MapLoadTrapLimit));
    # endif

    FlagSetting fs5(PrintCompilation, PrintCompilation || PrintSICCompilation);
    timer t;
    
    FlagSetting fs6(verifyOften, SICDebug || CheckAssertions);
    
    if(PrintCompilation || PrintLongCompilation ||
       PrintCompilationStatistics || VMSICLongProfiling) {
      t.start();
    }
    if (PrintCompilation || PrintSICCode) {
      lprintf("*SIC-%s%scompiling %s%s: (SICCompilationCount=%d)",
              currentProcess->isUncommon() ? "uncommon-" : "",
              recompilee ? "re" : "",
              sprintName( (methodMap*) method()->map(), L->selector()),
              sprintValueMethod( L->receiver ),
              (void*)SICCompilationCount);
    }

    topScope->genCode();
    
    buildBBs();
    if (verifyOften) bbIterator->verify(false); 
    
    bbIterator->eliminateUnreachableNodes(); // needed for removeUptoMerge to work

    // compute exposed blocks and up-level accessed vars
    bbIterator->computeExposedBlocks();
    bbIterator->computeUplevelAccesses();

    // make defs & uses and insert flush nodes for uplevel-accessed vars
    bbIterator->makeUses();

    // added verify here cause want to catch unreachable merge preds 
    // before elimination -- dmu
    if (verifyOften) bbIterator->verify(); 

    if (SICLocalCopyPropagate) {
      bbIterator->localCopyPropagate();
      if (verifyOften) bbIterator->verify(); 
    }
    if (SICGlobalCopyPropagate) {
      bbIterator->globalCopyPropagate();
      if (verifyOften) bbIterator->verify(); 
    }
    if (SICEliminateUnneededNodes) {
      bbIterator->eliminateUnneededResults();
      if (verifyOften) bbIterator->verify(); 
    }

    // do after CP to explot common type test source regs
    if (SICOptimizeTypeTests) {
      bbIterator->computeDominators();
      bbIterator->optimizeTypeTests();
      if (verifyOften) bbIterator->verify(); 
    }

    // allocate the temp (i.e. volatile) registers
    bbIterator->allocateTempRegisters();
    // allocate the callee-saved (i.e. non-volatile) registers
    SICAllocator* a = theAllocator;
    a->allocate(bbIterator->globals, topScope->incoming);
    stackLocCount = a->stackTemps;

    // make sure frame size is aligned properly
    int32 frame_size_so_far = frameSize();
    stackLocCount += roundTo(frame_size_so_far, frame_word_alignment) - frame_size_so_far;

    // compute the register masks for inline caches
    bbIterator->computeMasks(stackLocCount, nonRegisterArgCount());
    topScope->computeMasks(regStringToMask(topScope->incoming),
                           stackLocCount, nonRegisterArgCount());

    if (PrintSICCode) {
      print_code(false);
      lprintf("\n\n");
    }

    topScope->describe();    // must come before gen to set scopeInfo   
    genHelper = new SICGenHelper;
    bbIterator->gen();
    assert(theAssembler->verifyLabels(), "undefined labels");

    rec->generate();
    topScope->fixupBlocks();        // must be after rec->gen to know offsets
    if (vscopes) computeMarkers();  // ditto

    nmethod* nm = new_nmethod(this, false);

    if (theAssembler->lastBackpatch >= theAssembler->instsEnd)
      fatal("dangling branch");
    
    em.event.args[1] = nm;
    fint ms = IntervalTimer::dont_use_any_timer ? 0 : t.millisecs();
    if (PrintCompilation || PrintLongCompilation) {
      if (!PrintCompilation && PrintLongCompilation && ms >= MaxCompilePause) {
        lprintf("*SIC-%s%scompiling ",
               currentProcess->isUncommon() ? "uncommon-" : "",
               recompilee ? "re" : "");
        methodMap* mm = method() ? (methodMap*) method()->map() : NULL;
        printName(mm, L->selector());
        lprintf(": %#lx (%ld ms; level %ld)\n", nm, (void*)ms, (void*)nm->level());
      } else if (PrintCompilation) {
        lprintf(": %#lx (%ld ms; level %ld v%d)\n", (void*)nm, (void*)ms,
                (void*)nm->level(), (void*)nm->version());
      }
    }
    if (SICDebug && estimatedSize() > inlineLimit[NmInstrLimit]) {
      float rat = (float)estimatedSize() / (float)nm->instsLen();
      lprintf("*est. size = %ld, true size = %ld, ratio = %4.2f\n",
              (void*)estimatedSize(), (void*)nm->instsLen(),
              *(void**)&rat);
    }
    if (PrintCompilationStatistics) {
      static fint counter = 0;
      lprintf("\n*SIC-time= |%ld| ms; to/co/sc/lo/de= |%ld|%ld|%ld|%ld|%ld| %ld|%ld|%ld| %ld |", 
             (void*)ms, 
             (void*) (nm->instsLen() + nm->scopes->length() +
                      nm->locsLen() + nm->depsLen),
             (void*)nm->instsLen(), 
             (void*)nm->scopes->length(),
             (void*)nm->locsLen(), 
             (void*)nm->depsLen,
             (void*)BasicNode::currentID,
             (void*)bbIterator->bbCount,
             (void*)ncodes,
             (void*)counter++);
    }
#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        //      nm->verify();
      }
#   endif
    return nm;
  }

  void SICompiler::buildBBs() {
    bbIterator->build(nodeGen->start);
  }
  
  void SICompiler::computeMarkers() {
    // weed out bogus marker nodes and determine which of the remaining markers
    // is the restart point
    fint len = theRecompilation->markers->length();
    fint *count= NEW_RESOURCE_ARRAY(fint, len); // how many markers at level i?
    MarkerNode **node= NEW_RESOURCE_ARRAY(MarkerNode*, len);    
    fint i;
    for (i = 0; i < len; i++) count[i] = 0;

    // check all markers
    for (i = len - 1; i >= 0; i--) {
      MarkerNode* n = theRecompilation->markers->nth(i);
      assert(0 <= n->scope()->depth && n->scope()->depth < len,
               "invalid depth");
      n->check();
      if (n->invalid) {
        // not really a marker - types don't match
      } else {
        fint depth = n->scope()->depth;
        count[depth]++;
        node[depth] = n;
      }
    }

    // find deepest marker path
    // NB: path can have "holes" (invalid markers followed by valid ones);
    // however, all markers after first invalid one must be ignored (they
    // are locally ok but one of their callers isn't, so globally they're
    // invalid as well)
    for (i = 0; i < len && count[i]; i++) ;
    fint deepest = i - 1;

    if (deepest < 0) {
      // no restart point
    } else if (count[deepest] > 1) {
      // no unique restart point - is this an error?
      if (PrintRecompilation) warning("SIC: cannot find unique restart point");
      theRecompilation->isReplacementSimple = false;
    } else {
      assert(count[deepest] == 1, "expected one");
      assert(node[deepest]->scope()->depth == deepest, "wrong node");
      node[deepest]->active = true;
      theRecompilation->activeMarker = node[deepest];
      theRecompilation->activeMarker->describe();
    }
  }
  
  void SICompiler::initTopScope() {
    recompileeScope =
      recompilee ? (RScope*)constructRScopes(recompilee) 
                 : (RScope*)new RNullScope(NULL);
    if (PrintPICScopes) recompileeScope->printTree(0, 0);

    nodeGen->haveStackFrame = true;
    MethodKind kind = method()->kind();
    countID = Memory->code->nextNMethodID();
    SCodeScope* s;
    SScope* parentScope = NULL;
    
    if (L->receiverMap()->is_block()) {
      blockOop block = (blockOop) L->receiver;
      assert_block(block, "expecting a block literal");
      // caution: parentFrame could be on conversion stack, so use
      // sending frame as a starting point
      // I think this hint is bogus--dmu (see NIC)
      frame* sender =
        L->sendingVFrame
          ? L->sendingVFrame->fr
          : currentProcess->last_self_frame(false);
      parentVFrame = block->parentVFrame(sender, true)->as_compiled();
      if (parentVFrame) parentScope = new_SVFrameScope(parentVFrame);
    }

    MethodLookupKey* k= new_MethodLookupKey(L->key);
    SendInfo* info = new SendInfo(k);
    
    switch (kind) {
     case OuterMethodType:
      s = new SMethodScope(method(), methodHolder_or_map(),
                           NULL, recompileeScope, info);
      break;
     case BlockMethodType:
      // taken from NIC by dmu 7/1
      assert(L->receiverMap()->is_block(), "was expecting block");
      if (parentScope) {
        s = new SBlockScope(method(), parentScope, 
                            NULL, recompileeScope, info);
      } else {
        s = new SDeadBlockScope(method(), info);
      }
      break;
     default:
      fatal("unexpected byte code kind");
    }
    
    needRegWindowFlushes = false;
    topScope = s;
    s->vscope = vscopes ? vscopes->top() : NULL;
  }
  
  void SICompiler::print() {
    print_short(); lprintf(":");
    L->print();
    if (L->result()) {
      L->result()->print();
      if (method()) {
        lprintf("\tmethod: ");
        method()->print_real_oop();
        lprintf("\n");
      }
    } else {
      lprintf("\tmethod: ");
      method()->print_real_oop();
      lprintf("; methodHolder: ");
      methodHolder_or_map()->print_real_oop();
      lprintf("\n");
    }
    lprintf("\treceiver: ");
    L->receiver->print_real_oop();
    lprintf("\tnodeGen: %#lx\n", nodeGen);
    lprintf("\tp ((SICompiler*)%#lx)->print_code()\n", this);
  }

  void SICompiler::print_short() { lprintf("SIC %#lx", this); }

  void SICompiler::print_code(bool suppressTrivial)  {
    if (theSIC == NULL) {
      last_bbIterator->print_code(suppressTrivial);
      last_bbIterator->print();
    } else {
      bool hadBBs = bbIterator != NULL;
      if (! hadBBs) {
        // need BBs for printing
        bbIterator = new BBIterator;
        buildBBs();
      }
      bbIterator->print_code(suppressTrivial);
      bbIterator->print();
      if (!hadBBs) {
        bbIterator->clear();
        bbIterator = NULL;
      }
    }
  }

  void SICompiler::print_vcg_code(bool suppressTrivial)  {
    char fn[256];
    sprintf(fn, "/tmp/sic.vcg.%lx", (unsigned long)this);
    FILE* f = fopen(fn, "w");
    fprintf(f, "graph: {\n");
    fprintf(f, "xmax: 800 ymax: 800  xspace: 10 yspace: 10");
    if (theSIC == NULL) {
      last_bbIterator->print_vcg_code(f, suppressTrivial);
    } else {
      bool hadBBs = bbIterator != NULL;
      if (! hadBBs) {
        // need BBs for printing
        bbIterator = new BBIterator;
        buildBBs();
      }
      bbIterator->print_vcg_code(f, suppressTrivial);
      if (!hadBBs) {
        bbIterator->clear();
        bbIterator = NULL;
      }
    }
    fprintf(f, "}\n");
    fclose(f);
  }

  
  int32 SICompiler::incoming_arg_count() {
    return topScope->nargs;
  }


# else
  void sic_init() {}

# endif

