# ifdef __ppc__
/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


  inline void CountStub::set_count_addr(CountCodePattern* patt, int32 addr) {
    int32* p = (int32*)insts();
    assert(is_lis(*(p + patt->countAddr_offset)), "wrong pattern");
    assert(is_lwz(*(p + patt->lwz_offset)),       "wrong pattern");
    assert(is_stw(*(p + patt->stw_offset)),       "wrong pattern");
    int32 lo, hi;
    Assembler::break_up_word_for_adding(int32(addr), lo, hi);
    set_ui(p + patt->countAddr_offset, hi);
    set_si(p + patt->lwz_offset,       lo);
    set_si(p + patt->stw_offset,       lo);
  }
  
  inline int32 CountStub::count_addr(CountCodePattern* patt) {
    int32* p = (int32*)insts();
    assert(is_lis(*(p + patt->countAddr_offset)), "wrong pattern");
    assert(is_lwz(*(p + patt->lwz_offset)),       "wrong pattern");
    int32 addr = UI(*(p + patt->countAddr_offset)) << 16;
    return addr + SI(*(p + patt->lwz_offset));
  }
  
  inline void CountStub::set_callee(CountCodePattern* patt, int32 addr) {
    int32* p = (int32*)insts();
    assert(is_lis(*(p + patt->nm_lis_offset)), "wrong pattern");
    assert(is_ori(*(p + patt->nm_ori_offset)), "wrong pattern");
    int32 lo, hi;
    Assembler::break_up_word_for_oring(int32(addr), lo, hi);
    set_ui(p + patt->nm_lis_offset, hi);
    set_ui(p + patt->nm_ori_offset, lo);
  }

  

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // __ppc__
