/* Sun-$Revision: 30.17 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "sendDesc_abstract.hh"
# pragma implementation "sendDesc.hh"
# include "_sendDesc.cpp.incl"

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

sendDesc* sendDesc::first_sendDesc() {
  // assertion is in sendDes::init
  return sendDesc::sendDesc_from_return_PC(
           first_inst_addr((void*)firstSelfFrame_returnPC));
}


bool sendDesc::checkLookupTypeAndEntryPoint() {
  char *insts= jump_addr();
  if (insts == lookupRoutine()) return true;
  NCodeBase *n= findThing(insts);
  if (n->isCacheStub()) {
    return true; // checked in CacheStub::verify
  }
  nmethod* nm;
  if (n->isNMethod()) {
    nm= (nmethod*)n;
  } else {
    assert(n->isCountStub(), "what is it?");
    CountStub *cs= (CountStub*)n;
    nm= cs->target();
    insts= cs->jump_addr();
  }
  return checkLookupTypeAndEntryPoint(nm, insts);
}
  

bool sendDesc::checkLookupTypeAndEntryPoint(nmethod *nm, char *entryPoint) {
  LookupType lsrc= lookupType() & ~ImplicitSelfBit;
  LookupType ldst= nm->key.lookupType & ~ImplicitSelfBit;
  bool rcvrStaticLookupType= lsrc & ReceiverStaticBit;
  // dstStaticLookupType==true implies no map check in prologue of nm
  bool  dstStaticLookupType= ldst & ReceiverStaticBit;
  lsrc &= ~ReceiverStaticBit;
  ldst &= ~ReceiverStaticBit;

  bool callsPrologue= entryPoint == nm->insts() && !dstStaticLookupType;
  bool skipsPrologue= entryPoint == nm->verifiedEntryPoint();
  // if things are really broken, neither callsPrologue nor
  // skipsPrologue is true

  if (pic())
    return skipsPrologue
      && (ReuseNICMethods && nm->reusable()
          ? lookupMatch(lsrc, ldst) : lsrc == ldst);
      
  if (!ReuseNICMethods)
    return lsrc == ldst
        && (rcvrStaticLookupType ? skipsPrologue : callsPrologue);

  if (!rcvrStaticLookupType)
    return lookupMatch(lsrc, ldst) && callsPrologue;

  // check entry point
  if (   (lookupType() & ImplicitSelfBit)
      && !isResendLookupType(lsrc)
      && nmethod::findNMethod(this)->reusable()) {
    // If we don't really know the receiver type for sure
    // (because the it's an implicit self send and the
    // sending method is reusable),
    // we must use the non-verified entry point.  Resends are OK --
    // we'll still be invoking the right method.
    if (!callsPrologue) return false;
  } else {
    if (!skipsPrologue) return false;
  }

  // Check lookup types.  If target is reusable,
  // lookup types need not match precisely, only enough to ensure
  // prologues and return addresses match
  return nm->reusable() ? lookupMatch(lsrc, ldst) : lsrc == ldst;
}


void sendDesc::extend(nmethod* nm, mapOop receiverMapOop,
                      CountStub *cs_from_pic) {
  char *addr;
  bool isPerform= isPerformLookupType(raw_lookupType());
  if (   PIC && !isPerform
      && (addr= jump_addr(), addr != lookupRoutine())) {
    // already has at least one nmethod linked to the send
    CacheStub* s= pic();
    # if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        assert(cs_from_pic==0, "discarding countStub?");
        if (!s) {
          // turning monomorphic ic into PIC; PIC will carry dependencies
          assert(dependency()->notEmpty(), "shouldn't be empty");
          // check for duplicate nmethod & rcvr map
          CountStub *oldcs= countStub();
          nmethod *oldnm= oldcs ? oldcs->target() : nmethod::findNMethod(addr);
          assert(   oldnm != nm
                 || receiverMapOop != oldnm->key.receiverMapOop(),
                 "already linked to this nmethod, why rebind?? (maybe I-cache did not get flushed)");
        }
      }
    # endif
    s= s->extend(this, nm, receiverMapOop);
    assert(s, "should have a PIC now");
    assert(dependency()->next == dependency()->prev, "more than one link");
  } else {
    // first time we execute this send, or PICs disabled, or perform, or
    // rebinding after a PIC has been removed, or non-map related misses
    if (isPerform) NumberOfPerformMisses++;
    if (!PIC) {
      CacheStub *s= pic();
      // remove existing PIC
      if (s) s->deallocate();
    }
    rebind(nm, 0, cs_from_pic);
  }
  MachineCache::flush_instruction_cache_for_debugging();
  if (VerifyZoneOften) verify();
}

// rebind the sendDesc to nm at addr, with cs_from_pic if non-NULL
void sendDesc::rebind(nmethod* nm, char* addr, CountStub *cs_from_pic) {
  if (VerifyZoneOften) {
    nm->linkedSends.verify_list_integrity();
    if (dependency()->next == 0  &&  dependency()->prev == 0)
      ; // not initted yet
    else
      verify();
  }
  if (addr == 0) addr= nm->entryPointFor(this);
  assert(pic() == 0, "shouldn't call");
  assert(nm->key.selector
         == static_or_dynamic_selector(nm->key.selector, nm->key.lookupType),
         "mismatched selector");
  nmethod* current= target();
  assert(   RecompilationInProgress
         || current != nm
         || nm->isYoung(),  // rebind to insert aging stub
         "why rebind?? (maybe I-cache did not get flushed)");

  if (nm->isDI() && countType() != NonCounting) {
    // turn off counting/comparing flag - cannot inline DI nmethods yet
    setCounting(NonCounting);
    assert(countType() == NonCounting, "oops");
  }
  CountStub *oldcs= countStub();
  assert(cs_from_pic == 0 || oldcs == 0,
         "got count stub from pic and count stub from sendDesc");

  if (cs_from_pic) {
    assert(   nm->isYoung() && cs_from_pic->isAgingStub()
           || isCounting()  && cs_from_pic->isCountStub(),
              "count stub from pic doesn't match send desc");
    set_jump_addr(cs_from_pic->insts());
    dependency()->rebind(&cs_from_pic->sdLink);
    cs_from_pic->set_callee((int32)addr);
  } else if (UseAgingStubs && nm->isYoung()) {
    // need to insert an aging stub
    if (oldcs) {
      oldcs->deallocate();
    } else if (current) {
      dependency()->remove();
    }
    CountStub *newcs= new AgingStub(nm, addr, dependency());
    set_jump_addr(newcs->insts());
  } else if (UseAgingStubs && oldcs) {
    // change target of existing count stub
    oldcs->rebind(nm, addr);
  } else if (UseAgingStubs && isCounting()) {
    // create count stub
    if (current) dependency()->remove();        // unlink current target
    CountStub *newcs = 
      CountStub::new_CountStub(nm, addr, dependency(), countType()); 
    set_jump_addr(newcs->insts());
  } else {
    // rebind inline cache
    set_jump_addr(addr);
    dependency()->rebind(&nm->linkedSends);
  }
  if (VerifyZoneOften) verify();
  MachineCache::flush_instruction_cache_for_debugging();
}

void sendDesc::unlink_nmethod() {
  dependency()->remove();
  reset_jump_addr();
  MachineCache::flush_instruction_cache_for_debugging();
}

void sendDesc::unlink_countStub(CountStub *stub) {
  assert(stub && stub == countStub(), "wrong stub");
  stub->deallocate();
  MachineCache::flush_instruction_cache_for_debugging();
  assert_unbound();
}

void sendDesc::unlink_pic(CacheStub *pic) {
  assert(pic && pic == this->pic(), "wrong pic");
  pic->deallocate();
  MachineCache::flush_instruction_cache_for_debugging();
  assert_unbound();
}

void sendDesc::unlink() {
  CacheStub* s= pic();
  if (s)
    unlink_pic(s);
  else {
    CountStub* cs= countStub();
    if (cs)
      unlink_countStub(cs);
    else
      unlink_nmethod();
  }
}

bool sendDesc::wasNeverExecuted() {
  // the "dirty bit" is used to distinguish sendDescs that are accidentally
  // empty (because of a flush) from sends that were never executed
  // (the former are "dirty", the latter clean)
  return jump_addr() == lookupRoutine() && !isDirty();
}

bool sendDesc::verify() {
  if (isPrimCall()) return true;
  LookupType l= lookupType();
  bool flag= checkLookupTypeAndEntryPoint();
  
  if (isPerformLookupType(l)) {
    if (arg_count() < 0 || arg_count() > 100) {
      error2("sendDesc %#lx arg count %ld is invalid", this, arg_count());
      flag = false;
    }
  } else {
    if (! oop(selector())->verify_oop()) {
      flag = false;
    } else if (! selector()->is_string()) {
      error1("sendDesc %#lx selector isn't a string", this);
      flag = false;
    }
    nmethod* nm = target();
    if (nm == 0) {
      CountStub* cs = countStub();
      if (cs) nm = cs->target();
    }
    if (nm == 0) {
      CacheStub* cs = pic();
      if (cs) {
        nm= cs->get_method(0);
        oop sel= nm->key.selector;
        for (fint i= 1; i < cs->arity(); ++i)
          if (cs->get_method(i)->key.selector != sel)
            error2("sendDesc %#lx: selector != PIC case %d selector",
                   this, i);
      }
    }
    if (nm && nm->key.selector != selector())
      error1("sendDesc %#lx: selector != target nmethod's selector", this);
  }
  if (l & DelegateeStaticBit) {
    if (! delegatee()->verify_oop()) {
      flag = false;
    } else if (baseLookupType(l) == DirectedResendLookupType &&
               ! delegatee()->is_string()) {
      error1("sendDesc %#lx delegatee isn't a string", this);
      flag = false;
    }
  }
  if (!dependency()->verify_list_integrity()) {
    lprintf("\tof sendDesc %#lx\n", this);
    flag = false;
  }
  if (pic()) {
    if (dependency()->next != dependency()->prev)
      error1("sendDesc %#lx: more than one elem in dependency chain", this);
    pic()->verify();
  } else {
    CountStub *cs= countStub();
    if (cs == 0) {
      if (isCounting() && jump_addr() != lookupRoutine())
        error1("sendDesc %#lx: doesn't have countStub but is counting", this);
    } else {
      if (!isCounting() && !cs->isAgingStub())
        error1("sendDesc %#lx: has countStub but is not counting", this);
      if (dependency()->next != dependency()->prev)
        error1("sendDesc %#lx: more than one elem in dependency chain", this);
      countStub()->verify2(0);
    }
  }
  return flag;
}


bool sendDesc::isPrimCall() {
  char *insts= jump_addr();
  bool b=    !Memory->code->contains(insts)
          && !Memory->code->stubs->contains(insts)
          && insts != lookupRoutine();
  if (b) assert(getPrimDescOfFirstInstruction(insts, true), "not a prim call");
  return b;
}

void sendDesc::print() {
  if (isPrimCall()) {
    PrimDesc *pd= getPrimDescOfFirstInstruction(jump_addr(), true);
    lprintf("primitive: %s\n", pd->name());
    return;
  } 
  printIndent();
  printLookupType(raw_lookupType());
  LookupType l= lookupType();
  if (isPerformLookupType(l)) {
    lprintf(": argc: %ld", arg_count());
  } else {
    lprintf(": selector: ");
    selector()->print_real_oop();
  }
  if (l & DelegateeStaticBit) {
    lprintf(": delegatee: ");
    delegatee()->print_real_oop();
  }
  Indent++;
  printIndent();
  lprintf("addr: %#lx", jump_addr());
  if (Memory->code->contains(jump_addr())) {
    lprintf(" (nmethod %#lx)", nmethod::findNMethod(jump_addr()));
  }
  lprintf("; mask: "); printMask(mask());
  lprintf("\n");
  printIndent();
  lprintf("dependency: ");
  dependency()->print();
  lprintf("\n");
  if (pic()) {
    printIndent();
    lprintf("PIC: p ((CacheStub*)%#lx)->print()\n", pic());
  }
  if (countStub()) {
    printIndent();
    lprintf("count stub: p ((CountStub*)%#lx)->print()\n",
            countStub());
  }
  Indent --;
}

fint sendDesc::endOffset(LookupType l) {
  fint offset =  normal_sendDesc_end_offset;
  if (needsDelegatee(l) && (l & DelegateeStaticBit)) {
    // add space for delegatee word
    offset += sizeof(oop);
  }
  return offset;
}

void sendDesc::link(CacheStub* s) {
  set_jump_addr(s->insts());
  assert(dependency()->isEmpty(), "not empty");
  dependency()->add(&s->cacheLink);
  MachineCache::flush_instruction_cache_for_debugging();
}

CacheStub* sendDesc::pic() {
  char* addr = jump_addr();
  if (Memory->code->contains(addr)) {
    // linked to a nmethod
    return 0;
  } else if (Memory->code->stubs->contains(addr)) {
    NCodeBase* stub = findStub(addr);
    return stub->isCacheStub() ? (CacheStub*)stub : 0;
  } else {
    return 0;
  }
}

CountStub* sendDesc::countStub() {
  char* addr= jump_addr();
  if (Memory->code->contains(addr)) {
    // linked to a nmethod
    assert(!Memory->code->stubs->contains(addr), "zones overlap");
    return 0;
  } else if (Memory->code->stubs->contains(addr)) {
    NCodeBase* stub = findStub(addr);
    return stub->isCountStub() ? (CountStub*)stub : 0;
  } else {
    return 0;
  }
}
  
nmethod* sendDesc::target() {
  char* addr = jump_addr();
  return Memory->code->contains(addr) ? nmethod_from_insts(addr) : 0;
} 

// NB: get_method() is not quite equivalent to target(): the former returns
// an nmethod even when it is called via a count stub, the latter returns
// 0 in this case.
// It can also be called on dummy sendDescs representing glue code
nmethod* sendDesc::get_method() {
  char *addr= jump_addr();
  if (Memory->code->contains(addr)) return nmethod_from_insts(addr);
  if (!Memory->code->stubs->contains(addr)) return 0;
  NCodeBase *n= findStub(addr);
  assert(n->isCountStub(), "shouldn't call on PICs");
  return ((CountStub*)n)->target();
}

fint sendDesc::ntargets() {
  char *addr= jump_addr();
  if (addr == lookupRoutine()) return 0;
  if (Memory->code->contains(addr)) return 1;
  assert(Memory->code->stubs->contains(addr), "what is it?");
  NCodeBase *n= findStub(addr);
  return n->isCountStub() ? 1 : ((CacheStub*)n)->arity();
} 

fint sendDesc::nsends() {
  CacheStub* s = pic();
  CountStub* cs;
  fint n = 0;
  if (s) {
    for (fint i = s->arity() - 1; i >= 0; i--) {
      cs = s->countStub(i);
      if (cs) {
        n += cs->count();
      } else {
        // this one doesn't have a count stub
      }
    }
  } else if ((cs = countStub()) != 0) {
    n = cs->count();
  }
  return n;
} 

sendDesc* sendDesc::sendDesc_from_nmln(nmln* l) {
  sendDesc* sd = (sendDesc*) (((char*)l) - depend_offset);
  assert(Memory->code->contains(sd), "not in zone");
  return sd;
}

// Test the size of the assembler generated sendDesc in 
// EnterSelf (<machine>.runtime.s). Lars July 92
void sendDesc::init() {
  sendDesc::init_platform();
  sendDesc* f = sendDesc::first_sendDesc();

  // cannot do this test on sparc, it has a register-call which does not read as a call
  // if (!isCall((int32*)f->jump_addr_addr()))
  //  fatal("first_sendDesc() does not have a call");
  
  if (f->raw_lookupType() != StaticNormalLookupType)
    fatal5("first_sendDesc() has wrong lookup type is: 0x%x, should be: 0x%x\n"
            "  firstSelfFrame_returnPC: 0x%x,  first_inst_addr:  0x%x, first_sendDesc 0x%x",
            f->raw_lookupType(), StaticNormalLookupType,
            firstSelfFrame_returnPC, 
            first_inst_addr((void*)firstSelfFrame_returnPC), 
            sendDesc::first_sendDesc());

  char* computedEnd = (char*) f + f->endOffset();
  char* realEnd     = first_inst_addr((void*)firstSelfFrameSendDescEnd);
  if (computedEnd != realEnd)
    fatal2("sendDesc of firstSelfFrame has wrong size, "
           "computedEnd = 0x%x, realEnd = 0x%x", computedEnd, realEnd);
}


// called from asm stubs called from empty inline caches:
char* SendMessage(sendDesc* sd, frame* lookupFrame, oop receiver,
                  oop perform_selector, oop perform_delegatee, oop arg1) {
                  
  assert(lookupFrame->is_aligned(), "alignment");

  return sd->sendMessage(lookupFrame,
                         receiver,
                         perform_selector,
                         perform_delegatee,
                         arg1);
}


void sendDesc::sendMessagePrologue( oop  receiver, frame* lookupFrame ) {
                                   
  NumberOfLookups++;

  assert(receiver != Memory->deadBlockObj, "should have created real block");
  assert(Byte_Map_Base() == Memory->remembered_set->byte_map_base(),
         "byte map base reg corrupted");
  assert(!processSemaphore, "processSemaphore shouldn't be set");

  if (SilentTrace)
    LOG_EVENT3("sendDesc::sendMessage %#lx %#lx %#lx",
               this,
               receiver,
               lookupFrame);
}


static nmethod* SendMessage_cont( compilingLookup* L) {
  if ( Interpret ) {
    L->perform_full_lookup();
    return 0;
  }
  return L->send_desc()->lookup_compile_and_backpatch(L);
}


char* sendDesc::sendMessage( frame* lookupFrame,
                             oop receiver,
                             oop perform_selector,
                             oop perform_delegatee,
                             oop arg1 ) {
  ShowLookupInMonitor sl;

  LookupType type= lookupType();

  oop sel = static_or_dynamic_selector(  perform_selector,  type);
  oop del = static_or_dynamic_delegatee( perform_delegatee, type);

  sendMessagePrologue( receiver, lookupFrame );

  if ( !Trace) {
    // try codeTable first (order of magnitude faster)
  
    char* r = fastCacheLookupAndBackpatch(type,
                                          receiver->map()->enclosing_mapOop(),
                                          sel,
                                          del);
    if (r) {
      if (SilentTrace) LOG_EVENT1("SendMessage: fast-found %#lx", r);
      return r;
    }
  }

  // have to do it the slow way
  ResourceMark m;
  FlushRegisterWindows(); // for vframe conversion below
  cacheProbingLookup L( receiver,
                        sel,
                        del,
                        MH_TBD,  // method holder
                        new_vframe(lookupFrame),
                        this,
                        0,    // DIDesc
                        false ); // don't want a debug version

  // should we have switched stacks sooner? (dmu) also in SendDIMessage
  
  nmethod* nm = switchToVMStack( SendMessage_cont, &L );
  if (SilentTrace) LOG_EVENT1("sendDesc::sendMessage: found %#lx", nm);

  return
    Interpret
    ? L.interpretResultForCompiledSender(arg1)
    : nm->verifiedEntryPoint();
}



char* sendDesc::fastCacheLookupAndBackpatch( LookupType t,
                                             mapOop receiverMapOop,
                                             oop sel,
                                             oop del ) {
  if (needsDelegatee(t) || isResendLookupType(t) || isPerformLookupType(t)) {
    // too complicated to short-circuit these lookups
    return 0;
  }
  // try mh-independent 
  MethodLookupKey key(t, MH_TBD, receiverMapOop, sel, del);
  nmethod* nm= Memory->code->lookup(key);
  
  if (nm == 0) {
    NumberOfFastLookupMisses++;
    return 0;
  }
  NumberOfFastLookupHits++;

  if (nm->needToRecompileFor(this))
    return 0;

  if (InlineCache) {
    NumberOfICMisses++;
    extend(nm, receiverMapOop, 0);
  }
  return nm->verifiedEntryPoint();
}


nmethod* sendDesc::lookup_compile_and_backpatch( compilingLookup* L ) {

  nmethod* nm= L->lookupNMethod();
  
  assert(zone::frame_chain_nesting == 0 || recompilee != 0,
         "should not be nested");
  
  if (InlineCache &&
      (InlineCacheNonStatic || L->isReceiverStatic())) {
    // add to PIC
    extend(nm, L->receiverMapOop(), 0);
    NumberOfICMisses++;
  }
  return nm;
}

# else // defined(FAST_COMPILER) || defined(SIC_COMPILER)
  void sendDesc::init() { }
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
