#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "machineCache.hh"
# include "regs.hh"
# include "top.hh"




// helper functions to access individual fields of instructions

// (portable ones here)

char* address_of_overwritten_NIC_save_instruction(int32* orig_save_addr);

void check_branch_relocation( void* from, void* to, int32 count);

# if defined(__ppc__)
# include "fields_ppc.hh"
# elif defined(__i386__)
# include "fields_i386.hh"
# else
# include "fields_sparc.hh"
# endif

