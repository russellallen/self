/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class Object;

class ParseNode: public ResourceObj {
 public:
  ParseNode() {}
  
  virtual void Print() = 0;

  // I have folded GenByteCodePositions into GenByteCodes
  
  // Here is the old comment for GenByteCodes:
  
  // NOTE: the top node of the parse tree must be "preserved" 
  // so that oops (e.g. string constants) are updated correctly.
  // GenByteCodes may run Self code and thus cause GCs.
  // The parent is a pointer to the lexically enclosing scope (block or method)

  // And for GenByteCodePositions:
  
  // Unlike in GenByteCodes, the parent is a pointer to the enclosing
  // expression (can be a parenthesized expr)

  virtual bool GenByteCodes(AbstractByteCode* b,
                            Object* parent,
                            bool isExpr = true) {
    Unused(b); Unused(parent); Unused(isExpr);
    return true; }

  // Decorate the parse tree with comments collected by the scanner.
  virtual void addCommentAnnotations(Scanner* scanner) { Unused(scanner); }
};

class ListElement: public ParseNode {
 public:
  ParseNode* data;
  ListElement* next;
  
  ListElement(ParseNode* d, ListElement* n = 0) { data = d; next = n; }
  
  ParseNode* Data() { return data; }
  ListElement* Next() { return next; }
  void SetNext(ListElement* n) { next = n; }
  
  void Print() { Data()->Print(); }

  void oops_do(oopsDoFn f) {
    if (data) data->oops_do(f); }
};

class List: public ParseNode {
 public:
  ListElement* head;
  ListElement* tail;
  
  List() { head = tail = 0; }
  List(ParseNode* e) { head = tail = new ListElement(e); }
  
  ListElement* Head() { return this ? head : 0; }
  ListElement* Tail() { return this ? tail : 0; }
  bool IsEmpty() { return this == 0 || head == 0; }
  
  List* Append(ParseNode* e);
  
  fint Length();
  
  bool GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr = true);

  void addCommentAnnotations(Scanner* scanner);
  
  void PrintSeparatedBy(const char* sep);
  void Print() { PrintSeparatedBy(". "); }
  
  void oops_do(oopsDoFn f);
};
