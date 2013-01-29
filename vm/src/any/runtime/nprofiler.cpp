/* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "nprofiler.hh"
# include "_nprofiler.cpp.incl"


bool profilerSemaphore = false;
bool profilerCollectStackSemaphore = false;
static fint block_level = 0;


# ifdef PROFILER


// Issues still to be addressed:
// - filtering in the VM
//    lexical filtering is difficult since a lexical parent can not
//    be found without the actual activation. This problem could be solved
//    by collecting the receiver in all block actications.
// - histogram for stack size instead of (min, average, max)

const fint Profiler::max_frames  = 150000;
const fint Profiler::max_vframes = 500000;

const fint Profiler::max_pc     = 4000000;
const fint Profiler::max_stacks = 80000;

const fint Profiler::max_activations_in_context = 4;

# if  TARGET_OS_VERSION_FOR_NPROF_TIMER == SOLARIS_VERSION
class ProfilerTime {
 public:
  Profiler* prof;
  ProcessTime t;
  ProfilerTime(Profiler* p)  {
    prof = p;
    ProcessInfo::update();
    t = ProcessInfo::user_time();
  }
  ~ProfilerTime() {
    ProcessInfo::update();
    prof->prof_time = prof->prof_time + ProcessInfo::user_time() - t;
  }
};

class CollectTime {
 public:
  Profiler* prof;
  ProcessTime t;
  CollectTime(Profiler* p) {
    prof = p;
    ProcessInfo::update();
    t = ProcessInfo::user_time();
  }
  ~CollectTime() {
    ProcessInfo::update();
    prof->collect_time = prof->collect_time + ProcessInfo::user_time() - t;
  }
};
# elif  TARGET_OS_VERSION_FOR_NPROF_TIMER ==  SUNOS_VERSION
class ProfilerTime {
 public:
  Profiler* prof;
  ProfilerTime(Profiler* p) { prof = p; prof->prof_timer.start(); }
  ~ProfilerTime() { prof->prof_timer.stop();  }
};
class CollectTime {
 public:
  Profiler* prof;
  CollectTime(Profiler* p) { prof = p; prof->collect_timer.start(); }
  ~CollectTime() { prof->collect_timer.stop(); }
};
# else
class ProfilerTime { 
 public:
  ProfilerTime(Profiler*) {}
};
class CollectTime { 
 public:
  CollectTime(Profiler*) {}
};
# endif

class RusageEvent {
 public:
  ProcessTime user_time;    //  user time used
  ProcessTime elapsed_time; //  elapsed time used

  char* ident;
};

// ---- EventBuffer

class EventBuffer : public CHeapObj {
 private:
  FILE *file;
  ProcessTime start_elapsed_time;
 public:
  EventBuffer()  {
    file = fopen("nprof.events", "w");
    start_elapsed_time = ProcessTime::get_real_time();
  };
  ~EventBuffer() { if (file) fclose(file); }
# ifdef UNUSED
  void event(char* ident);
# endif
  void time(const char* ident, ProcessTime t);
};

#ifdef UNUSED
void EventBuffer::event(char* ident) {
  ProcessInfo::update();
  fprintf(file, "%-20s %6.3f %6.3f\n",
          ident,
          ProcessInfo::user_time().milli_secs_as_float(),
          (ProcessTime::get_real_time() - start_elapsed_time).milli_secs_as_float());
}
#endif

void EventBuffer::time(const char* ident, ProcessTime t) {
  ProcessInfo::update();
  fprintf(file, "%-20s %6.3f %6.3f %6.3f\n",
          ident,
          ProcessInfo::user_time().milli_secs_as_float(),
          (ProcessTime::get_real_time() - start_elapsed_time).milli_secs_as_float(),
          t.milli_secs_as_float());
}

# ifdef USE_LOG
  # define CREATE_LOG event_buffer = PrintProfiling ? new EventBuffer() : NULL;
  # define DELETE_LOG   if (event_buffer) delete event_buffer;
  # define LOG_REC(C)   if (event_buffer) event_buffer->event(C);
  # define LOG_TIME(C,T) if (event_buffer) event_buffer->time(C,T);
# else
  # define CREATE_LOG   event_buffer = NULL;
  # define DELETE_LOG
  # define LOG_REC(C)
  # define LOG_TIME(C,T)
# endif

// ---- NewNodeList


NewNodeList::NewNodeList(fint initial_size) {
  size = initial_size;
  end  = 0;
  list = NEW_C_HEAP_ARRAY(call_graph_node*, size);
}

NewNodeList::~NewNodeList() {
  if (list) { delete list; list= NULL; }
}

void NewNodeList::nodes_do(call_graph_nodeDoFn f) {
  for (int i = 0; i < end; )
    if (list[i]->is_new())  f(list[i++]);         // do this one and advance
    else                    removeAt(i);          // remove this one, and recheck this slot
}

int NewNodeList::num() {
  return end;
}

bool NewNodeList::verify() {
  bool r = true;
  for (int i = 0;  i < end;  ++i)
    r &= list[i]->verify();

  return r;
}

void NewNodeList::insert(call_graph_node* n) {
  assert( n->my_new_list == NULL, "node is already on list");
    
  if (!n->is_new())
    return; // only keep nodes with new oops
    
  // add n to new_list
  if (end >= size) {
    // sigh, allocate a new and larger array
    call_graph_node** new_list;
    new_list = NEW_C_HEAP_ARRAY(call_graph_node*, size*2);
    for (int i = 0; i < end; i++) new_list[i] = list[i];
    size = size*2;
    delete list;
    list = new_list;
    if (PrintProfiling) lprintf("new_list extend %d\n", size);
  }
  appendNode(n);
}


bool NewNodeList::member(call_graph_node* n) {
  for (int i = 0; i < end; i++) {
    if (n == list[i])  return true;
  }  
  return false;
}


void NewNodeList::remove(call_graph_node* n) {
  for (int i = 0; i < end;  i++)
    if (n == list[i])  {
      removeAt(i);
      return;
    }
  fatal("node was not on list");  
}

void NewNodeList::appendNode(call_graph_node* n) {
  assert(end < size, "checking");
  list[end++] = n;
  n->my_new_list = this;
}  

void NewNodeList::removeAt(int i) {
  assert(end > 0, "checking");
  list[i]->my_new_list = NULL;
  list[i] = list[--end];
}  

// ---- NodeCache

class NodeCacheEntry {
 public:
  nmethod*         nm;
  fint             offset;
  call_graph_node* nodes;
  void clear() { nm = NULL; offset = 0; nodes = NULL; }
# if  GENERATE_DEBUGGING_AIDS
  bool verify(nmethod *m);
# endif
};

# if  GENERATE_DEBUGGING_AIDS
bool NodeCacheEntry::verify(nmethod* m) {
  if (nm == NULL) return false;
  if (nm != m) return false;
  if (nodes->is_method_node()) {
    method_node* nn = (method_node*) nodes;
    return nm->scopes->root()->key.selector == nn->selector();
  }
  return true;
}
#endif

class NodeCache : public CHeapObj {
  // Cache for the function:
  //   (nmethod, offset) -> list of call graph nodes
 private:
  Profiler* prof;
  static const fint size_of_table;
  NodeCacheEntry *table;
  fint hash(nmethod* nm, fint offset) { return offset + (fint) nm; }
  NodeCacheEntry* entryFor(fint hashValue) {
    return &table[hashValue % size_of_table];
  }
 public:
  NodeCache(Profiler* p);
  ~NodeCache() { delete [] table; }

  // Insert a new entry in the cache
  void insert(nmethod* nm, fint offset, call_graph_node* nodes);
  
  // Find the nmethod in the cache. Returns NULL if no entry found.
  call_graph_node* find(nmethod* nm, fint offset);

  // remove all entries and delete call graph nodes
  void flush();

  // memory functions
  void scavenge_contents();
  void gc_mark_contents();
  void gc_unmark_contents();
  void switch_pointers(oop from, oop to);
  bool verify();
};

const fint NodeCache::size_of_table = 3001;

NodeCache::NodeCache(Profiler* p) {
  prof = p;
  table= new NodeCacheEntry[size_of_table];
  for (int i = 0; i < size_of_table; i++) {
    table[i].clear();
  }
}

void NodeCache::insert(nmethod* nm, fint offset, call_graph_node* nodes) {
  NodeCacheEntry* entry = entryFor(hash(nm,offset));
  if (entry->nm && entry->nodes) delete entry->nodes;
  entry->nm     = nm;
  entry->offset = offset;
  entry->nodes  = nodes;
  assert( find(nm, offset), "Cache conflict");
}
  
call_graph_node* NodeCache::find(nmethod* nm, fint offset) {
  NodeCacheEntry* entry = entryFor(hash(nm,offset));
  return (entry->nm == nm && entry->offset == offset) ? entry->nodes : NULL;
}

void NodeCache::flush () {
  for (int i = 0; i < size_of_table; i++) {
    if (table[i].nm && table[i].nodes) delete table[i].nodes;
    table[i].clear();
  }
}

# define FOR_EACH_NODE(E) \
  call_graph_node* E; \
  for (int i = 0; i < size_of_table; i++) \
    if(table[i].nm && (E= table[i].nodes,  E))

void NodeCache::scavenge_contents() {
  FOR_EACH_NODE(n) n->scavenge_contents(); }
void NodeCache::gc_mark_contents() {
  FOR_EACH_NODE(n) n->gc_mark_contents(); }
void NodeCache::gc_unmark_contents() {
  FOR_EACH_NODE(n) n->gc_unmark_contents(); }
void NodeCache::switch_pointers(oop from, oop to) {
  FOR_EACH_NODE(n) n->switch_pointers(from,to); }
bool NodeCache::verify() {
  bool r = true;
  FOR_EACH_NODE(n) r &= n->verify(); 
  return r;
}

static fint num_of_profilers = 0;

nmethod* Pc::my_nmethod() {
  // Taken from frame.c, nmethod* frame::code() [dates from antiquity]
  // But, I don't understand the subtraction. 12/03, dmu
  nmethod* r = nmethod::nmethodContaining(value - sizeof(class nmethod), NULL);
  # if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
           if (r->contains(value))  ;
      else if (nmethod::nmethodContaining(value, NULL)->contains(value))
              fatal("should not have subtracted");
      else    fatal3("value 0x%x is not in any nmethod, either 0x%x, or 0x%x",
                     value, r, nmethod::nmethodContaining(value, NULL));
    }
  # endif
  return r;
}

PcDesc* Pc::pcDesc(nmethod *nm) {
  nmethod *nm2= nm ? nm : my_nmethod();
  PcDesc *p= nm2->contains(value) ? nm2->containingPcDescOrNULL(value) : NULL;
  return p ? p : nm2->pcs();
}

bool Pc::in_self() {
  return Memory->code->iZone->contains(value);
}

bool Pc::in_pics() {
  return Memory->code->stubs->contains(value);
}

stringOop Pc::current_selector() {
  // get selector from sendDesc instead of literal vector.
  nmethod*   nm  = my_nmethod();
  PcDesc*    pd  = pcDesc(nm);

  while(pd >=  nm->pcs() && pd->byteCode == IllegalBCI) pd--;

  ScopeDesc* sd  = pd->containingDesc(nm);
  methodMap* mm  = (methodMap*) sd->method()->map();

  fint code = mm->start_codes()[pd->byteCode];
  fint op   = getOp(code);
  if (op == SEND_CODE || op == IMPLICIT_SEND_CODE)
    return mm->get_selector_at(pd->byteCode);
  else
    return NULL;
}

bool Pc::in_block_clone() {
  nmethod*   nm  = my_nmethod();
  PcDesc*    pd  = pcDesc(nm);

  if (nm->isAccess()) return false;

  while(pd >=  nm->pcs() && pd->byteCode == IllegalBCI) pd--;

  ScopeDesc* sd  = pd->containingDesc(nm);
  methodMap* mm  = (methodMap*) sd->method()->map();

  // pd->byteCode could be either a primitive send or a
  // push of a block literal (doing block_clone)
  assert( pd->byteCode >= 0, "bci should be valid");

  fint code = mm->start_codes()[pd->byteCode];
  return getOp(code) == LITERAL_CODE;
}

bool Pc::is_calling_prim() {
  stringOop selector = current_selector();
  return    selector ? selector->is_prim_name() : false;
}

void Profiler::update_callee(fint bci, call_graph_node* n,
                             float optimized_user_time) {
  call_graph_node* top = path->top()->callee;
  // Let's check if folding is possible
  if (ProfilerUseFold) {
    if (start_of_match) {
      // stack [...start_of_match, ... start_of_fold .... path->length()-1 ]
      fint fold_size  =  start_of_fold  - start_of_match;
      fint match_size =  path->length() - start_of_fold;
      
      if (fold_size == match_size + 1) {
        // n matches the [start_of_fold - 1] 
        // create the cycle, disable the edge top start_of_fold and 
        // adjust path
        call_graph_edge* last_to_match = path->nth(start_of_fold - 1);
        if (last_to_match->callee->is_matching(n)) {
          // fold the stack
          call_graph_node* back_node = path->nth(start_of_match)->callee;
          
          call_graph_edge* fold_e = path->nth(start_of_fold);
          
          call_graph_node* insert_node =
            path->nth(start_of_fold-1)->callee;
          
          fold_edge* e = insert_node->find_fold_edge(fold_e->bci, back_node);
          if (e != NULL) {
            e->inc();
          } else {
            // Create new fold edge 
            e = new fold_edge(fold_e->bci, back_node);
            insert_node->add_edge(e);
          }
          update_back_edges_visited(e);
          
          // chop of the until start_of_fold
          for (fint i = 0; i < match_size; i++) path->pop();
          
          start_of_match = start_of_fold = 0;
          return;
        } else {
          // no match reset the match (or do back tracking)
          start_of_match = start_of_fold = 0;
        }
      }
    }
  }

  call_graph_edge* e;
  if (! (e = top->find_matching(bci, n))) {
    top->add_edge(e = new call_graph_edge(bci, new_clone(n)));
    // Adding a block node require adjustment of outer_node
  }
  assert(e->callee,"callee must exist");

  e->callee->add_optimized(optimized_user_time);
  path->push(e);

  if (ProfilerUseFold) {
    if (start_of_match) {
      // match the next in fold
      fint match_size =  path->length() - 1 - start_of_fold;
      // check start_of_fold + match_size against n
      call_graph_edge* edge =  path->nth(start_of_match + match_size);
      if (!edge->callee->is_matching(n)) {
        start_of_match = start_of_fold = 0;
      }
    } else {
      // match path()->top with something down the stack.
      for (fint i = path->length()-2; i >= 0; i--) {
        call_graph_edge* edge =  path->nth(i);
        if (edge->callee->is_matching(n)) {
          start_of_match = i;
          start_of_fold  = path->length()-1;
          return;
        }
      }
    }
  }
}

void Profiler::update_callee(fint bci, stringOop sel) {
  // if (bci, sel) is present update trace and return.
  call_graph_node* top = path->top()->callee;
  call_graph_edge* e = top->find_matching(bci, sel);
  if (!e) {
    // create (bci, sel) and update trace.    
    e = new call_graph_edge(bci, new_prim_node(sel));
    top->add_edge(e);
  }
  assert(e->callee,"callee must exist");
  path->push(e);
}

static void profilerTick() { 
  // Should be called at each tick if at least one profile is active.
  if (currentProcess->profiler) currentProcess->profiler->tick();
}

Profiler::Profiler(profilerOop prof) :
  stack_size("\tStack size (frames)"), collect_ticks("\tSlice (num)") {
  status = inactive;

  _profilerOop = prof;

  _process     = NULL;

  new_list  = new NewNodeList(10000);
  use_new_list = true;
  cache     = new NodeCache(this);
  root      = new_leaf_node();
  root_edge = new call_graph_edge(0, root);

  last_stack= new pc_state[max_frames];
  last_stack_end = 0;
  last_path = new call_graph_edge *[max_vframes];
  last_path_end = 0;
  stack     = new StackInfo[max_stacks];
  pc        = new Pc[max_pc];

  monitor_tick_time       = 0.0; 
  compile_time            = 0.0;
  recompile_time          = 0.0;
  scavenging_time         = 0.0;
  garbage_collection_time = 0.0;
  nmethod_flush_time      = 0.0;
  nmethod_compact_time    = 0.0;
  uncommon_branch_time    = 0.0;

  stack_index    = 0;
  first_stack_in_interval = 0;

# if TARGET_OS_VERSION_FOR_NPROF_TIMER ==  SUNOS_VERSION
  user_time      = 0.0;
# endif

  number_of_conversions = 0;

  # if  TARGET_OS_VERSION_FOR_NPROF_TIMER == SOLARIS_VERSION
       prof_time.clear();
    collect_time.clear();
  # elif  TARGET_OS_VERSION_FOR_NPROF_TIMER ==  SUNOS_VERSION
       prof_timer.reset();
    collect_timer.reset();
  # endif

  # if GENERATE_DEBUGGING_AIDS
    if (SpendTimeForDebugging) {
      prior_node_count = 0;
      prior_total_time = 0.0;
    }
  # endif
  
  allocationMonitor.clear();
  start_of_match = 0;
  start_of_fold  = 0;
  max_self_frames_on_stack = 0;
  path = NULL;
  back_edges_visited = NULL;
  
  if (num_of_profilers == 0) {
    IntervalTimer* it = IntervalTimer::CPU_timer();
    it->enroll_async(it->ticks_per_second() * it->oversample_rate /* for profiler debugging */, 
                     profilerTick);
  }
  num_of_profilers++;

  profilers->insert(this);

  CREATE_LOG;
}

