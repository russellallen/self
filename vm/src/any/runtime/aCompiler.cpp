/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "aCompiler.hh"
# include "_aCompiler.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

AbstractCompiler* activeCompiler;


// lookup and doIt entry point
AbstractCompiler::AbstractCompiler(compilingLookup* l,
                                   sendDesc* sd,
                                   nmln* d) {
  L = l;
  diLink = d;
  send_desc = sd;
  
  countCompilation(); parentVFrame = 0; initBugHunt();
}


fint AbstractCompiler::level() {
  fint lev = min(recompileLevel() + 1, MaxRecompilationLevels - 1);
  if (!(lev >= 0 && lev < MaxRecompilationLevels)) {
    error1("invalid compiler level %d", lev);       // fix this
    lev = 0;
  }
  return lev;
}


fint AbstractCompiler::version() {
  fint v;
  if (recompilee) {
    fint l = recompilee->version();
    v = min(l + 1, MaxVersions);
  } else {
    v = 0;
  }
  if (parentVFrame && name() == SIC) {
    // since block nmethods are discarded when their home is recompiled,
    // their version number is at least as high as the parent's version
    // but don't do this for NIC nmethods
    v = max(v, parentVFrame->code->version());
  }
  return v;
} 

// for debugging
void AbstractCompiler::initBugHunt() {
  // set to true to debug every method compiled
  debugging = false;
  if (BugHuntNames->is_objVector()) {

    oop name_of_outer_method = L->selector();
    
    // or if this is a block, turn on debugging of the blocks outer method's name is in bug hunt names
    if (L->resultType() == methodResult) {
      // not an access or assignment
      oop meth = method();
      Map* mm = meth->map();
      assert(mm->has_code(), "");
      methodMap* mmm = (methodMap*)mm;
      if (mmm->kind() == BlockMethodType) {
        // is a block method, get method name
        oop r = L->receiver;
        assert(r->is_block(), "");
        blockOop b = blockOop(r);
        name_of_outer_method = b->outermostMethodSelector();
      }
    }
    
    objVectorOop names = (objVectorOop)BugHuntNames;
    for (fint i = names->length() - 1; i >= 0; i--) {
      oop n = names->obj_at(i);
      if (n == name_of_outer_method) {
        // turn on all debugging flags for this compilation
        debugging = true;
      }
    }
  }
  
  if (debugging) {
    LogVMMessages = true;
    PrintVMMessages = true;  // was false, why? -- dmu
    
    lprintf("found a method in BugHuntNames: \n");
    method()->print();
    
    #   ifdef FAST_COMPILER
          PrintCompilation = PrintCompiledCode = true;
    #   endif
    
    #   ifdef SIC_COMPILER
        SICDebug = PrintSICTempRegisterAllocation = PrintSICCode =
          PrintSICCompiledCode = PrintSICCopyPropagation = PrintSICRegAlloc =
          PrintSICRegTargeting = PrintSICMarkers = PrintSICReplacement =
          PrintSICEliminateUnneededNodes = PrintSICExposed = PrintSICTypeTestOpt =
          PrintInlining = 
          PrintSICCompilation = true;
    #   endif
  }
}


void AbstractCompiler::finalize() {
  if (debugging) {
    PrintVMMessages = true;


    #   ifdef FAST_COMPILER
          PrintCompilation = PrintCompiledCode = false;
    #   endif
    
    #   ifdef SIC_COMPILER
        SICDebug = PrintSICTempRegisterAllocation = PrintSICCode =
            PrintSICCompiledCode = PrintSICCopyPropagation = PrintSICRegAlloc =
            PrintSICRegTargeting = PrintSICMarkers = PrintSICReplacement =
            PrintSICEliminateUnneededNodes = PrintSICExposed = PrintSICTypeTestOpt =
            PrintSICCompilation = false;
    #   endif
    flush_logFile();
  }
}

void AbstractCompiler::dispatchToCode() {
  switch (L->resultType()) {
   case     methodResult:      methodCode();  break;
   case   constantResult:    constantCode();  break;
   case       dataResult:        dataCode();  break;
   case assignmentResult:  assignmentCode();  break;
   default: fatal("no more cases");
  }
}

oop AbstractCompiler::method() { return L->result()->contents(); }

oop AbstractCompiler::methodHolder_or_map() {
  return L->result()->generalized_methodHolder_or_map(L->receiver);
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
