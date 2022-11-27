/* Sun-$Revision: 30.17 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if TARGET_OS_VERSION == MACOSX_VERSION \
  || TARGET_OS_VERSION ==  LINUX_VERSION \
  || TARGET_OS_VERSION == NETBSD_VERSION
  # define TARGET_OS_VERSION_FOR_NPROF_TIMER  SOLARIS_VERSION  
# else
  # define TARGET_OS_VERSION_FOR_NPROF_TIMER  TARGET_OS_VERSION
# endif  


extern bool profilerSemaphore, profilerCollectStackSemaphore;




# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)
  
# define PROFILER
# endif


# ifdef PROFILER

class NewNodeList;
class NodeCache;

class TickCounter {
 public:
  uint32 num;
  TickCounter() { num = 0; }
  void inc() { num++; }
};

class StatNum {
 public:
  fint  num, min, max, sum;
  const char* title;

  StatNum(const char* t) {
    title = t;
    num = min = max = sum = 0;
  }

  void add(fint value) {
    if (num == 0 || value < min) min = value;
    if (value > max) max = value;
    sum += value;
    num++;
  }

  void print() {
    float avg = sum;
    if (sum != 0) avg /= num;
    lprintf("%s #%d: (min=%d,avg=%3.1f,max=%d)\n", title, num, min, avg, max);
  }
};

class Pc {
 public:
  char*    value;
  char*    fr;
  # if GENERATE_DEBUGGING_AIDS
    int      where;
  # endif
  
  nmethod* my_nmethod();
  PcDesc*  pcDesc(nmethod *nm = NULL);
  bool     in_self();
  bool     in_pics();
  stringOop current_selector();
  bool     in_block_clone();
  bool     is_calling_prim();
  void     set_value(char* v, int w = 0) {
             value = v;  
             # if GENERATE_DEBUGGING_AIDS
               if (SpendTimeForDebugging)
                 where = w;
             # endif
           }
};

// WARNING: offsets into StackInfo are duplicated in continueProfilerTrap in runtime_asm_gcc_sparc.s

class StackInfo {
 public:
  char* frame_pointer;

# if  TARGET_OS_VERSION_FOR_NPROF_TIMER == SOLARIS_VERSION
  ProcessTime u_time;
  float user_time() { return u_time.milli_secs_as_float();  }
# elif  TARGET_OS_VERSION_FOR_NPROF_TIMER == SUNOS_VERSION
  ElapsedTimer e_timer;
  // Variable computed at Profiler::suspend().
  float computed_user_time;
  float user_time() { return computed_user_time; }
# elif  TARGET_OS_FAMILY == MACOS_FAMILY
  float user_time() { return 0.0; } // unimp mac
# else
  # error which?
# endif

  fint  block_cloned;
  fint  bytes_allocated;

  int32 begin;  // index of first used entry
  int32 end;    // one more than index of last used entry, only valid after collect_stack

  // Collected in ContinueAfterProfilerInterrupt
  Pc    interrupted_pc;
  Pc    interrupted_return_addr_reg;    // o7 on sparc
  Pc    interrupted_stored_return_addr; // i7 on sparc
  char* interrupted_fp;
};


// Keeps track of how may blocks and bytes are allocated during profiling.
class AllocationMonitor {
 private:
  fint _blocks;
  fint _bytes;

  fint _last_blocks;
  fint _last_bytes;

 public:
  void clear() { _blocks = _bytes = 0; set(); }
  void update(); // Update the numbers based on the current heap.
  void set();    // Set last according to the current heap.

  fint blocks() { return _blocks; }
  fint bytes()  { return _bytes; }
};

class edge_element : public CHeapObj {
 public:
  edge_element(call_graph_edge* e) {
     edge = e;
     next = NULL;
  }
  call_graph_edge* edge;
  edge_element*    next;
};

class pc_state {
 public:
  Pc  pc;
  int path_index;
  int bci;
  // fint start_of_match;
  // fint start_of_fold;
};


typedef BoundedListTemplate<call_graph_edge*> tree_edge_BList;

static const fint tree_edge_BList_initial_size = 20;

class Profiler : public CHeapObj {
 public:
   Process*    _process;     // The process we are profiling
   profilerOop _profilerOop;

   Profiler*   _next;

   call_graph_edge* root_edge;
   call_graph_node* root;

   enum { inactive, profiling, suspended } status;
   // inactive  =  not attached to a process.
   // profiling =  attached to a process and will callect stack at tick.
   // suspended =  attached to a process different than currentProcess.

   NodeCache* cache;

   EventBuffer *event_buffer;

   TickCounter sem_ticks;
   TickCounter lookup_ticks;
   TickCounter prim_ticks;
   TickCounter self_ticks;

   TickCounter profiler_ticks;   // Ticks occured while running profiler code.
   TickCounter conversion_ticks;

# if  TARGET_OS_VERSION_FOR_NPROF_TIMER == SOLARIS_VERSION
   ProcessTime  prof_time;
   ProcessTime  collect_time;
# elif  TARGET_OS_VERSION_FOR_NPROF_TIMER == SUNOS_VERSION
   ElapsedTimer prof_timer; // time spend in doing the profiling.
   ElapsedTimer collect_timer;
   timer  u_timer;
   float user_time;
# endif

   AllocationMonitor allocationMonitor;

   fint stack_index;
   fint first_stack_in_interval;

   // Call-back from interruptCheck.
   void handleOverflow();

   bool conversion_needed();
   fint start_of_match;
   fint start_of_fold;

   fint number_of_conversions;

   // An upper bound for the number of self activations in the engaged process.
   fint max_self_frames_on_stack;

   static const fint max_frames;
   static const fint max_vframes;

   pc_state *last_stack;
   int last_stack_end;
   call_graph_edge **last_path;
   int last_path_end;

   void addToCache(nmethod *nm, float optimized_user_time, fint bci);

   // Used during merge_stack_info to contain the path from
   // the root of the call graph to the current node.
   tree_edge_BList* path;

   tree_edge_BList* back_edges_visited;

   void update_callee(fint bci, call_graph_node* n,
                      float optimized_user_time);
   void update_callee(fint bci, stringOop sel);

   void update_nodes_visited(call_graph_node *node);
   void update_back_edges_visited(call_graph_edge *edge);

   static const fint max_pc;
   static const fint max_stacks;

   StackInfo *stack;
   Pc        *pc;

   StackInfo& current_stack() { 
     assert(stack_index < max_stacks, "too many stacks");
     return stack[stack_index]; 
   }

   StatNum stack_size;
   StatNum collect_ticks;

   Profiler(profilerOop prof);
   ~Profiler();

   fint merge_pc(Pc curr_pc, Pc prev_pc, fint prev_bci,
                 float optimized_user_time);
   void merge_stack_info(StackInfo* st);

   static const fint max_activations_in_context;
   void fix_stack_bottom(StackInfo* st);

   // The timing is controlled by the the protocol:
   void engage(Process* prof);
   void suspend();
   void resume();
   void disengage();

   void convert_nmethod_information();

   void compute_time();

   void update_last_path(float user_time);

   // Creates a copy of the call graph in self.
   // Returns failedAllocationOop if the operation runs out of memory.
   oop copy_call_graph(oop method_pt, oop block_pt, oop access_pt,
                       oop prim_pt,   oop leaf_pt,  oop fold_pt, 
                       oop unknown_oop, smi cutoff);

   // Creates a copy of tick_pt and fills the data slots with tick information.
   oop copy_tick_info(oop tick_pt);

   // Creates a copy of time_pt and fills the data slots with timing information.
   oop copy_time_info(oop time_pt);

   // collect all self pc's on the stack.
   void tick();

   StackInfo* collect_stack(bool in_interrupt = false);
   void collect_return_addresses_above_interrupted_context(StackInfo*, frame*);

   void start_tick_timer();
   void stop_tick_timer();

   // user time (ms) spend in excluded code
   float monitor_tick_time; 
   float compile_time;
   float recompile_time;
   float scavenging_time;
   float garbage_collection_time;
   float nmethod_flush_time;
   float nmethod_compact_time;
   float uncommon_branch_time;

   void printProfile(float cutoff);
   void printPath();

   NewNodeList* new_list;
   bool use_new_list;

   // memory functions
   void scavenge_contents();
   void gc_mark_contents();
   void gc_unmark_contents();
   void switch_pointers(oop from, oop to);
   bool verify();
   
  private:
   // allocation of call graph nodes
   call_graph_node* new_node(ScopeDesc* sd);
   call_graph_node* new_leaf_node();
   call_graph_node* new_prim_node(stringOop sel);
   call_graph_node* new_clone(call_graph_node* n);
   void update_new_list(call_graph_node*n);
   
   # if GENERATE_DEBUGGING_AIDS
     int   prior_node_count;
     float prior_total_time; 
   # endif
};


# else // dummy profiler

class Profiler : public CHeapObj {
 public:
   Profiler(profilerOop ) {}

   inline void engage(Process* ) {}
   inline void suspend() {}
   inline void resume() {}
   inline void disengage() {}   
   inline oop copy_tick_info(oop ) { return NULL; }
   inline void printProfile(float ) {}
   inline oop copy_call_graph(oop , oop , oop ,
                       oop ,   oop ,  oop , 
                       oop ,   smi) { return NULL; }
   // memory functions
   inline void scavenge_contents() {}
   inline void gc_mark_contents() {}
   inline void gc_unmark_contents() {}
   inline void switch_pointers(oop , oop ) {}
   inline void verify() {}

   inline void convert_nmethod_information() {}

};


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

class Profilers: public CHeapObj {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
 private:
  Profiler* _first;
  Profiler* _profiler_with_overflow;

 public:

  void convert_nmethod_information();

  void insert(Profiler* p);
  void remove(Profiler* p);


  // Returns the profiler attached to currentProcess if any.
  Profiler* find_current();
  Profiler* current_for_debugging() { return _first; }

  // Tells if the list of active profilers is empty.
  inline bool isEmpty() { return NULL ==_first; }

  // Protocol for handling overfilled buffers
  void raiseOverflow(Profiler* p);
  bool hasOverflow() { return _profiler_with_overflow != NULL; }
  void handleOverflow();
  
# else // defined(FAST_COMPILER) || defined(SIC_COMPILER)

 public:
  void raiseOverflow(Profiler* p) { Unused(p); }
  bool hasOverflow() { return false; }
  void handleOverflow() {}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

 public:
  Profilers();

  // Print all active profilers
  void print();
  
  // memory functions
  void scavenge_contents();
  void gc_mark_contents();
  void gc_unmark_contents();
  void switch_pointers(oop from, oop to);
  bool verify();
};



// Contains all currently active profilers.
extern Profilers* profilers;

enum block_type { 
  include_type,
  include_nmethod_flush,

  exclude_monitor, 
  exclude_compile, 
  exclude_recompile, 
  exclude_scavenging, 
  exclude_garbage_collection,
  exclude_nmethod_flush,
  exclude_nmethod_compact,
  exclude_uncommon_branch
};


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

// BlockProfilerTicks is used to disable profiler ticks

class BlockProfilerTicks : StackObj {
 private:
  Profiler*  prof;
  block_type bt;
  timer      u_timer;

  bool should_flush_nmethod_information();
 public:
  BlockProfilerTicks(block_type bt);
  ~BlockProfilerTicks();
};

# else

class Profiler: public CHeapObj {
 public:
 void suspend() {};
 void resume()  {};

 // memory functions  
 void scavenge_contents() {}
 void gc_mark_contents() {}
 void gc_unmark_contents() {}
 void switch_pointers(oop from, oop to) { Unused(from); Unused(to); }
 void verify();
};

class BlockProfilerTicks: public StackObj {
 public:
  BlockProfilerTicks(block_type bt) { Unused(bt); }
  ~BlockProfilerTicks() {}
};

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
