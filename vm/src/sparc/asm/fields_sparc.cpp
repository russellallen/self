/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "fields_sparc.hh"  

# include "_fields_sparc.cpp.incl"



int32 getJumpImm(int32* instp) {
  assert(isJump(instp), "expecting a jmpl");
  assert(isImmed(instp), "expecting an offset");
  assert(isSetHi(instp - 1), "expecting a sethi before the jmpl");
  int32 val = getSetHiImm(instp - 1);
  val += getArithImm(instp);
  return val;
}

void setJumpImm(int32* instp, int32 val) {
  assert(isJump(instp), "expecting a jmpl");
  assert(isImmed(instp), "expecting an offset");
  assert(isSetHi(instp - 1), "expecting a sethi before the jmpl");
  setSetHiImm(instp - 1, val);
  setArithImm(instp, val);
  MachineCache::flush_instruction_cache_word(instp - 1);
  MachineCache::flush_instruction_cache_word(instp);
}


char* address_of_overwritten_NIC_save_instruction(int32* orig_save_addr) {
 if ( op(orig_save_addr)  ==  02  &&  op3(orig_save_addr) == 074) 
   return NULL; // not overwritten
   
  // the instruction must have been patched with a branch;
  assert(op(orig_save_addr)   ==  00 &&
         cond(orig_save_addr) == 010 &&
         op2(orig_save_addr)  ==  02,
         "must be a unconditional branch instruction");
         
  return ((char*) orig_save_addr) + disp(orig_save_addr);
}


void check_branch_relocation( void*, void*, int32) {
  return; // not a problem on SPARC (as far as I know)
}