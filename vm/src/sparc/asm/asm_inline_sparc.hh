/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

# undef RD


  inline void Assembler::assemble(uint32 instr) {
    if (instsEnd >= instsOverflow) fatal("routine is too long to compile");
    uint32* instp = (uint32*) instsEnd;
    *instp = instr;
    instsEnd += sizeof(instr);
  }
  
  inline uint32 OP(fint x) {
    assert((x & 3) == x, "invalid op");
    return x << 30;
  }
  
  inline uint32 RD(fint x) {
    assert(isRegister(Location(x)), "not a register");
    return x << 25;
  }
  
  inline uint32 OP2(fint x) {
    assert((x & 7) == x, "invalid op2");
    return x << 22;
  }
  
  inline uint32 OP3(fint x) {
    assert((x & 0x3f) == x, "invalid op3");
    return x << 19;
  }
  
  inline uint32 IMM22(int32 x)  { return toHigh(x); }
  inline uint32 DISP22(int32 x) { return toDisplacement(x) & nthMask(22); }
  inline uint32 DISP30(int32 x) { return toDisplacement(x) & nthMask(30); }
  inline uint32 SIMM13(int32 x) { return toLow(x); }
  inline uint32 I(fint x) {
    assert((x & 1) == x, "invalid I");
    return x << 13;
  }
  
  inline uint32 RS1(fint x) {
    assert(isRegister(Location(x)), "not a register");
    return x << 14;
  }
  
  inline uint32 RS2(fint x) {
    assert(isRegister(Location(x)), "not a register");
    return x;
  }
  
  inline uint32 A(fint x) {
    assert((x & 1) == x, "invalid A");
    return x << 29;
  }
  
  inline uint32 COND(fint x) {
    assert((x & 0x1f) == x, "invalid COND");
    return x << 25;
  }
  

  inline void Assembler::addOffset(OperandType t, bool isEmbedded,
                                   bool isDelay) {
    if (t == NumberOperand) {
      // never need a location
    }
    else if (t == VMAddressOperand && ! isEmbedded) {
      // don't need a location unless embedded
    }
    else {
      doAddOffset(t, isEmbedded, (isDelay ? addrDesc::inDelaySlotMask : 0));
    }
  }


  inline void Assembler::SetHiX(int32 s, OperandType t, Location d) {
    if (printing) {
        printf("  sethi ");
        printX(s, t);
        printf(", %s\n", RegisterNames[d]);
    }
    if ((t == OopOperand && !oop(s)->is_mem()) || t == NumberOperand) {
      // don't need a location
    } else {
      addOffset(t, true);
    }
    assemble(OP(00) | RD(d) | OP2(04) | IMM22(s));
  }

  inline void Assembler::SetHiX2(int32 s, OperandType t, Location d) {
    if (printing) {
      printf("  sethi2 ");
      printX(s, t);
      printf(", %s\n", RegisterNames[d]);
    }
    if ((t == OopOperand && !oop(s)->is_mem()) || t == NumberOperand) {
      // don't need a location
    } else {
      addOffset(t, true);
    }
    assemble(OP(00) | RD(d) | OP2(04) | toHigh2(s));
  }

  
  ExpandSetHiXTemplates(DefineSetHiXTemplate)
  ExpandSetHiXTemplates(DefineSetHiX2Template)


  inline void Assembler::CallX(int32 s, OperandType t) {
    if (printing) {
        printf("  call ");
        printX(s, t);
        printf("\n");
    }
    
    addOffset(t, true); // since calls are relative, ALWAYS need this
    
    assemble(OP(01) + DISP30(s - int32(instsEnd)));
  }
  

    ExpandCallXTemplates(DefineCallXTemplate)


  inline void Assembler::ArithR(const char* name, fint op, fint op3,
                                Location s1, Location s2, Location d) {
    assert(isRegister(s1), "operand 1 must be a register");
    assert(isRegister(s2), "operand 2 must be a register");
    assert(isRegister(d), "destination must be a register");

    if (printing) {
      printf("  %s %s, %s, %s\n",
             name, RegisterNames[s1], RegisterNames[s2], RegisterNames[d]);
    }
    assemble(OP(op) | RD(d) | OP3(op3) | RS1(s1) | I(0) | RS2(s2));
  }
  

  inline void Assembler::ArithX(const char* name, fint op, fint op3, Location s1,
                                int32 s2, OperandType t, bool noSetHi,
                                Location d) {
    assert(isRegister(s1), "operand 1 must be a register");
    assert(isRegister(d), "destination must be a register");

    if (printing) {
      int32 v= SIMM13(s2);
      if (s2 < 0) v |= ~0x1fff;
      printf("  %s %s, ", name, RegisterNames[s1]);
      printX(v, t, true);
      printf(", %s\n", RegisterNames[d]);
    }
    if ((t == OopOperand && !oop(s2)->is_mem()) || t == NumberOperand ||
        !noSetHi) {
      // don't need a location
    } else {
      addOffset(t, true);
    }
    assemble(OP(op) | RD(d) | OP3(op3) | RS1(s1) | I(1) | SIMM13(s2));
  }
  
   ExpandArithRTemplates(DefineArithRTemplate)

  inline void Assembler::Nop() {
    if (printing) printf("  nop\n");

    /* nop = sethi 0, g0 */
    assemble(OP(00) | RD(0) | OP2(04) | IMM22(0));
  }



  inline void Assembler::TccR(CondType c, Location s1, Location s2) {
    assert(isRegister(s1), "operand 1 must be a register");
    assert(isRegister(s2), "operand 2 must be a register");

    if (printing) {
      printf("  t%s %s, %s\n", CondNames[c],
             RegisterNames[s1], RegisterNames[s2]);
    }
    assemble(OP(02) | COND(c) | OP3(072) | RS1(s1) | I(0) | RS2(s2));
  }
  
  inline void Assembler::TccX(CondType c, Location s1, int32 s2, OperandType t,
                              bool noSetHi) {
    assert(t == NumberOperand, "can't handle non-numbers");

    if (printing) {
      printf("  t%s %s\n", CondNames[c], RegisterNames[s1]);
      printX(SIMM13(s2), t, true);
      printf("\n");
    }
    if ((t == OopOperand && !oop(s2)->is_mem()) || t == NumberOperand ||
        !noSetHi) {
      // don't need a location
    } else {
      addOffset(t, true);
    }
    assemble(OP(02) | COND(c) | OP3(072) | RS1(s1) | I(1) | SIMM13(s2));
  }
  
  ExpandTccTemplates(DefineTccTemplate)


  inline void Assembler::Bcc(CondType c, Label* target, bool annul) {
    int32 disp;
    if (target->isDefined()) // use label if defined, setup backpatch if not
      disp = target->target() - instsEnd;
    else {
      target->unify(new Label(printing, addr()));
      disp = 0;
    }
    assert(disp <= maxBranch && disp >= -maxBranch, "branch too big");
    if (printing) {
       printf("  b%s%s L%ld\n",
              CondNames[c],
              annul ? ",a" : "",
              long(target->id()));
    }
    assemble(OP(00) | A(annul) | COND(c) | OP2(02) | DISP22(disp));
  }
  

  // the following only works in SPARC V9 (ultra)
  //  so now use call instead
  
  inline void Assembler::ReadPC(Location d) {
    assert(isRegister(d), "destination must be a register");
    if (printing) {
      printf("  rdpc %s\n", RegisterNames[d]);
    }
    assemble(OP(02) | RD(d) | OP3(0x28) | RS1(5) | I(0) | SIMM13(0));
  }
  
  inline Label* Assembler::BccForward(CondType c, bool annul) {
    Label* l = new Label(printing, addr());

    if (printing) {
      printf("  b%s%s L%ld\n",
             CondNames[c],
             annul ? ",a" : "",
             long(l->id()));
    }
    assemble(OP(00) | A(annul) | COND(c) | OP2(02) | DISP22(0));
    return l;
  }
  
  ExpandBccTemplates(DefineBccTemplate)

  inline void Assembler::Backpatch(char* instr, char* target) {
    // backpatch branch instr at instr to jump to target
    int32 displ = target - instr;
    assert(displ, "branch jumps to itself");
    assert(displ <= maxBranch && displ >= -maxBranch, "branch too big");
    int32* instp = (int32*)instr;
    assert(disp(instp) == 0, "already has displacement");
    *instp |= DISP22(displ);
    lastBackpatch = target;
  }
  

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
