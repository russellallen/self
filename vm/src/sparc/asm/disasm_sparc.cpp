/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "disasm_sparc.hh"

# include "_disasm_sparc.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


  static nmethod* printNM;      // nmethod being printed
  static PcDesc* printPC;       // current PcDesc
  static ScopeDesc* printScope; // current scope

  static Location regToMatch;   // param. for printMatchingSlot
  static char* regName;         // result of reg_names
  static bool  firstMatch;      // for printMatchingSlot/reg_names
  static PrimDesc* printPD;     // last primitive address printed
  
  static void printMatchingSlot(NameDesc* nd, char* name) {
    if (nd->hasLocation() && nd->location() == regToMatch) {
      if (firstMatch) {
        firstMatch = false;
        strcat(regName, "(");
      } else {
        strcat(regName, "/");
      }
      strcat(regName, name);
    }
  }

  char* reg_names(fint reg) {
    // try to find source-level name(s) for reg
    // inefficient but only used during debugging, so what
    regName = NEW_RESOURCE_ARRAY(char, 80);
    firstMatch = true;
    regToMatch = Location(reg);
    sprintf(regName, "%s", RegisterNames[reg]);
    if (printPC == NULL) return regName;
    fint bci = printPC->byteCode;
    for (ScopeDesc* scope = printScope; scope; scope = scope->sender()) {
      scope->doForNames(bci, printMatchingSlot);
      if (!scope->isTop()) bci = scope->senderByteCodeIndex();
    }
    if (!firstMatch) strcat(regName, ")");
    return regName;
  }

  void print_stack_temp_name(fint offset) {
    // The disassembler just printed something like "ld [%sp+offset";
    // augment it with the symbolic name for stack temps if possible.
    // The code below isn't perfect -- doesn't distinguish extra args
    // from stack temps.
    fint size = printNM->frameSize();
    fint off, t;
    for (t = StackLocations;
         (off = spOffset(Location(t), size)) != offset && off > 64;
         t++) ;
    if (off > 64) {
      putchar('/');
      lprintf("%s", locationName(Location(t)));
    }
  }

  char* freg_names(fint reg) {
    static char* fnames[] = {
       "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",  "f8",  "f9",
      "f10", "f11", "f12", "f13", "f14", "f15", "f16", "f17", "f18", "f19",
      "f20", "f21", "f22", "f23", "f24", "f25", "f26", "f27", "f28", "f29",
      "f30", "f31" };
    return fnames[reg];
  }

  void print_address(CORE_ADDR memaddr) {
    // print memaddr decorated with Self-specific annotations
    nmethod* nm;
    CacheStub* pic;
    if (oop(memaddr)->is_mem()) {
      if (Memory->really_contains(memaddr) &&
          Memory->spaceFor(memaddr)->objs_contains(memaddr) &&
          memOop(memaddr)->mark()->is_mark()) {
        // looks like a real oop
        lprintf("%s", oop(memaddr)->debug_print());
      } else {
        lprintf("%#lx", memaddr);         // not an oop
      }
    } else if (oop(memaddr)->is_float()) {
      lprintf("%#lx (%f)", memaddr,
             floatOop(memaddr)->value());
    } else if (Memory->code->iZone->contains(memaddr) &&
               (nm = findNMethod_maybe(memaddr)) != NULL &&
               nm != printNM) {
      lprintf("%#lx (nmethod %#lx \"%s\")",
             (long unsigned)memaddr, (long unsigned)nm,
             selector_string(nm->key.selector));
    } else if (Memory->code->stubs->contains(memaddr) &&
               (pic = findCacheStub_maybe(memaddr)) != NULL) {
      lprintf("%#lx (PIC %#lx \"%s\")",
             (long unsigned)memaddr, (long unsigned)pic,
             selector_string(pic->sd()->selector()));
    } else if ((printPD = getPrimDescOfFirstInstruction(memaddr, true)) != NULL) {
      lprintf("%s", printPD->name());
    } else {
      lprintf("%#lx", memaddr);
    }
  }

  inline void startLine(CORE_ADDR pc) {
    lprintf("%#8lx: ", pc);
  }
  
  static void printOneInstruction(CORE_ADDR pc) {
    startLine(pc);
    print_insn(pc);
    putchar('\n');
  }

  static void printRegisterMaskLine(CORE_ADDR pc) {
    startLine(pc);
    int32 mask = *(int32*)pc;
    lprintf(".data %#lx ", mask);
    printMask(mask);
    putchar('\n');
  }
    

  static CORE_ADDR printCall(nmethod* nm, CORE_ADDR pc, addrDesc* loc) {
    // pc is the beginning of an inline cache or primitive call
    // return last pc printed
    printPD = NULL;
    printOneInstruction(pc);        // print call & set primDesc
    PrimDesc* pd = printPD;
    printOneInstruction(pc + 4);    // delay slot
    if (loc->isPrimitive()) {
      // NB: pd can be NULL, e.g. for jump to SendMessage_stub in prologue
      if (pd && pd->canScavenge()) {
        printRegisterMaskLine(pc + 8);
        return pc + 8;
      } else {
        return pc + 4;
      }
    } else {
      printRegisterMaskLine(pc + 8);
      sendDesc* sd = loc->asSendDesc(nm);
      printOneInstruction(pc + 12); // NLR code
      printOneInstruction(pc + 16); 
      int32* end = (int32*) (((char*)sd) + sd->endOffset());
      for (int32* instp = (int32*)(pc + 20); instp < end; instp++) {
        startLine((CORE_ADDR)instp);
        lprintf(".data ");
        print_address((CORE_ADDR)*instp);
        if (instp == (int32*)((char*)sd + sendDesc::lookupType_offset)) {
          putchar(' ');
          printLookupType(sd->raw_lookupType());
        }
        putchar('\n');
      }
      return (CORE_ADDR)end - 4;
    }
  }


  void print_code(nmethod* nm, CORE_ADDR start, CORE_ADDR end) {
    ResourceMark rm;
    printNM = nm; printPC = NULL; printScope = NULL;
    putchar('\n');
    for (CORE_ADDR p = start; p < end; p += 4) {
      ResourceMark rm2;
      if (!nm->isAccess()) {
        PcDesc* pc = nm->containingPcDesc(p);
        printScope = nm->containingScopeDesc(p);
        if (printPC == NULL || !pc->source_equals(printPC)) {
          lprintf("%8s  %s (%d)@%d:", "",
                 selector_string(printScope->key.selector),
                 printScope->offset(), pc->byteCode);
          if (pc->byteCode >= 0 && printScope->isCodeScope()) {
            methodMap* mm = printScope->method_map();
            mm->print_byteCode_at(pc->byteCode);
          }
          putchar('\n');
        }
        printPC = pc;
      }
      addrDesc* loc;
      if ((loc = nm->addrDesc_at(p)) != NULL && loc->isCall()) {
        p = printCall(nm, p, loc);
      } else {
        lprintf("%#8lx: ", p);
        print_insn(p);
        putchar('\n');
      }
    }
    printNM = 0;
  }

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
