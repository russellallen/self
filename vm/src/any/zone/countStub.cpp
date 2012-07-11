/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "countStub_abstract.hh"
# pragma implementation "countStub.hh"
# include "_countStub.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

int32* sendCounts;      // counter array
fint nsendCounts;       // size of counter array


void shiftCounts(int32 delta) {
  // shift all count addresses by delta
  FOR_ALL_STUBS(s) {
    if (s->isCountStub()) ((CountStub*)s)->shift_count_addr(delta);
  }
  sendCounts = sendCounts + delta / sizeof(int32);
}

void countStub1_init() {
  ResourceMark rm;
  CountStub::pattern[NonCounting] = 0;     // invalid pattern
  CountStub::pattern[Counting] = new CountCodePattern(Counting);
  CountStub::pattern[Comparing] = new CountCodePattern(Comparing);
  AgingStub::initPattern();
}

void countStub2_init() {
  ResourceMark rm;
  if (CountStub::idManager == 0 || !okToUseCodeFromSnapshot) {
    fint size1 = sizeof(CountStub) + CountStub::pattern[Counting]->instsSize;
    fint size2 = sizeof(CountStub) + CountStub::pattern[Comparing]->instsSize;
    nsendCounts = Memory->code->stubs->zone()->capacity() / size1;
    CountStub::idManager = new IDManager(nsendCounts, shiftCounts, CountStubIDStart);
    sendCounts = CountStub::idManager->data;
    fint blockSize = Memory->code->stubs->zone()->blockSize;
    fint frag1 = (100 * size1 % blockSize) / blockSize;
    fint frag2 = (100 * size2 % blockSize) / blockSize;
    const fint fragLimit = 20;
    if (frag1 >= fragLimit || frag2 >= fragLimit)
      warning2("bad count stub blocksize: %ld%%/%ld%% int. fragmentation",
               frag1, frag2);
  }
}


void CountStub::read_snapshot(FILE *f)
{
  assert(SnapshotCode, "otherwise shouldn't call");
  IDManager *idm= new IDManager(f, CountStubIDStart);
  if (okToUseCodeFromSnapshot) {
    idManager= idm;
    nsendCounts= idManager->n;
    sendCounts= idManager->data;
  }
}

void CountStub::write_snapshot(FILE *f)
{
  idManager->write_snapshot(f);
}


VtblPtr_t    CountingStub::_vtbl_value;
VtblPtr_t   ComparingStub::_vtbl_value;
VtblPtr_t       AgingStub::_vtbl_value;

int32 AgingStub::add_inst = 0;
CountCodePattern* CountStub::pattern[Comparing + 1];
IDManager* CountStub::idManager = 0;

void* CountingStub::operator new(size_t size) {
  int32 newSize = size + CountStub::pattern[Counting]->instsSize;
  return Memory->code->stubs->allocate(newSize);
}

void* ComparingStub::operator new(size_t size) {
  int32 newSize = size + CountStub::pattern[Comparing]->instsSize;
  return Memory->code->stubs->allocate(newSize);
}

// see comment in cacheStub.c for missing operator delete


nmethod* CountStub::sender() {
  return nmethod::findNMethod(sender_sendDesc()); 
}

void CountStub::shift_count_addr(int32 delta) {
  CountCodePattern* patt = CountStub::pattern[countType()];
  set_count_addr(patt, count_addr(patt) + delta);
}

fint CountStub::id() {
  return (int32*)count_addr(pattern[countType()]) - idManager->data;
}

CountStub* CountStub::new_CountStub(nmethod* target, pc_t entry,
                                    nmln* sd_nmln, CountType t){
  CountStub* s;
  switch (t) {
   case Counting:   s = new CountingStub(target, entry, sd_nmln);
                    break;
   case Comparing:  s = new ComparingStub(target, entry, sd_nmln);
                    break;
   default:         fatal1("invalid count type %ld", t);
  }
  // NB: init is here (not in constructor) to get dynamic dispatch...sigh
  s->init(target);
# if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions  &&  s == (CountStub*)catchThisOne) warning("caught count stub");
# endif
  if (PrintCountStub) {
    lprintf("*creating "); s->print();
  }
  if (CountStub::idManager->isNearlyFull()) {
    CountStub::idManager->grow();
    if (PrintCountStub) {
      lprintf("*growing count ID table;"); CountStub::idManager->print();
    }
    // NB: it would be cleaner to grow the table automatically, but this
    // doesn't work because the id table overflows during the count stub
    // constructor, i.e. there is a count stub in the zone that is only
    // partially initialized, and thus we can't iterate through the zone
    // to change all counter addresses at that point.
  }
  s->set_count(1);
  return s;
}
  
