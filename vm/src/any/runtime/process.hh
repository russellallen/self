/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// A Process is the VM-level process descriptor of a Self process;
// Self-level process objects (see processOop/Map) contain a pointer
// to their respective Process object and vice versa.

extern Process* prevProcess;
extern Process* currentProcess;
extern Process* twainsProcess;
extern Process* vmProcess;
extern bool8 processSemaphore;  // "semaphore" to protect some critical sections
extern bool ConversionInProgress;       // true during programming conversions


extern bool traceP;
extern bool traceV;

class CSect {
  bool b;
  bool* sem;
 public:
  CSect(bool& sema) { b = sema; sem = &sema; sema = true; }
  ~CSect()          { *sem = b; }
};

class PreservedList {
 public:
  preservedVmObjBList list;
  
  PreservedList() : list(32, true) {  }
  void clear()          { list.clear(); }
  void oops_do(oopsDoFn f, Process* p);
};

enum ProcessState {
  initialized,          // ready, but has no stack yet and hasn't run Self code
  ready,                // could continue at any time, or is currently running
  stopped,              // stopped because of error; cannot continue but
                        // still has a stack which can be inspected
  aborting,             // currently unwinding its stack, or already dead
                        // but not yet destroyed; has no stack
  defunct               // not a real process
  };

typedef void (*process_p)();


// Forward-declaration for friend  
void startCurrentProcess();
void interruptCheck();
class Processes;
class processOopClass;
class vframeMirror;

class Process: public CHeapObj {
  char* suspendedSP;    // process state - saved in runtime_(sparc_mac_ppc).s
  char* suspendedPC;
  
  bool pcWasSet; // Intel needs to know this
  
  Process* next;
  Stack stk;
  oop method;           // top-level doIt method
  PreservedList preservedList;
  processOop procObj;

  frame* check_vfo_locals;           // for checking vframeOop liveness
  frame* check_vfo_locals_sender;    // check_vfo_locals->sender()
  // for debugging only
  bool check_vfo_locals_is_uncommon; // is check_vfo_locals's nmethod an uncommon branch?

  bool stepping;        // are we in single-step mode?
  bool stopping;        // just returned from "finish" operation; stop ASAP
  char* _uncommonPC;    // PC of uncommon trap (if currently handling unc.trap)
  vframeOop _killUpToVF;// first survivor when cutting back the stack
  bool deoptimizing;    // currently deoptimizing the last stack frame
 public:
  bool zombie;                  // true if it was unreachable at the last GC
  bool restartAfterConversion;  // for controlling restarting after conversion
  
 protected:  
  Process* aborter;     // process aborting us
  
 public:
  ResourceArea resource_area;
  int32 nesting;        // e.g. 2 means Self called VM called Self
  int32 current_hash;   // Counter used when assigning hash-values to objects.
  ProcessState state;
  
  vframeOop  stopActivation; // activation of "finish" operation

  Profiler* profiler;   // profiler for this process.
  
  friend void startCurrentProcess();
  friend void interruptCheck();
  friend class Processes;
  friend class processOopClass;
  friend class vframeMirror;
  
  Process(processOop p, int32 sSize, oop rcvr = NULL,
          stringOop sel = NULL, objVectorOop args = NULL);
  ~Process();

  void init(char* pcVal);
  void print();
  void print_short();
  
  // execution
  bool hasStack() { return stk.base != NULL; }
  bool allocate();
  void start();
  void terminate();                     
  void abort();
  void transfer();                      // coroutine transfer to this process
  
  // termination functions
  static void volatile abort_process();
  static void volatile terminate_process();


  void setupPreemption()   { setSPLimit(stackEnd()); } // set up for preemption
  void clearPreemption()   { setSPLimit(spLimit()); }    // reset
  bool preemptionPending();
  
  void nonLifoError();
  
  void setSingleStepping();     // set up single step mode
  void patchForSingleStepping(frame* f = NULL);
                                // sets SPLimit & frame patch if necessary
  bool isSingleStepping()       { return stepping; }
  void resetSingleStepping();
  
