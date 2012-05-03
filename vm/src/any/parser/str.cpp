/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "str.hh"
# include "_str.cpp.incl"

void String::Print() {
  smi   n = 0, i;
  const char *s = str;
  while (n < len) {            // loop to handle all '\0' in string.
    lprintf("%s", s);
    int r = strlen(s);
    i = r + 1;
    n += i;
    s += i;
    if (n < len)
      lprintf("\\0");
  }
}

fint String::line_count() {
  fint count = 1;
  for(const char *s = str; *s; s++) if (*s == '\n') count++;
  return count;
}

String* StringList::AsSelector() {
  smi len = 0;
  StringListElement* e;
  for (e = Head(); e; e = e->Next()) {
    len += strlen(e->Data()->AsCharP());
  }
  char* buffer = NEW_RESOURCE_ARRAY( char, len+1);
  char* b = &buffer[0];
  for (e = Head(); e; e = e->Next()) {
    for (const char* d = e->Data()->AsCharP(); *d; b++, d++) {
      *b = *d;
    }
  }
  *b = '\0';
  return new String(buffer);
}
