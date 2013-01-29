/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "parser.hh"
# include "_parser.cpp.incl"

DO_NOT_CROSS_COMPILE 
  
# define assertToken(t, c, s)                                                 \
    if ((t)->type != (c)) { expecting(t, s); return 0; }

# define CHECK_TOKEN(t)                                                       \
    if (t->type == Token::ERROR_TOKEN) {                                      \
      syntaxError( t->sourceStart, t);                                        \
      return NULL; }

Parser::Parser(Scanner* scanr, bool silnt) {
  scanner        = scanr;
  silent         = silnt;

  implicitSelf         = NULL;

  error                = noParseErr;
  parse_error_message  = NULL;
  parse_error_line     = -1;
  parse_error_column   = -1;
  parse_error_expected = "";
}


void Parser::prematureEOF(Token *t) {
  if (!parse_error_message) {
    error                = prematureEndErr;
    parse_error_message  = "premature end of input";
    parse_error_line     = t->line;
    parse_error_column   = t->column;
  }
}

void Parser::syntaxErrorExpecting(Token*t , const char *expected) {
  if (!silent) scanner->ErrorMessage("unexpected token", t->line, t->column);
  if (!parse_error_message) {
    error                = parseErr;
    parse_error_message  = "unexpected token";
    parse_error_line     = t->line;
    parse_error_column   = t->column;
    parse_error_expected = expected;
  }
}


void Parser::syntaxError(const char* msg, Token* t) {
  syntaxError(msg, t->line, t->column);
}


void Parser::syntaxError(const char* msg, int32 l, int32 c) {
  if (!silent) scanner->ErrorMessage(msg, l, c);
  if (!parse_error_message) {
    error               = parseErr;
    parse_error_message = msg;
    parse_error_line     = l;
    parse_error_column   = c;
  }
}

bool Parser::noParseError()             { return error == noParseErr;      }
bool Parser::prematureEndOfInputError() { return error == prematureEndErr; }

void Parser::innerMethodError(Token* t) {
  // Error message when slots are present in sub expression.
  syntaxError("inner methods are no longer supported, "
                          "slot-list within a sub expression is not legal", t);
}


String* Parser::OpStringFromNum(Token* t) {
  assert(isPossibleOp(t) && !isOp(t), "negative number expected");
  if (t->type == Token::INTEGER) {
    t->integer = -t->integer;
  } else {
    t->floating = -t->floating ;
  }
  scanner->push_token(t);
  return new String("-");
}

String* Parser::StringFromOp(Token* t) {
  switch (t->type) {
    // TODO (topa 2012-05-06):  = and ~ are no TokenTypes in Token...
   case '=':             return new String("=");
   case '~':             return new String("~");
   case Token::ARROW:    return new String("<-");
   case Token::OPERATOR: return t->string;
   default:    error("parser: should not be here"); return NULL;
  }
}

Expr* Parser::parseExpr(Token* t, bool methodCandidate) {
  Expr* expr;
  Token* delegate = NULL;
  Token* tStart = t;
  if (t->type == Token::DELEGATE || t->type == Token::RESEND_TOKEN) {
    delegate = t;
    t = scanner->get_token(); CHECK_TOKEN(t);
    if (t->type != Token::KEYWORD) {
      scanner->push_token(t);
      t = delegate;
      delegate = NULL;
    }
  }
  if (t->type == Token::KEYWORD || t->type == Token::PRIMKEYWORD) {
    expr = implicitSelf;
  } else {
    expr = parseBinary(t, methodCandidate);
    if (! expr) return NULL;
    t = scanner->get_token(); CHECK_TOKEN(t);
  }
  if (t->type == Token::KEYWORD || t->type == Token::PRIMKEYWORD) {
    StringList* keywords = new StringList(t->string);
    Expr* arg = parseExpr();
    if (! arg) return NULL;
    ExprList* args = new ExprList(arg);
    t = scanner->get_token(); CHECK_TOKEN(t);
    while (t->type == Token::Token::CAPKEYWORD) {
      keywords = keywords->Append(t->string);
      arg = parseExpr();
      if (! arg) return NULL;
      args = args->Append(arg);
      t = scanner->get_token(); CHECK_TOKEN(t);
    }
    if (delegate) {
      switch (delegate->type) {
       case Token::DELEGATE:
        expr = new Keyword(expr, keywords, args, delegate->string,
                           tStart->sourceStart,
                           scanner->lastWhiteSpaceBefore(t->sourceStart),
                           scanner->fileName(), tStart->line, tStart->column,
                           this);
        break;
       case Token::RESEND_TOKEN:
        expr = new Keyword(expr, keywords, args, new String("resend"),
                           tStart->sourceStart,
                           scanner->lastWhiteSpaceBefore(t->sourceStart),
                           scanner->fileName(), tStart->line, tStart->column,
                           this);
        break;
       default:
        fatal1("incorrect delegate token type %ld", delegate->type);
      }
    } else {
      expr = new Keyword(expr, keywords, args, 0,
                         tStart->sourceStart,
                         scanner->lastWhiteSpaceBefore(t->sourceStart),
                         scanner->fileName(), tStart->line, tStart->column,
                         this);
    }
  }
  scanner->push_token(t);
  return expr;
}