CountStub::CountStub(nmethod* target, pc_t entryPoint,
                     nmln* sd_nmln, CountCodePattern* patt) {
  _instsLen = patt->instsSize;
  fint id = idManager->newID();
  sendCounts[id] = 0;
  copy_bytes(patt->pattern, insts(), _instsLen);
  set_count_addr(patt, (int32)&sendCounts[id]);
  set_callee(patt, (int32)entryPoint);
  MachineCache::flush_instruction_cache_range(insts(), insts() + patt->instsSize);
  MachineCache::flush_instruction_cache_for_debugging();
  if (sd_nmln) initSendDesc(sd_nmln);
  nmLink.init();
  nmLink.rebind(&target->linkedSends);
};

CountingStub::CountingStub(nmethod* nm, pc_t ep, nmln* sd_nmln)
  : CountStub(nm, ep, sd_nmln, CountStub::pattern[Counting]) {
  CHECK_VTBL_VALUE;
}

ComparingStub::ComparingStub(nmethod* nm, pc_t ep, nmln* sd_nmln)
  : CountStub(nm, ep, sd_nmln, CountStub::pattern[Comparing]) {
  CHECK_VTBL_VALUE;
}

AgingStub::AgingStub(nmethod* nm, pc_t ep, nmln* sd_nmln)
  : ComparingStub(nm, ep, sd_nmln) {
  CHECK_VTBL_VALUE;
# if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions  &&  this == (AgingStub*)catchThisOne) warning("caught aging stub");
# endif
  init(nm);     // must init here -- not called from new_CountStub
  if (PrintCountStub) {
    lprintf("*creating AgingStub %#lx, nm %#lx\n",
           (long unsigned)this, (long unsigned)nm);
  }
}

void CountStub::initSendDesc(nmln* sd_nmln) {
  assert(sd_nmln->isEmpty(), "should be empty");
  sdLink.init(sd_nmln);
}


// unlink the sdLink and reset jump addr if called from sendDesc
void CountStub::unlinkFromSendDesc() {
  sendDesc* sd = this->sd();
  if (sd) sd->reset_jump_addr();
  sdLink.remove();
}


void CountStub::forwardLinkedSend(nmln* l, nmethod* to)  {
  UsedOnlyInAssert(l);
  assert(l == &nmLink, "wrong link");
  if (to->isYoung()) {
    rebind(to);
    return;
  }
  // must unlink this stub, because target is now old
  sendDesc *sd= this->sd();
  if (sd) {
    sd->setCounting(NonCounting);
    sd->rebind(to);
  } else {
    CacheStub *pic= this->pic();
    assert(pic, "must have a sendDesc or a pic");
    pic->rebind(sdLink.next, to, 0);
  }
  deallocate();
}


// rebind: change target to new nmethod
void CountStub::rebind(nmethod* nm, pc_t entryPoint) {
  if (entryPoint == 0) entryPoint= nm->entryPointFor(sender_sendDesc());
  nmLink.rebind(&nm->linkedSends);
  set_callee((int32)entryPoint);
}

// change entry point as caller has changed (sendDesc to pic)
void CountStub::setVerifiedEntryPoint(nmethod *nmHint) {
  assert(nmHint == 0 || nmHint == target(), "wrong hint");
  nmethod *nm= nmHint ? nmHint : target();
  char *entryPoint= nm->verifiedEntryPoint();
  set_callee((int32)entryPoint);
}

void CountStub::moveTo_inner(NCodeBase* p, int32 delta, int32 /* size */ ) {
  CountStub* to= (CountStub*)p;
  sendDesc* sd= this->sd();
  if (sd) {
    sd->shift_jump_addr(delta);
  } else {
    pic()->shift_target(sdLink.next, delta);
  }
  sdLink.shift(delta);
  nmLink.shift(delta);
}

void CountStub::shift_target(nmln* l, int32 delta) {
  assert(l == &nmLink, "wrong link");  UsedOnlyInAssert(l);
  set_callee(int32(jump_addr() + delta));
  MachineCache::flush_instruction_cache_for_debugging();
}

