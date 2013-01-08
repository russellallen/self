/* Sun-$Revision: 30.14 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "cacheStub_abstract.hh"
# pragma implementation "cacheStub.hh"
# pragma implementation "cacheStub_inline_abstract.hh"
# pragma implementation "cacheStub_inline.hh"
# include "_cacheStub.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

# define CHECK_PIC(var1, var2)                                                \
    if (! var1->isCacheStub()) continue;                                      \
    CacheStub* var2 = (CacheStub*)var1;

VtblPtr_t   CacheStub::_vtbl_value;
Assembler*  CacheStub::a;
Assembler*  CacheStub::oldAssembler;
nmethod**   CacheStub::n;
CountStub** CacheStub::st;
fint CacheStub::newMethods;
sendDesc* CacheStub::theSendDesc;
nmethod *CacheStub::nsmi;
nmethod *CacheStub::nfloat;
CountStub *CacheStub::stsmi;
CountStub *CacheStub::stfloat;

const fint MaxStubSize = 32000; // generous to allow experiments with PICs

inline NCodeBase* CacheStub::get_thing(fint which) {
  return findThing(getJumpAddr(which));
}

mapOop CacheStub::get_map(fint which) {
  fint imm= immediateCount();
  if (which < imm) {
    switch (which) {
    case 0: return (hasSmi() ? Memory->smi_map : Memory->float_map)->enclosing_mapOop();
    case 1: return Memory->float_map->enclosing_mapOop();
    default: ShouldNotReachHere(); return NULL;
    }
  } else
    return mapOop(locs()[getMapLocsIndex(which)].referent(this)); 
}

nmethod* CacheStub::get_method(fint which) {
  NCodeBase* s = get_thing(which);
  if (s->isNMethod()) {
    return (nmethod*)s;
  } else {
    assert(s->isCountStub(), "what is it?");
    return ((CountStub*)s)->target();
  }
}

int32 CacheStub::getJumpLocsIndex(int32 which) {
  // Find index of addrDesc corresponding to nth jump.
  // (Very dependent on form of generated code, of course, but it happens
  // that both PPC and Sparc have the same version.  Other architectures
  // can implement this function on their own, if need be.)
  int32 immed, index;
  immed = immediateCount();
  if (which < immed) {
    index = which;    // immediate cases have one addrDesc for the jump
  } else {
    // map cases have two addrDesc's - one for the map load and one for
    // the jump.  we add "1" below because we want the second addrDesc
    // in the pair (the jump).  we subtract immed because the first
    // immed cases have just 1 addrDesc and the 2 * which assumes 2.
    index = 2 * which + 1 - immed;
  }
  return index;
}

int32 CacheStub::getMapLocsIndex(int32 which) {
  // Find index of addrDesc corresponding to nth map constant.
  // (Very dependent on form of generated code, of course, but it happens
  // that both PPC and Sparc have the same version.  Other architectures
  // can implement this function on their own, if need be.)
  // The map addrDesc comes before the corresponding jump addrDesc.
  return getJumpLocsIndex(which) - 1;
}

fint CacheStub::nOccurrences(nmethod *nm) {
  fint nocc= 0;
  for (fint i= 0; i < arity(); i++) {
    if (get_method(i) == nm) nocc++;
  }
  return nocc;
}

CountStub* CacheStub::countStub(fint which) {
  NCodeBase* s = get_thing(which);
  if (s->isNMethod()) {
    return NULL;
  } else {
    assert(s->isCountStub(), "what is it?");
    return (CountStub*)s;
  }
}
    
inline fint realLocsLen(fint arity, bool has_smi,
                        bool has_float) {
# define FailLoc  1     /* call of runtimeLookup has a location */
  fint n =  2 * arity + FailLoc - (has_smi ? 1 : 0) - (has_float ? 1 : 0);
  return n * sizeof(addrDesc);
}

void* CacheStub::operator new(size_t size) {
  fint newSize = size + a->len() + newMethods * sizeof(nmln);
  return Memory->code->stubs->allocate(newSize);
}

// NB: deallocation is not done via destructor/delete because g++ (2.2.2)
// changes the vtable pointer before calling the destructor of the superclass
// i.e. it would not be possible to call Heap::deallocate in the destructor
// because the vtbl pointer change would write into a deallocated block of
// memory.  Furthermore, it's inconvenient to deallocate in delete because
// we need an additional argument (the size).

CacheStub::CacheStub() {
  assert(sizeof(cacheStubInfo) == 4, "check that bit fields work right");
  CHECK_VTBL_VALUE;
  cacheLink.init();
  info.arity= newMethods;
  info.has_smi= nsmi != NULL;
  info.has_float= nfloat != NULL;
  info.is_megamorphic= false;
  _instsLen = roundTo(a->instsLen(), oopSize);
  _locsLen  = a->locsLen();
  
  copy_oops((oop*)a->instsStart, (oop*)insts(), _instsLen/oopSize);
  int32 delta = (pc_t)insts() - (pc_t)a->instsStart;

  assert(realLocsLen(arity(), info.has_smi, info.has_float) == locsLen(),
         "wrong number of locs");
  copy_oops((oop*)a->locsStart, (oop*)locs(), locsLen() / oopSize);
  for (addrDesc* p = locs(), *end = locsEnd(); p < end; p++) {
    if (p->isOop()  &&  oop(p->referent(this))->is_new()) remember();

    // Because the PIC has been moved,  we must fix branches with relative
    // displacements targeting code outside the PIC.  Only these types of
    // branches have entries in the "loc" table.  So to check if an addrDesc
    // has to be shifted, we just have to check if the instr is a branch.
    // (This is only needed/done under PPC.) -abdelmalek 9/02
    // No, I think this is also needed for SPARC. -- dmu 3/06
    //
    // refactored for Intel -- dmu 3/06
    if (p->isShiftNeededAfterMovingMe(this))
      p->shift(this, delta);
  }
  
  nmln* d = deps(); 
  for (fint i = 0; i < newMethods; i++, d++) {
    d->init();
    if (st[i]) {
      st[i]->initSendDesc(d);
    } else {
      n[i]->linkedSends.add(d);
    }
  }
  assert(d == depsEnd(), "just checkin'");

  MachineCache::flush_instruction_cache_range(insts(), instsEnd());
  MachineCache::flush_instruction_cache_for_debugging();
  
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions  &&  this == (CacheStub*)catchThisOne) warning("caught cache stub");
# endif
}

