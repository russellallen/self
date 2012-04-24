/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "send.hh"
# include "_send.cpp.incl"

# define check(e)                                                             \
    if ((e) == false) return false
    
# define checkMsg(b, e) \
  if (!(e)) { \
    ErrorMessage(b->errorMessage); \
    return false; \
  } else /* else is for semicolon */ \
   0 /* silence unwanted ; warning */
  
  
void Send::PrintDelegatee() {
  if (del != 0) lprintf("%s.", del->AsCharP());
}

bool Send::GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr) {
  Unused(isExpr);
  // this is a pain in the ***
  // if (receiver && receiver->IsSelf()) {
  //  warning("sending messages to explicit \"self\" is considered bad style");
  // }
  const char* msg= message->AsCharP();
  
  stringOop selector = new_string(msg);
  
  if ( del  &&   receiver ) {
    ErrorMessage("resends must be to implicit self");;
    return false;
  }

  bool isUndirectedResend = false;
  stringOop delegatee = NULL;
  if (!del)
    ;
  else if ( del->len == 0  ||  strcmp(del->AsCharP(), "resend") == 0 )
      isUndirectedResend = true;
  else
    delegatee = new_string(del->AsCharP());
    
  b->GenSendByteCode( position_in_method(parent),
                      source_length,
                      selector,
                      receiver == 0,
                      isUndirectedResend,
                      delegatee );
  return true;
}


void Send::addCommentAnnotations(Scanner* scanner) {
  if (receiver) receiver->addCommentAnnotations(scanner);
}


// The branches need a value to be the result
// (for the sake of consistency with everything else).
// Let the receiver expression be the result.
// If elided, generate a push self bytecode.

bool Send::GenReceiverForPseudoPrim(AbstractByteCode* b, Object* parent) {
  if ( receiver )
    return  receiver->GenByteCodes(b, parent);
  b->GenSelfByteCode(position_in_method(parent), 0);
  return true;
}


void Unary::Print() {
  if (receiver) {
    bool parens = receiver->IsBinary() || receiver->IsKeyword();
    if (parens) lprintf("(");
    receiver->Print();
    if (parens) lprintf(")");
    lprintf(" ");
  }
  PrintDelegatee();
  message->Print();
}

bool Unary::GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr) {
  Unused(isExpr);
  const char* msg= message->AsCharP();
  if (strncmp(msg, "__", 2) == 0) {
    ErrorMessage("illegal pseudo-primitive");
    return false;
  }
  if (receiver) check(receiver->GenByteCodes(b, parent));
  return Send::GenByteCodes(b, parent);
}

void Binary::addCommentAnnotations(Scanner* scanner) {
  Send::addCommentAnnotations(scanner);
  arg->addCommentAnnotations(scanner);
}

void Binary::Print() {
  bool parens;
  if (receiver) {
    parens = receiver->IsKeyword();
    if (parens) lprintf("(");
    receiver->Print();
    if (parens) lprintf(")");
    lprintf(" ");
  }
  PrintDelegatee();
  message->Print();
  lprintf(" ");
  parens = arg->IsKeyword() || arg->IsBinary();
  if (parens) lprintf("(");
  arg->Print();
  if (parens) lprintf(")");
}

bool Binary::GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr) {
  Unused(isExpr);
  if (receiver) check(receiver->GenByteCodes(b, parent));
  check(arg->GenByteCodes(b, parent));
  return Send::GenByteCodes(b, parent);
}

void Keyword::Print() {
  if (receiver) {
    bool parens = receiver->IsKeyword();
    if (parens) lprintf("(");
    receiver->Print();
    if (parens) lprintf(")");
    lprintf(" ");
  }
  PrintDelegatee();
  StringListElement* s = keywords->Head();
  ExprListElement* e = args->Head();
  for (; s; s = s->Next(), e = e->Next()) {
    s->Data()->Print();
    lprintf(" ");
    bool parens = e->Data()->IsKeyword();
    if (parens) lprintf("(");
    e->Data()->Print();
    if (parens) lprintf(")");
    if (s->Next()) lprintf(" ");
  }
}


