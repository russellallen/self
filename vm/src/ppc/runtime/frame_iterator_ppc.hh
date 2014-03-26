#pragma once
# ifdef __ppc__
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

// This file is INCLUDED into the middle of the frame class.




 private:
  
  void do_saved_volatile_outgoing_argument_registers(fint vol_reg_sp_offset);
  
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
    nmethod* nm;
    void do_saved_nonvolatile_registers();
    void do_incoming_arguments();
    void do_memory_locals();
    
    bool check_for_overwriting_patched_frame_saved_outgoing_args(oop* p, fint idx = -1);
# endif

# endif // __ppc__