Label* CacheStub::generate(nmethod* nm, mapOop receiverMapOop,
                           CountStub* stub, Label* prev) {
  Map *rmap= receiverMapOop->map_addr();
  assert(!rmap->is_smi() && !rmap->is_float(), "missed an immediate");
  pc_t jumpAddr;
  computeJumpAddr(nm, theSendDesc, stub, jumpAddr);
  
# if defined(SIC_COMPILER)
  if (SICCountTypeTests) theAssembler->doOneTypeTest();
# endif

  prev = test(receiverMapOop, jumpAddr, prev);
  n[newMethods] = nm;
  st[newMethods++] = stub;
  assert(newMethods <= MaxPICSize, "arity overflow");
  return prev;
}


void CacheStub::computeJumpAddr(nmethod* nm, sendDesc* sd,
                                CountStub*& stub, pc_t& addr) {
  // compute jump address (nmethod or count stub); create count stub if needed
  // CAUTION: stubs are deallocated later (or not at all, if they are
  // passed on to the new PIC), so don't deallocate stubs here
  if (nm == NULL) return;
  if (stub) {
    assert(stub->target() == nm, "wrong target");
    addr= stub->insts();
    stub->setVerifiedEntryPoint(nm); // xxx miw
  } else if (UseAgingStubs  &&  nm->isYoung()) {
    stub= new AgingStub(nm, nm->verifiedEntryPoint(), NULL);
    addr= stub->insts();    
  } else if (sd->isCounting()) {
    stub= CountStub::new_CountStub(nm, nm->verifiedEntryPoint(), NULL, sd->countType());
    addr= stub->insts();
  } else {
    addr= nm->verifiedEntryPoint();
  }
}

CacheStub* CacheStub::extendMegamorphic(sendDesc* send_desc, nmethod* nm,
                                        mapOop receiverMapOop) {
  // A megamorphic stub has missed; just replace first memOop case with
  // the missing map.
  assert(isMegamorphic(), "not megamorphic");
  NumberOfMegamorphicPICMisses++;
  Map* rmap = receiverMapOop->map_addr();
  if (rmap->is_smi() || rmap->is_float()) {
    // need to add a new case; delete last entry to make room
    return copy_replace_immediate(send_desc, MaxPICSize-1, nm, receiverMapOop);
  }
  fint index = immediateCount();
  // pick random case to discard, move first memOop case there
  // random replacement is usually better than rotate because the miss
  // penalty is much lower and because the behavior is more uniform.
  fint i= (rand() >> 4) % (arity() - index - 1) + index + 1;
  assert(i > index && i < arity(), "oops");
  CountStub* cs= countStub(i);          // reuse this count stub for new case
#ifdef LOG_LOTSA_STUFF
  // pollutes event log too much for normal use
  LOG_EVENT2( "CacheStub::extendMegamorphic: index %d, count stub 0x%x",
             i, cs);
#endif
  addrDesc* l = locs();
  nmln* d = deps();
  d[i].remove();                    // unlink random nmethod
  // find indices of addrDescs corresponding to jumps and maps
  fint j0= getJumpLocsIndex(index);
  fint m0= j0 - 1; 
  fint ji= getJumpLocsIndex(i);
  fint mi= ji - 1;
  // patch code (map constant and jump address)
  l[mi].set_referent(this, l[m0].referent(this));
  l[ji].set_referent(this, l[j0].referent(this));
  d[i] = d[index]; d[i].relocate();             // copy nmln
  d[index].init();                              // and zap source nmln

  // change map and jump address of first memOop case
  addrDesc *maploc= &l[m0];
  assert(oop(maploc->referent(this))->is_map(), "not a mapOop");
  maploc->set_referent(this, receiverMapOop);
  if (receiverMapOop->is_new()) remember();
  rebind(index, nm, cs);
  if (VerifyZoneOften) verify();
  return this;
}


void CacheStub::rebind(fint index, nmethod* nm, CountStub* cs) {
  // rebind jump address (but NOT map) of indexth branch
  // make sure young nmethods always have an aging stub

  if (UseAgingStubs  &&  cs == NULL && nm->isYoung()) {
    cs = new AgingStub(nm, nm->verifiedEntryPoint(), NULL);
  }
  if (cs == NULL) {
    // when a young method is replaced by an old one, there is no count stub
    // assert(!sd()->isCounting(),
    //        "call site claims to have a count stub but does not have one");
    setJumpAddr(index, nm->verifiedEntryPoint());
    nmln* d = &deps()[index];
    d->remove();                        // unlink old nmethod
    nm->linkedSends.add(d);             // link in new nmethod
  } else {
    // keep count stub for efficiency reasons --> in megamorphic PICs,
    // the individual counters cannot be trusted, but the sum is ok
    setJumpAddr(index, cs->insts());
    cs->rebind(nm, nm->verifiedEntryPoint());
    nmln* d = &deps()[index];
    d->remove();                        // unlink old count stub
    cs->initSendDesc(d);                // link in new count stub
  }
  MachineCache::flush_instruction_cache_for_debugging(); // set_referent does word-wise flushes
}

