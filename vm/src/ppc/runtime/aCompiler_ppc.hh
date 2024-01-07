# if defined(__ppc__) || defined(__powerpc__)
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


public:
  virtual fint  max_no_of_outgoing_args_and_rcvr() = 0;
  virtual fint  number_of_saved_nonvolatile_registers() = 0;
  virtual fint  number_of_memory_locals() = 0;
  virtual bool  are_register_arguments_saved_on_stack() = 0;
# endif // __ppc__
