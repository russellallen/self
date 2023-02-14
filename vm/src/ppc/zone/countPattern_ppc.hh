# if defined(__ppc__) || defined(__powerpc__)
/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

    // included in CountCodePattern class

  public:
    fint countAddr_offset;      // lis   loading high bits of counter address
    fint lwz_offset;            // lwz   loading  low bits of counter address
    fint stw_offset;            // stw instruction
    fint limit_offset;          // cmpli containing the limit in its immediate field
    fint nm_lis_offset;         // lis loading high bits of nmethod address
    fint nm_ori_offset;         // ori loading  low bits of nmethod address
    fint recompile_lis_offset;  // lis loading high bits of recompile function address
    fint recompile_ori_offset;  // ori loading  low bits of recompile function address


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // __ppc__
