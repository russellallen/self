#pragma once
/* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "debug.hh"
# include "framePieces.hh"
# include "frame_format.hh"
# include "process.hh"
# include "regs.hh"
# include "runtime.hh"
# include "stack.hh"
# include "types.hh"
# include "universe_inline.hh"
# include "zone.hh"



/* Portability strategy:
   Each platform needs its own frame class.
   Yet each one shares much in common.
   Our solution is to #include the machine-dependent part into the
   class definition, and have a platform.frame.c for the machine-dependent
   routines.
*/


// in addition to fwded routines
//  a new platform must typedef frame

typedef void (*returnTrapHandlerFn)(...);

class Conversion; // for friend declaration below

class frame {


  // here are platform-dependent routines that must be supplied for
  //  each platform
  // I think the "inner" refers to inner in the Beta sense; these are override

 public:      frame* sender();

 protected:   char**   real_return_addr_addr();
 public:      void** location_addr(Location r, RegisterLocator* rl = NULL);
 protected:   oop*   location_addr_of_incoming_argument(Location r, RegisterLocator* rl);

 protected:   void  copy_to(char* sp, char* caller, char* pc, bool adjust);
 protected:   frame* copy(fint nsenders = 0, bool adjustBlocks = false);

 protected:  void adjust_blocks(frame* oldScope,  frame* newScope, RegisterLocator* rl);
 public:     void fix_frame(char* pc, char* sp);

 public:      frame* home_frame_of_block_scope(frame* hint = NULL);
 public:      frame* block_scope_of_home_frame();
 public:      frame* home_frame_of_vfo_locals(frame* hint = NULL);
 public:      frame* vfo_locals_of_home_frame();

 protected:   int32 frame_size_of_uncopied_frame();

 public:      char* c_entry_point();
 public:      char* c_return_pc();

 public:      frame* make_full_frame(char* pc); // return this on 68k
 public:      frame* make_full_frame_after_trap(char* pc); // return this on 68k
 public:      frame* make_full_frame_on_user_stack(); // return this on 68k

 public:      sendDesc* send_desc();


 public:     void scavenge_contents(RegisterLocator*);
 public:     void gc_mark_contents(RegisterLocator*);
 public:     void gc_unmark_contents(RegisterLocator*);
 public:     bool verify_oops(RegisterLocator*);
 public:     void switch_pointers(oop from, oop to, RegisterLocator*);
 
 public:     void oops_do(oopsDoFn f, RegisterLocator*);
 public:     void stack_locations_do(oopsDoFn f, RegisterLocator*); // iterates through marked locs
 public:     void zap(RegisterString mask, RegisterLocator*); // zap all locations unmarked in mask

 protected:  RegisterString mask_if_present(); // helper for above fns
  
// used for scavenging, must return allocated location
//  for every interpreter state struct that may exist
//  return IllegalLocation for non-interp frame
// (the 2nd fn does the same for block scope (one up in sparc))

 protected:  static Location location_of_interpreter_of_block_scope(void* entry_point);

 
 
 protected:  void print_compiled();
 
 protected:   oop get_lookup_arg(fint index);


  // now the platform-independent ones:


 public:     frame* sendee(frame* hint = NULL);
 public:     bool verify(int n, RegisterLocator* rl);

// nmethod_frame_chain methods
  
 protected:   frame** nmethod_frame_chain_addr(nmethod* nm);

 public:
  frame*     nmethod_frame_chain(nmethod* nm);
  void   set_nmethod_frame_chain(frame* f, nmethod* nm);
  
  
  // patched_frame_saved_outgoing_args methods:
  // Sometimes after a return trap, we need to restart a send.
  // (For instance, when killing activations.)
  // Since the outgoing args are gone on the PPC after a frame returns,
  // we need to save them before taking the return trap.
  // So, when patching the frame, save the args in an object vector
  // and put the pointer in the frame.
  
public:
 objVectorOop      patched_frame_saved_outgoing_args(nmethod* nm = NULL);
 void          set_patched_frame_saved_outgoing_args(objVectorOop, nmethod* nm = NULL);
 objVectorOop                  extract_outgoing_args(frame* sendeeOrNULL = NULL);
 
private:
 friend class FrameIterator;
 objVectorOop*  patched_frame_saved_outgoing_args_addr(nmethod* nm = NULL);
 oop            perform_selector_of_SendMessage_stub_frame();

  

