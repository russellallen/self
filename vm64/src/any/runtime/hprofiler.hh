/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



// a simple hierarchical profiler for Self

// primitives
oop  PrintProfile_prim(oop rcvr, float cutoff, float skip, smi maxDepth);
oop  ResetProfile_prim(oop rcvr);
oop  Profile_prim(oop p, bool on);

class pnode;

class HProfiler: public CHeapObj {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  pnode* top;
  Process* p;
  int32 ticks;
  int32 gcTicks;
  int32 compilerTicks;
  int32 lookupTicks;
  int32 primTicks;

 public:
  void reset();
  void start(Process* p);
  void stop();
  void tick();
  bool inactive() { return !this || !top || !p; }


  void sort();
  void print_hp(float cutoff, float skip, smi depth);

  friend class pnode;
  
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

 public:
# if !defined(FAST_COMPILER) && !defined(SIC_COMPILER)
  bool inactive() { return true; }
# endif

  HProfiler();
 
  // memory functions
  void oops_do(oopsDoFn f);
  void scavenge_contents();
  void gc_mark_contents();
  void gc_unmark_contents();
  void switch_pointers(oop from, oop to);
  bool verify();

};

extern HProfiler* hprofiler;
void initHProfiler();
