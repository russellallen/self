# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "trapdoors_i386.hh"
# include "_trapdoors_i386.cpp.incl"

Trapdoors::Trapdoors(pc_t, int32) {}

int32 Trapdoors::trapdoor_bytes() { return 0; }

pc_t Trapdoors::  SendMessage_stub_td(Location) { return first_inst_addr(   ::SendMessage_stub); }
pc_t Trapdoors::SendDIMessage_stub_td(Location) { return first_inst_addr( ::SendDIMessage_stub); }
pc_t Trapdoors::    Recompile_stub_td(Location) { return first_inst_addr(     ::Recompile_stub); }
pc_t Trapdoors::  DIRecompile_stub_td(Location) { return first_inst_addr(   ::DIRecompile_stub); }

pc_t Trapdoors::follow_trapdoors(pc_t target) { return target; } // no trapdoors


# endif // TARGET_ARCH == I386_ARCH
