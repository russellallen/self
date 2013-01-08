/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



inline void abstract_interpreter_bytecode_info::decode(fint c) {
  code= c;
  op= getOp(code);
  x= getIndex(code);
}


inline fint abstract_interpreter::get_argument_count() {
  # if GENERATE_DEBUGGING_AIDS
  if ( CheckAssertions   &&   mi.instruction_set == TWENTIETH_CENTURY_PLUS_ARGUMENT_COUNT_INSTRUCTION_SET
  &&   is.argument_count != get_selector()->arg_count()) {
    fatal2("argument_count %d does not match selector's argument count %d",
           is.argument_count,
           get_selector()->arg_count());
  }
  # endif
  return mi.instruction_set == TWENTIETH_CENTURY_PLUS_ARGUMENT_COUNT_INSTRUCTION_SET ? is.argument_count : get_selector()->arg_count();
}


inline abstract_interpreter_interbytecode_state::abstract_interpreter_interbytecode_state() {
  reset_lexical_level();
  reset_index();
  reset_send_modifiers();
  last_literal= 0;
}
  

inline abstract_interpreter::abstract_interpreter(oop meth)
 : mi((methodMap*)meth->map()) {
  pc= mi.firstBCI();
  error_msg= 0;
}


inline abstract_interpreter::abstract_interpreter(methodMap *m)
 : mi(m) {
  pc= mi.firstBCI();
  error_msg= 0;
}


inline abstract_interpreter::abstract_interpreter(byteVectorOop codes,
                                                  objVectorOop literals)
 : mi(codes, literals) {
  pc= mi.firstBCI();
  error_msg= 0;
}


inline stringOop abstract_interpreter::get_selector() { 
  oop s = get_literal();
  return check(check_selector_string, s)  
    ?  stringOop(s)  
    :  new_string("Error: cannot find selector");
}
