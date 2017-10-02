/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "allocation.hh"
# include "blockMap.hh"
# include "codeSlotsMap.hh"
# include "debug.hh"
# include "expr.hh"
# include "interpreter.hh"
# include "label_inline.hh"
# include "nlrSupport.hh"
# include "nmethod_inline.hh"
# include "parser.hh"
# include "process.hh"
# include "runtime.hh"
# include "scanner.hh"
# include "send.hh"
# include "shell.hh"
# include "simpleLookup_inline.hh"
# include "slot.hh"
# include "stack.hh"
# include "vmStrings.hh"

Expr* Expr::AddArg(ArgSlot* arg, Parser* parser) {
  Unused(arg); Unused(parser);
  ShouldNotReachHere(); // turning a constant expression into a method: no longer supported
  return 0;
}

Expr* Expr::AddArgs(ArgSlotList* args, Parser* parser) {
  Unused(args); Unused(parser);
  ShouldNotReachHere(); // turning a constant expression into a method: no longer supported
  return 0;
}

oop Expr::Eval(bool printing, bool inSlot, bool mustAllocate) {
  Unused(inSlot);
  
  slotsOop doItMethod;
  { ResourceMark m;             // release resources after compile
    
    if (PrintParsedExpressions) {
      Print();
      lprintf("\n");
    }
    
    ByteCode b(mustAllocate);
    if (! GenByteCodes(&b, 0, false) || NLRSupport::have_NLR_through_C()) return badOop;
    if (!b.Finish(source_file, source_line, source_start, source_length)) {
      ErrorMessage(b.errorMessage);
      return badOop;
    }

    doItMethod = create_outerMethod(0, &b);

    if (Trace) {
      lprintf("evaluating expr in context of lobby\n");
    }
  }
  
  oop res = currentProcess->runDoItMethod(Memory->lobbyObj, doItMethod);

  if (printing && res != badOop && !postReadSnapshot) {
    res->print();
  }
  return res;
}


void Expr::ErrorMessage(const char* msg) {
  parser->syntaxError(msg, source_line, source_column);
}

void Pop::Print() {
  lprintf("pop");
}

bool Pop::GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr) {
  Unused(isExpr);
  b->GenPopByteCode(position_in_method(parent), source_length); 
  return true; 
}


void Self::Print() {
  lprintf("self");
}

bool Self::GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr) {
  Unused(isExpr);
  b->GenSelfByteCode(position_in_method(parent), source_length); 
  return true; 
}


bool Constant::GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr) {
  Unused(isExpr);
  b->GenLiteralByteCode( position_in_method(parent), source_length, value);
  return true;
}


void Integer::Print() {
  lprintf("%ld", (void*)long(smiOop(value)->value()));
}

void Float::Print() {
  char buf[100];
  sprintf(buf, "%g", floatOop(value)->value());
  lprintf(buf);
}

void StringLiteral::Print() {
  lprintf("'");
  stringOop(value)->string_print();
  lprintf("'");
}

Object::Object(SlotList*   slots_arg, 
               ExprList*   body_arg, 
               bool        isDeferred_arg,
               const char* source_file_arg, 
               fint        source_line_arg,
               fint        source_column_arg,
               const char* source_start_arg,
               fint        source_length_arg,
               fint        source_body_line_arg,
               fint        source_body_column_arg,
               const char* source_body_start_arg,
               fint        source_body_length_arg,
               Parser*     p)
   : Constant(0, p) {
     slots      = slots_arg;
     body       = body_arg;
     isDeferred = isDeferred_arg; 
     annotation = "";

     //including slots and parenthesis
     source_file   = source_file_arg; 
     source_line   = source_line_arg;
     source_column = source_column_arg;
     source_start  = source_start_arg;
     source_length = source_length_arg;

     //only body part
     source_body_start  = source_body_start_arg;
     source_body_length = source_body_length_arg;
     source_body_line   = source_body_line_arg;
     source_body_column = source_body_column_arg;
}

Expr* Object::AddArg(ArgSlot* arg, Parser* parser) {
  slots = slots->Append(arg, parser);
  return slots ? this : NULL;
}

Expr* Object::AddArgs(ArgSlotList* args, Parser* parser) { 
  return args->AddArgs(this, parser);
}


void Object::oops_do(oopsDoFn f) {
  Constant::oops_do(f);
  slots->oops_do(f);
  body->oops_do(f);
}

bool Object::GenBody(Object* parent) {
  // Make the slot list
  slotList* s;
  if (! slots->make_list(s)) { // this can run Self code!
    LOG_EVENT("couldn't construct object literal");
    ErrorMessage("couldn't construct object literal");
    return false;
  }

  if (body->Length()) {
    // Create block or method.
    preservedObj ps(s); // since GenByteCodes can cause a gc,
                        // preserve the generated slotList.
    ByteCode b(true); // I am not sure that this method can handle space failure
    
    if ( !body->GenByteCodes(&b, this, false)
    ||  NLRSupport::have_NLR_through_C()) 
      return false;

    if (isDeferred) {
      if (parent) {
        if ( !b.Finish(source_file, source_body_line, 
                       source_body_start - parent->source_body_start,
                       source_body_length)) {
           parser->syntaxError( b.errorMessage, 
                                source_body_line, source_body_column);
           return false;
         }
      }
      else {
        if ( !b.Finish(source_file, source_body_line, 
                       source_body_start, source_body_length)) {
           parser->syntaxError( b.errorMessage, 
                                source_body_line, source_body_column);
           return false;
        }
      }
      value = create_block(create_blockMethod(s,  &b, annotation));
    } else {
      if ( !b.Finish(source_file, source_body_line, 
                     source_body_start, source_body_length)) {
           parser->syntaxError( b.errorMessage, 
                                source_body_line, source_body_column);
        return false;
      }
      value = create_outerMethod(s, &b, annotation);
    }
  } else {
    // Create plain object.
    value = create_slots(s, annotation);
    assert(value->arg_count() == 0,
           "plain objects cannot have arguments");
    if (isDeferred) {
      // a deferred object (e.g. [])
      s = new slotList(VMString[PARENT], parent_map_slotType,
                       Memory->blockTraitsObj);
      s = s->add(VMString[VALUE], map_slotType, value);
      value = create_slots(s, annotation);
    }
  }

  return true;
}


