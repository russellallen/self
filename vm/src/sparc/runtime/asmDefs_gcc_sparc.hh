/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef sparc

# define arg0 %o0
# define arg1 %o1
# define arg2 %o2
# define arg3 %o3
# define arg4 %o4
# define arg5 %o5
# define receiver arg0
# define result receiver

# define iarg0 %i0
# define iarg1 %i1
# define iarg2 %i2
# define iarg3 %i3
# define iarg4 %i4
# define iarg5 %i5
# define ireceiver iarg0
# define iresult ireceiver

# define t  %g1
# define t1 %g2
# define t2 %g3
# define t3 %g4
  /* WARNING THIS IS DUPLICATED IN regs_sparc.h */
# define byte_map_base %g6
# define byte_map_base_offset  6*4  /* offset in saved_globals buffer */
# define splimit %g7
# define splimit_offset 7*4           /* offset in saved_globals buffer */
# define selector_for_performs %g1 /* perform send saves these here */
# define delegatee_for_performs %g2
# define nonvolatile_selector_for_performs %l0 /* WARNING: DUPLICATED in regs_sparc.hh */
# define nonvolatile_delegatee_for_performs %l1
# define diCache %g1
# define diVerified %g2
# define diRecompileLink %g3
# define recompileLinkReg %g5

# define NLRResultReg %g1
# define NLRHomeReg %g2
# define NLRHomeIDReg %g3
# define NLRTempReg %g4

  /* WARNING THIS IS DUPLICATED IN sendDesc_sparc.h */
# define primitive_end_offset 20
# define non_local_return_offset 12

  /* WARNING THIS IS DUPLICATED IN format_sparc.h */
# define current_pc_offset       -8

# endif
