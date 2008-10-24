/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "slotRef.hh"
# include "_slotRef.cpp.incl"

void nonexistentSlotRef::print_short() {
  lprintf("nonexistentSlotRef 0x%lx", (unsigned long) this);
}

void nonexistentSlotRef::print() {
  printIndent();
  lprintf("contents: 0x%lx\n", contents());
  contents()->print();
}

void realSlotRef::print_short() {
  lprintf("realSlotRef 0x%lx", (unsigned long)this);
}

void realSlotRef::print() {
  holder->print();
  printIndent();
  lprintf("desc: 0x%lx (", desc);
  desc->name->string_print();
  lprintf(")\n");
}

void counterfactualSlotRef::print_short() {
  lprintf("counterfactualSlotRef 0x%lx", (unsigned long) this);
}

void counterfactualSlotRef::print() {
  lprintf("contents: 0x%lx\n", (unsigned long)contents());
  lprintf("methodHolder: 0x%lx\n", (unsigned long)_methodHolder_or_map);
  contents()->print();
  _methodHolder_or_map->print();
}

oop realSlotRef::contents() {
  return
    desc->is_map_slot()
    ? desc->data
    : holder->get_slot(desc);
}


void realSlotRef::set_contents(oop x) {
  assert(desc->is_obj_slot(), "must be object slot to assign");
  holder->set_slot(desc, x);
}


ResultType realSlotRef::resultType(oop sel) {
  if (desc->is_arg_slot())  return dataResult;
  if (desc->is_map_slot())
    if (desc->data->has_code()) {
      // not sure why this is here, compiler uses it (dmu)
      ((objectLookupTarget*) holder)->value_constrained = true;
      return methodResult;
    }
    else                        return constantResult;
  if (stringOop(sel)->is_1arg_keyword())  return assignmentResult;
  else                                    return dataResult;
}

// common routine used when mh obj may not be same as rcvr

oop realSlotRef::methodHolder_if_not_rcvr() {
  return holder->is_object()
    ?  ((objectLookupTarget*)holder)->obj
    :  MH_TBD; // not known statically
}

oop realSlotRef::methodHolder_or_map(oop rcvr) {
  // holder same as receiver, not necessarily same object
  return holder->is_receiver() 
    ?  rcvr
    :  methodHolder_if_not_rcvr();
}


// optimizes for objects with methods in them by generalizing mh to map
// see key.h

oop realSlotRef::generalized_methodHolder_or_map(oop rcvr) {
  Unused(rcvr);
  // holder same as receiver, not necessarily same object
  return holder->is_receiver() 
    ?  holder->map()->enclosing_mapOop()
    :  methodHolder_if_not_rcvr();
}


bool abstractSlotRef::EQsr(abstractSlotRef* s) {
  return as_real()->EQsr(s->as_real());
}


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

// returns entry point

char* abstractSlotRef::interpretForCompiledSender(oop receiver, oop sel,
                                                  oop arg1 ) {
  oop res = interpretData( receiver, sel, arg1 );
  if ( res != badOop ) {
    ReturnResult_stub_result = res;
    return first_inst_addr(ReturnResult_stub);
  } else {
    sneaky_method_argument_to_interpret = contents();
    return first_inst_addr(interpret_from_compiled_sender);
  }
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)



// handles data & assgn slots

oop abstractSlotRef::interpretData(oop receiver, oop sel, oop arg1) {
  switch (resultType(sel)) {

   case constantResult:
   case dataResult:
    return contents();

   case assignmentResult:
    set_contents(arg1);
    return receiver;

   case methodResult:
    return badOop;

   default:
    fatal("should never happen");
    return NULL;
  }
}


// caller must preserve args!

oop abstractSlotRef::interpret( oop receiver, oop sel, oop del,
                                oop* argp, int32 nargs) {
  oop res = interpretData( receiver, sel, *argp );
  if (res != badOop) return res;
  res = ::interpret( receiver,
                     sel,
                     del,
                     contents(),
                     methodHolder_or_map(receiver),
                     argp,
                     nargs);
  return res;
}

