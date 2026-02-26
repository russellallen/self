# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

// *************************************
// * WARNING: duplicated in asmDefs.h, asmDefs_*.h
// *************************************


/* Format of sendDesc (offsets from return address):
  
 -1: call ...
  0: branch around sendDesc (ret pc points here)
  1: used registers mask
  2: non-local return code #1
  3: nmln #1
  4: nmln #2
  5: selector/arg count
  6: lookupType
  7: [delegatee]
  
  */
  
 public:
  enum {
    call_instruction_offset         = -9,
    jump_address_offset             = -4,    // must be address of disp32 in jump, not start of jump
    branch_around_desc_offset       =  0,
    mask_offset                     =  5,    // must be here for primitives
    non_local_return_offset         =  9,    // one instruction
    depend_offset                   =  14,    // two words of nmln
    selector_offset                 =  22,    // ** these are
    arg_count_offset                =  22,    // ** mutually exclusive
    lookupType_offset               =  26,    // lookup type
    delegatee_offset                =  30,

    normal_sendDesc_end_offset      = lookupType_offset + 4,
    
    
    // since always have branch, send getPrimCallEndOffset to the branch
       abortable_prim_continue_offset    = branch_around_desc_offset, 
    nonabortable_prim_continue_offset    = branch_around_desc_offset
  };
  
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // __i386__
