# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "countStub_ppc.hh"
# include "_countStub_ppc.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


  void AgingStub::initPattern() {
    // nothing to do
  }


  pc_t CountStub::jump_addr() {
    CountCodePattern* patt = CountStub::pattern[countType()];
    int32* p = (int32*)insts();
    assert(is_lis(*(p + patt->nm_lis_offset)), "wrong pattern");
    assert(is_ori(*(p + patt->nm_ori_offset)), "wrong pattern");
    int32 n = UI(*(p + patt->nm_lis_offset)) << 16;
    return (pc_t)(n | UI(*(p + patt->nm_ori_offset)));
  }

  void ComparingStub::init(nmethod* nm) {
    CountCodePattern* patt = CountStub::pattern[Comparing];
    int32* p = (int32*)insts();
    set_recompile_addr(Memory->code->trapdoors->Recompile_stub_td());
    set_count_addr(patt, (int32)&sendCounts[id()]);
    assert(is_cmpwi(*(p + patt->limit_offset)), "wrong pattern");
    fint limit = recompileLimit(nm->level());
    assert(fits_within_si(limit), "can't use cmpwi");
    set_si(p + patt->limit_offset, limit);
  }

  void AgingStub::init(nmethod* nm) {
    CountCodePattern* patt = CountStub::pattern[Comparing];
    int32* p = (int32*)insts();
    set_recompile_addr(first_inst_addr(MakeOld_stub));
    set_count_addr(patt, (int32)&sendCounts[id()]);
    fint limit = nm->agingLimit();
    assert(fits_within_si(limit), "can't use cmpwi");
    set_si(p + patt->limit_offset, limit);
    set_count(1);    
  }


# ifdef UNUSED
  pc_t ComparingStub::get_recompile_addr() {
     fatal("unimp mac");
  }
# endif
  
  void ComparingStub::set_recompile_addr(pc_t addr) {
    CountCodePattern* patt = CountStub::pattern[Comparing];
    int32* p = (int32*)insts();
    assert(is_lis(*(p + patt->recompile_lis_offset)), "wrong pattern");
    assert(is_ori(*(p + patt->recompile_ori_offset)), "wrong pattern");
    int32 lo, hi;
    Assembler::break_up_word_for_oring(int32(addr), lo, hi);
    set_ui(p + patt->recompile_lis_offset, hi);
    set_ui(p + patt->recompile_ori_offset, lo);
  }
  

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

# endif // TARGET_ARCH == PPC_ARCH
