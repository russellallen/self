# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# include "asm_inline.hh"
# include "label_inline.hh"
# include "trapdoors.hh"

int32 Trapdoors::trapdoor_bytes() { return _bytes_of_code; }

Trapdoors::Element  Trapdoors::  SendMessage_stub_elem( (void*)   SendMessage_stub, R0       );
Trapdoors::Element  Trapdoors::SendDIMessage_stub_elem( (void*) SendDIMessage_stub, DITempReg);
Trapdoors::Element  Trapdoors::    Recompile_stub_elem( (void*)     Recompile_stub, R0       );
Trapdoors::Element  Trapdoors::  DIRecompile_stub_elem( (void*)   DIRecompile_stub, R0       );
Trapdoors::Element  Trapdoors::SaveSelfNonVolRegs_elem( (void*) SaveSelfNonVolRegs, R0       );

pc_t Trapdoors::  SendMessage_stub_td(Location tmp) { return   SendMessage_stub_elem.start(tmp); }
pc_t Trapdoors::SendDIMessage_stub_td(Location tmp) { return SendDIMessage_stub_elem.start(tmp); }
pc_t Trapdoors::    Recompile_stub_td(Location tmp) { return     Recompile_stub_elem.start(tmp); }
pc_t Trapdoors::  DIRecompile_stub_td(Location tmp) { return   DIRecompile_stub_elem.start(tmp); }

pc_t Trapdoors::  SaveSelfNonVolRegs_td(Location tmp) { return SaveSelfNonVolRegs_elem.start(tmp); }

 
 
Trapdoors::Trapdoors(pc_t code_start, int32 code_size) {
  ResourceMark rm; // for assembler & elements
  Assembler* oldAssembler = theAssembler;
  Assembler* a = theAssembler = new Assembler(1000, 1000, false, false);
  
    SendMessage_stub_elem.gen(a, code_start);
  SendDIMessage_stub_elem.gen(a, code_start);
      Recompile_stub_elem.gen(a, code_start);
     DIRecompile_stub_elem.gen(a, code_start);
  SaveSelfNonVolRegs_elem.gen(a, code_start);
  
  _bytes_of_code = roundTo(a->instsLen(), oopSize);
  if ( _bytes_of_code > code_size )
    fatal2("trapdoors are too big: are %d bytes, should be <= %d bytes", _bytes_of_code, code_size);
  copy_bytes_up(a->instsStart, code_start, _bytes_of_code);
  
  assert( a->locsLen() == 0, "");
  
  a->finalize(); 
  theAssembler = oldAssembler;
}


void Trapdoors::Element::gen(Assembler* a, pc_t code_start) {
  _start = code_start + a->offset();
  // force long because we do not relocate the code in the trapdoors
  a->long_branch_to(dest_fn_start, VMAddressOperand, tmp_reg, false);
}


pc_t Trapdoors::follow_trapdoors(pc_t target) { 
  pc_t result;
  
  if ( ( result=     SendMessage_stub_elem.translate(target)) != NULL )  return result;
  if ( ( result=   SendDIMessage_stub_elem.translate(target)) != NULL )  return result;
  if ( ( result=      Recompile_stub_elem.translate(target)) != NULL )  return result;
  if ( ( result=    DIRecompile_stub_elem.translate(target)) != NULL )  return result;
  if ( ( result=   SaveSelfNonVolRegs_elem.translate(target)) != NULL )  return result;
  
  return target;
}


pc_t Trapdoors::Element::translate(pc_t targ) {  return targ == _start  ?  dest_fn_start  :  NULL;  }
# endif // TARGET_ARCH == PPC_ARCH
