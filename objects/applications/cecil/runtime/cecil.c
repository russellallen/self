/* Sun-$Revision: 9.1 $ */

# pragma implementation "cecil.h"

# include "cecil.h"
# include "methodCache.h"
# include "initcode.h"

CecilInitialEnv* base_env;
CecilEnv* currentEnv = NULL;

void breakpoint() {
  int i = 1;
}

void error_breakpoint() {
  int i = 1;
}

void breakpoint_prim() {
  int i = 1;
}

void fatalHandler() {
  int i = 1;
}

void OOPList::printShort() {
  int len = length();
  if (len == 0) {
    printf("{}");
  } else {
    printf("{ ");
    for (int i = 0; i < len; i++) {
      index(i)->printShort();
      if (i < len-1) {
	printf(", ");
      }
    }
    printf(" }");
  }
}

CecilImmutableStringObject* newCecilImmutableStringObject(char* s) {
  int len = strlen(s);
  CecilImmutableStringObject* newStr =
    new (len) CecilImmutableStringObject(len);
  char* b = newStr->bytes();
  for (int i = 0; i < len; i++) {
    b[i] = s[i];
  }
  return newStr;
}

CecilImmutableStringObject*
    newCecilImmutableStringObject(int len, char filler) {
  CecilImmutableStringObject* newStr =
    new (len) CecilImmutableStringObject(len);
  char* b = newStr->bytes();
  for (int i = 0; i < len; i++) {
    b[i] = filler;
  }
  return newStr;
}

CecilMutableStringObject* newCecilMutableStringObject(int len, char filler) {
  CecilMutableStringObject* newStr = new (len) CecilMutableStringObject(len);
  char* b = newStr->bytes();
  for (int i = 0; i < len; i++) {
    b[i] = filler;
  }
  return newStr;
}

CecilArrayObject* newCecilArrayObject(int len, OOP filler) {
  CecilArrayObject* newArray = new(len) CecilArrayObject(len);
  OOP* e = newArray->elements();
  for (int i = 0; i < len; i++) {
    e[i] = filler;
  }
  return newArray;
}

int CecilMap::fieldOffset(char* fieldName) {
  int len = fields.length();
  for (int i=0; i<len; i++) {
    FieldEntry* f = fields[i];
    if (strcmp(fieldName, f->fieldName) == 0) {
      return f->offset;
    }
  }
  printf("Tried to access unknown field \"%s\"\n", fieldName);
  fatalHandler();
  exit(-1);
}

extern OOP cecil_main();
extern void init_cecil();
extern void init_methods();

main() {
  OOP progResult = NULL;

  base_env = new CecilInitialEnv(NULL,NULL); 
  printf("Initializing runtime data structures...\n");
  init_global_objects();
  init_cecil();
  init_methods();
  printf("Starting program...\n\n");
  progResult = cecil_main();
  printf("\nProgram complete.  Result: ");
  progResult->print();
  printf("\n\nCache stats:\n");
  theMethodCache.printStats();
  breakpoint();
# ifdef PROFILED
    printf("\n\nWriting profiling stats...\n");
# endif
}