CacheStub* CacheStub::makeMegamorphic(sendDesc* send_desc, nmethod* nm,
                                      mapOop receiverMapOop) {
  // convert PIC to a megamorphic PIC;
  // doesn't do anything particularly special now

  if (PrintPIC || PrintMegamorphism)
    lprintf("*making PIC %#lx megamorphic ", this);
  info.is_megamorphic= true;
  CacheStub *s= extendMegamorphic(send_desc, nm, receiverMapOop);
  if (PrintPIC || PrintMegamorphism) lprintf(" --> %#lx\n", s);
  return s;
}

CacheStub* CacheStub::extend(sendDesc* send_desc, nmethod* nm,
                             mapOop receiverMapOop) {

#if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions) {
    if (this && this == (CacheStub*)catchThisOne) warning("caught cache stub");
    for (fint i = 0; i < arity(); i++) {
      nmethod* nm1 = get_method(i);
      if (ReuseNICMethods) {
        assert(   nm1 != nm
               || get_map(i) != receiverMapOop,
               "nmethod already in PIC with same map");
      } else {
        assert(nm1 != nm, "nmethod already in PIC");
        assert(nm1->key.receiverMapOop() != nm->key.receiverMapOop(),
               "rcvr map already in PIC");
      }
    }
  }
#endif

  if (isMegamorphic()) {
    if (PrintPIC && PrintMegamorphism)
      lprintf("*megamorphic PIC %#lx miss, nm = %#lx\n", this, nm);
    return extendMegamorphic(send_desc, nm, receiverMapOop);
  }

  if (isPerformLookupType(nm->key.lookupType))
    ShouldNotReachHere(); // can't handle these kinds of misses

  if (arity() < MaxPICSize)
    return copy_add_nmethod(send_desc, nm, receiverMapOop);
  
  assert(arity() == MaxPICSize, "PIC should never be > MaxPICSize");
  // stub just now turning into a megamorphic stub
  return makeMegamorphic(send_desc, nm, receiverMapOop);
}

#ifdef UNUSED
void CacheStub::insertCounters() {
  sendDesc* send_desc = sd();
  for (fint i = arity() - 1; i >= 0; i--) {
    nmethod* nm = get_method(i);
    CountStub* cs = countStub(i);
    if (cs == NULL) {
      pc_t addr;
      computeJumpAddr(nm, send_desc, cs, addr);
      assert(cs, "should have created count stub");
      nmln* d = &deps()[i];
      d->remove();                      // unlink nmethod
      cs->initSendDesc(d);
      setJumpAddr(i, addr);
    }
  }
}

void CacheStub::removeCounters() {
  sendDesc* send_desc = sd();
  if (send_desc->isCounting()) return;  // need them anyway
  for (fint i = arity() - 1; i >= 0; i--) {
    CountStub* cs = countStub(i);
    if (cs) {
      nmethod* nm = cs->target();
      cs->deallocate();
      deps()[i].rebind(&nm->linkedSends);
      setJumpAddr(i, nm->verifiedEntryPoint());
    }
  }
}
#endif



// setup stuff in anticipation of extending a PIC
void CacheStub::copy_prologue(sendDesc *sd) {

  oldAssembler= theAssembler;   // save current assembler
  theAssembler= NULL;
  a= new Assembler(MaxStubSize, MaxStubSize, false, true);

  n=  NEW_RESOURCE_ARRAY(nmethod*,   MaxPICSize);
  st= NEW_RESOURCE_ARRAY(CountStub*, MaxPICSize);

  theSendDesc= sd;
  newMethods= 0;
}



CacheStub* CacheStub::copy_epilogue() {
  // allocate new stub
  CacheStub* s= new CacheStub;
  theSendDesc->link(s);         // install new stub
  if (VerifyZoneOften) s->verify();
  theAssembler= oldAssembler;
  theSendDesc= NULL;
  return s;
}



// Locate nmethods for the smi and float cases which will be propagated 
// to the copy, and put them and their count stubs in nsmi, nfloat,
// stsmi and stfloat.

void CacheStub::find_immediate_nmethods(nmethod *del) {

  nsmi= nfloat= NULL;  stsmi= stfloat= NULL;
  fint arty= arity();
  if (arty == 0) return;

  nmethod *nm0= get_method(0);
  Map *m0= get_map(0)->map_addr();

  nmethod *nm1= arty == 1 ? NULL : get_method(1);
  Map      *m1= arty == 1 ? NULL : get_map(1)->map_addr();

  assert(!m1->is_smi(), "smallInt case must be first");

  if (m0->is_smi()  &&  nm0 != del) {
    nsmi= nm0;  stsmi= countStub(0);
  }

  if (m0->is_float()  &&  nm0 != del) {
    nfloat= nm0;  stfloat= countStub(0);
  } else if (m1->is_float()  &&  nm1 != del) {
    nfloat= nm1;  stfloat= countStub(1);
  }
}



// This is the body of the PIC copy code.
// Copies the receiver, making a PIC with `total' entries,
// eliminating the case at delIndex (set it negative
// otherwise), or eliminating all cases which are bound to delnm (set it to
// NULL otherwise).
// Adds up to two new cases, a1/m1/s1 (if a1!=NULL), and a2/m2/s2 (a2!=NULL).
// Uses the class statics nsmi, nfloat, stsmi, stfloat.

