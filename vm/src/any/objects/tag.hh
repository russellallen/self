/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// WARNING: Duplicated in asmDefs.hh and asmDefs_ppc.hh

const fint Int_Tag      = 0;
const fint Mem_Tag      = 1;
const fint Float_Tag    = 2;
const fint Mark_Tag     = 3;

const fint Tag_Size     = 2;
const fint Tag_Mask     = nthMask(Tag_Size);
const fint Num_Tags     = nthBit(Tag_Size);


const fint Float_Tag_bit_i386 = 1; // if this is on, and not a mark, must be float, numbered for Intel
const fint   Mem_Tag_bit_i386 = 0; // if this is on, and not a mark, must be mem


// Return the bit pattern of a (possibly tag-bearing, hence deliberately
// mis-aligned) oop as an integer.  The empty asm is an optimization barrier
// that emits no instructions but forces the optimizer to forget that the
// pointer came from an aligned type.  Without it, clang 13+ assumes "this" is
// aligned and folds the tag bits to zero, miscompiling every tag accessor.
// See https://github.com/llvm/llvm-project/issues/59889 .
// Signed smi return preserves smiOop::value()'s arithmetic-shift sign-extension.
// See the OPTIMIZER_HIDE_VAR macro in the Linux kernel sources for another use
// of this approach.
static inline smi tagBits(const void* p) {
  smi u = (smi)p;
  __asm__("" : "+r"(u));
  return u;
}

# define clearTag(oop)  (tagBits(oop) & ~Tag_Mask)
