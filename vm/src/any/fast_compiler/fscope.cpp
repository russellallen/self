/* Sun-$Revision: 30.16 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "fscope.hh"
# include "_fscope.cpp.incl"

# ifdef FAST_COMPILER


// specializations since BlockLocation is not a pointer

template<> void BlockLocationList::grow() { ShouldNotCallThis(); }


template<> void BlockLocationList::print() {
  print_short();
  lprintf(": length %ld (max %ld) { ", (void*)long(len), (void*)long(max));
  for (fint i = 0; i < length(); i++) {
    BlockLocation bl = nth(i);
    if (bl.memoized) {
      lprintf("[%#lx] ", bl.loc);
    } else {
      lprintf("%#lx ", bl.loc);
    }
  }
  lprintf("}\n");
}


FSelfScope::FSelfScope(bool d, MethodLookupKey *key, oop method) :
  FScope(d) {
  _key    = key;
  _method = method;
  
  method_map = (methodMap *) method->map();
  fint codeLength  = method_map->length_codes();
  fint slotsLength = method_map->length_slots();
  args =   new LocationList(slotsLength);
  locals = new LocationList(slotsLength);
  exprStack = new      LocationList(codeLength);
  blocks =    new BlockLocationList(codeLength);
  nlrPoints = new LabelList(codeLength + 1);
  nlrPoints->append(NULL);
  
  bool got_one;
  method_map->branch_targets(got_one, &branchTargetFlags);
  
  if (got_one) {
    branchTargets = new LabelList(branchTargetFlags->length());
    for ( int32 i = 0,  n = branchTargetFlags->length();  i < n;  ++i)
      branchTargets->nthPut(i, new Label(theCodeGen->a.printing, NULL), true);
  }
  else {
    branchTargets = NULL;
  }
  initializedBlockLocations = NULL;
  
  frequentPreemption = theCompiler->generateDebugCode;
  // If doing consistent stack alloc for branches, must also
  //  be sure to copy fixed values when pushing -- dmu
  allowPrimitivesToAlterExpressionStack =  theCompiler->generateDebugCode;

    
  memoizeAllBlockZaps = theCompiler->generateDebugCode || got_one;
  initBlocksInPrologue = got_one;
  // VM expects to be able to create memoized blocks and put them in 
  //  locations pointed to by debugging info.
  // Since VM gets block locs from expr stack debug info, we
  //  must create all "memoized" blocks. 
  createMemoizedBlocks = theCompiler->generateDebugCode;
  
  branchTargetExprStack = new LocationList(codeLength);
  allocs = new RegisterState(slotsLength + codeLength);
  _scopeID = 0;
  scopeDescs = theCodeGen->scopeDescs;
  foundLoop = false;
  need_epilogue = true;
}


void FSelfScope::initialize() {
  assert( isTop(), "can't inline yet");
  // preallocate receiver, incoming args, locals
  self = receiver = IReceiverReg;
  allocs->allocatePermanent(receiver);
  
  { // Allocate space for arguments and count argument slots. 
    nargs = 0; 
    FOR_EACH_SLOTDESC_N(method()->map(), s, i) {
      args->append(UnAllocated);
      if (s->is_arg_slot()) {
        oop ind= s->data;
        assert_smi(ind, "bad index");
        fint argIndex= smiOop(ind)->value();
        allocs->allocatePermanent(IArgLocation(argIndex));
        args->nthPut(i, IArgLocation(argIndex));
        nargs++;
      }
    }
  }
  // This must come AFTER args so that self register does not overlap
  // arg registers. PPC assumes r3 -> r31, r4 -> r30 etc.
  if (isBlockSelfScope()) {
    // also preallocate self
    self = allocs->pickPermanent();
  }
  { // Allocate space for local slots
    FOR_EACH_SLOTDESC_N(method()->map(), s, i) {
      locals->append(UnAllocated);
      if (s->is_obj_slot()) {
        Location l = allocs->pickPermanentStackTemp();
        locals->nthPut(i, l);
      }
    }
  }
}


void FSelfScope::prologue() {
  theCodeGen->prologue(false, nargs);      // map test etc
  oop m = method();
  FOR_EACH_SLOTDESC_N(m->map(), sd, i) {
    Location l = locals->nth(i);
    if (l != UnAllocated) {
      assert(sd->is_obj_slot(), "must be an assignable slot");
      oop initialContents = m->get_slot(sd);
      theCodeGen->loadOop(l, initialContents);
    }
  }
  postPrologue();
  allocs->initStackTemps = allocs->stackDepth;
  theCodeGen->postPrologue(allocs, frequentPreemption);
  
  if (initBlocksInPrologue) {
    // reserve locations for blocks now and init to zero
    int32 n = method_map->length_literals();
    oop* lits = method_map->start_literals();
    initializedBlockLocations = new LocationList(n);
    for ( int32 j = 0;  j < n;  ++j) {
      Location loc;
      if (!lits[j]->is_block_with_code())
        loc = IllegalLocation;
      else {
        loc = allocs->pickPermanent();
        theCodeGen->loadImmediate(loc, 0);
      }
      initializedBlockLocations->nthPut( j, loc, true);
    }
  }
}


void FSelfScope::addExprStack( fint bci, NameNode* nn ) {
  scopeDescs->addExprStack( scopeDescs->root, bci, nn);
}

void FSelfScope::addBlock( fint bci, NameNode* nn ) {
  scopeDescs->addBlock( scopeDescs->root, bci, nn);
}

void  FSelfScope::addPcDesc( fint bci ) {
  scopeDescs->addPcDesc(theAssembler->offset(), scope, bci);
}


fcompiler_code_generator::fcompiler_code_generator(FSelfScope* s)  
 : abstract_interpreter(s->method()) {
  exprStackBCIs.init( 
    mi.map()->expression_stack_bcis( s->frequentPreemption), 
    -1);
  fscope= s;
}


void fcompiler_code_generator::interpret_method() {
  for ( ;    pc < mi.length_codes;  ++pc ) {
    define_branch_target(); // must define first and one past last
    interpret_bytecode();
  }
  define_branch_target();
}


void fcompiler_code_generator::interpret_bytecode() {
  abstract_interpreter::interpret_bytecode();

  assert(fscope->exprStack->isEmpty() 
      || fscope->exprStack->top() != UnAllocated,
   "invalid expr stack");

  write_expr_stack_info();
}


void fcompiler_code_generator::fetch_and_decode_bytecode() {
  abstract_interpreter::fetch_and_decode_bytecode();

  // stop when single-stepping; the code in nmethod::sendDescFor()
  // depends on the algorithm used here

  if ( fscope->frequentPreemption ) {
    if ( bc.op   == INDEX_CODE
    ||   bc.code == BuildCode(NO_OPERAND_CODE, UNDIRECTED_RESEND_CODE)
    ||   bc.op   == DELEGATEE_CODE
    // Stritly speaking, should need the following, but we don't seem to, 
    //   and it's faster this way.
    // Well, there is a mysterious infinite sendDesc finding bug, and I'm trying to fix it with this:
    //   -- dmu 5/02
    ||   (mi.instruction_set == TWENTIETH_CENTURY_PLUS_ARGUMENT_COUNT_INSTRUCTION_SET
          &&  bc.op == ARGUMENT_COUNT_CODE)
	 ) 
	  ; // do not add pc desc for these, even if in debug mode
    else {
      addPcDesc();
      theCodeGen->testStackOverflow(fscope->allocs);
    }
  }
  if (pc == mi.firstBCI()) {
    // make sure we're generating at least one pcDesc
    addPcDesc();
  }
  fscope->need_epilogue = true; // NLR code will reset this so we don't gen wasted code
}


void fcompiler_code_generator::do_SELF_CODE()              { fscope->selfCode();   }
void fcompiler_code_generator::do_POP_CODE()               { 
  Location loc = fscope->exprStack->pop();
  fscope->allocs->deallocate(loc);
}
void fcompiler_code_generator::do_NONLOCAL_RETURN_CODE()   { fscope->returnCode(); }
void fcompiler_code_generator::do_INDEX_CODE()             { }

void fcompiler_code_generator::do_literal_code(oop literal) {
  addPcDesc();

  Location loc;
  if (!literal->is_block_with_code()) {
    loc = fscope->pickStackLoc();
    theCodeGen->loadOop(loc, literal);
  }
  else {
    bool memoized = fscope->testMemoization( &mi.codes[pc], 
                                             &mi.codes[mi.length_codes], 
                                              mi.literals);
    BlockLocation bl;
    fscope->blockLiteral( is.index, blockOop(literal), memoized, bl);

    write_block_info(&bl);
    loc = fscope->pickStackLocAndMove(bl.loc);
  }
  fscope->exprStack->append(loc);
}


void fcompiler_code_generator::do_read_write_local_code( bool isWrite ) {
  if ( fscope->frequentPreemption )
    addPcDesc();
  fscope->genLocalAccess( !isWrite, is.lexical_level, is.index);
}    


void fcompiler_code_generator::do_send_code( bool isSelfImplicit, stringOop sel, fint arg_count ) {
  addPcDesc();
  fscope->genSend(isSelfImplicit, sel, arg_count, is.is_undirected_resend, is.delegatee);
}


void fcompiler_code_generator::do_branch_code( int32 target_PC, oop target_oop) {
  bool isLoop= target_PC <= pc;
  if ( isLoop )  fscope->foundLoop = true;
  if ( target_oop == badOop )
         fscope->unconditionalBranch( target_PC,             isLoop);
  else                         
         fscope->  conditionalBranch( target_PC, target_oop, isLoop);
}


void fcompiler_code_generator::do_BRANCH_INDEXED_CODE() {
  fscope->indexedBranch( get_branch_vector(), pc);
}


void fcompiler_code_generator::define_branch_target() {
  if ( fscope->branchTargetFlags->length() <= pc)
    return;
  if ( !fscope->branchTargetFlags->nth(pc))
    return;
  if (fscope->exprStack->length()) {
    warning2("NIC found non-empty expression stack at branch target "
            "at bytecode %d in method %s; "
            "The debug information will be incorrect.--dmu 9/96",
            pc, stringOop(fscope->selector())->copy_null_terminated());
  }
  // send expr stack out to registers
  fscope->materializeExprStack();
  // merge here
  fscope->branchTargets->nth(pc)->define();
}


void fcompiler_code_generator::write_block_info(BlockLocation* bl) {
  assert_block(bl->block, "should be a block");
  fscope->addBlock( pc,
    !bl->memoized  
      ?  (NameNode*) new LocationName(bl->loc)
      :  (NameNode*) new MemoizedName(bl->loc, bl->block) );
}

void fcompiler_code_generator::addPcDesc() { fscope->addPcDesc(pc); }

void fcompiler_code_generator::write_expr_stack_info() {
  if (pc != exprStackBCIs.current)
    return;

  fscope->addExprStack(  pc,  new LocationName(fscope->exprStack->top()));
  exprStackBCIs.advance();
}


void fcompiler_code_generator::print_short() {
  abstract_interpreter::print_short();
  lprintf("fscope %#lx\n", fscope);
  lprintf("exprStackBCIs: "); exprStackBCIs.print_short();
}
      
  
void FSelfScope::genCode() {
  genDescs();
  startOfScope = new DefinedLabel(theCodeGen->a.printing);

  fcompiler_code_generator cg(this);
  cg.interpret_method();
}


bool FSelfScope::testMemoization(u_char* bytes, u_char* end, oop* literals) {
  // memoize block if it is the failure block of a primitive send
  // (The test below misses some cases, but it's simple.)
  //
  // Notice that no branches can occur when a memoized block is on 
  // the stack. If this were not true, the code would fail
  // because the block could not be materialized.
  
  if (NICDelayPrimFailBlocks && bytes < end-1) {
    fint nextOp = getOp(bytes[1]);
    fint nextIndex = getIndex(bytes[1]);
    if ( (nextOp == SEND_CODE
       || nextOp == IMPLICIT_SEND_CODE
       || nextOp == ARGUMENT_COUNT_CODE)
    &&   literals[nextIndex]->is_string()) {
      char* sel = byteVectorOop(literals[nextIndex])->bytes();  
      Unused(sel); //debugging
      fint  len = byteVectorOop(literals[nextIndex])->length();
      Unused(len); //debugging
      if (stringOop(literals[nextIndex])->is_prim_name() 
      &&  stringOop(literals[nextIndex])->has_IfFail()) {
        // YES!  This block must be a failure block.
        return true;
      }
    }
  }
  return false;
}


// code for block literal (possibly memoizing)
void FSelfScope::blockLiteral(int32 litIndex, blockOop literal, 
                                  bool memoized,  BlockLocation& bl) {
  Location loc = initBlocksInPrologue 
    ? initializedBlockLocations->nth(litIndex)
    : allocs->pickPermanent();
  nlrPoints->append(NULL);

  // need to give the block a new map
  blockOop clone = literal->clone_and_set_desc(as_smiOop(descOffset()));

  assert( !clone->is_mark() && clone->map() != literal->map(), 
          "should have new map");
  bl.loc = loc;
  bl.memoized = memoized || memoizeAllBlockZaps;
  bl.block = clone;
  blocks->append(bl);
  
  // Pls note that memoizeAllBlockZaps only affects zapping;
  // a real block is created as long as memoized argument is false.
  // Otherwise, we would not know how to materialize a block.
  
  if ( !memoized  ||  createMemoizedBlocks)
    theCodeGen->loadBlockOop(loc, clone, allocs);
  else if ( !initBlocksInPrologue) {
    theCodeGen->loadImmediate(loc, 0);
    assert( !allowPrimitivesToAlterExpressionStack,
            "cannot memoize block if its canonical loc is not used"
             " in stack; debug info limitation");
  }
}



void FSelfScope::returnCode() {
  if (isMethodSelfScope()) {
    // normal return -- handled in standard epilogue
  } else {
    if (CatchInterprocessReturns) {
      loadParentScope(Temp1, IllegalLocation);
      for (FScope* s = parent();  s->isLexicalScope();  s = s->parent())
         s->loadParentScope(Temp1, Temp1);

      // check the block first
      PrimDesc* pd = getPrimDescOfFunction(
                fntype(&catch_interprocess_returns), true);
      assert(pd, "could not find it");
      theCodeGen->loadArg(-1, receiver, true);
      theCodeGen->cPrimCall(pd, allocs, false, true, 1);
    }
    // load home scope and other NLR registers
    loadParentScope(Temp1, IllegalLocation);
    for (FScope* s = parent();  s->isLexicalScope();  s = s->parent())
       s->loadParentScope(Temp1, Temp1);

    theCodeGen->prepareNLR(exprStack->pop(), Temp1, homeID());
    // jump to NLRpoint
    handleNLR( theCodeGen->branch() );
    need_epilogue = false;
  }
}


void FSelfScope::epilogue() {
  if (need_epilogue) {
    // zap all blocks
    for ( int32 i = blocks->length() - 1;  i >= 0;  i--) {
      BlockLocation bl = blocks->nth(i);
      theCodeGen->zapBlock(bl.loc, bl.memoized);
    }
    theCodeGen->epilogue( exprStack->length() > 0  ?  exprStack->pop() :  self);
  }
  genNLRPoints();
  theCodeGen->fixupFrame( allocs); // must be last to fixup code in genNLRPoints
}


void FSelfScope::handleNLR(Label* nlr) {
  // make NLR code in inline cache jump to nlrPoint n
  fint n = blocks->length();
  nlrPoints->nthPut(n, nlrPoints->nth(n)->unify(nlr));
}


void FSelfScope::genNLRPoints() {
  // generate NLR code for all inline caches in this method
  
  // If backwards-branching bytecodes are present, must zap all blocks from
  // every point.
  
  theCodeGen->a.Comment("NLR code");
  assert(nlrPoints->length() == blocks->length() + 1, "wrong length");
  if ( foundLoop ) {
    fint n = blocks->length();
    for ( ; n >= 0; n--) {
      Label* l = nlrPoints->pop();
      if (l) l->define();
    }
    n = blocks->length();
    for ( ; n > 0; n--) {  
      BlockLocation bl = blocks->pop();
      theCodeGen->zapBlock(bl.loc, bl.memoized);
    }
  }
  else {
    fint n = blocks->length();
    for ( ; n > 0; n--) {
      Label* l = nlrPoints->pop();
      BlockLocation bl = blocks->pop();
      if (l) l->define();
      theCodeGen->zapBlock(bl.loc, bl.memoized);
    }
    Label* l = nlrPoints->pop();
    if (l) l->define();
  }
  // I had tried the optimization below, but it BREAKS! I don't know why... -- dmu 5/99
  // if (blocks->length() > 0) // don't need this unless I have a block
  theCodeGen->testAndContinueNLR(scopeID());
}


void FSelfScope::genSend(bool isSelfImplicit,
       stringOop sel,
       fint argc,
       bool isUndirectedResend,
       stringOop del) {
  
  // check for perform (and pop selector if so)
  LookupType performLookupType;
  LocationList* argRegs = NULL;
  bool isPerform = checkPerformPrim_and_push_arguments(sel, performLookupType, argRegs);
  
  LookupType lookupType;
  bool isLocal = false;
  if (isPerform) {
    lookupType = performLookupType;
  }
  else if (del != NULL) {
    assert(isSelfImplicit, "directed resend must be to implicit self");
    lookupType = DirectedResendLookupType;
  }
  else if (isUndirectedResend) {
    lookupType = ResendLookupType;
  }
  else if (isSelfImplicit) {
    lookupType = ImplicitSelfLookupType;
    isLocal = !UseLocalAccessBytecodes && genLocalSend(sel, argc);
    if (!isLocal && NICInlineDataAccess) {
      isLocal = genReceiverDataAccess(sel);
      if (isLocal) theCompiler->isImpure= true;
    }
  }
  else {
    lookupType = NormalLookupType;
  }

  if (isLocal) {
    // was an access to a local / argument
    exprStack->append(result);
  } 
  else {
    Location lastArg;    // fail block (for prims)
    if (isPerform) {
      // args already pushed
      lastArg = UnAllocated;
      argc--;          // subtract selector (this argc will go into sendDesc for perform lookup)
      if (needsDelegatee(lookupType)) argc--;  // subtract delegatee
    } 
    else {
      // push args
      argRegs = new LocationList(argc + 1);
      lastArg = exprStack->isEmpty() ? UnAllocated : exprStack->top();
      bool isPrimCall = sel->is_string() && sel->is_prim_name();
      allocs->allocateArgs(argc, isPrimCall); // must do this even if argc is zero for Intel
      for (fint i = 1; i <= argc; i++) {
        Location l = exprStack->pop();
        theCodeGen->loadArg(argc - i, l, isPrimCall);
        argRegs->append(l);
      }
    }
    
    Location rcvr;
    if (isSelfImplicit) {
      rcvr = self;
    }
    else {
      rcvr = exprStack->pop();
      argRegs->append(rcvr);
    }
    
    Label* nlr = NULL;
    nlr = genCall(lookupType, rcvr, lastArg, argc, sel, del);
    // wait til here with deallocation (for scavenging)
    while (argRegs->length() > 0) {
      Location loc = argRegs->pop();
      allocs->deallocate(loc);
    }
    result = pickStackLoc();
    theCodeGen->move(result, ResultReg);
    exprStack->append(result);
    if (nlr) handleNLR(nlr);
  }
}


Location FSelfScope::pickStackLoc() {
  return allocs->pickLocal();
}


Location FSelfScope::pickStackLocAndMove(Location src ) {
  if ( !allowPrimitivesToAlterExpressionStack ) 
    return src; // no need to move to special place
    
  Location r = pickStackLoc();
  theCodeGen->move(r, src);
  return r;
}



FScope* FMethodScope::lookup(stringOop sel, slotDesc*& sd) {
  sd = method()->find_slot(sel);
  return sd ? this : NULL;
}


FScope* FLexicalScope::lookup(stringOop sel, slotDesc*& sd) {
  sd = method()->find_slot(sel);
  return sd ? this : parent()->lookup(sel, sd);
}


FScope* FVFrameMethodScope::lookup(stringOop sel, slotDesc*& sd) {
  sd = _vf->method()->find_slot(sel);
  return sd ? this : NULL;
}

  
FScope* FVFrameLexicalScope::lookup(stringOop sel, slotDesc*& sd) {
  sd = _vf->method()->find_slot(sel);
  return sd ? this : parent()->lookup(sel, sd);
}


void FSelfScope::genLocalAccess( bool isRead,
                                 fint lexicalLevel,
                                 fint index) {
  slotDesc *sd = method_map->getLocalSlot( lexicalLevel, index );
  FScope* s = this;
  for ( fint i = 0;  i < lexicalLevel;  i++)
    s = s->parent();
  bool ok = genLocalSend( isRead ? sd->name : sd->assignment_slot_name(),
        isRead ? 0 : 1,
        sd,
        s);
  assert(ok, "should always be local");
  exprStack->append(result);
}


bool FSelfScope::genLocalSend(stringOop sel, fint argc, slotDesc* sd, FScope* s) {
  if (sd == NULL) {
    s = lookup(sel, sd);
  }
  if (s != NULL) {
    // found a lexically-scoped slot with this name
    // s is the scope containing the slot

    assert(argc == 0 || argc == 1, "wrong number of args");
    NameDesc* nd = NULL;
    if (sd->is_map_slot() ||
        (s->isVFrameScope() &&
        (nd = s->vf()->get_name_desc(sd, true), nd && nd->isValue()))) {
      // load value of constant slot or of an unallocated (constant) data slot
      assert(argc == 0, "must be an access");
      result = pickStackLoc();
      theCodeGen->loadOop(result, nd ? nd->value() : sd->data);
    } else {
      // generate access code
      genLocal(s, this, sd, argc, true, Temp1);
    }
    return true;
  } 
  return false;
}


bool FSelfScope::genReceiverDataAccess(stringOop sel) {
  // Check if sel is a slot in self and:
  //   an object slot                -> load the object value,
  //   an assignment slot            -> make the assignment or
  //   a map slot (but not a method) -> load the map value.
  // Returns true if code was generated code for this send.
  
  slotDesc* sd = selfMapOop()->map_addr()->find_slot(sel);

  if (sd) {
    if (sd->is_obj_slot()) {
      if (sel->is_1arg_keyword()) {
        Location arg = exprStack->pop();
        theCodeGen->assignment(self, sd, arg);    
        allocs->deallocate(arg);
        result = pickStackLocAndMove(self);
        return true;
      } 
      else {
        // load value of a data slot 
        result = pickStackLoc();
        theCodeGen->loadOop(result, self, sd);
        return true;
      }
    } 
    else if (sd->is_map_slot() && !sd->data->is_method_like()) {
      result = pickStackLoc();
      theCodeGen->loadOop(result, sd->data);
      return true;
    }
  }
  return false;
}


void FSelfScope::selfCode() { 
  exprStack->append(pickStackLocAndMove(self)); 
}


void FSelfScope::local(slotDesc* sd, fint argc) { 
  Location l;
  oop m = method();
  if (sd->is_map_slot()) {
    // load constant slot
    assert(argc == 0, "must be an access");
    result = pickStackLoc();
    theCodeGen->loadOop(result, sd->data);
  } else {
    // slot access or assignment
    bool isArg = sd->is_arg_slot();
    if (isArg) {
      l = args->nth(sd - m->map()->slots());
    } else {
      assert(sd->is_obj_slot(), "unexpected slot type");
      l = locals->nth(sd - m->map()->slots());
    }
    if (argc == 0) {
      // access
      if (isArg) {
        // Don't need to actually move it to a register -- the expr stack
        // and args are read-only.  In debug mode, the expr stack elems
        // may be set by programming prims / conversions, so need a separate
        // location. (handed by pickStackLocAndMove)
        result = pickStackLocAndMove(l);
      } else {
        // local could be changed between here and it's use
        result = pickStackLoc();
        theCodeGen->move(result, l);
      }
    } else {
      // assignment
      Location arg = exprStack->pop();
      theCodeGen->move(l, arg);
      allocs->deallocate(arg);
      result = pickStackLocAndMove(self);
    } 
  }
}


// The genLocal calls generate a sequence of instructions to load the
// SP of the frame containing the local.  The last scope then loads
// (or stores) the value.

void FMethodScope::genLocal(FScope* target, FSelfScope* sender,
          slotDesc* sd, fint argc, bool first, Location /*temp_sp_reg*/) {
  Unused(sender); Unused(target);
  assert(target == this, "should have found the slot");
  if (first) {
    // normal local slot access
    FSelfScope::local(sd, argc);
  } else {
    ShouldNotReachHere(); // should be in VFrameMethodScope,
                          // not here (no inlining)
  }
}