bool Parser::checkSubExpression(ExprList* body, Token* s) {
  // This must be a sub-expression, check length of code == 1 and
  // absence of '^'.
  if (body->Length() > 1) {
    syntaxError("cannot have multiple expressions inside a sub-expression", s);
    return false;
  }
  if (s->type == '^') {
    syntaxError("return must be last statement", s);
    return false;
  }
  return true;
}

Expr* Parser::parseBinary(Token* t, bool methodCandidate) {
  Expr* expr;
  Token* delegate = NULL;
  String* old_op = NULL;
  Token* tStart = t;
  if (t->type == Token::DELEGATE || t->type == Token::RESEND_TOKEN) {
    delegate = t;
    t = scanner->get_token(); CHECK_TOKEN(t);
    if (! isOp(t)) {
      scanner->push_token(t);
      t = delegate;
      delegate = NULL;
    }
  }
  if (isOp(t)) {
    expr = implicitSelf;
  } else {
    Token* s;
    if (t->type == '(') {
      s = scanner->get_token(); CHECK_TOKEN(s);
      scanner->push_token(s);
    }
    expr = parseUnary(t, methodCandidate);
    if (! expr) return NULL;
    t = scanner->get_token(); CHECK_TOKEN(t);
    if (methodCandidate && expr->IsMethod() && isPossibleOp(t)) {
     Object* obj = (Object *) expr;
     if (!obj->slots->IsEmpty()) {
       innerMethodError(s);
       return NULL;
     } else
       if (!checkSubExpression(obj->body,s))
         return NULL;
   }
  }
  while (isPossibleOp(t)) {
    String* op;
    if (isOp(t)) {
      op = StringFromOp(t);
    } else {
      op = OpStringFromNum(t);
    }
    if (old_op && strcmp(old_op->AsCharP(), op->AsCharP())) {
      syntaxError("no precedence for binary operator - please use parentheses", t);
      return NULL;
    }
    old_op = op;
    Expr* arg;
    t = scanner->get_token(); CHECK_TOKEN(t);
    if (t->type == Token::KEYWORD) {
      arg = parseExpr(t);
    } else {
      arg = parseUnary(t);
    }
    if (! arg) return NULL;
    if (delegate) {
      switch (delegate->type) {
       case Token::DELEGATE:
        expr = new Binary(expr, op, arg, delegate->string,
                          tStart->sourceStart, arg->source_end(),
                          scanner->fileName(), tStart->line, tStart->column,
                          this);
        delegate = NULL;
        break;
       case Token::RESEND_TOKEN:
        expr = new Binary(expr, op, arg, new String("resend"),
                          tStart->sourceStart, arg->source_end(),
                          scanner->fileName(), tStart->line, tStart->column,
                          this);
        delegate = NULL;
        break;
       default:
        fatal1("incorrect delegate token type %ld", delegate->type);
      }
    } else {
      expr = new Binary(expr, op, arg, 0,
                        tStart->sourceStart,  arg->source_end(),
                        scanner->fileName(), tStart->line, tStart->column,
                        this);
    }
    t = scanner->get_token(); CHECK_TOKEN(t);
  }
  scanner->push_token(t);
  return expr;
}

