/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

// sendDescs describe the constant information of a send
// sometimes (rarely), they're used to point to primitive calls (which
// look the same for the first few words)
// offsets for sendDesc data (from pc_offset off of frame pointer)
// *************************************
// * WARNING: duplicated in asmDefs.h, asmDefs_*.h
// *************************************



class sendDesc {
 # include "_sendDesc_pd.hh.incl"
 
 enum { addr_desc_offset = jump_address_offset };

 protected:
  oop* as_oop_array() { return (oop*) this; }
  char** jump_addr_addr() {
    return (char**) ((char*)this + jump_address_offset); }
  
 public:
  static void init();
 private:
  static void init_platform();
  
 public:  
  static sendDesc* first_sendDesc(); // return sendDesc of EnterSelf asm stub
 
  // given the return pc saved by a call instruction,
  // create a pointer to a send desc
  static sendDesc* sendDesc_from_return_PC(void* retPC) {
    return (sendDesc*)retPC; // sendDesc origin is defined to be same as retPC
  }
  
  // give call address, create pointer to sendDesc
  static sendDesc* sendDesc_from_call_instruction(void* callPC) {
    return (sendDesc*) (((char*)callPC) - call_instruction_offset);
  }
 
  
  // give addr_desc's address, create pointer to sendDesc
  static sendDesc* sendDesc_from_addrDesc_addr(char** addrDesc_addr) {
    return (sendDesc*) (((char*)addrDesc_addr) - addr_desc_offset);
  }
  static sendDesc* sendDesc_from_nmln(nmln* l);
  
  pc_t  return_pc() { return (pc_t)this; } // sendDesc is always same as ret PC

  char* call_instruction_addr() { return (char*)jump_addr_addr(); }
  
  char* jump_addr();
  void set_jump_addr(char* t);
  
  void shift_jump_addr(int32 delta) {
    set_jump_addr((char*) ((smi) jump_addr() + delta)); }
  
  LookupType raw_lookupType() { 
    return *(LookupType*) (((char*)this) + lookupType_offset); }
  LookupType lookupType() {
    return withoutExtraBits(raw_lookupType()); }
  
  bool isPrimCall();
  CountType countType() { return ::countType(raw_lookupType()); }
  bool isCounting() { return countType() != NonCounting; }
  void setCounting(CountType ct) {
    *(LookupType*) (((char*)this) + lookupType_offset) =
      LookupType(withCountBits(raw_lookupType(), ct)); }
 protected:
  void setDirty() {
    *(LookupType*) (((char*)this) + lookupType_offset) = LookupType(DirtySendMask | raw_lookupType());}
 public:
  bool isDirty() {
    return isSet((int)*(LookupType*) (((char*)this) + lookupType_offset), DirtySendBit); }
  bool isOptimized() {
    return isSet((int)*(LookupType*) (((char*)this) + lookupType_offset), OptimizedSendBit); }
  void setOptimized() {
    *(LookupType*) (((char*)this) + lookupType_offset) =
      LookupType(OptimizedSendMask | raw_lookupType());}
  bool isUninlinable() {
    return isSet((int)*(LookupType*) (((char*)this) + lookupType_offset), UninlinableSendBit); }
  bool wasNeverExecuted();
  
  RegisterString mask() {
    return *(RegisterString*) (((char*)this) + mask_offset); }
  
# ifdef UNUSED
  char* non_local_return_code() {
    return  ((char*)this) + non_local_return_offset }
# endif
  
  nmln* dependency() {
    return (nmln*) (((char*)this) + depend_offset); }
  
  fint endOffset(LookupType l);
  fint endOffset() { return endOffset(lookupType()); }
  
  stringOop selector() {
    assert(!isPerformLookupType(lookupType()),
           "doesn't have a static selector");
    return *(stringOop*) (((char*)this) + selector_offset); }

 protected:
  oop static_or_dynamic_selector(oop s, LookupType l) {
    return isPerformLookupType(l) ? s : oop(selector()); } 

