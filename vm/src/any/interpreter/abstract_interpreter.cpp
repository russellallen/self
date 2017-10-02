/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "abstract_interpreter_inline.hh"
# include "blockOop_inline.hh"
# include "label_inline.hh"
# include "oop_inline.hh"
# include "space_inline.hh"


void abstract_interpreter_method_info::init(byteVectorOop c, objVectorOop l) {
     codes_object = c;
  literals_object = l;
  codes           = (unsigned char*)codes_object->bytes();
  literals        = literals_object->objs();
  length_codes    =    codes_object->length();
  length_literals = literals_object->length();
  
  if (codes_object->length() == 0)
    instruction_set = TWENTIETH_CENTURY_INSTRUCTION_SET;
  else {
    char first_code = codes_object->byte_at(0);
    instruction_set =     getOp((u_char)first_code) == INSTRUCTION_SET_SELECTION_CODE
                        ? (InstructionSetKind) getIndex(first_code)
                        : TWENTIETH_CENTURY_INSTRUCTION_SET;
    assert( instruction_set == TWENTIETH_CENTURY_INSTRUCTION_SET
        ||  0 <= instruction_set  &&  instruction_set <= LAST_INSTRUCTION_SET,
        "bad instruction set");
  }    
}



abstract_interpreter_method_info::abstract_interpreter_method_info(
                                                              methodMap *m)  {
  assert(m->has_code(), "cannot interpret data");
  _map_oop       = m->enclosing_mapOop();
  init(m->codes(), m->literals());
}    


abstract_interpreter_method_info::abstract_interpreter_method_info(
                                         byteVectorOop codes,
                                         objVectorOop literals) {
  _map_oop= mapOop(badOop);
  init(codes, literals);
}    


void abstract_interpreter_method_info::print_short() {
  lprintf("method_map %#lx, "
         "codes %#lx, length %d,  literals %#lx, length %d\n",
         map(), 
         codes,         length_codes,
         literals,      length_literals);
}


void abstract_interpreter_bytecode_info::print_short() {
  lprintf( "code %d, op %d, index %d\n", code, op, x);
}


void abstract_interpreter_interbytecode_state::print_short() {
  lprintf( "lexical_level %d, index %d,"
          " delegatee %#lx, is_undirected_resend %s,"
          " argument_count %d\n", 
          lexical_level, index, 
          (unsigned long)delegatee, 
          is_undirected_resend ? "true" : "false",
          argument_count);
}




void abstract_interpreter::print_short() {
  lprintf( "pc %d\n", pc);
  mi.print_short();
  bc.print_short();
  is.print_short();
}



void abstract_interpreter::interpret_method() {
  for ( ;  pc < mi.length_codes;  ++pc ) {
    interpret_bytecode();
    if ( get_error_msg() )
      return;
  }
}

void abstract_interpreter::fetch_and_decode_bytecode() {
  bc.decode(mi.codes[pc]);

  // when asserts are turned on, it is illegal to carry
  // a non-zero index during NO_OPERAND_CODE's.
  // So the following predicate is technically not needed.
  // But I don't want illegal programs doing strange things
  // with asserts off, so put it in anyway -- dmu.
  if ( bc.op != NO_OPERAND_CODE ) 
    is.index = (is.index << INDEXWIDTH) | bc.x;
}

#   define interpret(opExpr) \
      CONC( pre_,opExpr)(); \
      CONC(  do_,opExpr)(); \
      CONC(post_,opExpr)();

# define case_op(opName) \
  case opName: interpret(opName)
  
