/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


oop check_glue_return(oop value);
  // Called by debug version of glue functions. Simply verifies that
  // 'value' is a good oop to return. Must return 'value' or fail.

oop glue_conversion_error(smi err, char *additional_msg);
  // Called from glue code, when argument/result conversion error detected.
  // E.g. err == BADTYPEERROR, additional_msg == ": s_arg_0 should be int".


extern "C" void failure(void *FH, const char *msg);
  // This function is called from 'glued-in' functions to raise an exception.
  // extern "C" so that it may be called from C.


extern "C" void unix_failure(void *FH, int err = -1);
  // Like failure, but interpretes err as a unix error no (if err has
  // value -1, the current value of errno is used instead).
  // extern "C" so that it may be called from C.


extern "C" void prim_failure(void *FH, VMStringsIndex err);
  // Like failure, but constructs an error msg in the same way as ErrorCodes::vmString_prim_error.
  // extern "C" so that it may be called from C.


extern "C" void out_of_memory_failure(void *FH, int32 size = 0, int32 bsize = 0);

char *nameOfArgc(char *fctName);
  // A crude way to determine the name of the variable which contains the argc
  // for the function with SYMBOL name fctName. This function should probably
  // be generalized, and rely on the C++ name mangler/demangler.
