# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "abstract_interpreter_inline.hh"
# include "countStub.hh"
# include "nmethod.hh"
# include "recompile.hh"
# include "zone.hh"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


  void AgingStub::initPattern() {
  /*
    // nothing to do
  */
  }


  pc_t CountStub::jump_addr() {
    CountCodePattern* patt = CountStub::pattern[countType()];
    int32* p = (int32*)(int32(insts()) + patt->nmAddr_offset);
    return (pc_t) *p + int32(p) + sizeof(int32);
  }

  void ComparingStub::init(nmethod* nm) {
    CountCodePattern* patt = CountStub::pattern[Comparing];
    set_recompile_addr((pc_t)Recompile_stub);
    set_count_addr(patt, (int32)&sendCounts[id()]);

    int32* p = (int32*)(int32(insts()) + patt->limit_offset);
    assert(*p == patt->initial_limit, "???");
    fint limit = recompileLimit(nm->level());
    *p = limit;
  }

  void AgingStub::init(nmethod* nm) {
    CountCodePattern* patt = CountStub::pattern[Comparing];
    set_recompile_addr(first_inst_addr(MakeOld_stub));
    set_count_addr(patt, (int32)&sendCounts[id()]);
    int32* p = (int32*)(int32(insts()) + patt->limit_offset);
    assert(*p == patt->initial_limit, "???"); 
    fint limit = nm->agingLimit();
    *p = limit;
    set_count(1);    
  } 


# ifdef UNUSED
  pc_t ComparingStub::get_recompile_addr() { 
     fatal("Unused Intel");
  }
# endif
  
  void ComparingStub::set_recompile_addr(pc_t addr) {
    CountCodePattern* patt = CountStub::pattern[Comparing];
    int32* p = (int32*)(int32(insts()) + patt->recompileStub_offset);
    *p = int32(addr) - int32(p) - sizeof(int32);
  }
  

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

# endif // TARGET_ARCH == I386_ARCH
