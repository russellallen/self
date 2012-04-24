/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class String: public ParseNode {
 public:
  const char* str;
  smi         len;    // Necessary since strings may contain '\0'.
  
  String(const char* s)        { str = s; len = strlen(str); }
  String(const char* s, smi l) { str = s; len = l; }
  
  const char*   AsCharP() { return str; }
  fint        arg_count() { return str_arg_count(str); }

  bool equals(String* other) {
    return strcmp(AsCharP(), other->AsCharP()) == 0;
  }

  fint line_count();
  
  void Print();
};

class StringListElement: public ListElement {
 public:
  StringListElement(String* d, StringListElement* n = 0) : ListElement(d, n) {}
  String* Data() { return (String*) ListElement::Data(); }
  StringListElement* Next() { return (StringListElement*) ListElement::Next(); }
};

class StringList: public List {
 public:
  StringList() : List() {}
  StringList(String* e) : List(e) {}
  
  StringListElement* Head() { return (StringListElement*) List::Head(); }
  StringListElement* Tail() { return (StringListElement*) List::Tail(); }
  StringList* Append(String* e) { return (StringList*) List::Append(e); }
  
  String* AsSelector();
};
