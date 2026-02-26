# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "genHelper_i386.hh"

# include "_genHelper_i386.cpp.incl"

# if defined(SIC_COMPILER)


  fint SICGenHelper::spOffset(Location l) {
    Location b;  int32 d;  OperandType t;
    reg_disp_type_of_loc(&b, &d, &t, l);
    // had better be used for active frame, not a saved one,
    // because sp of saved frame is two words lower! -- dmu 5/06
    return b == esp  ?  d  :  d  +  (theSIC->frameSize() - linkage_area_size) * oopSize;
  }

  fint SICGenHelper::spOffset(Location l, nmethod* nm) {
    Location b;  int32 d;  OperandType t;
    reg_disp_type_of_loc(&b, &d, &t, l);
    // and this one is for a saved frame!
    // So, the "SP" is really going to be the ebp, cause that's what blocks store -- dmu 5/06

    // Don't think this should ever happen cause we doin't up-level access outgoing args. -- dmu 5/06
    # if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions  &&  b != ebp)  warning("untested");
    # endif
    return b == ebp  ?  d  :  d - (nm->frameSize() - linkage_area_size) * oopSize;
  }

  // Warning: this clobbers the count register
  void SICGenHelper::jumpTo(void* target, Location reg, Location link) {
    fatal("not used for Intel");
  }

  void SICGenHelper::genCountCode(int32* counter) {
    a->Comment("count # calls");
    a->incl(no_reg, (int32)counter, VMAddressOperand);
  }


  Location SICGenHelper::loadImmediateOop(ConstPReg* r, Location dest, bool mustMove) {
    // load oop from ConstPR; return location containing the oop
    if (r->loc == UnAllocated) {
      loadImmediateOop(r->constant, dest);
      return dest;
    } else if (mustMove) {
      theAssembler->Untested("loadImmediateOop");
      moveRegToReg(r->loc, dest);
      return dest;
    }
    else
      return r->loc;
  }
  
  void SICGenHelper::loadImmediateOop(oop p, Location dest, bool isInt) {
    Unused(isInt); // load_immediate does the right thing wrt integer oops
    assert(isRegister(dest), "must be a register");
    a->movl((int32)p, OopOperand, dest);
  }

  void SICGenHelper::load(Location src, fint srcOffset, Location dest) {
    assert(isRegister(src) && isRegister(dest), "not a register");
    a->movl(src, srcOffset, NumberOperand, dest);
  }

  void SICGenHelper::store(Location src, fint dstOffset, Location dest) {
    assert(isRegister(src) && isRegister(dest), "not a register");
    a->movl(src, dest, dstOffset, NumberOperand);
  }

  void SICGenHelper::moveRegToReg(Location srcReg, Location destReg) {
    assert(isRegister(srcReg) && isRegister(destReg), "not a register");
    a->movl(srcReg, destReg);
  }

  // must be a VMAddressOperand operand
  void SICGenHelper::setToZeroA(void* addr, Location tempReg) {
    theAssembler->movl(0, NumberOperand, no_reg, (int32)addr, VMAddressOperand);
  }

  void SICGenHelper::setToZero(Location dest) {
    Location b;  int32 d;  OperandType t;
    reg_disp_type_of_loc(&b, &d, &t, dest);
    a->movl(0, NumberOperand, b, d, t);
  }


# ifdef UNUSED
  void SICGenHelper::checkRecompilation(fint countID) {
    fatal("Unused Intel");
  }
