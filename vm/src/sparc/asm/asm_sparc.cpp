/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "asm_sparc.hh"
# pragma implementation "asm_inline_sparc.hh"  
  
# include "_asm_sparc.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


  Assembler* theAssembler;      // current assembler for instructions

  char* CondNames[] = {
    "n", "eq", "le", "lt", "leu", "cs", "neg", "vs",
    "a", "ne", "gt", "ge", "gtu", "cc", "pos", "vc"
    };


# ifdef SIC_COMPILER
    void Assembler::Unimp(fint n, bool shouldRestart) {
      // add an addrDesc for the unimp instruction so they're easier to find
      int32 mask = offset();
      genLoc(mask | addrDesc::isUncommonTrapMask);
      assert(n < MaxUnimpImm / 2, "unimp immediate too large");
      if (shouldRestart) n |= UncommonRestartBit;
      Data(n);
    }
# endif

# ifdef SIC_COMPILER
    // for statistics
    // encode type tests with trigger instructions; when changing these, be
    // sure to change 1st instr of SendMessage_stub as well

    void Assembler::startTypeTest(fint ncases, bool prologueCheck,
                                  bool immedOnly) {
      fint immed = 0;
      if (prologueCheck) immed |= tt_prologueMask;
      if (immedOnly)     immed |= tt_immediateOnlyMask;
      immed |= (ncases & tt_arityMask);
      OrNI(G0, immed, G0);
    }
    
    void Assembler::doOneTypeTest() { NxorR(G0, G0, G0); }
    void Assembler::endTypeTest()   { XorR(G0, G0, G0); }
    void Assembler::markTagTest(fint n, bool isArith) {
      n = (n << 1) | (isArith ? 1 : 0);
      XorI(G0, n, G0);
    }
    
# endif


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