void abstract_interpreter::dispatch_bytecode() {
  switch (bc.op) {
   default: interpret(illegal_code);               break;
   case_op(LEXICAL_LEVEL_CODE);                    break;
   case_op(READ_LOCAL_CODE);                       break;
   case_op(WRITE_LOCAL_CODE);                      break;
   case_op(INDEX_CODE);                            break;
   case_op(LITERAL_CODE);                          break;
   case_op(DELEGATEE_CODE);                        break;
   case_op(ARGUMENT_COUNT_CODE);                   break;
   case_op(SEND_CODE);                             break;
   case_op(IMPLICIT_SEND_CODE);                    break;
   
   case_op(BRANCH_CODE);                           break;
   case_op(BRANCH_TRUE_CODE);                      break;
   case_op(BRANCH_FALSE_CODE);                     break;
   case_op(BRANCH_INDEXED_CODE);                   break;
   
   case     NO_OPERAND_CODE:
    switch (bc.x) {
     default: interpret(illegal_no_operand_code);  break;
     case_op(SELF_CODE);                           break;
     case_op(POP_CODE);                            break;
     case_op(UNDIRECTED_RESEND_CODE);              break;
     case_op(NONLOCAL_RETURN_CODE);                break;
    }
    break;
  }
} 



void abstract_interpreter::do_LITERAL_CODE() { 
 do_literal_code( get_literal()); 
}



bool abstract_interpreter_method_info::verify() {
  if (_map_oop->verify_oop())
    ;
  else {
    error1("bad oop in abstract_interpreter_method_info 0x%x", this);
    return false;
  }
  if ( codes           == (unsigned char*)map()->codes()->bytes()
  &&   length_codes    == map()->codes()->length()
  &&   literals        == map()->literals()->objs()
  &&   length_literals == map()->literals()->length() )
    ;
  else {
    error1("inconsistency in abstract_interpreter_method_info 0x%x", this);
    return false;
  }
  if (!literals_object->is_objVector()) {
    error2("literals_object 0x%x in "
           "abstract_interpreter_method_info 0x%x not objVector",
           literals_object,
           this);
    return false;
  }
  if (!codes_object->is_byteVector()) {
    error2("codes_object 0x%x in "
           "abstract_interpreter_method_info 0x%x not byteVector",
           codes_object,
           this);
    return false;
  }
  return true;
}
  

bool abstract_interpreter::verify() {
  return mi.verify();
}


void abstract_interpreter::check_index_range(abstract_interpreter *ai, oop) {
  if ( ai->is.index < ai->mi.length_literals ) return;
  ai->set_error_msg( "index out of bounds");
}

void abstract_interpreter::check_selector_string(abstract_interpreter *ai, oop s) {
  if ( s->is_string() ) return;
  ai->set_error_msg( "selector must be a string");
}

void abstract_interpreter::check_branch_target(abstract_interpreter *ai, oop p) {
  ai->check_branch_target(p);
}

void abstract_interpreter::check_no_send_modifiers(abstract_interpreter *ai, oop) {
  ai->set_error_msg( ai->is.check_no_send_modifiers());
}

void abstract_interpreter::check_no_lexical_level(abstract_interpreter *ai, oop) {
  ai->set_error_msg( ai->is.check_no_lexical_level());
}

void abstract_interpreter::check_no_two_send_modifiers(abstract_interpreter *ai, oop) {
  ai->set_error_msg( ai->is.check_no_two_send_modifiers());
}

void abstract_interpreter::check_no_operand(abstract_interpreter *ai, oop) {
  ai->set_error_msg( ai->is.check_no_operand());
}

void abstract_interpreter::check_delegatee(abstract_interpreter *ai, oop) {
  oop p= ai->get_literal();
  Unused(p); //debugging
  if ( !ai->error_msg  &&  !ai->get_literal()->is_string())
    ai->set_error_msg( "delegatee must be string"); 
}

void abstract_interpreter::check_no_argument_count(abstract_interpreter *ai, oop) {
  if (ai->is.argument_count != 0)
    ai->set_error_msg( "should not have argument count before argument count setter");
}

void abstract_interpreter::check_branch_vector(abstract_interpreter *ai, oop) {
  oop p= ai->get_literal();
  if (ai->error_msg)  return;
  if (!p->is_objVector()) {
    ai->set_error_msg( "branch vector must be object vector");
    return;
  }
  objVectorOop v= objVectorOop(p);
  for (int32 i = 0;  i < v->length();  ++i) {
    oop p= v->obj_at(i);
    check_branch_target(ai, p);
    if (ai->error_msg) return;
  }
}

void abstract_interpreter::check_for_pop(abstract_interpreter *ai, oop n) {
  ai->check_for_pop(n);
}