void FLexicalScope::genLocal(FScope* target, FSelfScope* sender,
           slotDesc* sd, fint argc, bool first, Location temp_sp_reg) {
  if (target == this) {
    if (first) {
      // normal local slot access
      FSelfScope::local(sd, argc);
    } else {
      ShouldNotReachHere(); // should be in VFrameBlockScope, not here
    }
  } else {
    // load parent scope's SP, then continue
    theAssembler->Comment("lexically-scoped slot access");
    loadParentScope(temp_sp_reg, temp_sp_reg);
    parent()->genLocal(target, sender, sd, argc, false, temp_sp_reg);
  }
}


void FBlockScope::loadParentScope(Location dst_reg, Location /*temp_sp_reg*/) {
  // load first block's parent scope
  theCodeGen->loadBlockParent(receiver, dst_reg);
}


void FVFrameScope::genLocal(FScope* target, FSelfScope* sender,
          slotDesc* sd, fint argc, bool first, Location temp_sp_reg) {
  UsedOnlyInAssert(target); UsedOnlyInAssert(first);
  assert(!first, "just checking");
  assert(target == this, "should have found the slot");
  NameDesc* nd = _vf->get_name_desc(sd);
  assert(!nd->isValue(), "shouldn't call genLocal for constants");
  if (argc == 0) {
    sender->result = sender->pickStackLoc();
    theCodeGen->loadSaved(sender->result, nd->location(), temp_sp_reg,
        _vf);
  } else {
    Location arg = sender->exprStack->pop();
    theCodeGen->storeSaved(nd->location(), temp_sp_reg, _vf, arg);
    sender->allocs->deallocate(arg);
    sender->result = sender->pickStackLocAndMove(sender->self);
  }
}  


