/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "stacking_interpreter.hh"
# include "_stacking_interpreter.cpp.incl"


void stacking_interpreter::do_send_code( bool isSelfImplicit, 
                                            stringOop /*selector*/,
                                            fint arg_count ) {
  if ( !get_error_msg()
  &&    check_and_pop( arg_count + !isSelfImplicit))
    push(); // for result
}
