/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "genHelper_sparc.hh"

# include "_genHelper_sparc.cpp.incl"

# if defined(SIC_COMPILER)


  fint SICGenHelper::spOffset(Location l) {
    return ::spOffset(l, theSIC->frameSize());
  }

  fint SICGenHelper::spOffset(Location l, nmethod* nm) {
    return ::spOffset(l, nm->frameSize());
  }

  void SICGenHelper::jumpTo(void* target, Location reg, Location link) {
    a->SetHiP(target, reg);
    a->JmpLP(reg, target, link);
  }

  void SICGenHelper::genCountCode(int32* counter) {
    a->Comment("count # calls");
    a->SetHiA((void*)counter, Temp2);
    a->LoadA(Temp2, (void*)counter, Temp1);
    a->AddI(Temp1, 1, Temp1);
    a->StoreA(Temp2, (void*)counter, Temp1);
  }

  Location SICGenHelper::loadImmediateOop(ConstPReg* r, Location dest, bool mustMove) {
    // load oop from ConstPR; return location containing the oop
    if (r->loc == UnAllocated) {
      if (r->constant == 0 && !mustMove) {
        return G0;
      }
      else {
        loadImmediateOop(r->constant, dest, false);
        return dest;
      }
    } else if (mustMove) {
      a->OrR(r->loc, G0, dest);
      return dest;
    }
    else
      return r->loc;
  }
  
  void SICGenHelper::loadImmediateOop(oop p, Location dest, bool isInt) {
    assert(isRegister(dest), "must be a register");
    if (p == 0) {
      a->OrR(G0, G0, dest);
    } else if ((isInt || !p->is_mem()) && isImmediate(smiOop(p))) {
      a->OrI(G0, (int)p, dest);
    } else {
      a->SetHiO(p, dest);                       // load high part of value
      a->AddO(dest, p, dest);                   // add low part 
    }
  }

  void SICGenHelper::load(Location src, fint srcOffset, Location dest) {
    assert(isRegister(src) && isRegister(dest), "not a register");
    a->LoadI(src, srcOffset, dest);
  }

  void SICGenHelper::store(Location src, fint dstOffset, Location dest) {
    assert(isRegister(src) && isRegister(dest), "not a register");
    a->StoreI(dest, dstOffset, src);
  }

  void SICGenHelper::moveRegToReg(Location srcReg, Location destReg) {
    assert(isRegister(srcReg) && isRegister(destReg), "not a register");
    a->OrR(srcReg, G0, destReg);
  }

  // must be a VMAddressOperand operand
  void SICGenHelper::setToZeroA(void* addr, Location tempReg) {
    assert(isRegister(tempReg), "not a register");
    a->SetHiA(addr, tempReg);
    a->StoreA(tempReg, addr, G0);
  }

  void SICGenHelper::setToZero(Location dest) {
    genHelper->moveRegToLoc(G0, dest);
  }


# ifdef UNUSED
  void SICGenHelper::checkRecompilation(fint countID) {
    // test for recompilation
    //   sethi &counter, t3
    //   load  [t3 + lo%(&counter)], t4
    //   add t4, 1, t4
    //   cmp t4, recompileLimit
    //   bne ok
    //   store t4, [t3 + lo%(&counter)]
    //   <jumpTo recompiler>
    //   nop
    // ok:

    // di recompilation doesn't work right now - see recompile.c
    if (theSIC->diLink) return;
    Assembler* ass = theAssembler;

    ass->Comment("test for recompilation");
    void* counter = &useCount[countID];
    ass->SetHiA(counter, Temp3);
    ass->LoadA(Temp3, counter, Temp2);
    ass->AddI(Temp2, 1, Temp2);
    fint limit = recompileLimit(0);
    if (limit < maxImmediate) {
      ass->SubCCI(Temp2, limit, G0);
    } else {
      ass->SetHiI2(limit, Temp1);           // limit is multiple of 1024
      ass->SubCCR(Temp2, Temp1, G0);
    }
    Label* ok = ass->BneForward(false);
    // call recompiler
    void* fnaddr = first_inst_addr(
                     theSIC->diLink ? Memory->zone->DIRecompile_stub_td()
                                    : Memory->zone->  Recompile_stub_td() );
    Location linkReg = theSIC->diLink ? DIRecompileLinkReg : RecompileLinkReg;
    jumpTo(fnaddr, linkReg, linkReg);
    // The store below is always executed so that we will call the recompiler 
    // exactly once (even if it cannot recompile for some reason).
    ok->define();
    assert(Temp3 != linkReg, "counter addr reg will be trashed by jump");
    ass->StoreA(Temp3, counter, Temp2);
  }
