#pragma once
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "clist.hh"
# include "deps.hh"
# include "key.hh"
# include "top.hh"



enum LookupStatus {
  foundNone,
  foundOne,
  foundSeveral,

  foundAssignableParent,

  resendUndecidable,
  delegateeNotFound,
  mismatchedArgCount,
  performTypeError
  };


enum ResultType {
      methodResult,
    constantResult,
        dataResult,
  assignmentResult
};
  

const char* lookupStatusString(LookupStatus l);

  
class simpleLookup: public ResourceObj {
 public:
  MethodLookupKey key;
  oop receiver;       // badOop if none
  LookupStatus status;

 protected:
  abstractSlotRef* _result;

 public:  
  // set to NULL for no tracking:
  dependencyList* deps;
  assignableDependencyList* adeps;

  simpleLookup(LookupType l,
               oop rcvr,
               oop sel,
               oop dgt,
               oop mhOrMap, 
               dependencyList* dps = NULL,
               assignableDependencyList* adps = NULL);
  
  LookupType lookupType()     { return key.lookupType; }
  oop        selector()       { return key.selector; }
  oop        delegatee()      { return key.delegatee; }
  Map*       receiverMap()    { return key.receiverMap(); }
  mapOop     receiverMapOop() { return key.receiverMapOop(); }
  oop        methodHolder_or_map()   { return key.methodHolder_or_map(); }
  Map*       methodHolder_map() {
    oop m= methodHolder_or_map();
    assert (m != MH_TBD  &&   m != MH_NOT_A_RESEND, "no method holder");
    return m->is_map() ? mapOop(m)->map_addr()  :  m->map();
  }
  abstractSlotRef* result()   { return _result; }

  bool isReceiverStatic()    { return lookupType() & ReceiverStaticBit; }
  bool isDelegateeStatic()   { return lookupType() & DelegateeStaticBit; }
  bool isPerform()           { return isPerformLookupType(lookupType()); }
  bool isImplicitSelf()      { return lookupType() & ImplicitSelfBit; }

  void clearReceiverStatic() { key.lookupType &= ~ReceiverStaticBit; }

  // Used only when we actually know the lookup result in advance.
  inline void setResult(oop resultMethod, oop resultMethodHolder = MH_NOT_A_RESEND);

  virtual void perform_lookup();
  virtual bool is_for_inlining() { return false; }

  void perform_full_lookup_n( int32 perform_arg_count );

  fint arg_count() {
    oop s= selector();
    return s && s->is_string() ? stringOop(s)->arg_count() : 0; }

  ResultType resultType();
  oop   evaluateResult(oop* argp, int32 nargs, nmethod* nm);
  char* interpretResultForCompiledSender(oop arg1);
  
 protected:
  
  lookupTarget* create_initial_target();

  // kinds of initial targets
  virtual lookupTarget*          receiver_lookup_target();
  virtual lookupTarget*         delegated_lookup_target();
  virtual lookupTarget*   directed_resend_lookup_target();
  virtual lookupTarget* undirected_resend_lookup_target();
  // simple lookup is too simple to look for locals,
  // so just pretend its the receiver
  virtual lookupTarget*     implicit_self_lookup_target() {
    return receiver_lookup_target(); }

  virtual bool check_slot_for_directed_resend(slotDesc*);
 
  bool  objectLookup(lookupTarget* target);
  bool parentsLookup(lookupTarget* target);
  
  // the entry point for this group
  void lookupErrorCode(int32 perform_arg_count);
  void handleRecursiveLookupError();
  void generateLookupErrorMethod(int32 perform_arg_count);

  // helpers for above fn:
  void selectorAndSourceForLookupError(stringOop& sel, const char*& src);
  stringOop  messageTypeForLookupError();
  int32         argCountForLookupError(int32 perform_arg_count);
  
  LookupStatus perform_error_status(int32 perform_arg_count);
  
 public:
  
  void remove_all_deps() {
    if ( deps  != NULL)  deps->remove();
    if ( adeps != NULL) adeps->remove(); }
                               
  void add_dependency(slotDesc* s, Map* map) {
    if ( deps == NULL ) return;
    if (map->is_block()) return;
    if (s == NULL || s->is_parent()) {
      deps->add(map);
    } else if (map->can_have_dependents()) {
      assert(s >= map->slots() && s < map->slot(map->length_slots()),
             "slotDesc not in map");
      deps->add((slotsMapDeps*)map, s);
    } }

  void add_slot_dependency(Map* map) {
    if ( deps == NULL )  return;
    deps->add(map); }

  void add_asg_parent_dependency(objectLookupTarget* otarg,
                                 objectLookupTarget* ntarg,
                                 slotDesc* sd);
  
  virtual void print();

 protected:
  void assert_static_selector();
  void assert_static_delegatee();
  inline void assert_methodHolder_is_object();
};

