/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

 public:
  void  set_reg(Location reg, void* newValue);
# ifdef UNUSED
  void* get_reg(Location reg);
# endif

  char**  next_pc_addr();

  int   g1();
