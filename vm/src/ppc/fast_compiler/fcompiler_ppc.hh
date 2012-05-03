# ifdef __ppc__
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


public:
  fint  max_no_of_outgoing_args_and_rcvr();
  fint  number_of_saved_nonvolatile_registers();
  fint  number_of_memory_locals();
  bool  are_register_arguments_saved_on_stack();
# endif // __ppc__