  // currentPC methods: Sometimes, we need to regain control before
  //  a given frame is returned INTO. So we patch the return address
  //  that would return into this frame to go somewhere else, and
  //  store what was there in the frame's currentPC.

 protected:
    
 public:
  char** currentPC_addr();
  char* currentPC();
  void  set_currentPC(char* p);


  // real return address, where the pc for returning TO ME is

 protected:

 public:
  char*      real_return_addr();
  void   set_real_return_addr(char* x);

  
  // return address routines (deal with patching)
  // NB: this is the address where I will resume in my method,
  //   upon return to me, not the address I will return TO. -- dmu


 public:
  char* return_addr();
  void set_return_addr(char* addr);
  void adjust_return_addr(int32 delta);
  void fix_current_return_address(char* addr);
 protected:
  char* platform_independent_return_addr();
  
 public:    void  patch(frame* prev, bool forceSelfFrame = false);
 public:    void  patch_profiler_trap();
 protected: void  patch_interpreted_self_frame(bool forProfiling);
 protected: void  patch_compiled_self_frame(returnTrapHandlerFn new_fn);
 protected: returnTrapHandlerFn
                  return_addr_for_patching(bool forceSelfFrame, frame* sendee);
 protected: void  trace_patch(returnTrapHandlerFn new_fn);

 public:
              
  bool is_patched();
  void remove_patch();
  void remove_patches_up_to_C();
  frame* get_patched_self_frame(char* sp_of_patched_frame);


// registers
  
  

// conversion & recompilation routines

 public:
       
  frame* selfSender();
  frame* immediateSelfSender();         // same, but don't skip C frames
  
  Stack* my_stack();
  
 public:
  int32 frame_size();           // in oops


  // testers
 public:
 
  bool is_compiled_self_frame();
  bool is_self_stub_frame();
  bool is_interpreted_self_frame();
  
  interpreter* get_interpreter();
  interpreter* get_interpreter_of_block_scope();
    
  bool is_self_frame();
    
  bool is_first_self_frame();
    
  fint vdepth(bool includePrologueVframe = false);

  bool is_in_prologue();
  
  bool is_aligned();

// operations

 public:

  nmethod* code();
  void nmethod_moved_by(int32 delta, nmethod* where_nm_is_now);
  
  // tracing operations
 public:
  void trace(oop receiver, nmethod* c);
  void traceAssignment(oop receiver, nmethod* c);
  void traceLookup(oop receiver, nmethod* c);
  
  void print_trace_indent();
  void print();  
  void printVerbose();
 private:
  void printVerbose_on_this_platform();
  void printRegs();
  
  // helpers for copy:
 protected:
  frame* find_last_frame_to_copy(fint nsenders);
  frame* copy_frames_through(frame* last_frame_to_copy);
  int32  copy_through_oop_count(frame* last_frame_to_copy);
  void   adjust_blocks_of_copied_frames(fint, frame*);
  void   adjust_frame_links_of_copied_frames(   frame*, frame*);

    
 protected:
  
  friend class Profiler;
  friend class Recompilation;
  friend class ::Conversion; //  currently platform-dependent
  
 private:
  void save_outgoing_arguments();
  fint outgoing_arg_count(frame* sendee);
  
# if defined(__ppc__)
# include "frame_ppc.hh"
# elif defined(__i386__)
# include "frame_i386.hh"
# else
# include "frame_sparc.hh"
# endif
};


inline bool  isPatchedReturnAddress(char* r) {
    return r == first_inst_addr((void*)ReturnTrap)
        || r == first_inst_addr((void*)PrimCallReturnTrap)
        || r == first_inst_addr((void*)ProfilerTrap); 
}
     
     
// When we catch a return into a frame (via return trap),
// the following variable holds the outgoing arguments that were
// captured when the frame was set:
extern objVectorOop OutgoingArgsOfReturnTrapOrRecompileFrame;


// called from assembly glue
extern "C" {
  void HandleReturnTrap(oop result, char* sp,
                        bool nlr, frame* home, int32 homeID);
                        
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  char *HandleProfilerTrap(char* return_address);
# endif
}
const fint HandleReturnTrap_arg_count = 5;

# define SavedFrameChain ((frame*)1)
# define NoFrameChain    NULL
