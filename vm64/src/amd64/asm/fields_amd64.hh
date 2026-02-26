# if defined(__i386__) || defined(__x86_64__)
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// helper functions to access individual fields of instructions

typedef u_char inst_t;


 enum OPCD_codes { 
  opcd_ImmCall = 0xe8,
  opcd_ud2_1 = 0x0f,
  opcd_ud2_2 = 0x0b
};


// const int MaxUnimpImm = 1 << 
const int UncommonRestartBit = 1 << 31;


inline bool isImmediate(smiOop value) {
  return true;
}


inline bool isCall(int32* instp) {
  // instp points to what?
  fatal("unimp intel");
  return ((inst_t*)instp)[-1] == opcd_ImmCall;
}


inline bool isImmediateCall(inst_t* instp /* really after opcode*/ ) {
  return instp[-1] == opcd_ImmCall; 
}


inline bool isUnimp(int32* instp) {
  return instp[0] == opcd_ud2_1   && instp[1] == opcd_ud2_2;
}


inline bool is_end_of_enter(pc_t x) { return x[-4] == (char)0xc8  &&  x[-1] == (char)0; }


pc_t get_target_of_branch_instruction(inst_t* instp);
pc_t get_target_of_Self_call_site(    inst_t* instp);
pc_t get_target_of_C_call_site(       inst_t* instp);

void set_target_of_Self_call_site(    inst_t* instp,  void* target);

void set_space_reserved_by_enter_instruction( pc_t past_enter, int32 word_count );

# endif // defined(__i386__) || defined(__x86_64__)