static Profiler* _prof;
static void cont_delete() { 
  delete _prof->root;
  delete _prof->new_list;
  delete _prof->cache;
}

Profiler::~Profiler() {
  num_of_profilers--;
  if (num_of_profilers == 0) {
    IntervalTimer::CPU_timer()->withdraw(profilerTick);
  }  
  // Perform the deletion on the VM stack to avoid stack overflow
  _prof = this;
  switchToVMStack(cont_delete);

  profilers->remove(this);
  delete [] last_stack;
  delete [] last_path;
  delete [] stack;
  delete [] pc;
  DELETE_LOG;
}

void Profiler::handleOverflow() {
  static bool have_warned = false;
  if (!have_warned) {
    warning("Entering handleOverflow() in nprofiler.cpp. As of 2/04, I do not understand how Lars meant this to work. -- dmu");
    have_warned= true;
  }
  StackInfo saved_stack;
  stop_tick_timer();
  status= suspended;
  saved_stack = current_stack();
  convert_nmethod_information();

  stack[++stack_index] = saved_stack;
  if (stack_index >= max_stacks) 
    fatal("must increase max_stacks");

  collect_stack();
  compute_time();
  resume();
}


void Profiler::start_tick_timer() {
# if  TARGET_OS_VERSION_FOR_NPROF_TIMER == SOLARIS_VERSION
  ProcessInfo::update();
  current_stack().u_time = ProcessInfo::user_time();
# elif  TARGET_OS_VERSION_FOR_NPROF_TIMER ==  SUNOS_VERSION
  current_stack().e_timer.reset();
  current_stack().e_timer.start();
  u_timer.start();
# endif
}

