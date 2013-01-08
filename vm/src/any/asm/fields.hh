/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// helper functions to access individual fields of instructions

// (portable ones here)

char* address_of_overwritten_NIC_save_instruction(int32* orig_save_addr);

void check_branch_relocation( void* from, void* to, int32 count);

# include "_fields_pd.hh.incl"
