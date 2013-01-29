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

# define clearTag(oop)  ((int32(oop)) & ~Tag_Mask)