Expr* Parser::parseUnary(Token* t, bool methodCandidate) {
  Expr* expr;
  Token* delegate = NULL;
  Token* tStart = t;
  switch (t->type) {
   case Token::INTEGER:
    expr = parseInteger(t);
    if (! expr) return NULL;
    t = scanner->get_token(); CHECK_TOKEN(t);
    break;
   case Token::FLOAT: 
    expr = parseFloat(t);
    if (! expr) return NULL;
    t = scanner->get_token(); CHECK_TOKEN(t);
    break;
   case Token::STRING:
    expr = parseString(t);
    if (! expr) return NULL;
    t = scanner->get_token(); CHECK_TOKEN(t);
    break;
   case Token::ANNOTATION_START:
   case '(':
   case '[':
    { bool enclosed_in_annotation = t->type == Token::ANNOTATION_START;
      Token* anno = NULL;

      if (enclosed_in_annotation) {
        t = scanner->get_token(); CHECK_TOKEN(t);
        // Skip annoying ACCEPT tokens.
        while(t->type == Token::ACCEPT && !scanner->is_done()) {
          t = scanner->get_token(); CHECK_TOKEN(t);
        }
        
        if (t->type != Token::STRING) {
          expecting(t, "a string containing an annotation");
          return NULL;
        }
        anno = t;
        t = scanner->get_token(); CHECK_TOKEN(t);

        // Skip annoying ACCEPT tokens.
        while(t->type == Token::ACCEPT && !scanner->is_done()) {
          t = scanner->get_token(); CHECK_TOKEN(t);
        }
      }
      if ( t->type != '(' && t->type != '[') {
          expecting(t, "'(' or '['");
          return NULL;
      }
      expr = parseObject(t->type == '(' ? ')' : ']', t, 0, 
                         methodCandidate, anno);
      if (! expr) return NULL;
      t = scanner->get_token(); CHECK_TOKEN(t);
      if (enclosed_in_annotation) {
        // Skip annoying ACCEPT tokens.
        while(t->type == Token::ACCEPT && !scanner->is_done()) {
          t = scanner->get_token(); CHECK_TOKEN(t);
        }

        if (t->type != Token::ANNOTATION_END) {
          expecting(t, "'}' at end of annotated slot list");
          return NULL;
        }
        t = scanner->get_token(); CHECK_TOKEN(t);
      }
    }
    break;
   case Token::SELF_TOKEN:
    expr = new Self(t->sourceStart, scanner->sourceAddr(),
                    scanner->fileName(), tStart->line, tStart->column,
                    this);
    t = scanner->get_token(); CHECK_TOKEN(t);
    break;
   case Token::NAME:
    // Check for capitalized name
    if (isupper(t->string->AsCharP()[0])) {
      syntaxError("unary name must begin with a lowercase letter", t);
      return NULL;
    }
   case Token::PRIMNAME:
    expr = implicitSelf;
    break;
   case Token::DELEGATE:
   case Token::RESEND_TOKEN:
    expr = implicitSelf;
    delegate = t;
    t = scanner->get_token(); CHECK_TOKEN(t);
    assertToken(t, Token::NAME, "a name token");
    break;
   default:
    expecting(t, "a token beginning a unary expression");
    return NULL;
  }
  if (delegate) {
    switch (delegate->type) {
     case Token::DELEGATE:
      expr = new Unary(expr, t->string, delegate->string,
                       tStart->sourceStart, scanner->sourceAddr(),
                       scanner->fileName(), tStart->line, 
                       tStart->column, this);
      t = scanner->get_token(); CHECK_TOKEN(t);
      break;
     case Token::RESEND_TOKEN:
      expr = new Unary(expr, t->string, new String("resend"),
                       tStart->sourceStart, scanner->sourceAddr(),
                       scanner->fileName(), tStart->line,  
                       tStart->column, this);
      t = scanner->get_token(); CHECK_TOKEN(t);
      break;
     default:
      fatal1("incorrect delegate token type %ld", delegate->type);
    }
  }
  while (t->type == Token::NAME || t->type == Token::PRIMNAME) {
    if (t->type == Token::NAME && isupper(t->string->AsCharP()[0])) {
      syntaxError("unary name must begin with a lowercase letter", t);
      return NULL;
    }
    expr = new Unary(expr, t->string, 0,
                     tStart->sourceStart, scanner->sourceAddr(),
                     scanner->fileName(), tStart->line,  
                     tStart->column, this);
    t = scanner->get_token(); CHECK_TOKEN(t);
  }
  scanner->push_token(t);
  return expr;
}

