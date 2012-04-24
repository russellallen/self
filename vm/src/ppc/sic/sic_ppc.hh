# ifdef __ppc__
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// included in sic.hh

public:
  int32  numberOfIncomingArgsAndRcvrInRegisters();
  int32  max_no_of_outgoing_args_and_rcvr();
  
  // When creating a PPC stack frame, we need to know the number of non-volatile
  // registers that need to be saved (see stackTempCount()).
  int32  number_of_saved_nonvolatile_registers();
  int32  number_of_memory_locals();

  bool   are_register_arguments_saved_on_stack() { return _are_register_arguments_saved_on_stack; }
  void   save_register_arguments_on_stack() { _are_register_arguments_saved_on_stack = true; }

  bool   is_incoming_register_arg_or_rcvr(Location l);
  
  void   update_number_of_saved_nonvolatile_registers_for(Location l);


public:
  Label* nlrLabel;     // used for caching NLR return

private:
  int32 _number_of_saved_nonvolatile_registers;
  bool _are_register_arguments_saved_on_stack;

# endif // __ppc__
