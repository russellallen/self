# if  TARGET_ARCH == I386_ARCH || TARGET_ARCH == X86_64_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

  

# pragma implementation "fields_amd64.hh"

# include "_fields_amd64.cpp.incl"


pc_t  get_target_of_branch_instruction(inst_t* instp) {
  // must be long disp!
  // instp points to start of displacements
  return (char*) (*((int32*)instp) + instp + sizeof(int32));
}


pc_t get_target_of_C_call_site(inst_t* instp) {
  return get_target_of_branch_instruction(instp);
}


pc_t get_target_of_Self_call_site(inst_t* instp) {
  // On i386, instp is pointer to word displacement in call instruction
  return (char*)instp + oopSize + *(int32*)instp;
}  


void set_target_of_Self_call_site(inst_t* instp, void* target) {
  // On i386, instp is pointer to word displacement in call instruction
  *(int32*)instp = (inst_t*)target - ((inst_t*)instp + oopSize);
}


char* address_of_overwritten_NIC_save_instruction(int32* orig_save_addr) {
  fatal("unused for Intel");
  return 0;
}


void check_branch_relocation( void* fromArg, void* toArg, int32 countArg) {
  fatal("unused for Intel");
}


void set_space_reserved_by_enter_instruction( pc_t past_enter, int32 word_count ) {
  u_short s = word_count * BytesPerWord;
  assert((int32)s == word_count * BytesPerWord, "too big");
  *(u_short*)(past_enter - 3) = s;
}  

# endif // TARGET_ARCH == I386_ARCH