NCodeBase* CountStub::unlink_me(nmln* l) {
# if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions  &&  this == (CountStub*)catchThisOne) warning("caught count stub");
# endif
  assert(l == &nmLink, "wrong link");
  UsedOnlyInAssert(l);
  CacheStub* s = pic();
  if (s) {
    s->unlink_me(sdLink.next);
  } else {
    sd()->unlink_countStub(this);
  }
  return 0;
}

  
void CountStub::deallocate() {
# if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions  &&  this == (CountStub*)catchThisOne) warning("caught count stub");
# endif
  if (PrintCountStub) {
    lprintf("*deallocating "); print();
  }
  sendDesc* sd = this->sd();
  sdLink.remove();
  nmLink.remove();
  idManager->freeID(id());
  fint s = size();
  kill_vtbl_value();        // to make isCountStub fail on me
  Memory->code->stubs->deallocate(this, s);
  if (sd) sd->reset_jump_addr();
}

fint CountingStub::size() {
  return sizeof(CountStub) + CountStub::pattern[Counting]->instsSize; }
fint ComparingStub::size() {
  return sizeof(CountStub) + CountStub::pattern[Comparing]->instsSize; }

void CountStub::print() {
  lprintf("p (%s*)%#lx (%ld): nm %#lx, sd %#lx, count %ld\n",
         name(), this, long(id()), target(),
         sd(), sendCounts[id()]);
}

nmethod* CountStub::target() { return nmethod::findNMethod(jump_addr()); }

sendDesc* CountStub::sd() {
  if (Memory->code->contains(sdLink.next)) {
    return sendDesc::sendDesc_from_nmln(sdLink.next);
  } else {
    return 0;
  }
}

CacheStub* CountStub::pic() {
  if (Memory->code->contains(sdLink.next)) {
    return 0;
  } else {
    assert(sdLink.notEmpty(), "not linked to anything");
    return findCacheStub(sdLink.next);
  }
}

int32 CountStub::count() { return sendCounts[id()]; }
void CountStub::set_count(int32 count) { sendCounts[id()] = count; }

bool CountStub::verify2(CacheStub *calling_pic) {
  bool r = true;
  if (sdLink.length() != 2) {
    error1("CountStub %#lx: # of elements in sdLink not 2", this);
    r = false;
  }
  if (nmLink.isEmpty()) {
    error1("CountStub %#lx: not linked to any nmethod", this);
    r = false;
  }
  if (count() < 0) {
    error1("CountStub %#lx: sendCount is negative", this);
    r = false;
  }
  if (pic() != calling_pic) {
    error3("CountStub %#lx: error in PIC ref %#lx (should be %#lx)",
           this, calling_pic, pic());
    r = false;
  }
  sendDesc *s= calling_pic ? calling_pic->sd() : sd();
  if (!s->checkLookupTypeAndEntryPoint(target(), jump_addr())) {
    error2("CountStub %#lx: wrong lookup type or entry point", this, target());
    r = false;
  }
  return r;
}

bool CountStub::isCountStub(void* p) {
  VtblPtr_t vtbl = ((NCodeBase*)p)->vtbl_value();
  return vtbl == (( CountingStub*)0)->static_vtbl_value() ||
         vtbl == ((ComparingStub*)0)->static_vtbl_value() ||
         vtbl == ((    AgingStub*)0)->static_vtbl_value();
}

# if  GENERATE_DEBUGGING_AIDS
CountStub* findCountStub(void* addr) {
  NCodeBase* s = findThing(addr);
  assert(s->isCountStub(), "expecting a count stub");
  return (CountStub*)s;
}
#endif

IDManager::IDManager(fint N, IDOverflowHandler handler, caddr_t desiredAddress) {
  n = N; growHandler = handler;
  int size= N * sizeof(int32);
  data= (int32*)OS::allocate_idealized_page_aligned(size, "ID manager data", desiredAddress);
  init();
}

static char id_manager_delim[] = "\n\f\nan ID manager\n\f\n!%n";

IDManager::IDManager(FILE* f, caddr_t desiredAddress) {
  // return ID manager stored in snapshot
  check_delim(f, id_manager_delim);
  assert(SnapshotCode, "shouldn't call");
  OS::FRead_swap(this, sizeof(IDManager), f);
  growHandler= shiftCounts;
  int32 *old_data= data;
  int orig_size= n * sizeof(int32);
  int size= orig_size;
  if (okToUseCodeFromSnapshot) {
    data= (int32*)OS::allocate_idealized_page_aligned(size, "ID manager data", desiredAddress);
  }
  OS::read_or_seek(data, orig_size, f);
  if (okToUseCodeFromSnapshot && data != old_data)
    shiftCounts((char*)data - (char*)old_data);
}

IDManager::~IDManager() { selfs_free(data); }