Integer* Parser::parseInteger(Token* t) {
  assertToken(t, Token::INTEGER, "an integer literal token");
  return new Integer(t->integer, t->sourceStart, scanner->sourceAddr(),
                     scanner->fileName(), t->line, t->column, this);
}

Float* Parser::parseFloat(Token* t) {
  assertToken(t, Token::FLOAT, "a float literal token");
  return new Float(t->floating, t->sourceStart, scanner->sourceAddr(),
                   scanner->fileName(), t->line, t->column, this);
}

StringLiteral* Parser::parseString(Token* t) {
  assertToken(t, Token::STRING, "a string literal token");
  return new StringLiteral(t->string, t->sourceStart, scanner->sourceAddr(),
                           scanner->fileName(), t->line, t->column, this);
}

Expr* Parser::parseExpr() {
  Token *t = scanner->get_token(); CHECK_TOKEN(t);
  return parseExpr(t);
}

Object* Parser::parseObject(char match, Token* t, fint nargs,
                            bool methodCandidate, Token* anno) {

  if (match == ')') {
    assertToken(t, '(', "a '(' token");
  } else {
    assertToken(t, '[', "a '[' token");
    nargs = -1;                    // blocks can have arbitrary # args
  }
  SlotList* slots;
  ExprList* code;

  fint        source_body_line;
  fint        source_body_col;
  const char* source_body_start;
  fint        source_body_length;
  Token*      object_annotation = NULL;

  fint        source_line   = t->line;
  fint        source_column = t->column;
  const char* source_start  = t->sourceStart;
  fint        source_length;

  t = scanner->get_token(); CHECK_TOKEN(t);

  bool ok = parseBody(slots, code, t, nargs, 
                      source_body_start, source_body_line, source_body_col,
                      object_annotation);
  if (! ok) return NULL;

  if ( !methodCandidate && (match == ')') && !code->IsEmpty() ) {
    if (!slots->IsEmpty()) {
      innerMethodError(t);
      return NULL;
    } else
      if (!checkSubExpression(code,t))
        return NULL;
  }

  // If this object has code code make sure its slots are non methods

  // - 1 to omit closing paren
  source_body_length = scanner->sourceAddr() - source_body_start - 1;
  Token *closing_token = scanner->get_token(); CHECK_TOKEN(closing_token);
  if (match == ')') {
    assertToken(closing_token, ')', "a ')' token");
  } else {
    assertToken(closing_token, ']', "a ']' token");
    if (code->Length() == 0 && slots->ArgCount() > 0) {
      syntaxError("blocks without code cannot have arguments", t);
      return NULL;
    }
  }
  source_length = scanner->sourceAddr() - source_start;

  Object *o = new Object(slots, code, match == ']',
                         scanner->fileName(),
                         source_line,
                         source_column,
                         source_start,
                         source_length,
                         source_body_line,
                         source_body_col,
                         source_body_start,
                         source_body_length,
                         this);

  if (object_annotation) {
    o->annotation = extend_annotation_with_string("", object_annotation);
  } else {
    if (anno) o->annotation = extend_annotation_with_string("",anno);
  }

  if (!o->body->IsEmpty()) {
    Token* tok = scanner->commentList->isEmpty() 
      ? NULL : scanner->commentList->last();
    while (tok && tok->sourceStart >= source_start) {
      scanner->commentList->pop();
      tok = scanner->commentList->isEmpty() 
        ? NULL :  scanner->commentList->last();
    }
  }
  

  if (o->isDeferred && !o->body->IsEmpty()) {
    // check existence of local methods in blocks with code
    if (o->ContainsMethod()) {
      syntaxError("sorry - local methods not implemented yet", t);
      return NULL;
    }    
  }
  return o;
}

