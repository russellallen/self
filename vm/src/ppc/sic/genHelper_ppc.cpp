# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "genHelper_ppc.hh"

# include "_genHelper_ppc.cpp.incl"

# if defined(SIC_COMPILER)


  fint SICGenHelper::spOffset(Location l) {
    return ::spOffset(l,
                      theSIC->frameSize(),
                      theSIC->max_no_of_outgoing_args_and_rcvr());
  }

  fint SICGenHelper::spOffset(Location l, nmethod* nm) {
    return ::spOffset(l,
                      nm->frameSize(),
                      nm->max_no_of_outgoing_args_and_rcvr());
  }

  // Warning: this clobbers the count register
  void SICGenHelper::jumpTo(void* target, Location reg, Location link) {
    assert(link == UnAllocated || link == LinkRegister, "can't link to arbitrary register");
    a->branch_to((pc_t)target, PVMAddressOperand, reg, link == LinkRegister);
  }

  void SICGenHelper::genCountCode(int32* counter) {
    a->Comment("count # calls");
    a->load_from_address(Temp1, counter, VMAddressOperand, Temp2);
    a->addi(Temp1, Temp1, 1, NumberOperand);
    int32 lo, hi;
    a->break_up_word_for_adding((int32)counter, lo, hi);
    a->stw(Temp1, lo, VMAddressOperand, Temp2);
  }

  Location SICGenHelper::loadImmediateOop(ConstPReg* r, Location dest, bool mustMove) {
    // load oop from ConstPR; return location containing the oop
    if (r->loc == UnAllocated) {
      loadImmediateOop(r->constant, dest);
      return dest;
    } else if (mustMove) {
      moveRegToReg(r->loc, dest);
      return dest;
    }
    else
      return r->loc;
  }
  
  void SICGenHelper::loadImmediateOop(oop p, Location dest, bool isInt) {
    Unused(isInt); // load_immediate does the right thing wrt integer oops
    assert(isRegister(dest), "must be a register");
    a->load_immediate(dest, (int32)p, OopOperand);
  }

  void SICGenHelper::load(Location src, fint srcOffset, Location dest) {
    assert(isRegister(src) && isRegister(dest), "not a register");
    a->lwz(dest, srcOffset, NumberOperand, src);
  }

  void SICGenHelper::store(Location src, fint dstOffset, Location dest) {
    assert(isRegister(src) && isRegister(dest), "not a register");
    a->stw(src, dstOffset, NumberOperand, dest);
  }

  void SICGenHelper::moveRegToReg(Location srcReg, Location destReg) {
    assert(isRegister(srcReg) && isRegister(destReg), "not a register");
    a->mr(destReg, srcReg);
  }

  // must be a VMAddressOperand operand
  void SICGenHelper::setToZeroA(void* addr, Location tempReg) {
    assert(isRegister(tempReg), "not a register");
    theAssembler->li(R0, 0, NumberOperand);
    theAssembler->store_to_address(R0, addr, VMAddressOperand, tempReg);
  }

  // clobbers R0
  void SICGenHelper::setToZero(Location dest) {
    if (isRegister(dest)) {
      a->li(dest, 0, NumberOperand);
    } else {
      a->li(R0, 0, NumberOperand);
      store(R0, spOffset(dest), SP);
    }
  }


# ifdef UNUSED
  void SICGenHelper::checkRecompilation(fint countID) {
    fatal("unimp mac");
  }