void CacheStub::gen_copy(fint total, fint delIndex, nmethod *delnm,
                         nmethod *a1, mapOop m1, CountStub *s1,
                         nmethod *a2, mapOop m2, CountStub *s2) {

  assert(!stsmi   || stsmi  ->target() == nsmi,   "found wrong smi stub"  );
  assert(!stfloat || stfloat->target() == nfloat, "found wrong float stub");

  fint immed= (nsmi ? 1 : 0) + (nfloat ? 1 : 0);
  bool immedOnly= total == 0;
  total += immed;
  assert(total > 1, "can't make PIC with less than two entries");

  // generate code
  
# if defined(SIC_COMPILER)
  if (SICCountTypeTests) {
    theAssembler->startTypeTest(total, true, immedOnly);
    if (immed >= 1) {
      theAssembler->doOneTypeTest();
      if (immed == 2) theAssembler->doOneTypeTest();
    }
  }
# endif

  Label* miss= prologue(immedOnly);

  Label* prev= NULL;
  for (fint i= 0; i < arity(); i++) {
    if (i != delIndex) {
      nmethod* nm= get_method(i);
      if (nm != delnm && nm != nsmi && nm != nfloat) {
        prev= generate(nm, get_map(i), countStub(i), prev);
      }
    }
  }
  if (a1) prev= generate(a1, m1, s1, prev);
  if (a2) prev= generate(a2, m2, s2, prev);
  finish(miss, prev);
}


// Can be called with this==NULL to create a PIC

CacheStub* CacheStub::copy_add_nmethod(sendDesc* send_desc,
                                       nmethod* add, mapOop receiverMapOop) {
  ResourceMark rm;

  if (PrintPIC)
    if (this)
      lprintf("*extending PIC %#lx with nmethod %#lx, map %#lx",
              this, add, receiverMapOop);
    else
      lprintf("*creating PIC with nmethod %#lx, map %#lx for old nmethod %#lx",
              add, receiverMapOop, send_desc->get_method());

  copy_prologue(send_desc);

  // if no existing PIC, fst was the method called from send_desc
  nmethod* fst= this ? NULL : send_desc->get_method();
  Map* mf= fst ? fst->key.receiverMap() : NULL;
  CountStub *stub= send_desc->countStub();
  find_immediate_nmethods(NULL);
  Map* ma= receiverMapOop->map_addr();

  if (ma->is_smi()) {
    nsmi= add; stsmi= NULL; add= NULL;
  } else if (mf->is_smi()) {
    nsmi= fst; stsmi= stub; fst= NULL; 
  }

  if (ma->is_float()) {
    nfloat= add; stfloat= NULL; add= NULL;
  } else if (mf->is_float()) {
    nfloat= fst; stfloat= stub; fst= NULL;
  }

  gen_copy(arity() + (add ? 1 : 0) + (fst ? 1 : 0), -1, NULL,
           add, receiverMapOop, NULL,
           fst, mf->enclosing_mapOop(), stub);

  // Delete current PIC (must do before allocating new one because this might 
  // be moved during allocation of new PIC).
  if (this) {
    // deallocate old cache stub, but preserve count stubs
    deallocate2(true);
  } else if (stub) {
    // unlink count stub from calling sendDesc 
    stub->unlinkFromSendDesc();
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      fint i;
      for (i= 0; i < newMethods && st[i] != stub; i++) ;
      assert(i < newMethods, "should have reused stub somewhere");
    }
#   endif
    stub->setVerifiedEntryPoint(fst);
  } else {
    send_desc->unlink_nmethod();
  }
  
  CacheStub *s= copy_epilogue();
  if (PrintPIC) lprintf(" --> %#lx\n", s);
  return s;
}



// Remove the case at delIndex
CacheStub* CacheStub::copy_remove_nmethod(sendDesc* send_desc, fint delIndex) {
  ResourceMark rm;
  nmethod *delnm= get_method(delIndex);
  if (PrintPIC) lprintf("*removing nmethod %#lx from PIC %#lx", delnm, this);
  copy_prologue(send_desc);
  find_immediate_nmethods(delnm);
  gen_copy(arity() - 1, delIndex);
  CountStub *cs= countStub(delIndex);
  deallocate2(true);
  if (cs) cs->deallocate();
  CacheStub *s= copy_epilogue();
  if (PrintPIC) lprintf("--> %#lx\n", s);
  return s;
}


// Remove all cases bound to nmethod delnm
CacheStub* CacheStub::copy_remove_all(sendDesc* send_desc, nmethod *delnm) {
  ResourceMark rm;

  copy_prologue(send_desc);
  find_immediate_nmethods(delnm);
  fint i, ndel, arty= arity();
  CountStub **delVec= NEW_RESOURCE_ARRAY(CountStub*, arty);
  for (i= ndel= 0; i < arty; i++) {
    nmethod* nm= get_method(i);
    if (nm != delnm) {
      delVec[i]= NULL;
    } else {
      ++ndel;
      delVec[i]= countStub(i);
    }
  }

  if (PrintPIC)
    lprintf("*removing nmethod %#lx from PIC %#lx (%d cases)",
            delnm, this, (void*)ndel);

  gen_copy(arty - ndel, -1, delnm);
  deallocate2(true);
  for (i= 0; i < arty; i++)
    if (delVec[i]) delVec[i]->deallocate();
  CacheStub* s= copy_epilogue();
  if (PrintPIC) lprintf("--> %#lx\n", s);
  return s;
}


// Remove the case at index delIndex.  Add add/receiverMapOop, which
// is an immediate case (smi/float).
CacheStub* CacheStub::copy_replace_immediate(sendDesc* send_desc,
                                             fint delIndex,
                                             nmethod* add,
                                             mapOop receiverMapOop) {
  ResourceMark rm;
  nmethod *delnm= get_method(delIndex);
  copy_prologue(send_desc);
  find_immediate_nmethods(delnm);
  Map* ma= receiverMapOop->map_addr();
  if (ma->is_smi()) {
    nsmi= add; stsmi= NULL;
  } else if (ma->is_float()) {
    nfloat= add; stfloat= NULL;
  } else {
    fatal("should only be adding immediate case");
  }
  gen_copy(arity(), delIndex);
  CountStub *cs= countStub(delIndex);
  deallocate2(true);
  if (cs) cs->deallocate();
  return copy_epilogue();
}