bool Parser::parseBody(SlotList*& slots, ExprList*& code, Token* t, fint nargs,
                       const char*& sourceStart, fint& line, fint& col,
                       Token*& object_annotation) {
  if (t->type == '|') {
    slots = parseObjectSlots(t, object_annotation);
    if (! slots) return false;
    t = scanner->get_token(); CHECK_TOKEN(t);
  } else {
    slots = new SlotList;
  }
  sourceStart = scanner->lastWhiteSpaceBefore(t->sourceStart);
  line = t->line;
  col  = t->column;
  
  if (slots->ArgCount() != nargs && nargs >= 0) {
    syntaxError("wrong number of argument slots", t);
    return false;
  }

  scanner->start_allowing_comments();
  code = new ExprList;
  Token* periodTok = NULL;
  for (;;) {
    if (t->type == ')' || t->type == ']' || t->type == Token::ACCEPT) {
      break;
    }
    if ( periodTok != NULL)
      code = code->Append(new Pop( periodTok->sourceStart, 
                                   periodTok->sourceStart + 1,
                                   scanner->fileName(),
                                   periodTok->line, 
                                   periodTok->column,
                                   this));
    if (t->type == '^') {
      Expr* expr = parseExpr();
      if (! expr) return false;
      expr = new Return(expr, t->sourceStart, expr->source_end(),
                        scanner->fileName(), t->line, t->column, this);
      code = code->Append(expr);
      t = scanner->get_token(); CHECK_TOKEN(t);
      if (t->type == '.') { 
        t = scanner->get_token(); CHECK_TOKEN(t);
      }
      break;
    }
    Expr* expr = parseExpr(t);
    if (! expr) return false;
    code = code->Append(expr);
    t = scanner->get_token(); CHECK_TOKEN(t);
    if (t->type != '.') break;
    periodTok = t;
    t = scanner->get_token(); CHECK_TOKEN(t);
  }
  scanner->push_token(t);
  scanner->stop_allowing_comments();

  return true;
}


SlotList* Parser::parseObjectSlots(Token* t, Token*& object_annotation) {
  assertToken(t, '|', "a '|' token");
  Token* finalT;
  SlotList* slots = new SlotList;
  slots = parseSlots(slots, "", finalT, object_annotation);
  if (!slots) {
    return NULL;
  }
  if (finalT->type != '|') {
    expecting(finalT, "'|' at end of slot list");
    return NULL;
  }
  return slots;
}


SlotList* Parser::parseAnnotatedSlots(Token* t, SlotList* slots, const char* annos,
                                      Token*& object_annotation) {
  assertToken(t, Token::ANNOTATION_START, "an annotation start token");

  t = scanner->get_token(); CHECK_TOKEN(t);
  if (t->type != Token::STRING) {
    expecting(t, "a string containing an annotation");
    return NULL;
  }

  Token* finalT;
  slots = parseSlots(slots, extend_annotation_with_string(annos, t), finalT,
                     object_annotation);
  if (!slots) {
    return NULL;
  }
  if (finalT->type != Token::ANNOTATION_END) {
    expecting(finalT, "'}' at end of annotated slot list");
    return NULL;
  }
  return slots;
}