# endif // UNUSED

    

  void SICGenHelper::smiOop_prologue(char* missHandler) {
    if (SICCountIntTagTests) a->markTagTest(1);

    a->testl( Tag_Mask, NumberOperand, esp, leaf_rcvr_offset*oopSize, NumberOperand);
    a->jne((int32)missHandler, PVMAddressOperand);

    assert(!SICCountTypeTests, "should have called a->endTypeTest() on failure");
  }


  void SICGenHelper::floatOop_prologue(char* missHandler) {
    Location b;  int32 d;  OperandType t;
    reg_disp_type_of_loc(&b, &d, &t, LReceiverReg);

    if (SICCountIntTagTests) a->markTagTest(2);
    
    a->btl( Float_Tag_bit_i386, esp, leaf_rcvr_offset*oopSize, NumberOperand);
    // if bit set must be hit, otherwise is mark
    a->jnc( (int32)missHandler, PVMAddressOperand);

    assert(!SICCountTypeTests, "should have called a->endTypeTest() on failure");
  }


  void SICGenHelper::memOop_prologue(mapOop receiverMapOop,
                                     char* missHandler) {

    a->movl(esp, leaf_rcvr_offset*oopSize, NumberOperand, Temp1);
    a->btl(Mem_Tag_bit_i386, Temp1);
    // if bit set must be hit, otherwise is mark
    a->jnc( (int32)missHandler, PVMAddressOperand);

    // check_map:
    a->movl( Temp1, map_offset(), NumberOperand, Temp2);
    a->cmpl( (int32)receiverMapOop, OopOperand, Temp2);
    a->jne((int32)missHandler, PVMAddressOperand);

    assert(!SICCountTypeTests, "should have called a->endTypeTest() on failure");
  }



  void SICGenHelper::checkOop(Label& general, oop what, Location loc_to_check) {
    // test for inline cache hit (selector, delegatee)
    moveLocToReg(loc_to_check, Temp2);
    a->cmpl((int32)what, OopOperand, Temp2);
    Unused(general);
    a->jne(int32(SendMessage_stub), PVMAddressOperand);
  }
  
  


  fint SICGenHelper::verifyParents(objectLookupTarget* target,
                                   Location t,
                                   fint count) {
    assert(target->links != 0,  "expecting an assignable parent link");
    bool isFirst = true;
    for ( assignableSlotLink* l = target->links;  
          l != 0;
          l = l->next,  isFirst = false) {
      
      if (!isFirst) {
        // if multiple dynamic parents, reload slot holder before looping (HACK!)
        t = loadPath(Temp1, target, LReceiverReg);
      }
      
      // load assignable parent slot value
      a->movl(t, smiOop(l->slot->data)->byte_count() - Mem_Tag, NumberOperand, Temp1);
      verifyOneImmediateParent(l, Temp1, Temp2, count);
      ++count;

      if (l->target->links) count = verifyParents(l->target, Temp1, count);
    }
    return count;
  }
  
  

  void SICGenHelper::verifyOneImmediateParent(assignableSlotLink* l, Location parentOopReg, Location scratchReg, fint count) {
    Label* ok = new Label(a->printing);
    
    if (l->target->value_constrained)  verifyConstrainedOopOfParent(l->target->obj,        parentOopReg, ok);
    else                               verifyMapOfParent(           l->target->obj->map(), parentOopReg, scratchReg, ok);

    // This will be backpatched to call an nmethod, so need to leave incoming link alone.
    // Pass a link to the branch and nmln in the DILinkReg.
    // See codeGen_i386.cpp
    
    a->movl(count, NumberOperand, DICountReg);  // count of parents verified
    
    // must align nmln to follow
    // There is a call coming, each 5 bytes, so want pc + 5 to be 0 mod 4.
    // See align * in asmDefs_gcc_i386.[sS]
    // get ic value to pass in, cannot use call cause of backpatching, etc.
    Label next;
    a->call(&next);
    next.define(); 

    // two tasks: compute amount to add to savedPC so it simulates a call: must point to after the jmp below
    // Also, just add enough nops so that nmln after call is word-alligned
    
    fint bytes_from_here_to_after_jmp_before_alignment = 1 /* popl */ + 3 /* addl */ + 5 /* jmp */;
    int32 here = a->offset();
    fint word_fraction_from_here_to_after_jmp_before_alignment = (here + bytes_from_here_to_after_jmp_before_alignment ) & 3;    
    fint num_nops = (BytesPerWord - word_fraction_from_here_to_after_jmp_before_alignment) & (BytesPerWord-1);
    fint bytes_from_here_to_after_jmp = bytes_from_here_to_after_jmp_before_alignment + num_nops;
    
    for (fint i = 0;  i < num_nops; ++i) a->nop();
    

    a->popl(DIInlineCacheReg); // 1 byte, prepare to calculate IC addr below
    a->addl(bytes_from_here_to_after_jmp, NumberOperand, DIInlineCacheReg);  // 3 bytes, finish calc IC addr below
    // following must be parsable to set_target_of_Self_call_site
    a->jmp( (int32)SendDIMessage_stub, DIVMAddressOperand);
    assert( a->offset() == here + bytes_from_here_to_after_jmp, "checking");
    assert((a->offset() & (BytesPerWord-1)) == 0, "must be aligned");
    a->Data(0);                                // first  part of DI nmln
    a->Data(0);                                // second part of DI nmln
    
    a->hlt();
          
    ok->define();
  }



  void SICGenHelper::verifyConstrainedOopOfParent(oop targetOop, 
                                                  Location parentOopReg, 
                                                  Label* ok) {
    // constraint for a particular oop (ambiguity resolution)
    a->cmpl((int32)targetOop, OopOperand, parentOopReg);       // compare values
    a->je(ok);              // branch if value OK
  }

  
  // Given: map to look for, obj already in parentOopReg, scratch reg regForMap
  // test for map, fall through on miss, goto label OK if hit.
  
  void SICGenHelper::verifyMapOfParent(Map* targetMap, Location parentOopReg, Location regForMap, Label* ok) {
    if (targetMap == Memory->smi_map) {
    a->Untested("verifyMapOfParent");
      a->testl(Tag_Mask, NumberOperand, parentOopReg);        // test for integer tag
      a->je( ok );                                     // branch if parent is integer
    }
    else if (targetMap == Memory->float_map) {
    a->Untested("verifyMapOfParent");
      a->btl( Float_Tag_bit_i386, parentOopReg);
      // if bit set must be hit, otherwise is mark
      a->jc(ok);             // branch if parent is a float
    } 
    else {
      Label miss;

      a->btl(Mem_Tag_bit_i386, parentOopReg);
      // if bit set must be hit, otherwise is mark
      a->jnc(&miss);                          // branch if parent is not mem oop

      a->movl(parentOopReg, map_offset(), NumberOperand, regForMap);    // load receiver map
      a->cmpl((int32)targetMap->enclosing_mapOop(), OopOperand, regForMap); // cmp to map constraint
      a->je(ok);               // correct

      miss.define();
    }
  }
  
  
  void SICGenHelper::moveToExactlyThisReg(PReg* pr, Location reg) {
    Location r = moveToReg(pr, reg);
    if (r != reg) a->movl(r, reg);
  }
    

# endif // SIC_COMPILER
# endif // TARGET_ARCH == I386_ARCH