void FVFrameLexicalScope::genLocal(FScope* target, FSelfScope* sender,
           slotDesc* sd, fint argc, bool first, Location temp_sp_reg) {
  assert(!first, "just checking");
  if (target == this) {
    FVFrameScope::genLocal(target, sender, sd, argc, first, temp_sp_reg);
  } else {
    if (_vf->fr != parent()->vf()->fr) {
      loadParentScope(temp_sp_reg, temp_sp_reg);
    } else {
      // inlined in parent's frame, don't need to walk up the stack
    }
    parent()->genLocal(target, sender, sd, argc, false, temp_sp_reg);
  } 
}


void FVFrameBlockScope::loadParentScope(Location dst_reg, Location child_sp_reg) {
  if (_vf->fr != _parent->vf()->fr) {
    // load block's parent scope
    NameDesc* nd = _vf->get_block_name();
    theCodeGen->loadSaved(dst_reg, nd->location(), child_sp_reg, _vf);
    theCodeGen->loadBlockParent(dst_reg, dst_reg);
  } 
  else {
    // inlined in parent's frame, don't need to walk up the stack
  }
}


bool FSelfScope::checkPerformPrim_and_push_arguments(
          stringOop selector,
          LookupType& lookupType,
          LocationList*& argRegs) {
  if (!selector->is_string()) return false;
  
  fint len = selector->length();
  char* sel = selector->bytes();
  if (selector->has__Perform__prefix()) {
    return checkPerform_and_push_arguments(sel, len, 9, lookupType, argRegs);
  } 
  else if (selector->has__PerformResend__prefix()) {
    return checkPerform_and_push_arguments(sel, len, 15, lookupType, argRegs);
  }
  return false;
}


