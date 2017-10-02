#pragma once
# ifdef __ppc__
/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

// This file is INCLUDED into the middle of the frame class.




// See frame_format_ppc.h

  friend class ppc_sp;
  
 private:
  ppc_sp* my_sp() { return (ppc_sp*)this; }
  
 public:
  oop*            first_saved_nonvolatile_register_addr(nmethod* nm); // addr of first (lowest) saved nonvol reg
  oop*  my_callees_last_saved_nonvolatile_register_addr() { return (oop*)this - 1; } // addr of last (R31) saved nonvol reg FOR MY CALLEE's frame

  void** location_secondary_addr(Location r, RegisterLocator* rl);
  
  oop*   location_addr_of_incoming_argument_register(Location r, fint offset = 0);

  

# endif // __ppc__
