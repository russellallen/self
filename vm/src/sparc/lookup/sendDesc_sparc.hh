/* Sun-$Revision: 30.9 $ */

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
  
  0: call ...
  1: <delay slot>
  2: used registers mask
  3: non-local return code #1
  4: non-local return code #2
  5: nmln #1
  6: nmln #2
  7: selector/arg count
  8: lookupType
  9: [delegatee]
  
  */
  
 public:
  enum {
    call_instruction_offset = 0,
    jump_address_offset     = 0,        // jump is in the call instruction
    mask_offset             = 2 * 4,    // must be here for primitives
    non_local_return_offset = 3 * 4,    // two instructions
    depend_offset           = 5 * 4,    // two words of nmln
    selector_offset         = 7 * 4,    // ** these are
    arg_count_offset        = 7 * 4,    // ** mutually exclusive
    lookupType_offset       = 8 * 4,    // lookup type
    delegatee_offset        = 9 * 4,

    normal_sendDesc_end_offset      = lookupType_offset + 4,
       abortable_prim_end_offset    = depend_offset, // room for nlr
    nonabortable_prim_end_offset    = non_local_return_offset,
    
    // On SPARC, continuation = end offset
       abortable_prim_continue_offset    = depend_offset, // room for nlr
    nonabortable_prim_continue_offset    = non_local_return_offset
  };  

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