// unlink method at l from this cache (all cases)
NCodeBase* CacheStub::unlink_me(nmln *l) { 
#if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions  &&  this == (CacheStub*)catchThisOne) warning("caught cache stub");
#endif
  fint index= indexOfDep(l);
  nmethod *delnm= get_method(index);
  fint nremaining= arity() - nOccurrences(delnm);
  if (nremaining == 0) {
    // clear the inline cache
    deallocate();
    return NULL;
  }
  if (nremaining > 1)
    // make new PIC for remaining 2 or more entries
    return copy_remove_all(sd(), delnm);

  // install last remaining entry in inline cache
  fint remain;
  for (remain= 0;  get_method(remain) == delnm;  remain++)
    assert(remain < arity(), "ran off end of PIC");
  replace_with_inline_cache(remain);
  return NULL;
}


// replace PIC with inline cache of i'th case
void CacheStub::replace_with_inline_cache(fint i)
{
  NCodeBase *remainingThing= get_thing(i);
  nmethod *remainingMeth;
  CountStub *cs;
  if (remainingThing->isNMethod()) {
    remainingMeth= (nmethod*)remainingThing;
    cs= NULL;
  } else {
    cs= (CountStub*)remainingThing;
    remainingMeth= cs->target();
  }
  mapOop remainingMap= get_map(i);
  sendDesc* s= sd();
  fint arty= arity();
  if (PrintPIC)
    lprintf("*deallocating %d-element PIC %#lx\n", (void*)arty, this); 
  fint j;
  CountStub **delVec= NEW_RESOURCE_ARRAY(CountStub*, arty);
  for (j= 0; j < arty; j++)
    delVec[j]= i == j ? NULL : countStub(j);
  deallocate2(true);
  for (j= 0; j < arty; j++)
    if (delVec[j]) delVec[j]->deallocate();
  s->extend(remainingMeth, remainingMap, cs);
}

#ifdef UNUSED
// unlink case at l from this cache
NCodeBase* CacheStub::unlink_one(nmln* l) {
#if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions  &&  this == (CacheStub*)catchThisOne) warning("caught cache stub");
#endif
  fint index= indexOfDep(l);
  nmethod *delnm= get_method(index);
  fint nremaining= arity() - 1;
  assert (nremaining > 0, "1-element PIC?");
  if (nremaining == 1) {
    // install last remaining entry in inline cache
    assert(arity() == 2, "bizarre case in PIC contraction");
    replace_with_inline_cache(1 - index);
    return NULL;
  }
  // make new PIC for remaining 2 or more entries
  CacheStub* s=  copy_remove_nmethod(sd(), index);
  return s;
}
#endif

void CacheStub::moveTo_inner(NCodeBase* p, int32 delta, int32 size) {
  CacheStub *to= (CacheStub*)p;
  OopNCode::moveTo_inner(to, delta, size);
  // currently, the instructions are all position-independent (at least on
  // the sparc), but we need to adjust the deps
  if (cacheLink.notEmpty())
    sd()->shift_jump_addr(delta);
  cacheLink.shift(delta);
  for (nmln* l = deps(), *end = depsEnd(); l < end; l++)
    l->shift(delta, this);
}
  

void CacheStub::deallocate2(bool dontDeallocateStubs) {
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions  &&  this == (CacheStub*)catchThisOne) warning("caught cache stub");
# endif
  for (nmln* l = deps(); l < depsEnd(); l++) l->remove();
  rememberLink.remove();

  sendDesc* send_desc = sd();
  send_desc->reset_jump_addr();
  cacheLink.remove();
  assert(send_desc->dependency()->isEmpty(), "should be empty now");
  for (fint i = arity() - 1; i >= 0; i--) {
    CountStub* cs = countStub(i);
    if (cs) {
      if (dontDeallocateStubs) {
        cs->unlinkFromSendDesc();
      } else {
        cs->deallocate();
      }
    }
  }
  MachineCache::flush_instruction_cache_for_debugging();
  fint s = size();
  kill_vtbl_value();        // to make isCacheStub fail on me
  Memory->code->stubs->deallocate(this, s);
}

#ifdef UNUSED
int32 CacheStub::flush() {              // try to flush this stub
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions  &&  this == (CacheStub*)catchThisOne) warning("caught cache stub");
# endif
  assert(zone::frame_chain_nesting > 0, "frames must be chained");
  nmethod* myMethod = nmethod::findNMethod(sd());
  if (myMethod->frame_chain != NoFrameChain) return 0;
  int32 s = size();
  deallocate();
  return s;
}
#endif

// The target at the branch with nmln l is being shifted by delta;
// update jump address
void CacheStub::shift_target(nmln* l, int32 delta) {
  addrDesc *loc= getJumpLoc(indexOfDep(l));
  pc_t jumpAddr= loc->referent(this);
  loc->set_referent(this, jumpAddr + delta);  
}

void CacheStub::forwardLinkedSend(nmln* l, nmethod* to) {
  fint index= indexOfDep(l);
  CountStub *cs= countStub(index);
  rebind(index, to, cs && to->isYoung() ? cs : NULL);
  if (cs && !to->isYoung()) {
    // discard count stub and make
    cs->deallocate();
  }
}