void Profiler::stop_tick_timer() {
# if  TARGET_OS_VERSION_FOR_NPROF_TIMER == SOLARIS_VERSION
  ProcessInfo::update();
  current_stack().u_time = ProcessInfo::user_time() - current_stack().u_time;
# elif  TARGET_OS_VERSION_FOR_NPROF_TIMER ==   SUNOS_VERSION
  current_stack().e_timer.stop();
  user_time += u_timer.millisecs(); 
# endif
}

// Start the timing.
void Profiler::engage(Process* proc) {
  CSect cs(profilerSemaphore);

  // Make the process aware of this profiler.
  proc->profiler = this;

  _process = proc;

# if TARGET_ARCH == SPARC_ARCH
  fint min_self_frame_size = WindowSize * oopSize;
# else
  fint min_self_frame_size = 1;
# endif

  max_self_frames_on_stack = proc->stack()->size / min_self_frame_size;

  if (currentProcess == proc) {
    resume();
  } else {
    status = inactive;
  }
}

// Stop the timing and convert the vframe dependent information.
void Profiler::disengage() {
  CSect cs(profilerSemaphore);

  if (status == profiling) {
    assert(currentProcess == _process, "_process is wrong");

    LOG_REC("disengage");
    stop_tick_timer();
    collect_stack();
    compute_time();
  }

  convert_nmethod_information();
  cache->flush();
  status = inactive;
}