  void setUncommon(char* pc)    { _uncommonPC = pc; }
  char* uncommonPC()            { return _uncommonPC; }
  bool isUncommon()             { return _uncommonPC != NULL; }
  void resetUncommon()          { _uncommonPC = NULL; }
  
  void setStopPoint(vframeOop stop);
  bool isStopping()             { return stopping; }
  frame* stopFrame();
  void resetStopping()          { stopping = false; }

  void killFrames(abstract_vframe* vf);
  bool isKilling()              { return _killUpToVF != NULL; }
  void resetKilling()           { _killUpToVF = NULL; }
  vframeOop killVF()            { return _killUpToVF; }

  void setDeoptimizing()        { deoptimizing = true; }
  bool isDeoptimizing()         { return deoptimizing; }
  void resetDeoptimizing()      { deoptimizing = false; }
  void deoptimize(frame* last);    // deoptimize last stack frame

  bool isKillingOrDeoptimizing() { return isKilling() || isDeoptimizing(); }
  bool verifyFramePatches();

  void gotoByteCode(abstract_vframe* last, smi bci, objVectorOop exprStack, void* FH);

  bool isClean() {
    return  !stopping
        &&  !stepping
        &&  !isUncommon()
        &&  !check_vfo_locals
        &&  !isKilling()
        &&  !isDeoptimizing(); }


  // methods for top-level running of self code
  
  oop runDoItMethod( oop rcv,
                     oop meth,
                     oop* args = NULL,
                     fint arg_count = 0);

  oop  prepare_to_call_self();
  void cleanup_after_calling_self();
  void cleanup_after_eval_prim(oop res);
  
 private:
  void initialize(oop rcvr, stringOop sel, objVectorOop args);
  void kill();
  
 public:
  // stack operations
  int32 selfNesting()           { return nesting; }
  bool  inSelf(bool including_prologue = false);       // "in Self" = has visible Self activations
                                                       // (false if !including_prologue && topmost activation is in prologue)
  char* stackEnd()              { return stk.end(); }
  bool  contains(void* sp)      { return stk.contains(sp); }
  char* spLimit()                 { return stk.spLimit(); }
  char* lastSP()                { return suspendedSP; }
  bool  isStackOverflow(char* sp) { return stk.isStackOverflow(sp); }
  bool  hadStackOverflow()      { return stk.markDestroyed(); }
  bool  hasEmptyStack();
  void  resetStackOverflow()    { stk.mark(); }
  frame* last_self_frame(bool includePrologue,  RegisterLocator** rl = NULL)  {
    return stk.last_self_frame(includePrologue, rl); }
  
  void  setPC(process_p newPC)  { suspendedPC= first_inst_addr((char*)newPC); pcWasSet= true; }
  bool  isRunnable()            { return state <= ready; }
  processOop processObj()       { return procObj; }
  Stack* stack()                { return &stk; }
  
  // memory operations
  void preserve(preservedVmObj* p);
  void un_preserve(preservedVmObj* p);
  void scavenge_contents();
  void gc_mark_contents();
  void gc_unmark_contents();
  bool verify();
  void switch_pointers();
  void read_snapshot(FILE* f);
  void write_snapshot(FILE* f);
  void chainFrames()    { if (nesting > 0) stack()->chainFrames(); }
  void unchainFrames()  { if (nesting > 0) stack()->unchainFrames(); }
  
  // programming operations
  void convert();
  void prepare_to_return_to_self_after_conversion(frame* new_last_self_frame, 
                                                  bool& resetartSend,
                                                  bool& wasUncommon,
                                                  int32*& uncommonPC);
  bool is_done_with_killing_or_deoptimizing(frame* dest_self_fr);

  // vframe mirror operations

  vframeOop insertVFrameOop(vframeOop vfm);
  vframeOop findVFrameOop(abstract_vframe* vfs);
  vframeOop findInsertionPoint(abstract_vframe* vf);

 protected:
  void killVFrameOops(abstract_vframe* currentVF);
  void killVFrameOopsInCurrentFrame(abstract_vframe* currentVF);
  frame* frame_for_check_vfo_locals(abstract_vframe* currentVF);

  void trace_killVFrameOopsInCurrentFrame(vframeOop, abstract_vframe*);

