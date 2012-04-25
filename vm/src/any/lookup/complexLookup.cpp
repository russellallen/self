/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "complexLookup.hh"
# include "_complexLookup.cpp.incl"


vframeLookup::vframeLookup( LookupType l,
                            oop rcvr,
                            oop sel,
                            oop dgt,
                            oop smhOrMap,
                            abstract_vframe* f,
                            dependencyList* dps,
                            assignableDependencyList *adps )
 : simpleLookup( l, rcvr, sel, dgt, smhOrMap, dps, adps ) {

  sendingVFrame= f;

  if (f == NULL) return;

  if (!isResendLookupType(lookupType())) {
    key.set_methodHolder_or_map( MH_NOT_A_RESEND);
    return;
  }
  oop vfmh= sendingVFrame->methodHolder_or_map();
  if (!vfmh->is_map()) {
    key.set_methodHolder_or_map( vfmh);
    return;
  }
  // method holder is the same as self; replace it now
  if (smhOrMap == MH_TBD) {
    // don't have run-time smh, so compute it (e.g. for conversions)
    key.set_methodHolder_or_map( sendingVFrame->methodHolder_object() );
    return;
  }
  // just use smh
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      oop smh2 = sendingVFrame->methodHolder_object();
      assert(smhOrMap == smh2,
             "runtime sending method holder should be correct");
      /* this is not always true with programming
         mapOop map2 = smh2->map()->enclosing_mapOop();
         assert(vfmh == map2, "should be the same map");
      */
    }
# endif
}


lookupTarget* vframeLookup::directed_resend_lookup_target() {
  assert_methodHolder_is_object();
  return simpleLookup::directed_resend_lookup_target();
}


lookupTarget* vframeLookup::implicit_self_lookup_target() {
  return new vframeLookupTarget(sendingVFrame, receiver);
}



# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

compilingLookup::compilingLookup(oop rcvr,
                                 oop sel,
                                 oop dgt,
                                 oop smhOrMap,
                                 abstract_vframe* f,
                                 sendDesc *s,
                                 DIDesc *d,
                                 bool debug,
                                 bool c)
  : vframeLookup( s->lookupType(), rcvr, sel, dgt, smhOrMap, f,
                  new           dependencyList,
                  new assignableDependencyList) {
  sd= s;
  dc= d;
  needDebug= debug;
  canReuseNM= c && ReuseNICMethods; }



// Compile an nmethod
nmethod* compilingLookup::lookupNMethod() {
  if (result() == NULL)                                       
    perform_full_lookup();

# if GENERATE_DEBUGGING_AIDS
    if ( dc != NULL  &&  status == foundOne )
      assert_methodHolder_is_object();
# endif

  chooseCompiler();
  nmethod* nm= compileOrReuse();
  if (Trace) trace(nm);
  return nm;
}


void compilingLookup::chooseCompiler() {
  if (mustUseNIC()) {  compiler = NIC;  return;  }
  if (mustUseSIC()) {  compiler = SIC;  return;  }

  # ifdef SIC_COMPILER
    if (needDebug) {
      compiler= NIC;
      return;
    }
    compiler= status == foundOne ? currentCompiler() : compilers[0];
    if (sd->isOptimized() && allowedToRecompile()) compiler = SIC;
    if (isCriticalMessage(selector()) &&
        nstages > 1 && compilers[1] == SIC) {
      compiler = SIC;             // for better recompilation
    }
    if (currentProcess->isSingleStepping()) compiler = NIC;

    // don't bother using the SIC for access methods - the NIC compiles
    // faster and the code is almost as good (and if speed really counts,
    // the access should be inlined anyway)
    if (compiler == SIC  &&  resultType() != methodResult) {
      compiler = NIC;
    }
  
    // Implement count features for debugging:
    // Increment count if are or would be using SIC
    // Then if min or max are not == -1 (-1 means ignore), and
    //  count is not bounded by min/max, use NIC instead.
    // Note: count is incremented BEFORE a Sic compile
    if (compiler == SIC) {
      ++SICCompilationCount;
      if ((SICMinCompilationCount != -1  &&  SICMinCompilationCount > SICCompilationCount)
      ||  (SICMaxCompilationCount != -1  &&  SICMaxCompilationCount < SICCompilationCount))
        compiler = NIC;
    }
  # endif // SIC_COMPILER
}