void Profiler::suspend() {
  CSect cs(profilerSemaphore);

  assert(status == profiling, "Profiler in wrong state");

  LOG_REC("suspend");
  stop_tick_timer();
  collect_stack();
  compute_time();

  status = suspended;
}


void Profiler::resume() {
  CSect cs(profilerSemaphore);

  assert(status != profiling, "Profiler in wrong state");
  allocationMonitor.clear();
  start_tick_timer();
  status = profiling;
  LOG_REC("resume");
}

# define FOR_EACH_STACK(ST) \
    for (StackInfo* ST = &stack[0]; ST < &current_stack(); ST++)

# define FOR_EACH_STACK_IN_INTERVAL(ST) \
    for (StackInfo* ST = &stack[first_stack_in_interval]; \
         ST < &current_stack(); ST++)

// Compute user time for all stack samples.
void Profiler::compute_time() {
# if TARGET_OS_VERSION_FOR_NPROF_TIMER ==  SUNOS_VERSION
  float slice_time = 0.0;

  FOR_EACH_STACK_IN_INTERVAL(st) slice_time += st->e_timer.millisecs();

  float factor;
  if (user_time > 0 && slice_time > 0) {
    factor = user_time / slice_time;
  } else {  
    factor = 1.0;
  }

  if (PrintProfiling) {
    lprintf("Computed time: user = %2.0f, elapsed = %2.3f -> factor = %2.3f\n", 
           user_time, slice_time, factor);
  }

  FOR_EACH_STACK_IN_INTERVAL(s)
    s->computed_user_time = s->e_timer.millisecs() * factor;

  user_time = 0.0;
# endif

  collect_ticks.add(stack_index - first_stack_in_interval);
  first_stack_in_interval = stack_index;
}

typedef BoundedListTemplate<ScopeDesc*> ScopeDescBList;
static const fint ScopeDescBList_initial_size = 20;


void Profiler::addToCache(nmethod *nm, float optimized_user_time, fint bci) {
  call_graph_node* cache_result= cache->find(nm, 0);
  if (cache_result == NULL) {
    cache_result= new_node(nm->scopes->root());
    cache->insert(nm, 0, cache_result);
  }
  update_callee(bci, cache_result, optimized_user_time);
}


fint Profiler::merge_pc(Pc curr_pc, Pc prev_pc, fint prev_bci,
                        float user_time_arg) {
  ScopeDesc* sd = NULL;

  fint last_top_bci = 0;

  if (curr_pc.in_self()) {
    nmethod* nm  = curr_pc.my_nmethod();
    float optimized_user_time =  (nm->compiler() != NIC) ? user_time_arg : 0.0;
    assert( nm, "nmethod must be found from pc.");

    fint top_bci = prev_bci;

    if (nm->isAccess()) {
      addToCache(nm, optimized_user_time, top_bci);
    } 
    else {
      PcDesc* pd = curr_pc.pcDesc(nm);
      while(pd > nm->pcs() && pd->byteCode == IllegalBCI) pd--;
      last_top_bci = pd->byteCode;
      if (   pd->byteCode == PrologueBCI 
          || pd->byteCode == EpilogueBCI
          || pd->byteCode == IllegalBCI) {
        addToCache(nm, optimized_user_time, top_bci);
      } 
      else {
        call_graph_node* cache_result= cache->find(nm, pd->scope);
        if (!cache_result) {
          // Build the cache entry
          sd = pd->containingDesc(nm);
          cache_result = new_node(sd);

          fint bci = sd->isTop() ? 0 : sd->senderByteCodeIndex();
          for (sd = sd->sender(); sd; sd = sd->sender()) {
            call_graph_node* n = new_node(sd);
            n->edges = new call_graph_edge(bci);
            n->edges->callee = cache_result;
            cache_result = n;
            bci = sd->isTop() ? 0 : sd->senderByteCodeIndex();
          }
          cache->insert(nm, pd->scope, cache_result);
        }

        fint bci = top_bci;

        for (call_graph_node* n = cache_result; n; 
             n = n->edges ? n->edges->callee : NULL) {
          update_callee(bci, n, optimized_user_time);
          if (n->edges) bci = n->edges->bci;
        }
      }
    }
  }
  else if (prev_pc.value != NULL  &&  prev_bci >= 0  &&  prev_pc.in_self()) {
    // A c-frame has been encountered. Use the previous self frame 
    // to find the name of the called primitive.
    if (prev_pc.in_block_clone()) {
      stringOop sel = Memory->string_table->lookup("_BlockClone", 11);
      update_callee(prev_bci, sel);
    }
    else {
      stringOop selector = prev_pc.current_selector();
      if (selector && selector->is_prim_name()) {
        // add prim node
        update_callee(prev_bci, selector);
      } else {
        // at the beginning of a lookup
      }
    }
  }

  return last_top_bci;
}

void Profiler::update_back_edges_visited(call_graph_edge *edge) {
  assert( back_edges_visited, "list must be present");
  if (back_edges_visited->find(edge) == -1) 
    back_edges_visited->append(edge);
}


