/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



// A lookup result holds the result of a lookup operation;
//   the holder, which is the object containing the found slot,
//   and the desc, which is the slot that was found.

// For evaluating code in context (for debugging) and also for doIts,
//  it is handy to be able to run methods that are not in a slot.
//  Since the compiler works off of a lookup result, it is very handy
//  to make a nonexistentSlotRef for this purpose, and pretend there was
//  a lookup -- dmu

class realSlotRef;

class abstractSlotRef: public CListEntry {
 public:
  virtual void print_short() = 0;
  virtual void print() = 0;
  virtual oop contents() = 0;
  virtual void set_contents(oop x) { // should not set contents 
    Unused(x); ShouldNotCallThis(); } 
  virtual oop             methodHolder_or_map(oop rcvr) = 0;
  virtual oop generalized_methodHolder_or_map(oop rcvr)  { return methodHolder_or_map(rcvr); }
  virtual ResultType resultType(oop sel) { Unused(sel);  return methodResult; }
  virtual bool is_real() { return false; }
  virtual bool exists() = 0;

  oop   interpretData(oop rcvr, oop sel, oop arg1);
  oop   interpret(oop rcvr, oop sel, oop del, oop* argp, int32 nargs);
   
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  char* interpretForCompiledSender(oop rcvr, oop sel, oop arg1);
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)


  realSlotRef* as_real() {
    assert(is_real(), "slot ref is not real");
    return (realSlotRef*) this; }
  
  // NOT VIRTUAL
  // rename from EQ to avoid MW warning
  bool EQsr(abstractSlotRef* s);

  virtual void add_dependency(slotDesc* sd, simpleLookup* L) {
    Unused(sd); Unused(L);
  }
};


class nonexistentSlotRef: public abstractSlotRef {
 public:
  oop _contents;
  
  nonexistentSlotRef(oop c) { _contents = c; }
  bool exists()             { return false; }
  void print_short();
  void print();
  oop contents() { return _contents; }
  // just use map for compiler, dont know why, thats the way it was -- dmu
  oop methodHolder_or_map(oop rcvr) { 
    return rcvr; }
  oop generalized_methodHolder_or_map(oop rcvr) { 
    return rcvr->map()->enclosing_mapOop(); }
};

class realSlotRef: public abstractSlotRef {
public:
  lookupTarget* holder;
  slotDesc* desc;
  
  realSlotRef(lookupTarget* h, slotDesc* d) { holder = h; desc = d; }
  
  bool is_real() { return true; }
  bool exists()  { return true; }
  oop contents();
  void set_contents(oop);
  
 protected:
  oop methodHolder_if_not_rcvr();
  
 public:
  oop             methodHolder_or_map(oop rcvr);
  oop generalized_methodHolder_or_map(oop rcvr);

  void print_short();
  void print();

  bool EQsr(realSlotRef* s) {
    return  desc    ==  s->desc
         && holder->EQ( s->holder ); }

  void add_dependency(slotDesc* sd, simpleLookup* L) {
    holder->add_dependency(sd, L); }
  ResultType resultType(oop sel);
};

// For stack conversions, there really is a slot, but
//  we need to use the contents that were there originally, not now.
//  

class counterfactualSlotRef: public abstractSlotRef {
 protected:
  oop _contents;
  oop _methodHolder_or_map;
  
 public:
  
  bool exists()  { return true; }
  void print_short();
  void print();
  oop contents() { return _contents; };
  
  oop methodHolder_or_map(oop rcvr) { 
    Unused(rcvr);  return _methodHolder_or_map; }
  counterfactualSlotRef(oop c, oop mh) { _contents = c;  _methodHolder_or_map = mh; }
};