void FSelfScope::unconditionalBranch( int32 target_PC, bool isLoop) {
  materializeExprStack();
  Label* dst= branchTargets->nth(target_PC);
  Label* nlr = theCodeGen->unconditionalBranchCode( dst, 
                                                    isLoop && !frequentPreemption, 
                                                    allocs );
  if (nlr) handleNLR(nlr); // not a real NLR; used when checkInterrupt kills process
}


void FSelfScope::conditionalBranch( int32 target_PC, oop target_oop, bool isLoop) {
  Location toTest = exprStack->pop();
  materializeExprStack();
  Label* dst= branchTargets->nth(target_PC);
  Label* nlr = theCodeGen->conditionalBranchCode( toTest, 
                                                  target_oop, 
                                                  dst, 
                                                  isLoop && !frequentPreemption, 
                                                  allocs);
  allocs->deallocate(toTest);
  if (nlr) handleNLR(nlr); // not a real NLR; used when checkInterrupt kills process
}


void FSelfScope::indexedBranch( objVectorOop pcs, int32 pc ) {
  fint n= pcs->length();
  bool isLoop= false;
  LabelList* lbls = new LabelList(n);
  for (fint i = 0;  i < n;  ++i) {
    int32 tpc= smiOop(pcs->obj_at(i)) -> value();
    if ( tpc <= pc ) {
      isLoop = true;
      foundLoop = true;
    }
    lbls->nthPut(i, branchTargets->nth(tpc), true);
  }
  Location toTest = exprStack->pop();
  materializeExprStack();
  Label* nlr = theCodeGen->indexedBranchCode( toTest, 
                                              lbls, 
                                              isLoop && !frequentPreemption, 
                                              allocs);
  allocs->deallocate(toTest);
  if (nlr) handleNLR(nlr); // not a real NLR; used when checkInterrupt kills process
}