nmethod* compilingLookup::compileOrReuse() {
  nmethod *nm= compileNMethod();
  assert(nm->compiler() == compiler, "wrong compiler!");
  return nm;
}


nmethod* compilingLookup::compileNMethod() {
  nmethod* other;
  nmln* diDeps = NULL;
  
  if (dc != NULL) {
    diDeps = dc->dependency();
    assert(diDeps->isEmpty(), "should be empty");
    // make sure that other method won't be flushed from the zone
    other = findNMethod(dc);
    other->save_unlinked_frame_chain();
  }

  nmethod* nm = doCompile(diDeps);

  if (dc != NULL) {
    assert(diDeps->notEmpty(), "should be rebound now");
    other->unlink_saved_frame_chain();
  }
  return nm;
}


nmethod* compilingLookup::doCompile(nmln* diLink) {
  BlockProfilerTicks ex(exclude_compile);
  
  if (compiler == NIC) {
    FCompiler* fc= new FCompiler(this, sd, diLink);
    fc->generateDebugCode= needDebug || currentProcess->isSingleStepping();
    activeCompiler= fc;

#   ifdef SIC_COMPILER
  } else if (compiler == SIC) {
      activeCompiler= new SICompiler(this, sd, diLink);
#   endif

  } else {
    fatal("invalid compiler setting");
  }
  nmethod* nm = activeCompiler->compile();
  activeCompiler->finalize();
  activeCompiler = NULL;
  return nm;
}


bool compilingLookup::isCompilerForced() {
  return CompileWithSICNames->is_objVector();
}

bool compilingLookup::isSelectorInCompileWithSICNames(oop selector) {
  objVectorOop names = (objVectorOop)CompileWithSICNames;
  for (fint i = names->length() - 1; i >= 0; --i) {
    if (selector == names->obj_at(i)) {
      lprintf("\n\n<<< SIC-compiling \"%s\" (Reason: CompileWithSICNames) >>>\n\n",
              stringOop(selector)->copy_null_terminated());
      return true;
    }
  }
  return false;
}


bool compilingLookup::isMethodOrBlockInCompileWithSICNames() {
  if (!CompileWithSICNames->is_objVector())
    return false;

  if (resultType() != methodResult)
    return false;

  oop selector_to_test;
  switch (result()->contents()->kind()) {
  case OuterMethodType:
    // we're compiling a method.  simply, test selector() against selectors in
    // CompileWithSICNames
    selector_to_test = selector();
    break;
  case BlockMethodType: {
    // we're compiling a block.  need to find the method containing the block, and
    // test that method's selector against the ones in CompileWithSICNames
    assert(receiver->is_block(), "expecting a block");
    selector_to_test = blockOop(receiver)->outermostMethodSelector();
    break;
  }
 default:
    ShouldNotReachHere();
  }

  return isSelectorInCompileWithSICNames(selector_to_test);
}


bool compilingLookup::forcedCompilerIsSIC() {
  static bool haveWarned = false;
  if (!haveWarned) {
    warning("Methods/blocks will be compiled NIC-only unless the selector is in "
            "_CompileWithSICNames. (Reason: _CompileWithSICNames is a vector.)");
    haveWarned = true;
  }

  return isMethodOrBlockInCompileWithSICNames();
}


# ifdef SIC_COMPILER
  bool compilingLookup::mustUseSIC() {
    return isCompilerForced()  &&  forcedCompilerIsSIC();
  }

  bool compilingLookup::mustUseNIC() {
    return isCompilerForced()  && !forcedCompilerIsSIC();
  }
# else
  bool compilingLookup::mustUseSIC() { return false; }

  bool compilingLookup::mustUseNIC() { return true; }
# endif


void compilingLookup::trace(nmethod *nm) {
  if (sendingVFrame == NULL)
    return; // nothing I can do, top fram??
  // print out some tracing information
  if (nm->scopes->root()->isDataAssignmentScope()) {
    sendingVFrame->fr->traceAssignment(receiver, nm);
  } else if (nm->scopes->root()->isDataAccessScope()) {
    sendingVFrame->fr->traceLookup(receiver, nm);
  } else {
    sendingVFrame->fr->trace(receiver, nm);
  }
}




