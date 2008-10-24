# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# if   !GENERATE_DEBUGGING_AIDS

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

# endif


# if defined(FAST_COMPILER)

  inline void CodeGen::jumpTo(void* target, Location reg, Location link = UnAllocated ) {
    fatal("not needed for intel");  
  }

# endif // FAST_COMPILER

# endif // __i386__
