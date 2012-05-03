/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class Parser: public ResourceObj {
 public:
  Parser(Scanner* scanner, bool silent);

  Expr*   readExpr(fint& line, const char*& sourceStart, fint& sourceLength);
  Object* readBody(fint& line, fint& col, const char*& sourceStart, fint& sourceLength);

  // Syntax error reporting
  bool noParseError();
  bool prematureEndOfInputError();
  void fillErrorObj(oop errorObj);

  void syntaxError(const char* msg, Token* t);
  void syntaxError(const char* msg, int32 l = -1, int32 c = -1);

 private:

  bool silent;

  // Syntax errors
  void syntaxErrorExpecting(Token* t,  const char* expected);
  const char  *parse_error_message;
  int32  parse_error_line, parse_error_column;
  const char  *parse_error_expected;
  enum parseErrorKind { noParseErr, parseErr, prematureEndErr } error;

  Expr* implicitSelf;

  Scanner* scanner;

  Expr          * parseExpr   (Token* t, bool methodCandidate = false);
  Expr          * parseBinary (Token* t, bool methodCandidate = false);
  Expr          * parseUnary  (Token* t, bool methodCandidate = false);
  Integer       * parseInteger(Token* t);
  Float         * parseFloat  (Token* t);
  StringLiteral * parseString (Token* t);
  Expr          * parseExpr   ();

  Object* parseObject(char match, Token* t, fint nargs,
                      bool methodCandidate = false, Token* anno = NULL);

  // nargs == 0: no argument slots allowed
  //       <  0: indefinite number of arg slots
  //       >  0: exactly nargs arg slots required
  bool parseBody(SlotList*& slots, ExprList*& code,
                 Token* t, fint nargs, const char*& sourceStart, 
                 fint& line, fint& col,
                 Token*& object_annotation);

  Object*   parseMethodDecl(Token* t, fint nargs, fint nargsSeen);

  // top level
  SlotList* parseObjectSlots(Token* t, Token*& object_annotation);

  // called recursively to accomodate neted annotations.
  SlotList* parseAnnotatedSlots(Token* t, SlotList* s, const char* annos,
                                Token*& object_annotation);
  SlotList* parseSlots(SlotList* s, const char* annos, Token*& finalT,
                       Token*& object_annotation);

  SlotList* parseSlot(        SlotList* slots, Token* t, const char* anno);
  SlotList* parseArgSlot(     SlotList* slots, Token* t, const char* anno);
  SlotList* parseUnarySlot(   SlotList* slots, Token* t, const char* anno);
  SlotList* parseBinarySlot(  SlotList* slots, Token* t, const char* anno);
  SlotList* parseKeywordSlot( SlotList* slots, Token* t, const char* anno);

  void prematureEOF(Token* t);

  void expecting(Token* t, const char* c);

  inline bool isupper(fint c) {
    return c >= 'A' && c <= 'Z';
  }

  bool isValidSlotName(Token* name);

  bool isOp(Token* t);

  bool isPossibleOp(Token* t);

  String* OpStringFromNum(Token* t);

  String* StringFromOp(Token* t);

  bool    testDone();

  bool    checkSubExpression(ExprList* body, Token* s);
  void    innerMethodError(Token* t); 
};