void Profiler::fix_stack_bottom(StackInfo* st) {
  // Fix the bottom of the stack by merging the information
  // collected in collect_stack and in the assembly routine
  // ContinueAfterProfilerInterrupt.
  
  fint begin = st->begin + max_activations_in_context;
  
  # if TARGET_ARCH == SPARC_ARCH
    if (st->interrupted_fp > st->frame_pointer) {
      // tick occured in just after a restore instruction which means the
      // first element in the pc sub-array is equal to the return addr,
      // in the interrupted context.
      ++begin; 
    } 
    else if (st->interrupted_fp != st->frame_pointer) {
      assert( 0 < begin  &&  begin <= max_pc,  "bounds");
      pc[--begin].set_value( st->interrupted_stored_return_addr.value, 1 );
    }
  # endif
  
  assert( 2 <= begin  &&  begin <= max_pc,  "bounds");
  if ( st->interrupted_pc.in_self() ) {
    nmethod* nm = st->interrupted_pc.my_nmethod();
    
    if (nm == NULL)
      ;
    else if (nm->isAccess()) {
      // access method
      //   caller          -- interrupted_return_addr_reg
      //   access method   -- pc
      pc[--begin].set_value( st->interrupted_return_addr_reg.value, 2 );
      pc[--begin].set_value( st->interrupted_pc.value, 3 );
    }
    else if (nm->has_frame_at(st->interrupted_pc.value)) {
      // pc could be in the prologue or the epilogue in case we should leave 
      // out the activation.
      if (nm->in_self_code_at(st->interrupted_pc.value)) {
        pc[--begin].set_value( st->interrupted_pc.value, 4 );
      }
      else {
        pc[--begin].set_value( st->interrupted_pc.value, 5 );
        // in self nmethod but in prologue or epilogue
      }
    }
    else {
      // no frame but could be execution real code
      pc[--begin].set_value( st->interrupted_return_addr_reg.value, 6 );
      
      if (nm->in_self_code_at(st->interrupted_pc.value)) {
        pc[--begin].set_value( st->interrupted_pc.value, 7 );
      }
      else {
        // in self nmethod but in prologue or epilogue
        // ignore interrupted_pc if receiver hasn't been verified
        if (st->interrupted_pc.value >= nm->verifiedEntryPoint()) {
          pc[--begin].set_value( st->interrupted_pc.value, 8 );
        }
      }
    }
  }
  else {
    if (st->interrupted_pc.in_pics()) {
      // Stack:
      //    non access method -- interrupted_return_addr_reg
      //    pic stub          --_pc
      if ( st->interrupted_return_addr_reg.in_self()
      &&  !st->interrupted_return_addr_reg.in_pics() )  {
        pc[--begin].set_value( st->interrupted_return_addr_reg.value, 9 );
      }
    }
    else if (st->interrupted_stored_return_addr.in_self()) {
      // Stack:
      //    method             -- return_addr
      //    method or nonsense -- interrupted_return_addr_reg
      //    non-self           -- pc
      //
      // The only way to determine if o7 is valid is to test if
      // interrupted_stored_return_addr is calling self code
      //
      // Only pertains to SPARC.
      
      nmethod* nm = st->interrupted_stored_return_addr.my_nmethod();
      assert(!nm->isAccess(), "access method must be at the bottom most");
      
      if (nm->in_self_code_at(st->interrupted_stored_return_addr.value)) {
        if (st->interrupted_stored_return_addr.in_block_clone()) {
          // do nothing
        } 
        else if (st->interrupted_stored_return_addr.is_calling_prim()) {
          pc[--begin].set_value( st->interrupted_pc.value, 10 );
        } 
        else {
          // Stack:
          //    method in ordiary send  -- return_addr
          //    unknown                 -- interrupted_return_addr_reg
          //    non-self                -- pc
        }
      } 
      else {
        // forget about pc and interrupted_return_addr_reg
      }
    } 
    else {
      // We are not in self at all 
      while ( begin < st->end  &&  !pc[begin].in_self())
        begin++;
    }
  }
  st->begin = begin;
}


void Profiler::merge_stack_info(StackInfo* st) {
 ResourceMark rm;

 if (st->interrupted_pc.value) fix_stack_bottom(st);

 // trace is used for folding the call graph
 path               = new tree_edge_BList(tree_edge_BList_initial_size);
 back_edges_visited = new tree_edge_BList(tree_edge_BList_initial_size);

 start_of_match = 0;
 start_of_fold  = 0;

 path->push(root_edge);

 // Traverse the stack in reverse order, from top to bottom.
 Pc   prev_pc;
 prev_pc.value = NULL;
 fint prev_bci = 0;
 fint stack_end = st->end-1;

 int  stack_ind1 = 0;

 if (ProfilerUsePatch) {
   if (pc[stack_end].value == first_inst_addr(ProfilerTrap)) {
     // The first element in the buffer is patch 
     char* frame = pc[stack_end].fr;
     stack_end--;
     for ( ;
           stack_index <  last_stack_end  &&  last_stack[stack_ind1].pc.fr >= frame;
           ++stack_ind1)
              assert(stack_ind1 < max_frames, "checking");
   }
 }
 

 if ((ProfilerUseLastStack || ProfilerUsePatch) && last_stack_end > 0) {

   last_stack_end = stack_ind1;

   if (stack_ind1 > 0 ) {
     if (ProfilerUseLastStack) {
       for ( ;
              stack_ind1  <  last_stack_end && 
              stack_end   >  st->begin      &&
              pc[stack_end].value == last_stack[stack_ind1].pc.value;              
              stack_ind1++,  stack_end-- )
         assert( stack_ind1 < max_frames, "checking");

       last_stack_end = stack_ind1;

       assert( stack_ind1 <= max_frames, "checking");

       int path_length = last_stack[stack_ind1-1].path_index;
       prev_bci        = last_stack[stack_ind1-1].bci;
       prev_pc.value   = last_stack[stack_ind1-1].pc.value;
       for (int i = 1; i < path_length; i++) {
         // root is already on the path
         path->push(last_path[i]);
       }
     } else {
       // Merge all frames into the call graph.
       for (int index = 0; index < stack_ind1; index++) {
         assert( index < max_frames, "checking");
         prev_bci = merge_pc(last_stack[index].pc, prev_pc, prev_bci,
                             st->user_time());
         prev_pc  = last_stack[index].pc;
       }
     }
   }
 }
 
 for (fint index = stack_end;  index >= st->begin;  --index) {
    prev_bci = merge_pc(pc[index], prev_pc, prev_bci, st->user_time());
    prev_pc  = pc[index];

    assert( last_stack_end <= max_frames, "checking");

    if (ProfilerUseLastStack || ProfilerUsePatch) {
      last_stack[last_stack_end].pc = pc[index];

      if (ProfilerUseLastStack) {
        last_stack[last_stack_end].bci        = prev_bci;
        last_stack[last_stack_end].path_index = path->length();
      }

      last_stack_end++;
    }
 }

 // If the top node of the path belongs to a non access/non primitive node
 // we add an edge and a node.
 call_graph_node* top = path->top()->callee;
 if (prev_pc.in_self() && 
     !top->is_prim_node() && !top->is_access_node()) {
   call_graph_edge* e;
   if (prev_bci < 0) {
     if (! (e = top->find_leaf(prev_bci))) {
       top->add_edge(e = new call_graph_edge(prev_bci, new_leaf_node()));
     }
     path->push(e);  
   } 
   else if (prev_pc.in_block_clone()) {
     stringOop sel = Memory->string_table->lookup("_BlockClone", 11);
     update_callee(prev_bci, sel);
   }
   else {
     stringOop selector = prev_pc.current_selector();
     if (selector && selector->is_prim_name()) {
       // add prim node
       update_callee(prev_bci, selector);
     } else {    
       if (! (e = top->find_leaf(prev_bci))) {
         top->add_edge(e = new call_graph_edge(prev_bci, new_leaf_node()));
       }
       path->push(e);  
     }
   }
 }

 last_path_end = 0;
 fint x;
 for (x = 0; x < path->length(); x++) {
   call_graph_edge* e = path->nth(x);
   if (ProfilerUseLastStack) {
     assert(last_path_end < max_vframes, "bounds check");
     last_path[last_path_end++] = e;
   }
   call_graph_node* n = e->callee;

   // Update the timing and allocation information to node.
   n->add_user_time(st->user_time());
   n->add_bytes(st->bytes_allocated);
   n->add_blocks(st->block_cloned);
 }

 LOG_TIME("delta", st->u_time);

 for (x = 0; x < back_edges_visited->length(); x++) {
   ((fold_edge*) back_edges_visited->nth(x))->update();
 }
 
 back_edges_visited = NULL;
}


