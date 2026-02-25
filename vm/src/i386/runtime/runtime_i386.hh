# if defined(__i386__) || defined(__x86_64__)
/* Sun-$Revision: 1.5 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// interface between C and assembly routines 

extern "C" {
  void volatile ContinueAfterReturnTrap(oop result, char* pc, char* sp);
  inline bool is_Self_return_address(char*) { return false; } // not really used
}


extern     char*  SendDIMessage_stub_returnPC;


// keep byte map base in a global variable
extern char*     byte_map_base;

inline void  Set_Byte_Map_Base(char* base) {byte_map_base = base;}
inline char*     Byte_Map_Base() { return byte_map_base; }


// must really flush windows, call out to asm stub
// Have to add this for Unix ppc
# if TARGET_OS_VERSION == MACOSX_VERSION \
  || TARGET_OS_VERSION == LINUX_VERSION
extern "C" {
  void FlushInstruction(void* addr);
}
# endif

// define FlushRegisterWindows()
// register windows? haha!
inline void FlushRegisterWindows() {}


extern char* SPLimit;
extern "C" {void set_SPLimitReg(char*); }
void  setSPLimit(char* m);
char* currentSPLimit();
extern "C" { void  HandleUncommonTrap(); }


// to convert a function to the address of its first instruction,
//  use first_inst_addr


  // Mac OS X is simpler.
  // With GCC 3's strict type checking, it's more convenient to make first_inst_addr
  // a macro, rather than a function. -mabdelmalek

# define first_inst_addr(fnPtr)  ((char*) (fnPtr))

// ppc interpreter needs help finding int arg on stack

extern "C" void* save1Arg(void*);
// On SPARC, save1Arg saves the argument across register-window switches.
// On x86/x86_64 there are no register windows, so just return the argument.
inline void* save1Arg(void* p) { return p; }

// see interpreter.c:


# define SaveNonVolRegsAndCall0( fn ) \
           ( fn() )
# define SaveNonVolRegsAndCall3( fn, a, b, c ) \
           ( fn((a), (b), (c) ) )
# define SaveNonVolRegsAndCall4( fn, a, b, c, d ) \
           ( fn((a), (b), (c), (d) ) )
# define SaveNonVolRegsAndCall5( fn, a, b, c, d, e ) \
           ( fn((a), (b), (c), (d), (e) ) )



inline bool fastPreemptionCheck() {
   return  (char*)currentFrame() <= (char*)currentSPLimit();
}


const int32 SelfStackLimit = 250000; // a wild guess
# endif // defined(__i386__) || defined(__x86_64__)
