#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma interface

  
  /* Format of di desc (offsets from return address):
    
    0: jmp ...
    1: <delay slot>
    2: nmln #1
    3: nmln #2
    
    */
  
 public:
  enum {
	  di_jump_address_offset  = 0,
	  di_depend_offset        = 8,
	  
	  di_addr_desc_offset     = di_jump_address_offset - 4
	};
  