# endif // UNUSED
    
  void SICGenHelper::smiOop_prologue(char* missHandler) {
    if (SICCountIntTagTests) a->markTagTest(1);
    a->andi_(R0, LReceiverReg, Tag_Mask, NumberOperand);
    Label hit(a->printing);
    a->beq(hit, predict_weird);
    jumpTo(missHandler, Temp1, UnAllocated);
    if (SICCountTypeTests) {
      a->endTypeTest();
    }
    hit.define();
  }

  void SICGenHelper::floatOop_prologue(char* missHandler) {
    a->andi_(R0, LReceiverReg, Float_Tag, NumberOperand);
    Label hit(a->printing);
    a->bne(hit, predict_weird);
    jumpTo(missHandler, Temp1, UnAllocated);
    if (SICCountTypeTests) {
      a->endTypeTest();
    }
    hit.define();
  }

  void SICGenHelper::memOop_prologue(mapOop receiverMapOop,
                                     char* missHandler) {
    if (FastMapTest) {
      fatal("fast map tests unimplemented on PPC");
    } else {
      Label checkMap;
      a->andi_(R0, LReceiverReg, Mem_Tag, NumberOperand);
      a->bne(checkMap, predict_weird);
      
      DefinedLabel miss(a->printing);
      jumpTo(missHandler, Temp2, UnAllocated);

      checkMap.define();
      a->lwz(Temp1, map_offset(), NumberOperand, LReceiverReg);
      loadImmediateOop(receiverMapOop, Temp2);
      a->cmpw(Temp1, Temp2);
      a->bne(miss, predict_weird); // backwards branch, usually falls through

      if (SICCountTypeTests)
        a->endTypeTest();
    }
  }

  void SICGenHelper::checkOop(Label& general, oop what, Location loc_to_check) {
    // test for inline cache hit (selector, delegatee)
    loadImmediateOop(what, Temp1);              // load hard-wired value
    moveLocToReg(loc_to_check, Temp2);
    a->cmpw(Temp1, Temp2);                      // compare against actual value
    if (general.isDefined()) {
      a->bne(general, predict_weird);           // reuse miss handler, backwards, will fall through
    } else {
      Label hit(a->printing);
      a->beq(hit, predict_weird);              // forwards, will go
      general.define();
      jumpTo(Memory->code->trapdoors->SendMessage_stub_td(R0), R0, UnAllocated);
      hit.define();
    }
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
      a->lwz(Temp1, smiOop(l->slot->data)->byte_count() - Mem_Tag, NumberOperand, t);      
      verifyOneImmediateParent(l, Temp1, Temp2, count);
      ++count;

      if (l->target->links) count = verifyParents(l->target, Temp1, count);
    }
    return count;
  }
  
  
  void SICGenHelper::verifyOneImmediateParent(assignableSlotLink* l, Location parentOopReg, Location scratchReg, fint count) {
    Label* ok = new Label(a->printing);
    
    if (l->target->value_constrained)  verifyConstrainedOopOfParent(l->target->obj,        parentOopReg, scratchReg, ok);
    else                               verifyMapOfParent(           l->target->obj->map(), parentOopReg, scratchReg, ok);

    // This will be backpatched to call an nmethod, so need to leave incoming link alone.
    // Pass a link to the branch and nmln in the DILinkReg.
    // Since 3 registers are needed DILink, DITemp, DICount need to use either R0 or 
    // the counter register. Since branch_to uses the count register, we use R0 here.
  
    // save link so can use link to pass nmln addr
    a->mflr(DITempReg);
    a->stw(DITempReg, saved_pc_offset * oopSize, NumberOperand, SP); // save link for stack-crawling
    Label next;
    a->bl(next, NumberOperand); // need to get addr of nmln
    next.define();
    fint link_contents = a->offset(); // where the link reg points to
    a->mflr(DILinkReg);
    a->mtlr(DITempReg);
  
    pc_t link_incr_addr = a->addr();
    assert(DILinkReg != R0, "addi will break");
    a->addi(DILinkReg, DILinkReg, 0, NumberOperand); // will come back and backpatch
  
    a->load_immediate(DICountReg, count, NumberOperand);
    a->branch_to( Memory->code->trapdoors->SendDIMessage_stub_td(DITempReg), 
                  DIVMAddressOperand, DITempReg, false);
    assert(DITempReg != R0, "callee needs a nonzero reg here");

    fint desired_link_contents = a->offset(); // where the link would be if we could use it
    a->saveExcursion(link_incr_addr);         // go back and get the increment right
    a->addi(DILinkReg, DILinkReg, desired_link_contents - link_contents, NumberOperand);
    a->endExcursion();
    a->Data(0);                                // first  part of DI nmln
    a->Data(0);                                // second part of DI nmln

    ok->define();
  }



  void SICGenHelper::verifyConstrainedOopOfParent(oop targetOop, 
                                                  Location parentOopReg, 
                                                  Location scratchReg, 
                                                  Label* ok) {
    assert(parentOopReg != scratchReg, "register collision");
    // constraint for a particular oop (ambiguity resolution)
    loadImmediateOop(targetOop, scratchReg); // load assumed value
    a->cmpw(parentOopReg, scratchReg);       // compare values
    a->beq(*ok, predict_weird);              // branch if value OK
  }

  
  // Given: map to look for, obj already in parentOopReg, scratch reg regForMap
  // test for map, fall through on miss, goto label OK if hit.
  
  void SICGenHelper::verifyMapOfParent(Map* targetMap, Location parentOopReg, Location regForMap, Label* ok) {
    if (targetMap == Memory->smi_map) {
      a->andi_(R0, parentOopReg, Tag_Mask, NumberOperand); // test for integer tag
      a->beq(*ok, predict_weird);            // branch if parent is integer
    }
    else if (targetMap == Memory->float_map) {
      a->andi_(R0, parentOopReg, Float_Tag, NumberOperand); // test for float tag
      a->bne(*ok, predict_weird);            // branch if parent is a float
    } 
    else {
      Label miss;
      assert(R0 != parentOopReg, "register collision");
      if (FastMapTest)         fatal("no fast map tests on PPC");
      a->andi_(R0, parentOopReg, Mem_Tag, NumberOperand); // test for mem tag
      a->beq(miss, predict_usual);         // branch if parent is not mem oop, fwd, will fall through
      assert(regForMap != parentOopReg, "register collision");
      a->lwz(regForMap, map_offset(), NumberOperand, parentOopReg); // load receiver map
      loadImmediateOop(targetMap->enclosing_mapOop(), R0); // load map constraint
      a->cmpw(regForMap, R0);                   // compare w/ parent's map
      a->beq(*ok, predict_weird);           // correct
      miss.define();
    }
  }
    

# endif // SIC_COMPILER
# endif // TARGET_ARCH == PPC_ARCH
