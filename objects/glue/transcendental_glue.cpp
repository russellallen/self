/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

#include "_glueDefs.cpp.incl"
#include "transcendental.primMaker.hh"

#include <math.h>

#ifdef DYNAMIC
VERIFYCHECKSUM
#endif
 
double log2(double x) {
  return log(x) / log(2.0);
}

#define WHAT_GLUE FUNCTIONS
  transcendental_glue
#undef WHAT_GLUE