  oop static_or_dynamic_selector(oop s) {
    return static_or_dynamic_selector(s, lookupType()); }
  
public:
  int32 arg_count() {
    return isPerformLookupType(lookupType())
      ? *(int32*) (((char*)this) + arg_count_offset)
      : selector()->arg_count(); }
  
  int32 quick_perform_arg_count() {
    return isPerformLookupType(lookupType())
      ? *(int32*) (((char*)this) + arg_count_offset) : -1; }
  
  
 public:
  oop delegatee() { return *(oop*)(((char*)this) + delegatee_offset); }

  oop static_or_dynamic_delegatee(oop d, LookupType l) {
    if (needsDelegatee(l)) {
      if (l & DelegateeStaticBit) {
        return delegatee();
      } else {
        return d;
      }
    } else {
      return oop(0);
    } }
  
  CacheStub* pic();             // NULL if 0 or 1 targets
  CountStub* countStub();       // NULL if none or PIC

  nmethod* target();            // directly called nmethod or NULL if none/PIC
  nmethod* get_method();        // get the target nmethod (mustn't be a PIC)
  fint ntargets();              // number of nmethods in inline cache
  fint nsends();                // # of times this send was executed
  // lookup routine for empty inline cache
  char* lookupRoutine() { return Memory->code->trapdoors->SendMessage_stub_td(); }
  void reset_jump_addr() { setDirty(); set_jump_addr(lookupRoutine()); }
  void assert_unbound() {
    assert(jump_addr() == lookupRoutine(), "not unbound"); }

  void link(CacheStub* s);
  void unlink_nmethod();
  void unlink_countStub(CountStub *cs);
  void unlink_pic(CacheStub *pic);
  void unlink();
  void extend(nmethod* nm, mapOop rcvrMap, CountStub *cs= NULL);
  void rebind(nmethod* nm,          // rebind target (monomorph. only)
              char* addr= NULL,     // NULL means use default entry point
              CountStub *cs= NULL);
  void shift(int32 delta, nmethod* ours) {    // our nmethod has moved
    dependency()->shift(delta, (NCodeBase*)ours); }

  
  bool checkLookupTypeAndEntryPoint();
  bool checkLookupTypeAndEntryPoint(nmethod *nm, char *entryPoint);
  bool verify();
  
  void print();

  friend class Recompilation;   


  char* sendMessage( frame* lookupFrame,
                     oop receiver,
                     oop perform_sel,
                     oop perform_del,
                     oop arg1 );


  void sendMessagePrologue( oop  receiver,
                            frame* lookupFrame );
                                   
  char* fastCacheLookupAndBackpatch( LookupType t,
                                     mapOop receiverMapOop,
                                     oop sel, oop del);

  nmethod* lookup_compile_and_backpatch( compilingLookup* L );
};


void printMask(RegisterString mask);    // print encoded register mask

// external runtime lookup routine

extern "C" {
  char* SendMessage(sendDesc* ic,
                    frame* lookupFrame,
                    oop receiver,
                    oop perform_selector,
                    oop perform_delegatee,
                    oop arg1);
}

# else // defined(FAST_COMPILER) || defined(SIC_COMPILER)

// Minimal sendDesc stub for interpreter-only builds.
// Without a JIT, there are no inline caches, so sendDescs are never created.
// This stub exists so that runtime code using sendDesc* can compile;
// frame::send_desc() will always return NULL without compiled code.

class sendDesc {
 public:
  static void init() {}

  static sendDesc* first_sendDesc() { return NULL; }

  static sendDesc* sendDesc_from_return_PC(void* retPC) {
    Unused(retPC); return NULL; }

  bool isPrimCall()             { ShouldNotCallThis(); return false; }
  char* jump_addr()             { ShouldNotCallThis(); return NULL; }
  char* call_instruction_addr() { ShouldNotCallThis(); return NULL; }
  int32 arg_count()             { ShouldNotCallThis(); return 0; }
  RegisterString mask()         { ShouldNotCallThis(); return 0; }
  fint endOffset()              { ShouldNotCallThis(); return 0; }
  bool verify()                 { return true; }
  void print()                  {}
};

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
