# ifdef __ppc__
/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

 public:
  oop* R0_addr();
  char** lr_addr();
  char*  lr(); // link register
# endif // __ppc__