SlotList* Parser::parseSlots(SlotList* slots, const char* annos, Token*& finalT,
                             Token*& object_annotation) {
  Token* t = scanner->get_token(); CHECK_TOKEN(t);
  for (;;) {
    while (t->type == Token::ANNOTATION_START) {
      Token* t1 = scanner->get_token(); CHECK_TOKEN(t1);
      if (t1->type == Token::ANNOTATION_END) {
        // Parse: {} = 'xxx' as object annotation.
        t = scanner->get_token(); CHECK_TOKEN(t);
        if (t->type != '=') {
          expecting(t, "'=' when defining an object annotation");
          return NULL;
        }
        t = scanner->get_token(); CHECK_TOKEN(t);
        if (t->type != Token::STRING) {
          expecting(t, "a string containing an annotation");
          return NULL;
        }
        object_annotation = t;
      } else {
        scanner->push_token(t1);
        slots = parseAnnotatedSlots(t, slots, annos, object_annotation);
        if (slots == EMPTY) break;
      }
      t = scanner->get_token(); CHECK_TOKEN(t);
      if (t->type == '.') {
        t = scanner->get_token(); CHECK_TOKEN(t);
      }
    }
    if (t->type == '|' || t->type == Token::ANNOTATION_END) {
      finalT = t;
      break;
    }
    slots = parseSlot(slots, t, annos);
    if (slots == EMPTY) {
      break;
    }
    t = scanner->get_token(); CHECK_TOKEN(t);
    if (t->type == '.') {
      t = scanner->get_token(); CHECK_TOKEN(t);
    } else {
      finalT = t;
      return slots;
    };
  }
  return slots;
}


SlotList* Parser::parseSlot(SlotList* slots, Token* t, const char* anno) {
  switch (t->type) {
   case Token::ARG:
    return parseArgSlot(slots, t, anno);
   case Token::NAME:
   case Token::PRIMNAME:
    return parseUnarySlot(slots, t, anno);
   case Token::OPERATOR:
   case '=':
   case '~':
   case Token::ARROW:
    return parseBinarySlot(slots, t, anno);
   case Token::KEYWORD:
   case Token::PRIMKEYWORD:
    return parseKeywordSlot(slots, t, anno);
   default:
    expecting(t, "a slot name expression");
    return NULL;
  }
}

SlotList* Parser::parseArgSlot(SlotList* slots, Token* t, const char* anno) {
  assertToken(t, Token::ARG, "an argument token");
  if (!isValidSlotName(t)) return NULL;
  return slots->Append(new ArgSlot(t->string, t, anno), this);
}

SlotList* Parser::parseUnarySlot(SlotList* slots, Token* t0, const char* anno) {
  if (t0->type != Token::NAME && t0->type != Token::PRIMNAME) {
    expecting(t0, "a name token");
    return NULL;
  }
  if (!isValidSlotName(t0)) return NULL;
  String* name = t0->string;
  Token* t = scanner->get_token(); CHECK_TOKEN(t);
  bool is_parent_slot = false;
  if (t->type == Token::OPERATOR) {
    // check token for '*'
    const char* s = StringFromOp(t)->AsCharP();
    if (*s == '*') {
      int tokLen= strlen(s);
      if (tokLen > 1) {
        if (s[1] == '*') {
          syntaxError("only a single * is allowed for a parent slot", t);
          return NULL;
        } else {
          while (--tokLen > 0)
            scanner->push_char(s[tokLen]);
        }
      }
      is_parent_slot = true;
      t = scanner->get_token(); CHECK_TOKEN(t);
    }
  }
  if (t->type == '=') {                  // read-only slot or unary method
    Expr* expr = parseExpr(scanner->get_token(), true); 
    if (! expr) return NULL;
    if (expr->IsMethod() && expr->ContainsMethod()) {
      syntaxError("sorry - local methods not implemented yet", t0);
      return NULL;
    }    
    return slots->Append(new DataSlot(name, expr, t0, anno, is_parent_slot),
                         this);
  } else {                              // assignable slot
    Expr* expr;
    if (t->type == Token::ARROW) {
      expr = parseExpr();          
      if (! expr) return NULL;
      if (expr->IsMethod()) {
        syntaxError("sorry - assignable methods not implemented", t0);
        return NULL;
      }
    } else {
      scanner->push_token(t);
      expr = NULL;
    }
    slots = slots->Append(new DataSlot(name, expr, t0, 
                                       anno, is_parent_slot, true), this);
    return slots;
  }
}


