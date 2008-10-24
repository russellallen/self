/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// These clever little guys are used in many places in nmethods.
// They implement doubly-linked circular lists.
// Someday, we may replace them with singly linked lists, it will save space
// and cost deletion time.
// They always point to themselves--into the middle of maps and nmethods.
// They are used to point from map slotDesc's to all the nmethods that depend
// on the map.  Also, the pointer from an nmethod to all the inline cache
// slots that are linked to this nmethod.
// Also each code table bucket is the head of a list of nmethods
// that hash to that bucket.
// Finally, all nmethods containing young objects are linked together on
// another such list for scavenging.

# define nullNMln ((nmln*)NULL)

extern "C" {
  void initNmlnCache();
  void resetNmlnCache();
}

# define FOR_EACH_NMLN(startExpr, elem, code)                                 \
    nmln* CONC(elem,__start__) = (startExpr);                                 \
    nmln* elem = CONC(elem,__start__);                                        \
    do { code; elem = elem->next;} while (elem != CONC(elem,__start__));

class nmln {

 public:
  nmln* next;
  nmln* prev;

  void check_alignment() { assert( (int32(this) & Tag_Mask) == Int_Tag, "nmln alignment"); }  
  
  void init() { next = this; prev = this; }
  
  nmln() { init(); }
  
  bool isEmpty() { return next == this; }
  bool notEmpty() { return ! isEmpty(); }

  fint length();

  bool isMovedEmpty() { return next->next == next; }
  
  void remove() {
    // splice me out of my chain
#if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions  &&  this == (nmln*)catchThisOne) breakpoint();
#endif
    if (notEmpty()) { next->prev = prev; prev->next = next; init(); } }
  
  void add(nmln* p) {
    // add empty argument nmln after me in my chain
    // C++ won't inline this next assertion correctly (augh!)
    // assert(this != p,  "adding a nmln to itself!");
    assert(p->isEmpty(),  "adding a nonempty nmln!");
    p->next = next;
    p->prev = this;
    next->prev = p;
    next = p; }

  
  void rebind(nmln* p) {
    // splice me out of my chain and add to argument's chain
    assert(p, "should exist");
    if (this != p) {
      // splice me out of my chain
      next->prev = prev;
      prev->next = next;
      // add me to argument's chain
      next = p->next;
      prev = p;
      p->next->prev = this;
      p->next = this;
    } }
  
  void insert() {
    // create a new dependency after copying an old one (i.e. cloning a map)
    if (isMovedEmpty()) {
      // must have been empty
      init();
    } else {
      next->prev = this;
      prev->next->next = this;
      prev = prev->next;
    } }
  
  void relocate() {
    // update neighboring dependendencies after being moved
    // (i.e. creating an nmethod and after reading a snapshot)
    if (isMovedEmpty()) {
      // must have been empty
      init();
    } else {
      next->prev = this;
      prev->next = this;
    } }
  
  void forward(int32 diff) {
    // update dependendencies after being forwarded (i.e. scavenging maps)
    *this = *((nmln*) ((char*) this - diff));
    relocate(); }
  
  void shift(int32 diff) {
    // update dependencies before being moved (i.e. nmethod compaction)
    if (diff) {
      if (isEmpty()) {
        // an empty list; shift myself
        next = (nmln*) ((char*) next + diff);
        prev = (nmln*) ((char*) prev + diff);
      } else {
        // shift next-door neighbors
        prev->next = (nmln*) ((char*) prev->next + diff);
        next->prev = (nmln*) ((char*) next->prev + diff);
      }
    }
  }
  
  // update dependendencies before being compacted
  void shift(int32 diff, NCodeBase* m);
  
  void init(nmln* p) {
    // create a new nmln, and add empty argument nmln to me (create 2-loop)
    if (p) {
      assert(p->isEmpty(), "should be empty");
      // make argument point to me, and me point to argument
      next = p;
      prev = p;
      p->next = this;
      p->prev = this;
    } else {
      // initialize
      next = this;
      prev = this;
    } }
  
  void init_chain();

  void flush();
  void invalidate();
  
  bool verify_list_integrity();
  bool verify_map_deps() { return verify_list_integrity(); }
  
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)  

  CacheStub* asCacheStub();        // NULL if not in a cache stub
  CountStub* asCountStub();        // NULL if not in a count stub
  sendDesc* asSendDesc_or_null();  // NULL if not in a sendDesc
  sendDesc* asSendDesc();          // fatal error if not in a sendDesc
  sendDesc* callingSendDesc();     // calling sendDesc (possibly transitively)
  DIDesc* asDIDesc();
  nmethod* asSender();             // sending nmethod 
  
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)  

  inline int32 hash();                  // for verify
  void print();
};


