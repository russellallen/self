/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "stringUtil.hh"
# include "_stringUtil.cpp.incl"

fint str_arg_count(const char* s) {
  char c = *s++;
  assert(c != '\0', "shouldn't be testing the empty string");
  if (!is_id_alpha(c)) {
    return 1;
  }
  fint argc = 0;
  for (;;) {
    c = *s++;
    if (c == '\0') {
      break;
    } else if (c == ':') {
      argc ++;
    }
  }
  return argc;
}

fint str_arg_count(const char* s, fint len) {
  assert(len > 0, "should have a positive length");
  char c = *s;
  if (!is_id_alpha(c)) {
    return 1;
  }
  if ( s[ len-1 ] != ':' )  return 0; // an optimization
  fint argc = 1;
  for (const char* ss = s + len - 3; // last is :, next-to-last is alpha
       ss > s;                 // do not need to look at first one
       --ss ) {
    if (*ss == ':') {
      argc ++;
    }
  }
  return argc;
}

bool str_is_slot_name(const char* s, fint len) {
  assert(len >= 0, "shouldn't be negative length");
  if (len == 0) {
    return false;
  }
  char c = *s;
  if (!is_lower(c)) {
    if (!is_punct(c))     return false;
    switch (c) {
     case '^':      case '|':       case '\\':   case '.':
       if (len == 1) return false;
    }
    for (int i = 0;  i < len; ) {
      c = s[i++];
      if (! is_punct(c)) return false;
      switch (c) {
       case '(':  case ')':  case '\'':  case '\"':  case ':':  
       case '[': case ']':
        return false;
      }
    }
    return true;
  }
  for (int i = 1;  i < len;  ) {
    c = s[i++];
    if (is_id_char(c))   continue;
    if (c != ':')        return false;
    if (i == len)        return true;  // this was final ":"
    if (!is_upper(s[i])) return false; // after ":" must be uppercase
    if (s[len-1] != ':') return false; // one ":" -> last is ":"
  }
  return true;
}

bool str_is_prim_name(const char* s) { return str_is_prim_name(s, strlen(s)); }

bool str_is_prim_name(const char* s, fint len) {
  return len >= 1  &&  s[0] == '_';
}

bool str_has_IfFail(const char* s) { return str_has_IfFail(s, strlen(s)); }

bool str_has_IfFail(const char* s, fint len) {
  return len >= 7  &&  strncmp(s + len - 7, "IfFail:", 7) == 0;
}