// when branching must be sure expr stack is in real locations
// Note: the carefull reader may wonder: what if compiler tries
// to move element that is already into one of the locations
// reserved for branch targets into another location reserved
// for branch target? Could overwrite?
// Well no--because once a value is materialized as stack location
//  n, it cannot later be needed as location m (m < n).
// So cannot overwrite. -- dmu

void FSelfScope::materializeExprStack() {
  for (int32 i = 0,  n = exprStack->length();  i < n;  ++ i) {
    Location dst;
    if (branchTargetExprStack->length() > i) 
      dst = branchTargetExprStack->nth(i);
    else {
      dst = allocs->pickPermanent(); // must be permanent so loc wont be deallocated
      branchTargetExprStack->append( dst );
    }
    Location whereItWas= exprStack->nth(i);
      theCodeGen->move(dst, whereItWas);
    exprStack->nthPut(i, dst);
    allocs->deallocate( whereItWas);
  }
}


bool FSelfScope::checkPerform_and_push_arguments(
            char* sel, fint len, fint prefix,
            LookupType& performLookupType,
            LocationList*& argRegs) {
  // check if this is really a perform primitive; if so, move selector
  // and delegatee to right registers and return perform type
  
  if (strncmp(sel + len - 7, "IfFail:", 7) == 0) {
    len -= 7;
    exprStack->pop();        // discard failure block
  }
    
      fint argc = 0;
  while (strncmp(sel + len - 5, "With:", 5) == 0) {
    argc ++;
    len -= 5;
  }

  fint extraArg = 0;
  if (len == prefix) {
    if (prefix == 9) {
      performLookupType = NormalPerformType;
    } else {
      performLookupType = ResendPerformType;
    }
  } else if (prefix == 9 && len == prefix + 13 
         &&  strncmp(sel + prefix, "DelegatingTo:", 13) == 0) { 
    performLookupType = DelegatedPerformType;
    extraArg = 1;
  } else {
    // not a recognized perform primitive name; don't replace with perform
    return false;
  }

  // push args
  argRegs = new LocationList(argc + extraArg + 2);  // 2 for sel + rcvr
  allocs->allocateArgs(argc + extraArg, false);
  Location l;
  for (fint i = 1; i <= argc; i++) {
    l = exprStack->pop();
    theCodeGen->loadArg(argc - i, l, false);
    argRegs->append(l);
  }
  
  if (extraArg) {
    // push delegatee
    l = exprStack->pop();
    theCodeGen->move(PerformDelegateeLoc, l);
    argRegs->append(l);
  }

  // push selector
  l = exprStack->pop();
  theCodeGen->move(PerformSelectorLoc, l);
  argRegs->append(l);

  return true;
}


