/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// Slots are used by the parser to represent the slots of objects being
// parsed.  This representation is discarded as soon as the real object
// has been constructed from the SlotList.

class Slot: public ParseNode {
 public:
  String* name;
  char* annotation;
  Token* startToken;
  
  Slot(String* n, Token* t, char* anno) { 
    name = n; annotation = anno; startToken = t; }
  
  virtual oop slot_contents(fint& index) = 0;
  virtual slotType slot_type() = 0;
  
  virtual bool IsArgSlot()            { return false; }
  virtual bool IsDataSlot()   { return false; }
  virtual bool IsMethodSlot() { return false; }
  
  bool collides(Slot* other) { return name->equals(other->name); }

  slotList* make_list(slotList* slots, fint& index);
  
  void Print();                // print object
};


class SlotListElement: public ListElement {
 public:
  SlotListElement(Slot* d, SlotListElement* n = 0) : ListElement(d, n) {}
  Slot* Data() { return (Slot*) ListElement::Data(); }
  SlotListElement* Next() { return (SlotListElement*) ListElement::Next(); }
};

class SlotList: public List {
 public:
  SlotList() : List() {}
  SlotList(Slot* e) : List(e) {}
  
  SlotListElement* Head() { return (SlotListElement*) List::Head(); }
  SlotListElement* Tail() { return (SlotListElement*) List::Tail(); }
  SlotList* Append(Slot* elem, Parser* parser);
  
  fint ArgCount();                // number of argument slots in list
  
  bool make_list(slotList* &s);
};

class ArgSlot: public Slot {
 public:
  ArgSlot(String* n, Token* t, char* anno = "") 
    : Slot(n, t, anno) {}      
  
  oop slot_contents(fint& index) { return as_smiOop(index ++); }
  bool IsArgSlot() { return true; }

  slotType slot_type() { return slotType(arg_slot_type); }
  
  void Print();
};

class ArgSlotListElement: public ListElement {
 public:
  ArgSlotListElement(ArgSlot* d, ArgSlotListElement* n = 0) : ListElement(d, n) {}
  ArgSlot* Data() { return (ArgSlot*) ListElement::Data(); }
  ArgSlotListElement* Next() { return (ArgSlotListElement*) ListElement::Next(); }
};
class ArgSlotList: public List {
 public:
  ArgSlotList() : List() {}
  ArgSlotList(ArgSlot* e) : List(e) {}
  
  ArgSlotListElement* Head() { return (ArgSlotListElement*) List::Head(); }
  ArgSlotListElement* Tail() { return (ArgSlotListElement*) List::Tail(); }
  ArgSlotList* Append(ArgSlot* e) { return (ArgSlotList*) List::Append(e); }
  
  Object* AddArgs(class Object* b, Parser* parser);
};


class DataSlot: public Slot {
 public:
  Expr* expr;
  bool is_parent;
  bool assignable;
  
  DataSlot(String* n, Expr* e, Token* t, char* anno,
           bool parent = false, bool assign = false) 
    : Slot(n, t, anno) { 
      expr = e; is_parent = parent; assignable = assign; }
  
  oop slot_contents(fint& index) {
    Unused(index);  return expr ? expr->Eval(false, true, true) : Memory->nilObj; }
  slotType slot_type() {
    return slotType(
                       ( assignable ?    obj_slot_type :  map_slot_type)
                     | ( is_parent  ? parent_slot_type : data_slot_type)
                    ); }
  void oops_do(oopsDoFn f) { Slot::oops_do(f); if (expr) expr->oops_do(f); }
  
  void Print();
  
  bool IsDataSlot()    { return true; }
  bool IsMethodSlot()  { return expr && expr->IsMethod(); }

  void addCommentAnnotations(Scanner* scanner);  
};