bool CacheStub::verify() {
  bool r = true;
  r &= OopNCode::verify2("cache stub");

  if (insts() != (pc_t)(this + 1)) {
    error1("cache stub at %#lx has incorrect insts pointer", this);
    r = false;
  }
  
  if (!Memory->code->stubs->contains(this)) {
    error1("cache stub at %#lx not in zone", this);
    r = false;
  }
  
  if (!Memory->code->contains(sd())) {
    error1("cache stub at %#lx: sendDesc not in zone", this);
    r = false;
  } else if (sd()->pic() != this) {
    error1("cache stub at %#lx: sendDesc doesn't point back to me", this);
    r = false;
  }
  if (cacheLink.next != cacheLink.prev) {
    error1("cache stub %#lx: more than one element in cacheLink", this);
    r = false;
  }
  
  if (arity() < 0 || arity() > MaxPICSize) {
    error2("cache stub at %#lx: invalid arity", this, arity());
    r = false;
  }
  else if (isMegamorphic() && arity() < MaxPICSize) {
    error1("cache stub at %#lx: wrong isMegamorphic flag", this);
    r = false;
  }
  
  if (instsLen() < 3*oopSize || instsLen() > 1000) {
    error2("cache stub at %#lx: invalid instsLen", this, instsLen());
    r = false;
  }
  
  fint lLen = realLocsLen(arity(), hasSmi(), hasFloat());
  if (lLen != locsLen()) {
    error3("cache stub at %#lx: wrong number of locs %ld (should be %ld)",
           this, locsLen(), lLen);
    r = false;
  }
  
  for (fint i = 0; i < arity(); i++) {
    nmethod* nm = get_method(i);
    CountStub* cs = countStub(i);
    if (sd()->isCounting()) {
      // when a method is replaced by an old SIC method, there is no count stub
      // if (cs == NULL) error2("cache stub at %#lx, branch %ld: has no count stub", this, i);
    } else if (cs != NULL && !cs->isAgingStub()) {
      error2("cache stub at %#lx, branch %ld: has count stub", this, i);
      r = false;
    }

    if (cs) {
      r &= cs->verify2(this);
    } else {
      if (!sd()->checkLookupTypeAndEntryPoint(nm, getJumpAddr(i))) {
        error2("cache stub at %#lx, branch %ld: wrong lookup type or entry point",
               this, i);
        r = false;
      }
      bool found = false;
      for (nmln* e = &nm->linkedSends, *d = e->next; d != e; d = d->next) {
        if (encompasses(d)) {
          found = true;
          break;
        }
      }
      if (! found) {
        error2("cache stub at %#lx, branch %ld: not linked to nmethod",
               this, i);
        r = false;
      }
    }

    Map* rmap = nm->key.receiverMap();
    if (rmap != Memory->smi_map &&
        rmap != Memory->float_map) {
      mapOop receiverMapOop= get_map(i);
      assert(receiverMapOop->is_map(), "unexpected kind of map location");
      if (!ReuseNICMethods && rmap != receiverMapOop->map_addr()) {
        error4("cache stub %#lx, branch %ld: wrong map (%#lx instead of %#lx)",
               this, i, receiverMapOop->map_addr(), rmap);
        r = false;
      }
    }
    if (!ReuseNICMethods) {
      for (fint j = 0; j < i; j++) {
        nmethod* nm1 = get_method(j);
        if (nm == nm1) {
          error4("cache stub %#lx: duplicate nmethod %#lx (branch %ld & %ld)",
                 this, nm, j, i);
          r = false;
        }
        if (nm->key.receiverMapOop() == nm1->key.receiverMapOop()) {
          error4("cache stub %#lx: duplicate map %#lx (branch %ld & %ld)",
                 this, nm->key.receiverMapOop(), j, i);
          r = false;
        }
      }
    }
  }
  
  if (!ReuseNICMethods) {
    Map* m0 = (arity() > 0 ? get_method(0)->key.receiverMap() : NULL);
    Map* m1 = (arity() > 1 ? get_method(1)->key.receiverMap() : NULL);
    if (hasSmi() && (m0 == NULL || !m0->is_smi())) {
      error1("cache stub at %#lx: wrong hasSmi flag", this);
      r = false;
    }
    if (hasFloat() &&
        (m0 == NULL || !m0->is_float()) && (m1 == NULL || !m1->is_float())) {
      error1("cache stub at %#lx: wrong hasFloat flag", this);
      r = false;
    }
  }
  if (findCacheStub((pc_t) instsEnd() - oopSize) != this) {
    error1("findCacheStub didn't find this stub (0x%lx)", this);
    r = false;
  }
  return r;
}

sendDesc* CacheStub::sd() {  
  assert(cacheLink.notEmpty(), "no sd");
  return sendDesc::sendDesc_from_nmln(cacheLink.next);
}
nmethod* CacheStub::sender() { return nmethod::findNMethod(cacheLink.next); }

void CacheStub::print() {
  printIndent();
  lprintf("cache stub at %#lx (arity %ld); flags = { ",
         this, long(arity()));
  if (hasSmi()) lprintf("smi ");
  if (hasFloat()) lprintf("float ");
  if (isMegamorphic()) lprintf("megamorphic ");
  lprintf("}\n");
  Indent ++;
  printIndent();
  lprintf("sendDesc: %#lx selector: ", sd());
  sd()->selector()->print_real_oop();
  lprintf("\n");
  printIndent();
  lprintf("instructions: x/%ldi %#lx\n", (void*)long(instsLen() / oopSize),
         insts());

  printIndent();
  lprintf("           maps: ");
  fint i;
  for (i = 0; i < arity(); i++) {
    lprintf("%#lx ", get_map(i));
  }
  lprintf("\n");

  printIndent();
  lprintf("  linked things: ");
  for (i = 0; i < arity(); i++) {
    lprintf("%#lx ", get_thing(i));
  }
  lprintf("\n");

  printIndent();
  lprintf("linked nmethods: ");
  for (i = 0; i < arity(); i++) {
    lprintf("%#lx ", get_method(i));
  }
  lprintf("\n");

  Indent--;
}

bool isCacheStub(void* p) {
  return ((CacheStub*)p)->vtbl_value() == ((CacheStub*)NULL)->static_vtbl_value();
}

