/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// This file is INCLUDED into the middle of the frame class.


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

 private:

  # if defined(FAST_COMPILER) || defined(SIC_COMPILER)
    void do_local_registers();
    fint do_stack_locations();
    void do_above_saved_registers(fint);
  # endif
