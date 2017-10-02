# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */



# include "asm_inline.hh"
# include "countPattern.hh"
# include "fields.hh"
# include "label_inline.hh"
# include "regs.hh"
# include "zone.hh"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)
 

  void CountCodePattern::initCounting() {
    // general count stub; 
    //  0: lea   count_addr, %eax
    //  6: movl  (%eax), %edx
    //  8: leal  1(%edx), %edx
    // 11: movl  %edx, (%eax)
    // 13: jmp    jump_addr
    // 18: <end>
    
    Assembler* oldAssembler = theAssembler;
    Assembler* a = theAssembler = new Assembler(100, 100, false, true);
    a->incl( no_reg, initial_count_addr, VMAddressOperand);
    countAddr_offset = a->offset() - sizeof(int);
    a->jmp(initial_nmAddr, CodeAddressOperand);
    nmAddr_offset = a->offset() - sizeof(int);
    instsSize = a->offset();

    pattern = (pc_t)AllocateHeap(instsSize, "countStub pattern");
    copy_bytes(a->instsStart, pattern, instsSize);
    a->finalize();
    theAssembler = oldAssembler;
  }


  void CountCodePattern::initComparing() {
    // general count stub;
    //  0: lea   count_addr, %eax
    //  6: movl  (%eax), %edx
    //  8: leal  1(%edx), %edx
    // 11: movl  %edx, (%eax)
    // 13: cmpl  %edx, limit
    // ??: jne jump_addr
    //     call recompile_addr
 
    
    Assembler* oldAssembler = theAssembler;
    Assembler* a = theAssembler = new Assembler(100, 100, false, true);

    a->leal(no_reg, initial_count_addr, VMAddressOperand, edx);
    countAddr_offset = a->offset() - sizeof(int32);
    a->movl(edx, 0, NumberOperand,  eax);
    a->incl(eax);
    a->movl(eax,  edx, 0, NumberOperand);
    a->cmpl(0xabcdef01, NumberOperand,   eax); 
    limit_offset = a->offset() - sizeof(int32);
    a->jne(0x87654321, CodeAddressOperand);
    nmAddr_offset = a->offset() - sizeof(int32);
    a->call((int32)Recompile_stub, VMAddressOperand);
    recompileStub_offset = a->offset() - sizeof(int32);

    instsSize = a->offset();
    pattern = (pc_t)AllocateHeap(instsSize, "countStub pattern");
    copy_bytes(a->instsStart, pattern, instsSize);
    *(int32*)&pattern[recompileStub_offset] -= pattern - a->instsStart; // fixup the call
    a->finalize();
    theAssembler = oldAssembler;    
  }
    

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == I386_ARCH
