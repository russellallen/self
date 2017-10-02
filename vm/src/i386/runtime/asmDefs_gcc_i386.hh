#pragma once
# ifdef __i386__
// Sun-$Revision: 1.6 $

// Copyright 1992-2012 AUTHORS.
//   See the LICENSE file for license information.

// next 5 lines DUPLICATED in config.hh
# define   PRE_2007_OSX_ASM_RELEASE 4
# define  POST_2007_OSX_ASM_RELEASE 5
# ifndef OSX_ASM_RELEASE
  # define OSX_ASM_RELEASE POST_2007_OSX_ASM_RELEASE
# endif

# if (defined(sun) || defined(__sun)) && \
     (defined(__SVR4) || defined(__svr4__))
  # define SOLARIS 1
# endif

# if defined(__APPLE__)
  # define MACRO(name, ...) .macro name // __VA_ARGS__
  # define ENDMACRO .endmacro
  # define C_SYM(name) _##name
# elif defined(__linux__) || (defined(SOLARIS) && SOLARIS)
  # if defined(__clang__) && !defined(NO_INTEGRATED_AS_clang)
    # define MACRO(name, ...) .macro name // __VA_ARGS__
    # define ENDMACRO .endmacro
    # define C_SYM(name) name
  # else
    # define MACRO(name, ...) .macro name __VA_ARGS__
    # define ENDMACRO .endm
    # define C_SYM(name) name
  # endif
# else
  # error what?
# endif

# define round(x, y) (((x) + (y)-1) & ~((y)-1))

// global defs


# define size_of_reg               4
# define oopSize                   4 // Warning: Duplicated in util.hh

# define frame_word_alignment  4 // in frame_format_i386.hh
# define frame_byte_alignment  (frame_word_alignment * oopSize)


# define ResultReg %eax
# define CResultReg %eax
# define ReceiverReg %eax



// This whole group is DUPLICATED in regs_i386.h
// AND Wired in! to EnterSelf

# define NLRHomeIDReg %ecx
# define NLRHomeReg   %edx
# define NLRResultReg %eax
# define NLRTempReg   %ebx

# define NumNLRRegisters 3

# define Temp1 %ebx
# define Temp2 %ecx




# define DICountReg Temp1
# define DIInlineCacheReg Temp2


// DUPLICATED in frame_format_i386.hh
# define PerformSelectorLoc  %esi
# define PerformDelegateeLoc %edi

// WARNING THIS IS DUPLICATED IN sendDesc.h , offsets are relative to ret pc

# define non_local_return_offset  9 // # offset of NLR instruction from call


// ---------------------------------------------------------

MACRO(start_exported_function, name)

# if defined(__APPLE__) \
  || (defined(__linux__) && defined(__clang__) && !defined(NO_INTEGRATED_AS_clang))

  .globl C_SYM($0)
C_SYM($0):

# elif defined(__linux__) || (defined(SOLARIS) && SOLARIS)

  .global C_SYM(\name)
C_SYM(\name):

# else
  # error what?
# endif

ENDMACRO



// LinkageArea record:
# define LinkageArea_savedSP 0
# define LinkageArea_savedPC size_of_reg
# define LinkageArea_size size_of_reg // just PC

/* WARNING THIS IS DUPLICATED IN frame_format_i386.h */
# define current_pc_offset    size_of_reg



# define primitiveFailedOffset   4
# define badTypeOffset           8
# define divisionByZeroOffset    16
# define overflowOffset          20

// Warning: Duplicated in tag.hh
# define Int_Tag         0
# define Mem_Tag         1
# define Float_Tag       2
# define Mark_Tag        3

# define Tag_Mask        3
# define Tag_Size        2

// =====================================================

    MACRO(Untested)  // &string, &tmp
    hlt
    ENDMACRO


    MACRO(align_send_desc_call_rm) // call is 3 bytes, jmp is 5 bytes, jmpl is 5
        .align 2; nop; nop; nop;
    ENDMACRO

    // Sometime in 2006, Apple changed their assembler syntax:

    # if defined(__APPLE__) && OSX_ASM_RELEASE == PRE_2007_OSX_ASM_RELEASE

      MACRO(jmp_reg, reg)  // jump to contents of reg
        jmp $0
      ENDMACRO

      MACRO(jmp_reg_indir, reg) // reg contains memory address of word containing jmp addr
        jmp ($0)
      ENDMACRO

      MACRO(call_disp_reg_indir, disp reg) // reg contents + disp contains memory addr of word containing call addr
        call $0($1)
      ENDMACRO

      MACRO(jmp_label, label) // jump to label with four bytes for label
        jmpl $0
      ENDMACRO

    # elif (defined(__APPLE__) && OSX_ASM_RELEASE == POST_2007_OSX_ASM_RELEASE) \
        || (defined(__linux__) && defined(__clang__) && !defined(NO_INTEGRATED_AS_clang))

      MACRO(jmp_reg, reg)  // jump to contents of reg
        jmp *$0
      ENDMACRO

      MACRO(jmp_reg_indir, reg) // reg contains memory address of word containing jmp addr
        jmp *($0)
      ENDMACRO

      MACRO(call_disp_reg_indir, disp reg) // reg contents + disp contains memory addr of word containing call addr
        call *$0($1)
      ENDMACRO

      MACRO(jmp_label, label) // jump to label with four bytes for label
          // as of Mountain Lion, the old way does not work
          .byte 0xe9
          .long $0 - (. + 4)
      ENDMACRO


    # elif defined(__linux__) || (defined(SOLARIS) && SOLARIS)
      MACRO(jmp_reg, reg)
        jmp *\reg
      ENDMACRO

      MACRO(jmp_reg_indir, reg)
        jmp *(\reg)
      ENDMACRO

      MACRO(call_disp_reg_indir, disp reg)
        call *\disp(\reg)
      ENDMACRO

      MACRO(jmp_label, label)
        // make sure jmp occumpies 5 bytes
        .byte 0xe9
        .long \label - (. + 4)
      ENDMACRO
    # else
      # error what?
    # endif


# endif // __i386__