bool Keyword::GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr) {
  Unused(isExpr);
  const char* msg= message->AsCharP();
   
  if (strcmp(msg, "__DefineLabel:") == 0) {
    return  GenLabelDefinition(b, parent);
  }
  if (strcmp(msg, "__BranchTo:") == 0) {
    return  GenBranch(b, parent, false, NULL, args->Tail()->Data());
  }
  if (strcmp(msg, "__BranchIfTrue:To:") == 0) {
    return GenBranch(b, parent, true,  args->Head()->Data(), 
                         args->Tail()->Data());
  }
  if (strcmp(msg, "__BranchIfFalse:To:") == 0) {
    return GenBranch(b, parent, false, args->Head()->Data(), 
               args->Tail()->Data());
  }
  static const char* casePrefix= "__BranchIndexedBy:To:";
  static const fint  casePrefixLength= 21;
  assert(strlen(casePrefix) == casePrefixLength, "recount length");
  if (strncmp(msg, casePrefix, sizeof(casePrefix)) == 0) {
    return GenIndexedBranch(b, parent);
  }
  if (strncmp(msg, "__", 2) == 0) {
    ErrorMessage("illegal pseudo-primitive");
    return false;
  }
  if (receiver) check(receiver->GenByteCodes(b, parent));
  check(  args->GenByteCodes(b, parent));
  return  Send::GenByteCodes(b, parent);
}


bool Keyword::GenLabelDefinition(AbstractByteCode* b, Object* parent) {
  check( GenReceiverForPseudoPrim(b, parent) );
  Expr* labelE= args->Head()->Data();
  oop labelOop= labelE->get_label();
  if ( labelOop == badOop)
    return false;
  checkMsg(b, b->GenLabelDefinition(labelOop));
  return true;
}


bool Keyword::GenBranch(AbstractByteCode* b, Object* parent,
                        bool cond, Expr* testMe, Expr* dst) {
  check( GenReceiverForPseudoPrim(b, parent) );
  oop dstLabel = dst->get_label();
  if (dstLabel == badOop) {
    return false;
  }
  if (!testMe) {
    checkMsg(b,  b->GenBranchByteCode( position_in_method(parent),
                                 source_length,
                                 dstLabel));
    return true;
  }
  checkMsg( b, testMe->GenByteCodes( b, parent));
  checkMsg( b,
         cond
            ?  b->GenBranchTrueByteCode( position_in_method(parent),
                                         source_length,
                                         dstLabel)
            :  b->GenBranchFalseByteCode( position_in_method(parent),
                                          source_length,
                                          dstLabel));
  return true;
}


bool Keyword::GenIndexedBranch(AbstractByteCode* b, Object* parent) {
  check( GenReceiverForPseudoPrim(b, parent) );
  int32 n = args->Length() - 1;
  if ( n < 1 ) {
    ErrorMessage("indexed branch needs index argument and at least one label argument");
    return false;
  }
  objVectorOop v= Memory->objVectorObj->cloneSize(n);
  Expr* testMe= args->Head()->Data();
  check( testMe->GenByteCodes( b, parent));
  ExprListElement* elm= args->Head()->Next();
  for (int32 i = 0;  i < n;  ++i, elm=elm->Next()) {
    oop dstLabel = elm->Data()->get_label();
    if (dstLabel == badOop) {
      return false;
    }
    v->obj_at_put(i, dstLabel);
  }
  checkMsg(b,  b->GenBranchIndexedByteCode( position_in_method(parent),
                                      source_length,
                                      v));
  return true;
}



void Keyword::addCommentAnnotations(Scanner* scanner) {
  Send::addCommentAnnotations(scanner);
  args->addCommentAnnotations(scanner);
}
