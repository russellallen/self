/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class ErrorCodes {
 public:
   static void init();

   static markOop  general_prim_error(const char *err_string);
   static markOop       os_prim_error(fint error);
   static markOop vmString_prim_error(VMStringsIndex i);
   
  // Try to match a prefix of errString with either a "prim error" name,
  // an OS error name or a dynamic linker error name. If matched, return
  // corresponding explanation.
  static oop error_message_prim(byteVectorOop errString);

 private:
  // platform-specific fns:
  static char* os_error_message(char* s);  // takes ptr to non-terminated str, returns stringOop, 0 or -1
  static const char* os_error_name(fint error);
};

