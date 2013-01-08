/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// A stack is a part of a process.  It contains the memory area used for
// the stack frames and provides iteration methods etc.

const int32 PrimStackSize   = 32*K; // max. stack size used by primitives
const int32 StackMarkOffset =  2*K; // to detect stack overflows in the VM

class Stack: public StackObj {
 public:
  Process* process;
  char* base;
  int32 size;
  
  Stack() {}            // stacks are created implicitly as part of processes
  void init(Process* p, char* b, int32 s) { process = p; base = b; size = s; }
  bool allocate();
  void deallocate();
  
  char* end()                           { return base + size; }
  bool  contains(void* sp)              { return base <= (char*)sp
                                             && (char*)sp < end(); }
  char* spLimit()                         { return base + PrimStackSize; }
  bool  isStackOverflow(void* spVal)
    { return base <= (char*)spVal && (char*)spVal < spLimit(); }
  
 protected:
  int32* mark_addr()    { return (int32*)(base + StackMarkOffset); }
 public:
  void mark();          // mark end of stack to detect overflows
  bool markDestroyed(); // answer true if stack mark was overwritten

  // frame operations
  frame* last_self_frame(bool includePrologue, RegisterLocator** = 0);
                                // return last (most recent) Self frame, & optionally a RegisterLocator
  frame* callee_of(const frame* f);
  frame* first_VM_frame();      // frame called by last_self_frame()
  void   consistencyCheck(primDoFn f, frame* firstVmFrame = 0);
  
  frame* interpreter_frame_for_continuing_NLR_from_primitive();
  frame* interpreter_frame_for_continuing_from_return_trap();
  
 protected:
   frame* find_frame_entering(char* ep);
   
 public:
  // memory operations
  void chainFrames();
  void unchainFrames();
  void scavenge_contents();
  void gc_mark_contents();
  void gc_unmark_contents();
  void enumerate_references(enumeration *e);
  void enumerate_families(enumeration *e);
  bool verify();
  void switch_pointers(oop from, oop to);
  void remove_patches();
 protected:
  void enumerate_block_references();
  
    
 public:
  void frames_do(framesDoFn f, primDoFn pfn = 0);
        // apply f to all Self frames; pfn is for consistency check
  void vframes_do(vframesDoFn fn, frame* f = 0);
        // apply fn to all Self vframes, or start at f if non-null
  
  // programming operations
  void convert();
  
 public:
  // printing operations
  void print();
  int32 depth();
  int32 vdepth(frame* f = 0);
};

extern "C" {
  void print_stack();
  void CallFramesDo(Stack*, framesDoFn, primDoFn);
}