# endif // UNUSED
    
  void SICGenHelper::smiOop_prologue(char* missHandler) {
    //   andcc rr, Tag_Mask, g0
    //   beq   _cache_hit
    //   sethi missHandler, t
    //   jmpl t, missHandler, g0
    //   nop
    // _cache_hit:

    if (SICCountIntTagTests) a->markTagTest(1);
    a->AndCCI(LReceiverReg, Tag_Mask, G0);    // test for integer tag
    Label* hit = a->BeqForward(false);       // branch if receiver is an int
    jumpTo(missHandler, Temp1, G0);
    if (SICCountTypeTests) {
      a->endTypeTest();
    } else {
      a->Nop();
    }
    hit->define();
  }

  void SICGenHelper::floatOop_prologue(char* missHandler) {
    //   andcc rr, Float_Tag, g0
    //   bne  _cache_hit
    //   sethi missHandler, t
    //   jmpl t, missHandler, g0
    //   nop
    // _cache_hit:

    a->AndCCI(LReceiverReg, Float_Tag, G0);    // test for float tag
    Label* hit = a->BneForward(false);        // branch if receiver is a float
    jumpTo(missHandler, Temp1, G0);
    if (SICCountTypeTests) {
      a->endTypeTest();
    } else {
      a->Nop();
    }
    hit->define();
  }

  void SICGenHelper::memOop_prologue(mapOop receiverMapOop,
                                     char* missHandler) {
    //   andcc rr, Mem_Tag, g0
    //   bne,a _check_receiver_map
    //   load rr, map_offset - Mem_Tag, t3
    // _miss:
    //   sethi missHandler, t3
    //   jmpl t3, missHandler, g0
    // _check_receiver_map:
    //   <loadImmediateOop receiver_map, t4>
    //   subcc t3, t4, g0
    //   bne  _miss
    //   nop
    // _cache_hit:

    if (FastMapTest) {
      a->LoadI(LReceiverReg, map_offset(), Temp1);   // load map
      loadImmediateOop(receiverMapOop, Temp2);   // load customization map
      a->SubCCR(Temp1, Temp2, G0);      // compare against actual map
      Label* ok = a->BeqForward(false); // jump to body of nmethod
      jumpTo(missHandler, Temp2, G0);
      if (SICCountTypeTests) {
        a->endTypeTest();
      } else {
        a->Nop();       // must be here in case next instr is a save
      }
      ok->define();
    } else {
      Label* checkMap = NULL;
      a->AndCCI(LReceiverReg, Mem_Tag, G0);  // test for mem tag
      checkMap = a->BneForward(true);       // branch if receiver is a mem oop
      a->LoadI(LReceiverReg, map_offset(), Temp1);   // load map in delay slot
      DefinedLabel miss(a->printing);
      jumpTo(missHandler, Temp2, G0);
      if (checkMap) checkMap->define();
      loadImmediateOop(receiverMapOop, Temp2);   // load customization map
      a->SubCCR(Temp1, Temp2, G0);      // compare against actual map
      a->Bne(&miss, false);             // jump to miss if no match
      if (SICCountTypeTests) {
        a->endTypeTest();
      } else {
        a->Nop();       // must be here in case next instr is a save
      }
    }
  }

  void SICGenHelper::checkOop(Label& general, oop what, Location reg) {
    // test for inline cache hit (selector, delegatee)
    assert(Temp1 != PerformSelectorLoc && Temp1 != PerformDelegateeLoc,
           "wrong register setup");
    loadImmediateOop(what, Temp1);              // load hard-wired value
    a->SubCCR(reg, Temp1, G0);                  // compare against actual value
    if (general.isDefined()) {
      a->Bne(&general, false);                  // reuse miss handler
      a->Nop();
    } else {
      Label* hit = a->BeqForward(false);
      general.define();
      jumpTo(Memory->code->trapdoors->SendMessage_stub_td(), Temp1, G0);
      a->Nop();
      hit->define();
    }
  }

  fint SICGenHelper::verifyParents(objectLookupTarget* target,
                                   Location t,
                                   fint count) {
    assignableSlotLink* l = target->links;
    assert(l != 0, "expecting an assignable parent link");
      
    for (;;) {
      a->LoadI(t, smiOop(l->slot->data)->byte_count() - Mem_Tag, Temp1);
      // load assignable parent slot value
      Label* ok;
      Map* targetMap = l->target->obj->map();
      if (l->target->value_constrained) {
        // constraint for a particular oop (ambiguity resolution)
        loadImmediateOop(l->target->obj, Temp2);         // load assumed value
        a->SubCCR(Temp1, Temp2, G0);            // compare values
        ok = a->BeqForward(false);              // branch if value OK
        if (l->target->links) a->Nop();
      } else {
        // check if map of parent is correct
        if (targetMap == Memory->smi_map) {
          a->AndCCI(Temp1, Tag_Mask, G0);       // test for integer tag
          ok = a->BeqForward(false);            // branch if parent is integer
          if (l->target->links) a->Nop();
        } else if (targetMap == Memory->float_map) {
          a->AndCCI(Temp1, Float_Tag, G0);      // test for float tag
          ok = a->BneForward(false);            // branch if parent is a float
          if (l->target->links) a->Nop();
        } else {
          Label* miss = NULL;
          if (!FastMapTest) {
            a->AndCCI(Temp1, Mem_Tag, G0);      // test for mem tag
            Label* mem = a->BneForward(true);   // branch if parent is mem oop
            a->LoadI(Temp1, map_offset(), Temp2); // load receiver map
            miss = a->BraForward(true);         // branch to diLookup section
            mem->define();
          } else {
            a->LoadI(Temp1, map_offset(), Temp2); // load receiver map
          }
          loadImmediateOop(targetMap->enclosing_mapOop(), Temp3); // load map constraint
          a->SubCCR(Temp2, Temp3, G0);          // compare w/ parent's map
          ok = a->BeqForward(false);            // correct
          if (l->target->links) a->Nop();
          if (miss) miss->define();
        }
      }
      void* addr = Memory->code->trapdoors->SendDIMessage_stub_td();
      a->SetHiD(addr, Temp1);
      a->JmpLD(Temp1, addr, DILinkReg);
      a->OrI(G0, count, DICountReg);            // count of parents verified
      a->Data(0);                               // first part of DI nmln
      a->Data(0);                               // second part of DI nmln
      ok->define();
      
      count ++;
      if (l->target->links) count = verifyParents(l->target, Temp1, count);
      
      l = l->next;
      if (l == 0) break;
      // if multiple dynamic parents, reload slot holder before looping (HACK!)
      t = loadPath(Temp1, target, LReceiverReg);
    }
    
    return count;
  }
    

# endif // SIC_COMPILER
