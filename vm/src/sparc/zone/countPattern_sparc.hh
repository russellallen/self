#pragma once
/* Sun-$Revision: 30.5 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


    // included in CountCodePattern class

  public:
    fint countAddr_offset;      // sethi loading counter address
    fint countAddr_offset2;     // sethi reloading counter address
    fint ld_offset;             // load instruction
    fint st_offset;             // store instruction
    fint nm_sethi_offset;       // sethi of nmethod address
    fint nm_jmp_offset;         // jmp to nmethod
    fint limit_sethi_offset;    // sethi of counter limit
    fint recompile_offset;      // call Recompile_stub


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
