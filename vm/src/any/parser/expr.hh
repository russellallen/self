/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// Exprs represent parsed Self objects that haven't been turned into real
// (Self-level) objects yet.

class SlotList;
class Slot;
class Object;
class ArgSlot;
class ArgSlotList;

class Expr: public ParseNode {
 public:
  const char* source_file;
  fint        source_line;
  fint        source_column;
  const char* source_start;
  fint        source_length;
  Parser*     parser; // for error messages

  const char* source_end() { return source_start + source_length; }
  
  Expr(Parser* p) { 
    source_file = source_start = ""; 
    source_line = source_column = source_length = 0;
    parser = p;}

  Expr(const char* start, const char* end, const char* file, fint line, fint col, Parser* p) { 
    source_start  = start;
    source_length = end - start;
    source_file = file;
    source_line = line;
    source_column = col;
    parser = p;
  }
  
  virtual bool IsSend()             { return false; }
  virtual bool IsBinary()           { return false; }
  virtual bool IsKeyword()          { return false; }
  virtual bool IsReturn()           { return false; }
  virtual bool IsSelf()             { return false; }
  virtual bool IsObject()           { return false; }
  virtual bool IsMethod()           { return false; }
  virtual bool isConstant()         { return false; }
   
  virtual oop  get_label()      {    
    ErrorMessage("branch destination must be a constant");
    return badOop; }

  virtual bool ContainsMethod()     { return false; }
  
  virtual Expr* AddArg(ArgSlot* arg, Parser* parser);
  virtual Expr* AddArgs(ArgSlotList* args, Parser* parser);
  
  virtual oop Eval(bool printing, bool inSlot, bool mustAllocate);

  void ErrorMessage(const char* msg);

  fint position_in_method(Object* parent);
};

class ExprListElement: public ListElement {
 public:
  ExprListElement(Expr* d, ExprListElement* n = 0) : ListElement(d, n) {}
  Expr* Data() { return (Expr*) ListElement::Data(); }
  ExprListElement* Next() { return (ExprListElement*) ListElement::Next(); }
};

class ExprList: public List {
 public:
  ExprList() : List() {}
  ExprList(Expr* e) : List(e) {}
  
  ExprListElement* Head() { return (ExprListElement*) List::Head(); }
  ExprListElement* Tail() { return (ExprListElement*) List::Tail(); }
  ExprList* Append(Expr* e) { return (ExprList*) List::Append(e); }
};


class Pop: public Expr {
 public:
  Pop(const char* start, const char* end, const char* file, fint line, fint col, Parser* p)
    : Expr(start, end, file, line, col, p) {}
    
  bool GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr = true);
  
  void Print();
};


class Self: public Expr {
 public:
  Self(const char* start, const char* end, const char* file, fint line, fint col, Parser* p)
    : Expr(start, end, file, line, col, p) {}
  
  bool IsSelf() { return true; }
  
  bool GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr = true);
  
  void Print();
};

class Constant: public Expr {
 public:
  oop value;
  
  Constant(oop v, Parser* p) : Expr(p) { value = v; }

  Constant(oop val, const char* start, const char* end, const char* file, fint line, fint col, Parser* p)
    : Expr(start, end, file, line, col, p) { 
      value = val;
    }
  
  bool isConstant() { return true; }
  oop  get_label() { return value; }
  
  bool GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr = true);

  oop Eval(bool printing, bool inSlot, bool mustAllocate) {
    return printing ? Expr::Eval(printing, inSlot, mustAllocate) : value; }
  
  void oops_do(oopsDoFn f) { (*f)(&value); }
};

class Integer: public Constant {
 public:
  Integer(int32 v, Parser* p) : Constant(as_smiOop(v), p) {}

  Integer(int32 v, const char* start, const char* end, const char* file, fint line, fint col, Parser* p)
    : Constant(as_smiOop(v), start, end, file, line, col, p) {}
  
  void Print();
};

class Float: public Constant {
 public:
  Float(float v, Parser* p) : Constant(as_floatOop(v), p) {}
  Float(float v, const char* start, const char* end, const char* file, fint line, fint col, Parser* p)
    : Constant(as_floatOop(v), start, end, file, line, col, p) {}
  
  void Print();
};

class StringLiteral: public Constant {
 public:
  StringLiteral(String* v, Parser* p) 
  : Constant(new_string(v->AsCharP(), v->len), p) {}

  StringLiteral(String* v, const char* start, const char* end, const char* file, fint line, 
                fint col, Parser* p)
    : Constant(new_string(v->AsCharP(), v->len), start, end, file, line, col, p){}
    
  void Print();
};

class Object: public Constant {
 public:
  SlotList*   slots;
  ExprList*   body;
  const char* annotation;

  // excluded the slots and the parentheses of the object.
  const char* source_body_start;
  fint        source_body_length;
  fint        source_body_line;
  fint        source_body_column;

  bool isDeferred; // true if this is a block.

  Object(SlotList*   slots, 
         ExprList*   body, 
         bool        isDeferred,
         const char* source_file, 
         fint        source_line,
         fint        source_column,
         const char* source_start,
         fint        source_length,
         fint        source_body_line,
         fint        source_body_col,
         const char* source_body_start,
         fint        source_body_length,
         Parser*     p);
  
  bool IsObject() { return true; }
  bool IsMethod() { return !isDeferred && body->Length() != 0; }
  bool ContainsMethod();
 
  Expr* AddArg(ArgSlot* arg, Parser* parser);
  Expr* AddArgs(ArgSlotList* args, Parser* parser);

  bool GenBody(Object* parent);
  bool GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr = true);
  // check NLRSupport::have_NLR_through_C() after calling this!

  void addCommentAnnotations(Scanner* scanner);
  
  oop Eval(bool printing, bool inSlot, bool mustAllocate) {
    return  printing  ||  GenBody(0)
      ?  oop(Constant::Eval(printing, inSlot, mustAllocate))
      :  oop(badOop);
  }
  
  void oops_do(oopsDoFn f);
  
  void Print();
};


inline fint Expr::position_in_method(Object* parent) {
  return parent != NULL
    ? source_start - parent->source_body_start
    : 0;
}


class Return: public Expr {
 public:
  Expr* result;
  
  Return(Expr* r, const char* start, const char* end, const char* file, fint line, fint col,
         Parser* p) 
    : Expr(start, end, file, line, col, p) { result = r; }
  
  bool IsReturn() { return true; }
  
  bool GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr = true);
  
  void oops_do(oopsDoFn f) { Expr::oops_do(f); result->oops_do(f); }
  
  void Print();
};

// return anno + separtator + comment_keyword + comment.
char* extend_annotation_with_comment(const char* anno, Token* comment);

// return anno + separator + string.
char* extend_annotation_with_string(const char* anno, Token* string);
