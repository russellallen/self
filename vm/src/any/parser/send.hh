#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "expr.hh"



class Send: public Expr {
 public:
  Expr* receiver;
  String* message;
  String* del;
  
  Send(Expr* r, String* m, String* d, const char* start, const char* end, 
       const char* file, fint line, fint col, Parser* p)
    : Expr(start, end, file, line, col, p){
      receiver = r; message = m; del = d;
    }
  
  bool IsSend() { return true; }
  
  bool GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr = true);

  void oops_do(oopsDoFn f) {
    Expr::oops_do(f); if (receiver) receiver->oops_do(f); }

  void addCommentAnnotations(Scanner* scanner);
  
  bool GenReceiverForPseudoPrim(AbstractByteCode* b, Object* parent);

  void PrintDelegatee();
};

class Unary: public Send {
 public:
  Unary(Expr* r, String* m, String* d, const char* start, const char* end, 
        const char* file, fint line, fint col, Parser* p)
    : Send(r, m, d, start, end, file, line, col, p) {}
  
  bool GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr = true);

  void Print();
};

class Binary: public Unary {
 public:
  Expr* arg;
  
  Binary(Expr* r, String* m, Expr* a, String* d,
         const char* start, const char* end, const char* file, 
         fint line, fint col, Parser* p)
    : Unary(r, m, d, start, end, file, line, col, p) {
      arg = a;
    }
  
  bool IsBinary() { return true; }
  
  bool GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr = true);

  void oops_do(oopsDoFn f) { Unary::oops_do(f); arg->oops_do(f); }
  
  void addCommentAnnotations(Scanner* scanner);

  void Print();
};

class Keyword: public Send {
 public:
  StringList* keywords;
  ExprList* args;
  
  Keyword(Expr* r, StringList* k, ExprList* a, String* d,
          const char* start, const char* end, const char* file, fint line, fint col, Parser* p)
    : Send(r, 0, d, start, end, file, line, col, p) { 
      keywords = k; args = a; message = keywords->AsSelector();
    }
  
  bool IsKeyword() { return true; }
  
  bool GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr = true);
  
  bool GenBranch(AbstractByteCode* b, Object* parent,
                        bool cond, Expr* testMe, Expr* dst);
  bool GenIndexedBranch(AbstractByteCode* b, Object* parent);
                        
  bool GenLabelDefinition(AbstractByteCode* b, Object* parent);

  void oops_do(oopsDoFn f) { Send::oops_do(f); args->oops_do(f); }
  
  void addCommentAnnotations(Scanner* scanner);
 
  void Print();
};
