/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



// A CountStub can be inserted between caller and callee nmethods to keep
// track of how often the call is executed.  All it does is increment a
// counter and then jump to the nmethod.

extern int32* sendCounts;       // counter array
extern fint nsendCounts;        // size of counter array

class CountCodePattern; // instruction pattern for stub
  
class CountStub : public NCodeBase {
 protected:
         // shouldn't call this except via constructors in subclasses
  CountStub(float /* unLikelyToCallByAccident */) {} 
  static CountCodePattern* pattern[Comparing + 1];
  static IDManager* idManager;
  nmln sdLink;                  // link to calling sendDesc/PIC
  nmln nmLink;                  // link to called nmethod

  CountStub(nmethod* target, pc_t entryPoint, nmln* sd_nmln,
            CountCodePattern* pattern);
 public:
  // convention: the calling sd/PIC is responsible for maintaining the
  // call/jump to the count stub, except for deallocate (resets
  // sendDesc jump addr)
  static CountStub* new_CountStub(nmethod* target, pc_t entryPoint,
                                  nmln* sd_nmln, CountType t);
  friend class nmethod;
  friend class sendDesc;
  void deallocate();
  bool isCountStub()            { return true; }
  virtual CountType countType() = 0;
  pc_t insts()                 { return (pc_t)(this + 1); }
  fint id();
  int32 count();
  void set_count(int32 count);
  nmethod* target();
  sendDesc* sender_sendDesc() {
    sendDesc *s= sd();  return s ? s : pic()->sd(); }
  nmethod* sender() {           // sending nmethod
    return nmethod::findNMethod(sender_sendDesc()); }
  sendDesc* sd();               // calling sendDesc (NULL if PIC)
  CacheStub* pic();             // calling PIC (NULL if sendDesc)
  virtual void moveTo_inner(NCodeBase* to, int32 delta, int32 size);
  void shift_target(nmln* l, int32 delta);
  void shift_count_addr(int32 delta);
  NCodeBase* unlink_me(nmln* l);
  void forwardLinkedSend(nmln* l, nmethod* to);
  void rebind(nmethod* nm, pc_t entryPoint = NULL);
  void setVerifiedEntryPoint(nmethod *nm= NULL);
  void unlinkFromSendDesc();
  void initSendDesc(nmln* sd_nmln);
  virtual void init(nmethod* nm) { Unused(nm); }
  void print();
  virtual char* name() = 0;
  void verify() { verify2(pic()); }
  void verify2(CacheStub *calling_pic);
  void read_snapshot(FILE *f);
  void write_snapshot(FILE *f);
  pc_t jump_addr();
 protected:
  inline void set_callee(CountCodePattern* pattern, int32 addr); 
  inline void set_callee(int32 addr) { set_callee(pattern[countType()], addr); }
  inline void set_count_addr(CountCodePattern* pattern, int32 addr);
  inline int32 count_addr(CountCodePattern* pattern);
  friend void countStub1_init();
  friend void countStub2_init();
};

class CountingStub: public CountStub {
  VTBL_AND_SETTER(CountingStub, :CountStub(1.0));
 public:
  CountingStub(nmethod* t, pc_t entryPoint, nmln* sd_nmln);
  void* operator new(size_t size);
  CountType countType()         { return Counting; }
  fint size();                  // size in bytes
  char* name()                  { return "CountingStub"; }
  friend bool isCountStub(void* p);
};

class ComparingStub: public CountStub {
  VTBL_AND_SETTER(ComparingStub, :CountStub(1.0));
 public:
  ComparingStub(nmethod* t, pc_t entryPoint, nmln* sd_nmln);
  void* operator new(size_t size);
  CountType countType()         { return Comparing; }
  fint size();                  // size in bytes
  void init(nmethod* nm);
  char* name()                  { return "ComparingStub"; }
  friend bool isCountStub(void* p);
 protected:
  void  set_recompile_addr(pc_t addr);
# ifdef UNUSED
  pc_t get_recompile_addr();
# endif
};

// AgingStubs temporarily count the invocations of newly recompiled nmethods;
// when the counter overflows, the nmethod becomes old.  This helps prevent
// premature recompilation (which can cause uncommon traps because the pics
// aren't primed yet.)

class AgingStub : public ComparingStub {
  VTBL_AND_SETTER(AgingStub, :ComparingStub(1.0));
 public:
  AgingStub(nmethod* t, pc_t entryPoint, nmln* sd_nmln);
  void init(nmethod* nm);
  bool isAgingStub()            { return true; }
  char* name()                  { return "AgingStub"; }
  friend bool isCountStub(void* p);

  // initializiation
  static int32 add_inst;
  static void initPattern();
};

// An IDManager doles out unique IDs in the range [0..N), recycling IDs after
// they are freed up again.  It tries to allocate as few IDs as possible, 
// i.e. prefers reusing IDs rather than giving out new ones.
// The IDManager allocates one word per possible ID; when an ID is in use, 
// the word can be used to store arbitrary information.  However, the words
// of unused IDs must not be stored into.

// When the table overflows, it doubles the data array size and calls a
// user-defined handler, passing in the difference between old and new
// data array address.
typedef void (*IDOverflowHandler)(int32 delta);

class IDManager : public CHeapObj {
 protected:
  fint firstFree;       // index of first free elem
  IDOverflowHandler growHandler;
 public:
  int32* data;          // data words, indexed by ID
  fint n;               // max. number of IDs
  fint usedIDs;         // # of used IDs
  
  IDManager(fint N, IDOverflowHandler handler, caddr_t desiredAddress= 0);
  IDManager(FILE* f, caddr_t desiredAddress= 0);
 protected:
  IDManager() {}
 public:
  void init();
  ~IDManager();

  fint newID();         // return a new ID
  fint peekID();        // return value which would be returned by newID,
                        // but don't actually allocate the ID
  void freeID(fint id); // id is unused again
  bool isNearlyFull() { return usedIDs >= n - 10; }
  fint read_snapshot(FILE* f);
  void write_snapshot(FILE* f);
  void verify();
  void print();
  void grow();
};

# if  GENERATE_DEBUGGING_AIDS
CountStub* findCountStub(void* addr);   // addr must point into a count stub
#endif

void shiftCounts(int32 delta);


# endif  // defined(FAST_COMPILER) || defined(SIC_COMPILER)

void setCountSends(bool newFlag);       // _CountSends: primitive
