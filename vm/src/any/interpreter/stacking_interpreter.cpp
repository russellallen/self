/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "blockOop_inline.hh"
# include "generation_inline.hh"
# include "label_inline.hh"
# include "oop_inline.hh"
# include "space_inline.hh"
# include "stacking_interpreter.hh"
# include "stringOop.hh"


void stacking_interpreter::do_send_code( bool isSelfImplicit, 
                                            stringOop /*selector*/,
                                            fint arg_count ) {
  if ( !get_error_msg()
  &&    check_and_pop( arg_count + !isSelfImplicit))
    push(); // for result
}