bool Profiler::conversion_needed() {
  if (stack_index > max_stacks - 1) return true;
  if (stack_index && stack[stack_index-1].end >= max_self_frames_on_stack) return true;
  return false;
}


void Profiler::convert_nmethod_information() {
 CSect cs(profilerSemaphore);
  ProfilerTime pt(this);

  number_of_conversions++;  
  for (int i = 0; i < stack_index; i++) {
    if (ProfilerIgnoreCallGraph) {
      root->add_user_time(stack[i].user_time());
      root->add_bytes(stack[i].bytes_allocated);
      root->add_blocks(stack[i].block_cloned);
    } else {
      merge_stack_info(&stack[i]);
      stack_size.add(stack[i].end - stack[i].begin);
    }
  }
  stack_index = 0;
  first_stack_in_interval = 0;
  
  # if GENERATE_DEBUGGING_AIDS
    if (SpendTimeForDebugging)  {
      int node_count = -1;
      float total_time = -1.0;
      graph_totaller::compute_totals( root_edge, node_count, total_time );
      if (prior_node_count  > node_count)
        lprintf("count decreased from %d to %d\n", prior_node_count, node_count);
      if (prior_total_time  > total_time)
        lprintf( "time decreased from %g to %g\n", prior_total_time, total_time);
      if ( prior_node_count  > node_count
      ||   prior_total_time  > total_time )
        fatal("non-monotonic");

      prior_node_count = node_count;
      prior_total_time = total_time;
    }
  # endif
}


# if TARGET_ARCH == SPARC_ARCH
extern "C" { void ContinueAfterProfilerInterrupt(); }
# endif

char** profiler_return_addr;

StackInfo* Profiler::collect_stack(bool in_interrupt) {
  InterruptedContext::the_interrupted_context->must_be_in_self_thread();
  
  assert(!in_interrupt || InterruptedContext::the_interrupted_context->is_set(), "needed for stack walking");
  
  CSect cs(profilerCollectStackSemaphore);
  CollectTime ct(this);

  StackInfo* st = &current_stack();

  st->begin = stack_index ? stack[stack_index-1].end : 0;
  st->interrupted_pc.value = NULL;


  ++stack_index;
  if (stack_index >= max_stacks) 
    fatal2("need more stacks; stack_index is %d, but max_stacks is %d", stack_index, max_stacks);

  allocationMonitor.update();
  st->block_cloned    = allocationMonitor.blocks();
  st->bytes_allocated = allocationMonitor.bytes();
  allocationMonitor.clear();

  fint index = st->begin;


  FlushRegisterWindows();

  frame* last_frame;
  if (in_interrupt) {
    // Make room for activations in the interrupted context
    for ( fint i = 0;  i < max_activations_in_context; ++i ) {
      pc[index].value = NULL;
      pc[index++].fr  = NULL;
    }

    profiler_return_addr = (char**) &st->interrupted_pc;
    last_frame = InterruptedContext::the_interrupted_context->sp();


    // THIS IS HISTORICAL NOW. >>
      // Want frame above the interrupted context, but on PPC that's frame
      // above sp. That way, can look at last_frame's saved return_addr.
      // The interrupted context's sp may NOT be pointing at frame wtih saved PC. -- dmu 12/03
      //
      // I don't know why, but the return PC is sometimes not in the sender, so go up another. -- dmu 1/04
      // Need to go up TWO??? Come back to this. -- dmu 2/04
      //
      // I came back to it, made sure all the stubs save the link reg before stwu'ing the sp,
      // and assuming the C compiler is well behaved this should work with only one sender(); -- dmu 2/04
      // See frame_ppc.cpp frame::return_addr()
    // <<

    st->frame_pointer = (char*) last_frame;
    bool inSelf = Memory->code->isSelfPC(InterruptedContext::the_interrupted_context->pc());
    
         if (ShowLookupInMonitor::lookup_nesting)  lookup_ticks.inc();
    else if (!inSelf)                                prim_ticks.inc();
    else                                             self_ticks.inc();
  } 
  else {
    st->interrupted_pc.value = NULL;
    last_frame = _process->inSelf() ? _process->last_self_frame(false): NULL; 
    // _process->last_self_frame() ignores the last Self frame if
    // this activation is in the prologue code. However, fix_stack_bottom
    // captures the correct information by using the information in
    // the registers.
    self_ticks.inc();
  }

  st->end = index;

  if (ProfilerIgnoreCallGraph  ||  st->user_time() == 0.0)
    return NULL;
  collect_return_addresses_above_interrupted_context(st, last_frame);
  return st;
}


void Profiler::collect_return_addresses_above_interrupted_context(StackInfo* st, frame* last_frame) {
  fint index = st->end;
  bool in_c = false;
  bool reached_patch_address = false;
  fint count = 0;
  assert( block_level == 0, "should not reenter this");
  
  for (frame* f = last_frame; 
              f; 
              f = f->sender()) {
    if (!reached_patch_address) {
      // If f is not in self insert a 0 to indicate c frames.
      count++;
      if (f->is_compiled_self_frame()) {
        // XXXX add a branch for interp
        assert( index < max_pc,  "bounds");
        pc[index].set_value( f->return_addr(), 11 );
        assert( *(int*)f->return_addr(), "code check");
        assert( pc[index].my_nmethod(), "ensure the value is good");
        if (    ProfilerUsePatch
            &&  !ConversionInProgress
            &&  count > 2) {
          f->patch_profiler_trap();
          reached_patch_address =  pc[index].value == first_inst_addr(ProfilerTrap);
        }
        pc[index++].fr = (char*) f;
        in_c = false;
      } else {
        if (!in_c) {
          pc[index  ].value = NULL;
          pc[index++].fr    = (char*)f;
          in_c = true;
        }
        count = 0;
      }
      if (index > max_pc) fatal("return addr. buffer overflow");
    }
    if (f->real_return_addr() == first_inst_addr(ProfilerTrap)) {
      assert(Memory->code->contains(f->return_addr()), "should be in self");
    }
  }          
  st->end = index;
}


