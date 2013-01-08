/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// LookupKeys are various combinations of information that
// describe lookups for scopes & nmethods.
// The simplest, ScopeLookupKey, contains just enough info about a
//  lookup (or send) to meet the needs of a scope, where
//  the receiver is available separately.


extern char* selector_string(oop sel);

// NB: not a VMObj to save space (keys are stored in ScopeDescs)

// scopes do not need receiver info here

class ScopeLookupKey {
 public:
  LookupType    lookupType;
  oop           selector;       // normally a string, BUT watch out for
                                // _Perform: 17 !!
  oop           delegatee;      // zero if none

  ScopeLookupKey(LookupType l, oop s, oop d) {
    lookupType = l; selector = s; delegatee = d; }

  ScopeLookupKey() {}

  void set_from(ScopeLookupKey &nmk);

  bool equivalent(ScopeLookupKey &k) {
    return
         baseLookupType(lookupType) == baseLookupType(k.lookupType)
      && selector                   == k.selector
      && delegatee                  == k.delegatee;
  }

  void print();
};



// MethodLookupKeys add the receiver map to that info, 
// and are specific to a given receiver map.
// MethodLookupKeys are only used during lookups.
// When the lookup is done, the key should be discarded, as it
// does not know how to participate in scavenging, GC, etc.
// It should be a ResourceObj, except that NMethodLookupKey can't
// be.

class MethodLookupKey: public ScopeLookupKey {  
 public:
  mapOop        _receiverMapOop;
 protected:
  // method holder of sending method;
  // map if mh obj will always be same obj as rcvr
  //  suppose an object includes a method that does a resend,
  //    by keying nmethod found for the resend on a MAP,
  //    the nmethod can be reused for clones of the object
  // 0 if lookup not a resend;
  // badOop if not yet determined

# define MH_NOT_A_RESEND 0
# define MH_TBD          badOop

  oop           _methodHolder_or_map;
  
 public:
  
  MethodLookupKey(LookupType l, oop mh, mapOop rm, oop s, oop d)
  : ScopeLookupKey(l, s, d) { 
    _receiverMapOop = rm; 
    _methodHolder_or_map= isResendLookupType(lookupType) 
                      ? mh
                      : oop(MH_NOT_A_RESEND);
  } 
  
  mapOop receiverMapOop() { return _receiverMapOop; }
  Map*   receiverMap()    { return receiverMapOop()->map_addr(); }

  void   set_methodHolder_or_map(oop mh) { _methodHolder_or_map= mh; }
  oop        methodHolder_or_map()       { return _methodHolder_or_map; }
  
  MethodLookupKey(MethodLookupKey* k) { *this = *k; }
  MethodLookupKey() : ScopeLookupKey(0, badOop, badOop) {
    _receiverMapOop= mapOop(badOop);  _methodHolder_or_map= MH_TBD;
  }
  
  void set_from(MethodLookupKey &nmk);

  bool EQ(const MethodLookupKey& p) {
    return
          (lookupType & ~ImplicitSelfBit) ==  (p.lookupType & ~ImplicitSelfBit)
      &&   _receiverMapOop                ==   p._receiverMapOop
      &&   _methodHolder_or_map           ==   p._methodHolder_or_map
      &&   selector                       ==   p.selector
      &&   delegatee                      ==   p.delegatee; }
  
  int32 hash();
  void  init_hash();
  
  fint arg_count() {
    return selector && selector->is_string() ?
      stringOop(selector)->arg_count() : 0; }
  char* selector_string() { return ::selector_string(selector); }
  
  void print();
  
};


inline MethodLookupKey *new_MethodLookupKey(MethodLookupKey &k) {
  MethodLookupKey* k2= NEW_RESOURCE_OBJ(MethodLookupKey);
  k2->set_from(k);
  return k2; }



// An NMethodLookupKeys is a MethodLookupKey stored in an nmethod or 
// in the code table.

class NMethodLookupKey: public MethodLookupKey {  
 public:
  NMethodLookupKey(NMethodLookupKey* k) { *this = *k; }
  NMethodLookupKey() {}
  
  bool is_new() {
    return receiverMapOop() ->is_new()
      ||  methodHolder_or_map() ->is_new()
      ||  selector          ->is_new()
      ||  delegatee         ->is_new();
  }

  void scavenge_contents();
  void gc_mark_contents();
  void gc_unmark_contents();
  void switch_pointers(oop from, oop to);
  void relocate();
  bool verify();
  void oops_do(oopsDoFn f);
};