NCodeBase* findStub(void* addr) {
  NCodeBase* s =
    (NCodeBase*)Memory->code->stubs->zone()->findStartOfBlock(addr);
  assert(isCacheStub(s) || CountStub::isCountStub(s), "what is it?");
  return s;
}

CacheStub* findCacheStub(void* addr) {
  NCodeBase* s = findStub(addr);
  assert(s->isCacheStub(), "not a cache stub");
  assert(((CacheStub*)s)->encompasses(addr), "found wrong stub");
  return (CacheStub*)s;
}

CacheStub* findCacheStub_maybe(void* start) {
  // start may point to code part of a cache stub; return that stub or NULL
  if (!Memory->code->stubs->zone()->contains(start)) return NULL;
  // relies on FOR_ALL_STUBS to enumerate in ascending order
  FOR_ALL_STUBS(_p) {
    CHECK_PIC(_p, p);
    if ( p->insts()    > (pc_t)start) return NULL;
    if ( p->instsEnd() > (pc_t)start) return p;
  }
  return NULL;
}

# if  GENERATE_DEBUGGING_AIDS
CacheStub* StubFromNmln(nmln* l) {
  // given the cacheLink nmln, return the PIC
  assert(Memory->code->stubs->contains(l), "not in PIC zone");
  CacheStub* s = NULL;
  fint offset = (pc_t)&s->cacheLink - (pc_t)s;
  s = (CacheStub*)((pc_t)l - offset);
  assert(s->vtbl_value() == s->static_vtbl_value(), "not a PIC");
  return s;
}
#endif

const fint ReserveFree     = 16 * K;    // size of emergency allocation reserve

Stubs::Stubs(Heap* s) {
  stubZone = s; needsWork = false;
  reserve = s->allocate(ReserveFree);
}

void Stubs::gc_mark_contents() {
  FOR_ALL_STUBS(_p) {
    CHECK_PIC(_p, p);
    p->gc_mark_contents();
  }
}

bool Stubs::gc_unmark_contents() {
  bool needToInvalCache = false;
  FOR_ALL_STUBS(_p) {
    CHECK_PIC(_p, p);
    if (p->gc_unmark_contents()) needToInvalCache = true;
  }
  return needToInvalCache;
}

bool Stubs::code_oops_do(oopsDoFn f) {
  bool needToInvalCache = false;
  FOR_ALL_STUBS(_p) {
    CHECK_PIC(_p, p);
    if (p->code_oops_do(f)) needToInvalCache = true;
  }
  return needToInvalCache;
}

bool Stubs::switch_pointers(oop from, oop to,
                            nmethodBList* nmethods_to_invalidate) {
  bool needToInvalCache = false;
  FOR_ALL_STUBS(_p) {
    CHECK_PIC(_p, p);
    if (p->switch_pointers(from, to, nmethods_to_invalidate))
      needToInvalCache = true;
  }
  return needToInvalCache;
}

#ifdef UNUSED
void Stubs::relocate() {
  FOR_ALL_STUBS(_p) {
    CHECK_PIC(_p, p);
    p->relocate();
  }
}
#endif

void Stubs::decay(float factor) {
  FOR_ALL_STUBS(_p) {
    if (_p->isCountStub()) {
      CountStub* p = (CountStub*)_p;
      p->set_count(int(p->count() / factor));
    }
  }
}

void printAllStubs() {
  FOR_ALL_STUBS(p) { p->print(); }
}
    
static void moveStubs(pc_t from, pc_t to, int32 size) {
  ((NCodeBase*)from)->moveTo((NCodeBase*)to, size);
}

const fint MinFree     = 8 * K;         // desired min bytes free (absolute)
const fint MinFreePerc = 10;            // desired min bytes free (%)
const fint MaxFreePerc = 20;            // max. % free before doubling size

void* Stubs::allocate(int32 size) {
  void* p = stubZone->allocate(size);
  int32 nfree = stubZone->freeBytes();
  if (p == NULL ||
      nfree < MinFree || nfree * 100 / stubZone->capacity() < MinFreePerc) {
    LOG_EVENT1("stubs low on space: %ld bytes left", nfree);
    currentProcess->setupPreemption();
    needsWork = true;
  }
  if (p == NULL) {
    // NB: cannot grow / compact here - callers would have to guard against
    // moved "this" pointers etc.
    if (reserve) {
      assert((verify(), true), "bad zone before freeing reserve");
      stubZone->deallocate(reserve, ReserveFree);
      reserve = NULL;
      assert((verify(), true), "bad zone after freeing reserve");
      LOG_EVENT("stubs: freeing reserve");
      p = stubZone->allocate(size);

      // cannot verify stubs, because one is allocated, but not initialized
      assert((stubZone->verify(), true), "bad zone after using reserve");
    }
    if (p == NULL) fatal("couldn't allocate in PIC zone");
  }
  return p;
}

void Stubs::cleanup() {
  // PICs / CountStubs are fairly uniform in size, so fragmentation should be
  // negligible; only compact if > MaxFree % space free, or if emergency
  // happened
  needsWork = false;
  if (reserve == NULL ||
      (stubZone->freeBytes() * 100 / stubZone->capacity() > MaxFreePerc &&
      stubZone->freeBytes() > MinFree)) {
    LOG_EVENT("compacting PIC zone");
    if (PrintCodeReclamation) {
      lprintf("*compacting PIC zone\n");
    }
    if (reserve) {
      assert((verify(), true), "bad zone before freeing reserve");
      stubZone->deallocate(reserve, ReserveFree);
      reserve = NULL;
    }
    assert((verify(), true), "bad zone before compaction");
    stubZone->compact(moveStubs);
    MachineCache::flush_instruction_cache_for_debugging();
    reserve = stubZone->allocate(ReserveFree);
    if (reserve) {
      assert((verify(), true), "bad zone after compaction");
      return;
    }
  }
  // grow the zone
  int32 newSize = stubZone->capacity() * 2;
  LOG_EVENT1("growing PIC zone to %ld bytes", newSize);
  if (WizardMode) {
    warning1("PIC code area overflowed - growing it to %ld bytes.", newSize);
    printIndent(); lprintf("Current zone: "); stubZone->print();
    space_print();
  }
  assert((verify(), true), "bad zone before growth");
  Heap* newHeap = new Heap(stubZone->capacity() * 2,
                           stubZone->blockSize, stubZone->nfree);
  stubZone->newHeap = newHeap;
  FOR_ALL_STUBS(s) {
    void* to = newHeap->allocate(s->size());
    assert(to, "couldn't allocate destination PIC");
    s->moveTo((NCodeBase*)to, newHeap->sizeOfBlock(to));
  }
  MachineCache::flush_instruction_cache_for_debugging();
  delete stubZone;
  stubZone = newHeap;
  reserve = stubZone->allocate(ReserveFree);
  TheSpy->adjust_after_resize();
  assert((verify(), true), "bad zone after growth");
}

