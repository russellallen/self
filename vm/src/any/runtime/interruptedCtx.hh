/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

#include <pthread.h>

// Forward-declaration for friend
void abort_init();

class InterruptedContext {
 private:
  self_sig_context_t* scp;
  static self_sig_context_t dummy_scp;
  pthread_t the_self_thread; // NULL if platform doesn't do pthreads
  
 public:
  static void continue_abort_at(char *addr, bool addDummyFrame);

  // continue at addr after returning from signal handler; sets continuePC to
  // scp->sc_pc
  static void set_continuation_address(char* addr, bool mustSucceed, bool setSema);
  
  static void fatal_menu();
  
  static InterruptedContext* the_interrupted_context;
  
  
  void  set(self_sig_context_t* sc = 0);
  void  set(InterruptedContext* ic) { scp = ic->scp; }
  
  bool  is_set() { 
     bool r   =   scp != &dummy_scp  &&  scp != NULL; 
     assert(!r || scp->uc_mcontext != NULL, "Snow Leopard isSet bug hut");
     return r;
  }

  char**  pc_addr();
  char* pc();
  char* next_pc(); // noop on PPC
  void  set_pc(void* pc);
  void  set_next_pc(void* npc); // noop on PPC


  int*   sp_addr();
  frame* sp();
  void   set_sp(void *sp);

  void   invalidate();
  
  bool   forwarded_to_self_thread(int);

  bool  in_system_trap();
  bool  in_read_trap();
  bool  in_write_trap();
  int   system_trap();
  int   code_at_pc();
  
  bool is_in_self_thread();
  void must_be_in_self_thread();
  
  static void  setupPreemptionFromSignal();
  
 private:
  friend void abort_init();
  void set_the_self_thread();
  
  // fatal menu helper fns
  static void quit_self();
  static void print_stack();
         void print_C_stack();
  static void print_registers();
  static void return_to_prompt(SignalBlocker*);
  
# include "_interruptedCtx_pd.hh.incl"
};

extern InterruptedContext  AbortContext;