void IDManager::init() {
  // free list: firstFree keeps first free index, data[firstFree] keeps index
  // of next free element, etc.
  firstFree = usedIDs = 0;
  for (fint i = 0; i < n; i++) data[i] = i + 1;
}

fint IDManager::newID() {
  fint id = firstFree;
  if (id >= n - 2) grow();
  firstFree = data[firstFree];
  usedIDs++;
  return id;
}

void IDManager::grow() {
  // the table is full; double its size
  LOG_EVENT2("growing IDManager %ld to %ld ids", this, n * 2);
  int32* newData = (int32*)AllocateHeap(2 * n * sizeof(int32),
                                        "IDManager table");
  copy_words(data, newData, n);
  for (fint i = n; i < 2 * n; i++) newData[i] = i + 1;
  int32 delta = (char*)newData - (char*)data;
  growHandler(delta);
  n *= 2;
  selfs_free(data);
  data = newData;
}

fint IDManager::peekID() {
  return firstFree;
}

void IDManager::freeID(fint id) {
  assert(id >= 0 && id < n && id != firstFree, "invalid ID");
  data[id] = firstFree;
  firstFree = id;
  usedIDs--;
  assert(usedIDs >= 0, "freed too many IDs");
}

void IDManager::print() {
  lprintf("IDManager %#lx: capacity %ld (%ld used)\n",
         this, n, usedIDs);
}

void IDManager::write_snapshot(FILE* f) {
  write_delim(f, id_manager_delim);
  OS::FWrite(this, sizeof(IDManager), f);
  OS::FWrite(data, n * sizeof(int32), f);
}

fint IDManager::read_snapshot(FILE* f) {
  // return ID manager stored in snapshot
  assert(SnapshotCode, "shouldn't call");
  check_delim(f, id_manager_delim);
  IDManager* idm = NEW_RESOURCE_OBJ(IDManager);
  // hack - don't call new to avoid executing constructor
  OS::FRead_swap(idm, sizeof(IDManager), f);

  if (   okToUseCodeFromSnapshot
      && (n != idm->n || data != idm->data))
    noCodeWarning("because of an address configuration mismatch");

  OS::read_or_seek(data, idm->n * sizeof(int32), f);
  if (okToUseCodeFromSnapshot) {
    usedIDs = idm->usedIDs;
    firstFree = idm->firstFree;
  }
  return idm->n;
}

bool IDManager::verify() {
  bool r = true;
  ResourceMark rm;
  fint prev = -1;
  bool* check = NEW_RESOURCE_ARRAY(bool, n);
  for (fint i = 0; i < n; i++) check[i] = false;
  fint id= firstFree;
  for (fint j = 0; j < n - usedIDs; id = data[id], j++) {
    if (id < 0 || id >= n) {
      error2("IDManager: invalid ID %ld in free list (#%ld)\n", id, j);
      r = false;
    }
    if (check[id]) {
      error2("IDManager: loop with ID %ld in free list (#%ld)\n", id, j);
      r = false;
    }
    check[id] = true;
    prev = id;
  }
  if (id != n) {
    error2("IDManager: wrong free list length, last = %ld, prev = %ld\n",
           id, prev);
    r = false;
  }
  return r;
}

// used only by broken code below
#ifdef UNUSED
static void insertCounter(nmethod* nm) {
  for (addrDesc *l = nm->locs(), *lend = nm->locsEnd(); l < lend; l++) {
    if (l->isSendDesc()) {
      l->asSendDesc(nm)->insertCounter();
      if (Memory->code->stubs->needsWork) Memory->code->stubs->cleanup();
    }
  }
}
  
static void removeCounter(nmethod* nm) {
  for (addrDesc *l = nm->locs(), *lend = nm->locsEnd(); l < lend; l++) {
    if (l->isSendDesc()) {
      l->asSendDesc(nm)->removeCounter();
    }
  }
}
#endif

# else  // defined(FAST_COMPILER) || defined(SIC_COMPILER)

void countStub1_init() {}
void countStub2_init() {}

# endif  // defined(FAST_COMPILER) || defined(SIC_COMPILER)

// needed for primitive either way:
  
void setCountSends(bool newFlag) {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
    if (CountSends == newFlag) return;
    CountSends = newFlag;
#   ifdef broken
      // not fully debugged -- Urs 12/93
      if (newFlag) {
        Memory->code->nmethods_do(insertCounter);
      } else {
        Memory->code->nmethods_do(removeCounter);
      }
#   endif
# else
    Unused(newFlag);
# endif
}
