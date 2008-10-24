/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "errorCodes.hh"
# include "_errorCodes.cpp.incl"


void ErrorCodes::init() {
# define CHECK(offset, vmStringIndex) \
  if (offset  !=  sizeof(int32) * vmStringIndex) \
    lprintf("In asmErrorCodes.h: %s is wrong.  Should be %ld\n", \
           STR(offset), \
           long(sizeof(int) * vmStringIndex)); \
  else {}
  
  CHECK(primitiveFailedOffset, PRIMITIVEFAILEDERROR);
  CHECK(        badTypeOffset,         BADTYPEERROR);
  CHECK( divisionByZeroOffset,  DIVISIONBYZEROERROR);
  CHECK(       overflowOffset,        OVERFLOWERROR);
  
# undef CHECK
}
  

markOop ErrorCodes::general_prim_error(const char* err_string) {
  return  new_string(err_string)->markify();
}


markOop ErrorCodes::os_prim_error(fint error) {
  // result must have mark tag to indicate primitive failure
  return  new_string(ErrorCodes::os_error_name(error))->markify();
}


# define      EXTRACT_MESSAGE_ARGUMENT(template,s1,s2,s3)  template(s3)
# define PASS_THROUGH_MESSAGE_ARGUMENT(s)  s ,

static char* errorMessages[] = {
  ErrorStrings(PASS_THROUGH_MESSAGE_ARGUMENT, EXTRACT_MESSAGE_ARGUMENT)
};
# undef      EXTRACT_MESSAGE_ARGUMENT
# undef PASS_THROUGH_MESSAGE_ARGUMENT
  
  
oop ErrorCodes::error_message_prim(byteVectorOop errString) {
  // Try to match a prefix of errString with either a "prim error" name,
  // a unix error name or a dynamic linker error name. If matched, return
  // corresponding explanation. 
  char* s = errString->bytes();

  // search in VMString table
  assert( 0 == strncmp(errorMessages[0], VMString[0]->bytes(), VMString[0]->length()),
          "VMString table must start with ErrorStrings");
          
  for (int32 i = 0; i < sizeof(errorMessages) / sizeof(errorMessages[0]); i++) {
    if (!strncmp(s, VMString[i]->bytes(), VMString[i]->length()))
      return new_string(errorMessages[i]);
  }
  
  char* r = ErrorCodes::os_error_message(s);
  if (r == (char*)-1 )  return errString;
  if (r == NULL      )  return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
  else                  return new_string(r); 
}


markOop ErrorCodes::vmString_prim_error(VMStringsIndex i) { 
  return  VMString[i]->markify(); 
}