Object* Parser::parseMethodDecl(Token* t, fint nargs, fint nargsSeen) {
  Object* obj;
  assertToken(t, '=', "a '=' token");
  t = scanner->get_token(); CHECK_TOKEN(t);
  if (t->type != '(' && t->type != '[') {
    if (t->type == Token::ACCEPT) {
      // don't print out error message
      prematureEOF(t);
    } else {
      syntaxError("object expected", t);
    }
    return NULL;
  }
  obj = parseObject(t->type == '(' ? ')' : ']', t, nargs - nargsSeen, true);
  if (! obj) return NULL;
  if (nargs > 0 && !obj->IsMethod()) {
    syntaxError("empty objects cannot have arguments", t);
    return NULL;
  }
  if (obj->ContainsMethod()) {
    syntaxError("sorry - local methods not implemented yet", t);
    return NULL;
  }    

  return obj;
}


SlotList* Parser::parseBinarySlot(SlotList* slots, Token* t, const char* anno) {
  Token* t0 = t;
  if (! isOp(t)) {
    expecting(t, "a binary operator token");
    return NULL;
  }
  String* name = StringFromOp(t);
  t = scanner->get_token(); CHECK_TOKEN(t);
  Expr* expr;
  if (t->type == Token::NAME) {                    // argument
    if (!isValidSlotName(t)) return NULL;
    Token* argument_token = t;
    t = scanner->get_token(); CHECK_TOKEN(t);
    expr = parseMethodDecl(t, 1, 1);        // no arg slot
    if (! expr) return NULL;
    expr = expr->AddArg(new ArgSlot(argument_token->string, argument_token), this);
  } else {
    expr = parseMethodDecl(t, 1, 0);        // should have 1 arg slot
    if (! expr) return NULL;
  }
  return slots->Append(new DataSlot(name, expr, t0, anno), this);
}

SlotList* Parser::parseKeywordSlot(SlotList* slots, Token* t, const char* anno) {
  Token* t0 = t;
  if (t->type != Token::KEYWORD && t->type != Token::PRIMKEYWORD) {
    expecting(t, "a keyword token");
    return NULL;
  }
  StringList* keywords = new StringList(t->string);
  if (!isValidSlotName(t)) return NULL;
  t = scanner->get_token(); CHECK_TOKEN(t);
  Expr* expr;
  if (t->type == Token::NAME) {                    // args in selector
    ArgSlotList* args = new ArgSlotList(new ArgSlot(t->string, t));
    t = scanner->get_token(); CHECK_TOKEN(t);
    while (t->type == Token::CAPKEYWORD) {
      keywords = keywords->Append(t->string);
      t = scanner->get_token(); CHECK_TOKEN(t);
      assertToken(t, Token::NAME, "a name token");
      args = args->Append(new ArgSlot(t->string, t));
      t = scanner->get_token(); CHECK_TOKEN(t);
    }
    expr = parseMethodDecl(t, args->Length(), args->Length());      
  // no more arg slots, please
    if (! expr) return NULL;
    expr = expr->AddArgs(args, this);
    if (! expr) return NULL;
  } else {                                // args slot names in body
    fint nargs = 1;
    while (t->type == Token::CAPKEYWORD) {
      nargs++;
      keywords = keywords->Append(t->string);
      t = scanner->get_token(); CHECK_TOKEN(t);
    }
    expr = parseMethodDecl(t, nargs, 0);  // must have arg slots
    if (! expr) return NULL;
  }
  String* s = keywords->AsSelector();
  return slots->Append(new DataSlot(s, expr, t0, anno), this);
}

void Parser::expecting(Token* t, const char* c) {
  if (t->type == Token::ACCEPT) {
    // don't print the error message
    prematureEOF(t);
  } else if (t->type != Token::ERROR_TOKEN) {
    syntaxErrorExpecting(t, c);
  }
}

bool Parser::isValidSlotName(Token* name) {
  if (str_is_prim_name(name->string->AsCharP(), name->string->len)) {  
    syntaxError("slot names cannot begin with '_'", name);
    return false;
  } else if (isupper(name->string->AsCharP()[0])) {
    syntaxError("slot names must begin with a lowercase letter", name);
    return false;
  } else return true;
}

bool Parser::isOp(Token* t) {
  return    t->type == Token::OPERATOR
         || t->type == '='
         || t->type == '~'
         || t->type == Token::ARROW;
}

