# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "abstract_interpreter_inline.hh"
# include "blockOop_inline.hh"
# include "cacheStub_inline.hh"
# include "codeSlotsMap.hh"
# include "countStub.hh"
# include "disasm.hh"
# include "fields.hh"
# include "frame_format.hh"
# include "label_inline.hh"
# include "nmethod_inline.hh"
# include "oop_inline.hh"
# include "pcDesc.hh"
# include "prim.hh"
# include "scopeDesc.hh"
# include "sendDesc.hh"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


void print_code(nmethod* /*nm*/, CORE_ADDR start, CORE_ADDR end) {
  warning2("unimp intel (no disasm) start = 0x%x, end = 0x%x", start, end);   
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == I386_ARCH