cacheProbingLookup::cacheProbingLookup(oop rcvr,
                                       oop sel,
                                       oop dgt,
                                       oop smh_or_map,
                                       abstract_vframe* sendingVf, 
                                       sendDesc *sd,
                                       DIDesc *dc,
                                       bool debug,
                                       bool canReuseNM )
 : compilingLookup( rcvr, sel, dgt, smh_or_map, sendingVf, sd, dc,
                    debug, canReuseNM) { 

  // clear bit; nmethod will be used for other receivers
  if (baseLookupType(lookupType()) == NormalBaseLookupType)
    clearReceiverStatic();
}



// Locate an nmethod, compiling a new one if necessary
nmethod* cacheProbingLookup::lookupNMethod() {
  nmethod* nm= probeCache();
  
  if (nm) {
    if (Trace) trace(nm);
    return nm;
  }
  return compilingLookup::lookupNMethod();
}



// First cut at excluding reuse:

bool cacheProbingLookup::mightBeAbleToReuseNMethod() {

  if ( !canReuseNM )  return false; // user-disabled

  if ( compiler != NIC )  // haven't figured out SIC reuse yet
    return false; 

  // calling convention is different for methods with a static delegatee
  // send desc is one word longer to hold del, so return has different offset

  LookupType l= lookupType();
  if ( needsDelegatee(l)  &&  isDelegateeStatic() )
    return false;

  if ( isPerformLookupType(l) ) return false; // send desc is also different

  // for immediate oops, the prologue is different so cannot reuse
  //  non-imm oop method for immediate, and imms have no descendants

  if ( key.receiverMap()->is_smi()  ||  key.receiverMap()->is_float() )
    return false;

  // accessor methods not reusable cause offset might not match &
  // we don't check it yet
  
  switch ( resultType() ) {
   case dataResult:
   case assignmentResult:
    return false;
   default:
    break;
  }
  // cannot deal with DI, so forget it if have dc (DI desc)
  if (dc != NULL)  return false;

  return true; // TA DA!
}


bool cacheProbingLookup::shouldCompileReusableNMethod( nmethod* nm) {
  // if NIC is inlining data accesses,
  // compile a specialized method so it can exploit
  // inlined accesses

  // does this next combo work? XX miw
  if ( NICInlineDataAccess ) return false;

  if ( key.EQ(canonical_key) ) // key is canonical, reuse is meaningless
    return false;
  
  // ``something do to w.r.t DI'' better safe than sorry
  if ( !adeps->isEmpty() )  return false;
  
  // got one, but it is not reusable, so need a specific one,
  // since general one is not reusable
  if (nm && !nm->reusable()) return false;

  return true;
}


static const nmethod* cannotReuse = NULL;
static const nmethod* compileAndReuse = (nmethod*)-1;


nmethod* cacheProbingLookup::findMethodToReuse() {
  if ( !mightBeAbleToReuseNMethod() )
    return (nmethod*)cannotReuse;

  // build key for canonical method
  
  oop resultMH= result()->methodHolder_or_map(receiver);
  mapOop resultMHmapOop= 
    resultMH->is_map() ? mapOop(resultMH) : resultMH->map()->enclosing_mapOop();
  MethodLookupKey ck( NormalLookupType, MH_NOT_A_RESEND, resultMHmapOop, selector(), 0);
  canonical_key= ck; // copy info 

  nmethod* nm= Memory->code->lookup(canonical_key, needDebug);
  if ( nm &&  nm->reusable() )
    return nm;
  return (nmethod*)
         (shouldCompileReusableNMethod( nm) ? compileAndReuse : cannotReuse);
}


