#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "regs.hh"
# include "runtime.hh"
# include "top.hh"




// Some machines (e.g. PPC) place a limit on fast branch spans
// This causes problems for backpatched calls which are normally
// short (within the zone) but are sometimes longer (e.g. SendMessage_stub)
// So, we put long branches to the stubs in the zone (the TRAPDOORS) and
// use short branches to the trapdoors in the nmethods.

// -- dmu 6/99

class Trapdoors: public CHeapObj {
 private:
 public:
  Trapdoors(pc_t start_of_code, int32 code_size); // make trapdoors, put code at start_of_code
  
  int32 trapdoor_bytes(); // size of trapdoor code
  
  // stub addresses (first inst addr)
  pc_t   SendMessage_stub_td(Location tmp = IllegalLocation);
  pc_t SendDIMessage_stub_td(Location tmp = IllegalLocation);
  pc_t     Recompile_stub_td(Location tmp = IllegalLocation);
  pc_t   DIRecompile_stub_td(Location tmp = IllegalLocation);
  
  pc_t  follow_trapdoors(pc_t); // if arg is trapdoor, return its destination
  
# if defined(__ppc__)
# include "trapdoors_ppc.hh"
# elif defined(__i386__)
# include "trapdoors_i386.hh"
# else
# include "trapdoors_sparc.hh"
# endif
};
