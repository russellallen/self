/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "debug.hh"
# include "eventlog.hh"
# include "process.hh"
# include "top.hh"

fint Indent = 0;

void printIndent() {
  for (fint i = 0; i < Indent; i++) lprintf("  ");
}

# define DO_UP(from) LOOP_UNROLL(count, *to++ = from)
# define DO_DOWN(from) LOOP_UNROLL(count, *--to = from)

void copy_oops_up(oop* from, oop* to, fint count) {
  assert(maskBits(int32(from), Tag_Size) == 0, "not word aligned");
  assert(maskBits(int32(to), Tag_Size) == 0, "not word aligned");
  assert(count >= 0, "negative count");
  DO_UP(*from++)
  }

void copy_oops_down(oop* from, oop* to, fint count) {
  assert(maskBits(int32(from), Tag_Size) == 0, "not word aligned");
  assert(maskBits(int32(to), Tag_Size) == 0, "not word aligned");
  assert(count >= 0, "negative count");
  DO_DOWN(*--from)
  }

void set_oops(oop* to, fint count, oop value) {
  assert(maskBits(int32(to), Tag_Size) == 0, "not word aligned");
  assert(count >= 0, "negative count");
  DO_UP(value)
  }

void copy_bytes_up(const char* from, char* to, fint count) {
  assert(count >= 0, "negative count");
  DO_UP(*from++)
  }

void copy_bytes_down(const char* from, char* to, fint count) {
  assert(count >= 0, "negative count");
  DO_DOWN(*--from)
  }

void set_bytes(char* to, fint count, char value) {
  assert(count >= 0, "negative count");
  DO_UP(value)
  }


char* copy_string(const char* s) {
  fint len = strlen(s) + 1;
  char* str = NEW_RESOURCE_ARRAY( char, len);
  strcpy(str, s);
  return str;
}

char* copy_c_heap_string(const char* s) {
  fint len = strlen(s) + 1;
  char* str = NEW_C_HEAP_ARRAY( char, len);
  strcpy(str, s);
  return str;
}

char* copy_string(const char* s, smi len) {
  char* str = NEW_RESOURCE_ARRAY( char, len+1);
  memcpy(str, s, len+1);
  str[len] = '\0';
  return str;
}


int compare_slot_names(const char *s1, fint l1, const char *s2, fint l2) {
  int len= min(l1, l2);
  while (len > 0 && *s1 == *s2) {
    ++s1;
    ++s2;
    --len;
  }
  if (len == 0) 
    return l1 < l2 ? -1 : l1 == l2 ? 0 : 1;
  char c1= *s1;
  char c2= *s2;
  assert(c1 != c2, "oops");
  return c1 == ':' ? -1
       : c2 == ':' ?  1
       : c1 < c2   ? -1
                   :  1;
}

// like strcmp, but w/o null-termination and fast
//  assumes int32 is 4 bytes long
int compare_bytes(const char* b1, int l1, const char* b2, int l2) {
  int len = min(l1, l2);
  if (len >= 16  &&  !((int(b1) | int(b2)) & 3)) {
    int32 *i1 = (int32*)b1;
    int32 *i2 = (int32*)b2;
    int    len32 = len >> 2;
    while( len32 >= 16 ) {
      if (i1[0] != i2[0]) {i1 += 0; i2 += 0; len32 -= 0; goto check_word; }
      if (i1[1] != i2[1]) {i1 += 1; i2 += 1; len32 -= 1; goto check_word; }
      if (i1[2] != i2[2]) {i1 += 2; i2 += 2; len32 -= 2; goto check_word; }
      if (i1[3] != i2[3]) {i1 += 3; i2 += 3; len32 -= 3; goto check_word; }
      if (i1[4] != i2[4]) {i1 += 4; i2 += 4; len32 -= 4; goto check_word; }
      if (i1[5] != i2[5]) {i1 += 5; i2 += 5; len32 -= 5; goto check_word; }
      if (i1[6] != i2[6]) {i1 += 6; i2 += 6; len32 -= 6; goto check_word; }
      if (i1[7] != i2[7]) {i1 += 7; i2 += 7; len32 -= 7; goto check_word; }
      if (i1[8] != i2[8]) {i1 += 8; i2 += 8; len32 -= 8; goto check_word; }
      if (i1[9] != i2[9]) {i1 += 9; i2 += 9; len32 -= 9; goto check_word; }
      if (i1[10] != i2[10]){i1 += 10; i2 += 10; len32 -= 10; goto check_word; }
      if (i1[11] != i2[11]){i1 += 11; i2 += 11; len32 -= 11; goto check_word; }
      if (i1[12] != i2[12]){i1 += 12; i2 += 12; len32 -= 12; goto check_word; }
      if (i1[13] != i2[13]){i1 += 13; i2 += 13; len32 -= 13; goto check_word; }
      if (i1[14] != i2[14]){i1 += 14; i2 += 14; len32 -= 14; goto check_word; }
      if (i1[15] != i2[15]){i1 += 15; i2 += 15; len32 -= 15; goto check_word; }
                            i1 += 16; i2 += 16; len32 -= 16;
    }
    {
      int32* e32 = i1 + len32;
      for ( ;  i1 < e32;  ++i1, ++i2 )
        if (*i1 != *i2) break;
      len32 = e32 - i1;
    }
   check_word: 
    // at this point i1 and i2 point to words to be compared
    // len32 contains how many words left to be compared
    int charsCompared = ((len >> 2) - len32) << 2;
    b1  += charsCompared;
    b2  += charsCompared;
    len -= charsCompared;
  }
  const char* e1 = b1 + len; 
  while ( b1 < e1 ) {
    char c1 = *b1++;
    char c2 = *b2++;
    if (c1 != c2)
      return c1 < c2 ? -1 : 1;
  }
  return l1 < l2 ? -1 : (l1 == l2 ? 0 : 1);
}


oop catchThisOne;

void breakpoint() {
  static fint junk = 0;
  junk = 1;
}

void error_breakpoint() {
  static fint junk = 0;
  (void)junk;
}

volatile void ShouldNotCall(const char *file, int line) {
  lprint_fatal(file, line, "Calling member function which shouldn't be called");
}

volatile void ShouldNotReach(const char *file, int line) {
  lprint_fatal(file, line, "Reached supposedly impossible case");
}

// just in case asserts go haywire
# if defined(assert)
#    undef assert
# endif
void assert(bool b, const char* msg) {};
