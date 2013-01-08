/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// the code table is used to find nmethods.
// It is a hash table, where each bucket is the head of a list of nmethods.

const int32 codeTableSize  = nthBit(13);
const int32 debugTableSize = nthBit(8);


class codeTableEntry: public CHeapObj {
public:
  nmln next_hash;  // entries with the same hash
  codeTableEntry *next_nm;  // entries with the same nmethod
  NMethodLookupKey key;
  nmethod *nm;

  codeTableEntry(nmethod *nm, MethodLookupKey *k);
};


class codeTable: CHeapObj {
  int32 tableSize;
  nmln* buckets; // to codeTableEntries with the same hash

  nmln* bucketFor(int32 hash) {
    return &buckets[hash & (tableSize - 1)]; }
  
 public:
  codeTable(int32 size);
  
  void clear();
  nmethod* lookup(MethodLookupKey &k);
  bool verify();
# if  GENERATE_DEBUGGING_AIDS
  void print_stats();
# endif
  bool contains(void* p) {
    return p >= (void*)&buckets[0]
    &&     p <  (void*)&buckets[tableSize]; }
 protected:
  // should always add through zone->addToCodeTable()
  void add(nmethod* nm, MethodLookupKey *k = 0);
  friend class zone;
};


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
