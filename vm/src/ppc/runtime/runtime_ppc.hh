# ifdef __ppc__
/* Sun-$Revision: 30.17 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
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
extern     char*  SaveSelfNonVolRegs_returnPC;

static const fint   SendMessage_stub_volatile_register_sp_offset  = 12; // WARNING: duplicated in runtime_mpw_ppc.s
static const fint  SendDIMessage_stub_volatile_register_sp_offset = 12; // WARNING: duplicated in runtime_mpw_ppc.s
static const fint      Recompile_stub_volatile_register_sp_offset = 11; // WARNING: duplicated in runtime_mpw_ppc.s
static const fint        MakeOld_stub_volatile_register_sp_offset = 11; // WARNING: duplicated in runtime_mpw_ppc.s
static const fint  SaveSelfNonVolRegs_volatile_register_fp_offset =  -(NumLocalNonVolRegisters + NumRcvrAndArgRegisters); // WARNING: duplicated in runtime_mpw_ppc.s

bool isNonVolSavingReturnAddress(char* r);
fint volatile_register_sp_or_fp_offset(char* r);
extern fint ReturnTrap_frame_size;


// keep byte map base in a global variable
extern char*     byte_map_base;
// On PPC, this is also kept in a register, which is set on entry to Self,
// and on returning from a C prim called via SaveSelfNonVolRegs.
// Since this is only done if the primitive is flagged with canScavenge
// be sure that any code that calls this function is in a primitive with
// that flag.
inline void  Set_Byte_Map_Base(char* base) {byte_map_base = base;}
inline char*     Byte_Map_Base() { return byte_map_base; }


// must really flush windows, call out to asm stub
// Have to add this for Unix ppc
# if TARGET_OS_VERSION == MACOSX_VERSION
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
extern "C" void* currentRTOC();
extern "C" { void  HandleUncommonTrap(); }


// to convert a function to the address of its first instruction,
//  use first_inst_addr

#  if  COMPILER == MWERKS_COMPILER
// the Power MAC trucks in transfer vectors that have a level of indirection!
// but we assume everything is in same code segment (better check it)
//  For example, in process::transfer, there is no way to pass in the RTOC to
//  SetSpAndCall -- dmu 12/95
inline char* first_inst_addr(void* fnPtr) { 
  assert( currentRTOC() == ((void**)fnPtr)[1], 
              "Self VM assumes all code in same segment");
    return *(char**)fnPtr; 
  }
# else

  // Mac OS X is simpler.
  // With GCC 3's strict type checking, it's more convenient to make first_inst_addr
  // a macro, rather than a function. -mabdelmalek

# define first_inst_addr(fnPtr)  ((char*) (fnPtr))

# if 0
  // this version either 1) produces a lot of GCC 3 warnings, or 2) requires every
  // call to cast its parameter to (void*) -mabdelmalek 5/03
  inline char* first_inst_addr(void* fnPtr) {
    return (char*)fnPtr;
  }
# endif

# endif


// ppc interpreter needs help finding int arg on stack

extern "C" void* save1Arg(void*);




// see interpreter.c:
/* On the PPC, it is necessary to save & restore all
      nonvolatile registers around a call to provide
      for the case where either the primitive or a lookup
      does a non-local return.  The problem is that
      although each routine saves non-vol regs as needed,
      I cannot see how to get the asm non-local return code
      to restore them, as it does not know which routines
      store which regs. Maybe there is a better way? -- dmu
      PS: A Self nlr does not have to do this because
      it does not pop off frames in asm-land; it just returns
      normally with a flag set.
*/
/* As of 2003, each asm stub does its own 
   nonvol saving, and SaveSelfNonVolRegs is only
   used to call C primitives from Self.
   The stubs also save the outgoing argument
   volatile registers so that frame patching can catch them
   so that sends can be restrted after conversion.
  -- dmu 2/03]
*/

extern "C" oop    SaveSelfNonVolRegs(...);


extern "C" oop SaveNVAndCall5(...);
extern  char* SaveNVRet;

# define SaveNonVolRegsAndCall0( fn ) \
           SaveNonVolRegsAndCall1( (void*)(fn), 0)
           
# define SaveNonVolRegsAndCall1( fn, a ) \
           SaveNonVolRegsAndCall2( (void*)(fn), (a), 0)
           
# define SaveNonVolRegsAndCall2( fn, a, b ) \
           SaveNonVolRegsAndCall3( (void*)(fn), (a), (b), 0)
           
# define SaveNonVolRegsAndCall3( fn, a, b, c ) \
           SaveNonVolRegsAndCall4( (void*)(fn), (a), (b), (c), 0)
           
# define SaveNonVolRegsAndCall4( fn, a, b, c, d ) \
           SaveNonVolRegsAndCall5( (void*)(fn), (a), (b), (c), (d), 0)
           
# define SaveNonVolRegsAndCall5( fn, a, b, c, d, e ) \
           SaveNVAndCall5( (a), (b), (c), (d), (e), first_inst_addr((void*)fn))
static const fint SaveNV_fn_arg_index = 5;


inline bool fastPreemptionCheck() {
   return  (char*)currentFrame() <= (char*)currentSPLimit();
}


const int32 SelfStackLimit = 250000; // a wild guess



inline bool haveAltiVec() {
  bool slow_haveAltiVec();
  static bool haveChecked = false,  haveIt = false;
  if (haveChecked)
    return haveIt;
  haveChecked = true;
  return  haveIt = slow_haveAltiVec();
}  
# endif // __ppc__
