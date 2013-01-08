/* Sun-$Revision: 30.14 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

// structs for the call graph produced by the profiler.
// a call graph consists of nodes connected with edges.

// call_graph_node
// - primitive_node
// - method_node
// - access_node
// - block_node
// - send_node

// call_graph_edge
// - fold_edge
// - node_edge

typedef void (*call_graph_nodeDoFn)(call_graph_node* n);
class fold_edge;
class node_filter;
class NewNodeList;


class call_graph_node : public CHeapObj {
 public:
  call_graph_edge* edges; // outgoing edges

  NewNodeList* my_new_list;

  fint  block_clones;    // Number of block clones
  fint  bytes_allocated; // Number of bytes allocated

  float user_time;       // milliseconds

  float optimized_user_time;

# if TARGET_OS_VERSION_FOR_NPROF_TIMER ==  SUNOS_VERSION
  // On SunOS the user_time is computed using both the user timer and
  // the elapsed timer to compensate for the coarse user timer.
  // uncertain_user_time contains the accuracy of the user_time.
  float uncertain_user_time; 

  float accuracy() {
    return user_time == 0.0 ? 1.0 : 100.0 * uncertain_user_time / user_time;
  }
# endif

  virtual bool is_prim_node()   { return false; }
  virtual bool is_method_node() { return false; }
  virtual bool is_access_node() { return false; }
  virtual bool is_block_node()  { return false; }
  virtual bool is_leaf_node()   { return false; }

  float optimized() {
    return user_time == 0.0 ? 0.0 : optimized_user_time / user_time;
  }

  void add_optimized(float time) { optimized_user_time += time;  }
  void add_user_time(float time) { user_time           += time;  }
  void add_bytes(fint num)       { bytes_allocated     += num;   }
  void add_blocks(fint num)      { block_clones        += num; }

  call_graph_node();
  virtual ~call_graph_node();

  int num_of_edges(float cutoff);

  virtual bool is_matching(call_graph_node* n) = 0;

  void add_edge(call_graph_edge* e);

  call_graph_edge* find_matching(int bci, call_graph_node* n);
  call_graph_edge* find_matching(int bci, stringOop sel);
  call_graph_edge* find_leaf(int bci);

  fold_edge* find_fold_edge(int bci, call_graph_node* n);

  virtual call_graph_node* clone() = 0;

  virtual void print_node(bool verbose = false) = 0;

  // Memory management
  void scavenge_contents();
  void scavenge_contents_quickly();
  void gc_mark_contents();
  void gc_unmark_contents();
  void switch_pointers(oop from, oop to);

  virtual bool is_new() = 0;

  virtual void oops_do(oopsDoFn f) { Unused((void*)f); };

  bool verify();
};

class prim_node : public call_graph_node {
  // instance variables characterizing the call node.
 private:
  stringOop _selector;

 public:
  prim_node(oop sel);
  prim_node(prim_node* pn);
  bool is_prim_node() { return true; }
  call_graph_node* clone();

  stringOop selector() { return _selector; }

  bool is_matching_sel(stringOop sel) { return selector() == sel; }
  bool is_matching(call_graph_node* n);

  void print_node(bool verbose = false);
  bool is_new();
  void oops_do(oopsDoFn f);
};

class leaf_node : public call_graph_node {
 public:
  // incomplete sends or prologue/epilog of a method
  leaf_node();
  bool is_leaf_node() { return true; }
  call_graph_node* clone();

  bool is_matching(call_graph_node* n) { return n->is_leaf_node(); }
  void print_node(bool verbose = false);
  bool is_new() { return false; }
};

class method_node : public call_graph_node {
 private:
  stringOop _selector;
  mapOop    _receiverMapOop;
  oop       _methodHolder_map;
  oop       _method;

 public:
  method_node(ScopeDesc*sd);
  method_node(method_node* mn);
  bool is_method_node() { return true; }
  call_graph_node* clone();

  stringOop selector()        { return _selector; }
  mapOop    receiverMapOop()  { return _receiverMapOop; }
  Map*      receiverMap()     { return receiverMapOop()->map_addr(); }   
  oop       methodHolder_map()   { return _methodHolder_map; }

  oop  method() { return _method; };

  bool is_matching(call_graph_node* n);

  void print_node(bool verbose = false);
  bool is_new();
  void oops_do(oopsDoFn f);
};

class access_node : public call_graph_node {
 private:
  stringOop _selector;
  mapOop    _receiverMapOop;
  oop       _methodHolder_map;

 public:
  access_node(ScopeDesc*sd);
  access_node(access_node* mn);
  bool is_access_node() { return true; }
  call_graph_node* clone();

  stringOop selector()        { return _selector; }
  mapOop    receiverMapOop()  { return _receiverMapOop; }
  Map*      receiverMap()     { return receiverMapOop()->map_addr(); }
  oop       methodHolder_map()   { return _methodHolder_map; }

  bool is_matching(call_graph_node* n);

  void print_node(bool verbose = false);
  bool is_new();
  void oops_do(oopsDoFn f);
};

class block_node : public call_graph_node {
 private:
  stringOop    _selector;
  oop          _method;

 public:
  block_node(ScopeDesc* sd);
  block_node(block_node* bn);

  bool is_block_node() { return true; }
  call_graph_node* clone();

  bool is_matching(call_graph_node* n);

  stringOop selector() { return _selector; }
  oop method()         { return _method; }
  oop outer_method();

  void print_node(bool verbose = false);
  bool is_new();
  void oops_do(oopsDoFn f);
};

class call_graph_edge : public CHeapObj {
 public:
  call_graph_edge* next;  // sibling

  call_graph_node* callee; 
  int              bci;

  call_graph_edge(fint bci, call_graph_node* callee = 0);
  virtual ~call_graph_edge();

  virtual bool is_fold_edge()  { return false; }

  bool is_matching_node(fint bci, call_graph_node* n);
  bool is_matching_sel(fint bci, stringOop sel);
  bool is_matching_leaf(fint bci);
  
  bool is_significant(float cutoff)  { return callee->user_time >= cutoff; }
};


class fold_edge : public call_graph_edge {
 public:
  fint _counter;
  fint _num, _min, _max, _sum;  

 public:
  fold_edge(fint bci, call_graph_node* callee);
  ~fold_edge();
  bool is_fold_edge() { return true; }

  void print_node(bool verbose = false);

  fint min() { return _min; }
  fint max() { return _max; }
  float average();

  void inc() { _counter++; }
  void update();
};


class graph_iterator {
 private:
  int  _depth;
  call_graph_edge* _top;
  
 protected:
  float cutoff; // cutoff user time
  
 public:
  graph_iterator(call_graph_edge* e);
  virtual void do_edge(call_graph_edge* e) { Unused(e); }
  virtual int  do_sub_edges(call_graph_edge* e);

  int  depth()           { return _depth; }
  call_graph_edge* top() { return _top; }
  virtual void do_it();  // start the iteration
};

// default filter for dumping the call graph on stdout

class graph_dumper : public graph_iterator {
 private:
  bool _verbose; 
  bool verbose() { return _verbose; }
  float _cut_off;
  float cut_off() { return _cut_off; }

  float user_time;
  fint  block_clones;
  fint  bytes_allocated;
 public:
  graph_dumper(call_graph_edge* e, float cut = 0.01, bool verbose = false);
  void do_edge(call_graph_edge* e);
  int  do_sub_edges(call_graph_edge* e);
};


// Checker to help me find a bug

class graph_totaller : public graph_iterator {
 public:
  float total_user_time;
  int node_count;
  
  graph_totaller(call_graph_edge* e) : graph_iterator(e) {
    total_user_time = 0.0;
    node_count      = 0;
  }
  
  void do_edge(call_graph_edge* e) {
    total_user_time += e->callee->user_time;
    ++node_count;
  }
  
  // override cause don't need qsort
  int  do_sub_edges(call_graph_edge* e) {
    for(call_graph_edge* s = e->callee->edges; s; s = s->next)
      do_edge(s);
    return 0;
  }
  
  static void compute_totals(call_graph_edge* e, int& c, float& t) {
    graph_totaller gt(e);
    gt.do_it();
    c = gt.node_count;
    t = gt.total_user_time;
  }
};  
  



// NewNodeList caches nodes containing new oops to optimize scavenging

typedef void (*call_graph_nodeDoFn)(call_graph_node* n);

class NewNodeList : public CHeapObj {
 private:
  call_graph_node** list;
  fint size;
  fint end;
  
  void appendNode(call_graph_node* n);
  void removeAt(int i);
  
 public:
  NewNodeList(fint initial_size);
  ~NewNodeList();
  int num();
  void insert(call_graph_node* n);
  void remove(call_graph_node* n);
  bool member(call_graph_node* n);
  void nodes_do(call_graph_nodeDoFn f);
  bool verify();
};


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
