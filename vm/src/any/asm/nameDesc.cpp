/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "asm_inline.hh"
# include "blockOop_inline.hh"
# include "label_inline.hh"
# include "nameDesc.hh"
# include "print.hh"
# include "regs.hh"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


void LocationNameDesc::print() {
  lprintf("@");
  printLocation(location());
  lprintf(" (%d)", (void*)offset);
}

void ValueNameDesc::print() {
  lprintf("=");
  value()->print_real_oop();
  lprintf(" (%d)", (void*)offset);
}

void BlockValueNameDesc::print() {
  lprintf("[=");
  value()->print_real_oop();
  lprintf("]");
  lprintf(" (%d)", (void*)offset);
}

void MemoizedBlockNameDesc::print() {
  lprintf("[@");
  printLocation(location());
  lprintf("=");
  value()->print_real_oop();
  lprintf("]");
  lprintf(" (%d)", (void*)offset);
}

void IllegalNameDesc::print() {
  lprintf("<illegal>");
  lprintf(" (%d)", (void*)offset);
}

# ifdef SIC_COMPILER
  ValueLocationNameDesc::ValueLocationNameDesc(Location l, oop val,
                                               blockOop blk) : NameDesc(0) {
    // callers pass in badOop for blk if not needed
    v = val; loc = l; block = blk;
    assert(!val->is_block() ||
           oop(blk) == badOop || val->map()->equal(blk->map()), "bad block");
  }

  void ValueLocationNameDesc::print() {
    lprintf("@");
    printLocation(location());
    lprintf("=");
    value()->print_real_oop();
    lprintf(" [%#lx] (%d)", block, (void*)offset);
  }
# endif


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
