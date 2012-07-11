/* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "callgraph.hh"
# include "_callgraph.cpp.incl"

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

// Generalize receiver object merge:
//  add primitive _ProfilerMergeReceivers: <vectorOfVectors>

inline bool is_boolean_map(oop m) {
  if (Memory-> true_mapOop() == m) return true;
  if (Memory->false_mapOop() == m) return true;
  return false;
}

bool is_equal(oop m, oop n) {
  if (is_boolean_map(m) && is_boolean_map(n) ) return true;
  return mapOop(m)->equal( mapOop(n));
}

call_graph_node::call_graph_node() {
  edges = 0;
  my_new_list = 0;

  block_clones    = 0;
  bytes_allocated = 0;

  user_time = 0.0;
  optimized_user_time = 0.0;
  # if TARGET_OS_VERSION_FOR_NPROF_TIMER ==  SUNOS_VERSION
    uncertain_user_time = 0.0;
  # endif
}

call_graph_node::~call_graph_node() {
  if (my_new_list)  my_new_list->remove(this);
  if (edges) delete edges;
}

void call_graph_node::add_edge(call_graph_edge* e) {
  e->next = edges;
  edges = e;
  # if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions  &&  profilers->current_for_debugging()->root_edge->callee->edges->next) {
       lprintf("creating multiple roots; will not work\n");
       // graph_dumper(profilers->current_for_debugging()->root_edge, 0.0);
       fatal("Profiler problem: attempting to create multiple roots which will cause profiler to return only a partial graph");
    }
  # endif
}

# define FOREACH_EDGE for(call_graph_edge* e = edges; e; e = e->next)

call_graph_edge* call_graph_node::find_matching(int bci, call_graph_node* n) {
  FOREACH_EDGE {
    if (!e->is_fold_edge() && e->is_matching_node(bci, n))
      return e;
  }
  return 0;
}

call_graph_edge* call_graph_node::find_matching(int bci, stringOop sel) {
  FOREACH_EDGE {
    if (!e->is_fold_edge() && e->is_matching_sel(bci, sel))
      return e;
  }
  return 0;
}

call_graph_edge* call_graph_node::find_leaf(int bci) {
  FOREACH_EDGE {
    if (!e->is_fold_edge() && e->is_matching_leaf(bci))
      return e;
  }
  return 0;
}

fold_edge* call_graph_node::find_fold_edge(int bci, call_graph_node* n) {
  FOREACH_EDGE {
    if (e->is_fold_edge() && e->is_matching_node(bci, n))
      return (fold_edge*) e;
  }
  return 0;
}    

int call_graph_node::num_of_edges(float cutoff) {
  int i = 0;
  FOREACH_EDGE { if (e->is_significant(cutoff))  ++i; }
  return i;
}

static int compare_edges(const void* p1,  const void* p2) {
  call_graph_edge* a = *(call_graph_edge**)p1;
  call_graph_edge* b = *(call_graph_edge**)p2;

  // longest time first
  if (a->callee->user_time > a->callee->user_time)  return -1;
  if (a->callee->user_time < a->callee->user_time)  return  1;

  if (a->bci < b->bci)           return -1;
  if (a->bci > b->bci)           return  1;
  if (a->callee->is_leaf_node()) return -1;
  if (b->callee->is_leaf_node()) return  1;  
  return 0;
}

// Memory management

static void scavenge_oop(oop* p) { SCAVENGE_TEMPLATE(p); }
void call_graph_node::scavenge_contents() {
  oops_do(scavenge_oop);
  FOREACH_EDGE {
    if (!e->is_fold_edge() && e->callee) 
      e->callee->scavenge_contents();
  }
}
void call_graph_node::scavenge_contents_quickly() {
  oops_do(scavenge_oop);
}

static void mark_oop(oop* p) { MARK_TEMPLATE(p); }
void call_graph_node::gc_mark_contents() {
  oops_do(mark_oop);
  FOREACH_EDGE {
    if (!e->is_fold_edge() && e->callee) 
      e->callee->gc_mark_contents();
  }
}

static void unmark_oop(oop* p) { UNMARK_TEMPLATE(p); }
void call_graph_node::gc_unmark_contents() {
  oops_do(unmark_oop);
  FOREACH_EDGE {
    if (!e->is_fold_edge() && e->callee) 
      e->callee->gc_unmark_contents();
  }
}

static oop s_from, s_to;
static void switch_oop(oop *p) { if (*p == s_from) *p = s_to; }
void call_graph_node::switch_pointers(oop from, oop to) {
  s_from = from; s_to = to;
  oops_do(switch_oop);
  FOREACH_EDGE {
    if (!e->is_fold_edge() && e->callee) 
      e->callee->switch_pointers(from, to);
  }
}

static bool verify_oop_result = true;
static void verify_oop(oop *p) { bool verify_result = true; VERIFY_TEMPLATE(p); verify_oop_result = verify_result; }
bool call_graph_node::verify() {
  oops_do(verify_oop);
  bool r = verify_oop_result;
  FOREACH_EDGE {
    if (!e->is_fold_edge() && e->callee)
      r &= e->callee->verify();
  }
  return r;
}

// ---- prim_node

prim_node::prim_node(oop sel) : call_graph_node() {
  _selector = (stringOop) sel;
}

prim_node::prim_node(prim_node* pn) : call_graph_node() {
  _selector = pn->selector();
} 

bool prim_node::is_new() {
  return selector()->is_new();
}

bool prim_node::is_matching(call_graph_node* n) {
  if (!n->is_prim_node()) return false;
  return selector() == ((prim_node*) n)->selector();
}

call_graph_node* prim_node::clone() {
  call_graph_node* r = (call_graph_node*) new prim_node(this);
  if (my_new_list) my_new_list->insert(r);
  return r;
} 

void prim_node::print_node(bool verbose) {
  Unused(verbose);
  lprintf("%s", selector_string(selector()));
}

void prim_node::oops_do(oopsDoFn f) {
  OOPS_DO_TEMPLATE(&_selector,f);
}

// ---- leaf_node

leaf_node::leaf_node() : call_graph_node() {}

call_graph_node* leaf_node::clone() {
  call_graph_node* r = (call_graph_node*) new leaf_node();
  if (my_new_list) my_new_list->insert(r);
  return r;
} 

void leaf_node::print_node(bool verbose) {
  Unused(verbose);
  lprintf("<send>");
}

// ---- method_node

method_node::method_node(ScopeDesc* sd) : call_graph_node() {
  _selector          = (stringOop) sd->key.selector;
  _receiverMapOop    = sd->selfMapOop();
  _method            = sd->method();

  // If methodHolder is an oop replace it with the map.
  oop mh            = sd->methodHolder_or_map();
  _methodHolder_map = mh->is_map() ? mh : mh->map()->enclosing_mapOop();
}

method_node::method_node(method_node* mn) : call_graph_node() {
  _selector        = mn->selector();
  _receiverMapOop  = mn->receiverMapOop();
  _methodHolder_map   = mn->methodHolder_map();
  _method          = mn->method();
}

bool method_node::is_new() {
  return    selector()->is_new()
         || receiverMapOop()->is_new()
         || methodHolder_map()->is_new()
         || method()->is_new();
}

bool method_node::is_matching(call_graph_node* n) {
  if (!n->is_method_node()) return false;

  method_node* mn = (method_node*) n;
  if (selector()      != mn->selector())      return false;
  if (!is_equal(receiverMapOop(), mn->receiverMapOop()))  return false;
  if (methodHolder_map() != mn->methodHolder_map()) return false;
  return true;  
}

call_graph_node* method_node::clone() {
  call_graph_node* r = (call_graph_node*) new method_node(this);
  if (my_new_list) my_new_list->insert(r);
  return r;
}

void method_node::print_node(bool verbose) {
  oop m = method();
  if (m) {
    printName((methodMap*) m->map(), selector());
  } else {
    lprintf("method %s", selector_string(selector()));
  }
  if (verbose) {
    lprintf(" {rec = 0x%lx, mh = 0x%lx}", (receiverMapOop()),
           (long unsigned)(methodHolder_map()));
  }
}

void method_node::oops_do(oopsDoFn f) {
  OOPS_DO_TEMPLATE(&_selector,f);
  OOPS_DO_TEMPLATE(&_receiverMapOop,f);
  OOPS_DO_TEMPLATE(&_methodHolder_map,f);
  OOPS_DO_TEMPLATE(&_method,f);
}

// ---- access_node

access_node::access_node(ScopeDesc* sd) : call_graph_node() {
  _selector        = (stringOop) sd->key.selector;
  _receiverMapOop  = sd->selfMapOop();
  _methodHolder_map   = sd->methodHolder_or_map();
  // If methodHolder is an oop replace it with the map.
  if (!_methodHolder_map->is_map())
    _methodHolder_map = _methodHolder_map->map()->enclosing_mapOop();
}

access_node::access_node(access_node* an) : call_graph_node() {
  _selector        = an->selector();
  _receiverMapOop  = an->receiverMapOop();
  _methodHolder_map   = an->methodHolder_map();
}

bool access_node::is_new() {
  return    selector()->is_new()
         || receiverMapOop()->is_new()
         || methodHolder_map()->is_new();
}

bool access_node::is_matching(call_graph_node* n) {
  if (!n->is_access_node()) return false;

  access_node* an = (access_node*) n;
  if (selector()      != an->selector())       return false;
  if (!is_equal(receiverMapOop(), an->receiverMapOop()))   return false;
  if (methodHolder_map() != an->methodHolder_map()) return false;
  return true;  
}

call_graph_node* access_node::clone() {
  call_graph_node* r = (call_graph_node*) new access_node(this);
  if (my_new_list) my_new_list->insert(r);
  return r;
}

void access_node::print_node(bool verbose) {
  Unused(verbose);
  lprintf("access %s", selector_string(selector()));
}

void access_node::oops_do(oopsDoFn f) {
  OOPS_DO_TEMPLATE(&_selector,f);
  OOPS_DO_TEMPLATE(&_receiverMapOop,f);
  OOPS_DO_TEMPLATE(&_methodHolder_map,f);
}

// ---- block_node

block_node::block_node(ScopeDesc* sd) : call_graph_node() {
  _selector          = (stringOop) sd->key.selector;
  _method            = sd->method();
}

block_node::block_node(block_node* bn) : call_graph_node() {
  _selector          = bn->selector();
  _method            = bn->method();
}

bool block_node::is_new() {
  return selector()->is_new() || method()->is_new();
}

bool block_node::is_matching(call_graph_node* n) {
  if (!n->is_block_node()) return false;

  block_node* bn = (block_node*) n;
  if (selector()  != bn->selector()) return false;
  if (method()    != bn->method())   return false;
  return true;
}

call_graph_node* block_node::clone() {
  call_graph_node* r = (call_graph_node*) new block_node(this);
  if (my_new_list) my_new_list->insert(r);
  return r;
}

oop block_node::outer_method() {
  methodMap* mm = (methodMap*) method()->map();
  if (!mm->has_code()) return Memory->nilObj;
  objVectorOop lit = mm->literals();
  slotDesc* methodPointerSlot = lit->find_slot(VMString[METHOD_POINTER]);
  if (methodPointerSlot)
    return lit->get_slot(methodPointerSlot);
  else
    return Memory->nilObj;
}

void block_node::print_node(bool verbose) {
  printName((methodMap*) method()->map(), selector());
  if (verbose) {
    lprintf(" {method = 0x%lx}", (unsigned long)method());
  }
}

void block_node::oops_do(oopsDoFn f) {
  OOPS_DO_TEMPLATE(&_selector,f);
  OOPS_DO_TEMPLATE(&_method,f);
}

// ---- call_graph_edge

call_graph_edge::call_graph_edge(int bci_arg, call_graph_node* callee_arg) {
  bci    = bci_arg;
  callee = callee_arg;
  next   = 0;
}

call_graph_edge::~call_graph_edge() {
  if (callee) delete callee;
  if (next)   delete next;
}

bool call_graph_edge::is_matching_node(fint bci_arg, call_graph_node* n) {
  return bci == bci_arg && callee->is_matching(n);
}

bool call_graph_edge::is_matching_sel(fint bci_arg, stringOop sel) {
  if (!callee->is_prim_node()) return false;
  return bci == bci_arg && ((prim_node*) callee)->is_matching_sel(sel);
}

bool call_graph_edge::is_matching_leaf(fint bci_arg) {
  return bci == bci_arg && callee->is_leaf_node();
}

// ---- fold_edge

fold_edge::fold_edge(fint bci_arg, call_graph_node* callee_arg) 
: call_graph_edge(bci_arg, callee_arg) {
  _counter = _num = _min = _max = _sum = 0;
}

fold_edge::~fold_edge() { 
  // callee is cleared before _call_graph_edge is magically executed
  // the C++ destructor semantic is bogus. LB.
  callee = 0;
}

void fold_edge::print_node(bool verbose) {
  lprintf("FOLD: "); 
  callee->print_node(verbose);
  lprintf(" avg=%2.1f [%d,%d]",average(), min(), max());
}

float fold_edge::average() {
  return _sum > 0 ?  (float) _sum / _num : 0.0;
}

void fold_edge::update() {
  if (_num == 0 || _counter < _min) _min = _counter;
  if (_counter > _max) _max = _counter;
  _sum += _counter;
  _num++;
  _counter = 0;
}

// ---- graph_iterator

graph_iterator::graph_iterator(call_graph_edge* e) {
  _top   = e;
  _depth = 0;
  cutoff = -1.0;
}

void graph_iterator::do_it() {
  do_edge(top());
  if (!top()->is_fold_edge()) do_sub_edges(top());
}

int graph_iterator::do_sub_edges(call_graph_edge* e) {
  call_graph_node* n = e->callee;    
  _depth++;

  int sons = n->num_of_edges(cutoff);
  if (sons > 0) { 
    ResourceMark rm;
    call_graph_edge** es = NEW_RESOURCE_ARRAY(call_graph_edge*, sons);
    
    int i = 0; 
    for(call_graph_edge* s = n->edges; s; s = s->next) {
      if (s->is_significant(cutoff))
        es[i++] = s;
    }
    qsort(es, sons, sizeof(call_graph_edge*), compare_edges);

    for (i = 0; i < sons; i++) {
      call_graph_edge* ss = es[i];
      do_edge(ss);
      if (!ss->is_fold_edge()) do_sub_edges(ss);
    }
  }
  _depth--;
  return sons;
}

graph_dumper::graph_dumper(call_graph_edge* r, float cut_off, bool verbose)
 : graph_iterator(r) {
   _cut_off = cut_off;
   _verbose = verbose;
   user_time       = r->callee->user_time;
   block_clones    = r->callee->block_clones;
   bytes_allocated = r->callee->bytes_allocated;
   do_it();
}

void graph_dumper::do_edge(call_graph_edge* e) {
  for (fint i = 0; i < depth(); i++)
    lprintf((i % 10) != 9 ? " " : ".");

  if (e->bci == PrologueBCI) {
    lprintf("prologue,  %2.1f%%", 100.0 * e->callee->user_time/user_time);
  } else {
    lprintf("%d ", e->bci);
    if (e->is_fold_edge()) {
      ((fold_edge*) e)->print_node(verbose());
    } else {
      e->callee->print_node(verbose());
      lprintf(", %2.1f%% ", 100.0 * e->callee->user_time/user_time);
      // lprintf(" %dKb,#%dK", bytes_allocated/1024, block_clones/1024); 
    }
  }
  lprintf("\n");
}

int graph_dumper::do_sub_edges(call_graph_edge* e) {
  if (e->callee->user_time/user_time >= cut_off()) {
    return graph_iterator::do_sub_edges(e);
  }
  return 0;
}

# endif //  defined(FAST_COMPILER) || defined(SIC_COMPILER)
