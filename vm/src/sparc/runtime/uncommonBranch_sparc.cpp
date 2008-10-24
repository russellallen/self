/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "uncommonBranch_sparc.hh"

# include "_uncommonBranch_sparc.cpp.incl" 


# if defined(SIC_COMPILER)

  bool shouldRestartSend(int32* instp) {
    assert(isUnimp(instp), "not an uncommon trap instruction");
    return (disp(instp) & UncommonRestartBit) != 0;
  }

  unsigned trapCount(int32* instp) {
    assert(isUnimp(instp), "not an uncommon trap instruction");
    return disp(instp) & (UncommonRestartBit - 1);
  }

  void setTrapCount(int32* instp, unsigned count) {
    assert(isUnimp(instp), "not an uncommon trap instruction");
    assert(count < UncommonRestartBit, "count too large");
    setDisp(instp, (disp(instp) & UncommonRestartBit) | count);
  }

# endif


bool isMapLoad(int* instp) {
  return isLoadWord(instp) && getArithImm(instp) == map_offset();
}


oop mapToLoad;
const fint NumRegs = 32;
doFn  mapLoadHandler[NumRegs];


void handleMapLoadTrap(InterruptedContext* c) {
    int32* pc = (int32*)c->pc();
    assert(isMapLoad(pc), "not a map load");
    assert(c->next_pc() == c->pc() + 4, "flow should be sequential");
    Location dest = Location(rd(pc));
    mapOop resultMap;
    
    // get the result map to load
    # if  TARGET_OS_VERSION == SOLARIS_VERSION_broken
        // disabled for now -- there's some bug in get_reg  --Urs 8/94
        Location src = Location(rs1(pc));
        fint rcvrTag = int(c->get_reg(src)) & Tag_Mask;
        if (rcvrTag == Int_Tag) {
          resultMap = Memory->smi_map->enclosing_mapOop();
        } else if (rcvrTag == Float_Tag) {
          resultMap = Memory->float_map->enclosing_mapOop();
        } else {
          fatal("bad receiver tag in map load trap");
        }
    # else
        // Can't read registers, and signal handler doesn't get faulting address,
        // so don't know what the correct map is.  But it's not really needed
        // (only important thing is that it's different from any mem map) since
        // the map testing code always checks the tag if an immediate is expected.
        resultMap = NULL;
    # endif

    NCodeBase* thing = findThing(pc);
    if (!thing->isNMethod()) {
      // a PIC -- no problem, will fix itself to eliminate trap
    } else {
      nmethod* nm = findNMethod(pc);
      if ((char*)pc >= nm->verifiedEntryPoint()) {
        // the trap happened in the body, not in the prologue
        if (nm->flags.trapCount > MapLoadTrapLimit) {
          // recompile the nmethod on next invocation to eliminate the traps
          nm->makeToBeRecompiled();
          if (nm->isYoung())
            // manipulate counters to provoke recompilation
            nm->makeVeryYoung();
          else
            nm->makeYoung();
        } else {
          nm->flags.trapCount++;
          if (nm->flags.trapCount <= 0) {
            // counter overflowed
            nm->flags.trapCount--;
          }
        }
      }
    }
    # if  TARGET_OS_VERSION == SOLARIS_VERSION
        // simply set the destination register and continue
        c->set_reg(dest, resultMap);
        c->set_pc(c->next_pc());
        c->set_next_pc(c->pc() + 4);
    # elif  TARGET_OS_VERSION == SUNOS_VERSION
        // can't set register in interrupt handler - argh!!
        if (mapLoadHandler[dest]) {
          char* cont = c->next_pc();
          InterruptedContext::set_continuation_address(first_inst_addr(mapLoadHandler[dest]), true, true);
          continuePC = cont;
          mapToLoad = resultMap;
        } else {
          fatal1("map load trap: bad destination register %d", dest);
        }
    # endif
}