Label* FSelfScope::primCall(stringOop selector, bool& canFail, fint arg_count) {
  PrimDesc* pd = getPrimDescOfSelector(selector);
  canFail = pd->canFail();
  if (selector == VMString[_RESTART]) {
    foundLoop = true;
    return theCodeGen->unconditionalBranchCode(startOfScope, true, allocs);
  } else {
    return theCodeGen->cPrimCall(pd, allocs, false, false, arg_count + 1 /* rcvr */);
  }
}


// generate code for a send; receiver hasn't been loaded yet
Label* FSelfScope::genCall(LookupType lookupType,
         Location rcvr, Location lastArg, fint argc, 
         stringOop selector, oop del) {
  // adjust lookupType if method holder isn't known
  Label* l = NULL;
  if (selector->is_prim_name()) {
    // primitive send
    if (!isPerformLookupType(lookupType)) 
      theCodeGen->loadArg(-1, rcvr, true);
    oop failSelector;
    Location failReceiver;
    if ( selector->has_IfFail() ) {
      selector = selector->without_IfFail();
      failSelector = VMString[VALUE_WITH_];
      failReceiver = lastArg;
      if (isPerformLookupType(lookupType)) argc--;    // ignore fail arg
    } else {
      failSelector = VMString[PRIMITIVE_FAILED_ERROR_NAME_];
      failReceiver = rcvr;
    }

    bool canFail;
    if (isPerformLookupType(lookupType)) {
      // perform
      canFail = false;
      l = theCodeGen->perform(allocs, lookupType, rcvr, self,
            argc, del);
    } else {
      l = primCall(selector, canFail, argc);
    }
      // failure handling
    if (canFail) {
        // make sure failure block is created if memoized
        blockOop failBlock = NULL;
        if (!blocks->isEmpty()) {
          BlockLocation bl = blocks->top();
          if (bl.loc == lastArg && bl.memoized) {
            // this memoized block is the failure block
            // (since we don't inline anything, block locations are unique)
            assert_block(bl.block, "should be a block");
            failBlock = bl.block;
          }
        }
        // gen code for failure send
        Label* failNLR =
              theCodeGen->primFailure(failReceiver, self, failSelector, selector,
                                      ResultReg,
                                    failBlock, allocs);
        l = l->unify(failNLR);
      }
  } else {
    // ordinary send
    l = theCodeGen->selfCall(allocs, lookupType, rcvr, self,
                             selector, del, argc);
  }
  return l;
}


