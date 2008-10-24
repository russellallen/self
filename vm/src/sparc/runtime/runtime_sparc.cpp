/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation  "runtime_sparc.hh"

# include "_runtime_sparc.cpp.incl"


bool check_saved_byte_map_base() {
  if (Byte_Map_Base() != (char*)saved_globals[ByteMapBaseReg - G0]) {
    error2("rSet: saved_globals for ByteMapBaseReg corrupted (%#lx vs. %#lx)",
           saved_globals[ByteMapBaseReg - G0], Byte_Map_Base());
    return false;
  }
  return true;
}


char* adjust_initial_SP(char* init_SP) {
	init_SP -= WindowSize * oopSize * 2;
	init_SP  = (char*)(int32(init_SP) & ~((frame_word_alignment << 2) - 1)); // doubleword-align it
	return init_SP;
}


oop failure_oop_for_restarting_uncommon_prim() {
  return saved_outregs[0];
  // Cannot check this; OutgoingArgs... not set for uncommon since not really args
  // assert(s == OutgoingArgsOfReturnTrapOrRecompileFrame->obj_at(0), "old vs. new");
}

void fillRegisterValue(Location loc, oop b) {
  saved_outregs[loc - ReceiverReg] = b;
}

void set_flags_for_platform() {
}