nmethod* cacheProbingLookup::compileOrReuse() {
  nmethod* nm = findMethodToReuse();
    
  if ( nm == cannotReuse ) {
    nm= compilingLookup::compileOrReuse();
    updateCache(nm);
    return nm;
  }
  if ( nm == compileAndReuse ) {
    // compile in context of method holder and reuse

    MethodLookupKey orig(&key);
    
    key= canonical_key;
    nm= compilingLookup::compileOrReuse();
    key= orig;
    
    updateCache(nm);
    updateCache(nm, &canonical_key);
    return nm;
  }
  // reuse nm
  const char *s= sprintName(NULL, selector());
  if (PrintCompilation)
    lprintf("*Reusing NIC method %#lx for selector %s\n", nm, s);
  LOG_EVENT1("Reusing NIC method %#lx", nm);
  nm->addDeps(deps);
  updateCache(nm, &key);    
  return nm;
}


nmethod *cacheProbingLookup::probeCache() {
  if (dc) return NULL; // don't cache DI methods
  nmethod *nm= Memory->code->lookup(key, needDebug);
  if (nm == NULL) return NULL;
  // Only check for perform errors if cache hits, because perform_full_lookup
  // also does same check (since caching is subclass-add-on) -- dmu
  if (perform_error_status(sd->quick_perform_arg_count()) != foundNone)
    return NULL;
  if (nm->needToRecompileFor(sd))
    nm= also_Recompile(sd, this, nm);
  return nm;
}



void cacheProbingLookup::updateCache(nmethod *nm, MethodLookupKey *k) {

  // Enter nm in codeTable at k (use this->key if k==NULL), if sensible.
  // NB static receiver bit already cleared in lookup type (important 'cause
  // cache is receiver-identity-insensitive)
  
  if (   dc == NULL          // don't cache DI methods
      && status == foundOne  // don't cache error methods
      && result()->is_real() // don't cache doIts or conversions
      && result()->as_real()->holder->is_object_or_map() )
    Memory->code->addToCodeTable(nm, k ? k : &key);

}



lookupTarget* baseCompileTimeLookup::receiver_lookup_target() {
  return 
    receiver == badOop
    ? (new mapLookupTarget(receiverMap())) ->be_receiver()
          : simpleLookup::receiver_lookup_target();
}


lookupTarget* baseCompileTimeLookup::delegated_lookup_target() {
  assert_static_delegatee();
  return  simpleLookup::delegated_lookup_target();
}


lookupTarget* baseCompileTimeLookup::undirected_resend_lookup_target() {
  if (!methodHolder_or_map()->is_map()) {
    return simpleLookup::undirected_resend_lookup_target();
  } else {
    // don't know actual value of lookup start location
    assert(methodHolder_or_map() == receiverMapOop(), 
           "expecting receiver and sending method holder to be in same map");
    return
      (new mapLookupTarget(methodHolder_map()))
      -> be_receiver();
  }
}


lookupTarget* baseCompileTimeLookup::directed_resend_lookup_target() {
  assert_static_delegatee();
  return simpleLookup::directed_resend_lookup_target();
}


bool baseCompileTimeLookup::check_slot_for_directed_resend(slotDesc* desc) {
  if (desc->is_map_slot()) return true;
  // cannot inline a delegated send through an assignable parent
  status = foundAssignableParent;
  return false;
}


void baseCompileTimeLookup::perform_lookup() {
  assert_static_selector();
  if (status == resendUndecidable) {
    // couldn't inline a resend because
    // a method holder along the way wasn't constant
    return;
  }
  simpleLookup::perform_lookup();
#if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions  &&  result()) {
    // result()->holder->add_dependency(result()->desc, this);
    Map *m= result()->as_real()->holder->map();
    slotDesc *s= result()->as_real()->desc;
    assert(   !result()->as_real()->holder->is_object_or_map()
           || m->is_block()
           || s->is_parent()
           || !m->can_have_dependents()
           || (  ((slotsMapDeps*)m)->has_slot_dependents()
              && deps->includes(((slotsMapDeps*)m)->dependents_for_slot(s))),
           "result should have a dependency");
  }
#endif
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)


# ifdef SIC_COMPILER

SICLookup::SICLookup( LookupType l, oop rcvr, oop sel, oop dgt,
                      dependencyList* dps, SCodeScope* sc )
  : baseCompileTimeLookup(l, rcvr, sel, dgt, sc->methodHolder_or_map(), dps) {
  scope = sc;
}


lookupTarget* SICLookup::implicit_self_lookup_target() {
  return new sicScopeLookupTarget((SScope*)scope);
}

# endif
  