static void print_exclude(const char* title, float t) {
  if (t > 0.0) {
    lprintf(" %4.1f (ms) %s\n", t, title);
  }
}

class graph_counter : public graph_iterator {
 public:
  fint count;
  graph_counter(call_graph_edge* e);
  void do_edge(call_graph_edge* e);
};

graph_counter::graph_counter(call_graph_edge* r)
 : graph_iterator(r) {
   count = 0;
   do_it();
}

void graph_counter::do_edge(call_graph_edge* e) {
  Unused(e);
  count++;
}
  
void Profiler::printProfile(float cutoff) {
  if (WizardMode) {
    lprintf("\t self: %d, lookup: %d, prims: %d \n",
           self_ticks.num, lookup_ticks.num, prim_ticks.num);
    stack_size.print();
    collect_ticks.print();

    lprintf("Number of conversions: %d\n", number_of_conversions);

    lprintf("Runtime:       %3.2f msec\n", root->user_time); 

#   if  TARGET_OS_VERSION_FOR_NPROF_TIMER == SOLARIS_VERSION
    lprintf("Collect time:  %3.2f msec\n", collect_time.milli_secs_as_float());
    lprintf("Profiler time: %3.2f msec\n", prof_time.milli_secs_as_float());
# elif  TARGET_OS_VERSION_FOR_NPROF_TIMER ==   SUNOS_VERSION
    lprintf("Collect time:  %3.2f sec\n", collect_timer.millisecs());
    lprintf("Profiler time: %3.2f sec\n", prof_timer.millisecs());
#   endif

    lprintf("Number in new list = %d\n", new_list->num());

    lprintf("<Excludes>-----------------\n");
    print_exclude("monitor", monitor_tick_time);
    print_exclude("compile", compile_time);
    print_exclude("recompile", recompile_time);
    print_exclude("scavenging", scavenging_time);
    print_exclude("garbage_collection", garbage_collection_time);
    print_exclude("nmethod_flush", nmethod_flush_time);
    print_exclude("nmethod_compact", nmethod_compact_time);
    print_exclude("uncommon_branch", uncommon_branch_time);
    lprintf("\n");

    graph_counter gc(root_edge);
    lprintf("# nodes in call graph = %d\n", gc.count);
    
  }
  if (!ProfilerDumpCallGraph) return;

  graph_dumper f(root_edge, cutoff);
}


void Profiler::tick() {
  InterruptedContext::the_interrupted_context->must_be_in_self_thread();
  
  if (status != profiling)    return;
  if (_process->nesting == 0) return; // ignore if _process is inactive

  // If the preemptor() has been called in THIS tick a preemption
  // is pending and the profiler suspend has taken place.
  if (_process->preemptionPending()) return;

  if (ConversionInProgress)   { conversion_ticks.inc(); return; }
  if (profilerSemaphore)      { profiler_ticks.inc();   return; }
  if (processSemaphore)       { sem_ticks.inc();        return; }

  assert(!GCInProgress, "should be in exclude part");

  assert(!theCompiler,  "should be in exclude part");
# ifdef SIC_COMPILER
  assert(!theSIC,       "should be in exclude part");
# endif

  if (conversion_needed())  {
    profilers->raiseOverflow(this);
    LOG_REC("raise");
  } else {
    // Avoid process change during stack collection
    // ContinueAfterProfilerInterrupt will clear processSemaphore.

    processSemaphore = true;

    LOG_REC("tick");
    stop_tick_timer();
    int old_stack_index = stack_index;
    StackInfo* st = collect_stack(true);
    start_tick_timer();

    # if TARGET_ARCH == SPARC_ARCH
      if ( st != NULL ) {
        InterruptedContext::set_continuation_address(first_inst_addr(ContinueAfterProfilerInterrupt),
                                                     false, false);
      }
    # endif
  }
}


call_graph_node* Profiler::new_node(ScopeDesc* sd) {
  call_graph_node* n;
       if (sd->isMethodScope())  n = new method_node(sd);
  else if (sd->isAccessScope())  n = new access_node(sd);
  else                           n = new block_node(sd);

  if (use_new_list)  new_list->insert(n);
  return n;
}


call_graph_node* Profiler::new_leaf_node() {
  call_graph_node* n = new leaf_node();
  if (use_new_list)  new_list->insert(n);
  return n;
}

call_graph_node* Profiler::new_prim_node(stringOop sel) {
  call_graph_node* n = new prim_node(sel);
  if (use_new_list)  new_list->insert(n);
  return n;
}

call_graph_node* Profiler::new_clone(call_graph_node* n) {
  call_graph_node* c = n->clone();
  return c;
}

void Profiler::update_last_path(float user_time_arg) {
  // Add user time to the last stack
  for (int i = 0; i <  last_path_end; i++) {
    last_path[i]->callee->add_user_time(user_time_arg);
  }
}

// memory functions

static void call_graph_node_scavenge(call_graph_node* n) {
  n->scavenge_contents_quickly();
}

static oop n_from, n_to;
static void call_graph_node_switch_pointers(call_graph_node* n) {
  n->switch_pointers(n_from, n_to);
}

void Profiler::scavenge_contents() {
  if (!use_new_list) fatal("!!!!");
  SCAVENGE_TEMPLATE(&_profilerOop);
  cache->scavenge_contents();
  if (use_new_list)  new_list->nodes_do(call_graph_node_scavenge);
  else               root->scavenge_contents();
}

void Profiler::gc_mark_contents() {
  MARK_TEMPLATE(&_profilerOop);
  root->gc_mark_contents();
  cache->gc_mark_contents();
  // no need to mark via new_list as these are all reachable from
  // root and cache
}

void Profiler::gc_unmark_contents() {
  UNMARK_TEMPLATE(&_profilerOop);
  root->gc_unmark_contents();
  cache->gc_unmark_contents();
  // no need to unmark via new_list as these are all reachable from
  // root and cache
}

void Profiler::switch_pointers(oop from, oop to) {
  if (from->is_old()  &&  to->is_new()  &&  use_new_list) {
    // To continue using new_list would need switch_pointers to add a node to new_list
    // if it weren't already new and an old oop were replaced by a new one.
    use_new_list = false;
    fatal("This should not happen unless memory system has changed.");
  }
  SWITCH_POINTERS_TEMPLATE(&_profilerOop);
  cache->switch_pointers(from,to);
  if (use_new_list  &&  from->is_new()) {
    n_from = from;
    n_to   = to;
    new_list->nodes_do(call_graph_node_switch_pointers);
  } else {
    root->switch_pointers(from,to);
  }
}

bool Profiler::verify() {
  bool verify_result = true;
  VERIFY_TEMPLATE(&_profilerOop);
  verify_result &= root->verify();
  verify_result &= cache->verify();
  verify_result &= new_list->verify();
  return verify_result;
}