void Stubs::clear() {
  stubZone->clear();
  reserve = stubZone->allocate(ReserveFree);
}

bool Stubs::verify() {
  bool r = true;
  r &= stubZone->verify();
  NCodeBase* last_s = NULL; // for debugging
  FOR_ALL_STUBS(s) {
    r &= s->verify();
    last_s = s;
  }
  return r;
}

void Stubs::flush() {
  NCodeBase* next;
  if (reserve) stubZone->deallocate(reserve, ReserveFree);
  reserve = NULL;
  NCodeBase* s = (NCodeBase*)stubZone->firstUsed();
  // Don't use FOR_ALL_STUBS for efficiency (in combining mode, flushed
  // stub might be combined with neighbors -> have to scan zone from
  // beginning to find next stub).
  for ( ; s; s = next) {
    next = (NCodeBase*)stubZone->nextUsed(s);
    if (s->isCountStub() && ((CountStub*)s)->sd() == NULL) {
      // this count stub is linked to a PIC; don't deallocate before 
      // the PIC is deallocated
    } else {
      s->deallocate();
      if (!next || isCacheStub(next) || CountStub::isCountStub(next)) {
        // ok
      } else {
        // next was a count stub called by PIC s, i.e. it has been deallocated
        next = (NCodeBase*)stubZone->firstUsed();
      }
    }
  }
  reserve = stubZone->allocate(ReserveFree);
}

void Stubs::space_print() {
  FlagSetting fs(PrintVMMessages, true);
  int32 pic = 0, npic = 0, count = 0, ncount = 0, aging = 0, naging = 0;
  FOR_ALL_STUBS(s) {
    if (s->isCacheStub()) {
      npic++; pic += s->size();
    } else if (s->isCountStub()) {
      ncount++; count += s->size();
    } else if (s->isAgingStub()) {
      naging++; aging += s->size();
    } else {
      fatal(" unexpected kind of stub");
    }
  }
  int32 total = pic + count + aging;
  int32 ntotal = npic + ncount + naging;
#define PRINT(name, cnt, size)                                                \
  { \
    float f1, f2; \
    f1 = 100.0 * cnt/ntotal; \
    f2 = 100.0 * size / total; \
    lprintf("%s: %d (%4.1f) %d bytes (%4.1f)\n", name, \
            (void*)cnt, *(void**)&f1, \
            (void*)size, *(void**)&f2); \
  }
  PRINT("PICs", npic, pic);
  PRINT("counters", ncount, count);
  PRINT("aging counters", naging, aging);
}

# define FOR_ALL_NMETHODS(var)                                                \
    for (nmethod *var = Memory->code->first_nm();                             \
    var; var = Memory->code->next_nm(var))


# endif  // defined(FAST_COMPILER) || defined(SIC_COMPILER)

oop pic_histogram_prim(oop rcvr) {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  ResourceMark rm;
  fint max = MaxPICSize * 2;    // just to be safe
  smi *count= NEW_RESOURCE_ARRAY(smi, max + 1);
  smi *noblocks = NEW_RESOURCE_ARRAY(smi, max + 1);
  set_oops((oop*)count,    max + 1, 0);
  set_oops((oop*)noblocks, max + 1, 0);
  fint npics = 0, ncounting = 0;

  fint nmethods = 0, nsds = 0;
  FOR_ALL_NMETHODS(nm) {
    nmethods++;
    for (addrDesc* a = nm->locs(), *aend = nm->locsEnd(); a < aend; a++) {
      if (a->isSendDesc()) {
        nsds++;
        sendDesc* sd = a->asSendDesc(nm);
        fint arity = sd->ntargets();
        assert(0 <= arity && arity < MaxPICSize, "bad arity");
        count[arity]++;
        switch (arity) {
          case 0: break;
          case 1: {
            Map *rcvrMap= sd->get_method()->key.receiverMap(); // best guess xxx miw
            noblocks[rcvrMap->is_block() ? 1 : 0]++;
            break;
          }
          default: {
            npics++;
            if (sd->isCounting()) ncounting++;
            // count non-block receivers
            CacheStub *pic= sd->pic();
            fint n= 0;
            for (fint i= 0; i < pic->arity(); i++) {
              if (pic->get_map(i)->map_addr()->is_block()) n++;
            }
            noblocks[n]++;
            break;
          }
        }
      }
    }
  }
  
  lprintf("%d nmethods, %d sendDescs (%d pics, %d counting)\n",
         nmethods, nsds, npics, ncounting);
  noblocks[0] = count[0];
  for (fint i = 0; i < max; i++) {
    if (count[i] + noblocks[i] > 0)
      lprintf("%2d: %5d %5d\n", i, count[i], noblocks[i]);
  }

# endif  // defined(FAST_COMPILER) || defined(SIC_COMPILER)

  return rcvr;
}
