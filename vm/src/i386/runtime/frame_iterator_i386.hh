#pragma once
# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// This file is INCLUDED into the middle of the frame class.




 private:

  nmethod* nm;
  
  void do_incoming_arguments_of_vm_frame_called_from_self();
  void do_incoming_arguments();
  void do_memory_locals();
  bool check_for_overwriting_patched_frame_saved_outgoing_args(oop* p, fint idx = -1);


# endif // __i386__
