/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma interface

const int string_table_size = 200;

struct stringNode {
  // instance variable
  char* string;
  char* version;
  int   flag;
  stringNode* next;
  
  // constructor
  stringNode(char* string, char *version, stringNode* next = NULL) {
    this->string  = string;
    this->version = version;
    unmark();
    this->next    = next;
  }
  ~stringNode() { delete next; }
  
  void mark()     { flag = 1; }
  void unmark()   { flag = 0; }
  int  isMarked() { return flag == 1; }
  
};

typedef int (*node_func)( stringNode* node);

struct stringTable {
  // instance variables
  stringNode* buckets[string_table_size];
  
  // constructors
  stringTable();

  // operations
  stringNode* lookup(char* string);

  void add(char *string, char* version);

  int enumerate( node_func f);
};


