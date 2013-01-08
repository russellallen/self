/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "blockOop.hh"
# pragma implementation "blockOop_inline.hh"

# include "_blockOop.cpp.incl"

frame* blockOopClass::scope(bool orNone) {
  UsedOnlyInAssert(orNone);
  blockOopClass *b= addr();
  frame* f= b->homeFr();
  if (NLRSupport::is_bad_home_reference((char*)f)) {
    // prototype block or non-LIFO block
    f = NULL;
  }
  assert(f || orNone, "blockMap::scope: block is dead");
  return f;
}


void blockOopClass::setScope(frame* newScope) {
  blockOopClass *b= addr();
  frame* f= b->homeFr();
  if (NLRSupport::is_bad_home_reference((char*)f)) {
    // prototype block or non-LIFO block
    if (newScope != NULL)
      ShouldNotReachHere(); // shouldn't try to set scope pointer
  } else {
    assert_smi(newScope, "should be a word-aligned pointer");
    b->setHomeFr(smiOop(newScope));
  }
}



// an optimized version
inline oop blockOopClass::really_clone_block(smiOop fp) {
  assert_block(this, "not a block");
  assert_smi(fp, "not a smallInt or pointer");
  NumberOfBlockClones++;
  const int32 size = sizeof(blockOopClass)/oopSize;

  // would be cleaner (but slightly slower in the fast case) to do
  //  b= Memory->alloc_objs(size);
  //  if (Memory->new_gen->eden_space->contains(b)) ...

  blockOopClass* b=
    (blockOopClass*) Memory->new_gen->eden_space->alloc_objs_local(size);
  if (b) {
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions  &&  b == (blockOopClass*)catchThisOne) {
      warning1("blockOopClass::really_clone_block caught 0x%lx", b);
    }
#   endif
    // allocated in eden; don't do check stores or scavenging
    b->_map = addr()->_map;
    b->setHomeFr(fp);
    blockOop b1 = as_blockOop(b);
    b1->init_mark();
    return b1;
  } else {
    // overflowed eden; do check stores when done
    b = (blockOopClass*) Memory->alloc_objs(size);
    Memory->store((oop*) &b->_map, addr()->_map);
    b->setHomeFr(fp);
    blockOop b1 = as_blockOop(b);
    b1->init_mark();
    return b1;
  }
}

oop blockOopClass::clone_block(smiOop fp) { return really_clone_block(fp); }

oop blockOopClass::clone_block_for_interpreter(frame* f) {
  return clone_block(smiOop(f));
}


// internal primitive to clone block literal and set scope

oop clone_block_prim(oop rcvr, smiOop fp) {
  return blockOop(rcvr)->clone_block(fp);
}


  
frame* blockOopClass::parentFrame(frame* currentFrame, bool orNone) {
  // currentFrame, if non-NULL, is a hint (where to start searching for
  // the full frame for this block)
  frame* sc = scope(orNone);
  if (sc == NULL) return NULL;
  if (currentFrame) {
    // the hint may be wrong (rarely) if the two frames are on different
    // stacks)
    Stack* stk = processes->stackFor(currentFrame);
    if (!stk->contains(sc)) currentFrame = NULL;
  }
  frame* pf = sc->home_frame_of_block_scope(currentFrame);
  assert(pf->block_scope_of_home_frame() == sc, "wrong frame");
  assert(desc()->value() != IllegalDescOffset, "parent vframe not visible");
  # if GENERATE_DEBUGGING_AIDS
    if ( !CheckAssertions )
      ;
    else if ( pf->is_interpreted_self_frame() )
      assert( desc() == BLOCK_PROTO_DESC, "interpreted blocks have original desc" );
    else
      assert( desc() != BLOCK_PROTO_DESC, "compiled blocks do not have original desc" );
  # endif

  return pf;
}


abstract_vframe* blockOopClass::parentVFrame(frame* currentFrame, bool orNone) {
  frame* pf= parentFrame(currentFrame, orNone);
  return pf == NULL  ?  NULL  :  new_vframe(pf, desc());
}

stringOop blockOopClass::outermostMethodSelector() {
  oop selector = NULL;
  for ( abstract_vframe* pp = parentVFrame(NULL, true); 
                         pp != NULL;
                         pp = pp->parent())
    selector = pp->selector();
    
  if (selector == NULL) { // block was zapped  
    /* should really get name from lexical linkes
       here's a start:
        slotsOop v = value();
        if (v->map()->has_code()) {
          slotsOop ll = v->map()->get_lexical_link();
          ....
    */
    selector = new_string("zappedBlock");
  }

  assert_string(selector, "should be a selector");
  return stringOop(selector);
}


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)


void blockOopClass::remap(nmethod* nm, frame* fr) {
  // the receiver's enclosing nmethod has been recompiled; update the
  // map and scope pointer
  // frame* home = scope();   // caller ensures liveness
  // Map* oldMap = map();
  Map* newMap = nm->blockMapFor(this);
  // assert(oldMap != newMap, "maps should be different");
  // can be equal for receiver block, or could have been remapped in
  // one of the sending vframes
  if (!newMap) ShouldNotReachHere(); // should have found new block map
  remap(newMap, fr);
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

void blockOopClass::remap(Map* newMap, frame* newHome) {
  LOG_EVENT3("remapping block %#lx from %#lx/%#lx...",
             this, map(), scope(true));
  LOG_EVENT2("...to %#lx/%#lx", newMap, newHome);
  set_map(newMap);
  setScope(newHome->block_scope_of_home_frame());
  // debugging aid: set block's hash (almost all blocks have an uninitialized
  // hash value, so if a block has a hash it's likely to be a remapped block)
  identity_hash();
}


blockOop blockOopClass::clone_and_set_desc(smiOop descOffset) {
  assert_smi(descOffset, "must be an int");
  blockMap *newMap= ((blockMap*)map())->clone_and_set_desc(descOffset);
  blockOop newBlock= copy();
  newBlock->set_map(newMap);
  return newBlock;
}


#if defined(FAST_COMPILER) || defined(SIC_COMPILER)

# if  GENERATE_DEBUGGING_AIDS
static mapOop map_to_find;
static void findBlkFn(nmethod* nm) {
  nmethodScopes* s = nm->scopes;
  for (oop* p = s->oops(), *end = p + s->oops_size(); p < end; p++) {
    if (*p == map_to_find || (*p)->map()->enclosing_mapOop() == map_to_find) {
      lprintf("nmethod* %#lx\n", nm);
      return;
    }
  }
}

void findNMethodsFor(oop b) {
  // for debugging
  if (!b->is_block()) {
    lprintf("(warning: not a block)\n");
  }
  map_to_find = b->map()->enclosing_mapOop();
  Memory->code->nmethods_do(findBlkFn);
}
#endif

#endif

oop catch_interprocess_returns(oop blk) {
  // for debugging: catch nlrs to blocks in other processes
  // (if CatchInterprocessReturns is on)
  // lprintf("blk 0x%x,  scope 0x%x,  scopeID 0x%x\n",
  //         blk, scope, scopeID);
  if (!blk->is_block())
    return blk;
  blockOop b = blockOop(blk);
  if (!b->is_live())
    return b;
  frame* myScope = b->scope(true);
  if (myScope == NULL)
    return b;
  if (!currentProcess->contains(myScope)) {
    b->kill();
  }
  return b;
}
