# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// intel frame layout:

/*
                                 prev frame
 ----------------------------------------------
 
 arg area
 saved PC 
 saved bp <- base reg
 curr PC
 frame chain <- last extra
 rcvr  <- last ebp


------------------------------------------------
                              next frame
*/




class frame;



class Conversion;
class Recompilation;

class i386_bp {
};

class i386_sp {
  friend class ::frame;
  
 protected:
  
  // coercions
  
  frame* as_frame() { return (frame*)this; }
  oop*   as_oops()  { return (oop*)  this; }
  
  // link
  
  i386_sp*   link()    { return *link_addr(); }
  void      set_link(i386_sp* x) { *link_addr() = x; }
  i386_sp**  link_addr() { return &((i386_sp**) this)[saved_bp_offset]; }
  void      adjust_link(int32 delta) { *(char**)link_addr() += delta; }
  
  i386_bp*  my_bp() { return (i386_bp*)link(); }
  
  // return addr
  
  char**        return_addr_addr() { return &((char**) this)[saved_pc_offset]; }
  char*         return_addr() { return *return_addr_addr(); } // the return PC of the code that was using THIS frame (SP was eq to this)
  void      set_return_addr(char* x) { *return_addr_addr() = x; }
  
  oop* locals();
    
 public:
  i386_sp* push_new_sp( char* pc,
                       fint size_in_oops,
                       bool zapAlways = false);

};

# endif // __i386__