// ---- Profilers

Profilers::Profilers(){
  _first                  = NULL;
  _profiler_with_overflow = NULL;
}

void Profilers::insert(Profiler* p) {
  p->_next = _first;
  _first = p;
}

void Profilers::remove(Profiler* p) {
  bool found = false;
  if (_first == p) {
    _first = _first->_next;
    found = true;
  } else {
    Profiler* pred = _first;
    for (Profiler *c = pred->_next; c != NULL; c = c->_next, pred = c) {
      if (c == p) {
        pred->_next = c->_next;
        found = true;
      }
    }
  }
  if (found) p->_next = NULL;
  else       fatal("profiler not found in profiler list");
}

Profiler* Profilers::find_current() {
  for (Profiler *p = _first; p != NULL; p = p->_next) {
    if (p->status == p->profiling) return p;
  }
  return NULL;
}


void Profilers::raiseOverflow(Profiler* p) {
  assert(p == _profiler_with_overflow || !hasOverflow(),
         "several profilers with overflow not allowed");
  _profiler_with_overflow = p;
  // Patch max stack to force process to return to Profilers::handleOverflow()
  // in a well-defined state.
  InterruptedContext::setupPreemptionFromSignal();
}

void Profilers::handleOverflow() {
  assert(hasOverflow(), "must have profiler with overflow");
  _profiler_with_overflow->handleOverflow();
  _profiler_with_overflow = NULL;
}
  
#  define FOR_EACH_PROFILER(P) \
   for (Profiler *P = _first; P != NULL; P = P->_next)

# else // ! PROFILER

#  define FOR_EACH_PROFILER(P) \
   Profiler *P; if (false)
   
Profilers::Profilers() : CHeapObj() {}

 
# endif // PROFILER




void Profilers::print() {
  FOR_EACH_PROFILER(p) p->print(); }
void Profilers::scavenge_contents() {
  FOR_EACH_PROFILER(p) p->scavenge_contents(); }
void Profilers::gc_mark_contents() {
  FOR_EACH_PROFILER(p) p->gc_mark_contents(); }
void Profilers::gc_unmark_contents() {
  FOR_EACH_PROFILER(p) p->gc_unmark_contents(); }
void Profilers::switch_pointers(oop from, oop to) {
  FOR_EACH_PROFILER(p) p->switch_pointers(from,to); }
bool Profilers::verify() {
  bool r = true;
  FOR_EACH_PROFILER(p) r &= p->verify(); 
  return r;
}


Profilers* profilers;

// Called during initialization from init.c
void profilers_init() {
  profilers = new Profilers;
}

  
# ifdef PROFILER

void Profilers::convert_nmethod_information() {
  FOR_EACH_PROFILER(p) {
    p->convert_nmethod_information();
    p->cache->flush();
  }
}


// ---- BlockProfilerTicks

const char* const block_type_labels[] = {
  "include type", 
  "method flush", // include method flush.
  "monitor tick", // exclude_monitor_tick, 
  "compile",      // exclude_recompile, 
  "recompile",    // exclude_recompile, 
  "scavenging",   // exclude_scavenging, 
  "gc",           // exclude_garbage_collection,
  "nm-flush",     // exclude_nmethod_flush,
  "nm-compact",   // exclude_nmethod_compact
  "uncommon_branch"
};

static bool has_flushed_once = false;
static ProcessTime block_time;

BlockProfilerTicks::BlockProfilerTicks(block_type b_t) {
  if (profilers->isEmpty()) return;
  bt = b_t;

  if (block_level == 0) {
    if ((prof = profilers->find_current()) != NULL) {
      prof->suspend();

      if (b_t == exclude_scavenging ||
          b_t == exclude_garbage_collection) {
        prof->allocationMonitor.update();
      }

# if  TARGET_OS_VERSION_FOR_NPROF_TIMER == SOLARIS_VERSION
      ProcessInfo::update();
      block_time = ProcessInfo::user_time();
# elif  TARGET_OS_VERSION_FOR_NPROF_TIMER ==   SUNOS_VERSION
      u_timer.start();
# endif
    }
  }
  ++block_level;

  // Flush all nmethod information if necessary.
  if (!has_flushed_once) 
    if ((has_flushed_once = should_flush_nmethod_information()) != false)
      profilers->convert_nmethod_information();
}


BlockProfilerTicks::~BlockProfilerTicks() {
  if (profilers->isEmpty()) return;
  
  --block_level;
  if (block_level == 0) has_flushed_once = false;

  if (block_level == 0 && prof) {
# if  TARGET_OS_VERSION_FOR_NPROF_TIMER == SOLARIS_VERSION
    ProcessInfo::update();
    block_time = ProcessInfo::user_time() - block_time;
    float t =  block_time.milli_secs_as_float();
# elif  TARGET_OS_VERSION_FOR_NPROF_TIMER ==  SUNOS_VERSION
    float t = u_timer.millisecs();
# else
    float t = 0.0; // unimp mac
#  endif
    switch (bt) {
     case include_type:
     case include_nmethod_flush:
      // Update the last stack collected with t
      prof->update_last_path(t);
      break;
     case exclude_monitor:
      prof->monitor_tick_time       += t; break;
     case exclude_compile:
      prof->compile_time            += t; break;
     case exclude_recompile:
      prof->recompile_time          += t; break;
     case exclude_scavenging:
      prof->scavenging_time         += t; break;
     case exclude_garbage_collection:
      prof->garbage_collection_time += t; break;
     case exclude_nmethod_flush:
      prof->nmethod_flush_time      += t; break;
     case exclude_nmethod_compact:
      prof->nmethod_compact_time    += t; break;
     case exclude_uncommon_branch:
      prof->uncommon_branch_time    += t; break;
     default:
      fatal("unexpected kind of exclude");
    }
    if (bt == exclude_scavenging ||
        bt == exclude_garbage_collection) {
      prof->allocationMonitor.set();
    }
    if (prof->event_buffer) prof->event_buffer->time("exclude", block_time);
    prof->resume();
  }
}

bool BlockProfilerTicks::should_flush_nmethod_information() {
  return 
    bt == include_nmethod_flush   ||
    bt == exclude_nmethod_flush   || 
    bt == exclude_recompile       ||
    bt == exclude_uncommon_branch ||
    bt == exclude_nmethod_compact;
}

void AllocationMonitor::update() {
  _blocks = NumberOfBlockClones - _last_blocks;
  _bytes  = Memory->new_gen->eden_space->used() - _last_bytes;
  set();
}

void AllocationMonitor::set() {
  _last_blocks = NumberOfBlockClones;
  _last_bytes  = Memory->new_gen->eden_space->used();
};


# endif // PROFILER