FMethodScope::FMethodScope(bool dbg, MethodLookupKey *key, oop method, oop mh_or_map)
  : FSelfScope(dbg, key, method) {
  _methodHolder_or_map = mh_or_map;
  initialize();
}


void FMethodScope::genCode() {
  prologue();
  // self will have been saved in incoming arg location since it is first arg to a method
  // That's why we do nothing special here, unlike for the block below:
  scope = scopeDescs->addMethodScope(_key, _method, new LocationName(self),
             selfMapOop(), methodHolder_or_map());
  FSelfScope::genCode();
  epilogue();
}


void FBlockScope::genCode() {
  prologue();
  if (debugging) breakpoint();
  Location self_in_memory_for_uplevel_access         = theCodeGen->flushToStack(self,     allocs);
  Location block_in_memory_for_lexical_parent_access = theCodeGen->flushToStack(receiver, allocs);
  scope = scopeDescs->addTopLevelBlockScope(_key, _method,
              _key->receiverMapOop(),
              new LocationName( self_in_memory_for_uplevel_access ), new LocationName( self),
              selfMapOop(),
              methodHolder_or_map(), 
              new LocationName( block_in_memory_for_lexical_parent_access ), new LocationName( receiver),
              false, scopeID());
  FSelfScope::genCode();
  epilogue();
}


void FBlockScope::postPrologue() {
  // load self
  if (debugging) breakpoint();
  compiled_vframe* vf = parent()->vf();
  NameDesc* selfName = vf->get_self_name();
  if (selfName->hasLocation()) {
    loadParentScope(Temp1, IllegalLocation);
    theCodeGen->loadSaved(self, selfName->location(), Temp1, vf);
  } else {
    assert(!selfName->value()->is_block(), "must not be a block");
    theCodeGen->loadOop(self, selfName->value());
  }
}


void FDeadBlockScope::postPrologue() {
  // don't load parent scope - not necessary
}


