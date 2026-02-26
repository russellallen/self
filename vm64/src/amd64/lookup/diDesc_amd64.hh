# if defined(__i386__) || defined(__x86_64__)
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


  
  /* Format of di desc (offsets from return address):
    
    -1: jmp ...
    0: nmln #1
    1: nmln #2
    
    */
  
 public:
  
  enum {
    di_jump_address_offset  = -4,  // jump disp, not jump inst
    di_depend_offset        =  0,  
    
    di_addr_desc_offset     = di_jump_address_offset  
  };
# endif // defined(__i386__) || defined(__x86_64__)