bool Object::GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr) {
  if (NLRSupport::have_NLR_through_C()) return false;
  if (IsMethod()) {
    if (   ! body->GenByteCodes(b, isExpr ? parent : this)
          || NLRSupport::have_NLR_through_C()) 
            return false;
  } else {
    // This is a Self object add the object to the literal vector
    // Do not make a real block for the position table version--
    //   That is why GenBody is conditionally called.
    if ( b->isPositionTable())
      value= Memory->objVectorObj->cloneSize(0);
    else if ( !GenBody(parent))
      return false;
    b->GenLiteralByteCode( position_in_method(parent), source_length, value );
  }
  return true;
}


void Object::Print() {
  lprintf(isDeferred ? "[ " : "( ");
  if (slots->Length()) {
    lprintf("| ");
    slots->Print();
    lprintf("| ");
  }
  
  body->Print();
  lprintf(isDeferred ? "]" : ")");
}

void Return::Print() {
  lprintf("^ ");
  result->Print();
}

bool Return::GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr) {
  Unused(isExpr);
  if (! result->GenByteCodes(b, parent) || NLRSupport::have_NLR_through_C()) return false;
  b->GenNonLocalReturnByteCode( position_in_method(parent), source_length);
  return true;
}

bool Object::ContainsMethod() {
  SlotListElement* s;
  for (s = slots->Head(); s && s->Data(); s = s->Next()) {
    if (s->Data()->IsMethodSlot()) return true;
  }
  assert(!s || !s->Next(), "empty element in list");
  return false;
}

static void print_comment_warning(const char* msg, 
                                  Slot* s, Token* comment, const char* file) {
  Unused(s);
  lprintf("%s\n", msg);
  lprintf("%s:%d \"", file, comment->line);
  comment->string->Print(); lprintf("\"\n");
}

static char* extend_annotation(const char* anno, const char* keyword, const char* str, int len) {
  const char* separator = "\177";
  fint prefix_len = strlen(anno) ? strlen(anno) + strlen(separator) : 0;
  char *new_anno = NEW_RESOURCE_ARRAY( char, 
                                      prefix_len
                                      + strlen(keyword) 
                                      + len + 1);
  char *buf = NEW_RESOURCE_ARRAY(char, len + 1);
  lsprintf_string(buf, len, str);
  sprintf(new_anno, "%s%s%s%s", 
          anno, prefix_len ? separator : "" , keyword, buf);
  return new_anno;
}

static char* extend_annotation(const char* anno, const char* keyword, Token* string) {
  return extend_annotation(anno, keyword, 
                           string->string->AsCharP(), string->string->len);}
char* extend_annotation_with_string(const char* annotation, Token* string) {
  return extend_annotation(annotation, "", string); }
char* extend_annotation_with_comment(const char* annotation, Token* comment) {
  return extend_annotation(annotation, "Comment: ", comment); }
char* extend_annotation_with_filename(const char* annotation, const char* name) {
  return extend_annotation(annotation, "File: ", name, strlen(name)); }

void Object::addCommentAnnotations(Scanner* scanner) {
  TokenList* commentList = scanner->commentList;
  for(SlotListElement* s = slots->Head(); s && s->Data(); s = s->Next()) {
    Slot* sl =  s->Data();

    if (AddFileAnnotationsToSlots) {
      sl->annotation = 
        extend_annotation_with_filename(sl->annotation, scanner->fileName());
    }

    if (ConvertCommentsIntoAnnotations) {
      if (sl->startToken) {
        if (WizardMode) {
          // Print out the slot information
          lprintf("%d>> ", sl->startToken->line); 
          sl->name->Print();
          lprintf("\n");
        }
        Token* t = commentList->isEmpty() ? NULL :commentList->first();
        while (t && t->line <= sl->startToken->line) {
          // Check if the comment token should be promoted to a slot annotation.
          if (t->line < sl->startToken->line) {
            if (t->string->line_count() + t->line == sl->startToken->line) {
              // ex. "Yet another method"
              //     fisk = (fugl * flodhest).
              sl->annotation = extend_annotation_with_comment(sl->annotation, t);
            } else { 
              // In case we cannot find a slot for the comment a warning is
              // printed out and the comment is added to the object annotation.
              print_comment_warning(
                                    "Warning: comment is added as the object annotation",
                                    sl, t, source_file);
              annotation = extend_annotation_with_comment(annotation, t);
            }
          } else {
            // ex. "_" fisk = (12 + 12). "Return an awesome number"
            sl->annotation = extend_annotation_with_comment(sl->annotation, t);
          }
          commentList->remove(t);
          t = commentList->isEmpty() ? NULL :commentList->first();
        }
      }
    }
    sl->addCommentAnnotations(scanner);
  }
  body->addCommentAnnotations(scanner);
}