  void set_check_vfo_locals( abstract_vframe* currentVF);
  void clear_check_vfo_locals();

  
 public:
  void convertVFrameOops(frame* fr, frame* vfoLocals,
                         nmethod* invalidNM,
                         int32 vdepth, abstract_vframe** old_vf, abstract_vframe** new_vf);
  void killVFrameOopsAndSetWatermark(frame* currentFrame);
  
  void printVFrameList(fint howMany);
  bool verifyVFrameList();
  
 protected:
  void clearWatermark();
  void setWatermark(abstract_vframe*);
  
  void traceAndLog_killVFrameOopsAndSetWatermark(frame*, abstract_vframe*);
  void traceEpilog_killVFrameOopsAndSetWatermark();

  // queuing
 public:
  void addAfter(Process* p)     { next = p->next; p->next = this; }
  void remove(Process* p)       { p->next = next; next = NULL; }
};

bool isStackOverflow(char* sp);
bool isOnVMStack(void* sp);
extern frame* frameSwitchingToVMStack;

enum PreemptCause {
  cNoCause = -1,
  cTerminated, cAborted, cStackOverflowed, cNonLIFOBlock,
  cLastFatalCause = cNonLIFOBlock,
  cYielded,
  cSingleStepped, cFinishedActivation,
  cSignal,
  cLowOnSpace,
  cCouldntAllocateStack, // this isn't really a source of preemption; the
                         // process never got started
  cLast                                 // insert new causes before this line
  };

inline bool isFatalCause(PreemptCause c) {
  return c <= cLastFatalCause && c != cNoCause; }

extern PreemptCause preemptCause;
extern int32 causeString[cLast]; // translates  PreemptCause --> VMString index
extern oop yieldArg;             // argument passed with _Yield
extern oop yieldRcvr;            // receiver of _Yield

class Processes: public CHeapObj {
 public:
  bool idle;
  bool needsInvalidate;                 // needs to mark invalid stack frames
  
  Processes();
  void startVMProcess();        // init and start; won't return!
  
  void discardAll();
  void processesDo(processesDoFn f, bool doItForAll = false);
  
  bool isIdle() { return idle; }
  void print();
  
  // memory operations
  void scavenge_contents();
  void gc_mark_contents();
  void gc_unmark_contents();
  void gc_mark_remaining_processes();
  void enumerate_references(enumeration *e);
  void enumerate_families(enumeration *e);
  bool verify();
  void switch_pointers(oop from, oop to);
  void read_snapshot(FILE* f);
  void write_snapshot(FILE* f);
  void chainFrames();
  void unchainFrames();
  objVectorOop zombies();
  
  // programming
  void convert();       // convert all stacks after programming change
  void convert_cont();
  
  // son-of operation
  Stack* stackFor(void* f) {
    // try it the fast way (covers almost all calls)
    return currentProcess->contains(f) || isOnVMStack(f)
            ? currentProcess->stack()
            : slowStackFor(f); // have to do it the slow way
  }
  
 private:
  void init();
  Stack* slowStackFor(void* f);
  
 public:
  friend void doTerminateAll_VM();
  friend void doAbortAll_VM();
  friend void doDiscardAll_VM();
};

extern Processes* processes;

oop zombie_prim();

void preemptor();       // set up things to preempt Self process
void interruptCheck();

inline char* allocateResource(size_t size) {
  return currentProcess->resource_area.allocate_bytes(size);
}

// stack-switching functions; execute the continuation function on the VM stack
void switchToVMStack(doFn continuation);        
oop  switchToVMStack(fntype continuation, void* arg1);  

nmethod* switchToVMStack(nmethod *cont(compilingLookup *),
                         compilingLookup *L);   

typedef nmethod* (*constructDoItMethodContinuation)(oop receiver, oop method);
nmethod* switchToVMStack(oop receiver,
                         oop method,
                         constructDoItMethodContinuation continuation);


typedef void (*intLookupContinuation)( simpleLookup* L, int32 arg_count );

void switchToVMStack_intSend( simpleLookup* L, 
                              int32 arg_count,
                              intLookupContinuation continuation);
