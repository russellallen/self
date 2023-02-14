# if defined(__ppc__) || defined(__powerpc__)
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */



// included into midst of class nmethod

private:
  fint _max_no_of_outgoing_args_and_rcvr;
  fint _number_of_saved_nonvolatile_registers;
  fint _number_of_memory_locals;
  bool _are_register_arguments_saved_on_stack;
 
public:
  fint max_no_of_outgoing_args_and_rcvr()       { return _max_no_of_outgoing_args_and_rcvr;       }
  fint number_of_saved_nonvolatile_registers()  { return _number_of_saved_nonvolatile_registers; }
  fint number_of_memory_locals()                { return _number_of_memory_locals; }
  fint incoming_arg_register_count()            { return min(NumIArgRegisters, _incoming_arg_count); }
  bool are_register_arguments_saved_on_stack()  { return _are_register_arguments_saved_on_stack; }
# endif // __ppc__
