#pragma once
/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "error.hh"
# include "types.hh"



// conveniences
// these make gdb debugging easier.
const bool True = true;
const bool False = false;

extern fint Indent;
void printIndent();

extern oop catchThisOne;

// utilities

char* copy_string(const char* s);
char* copy_string(const char* s, smi len);

char* copy_c_heap_string(const char* s);

// copying oops must be accompanied by record_multistores for remembered set
void copy_oops_up(oop* from, oop* to, fint count);
void copy_oops_down(oop* from, oop* to, fint count);
inline void copy_oops(oop* from, oop* to, fint count) {
  copy_oops_up(from, to, count); }
inline void copy_oops_overlapping(oop* from, oop* to, fint count) {
  if (from < to) copy_oops_down(from + count, to + count, count);
  else if (from > to) copy_oops_up(from, to, count);
}

void set_oops(oop* to, fint count, oop value = NULL);

void copy_bytes_up  (const char* from, char* to, fint count);
void copy_bytes_down(const char* from, char* to, fint count);

inline void copy_bytes     (const char* from, char* to, fint count) {
            copy_bytes_up  (            from,       to,      count); }

inline void copy_bytes_overlapping(char* from, char* to, fint count) {
  if (from < to) copy_bytes_down(from + count, to + count, count);
  else if (from > to) copy_bytes_up(from, to, count);
}

void set_bytes(char* to, fint count, char value = '\0');

// like strcmp, but with slightly different order for slot
// ordering (sorts foo: before foo0 so that it immediately follows foo)
int compare_slot_names(const char *s1, fint l1, const char *s2, fint l2);

int compare_bytes(const char* b1, int l1, const char* b2, int l2);

inline void copy_words(int32* from, int32* to, fint count) {
  copy_oops((oop*) from, (oop*) to, count);
}
inline void copy_words_down(int32* from, int32* to, fint count) {
  copy_oops_down((oop*) from, (oop*) to, count);
}
inline void copy_words_up(int32* from, int32* to, fint count) {
  copy_oops_up((oop*) from, (oop*) to, count);
}
inline void copy_words_overlapping(int32* from, int32* to, fint count) {
  copy_oops_overlapping((oop*) from, (oop*) to, count);
}
inline void set_words(int32* from, fint count, int32 value = 0) {
  set_oops((oop*) from, count, (oop) value);
}

inline int32  min(int32  a, int32  b) { return a > b ? b : a; }
inline int32  max(int32  a, int32  b) { return a > b ? a : b; }
inline int32 umin(uint32 a, uint32 b) { return a > b ? b : a; }
inline int32 umax(uint32 a, uint32 b) { return a > b ? a : b; }
inline float  min(float  a, float  b) { return a > b ? b : a; }
inline float  max(float  a, float  b) { return a > b ? a : b; }

inline int32 iabs(int32 a) { return a >= 0 ? a : -a; }

# if TARGET_ARCH == I386_ARCH  ||  TARGET_ARCH == PPC_ARCH
extern "C" {  void swap_bytes(int32* xp); } // Do it with special instruction
# else  
  inline void swap_bytes(int32* xp) { 
    char* cp = (char*)xp;  char c;
    c = cp[0];  cp[0] = cp[3];  cp[3] = c;
    c = cp[1];  cp[1] = cp[2];  cp[2] = c;
  }
# endif


// some useful constants

const int32 K = 1024;
const int32 M = K * K;

const int32 oopSize = sizeof(oop); // Warning: Duplicated in asmDefs_ppc.h


// some useful macros


# define MYSELF(foo) foo

# define LOOP_UNROLL(count, body)                                             \
    {                                                                         \
    assert(count >= 0, "cannot have negative count in loop unroll");          \
    fint __c1__ = count;                                                      \
    for (fint __c__ = __c1__ >> 3; __c__; __c__ --) {                         \
    body;       body;                                                         \
    body;       body;                                                         \
    body;       body;                                                         \
    body;       body;                                                         \
  }                                                                           \
    switch (maskBits(__c1__, nthMask(3))) {                                   \
   case 7:      body;                                                         \
   case 6:      body;                                                         \
   case 5:      body;                                                         \
   case 4:      body;                                                         \
   case 3:      body;                                                         \
   case 2:      body;                                                         \
   case 1:      body;                                                         \
   case 0:      ;                                                             \
  } }

// If your compiler or lint supports a pragma informing it that a 
// variable is unused, redefine these appropriately

/* I have decided to use a macro instead of these functions
 * because some cases (e.g. f(oopClass& x) {Unused(x);} do not work
 * with functions -- dmu
 *
 *
 * inline void Unused(double x) { x, 0; }
 * inline void Unused(void *x) { x, 0; }
 * inline void Unused(void (*x)(...)) { x, 0; }
 */

// # define Unused(x) ((x), 0)
// This macro is more portable -- topa
#define Unused(x) (void)(x)

#if GENERATE_DEBUGGING_AIDS
# define UsedOnlyInAssert(v)
#else
inline void UsedOnlyInAssert(double x)   { (void)(x), 0; }
inline void UsedOnlyInAssert(void  *x)   { (void)(x), 0; }
#endif

extern "C" { 
  volatile void ShouldNotCall(const char *file, int line);
  volatile void ShouldNotReach(const char *file, int line);
}

#define ShouldNotCallThis()   ShouldNotCall(__FILE__, __LINE__)

#define ShouldNotReachHere()  ShouldNotReach(__FILE__, __LINE__)

#define SubclassResponsibility()  ShouldNotCallThis()

// Metroworks warns if you declare a function that has the
//  same name as an inherited virtual but has different arg types
//  To silence the warning, I have declared corresponding fns
//   in the base class and used this as the body: -- dmu

#define SilenceOverrideWarning() ShouldNotCallThis()
