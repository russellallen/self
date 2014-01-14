/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// utilities for parsing selector strings

// # args expected by selector s (excluding receiver)
fint str_arg_count(const char* s);
fint str_arg_count(const char* s, fint len);

// is s a valid slotname ?
bool str_is_slot_name(const char* s);
bool str_is_slot_name(const char* s, fint len);

bool str_is_prim_name(const char* s, fint len);
bool str_is_prim_name(const char* s);

bool str_has_IfFail(const char* s);
bool str_has_IfFail(const char* s, fint len);
