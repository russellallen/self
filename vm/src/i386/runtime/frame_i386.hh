#pragma once
# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// This file is INCLUDED into the middle of the frame class.



// See frame_format_i386.h

  friend class i386_sp;
  
 private:
  i386_sp* my_sp() { return (i386_sp*)this; }
  i386_bp* my_bp() { return my_sp()->my_bp();  }
  
 public:

  oop* first_incoming_arg_addr();
  oop* first_local_addr(); // must be receiver_offset

# endif // __i386__
