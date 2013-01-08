/* Sun-$Revision: 30.14 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// Part of the nprofiler creating the self level call graph 

# pragma implementation "nprofiler.copygraph.hh"

# include "_nprofiler.copygraph.cpp.incl"

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)


// Dictionary for mapping a map to an example object.
// Use when enumerating the heap for objects matching a set of maps.

class MapTableEntry : public CHeapObj {
 public:
  MapTableEntry(mapOop m, oop o) { map = m; obj = o; next = NULL; }
  ~MapTableEntry()               { if (next) delete next; }
  mapOop map;
  oop    obj;
  MapTableEntry* next;
};

class MapTable : public ResourceObj {
  // Table for (map,oop) pair
 private:
  static const fint size;
  fint num;

  MapTableEntry **table;

  fint hash(mapOop map) { return (fint) map % size; }

  MapTableEntry* entryFor(fint value) { return table[value]; }

 public:
  MapTable();
  ~MapTable() { delete [] table; }

  // deallocates all MapTableEntries
  void deallocate();

  bool insertIfAbsent(mapOop map, oop obj = NULL);

  void update(mapOop map, oop obj);
  
  bool member(mapOop map);

  oop find(mapOop map);

  friend class map_enumeration;
};

const fint MapTable::size = 3001;

MapTable::MapTable() {
  num = 0;
  table= new MapTableEntry *[size];
  for (fint i = 0; i < size; i++ ) table[i] = NULL;
}

void MapTable::deallocate() {
  for (fint i = 0; i < size ; i++ ) {
    if (table[i]) { delete table[i]; table[i]= NULL; }
  }
}

bool MapTable::insertIfAbsent(mapOop map, oop obj) {
  fint value = hash(map);
  MapTableEntry** entry = &table[value];
  for (entry = &table[value]; *entry; entry = &(*entry)->next) {
    if ((*entry)->map->equal(map)) return false;
  }
  num++;
  *entry = new MapTableEntry(map, obj);
  return true;
}

void MapTable::update(mapOop map, oop obj) {
  for (MapTableEntry* link = table[hash(map)]; link; link = link->next) {
    if (link->map->equal(map)) {
      assert(link->obj == NULL, "Invalid update");
      link->obj = obj;
      return;
    }
  }
  ShouldNotReachHere(); // no element found
}

bool MapTable::member(mapOop map) {
  for (MapTableEntry* link = table[hash(map)]; link; link = link->next) {
    if (link->map->equal(map)) return true;
  }
  return false;
}

oop MapTable::find(mapOop map) {
  for (MapTableEntry* link = table[hash(map)]; link; link = link->next) {
    if (link->map->equal(map)) return link->obj;
  }
  return NULL;
}

class method_node_info;
class block_node_info;
class access_node_info;
class prim_node_info;
class leaf_node_info;
class fold_edge_info;

class graph_creator : public graph_iterator {
 private:
  // Prototypes for the self call graph nodes
  oop method_node_pt;
  oop block_node_pt;
  oop access_node_pt;
  oop prim_node_pt;
  oop leaf_node_pt;
  oop fold_edge_pt;

  // Slot information for the prototypes
  method_node_info* method_pt_info;
  block_node_info*  block_pt_info;
  access_node_info* access_pt_info;
  prim_node_info*   prim_pt_info;
  leaf_node_info*   leaf_pt_info;
  fold_edge_info*   fold_pt_info;

  // Clone and fill operations
  oop clone_method_pt(method_node* n);
  oop clone_block_pt(block_node* n);
  oop clone_prim_node_pt(prim_node* n);
  oop clone_access_node_pt(access_node* n);
  oop clone_leaf_node_pt(leaf_node* n);
  oop clone_fold_edge_pt(fold_edge* e);

  oop _root;
  oop _unknown_oop;

  // Variables used during the graph traversal
  oop parent;
  oop next_parent;
  int index;
  bool out_of_memory;

  MapTable* graph_maps;

  OopBList*        oop_path;
  tree_edge_BList* node_path;

 public:
  graph_creator(call_graph_edge* e, MapTable* gm,   
                oop method_pt,  oop block_pt, oop access_pt,
                oop prim_pt,    oop leaf_pt,  oop fold_pt, oop unknown_oop,
                smi cutoff_pct);

  // returns  the root of the self call graph
  oop root() { return _root;} 

  bool ran_out_of_memory() { return out_of_memory; };

  // Creates an object from the map. All data slots will be filled with
  // _unknown_oop
  oop oop_from_map(oop m);

  void do_edge(call_graph_edge* e);
  int  do_sub_edges(call_graph_edge* e);  
};

// Structure to keep slot information for call graph nodes
class slot_info {
 private:
  smi _offset;
  static const smi invalid_offset;
 public:
  smi offset() { return _offset; }
  void init(oop node_pt, const char* selector);
  bool is_present() { return _offset >= 0; }
  void set(oop node_oop, oop value) {
    Memory->store(oopsOop(node_oop)->oops(offset()), value);
  }
};

const smi slot_info::invalid_offset = -1;

void slot_info::init(oop node_pt, const char* selector) {
  // Check if node_pt has data_slot selector and save offset in _offset.
  stringOop sel = Memory->string_table->lookup(selector, strlen(selector));
  slotDesc* sd = node_pt->find_slot(sel);
  if (sd && sd->type->is_obj_slot()) {
    _offset = smiOop(sd->data)->value();
  } else {
    _offset = invalid_offset;
  }
}

# define FILL_SLOT(N, V) if (N.is_present()) N.set(node_oop,V)

class fold_edge_info {
 public:
  fint _num;
  slot_info fold, average, min, max;  

  fold_edge_info(oop node_pt) {
    _num = 0;
    fold.init(node_pt,    "fold");
    average.init(node_pt, "average");
    min.init(node_pt,     "min");
    max.init(node_pt,     "max");
  }

  void fill(oop node_oop, fold_edge* e, oop fold_oop) {
    _num++;
    FILL_SLOT(fold,    fold_oop);
    FILL_SLOT(average, as_floatOop(e->average()));
    FILL_SLOT(min,     as_smiOop(e->min()));
    FILL_SLOT(max,     as_smiOop(e->max()));
  }
};

class node_info {
 public:
  fint _num;
  slot_info user_time, optimized, bytes, blocks;
# if TARGET_OS_VERSION_FOR_NPROF_TIMER ==  SUNOS_VERSION
  slot_info accuracy;
# endif

  node_info(oop node_pt) {
    _num = 0;
    user_time.init(node_pt, "time");
    optimized.init(node_pt, "optimized");
    bytes.init(node_pt,     "bytes");
    blocks.init(node_pt,    "blocks");
# if TARGET_OS_VERSION_FOR_NPROF_TIMER == SUNOS_VERSION
    accuracy.init(node_pt,  "accuracy");
# endif
  }

  void fill(oop node_oop, call_graph_node* n);
};

void node_info::fill(oop node_oop, call_graph_node* n) {
  _num++;
  FILL_SLOT(user_time, as_floatOop(n->user_time));
  FILL_SLOT(optimized, as_floatOop(n->optimized()));
  FILL_SLOT(bytes,     as_smiOop(n->bytes_allocated));
  FILL_SLOT(blocks,    as_smiOop(n->block_clones));
# if TARGET_OS_VERSION_FOR_NPROF_TIMER == SUNOS_VERSION
  FILL_SLOT(accuracy,  as_floatOop(n->accuracy()));
# endif
}

class method_node_info : public node_info {
 public:
  slot_info selector, receiver, methodHolder, method;  
  
  method_node_info(oop node_pt) : node_info(node_pt) {
    selector.init(node_pt,      "selector");
    receiver.init(node_pt,      "receiver");
    methodHolder.init(node_pt, "methodHolder");
    method.init(node_pt,        "method");
  }

  void fill(graph_creator* c, oop node_oop, method_node* n);
};

void method_node_info::fill(graph_creator* c, oop node_oop, method_node* n) {
  node_info::fill(node_oop, n);
  FILL_SLOT(selector,      n->selector());
  FILL_SLOT(receiver,      c->oop_from_map(n->receiverMapOop()));
  FILL_SLOT(method,        (oop) n->method()->as_mirror());
  FILL_SLOT(methodHolder, c->oop_from_map(n->methodHolder_map()));
}

class block_node_info : public node_info {
 public:
  slot_info selector, method, outer;
  
  block_node_info(oop node_pt) : node_info(node_pt) {
    selector.init(node_pt, "selector");
    method.init(node_pt,   "method");
    outer.init(node_pt,    "outer");
  }

  void fill(oop node_oop, block_node* n, oop outer_oop);
};

void block_node_info::fill(oop node_oop, block_node* n, oop outer_oop) {
  node_info::fill(node_oop, n);
  FILL_SLOT(selector, n->selector());
  FILL_SLOT(method,   (oop) n->method()->as_mirror());
  FILL_SLOT(outer,    outer_oop);
};

class access_node_info : public node_info {
 public:
  slot_info selector, receiver, methodHolder;  
  
  access_node_info(oop node_pt) : node_info(node_pt) {
    selector.init(node_pt,      "selector");
    receiver.init(node_pt,      "receiver");
    methodHolder.init(node_pt, "methodHolder");
  }
  void fill(graph_creator* c, oop node_oop, access_node* n);
};

void access_node_info::fill(graph_creator* c, oop node_oop, access_node* n) {
  node_info::fill(node_oop, n);
  FILL_SLOT(selector,      n->selector());
  FILL_SLOT(receiver,      c->oop_from_map(n->receiverMapOop()));
  FILL_SLOT(methodHolder, c->oop_from_map(n->methodHolder_map()));
}

class prim_node_info : public node_info {
 public:
  slot_info selector;

  prim_node_info(oop node_pt) : node_info(node_pt) {
    selector.init(node_pt, "selector");
  }

  void fill(oop node_oop, prim_node* n);
};

void prim_node_info::fill(oop node_oop, prim_node* n) {
  node_info::fill(node_oop, n);
  FILL_SLOT(selector, n->selector());
}

class leaf_node_info : public node_info {
 public:
  leaf_node_info(oop node_pt) : node_info(node_pt) { }
};

graph_creator::graph_creator(call_graph_edge* e, MapTable* gm,     
                             oop method_pt,  oop block_pt, oop access_pt,
                             oop prim_pt,    oop leaf_pt,  oop fold_pt,
                             oop unknown_oop, smi cutoff_pct) 
  : graph_iterator(e) {

  graph_maps = gm;
  cutoff = top()->callee->user_time *  (float(cutoff_pct) / 100.0);


  // Save the prototypes
  method_node_pt = method_pt;
  block_node_pt  = block_pt;
  access_node_pt = access_pt;
  prim_node_pt   = prim_pt;
  leaf_node_pt   = leaf_pt;
  fold_edge_pt   = fold_pt;

  _unknown_oop   = unknown_oop;
  
  // Compute the slot info for all proto
  method_pt_info = new method_node_info(method_node_pt);
  block_pt_info  = new block_node_info(block_node_pt);
  access_pt_info = new access_node_info(access_node_pt);
  prim_pt_info   = new prim_node_info(prim_node_pt);
  leaf_pt_info   = new leaf_node_info(leaf_node_pt);
  fold_pt_info   = new fold_edge_info(fold_edge_pt);

  // path from the root in VM nodes and self nodes.
  node_path = new tree_edge_BList(200, true);
  oop_path  = new OopBList(200, true);

  out_of_memory = false;
  _root = NULL;
  parent = next_parent = NULL;
  index = 0;
}

void graph_creator::do_edge(call_graph_edge* e) {
  oop node_oop;
  if (e->is_fold_edge()) {
    node_oop = clone_fold_edge_pt((fold_edge*) e);
  } else {
    call_graph_node* n = e->callee;
    if (n->is_method_node()) {
      node_oop = clone_method_pt((method_node*) n);
    } else if (n->is_block_node()) {
      node_oop = clone_block_pt((block_node*) n);
    } else if (n->is_prim_node()) {
      node_oop = clone_prim_node_pt((prim_node*) n);
    } else if (n->is_access_node()) {
      node_oop = clone_access_node_pt((access_node*) n);
    } else if (n->is_leaf_node()) {
      node_oop = clone_leaf_node_pt((leaf_node*) n);
    } else {
      fatal("unexpected node type in call graph");
    }
  }
  if (node_oop == failedAllocationOop) {
    out_of_memory= true;
    return;
  }
  if (parent) {
    assert(parent->is_objVector(), "should be an objVector");
    // fill in an element in the parent vector
    objVectorOop p = objVectorOop(parent);
    assert( p->obj_at(index * 2    ) == NULL, "already there\n");
    assert( p->obj_at(index * 2 + 1) == NULL, "already there\n");
    p->obj_at_put(index * 2,     as_smiOop(e->bci));
    p->obj_at_put(index * 2 + 1, node_oop);
    index++;
  } 
  else {
    assert(_root == NULL, "_root already set");
    _root = node_oop;
  }
  
  next_parent = node_oop;
}


int graph_creator::do_sub_edges(call_graph_edge* e) {
  int edges = 0;

  if ( !ran_out_of_memory()  &&  e->callee->edges ) {
    int old_index  = index;
    oop old_parent = parent;

    parent = next_parent;
    node_path->push(e);
    oop_path->push(parent);

    index = 0;
    edges = graph_iterator::do_sub_edges(e);

    oop_path->pop();
    node_path->pop();
    index  = old_index;
    parent = old_parent;
  }
  return edges;
}

oop graph_creator::clone_method_pt(method_node* n) {
  int size = n->num_of_edges(cutoff);
  oop oop_node= method_node_pt->cloneSize(size * 2, CANFAIL);
  if (oop_node == failedAllocationOop) return failedAllocationOop;
  method_pt_info->fill(this, oop_node, n);
  return oop_node;
}

oop graph_creator::clone_block_pt(block_node* n) {
  int size = n->num_of_edges(cutoff);
  oop oop_node= block_node_pt->cloneSize(size * 2, CANFAIL);
  if (oop_node == failedAllocationOop) return failedAllocationOop;

  // find outer most lexical node
  oop o = n->outer_method();
  oop lex_oop = NULL;
  for (int i= node_path->length() - 1; i >= 0 && !lex_oop ; i--) {
    if (node_path->nth(i)->callee->is_method_node()) {
      method_node* mn = (method_node*) node_path->nth(i)->callee;
      if (mn->method() == o) lex_oop = oop_path->nth(i);
    }
  }

  if (!SpendTimeForDebugging) 
    assert(lex_oop, "lexical node should be on stack");
  else if (!lex_oop)  { 
    lprintf("\n\nlexical node should be on stack\n"); 
    lprintf("\n\nselector:\n");
    n->selector()->print();
    lprintf("\nnmethod\n");
    n->method()->print(); 
    lprintf("\n\nouter method\n");
    n->outer_method()->print();
    for (int i= node_path->length() - 1;  i >= 0 && !lex_oop;  --i) {
      lprintf("node %d in path:\n", i);
      if (node_path->nth(i)->callee->is_method_node()) {
        method_node* mn = (method_node*) node_path->nth(i)->callee;
        lprintf("\nselector\n");
        mn->selector()->print();
        lprintf("\nreceiverMapOop\n");
        mn->receiverMapOop()->print();
        lprintf("\nprint_map\n");
        mn->receiverMap()->print_map();
        lprintf("\nmethod\n");
        mn->method()->print();
        lprintf("\n\n");
      }
    }
    warning1("method = 0x%x\n\n", o); 
  }

  block_pt_info->fill(oop_node,  n,  lex_oop ? lex_oop : Memory->nilObj);
  return oop_node;
} 

oop graph_creator::clone_prim_node_pt(prim_node* n) {
  int size = n->num_of_edges(cutoff);
  oop oop_node= prim_node_pt->cloneSize(size * 2, CANFAIL);
  if (oop_node == failedAllocationOop) return failedAllocationOop;
  prim_pt_info->fill(oop_node, n);
  return oop_node;
}

oop graph_creator::clone_access_node_pt(access_node* n) {
  oop oop_node= access_node_pt->clone(CANFAIL);
  if (oop_node == failedAllocationOop) return failedAllocationOop;
  access_pt_info->fill(this, oop_node, n);
  return oop_node;
}

oop graph_creator::clone_leaf_node_pt(leaf_node* n) {
  oop oop_node= leaf_node_pt->clone(CANFAIL);
  if (oop_node == failedAllocationOop) return failedAllocationOop;
  leaf_pt_info->fill(oop_node, n);
  return oop_node;
}

oop graph_creator::clone_fold_edge_pt(fold_edge* e) {
  oop oop_node= fold_edge_pt->clone(CANFAIL);
  if (oop_node == failedAllocationOop) return failedAllocationOop;

  // find the fold node
  oop fold_oop = NULL;
  for (int i = node_path->length() - 1; i >= 0 && !fold_oop ; i--) {
    if(node_path->nth(i)->callee == e->callee) fold_oop = oop_path->nth(i);
  }
  assert(fold_oop,"fold node should be on stack");

  fold_pt_info->fill(oop_node, e, fold_oop);
  return oop_node;
}

oop graph_creator::oop_from_map(oop m) {
  assert( m->is_map(), "Expecting a map");
  mapOop mo = (mapOop) m;

  Map* map = mo->map_addr();
  if (map->is_smi() || map->is_float()) return map->dummy_obj(_unknown_oop);
  assert(map->is_slots() || map->is_block(), "expected to be slots");

  // A hash table would help speedup this search.
  oop obj = graph_maps->find(mo);
  if (obj) return obj;

  // Create an object based on the map.
  obj = map->dummy_obj(_unknown_oop);
  if (!graph_maps->insertIfAbsent(mo, obj)) {
    graph_maps->update(mo, obj);
  }
  return obj;
}

class map_collector : public graph_iterator {
 protected:
  MapTable* graph_maps;
  void add_map(oop mo);
 public:
  map_collector(call_graph_edge* e, MapTable* gm);
  void do_edge(call_graph_edge* e);
};

map_collector::map_collector(call_graph_edge* e, MapTable* gm)
: graph_iterator(e) {
  graph_maps = gm;
}
 
void map_collector::add_map(oop mo) {
  static bool warned = false;
  if (CheckAssertions  &&  !warned  &&  mo == NULL) {
    warning("collector::add_map: NULL mo (should never happen)\n");
    warned = true;
    return;
  }
  assert(mo->is_map(), "should be a map");
  Map* map = ((mapOop) mo)->map_addr();
  if (map->is_smi()   ||
      map->is_float() ||
      map->is_block() ) return; 

  graph_maps->insertIfAbsent((mapOop) mo);
}

void map_collector::do_edge(call_graph_edge* e) {
  if (!e->is_fold_edge()) {
    call_graph_node* n = e->callee;
    if (n->is_method_node()) {
      add_map(((method_node*) n)->receiverMapOop());
      add_map(((method_node*) n)->methodHolder_map());
    } else if (n->is_access_node()) {
      add_map(((access_node*) n)->receiverMapOop());
      add_map(((access_node*) n)->methodHolder_map());
    }
  }
}

class map_enumeration : public enumeration {
 public:
  MapTable* graph_maps;
  map_enumeration(MapTable* gm);
  void enumerate();
  void add_obj(oop obj);
  void filter_match(oopsOop obj, oop* matching_cell, smi targetNo) {
    Unused(obj); Unused(matching_cell); Unused(targetNo);
    ShouldNotCallThis(); }
  void filter_map(mapOop obj) {
    Unused(obj); ShouldNotCallThis(); }
};

map_enumeration::map_enumeration(MapTable* gm)
 : enumeration((unsigned long)AllBits) {
  graph_maps = gm;
  // add all maps in gm
  for (fint i = 0; i < gm->size; i++) {
    for (MapTableEntry* link = gm->table[i]; link; link = link->next) {
      add_map(link->map->map_addr());
    }
  }
}

void map_enumeration::enumerate() {
  if (map_count > 0) {
    pack_maps();
    Memory->enumerate_families(this);
    processes->enumerate_families(this);
  }
}

void map_enumeration::add_obj(oop obj) {
  assert(graph_maps->member(obj->map()->enclosing_mapOop()), "map should be known");
  if (!graph_maps->find(obj->map()->enclosing_mapOop())) {
    if (obj->is_block()) {
      // TO BE FIXED WHEN THE SIC IS BETTER TO KILL BLOCK OOPS WHEN
      // A SCOPE TREMINATE. 3/31/93 LB.
      // Clone and kill the copy to avoid the problem.
      obj = obj->clone(); 
      blockOop(obj)->kill_block();
    }
    graph_maps->update(obj->map()->enclosing_mapOop(), obj);
  }
}

static map_collector* _collector;
static void cont_collect() { _collector->do_it(); }

static graph_creator* _creator;
static void cont_copy() { _creator->do_it(); }

oop Profiler::copy_call_graph(oop method_pt, oop block_pt, oop access_pt,
                              oop prim_pt,   oop leaf_pt,  oop fold_pt,
                              oop unknown_oop,
                              smi cutoff_pct) {
  ResourceMark rm;

  if ( ProfilerIgnoreCallGraph  ||  !root->edges ) {
    // If the call graph is ignored the root contains the
    // accumulated timing and allocation information
    
    if (!this->root->edges)
      warning("Profiler::copy_call_graph: root edges are NULL, profiled program probably was too brief");
    
    oop node = leaf_pt->clone(CANFAIL);
    if (node == failedAllocationOop) return failedAllocationOop;
    leaf_node_info* leaf_pt_info = new leaf_node_info(leaf_pt);
    leaf_pt_info->fill(node, root);
    return node;
  }
  
  if ( PrintProfiling ) {
    // Old debugging code; checking for multiple roots -- dmu 2/04
    int c; float t;
    graph_totaller::compute_totals(root_edge, c, t);
    lprintf("in copy_call_graph: count = %d, time = %g\n", c, t);
    lprintf(" and root and rootedge are ");
    {
      for (call_graph_edge* e = root_edge;  e; e = e->next) {
        e->callee->print_node(), lprintf("\n");
          for (call_graph_edge* ee = e->callee->edges;  ee; ee = ee->next)
            lprintf("     "),  ee->callee->print_node(), lprintf("\n");
      }
    }
    lprintf("\n\n");
  }

  // Prepare for the enumeration by collecting all referred maps in the graph.
  MapTable graph_maps; 
  { 
    ResourceMark rm2;
    map_collector collector(this->root->edges, &graph_maps);
    _collector = &collector;
    switchToVMStack(cont_collect);
  }

  // Enumerate the maps
  {
    ResourceMark rm2;
    map_enumeration enumeration(&graph_maps);
    enumeration.enumerate();
  }
  
  graph_creator creator(this->root->edges, &graph_maps,
                        method_pt, block_pt, access_pt,
                        prim_pt,   leaf_pt,  fold_pt, unknown_oop, cutoff_pct);

  // Do the recursive graph traversal on the VM stack.
  _creator = &creator;
  switchToVMStack(cont_copy);

  graph_maps.deallocate();
  
  return creator.ran_out_of_memory() ? failedAllocationOop : creator.root();
}

class tick_info {
 public:
  slot_info inSemaphore, inSelf, inLookup,
            inPrim, inProfiler, inConversion;

  tick_info(oop tick_pt) {
    inSemaphore.init(tick_pt, "inSemaphore");
    inSelf.init(tick_pt,      "inSelf");
    inLookup.init(tick_pt,    "inLookup");
    inPrim.init(tick_pt,      "inPrim");
    inProfiler.init(tick_pt,  "inProfiler");
    inConversion.init(tick_pt,"inConversion");
  }

  void fill(oop node_oop, Profiler *p) {
    FILL_SLOT(inSemaphore, as_smiOop(p->sem_ticks.num));
    FILL_SLOT(inSelf,      as_smiOop(p->self_ticks.num));
    FILL_SLOT(inLookup,    as_smiOop(p->lookup_ticks.num));
    FILL_SLOT(inPrim,      as_smiOop(p->prim_ticks.num));
    FILL_SLOT(inProfiler,  as_smiOop(p->profiler_ticks.num));
    FILL_SLOT(inConversion,as_smiOop(p->conversion_ticks.num));
  }
};

oop Profiler::copy_tick_info(oop tick_pt) {
  // Make a copy of the prototype.
  oop tick_node= tick_pt->clone(CANFAIL);
  if (tick_node == failedAllocationOop) return failedAllocationOop;

  tick_info  t(tick_pt);

  t.fill(tick_node, this);
  return tick_node;
}

class time_info {
 public:
  slot_info runtime, collect, build, 
            monitor, scavenge, garbageCollect, 
            compile, recompile, uncommon, 
            methodFlush, methodCompact;

  time_info(oop time_pt) {
    runtime.init(time_pt,        "runtime");
    collect.init(time_pt,        "collect");
    build.init(time_pt,          "build");

    monitor.init(time_pt,        "monitor");
    scavenge.init(time_pt,       "scavenge");
    garbageCollect.init(time_pt, "garbageCollect");

    compile.init(time_pt,        "compile");
    recompile.init(time_pt,      "recompile");
    uncommon.init(time_pt,       "uncommon");

    methodFlush.init(time_pt,    "methodFlush");
    methodCompact.init(time_pt,  "methodCompact");
  }

  void fill(oop node_oop, Profiler *p) {
    FILL_SLOT(runtime,        as_floatOop(p->root->user_time));

#   if  TARGET_OS_VERSION_FOR_NPROF_TIMER == SOLARIS_VERSION
    FILL_SLOT(collect,
              as_floatOop(p->collect_time.milli_secs_as_float()));
    FILL_SLOT(build,
              as_floatOop(p->prof_time.milli_secs_as_float()));
#   elif  TARGET_OS_VERSION_FOR_NPROF_TIMER ==  SUNOS_VERSION
    FILL_SLOT(collect,        as_floatOop(p->collect_timer.millisecs()));
    FILL_SLOT(build,          as_floatOop(p->prof_timer.millisecs()));
#   endif
    FILL_SLOT(monitor,        as_floatOop(p->monitor_tick_time));
    FILL_SLOT(scavenge,       as_floatOop(p->scavenging_time));
    FILL_SLOT(garbageCollect, as_floatOop(p->garbage_collection_time));

    FILL_SLOT(compile,        as_floatOop(p->compile_time));
    FILL_SLOT(recompile,      as_floatOop(p->recompile_time));
    FILL_SLOT(uncommon,       as_floatOop(p->uncommon_branch_time));

    FILL_SLOT(methodFlush,    as_floatOop(p->nmethod_flush_time));
    FILL_SLOT(methodCompact,  as_floatOop(p->nmethod_compact_time));
  }
};

oop Profiler::copy_time_info(oop time_pt) {
  // Make a copy of the prototype
  oop time_node= time_pt->clone(CANFAIL);
  if (time_node == failedAllocationOop) return failedAllocationOop;

  time_info  t(time_pt);

  t.fill(time_node, this);
  return time_node;
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