void FSelfScope::descLocals(ScopeInfo scop) {
  fint len = args->length();
  assert(len == method()->map()->length_slots(), "just checkin'");

  FOR_EACH_SLOTDESC_N(method()->map(), s, i) {
    if (s->is_arg_slot()) {
      scopeDescs->addSlot(scop, i, new LocationName(args->nth(i)));
    } else if (!s->is_vm_slot() && s->is_obj_slot()) {
      Location l = locals->nth(i);
      assert(l != UnAllocated, "should have a location");
      scopeDescs->addSlot(scop, i, new LocationName(l));  // local data slot
    }
  }
}


void FMethodScope::genDescs() {
  descLocals(scope);
}


void FBlockScope::genDescs() {
  assert(method()->kind() == BlockMethodType, "just checkin'");
  descLocals(scope);
}


FLexicalScope::FLexicalScope(bool d, MethodLookupKey* key, oop method, FScope* p)
  : FSelfScope(d, key, method) { _parent = p; }

FBlockScope::FBlockScope(bool dbg, MethodLookupKey* key, oop method, FScope* p)
  : FLexicalScope(dbg, key, method, p) {
  initialize();
}         

FVFrameScope::FVFrameScope(bool d, compiled_vframe* f) : FScope(d) { _vf = f; }

FVFrameLexicalScope::FVFrameLexicalScope(bool dbg, compiled_vframe* f)
  : FVFrameScope(dbg, f) {
  compiled_vframe* parent = f->parent()->as_compiled();
  if (parent) {
    _parent = new_FVFrameScope(debugging, parent);
  } else {
    _parent = NULL;
  }
}

oop FVFrameScope::method() { return _vf->desc->method(); }
oop FVFrameScope::methodHolder_or_map() { return _vf->desc->methodHolder_or_map(); }

FDeadBlockScope::FDeadBlockScope(bool dbg, MethodLookupKey* key, oop method)
  : FBlockScope(dbg, key, method, NULL) {}

void FDeadBlockScope::genCode() {
  prologue();    // to create stack frame
  scope = scopeDescs->addDeadBlockScope(_key, _method, 
          new LocationName(receiver),
          false, scopeID());
  genDescs();
  scopeDescs->addPcDesc(theAssembler->offset(), scope, 0);
  theCodeGen->nonLifoTrap(allocs);
  // ignore rest of method - will never execute
  epilogue();
}


FVFrameScope* new_FVFrameScope(bool debugging, compiled_vframe* vf) {
  MethodKind kind = vf->method()->kind();
  switch (kind) {
   case OuterMethodType:
    return new FVFrameMethodScope(debugging, vf);
   case BlockMethodType:
    return new FVFrameBlockScope(debugging, vf);
   default:
    ShouldNotReachHere();
    return NULL;
  }
}
  

void FSelfScope::print() {
  lprintf(" method: %#lx\n\tdel: %#lx  id: %ld",
   method(), delegatee(), scopeID());
  lprintf("  args: "); args->print_short_zero();
  lprintf("\n\tlocals: "); locals->print_short_zero();
  lprintf("  stack: "); exprStack->print_short_zero();
  lprintf("  blocks: "); blocks->print_short_zero();
  lprintf("\n\tnlrPoints: "); nlrPoints->print_short_zero();
  lprintf("\n\branchTargets: "); branchTargets->print_short_zero();
  lprintf("\n\tallocated: "); allocs->print();
  lprintf("\n");
}


void FMethodScope::print_short() {
  lprintf("FMethodScope %#lx (", (unsigned long)this);
  selector()->print_oop();
  lprintf(")"); 
}


void FMethodScope::print() {
  print_short();
  FSelfScope::print();
  lprintf("\tmh: %#lx", methodHolder_or_map()); 
  lprintf("  sender: "); sender()->print_short_zero();
  lprintf("\n");
}


void FLexicalScope::print() {
  print_short();
  FSelfScope::print();
  lprintf("\tparent: "); parent()->print_short_zero();
  lprintf("  sender: "); sender()->print_short_zero();
  lprintf("\n");
}


void FBlockScope::print_short() {
  lprintf("FBlockScope %#lx (%#lx)", (unsigned long)this,
   (unsigned long)method()); 
}


void FDeadBlockScope::print_short() {
  lprintf("FDeadBlockScope %#lx (%#lx)", (unsigned long)this,
   (unsigned long)method()); 
}


void FVFrameScope::print() {
  print_short();
  lprintf("  _vframe_print(%#lx)", _vf);
}


void FVFrameMethodScope::print_short() {
  lprintf("FVFrameMethodScope %#lx (", (unsigned long)this);
  _vf->selector()->print_oop();
  lprintf(")");
}


void FVFrameMethodScope::print() {
  FVFrameScope::print();
  lprintf("\n");
}


void FVFrameLexicalScope::print() {
  FVFrameScope::print();
  lprintf("\n    parent: "); parent()->print_short_zero();
  lprintf("\n");
}


void FVFrameBlockScope::print_short() {
  lprintf("FVFrameBlockScope %#lx (", (unsigned long)this);
  _vf->selector()->print_oop();
  lprintf(" = %#lx)", (unsigned long)method());
}


void FVFrameBlockScope::print() {
  FVFrameLexicalScope::print();
  lprintf("\n");
}

# endif // FAST_COMPILER
