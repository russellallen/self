#pragma once
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */



# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
# include "machineCache.hh"
# include "runtime.hh"




class DIDesc {
 public:

# if defined(__ppc__)  
# include "diDesc_ppc.hh"
# elif defined(__i386__)
# include "diDesc_i386.hh"
# else
# include "diDesc_sparc.hh"
# endif
  static DIDesc* DIDesc_from_addrDesc_addr(pc_t* a) { 
    return (DIDesc*) ((char*)a - di_addr_desc_offset);
  }
  static DIDesc* DIDesc_from_call_instruction(void* a) {
    return (DIDesc*) (((char*)a) - di_jump_address_offset);
  }
  oop* as_oop_array() { return (oop*) this; }
  pc_t* jump_addr_addr() {
    return (pc_t*) ((char*)this + di_jump_address_offset); }
  nmln* dependency() {
    return (nmln*) ((char*)this + di_depend_offset); }
  
  pc_t jump_addr();
  void set_jump_addr(pc_t insts);
  
  void shift_jump_addr(int32 delta) {
    set_jump_addr((pc_t) ((int32) jump_addr() + delta)); }
  
  void unlink_me();
  
  pc_t sendMessage( frame* lookupFrame,
                     oop receiver,
                     oop selector,
                     oop delegatee,
                     sendDesc* sd,
                     oop arg1 );

  nmethod* lookup_compile_and_backpatch( compilingLookup* L );
  void print();
};

extern "C" {
  pc_t SendDIMessage(sendDesc* ic, frame* lookupFrame, DIDesc* dc,
                      int32 verified, oop receiver, oop arg1);
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
