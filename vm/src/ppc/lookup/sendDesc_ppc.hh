# ifdef __ppc__
/* Sun-$Revision: 30.11 $ */

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
    call_instruction_offset         = -1 * 4,
    jump_address_offset             = -1 * 4,
    branch_around_desc_offset       =  0 * 4,
    mask_offset                     =  1 * 4,    // must be here for primitives
    non_local_return_offset         =  2 * 4,    // one instruction
    depend_offset                   =  3 * 4,    // two words of nmln
    selector_offset                 =  5 * 4,    // ** these are
    arg_count_offset                =  5 * 4,    // ** mutually exclusive
    lookupType_offset               =  6 * 4,    // lookup type
    delegatee_offset                =  7 * 4,

    normal_sendDesc_end_offset      = lookupType_offset + 4,
    
    // end offset for nlr case not defined for PPC, could be variable
    
    // since always have branch, send getPrimCallEndOffset to the branch
       abortable_prim_continue_offset    = branch_around_desc_offset, 
    nonabortable_prim_continue_offset    = branch_around_desc_offset
  };

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // __ppc__
