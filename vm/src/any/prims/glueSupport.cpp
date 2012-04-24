/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "glueSupport.hh"
# include "_glueSupport.cpp.incl"

oop check_glue_return(oop value) {
  // Called by debug version of glue functions. Simply verifies that
  // 'value' is a good oop to return. Must return 'value' or fail.
  if (!value->verify_oop_mark_ok())
    fatal("invalid primitive result");
  if (value->is_mark() && !value->memify()->is_string())
    fatal("primitive error value isn't a string");
  return value;
}



oop glue_conversion_error(smi err, const char* additional_msg) {
  // Called from glue code, when argument/result conversion error detected.
  // E.g. err == BADTYPEERROR, additional_msg == ": s_arg_0 should be int".
  ResourceMark rm;
  int err_len = VMString[err]->length();
  char*   str = NEW_RESOURCE_ARRAY( char, err_len + strlen(additional_msg) +1);
  memcpy(str, VMString[err]->bytes(), err_len);
  strcpy(str + err_len, additional_msg);
  return ErrorCodes::general_prim_error(str);
}


static inline failure_handle* indicate_failure(void* FH) {
  failure_handle* FH0 = (failure_handle* )FH;
  if (FH0->fh_magic != FH_MAGIC)
    fatal("failure function called with invalid failure handle");
  FH0->failed = true;
  return FH0;
}


extern "C" void failure(void* FH, const char* msg) {
  // This function is called from 'glued-in' functions to raise an exception.
  failure_handle* FH0 = indicate_failure(FH);
  FH0->msg = ErrorCodes::general_prim_error(msg);
}


extern "C" void unix_failure(void* FH, int err) {
  // Like failure, but interpretes err as a unix error no (if err has
  // value -1, the current value of errno is used instead).
  if (err == -1)
    err = errno;
  failure_handle* FH0 = indicate_failure(FH);
  FH0->msg = ErrorCodes::os_prim_error(err);
}


extern "C" void prim_failure(void* FH, VMStringsIndex err) {
  // Like failure, but constructs an error msg in the same way as ErrorCodes::vmString_prim_error.
  failure_handle* FH0 = indicate_failure(FH);
  FH0->msg = ErrorCodes::vmString_prim_error(err);
}


extern "C" void out_of_memory_failure(void* FH, int32 size, int32 bsize) {
  // Out of memory (could not allocate an object of size oops and bsize 
  // words in byte area
  failure_handle* FH0 = indicate_failure(FH);
  FH0->msg = ErrorCodes::vmString_prim_error(OUTOFMEMORYERROR);
  // need to do something clever with sizes --miw
  Unused(size); Unused(bsize);
}



char* nameOfArgc(const char* fctName) {
  // A crude way to determine the name of the variable which contains the argc
  // for the function with SYMBOL name fctName. This function should probably
  // be generalized, and rely on the C++ name mangler/demangler. 
  static const int maxFNLen = 240;
  static char  str[maxFNLen]; 
  assert(strlen(fctName) + strlen(XSTR(glue_fctname_extension)) < maxFNLen, 
         "Fct name shouldn't be this long");
  strcpy(str, fctName);
  strcat(str, XSTR(no_of_args_extension));
  return str;
}

