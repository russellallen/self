# ifdef __ppc__
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// power pc frame layout:

/*
                                 prev frame
 ----------------------------------------------
 
 fp save area
 gpr save area
 cr save area
 locals
 dyn alloc
 ...
 arg area
 saved PC
 saved RTOC?
 saved SP


------------------------------------------------
                              next frame
*/




class frame;



class Conversion;
class Recompilation;

class ppc_sp {
  friend class ::frame;
  
 protected:
  
  // coercions
  
  frame* as_frame() { return (frame*)this; }
  oop*   as_oops()  { return (oop*)  this; }
  
  // link
  
  ppc_sp*   link()    { return *link_addr(); }
  void      set_link(ppc_sp* x) { *link_addr() = x; }
  ppc_sp**  link_addr() { return &((ppc_sp**) this)[saved_sp_offset]; }
  void      adjust_link(int32 delta) { *(char**)link_addr() += delta; }
  
  // return addr
  
  char**        return_addr_addr() { return &((char**) this)[saved_pc_offset]; }
  char*         return_addr() { return *return_addr_addr(); } // the return PC of the code that was using THIS frame (SP was eq to this)
  void      set_return_addr(char* x) { *return_addr_addr() = x; }
  
  oop* locals();
    
 public:
  ppc_sp* push_new_sp( char* pc,
                       fint size_in_oops,
                       bool zapAlways = false);

};
  
# endif // __ppc__
