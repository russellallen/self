/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "codeTable.hh"
# include "_codeTable.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


codeTableEntry::codeTableEntry(nmethod *n, MethodLookupKey *k) {
  nm= n;
  key.set_from(*k);
  next_nm= n->codeTableLink;
  n->codeTableLink= this;
}


codeTable::codeTable(int32 size) {
  tableSize = size;
  buckets = NEW_C_HEAP_ARRAY(nmln, size);
  clear();
}

void codeTable::clear() {
  for (nmln* p = buckets;  p < &buckets[tableSize];  ++p)
    p->init();
}


static inline codeTableEntry *entryForLink(nmln *n) {
  static codeTableEntry* shutUpCompiler = NULL;
  static const pc_t next_hash_offset =
      (pc_t)&shutUpCompiler->next_hash ;

  return (codeTableEntry*)((pc_t)n - next_hash_offset); }


nmethod* codeTable::lookup(MethodLookupKey &k) {
  nmln* bucket = bucketFor(k.hash());
  for (nmln* p = bucket->next;  p != bucket;  p = p->next) {
    codeTableEntry *e= entryForLink(p);
    if (e->key.EQ(k)) {
      return e->nm;
    }
  }
  return NULL;
}


void codeTable::add(nmethod* nm, MethodLookupKey* k) {
  if (k == NULL) k= &nm->key;
  k->init_hash();
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      if (nm == (nmethod*)catchThisOne) warning("caught nmethod");
      if ( nm->isDebug() && this == Memory->code->table) warning("wrong table");
      if (!nm->isDebug() && this != Memory->code->table) warning("wrong table");
      if (lookup(*k)) {
        k->print();
        fatal2("adding duplicate key to code table: %#lx and new %#lx",
               lookup(*k), nm);
      }
    }
# endif
  nmln* b = bucketFor(k->hash());
  codeTableEntry *e= new codeTableEntry(nm, k);
  if (e->key.is_new()) nm->remember();
  b->add(&e->next_hash);
}


bool codeTable::verify() {
  bool flag = true;
  for (nmln* p = buckets;  p < &buckets[tableSize];  ++p) {
    flag = flag && p->verify_list_integrity();
    for (nmln* q = p->next;  q != p;  q = q->next) {
      codeTableEntry *e= entryForLink(q);
      nmethod* nm= e->nm;
      if (!isNMethod(nm)) {
        error2("bad nmethod 0x%lx in bucket 0x%lx", nm, p);
        flag = false;
      }
      if (bucketFor(e->key.hash()) != p) {
        error2("code table entry 0x%lx not in bucket 0x%lx", e, p);
        flag = false;
      }
    }
  }
  return flag;
}

# if  GENERATE_DEBUGGING_AIDS
void codeTable::print_stats() {
  fint nmin = 9999999, nmax = 0, total = 0, nonzero = 0;
  const fint N = 10;
  fint histo[N];
  fint i;
  for (i = 0; i < N; i++) histo[i] = 0;
  for (nmln* p = buckets;  p < &buckets[tableSize];  ++p) {
    fint len = 0;
    for (nmln* q = p->next;  q != p;  q = q->next) len++;
    if (len < nmin) nmin = len;
    if (len > nmax) nmax = len;
    if (len) nonzero++;
    total += len;
    histo[min(len, N-1)]++;
  }
  float avg = float(total) / nonzero;
  
  lprintf("\ncodeTable statistics: %d nmethods; min chain = %d, max = %d, avg = %4.1f\n",
          (void*)total, (void*)nmin, (void*)nmax,
          *(void**)&avg);
  lprintf("histogram:\n", 0);
  for (i = 0; i < N - 1; i++) lprintf("%4d:\t%d", (void*)i, (void*)histo[i]);
  lprintf(">=%d:\t%d\n", (void*)(N-1), (void*)histo[N-1]);
}
#endif

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
