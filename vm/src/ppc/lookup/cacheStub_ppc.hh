# if defined(__ppc__) || defined(__powerpc__)
/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

// included into class CacheStub

 private:
   Label* br_if_not_smi();
   Label* br_if_not_float();
   void  add_case(nmethod* nm, CountStub* stArg, pc_t addr);


# endif  // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // __ppc__
