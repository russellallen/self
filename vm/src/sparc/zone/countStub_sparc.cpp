/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "abstract_interpreter_inline.hh"
# include "countStub.hh"
# include "nmethod.hh"
# include "recompile.hh"
# include "zone.hh"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


  void AgingStub::initPattern() {
    Assembler* a = new Assembler(oopSize, oopSize, false, true);
    a->AddI(G0, 0, Temp1);
    add_inst = *(int32*)a->instsStart;
    a->finalize();
  }


  pc_t CountStub::jump_addr() {
    CountCodePattern* patt = CountStub::pattern[countType()];
    int32* p = (int32*)insts();
    assert(isSetHi(p + patt->nm_sethi_offset), "wrong pattern");
    assert(isJump (p + patt->nm_jmp_offset), "wrong pattern");
    pc_t n = (pc_t)getSetHiImm(p + patt->nm_sethi_offset);
    n += getArithImm(p + patt->nm_jmp_offset);
    return n;
  }




  void ComparingStub::init(nmethod* nm) {
    CountCodePattern* patt = CountStub::pattern[Comparing];
    int32* p = (int32*)insts();
    set_recompile_addr(Memory->code->trapdoors->Recompile_stub_td());
    set_count_addr(patt, (int32)&sendCounts[id()]);
    assert(isSetHi(p + patt->limit_sethi_offset), "wrong pattern");
    fint limit = recompileLimit(nm->level());
    setSetHiImm(p + patt->limit_sethi_offset, limit);
  }

  void AgingStub::init(nmethod* nm) {
    CountCodePattern* patt = CountStub::pattern[Comparing];
    int32* p = (int32*)insts();
    set_recompile_addr(first_inst_addr(MakeOld_stub));
    set_count_addr(patt, (int32)&sendCounts[id()]);
    fint limit = nm->agingLimit();
    if (limit > 1023) {
      setSetHiImm(p + patt->limit_sethi_offset, limit);
    } else {
      // setHi would set to 0, so use an add instead
      p[patt->limit_sethi_offset] = add_inst;
      setArithImm(p + patt->limit_sethi_offset, limit);
    }
    set_count(1);
  }


# ifdef UNUSED
  pc_t ComparingStub::get_recompile_addr() {
    CountCodePattern* patt = CountStub::pattern[Comparing];
    int32* p = (int32*)insts() + patt->recompile_offset;
    assert(isSetHi(p), "wrong pattern");
    assert(isJump(p + 1), "strange instruction after setHi");
    int32 val = getSetHiImm(p) + getArithImm(p + 1);
    return (pc_t)val;
  }
# endif
  
  void ComparingStub::set_recompile_addr(pc_t addr) {
    CountCodePattern* patt = CountStub::pattern[Comparing];
    int32* p = (int32*)insts() + patt->recompile_offset;
    assert(isSetHi(p), "wrong pattern");
    assert(isJump(p + 1), "strange instruction after setHi");
    setSetHiImm(p    , int32(addr));
    setArithImm(p + 1, int32(addr));
  }
  

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

