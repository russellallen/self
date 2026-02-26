# if defined(__aarch64__)
/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

/* ARM64 assembly definitions for interpreter-only builds.
   Modeled after asmDefs_gcc_amd64.hh but most of this is unused
   since we have no JIT compiler for aarch64.  Only the constants
   that are referenced from shared C++ headers are defined here. */

# if defined(__APPLE__)
  # define C_SYM(name) _##name
# elif defined(__ELF__)
  # define C_SYM(name) name
# else
  # error what?
# endif

# define round(x, y) (((x) + (y)-1) & ~((y)-1))


// global defs

# define size_of_reg               8
# define oopSize                   8 // Warning: Duplicated in util.hh

# define frame_word_alignment  2 // in frame_format_aarch64.hh
# define frame_byte_alignment  (frame_word_alignment * oopSize)


// Warning: Duplicated in tag.hh
# define Int_Tag         0
# define Mem_Tag         1
# define Float_Tag       2
# define Mark_Tag        3

# define Tag_Mask        3
# define Tag_Size        2


#define start_exported_function(name)		\
	.global C_SYM(name)	;		\
C_SYM(name):

#define end_exported_function(name) /* no .size directive for macho */


# endif // defined(__aarch64__)
