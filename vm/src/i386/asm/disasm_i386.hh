# ifdef __i386__
/* Sun-$Revision: 1.3 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



# define CORE_ADDR          pc_t
  // function for printing annotated code
  void print_code(nmethod* nm, CORE_ADDR start, CORE_ADDR end);


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // __i386__
