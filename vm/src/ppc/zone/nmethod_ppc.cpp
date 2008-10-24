# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation  "nmethod_ppc.hh"

# include "_nmethod_ppc.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

void nmethod::get_platform_specific_data(AbstractCompiler* c) {
  _max_no_of_outgoing_args_and_rcvr      = c->max_no_of_outgoing_args_and_rcvr();
  _number_of_saved_nonvolatile_registers = c->number_of_saved_nonvolatile_registers();
  _number_of_memory_locals               = c->number_of_memory_locals();
  _are_register_arguments_saved_on_stack = c->are_register_arguments_saved_on_stack();
}

void nmethod::print_platform_specific_data() {
  ++Indent;
  lprintf( "max_no_of_outgoing_args_and_rcvr      = %d\n", max_no_of_outgoing_args_and_rcvr() );
  lprintf( "number_of_saved_nonvolatile_registers = %d\n", number_of_saved_nonvolatile_registers() );
  lprintf( "number_of_memory_locals               = %d\n", number_of_memory_locals() );
  lprintf( "are_register_arguments_saved_on_stack = %d\n", are_register_arguments_saved_on_stack() );
  --Indent;
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == PPC_ARCH
