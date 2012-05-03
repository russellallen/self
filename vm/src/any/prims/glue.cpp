/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "glue.hh"
# include "_glue.cpp.incl"
extern "C" {
  double ceil(double x);
  double floor(double x);
  double rint(double x);
}

const char *sealSeal = "Type seal for proxies representing a type seal.";
const char *TS_SO    = "Type seal for ld shared object handles.";
const char *TS_symb  = "Type seal for symbol addresses.";
const char *TS_func  = "Type seal for functions.";


# define WHAT_GLUE FUNCTIONS
    byteVector_glue
    objVector_glue
    foreign_glue
    misc_glue_1
    misc_glue_2
    process_glue
    timer_glue
    fctProxy_glue_1
    fctProxy_glue_2
    fctProxy_glue_3
    fctProxy_glue_4
    fctProxy_glue_5
    fctProxy_glue_6
    fctProxy_glue_7
    mirror_glue
    oop_glue
    slots_glue
    smi_glue
    float_glue
    profiler_glue
# ifdef DYNLINK_SUPPORTED
    dynLink_glue
# endif
# ifdef SIC_COMPILER
    sic_glue
# endif
# undef  WHAT_GLUE


