/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma interface

// interface between C and assembly routines 


// to convert a function to the address of its first instruction,
// use first_inst_addr

//  inline char* first_inst_addr(void* fnPtr) { return (char*)fnPtr; }
# define first_inst_addr(fnPtr) ((char*)(fnPtr))


extern "C" {
  void volatile ContinueAfterReturnTrap(char* pc, char* sp);


  // SPARC VM uses differing calling conventions for primitive (and C) calls
  // as for Self calls, so VM needs to know if a return address is in the zone:
  
  void LowReturnAddress(...);
  void HighReturnAddress(...);
  inline bool is_Self_return_address(char* ret_addr) {
    return   ret_addr >=  first_inst_addr(  LowReturnAddress)
          && ret_addr <=  first_inst_addr( HighReturnAddress);
  }
}


// keep byte map base in a global register

extern "C" {
  void Set_Byte_Map_Base(char* base);
  char*    Byte_Map_Base();
}


// define FlushRegisterWindows()

// must really flush windows, call out to asm stub
extern "C" {
  void FlushRegisterWindows_stub();
  void FlushInstruction(void* addr);
}
inline void FlushRegisterWindows() { FlushRegisterWindows_stub(); }


extern "C" {
  frame* currentFP();

  void  setSPLimit(char* max);
  char* currentSPLimit();
  void setSPLimitAndContinue();
  void setSPLimitAndContinueEnd();   // not really a procedure, just end addr
  void  HandleUncommonTrap();
}

extern char* newSPLimit;                /* params for setSPLimitAndContinue */

extern char** profiler_return_addr;   // address to store return addresses
                                      // from the interrupt context.

extern oop  saved_globals[8];         // g0..g7 saved & restored by asm glue
extern oop  saved_outregs[8];         // o0..o7 saved & restored by asm glue



// historic: ppc interpreter needs help finding int arg on stack

inline     void* save1Arg(void* p) { return p; }




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

const int32 SelfStackLimit = 500000;
