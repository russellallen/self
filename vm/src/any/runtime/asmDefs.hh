#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "macros.hh"

/* asm definitions for cpp */


# define markOop(c) c

/* Warning: Duplicated in tag.hh */

# define Int_Tag 0
# define Mem_Tag 1
# define Float_Tag 2
# define Mark_Tag 3

# define Tag_Mask 3
# define Tag_Size 2

# define intMask 0xfffffffc    

# ifndef badOop
# define badOop 7
# endif

# if defined(__ppc__)
# include "asmDefs_gcc_ppc.hh"
# elif defined(__i386__)
# include "asmDefs_gcc_i386.hh"
# else
# include "asmDefs_gcc_sparc.hh"
# endif