bool Parser::isPossibleOp(Token* t) {
  return isOp(t)
         || (t->type == Token::INTEGER && t->integer < 0)
         || (t->type == Token::FLOAT && t->floating < 0.0);
}

bool Parser::testDone() {
  Token* t = scanner->get_token();
  assertToken(t, Token::ACCEPT, "the end of the expression");
  return true;
}

Expr* Parser::readExpr(fint& line, const char*& sourceStart, fint& sourceLength) {
  Token* t = scanner->get_token();
  line = t->line;
  Expr* e = NULL;
  if (t->type != Token::ACCEPT) {
    if (t->type == Token::ERROR_TOKEN) {
      sourceStart= scanner->sourceAddr();
      sourceLength= 0;
      return NULL;
    }
    sourceStart = scanner->lastWhiteSpaceBefore(t->sourceStart);
    e = parseExpr(t, true);
    t = scanner->get_token();           // eat extra period at end of expr
    if (t->type != '.') scanner->push_token(t);
    if (!e) {
      testDone();
      if (prematureEndOfInputError()) {
        scanner->ErrorMessage(parse_error_message, 
                              parse_error_line,
                              parse_error_column);
      }
      if (VMScanner == scanner) {       
        scanner->SuppressErrors(true);
        assert(scanner->is_interactive(), "wrong scanner");
        scanner->discardInput();
        scanner->SuppressErrors(false);
        scanner->reset();
      }
    }
  }
  sourceLength= scanner->sourceAddr() - sourceStart - 1;
  return e;
}

Object* Parser::readBody(fint& line, fint& col,
                         const char*& sourceStart, fint& sourceLength) {
  Token* t = scanner->get_token();
  line = t->line;
  col  = t->column;

  fint        source_line  = t->line;
  fint        source_column = t->column;
  const char* source_start = t->sourceStart;
  fint        source_length;
  
  sourceStart = scanner->lastWhiteSpaceBefore(t->sourceStart);

  if (t->type == Token::ACCEPT) {
    prematureEOF(t);
    return NULL;
  }

  if (t->type == Token::ERROR_TOKEN) {
    syntaxError("syntax error", t);
    return NULL;
  }

  SlotList* slots;
  ExprList* code;
  Token* object_annotation = NULL;

  if (parseBody(slots, code, t, -1, sourceStart, line, col, object_annotation)) {
    testDone();
  }

  if (noParseError()) {
    sourceLength  = scanner->sourceAddr() - sourceStart;
    source_length = scanner->sourceAddr() - source_start;
    Object* e = new Object(slots, code, false, 
                           scanner->fileName(),
                           source_line,
                           source_column,
                           source_start,
                           source_length,
                           line,
                           col,
                           sourceStart,
                           sourceLength, 
                           this);
    
    if (!e->body->IsEmpty() && e->ContainsMethod()) {
      syntaxError("sorry - local methods not implemented yet", t);
      return NULL;
    }
    return e;
  }
  assert(parse_error_message, "Parse error missing");
  return NULL;
}

bool fill_data_slot(oop obj, const char* slot_name, oop value) {
  stringOop name = Memory->string_table->lookup(slot_name, strlen(slot_name));
  slotDesc* sd   = obj->find_slot(name);
  if (sd && sd->type->is_obj_slot()) {
    smi offset = smiOop(sd->data)->value();
    Memory->store(oopsOop(obj)->oops(offset), value);
    return true;
  }
  return false;
}

void Parser::fillErrorObj(oop errorObj) {
  assert(parse_error_message, "Error is not set");
  fill_data_slot(errorObj, "message",       new_string(parse_error_message));
  fill_data_slot(errorObj, "errorLine",     as_smiOop(parse_error_line));
  fill_data_slot(errorObj, "errorColumn",   as_smiOop(parse_error_column));
  fill_data_slot(errorObj, "scannerLine",   as_smiOop(scanner->get_line_number()));
  fill_data_slot(errorObj, "scannerColumn", as_smiOop(scanner->get_column()));
  fill_data_slot(errorObj, "expecting",     new_string(parse_error_expected));
}
