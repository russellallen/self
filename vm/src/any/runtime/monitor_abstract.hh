/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// monitor monitors system activity ("Self spy")

// the platform-specific one should be typedefed to monitor

class memBarDesc;
class cpuBarDesc;
class sampledBarDesc;
class zoneBarDesc;
class Indicator;
class SharedIndicator;

enum SYS_state { nothing,
                 reading, writing, disk_IO, disk_in, disk_out, in_unix, idle};

class abstract_monitor: public CHeapObj {
 friend class barDesc;
 friend class sampledBarDesc;

 protected:
  virtual bool openWindow();
  virtual bool handleEvents();

 public:
  fint loadLevel;               // [0..100]; 50 = we're missing half the ticks
  int32 totalTickNo;            // # of ticks since start
  int32 usedTicks;              // # of ticks of CPU used since start
  fint elapsedTicks;            // ticks since last screen update
  fint ticks_per_second;
  
  
 protected: 
  // for unix, _allocated starts at 0, and is updated by malloc/free
  // for mac,  _allocated starts at FreeMem(), and allocated() is _allocated - FreeMem()
  int32 _allocated;             // bytes allocated with malloc()
  
  Indicator* page;
  bool paging;
  SYS_state systemState;
  SharedIndicator* sys;
  
 protected:
  void showPaging(long how_many);
  void hidePaging();
  
 public:
  bool showSends;               // show optional info on sends / blocks?
  bool incremental;             // set to true if nobody else will draw in
                              // our portion of the screen
  bool active;          // true if spy is running
  int32 tickNo;         // # of tick within this second
  FILE* logf;                   // log file
  const char* logfn;          // log file name

  abstract_monitor();
  ~abstract_monitor();

  virtual void set_oldT() {}
  
  void closeWindow();
  void tick_measure();
  virtual void tick_redraw() = 0;
  virtual void get_interrupted_frame_and_pc( frame*& f, char*& pc ) {
    f = NULL;  pc = NULL; }
  virtual bool get_graphics_semaphore() { return false; }
  void show_activities();
  virtual void show_os_stuff();
  void show_sends();
  void update_time_bars();
  void update_load_level();
  virtual fint compute_load_level() { return 0; }
  virtual int32 allocated() = 0;
  void reset();         // for AbortProcess etc.

  fint max_height() {return 0;};                // height of monitor in pixels

  // to adjust "size" of C-Heap; 0 means reset to zero, < 0 make smaller etc
  void resetCHeapValue(int32 delta = 0);
  
  virtual void reset_allocated();

  // components
  memBarDesc* eden;
  memBarDesc* from;
  memBarDesc* to;
  int nOld;
  memBarDesc **old;
  
# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)
  zoneBarDesc* iZone;
  zoneBarDesc* dZone;
  zoneBarDesc* sZone;
  zoneBarDesc* picZone;
  
# endif

      cpuBarDesc*      cpuBar;
  sampledBarDesc*     selfBar;
  sampledBarDesc*   lookupBar;
  sampledBarDesc* compilerBar;
  sampledBarDesc*       vmBar;
  sampledBarDesc*   accessBar;
  
  int bpp;
  int pixelsPerMb;
  int mem_usage_line_len;
  int ruler_len;
  
  bool          spyIsMono;

  void mem_reserve_changed() { mem_usage_line_len= 0; }

// the following are defined in class "monitor" so they
//  can use macros & inlines instead of virtuals
public:
  void activate(const char* filename = NULL) {
    Unused(filename); SubclassResponsibility(); }
  void adjust_after_resize();
 protected:
  virtual void resizeMZBars() = 0;
  virtual void set_bytes_per_pixel() = 0;
  
  // to optimize, make this virt and callees nonvirt
  void pre_redraw() {}
  void post_redraw() {}
  
public:
  virtual void addOldBar(oldSpace *s) = 0;
protected:
  virtual void draw_mem_usage_line(bool b) = 0;
  virtual void draw_reserve_lines() = 0;
  virtual void draw_memory_ruler() = 0;
  
  virtual void enroll()   = 0;
  virtual void withdraw() = 0;
   
protected:

  virtual int get_ticks_per_second();

  friend class Indicator;
  friend class oldGeneration;
  friend void selfs_free(void* ptr);
  
// former inlines, dummy versions here

protected:
  int screen_width() { return 1; }
  int window_width() { return 1; }
  int screen_height() { return 1; }
  int window_height() { return 1; }
  
  int font_w() { return 1; }
  int font_h() { return 1; }
  
  void set_port()   {}
  void reset_port() {}
  
  void draw_text(const char* /*text*/, int /*x*/, int /*y*/) {}
  void clear_rectangle(int /*x*/, int /*y*/, int /*w*/, int /*h*/) {}
  void  draw_square(int /*x*/, int /*y*/, int /*s*/) {}
  void clear_square(int /*x*/, int /*y*/, int /*s*/) {}
  void draw_line(int /*x1*/, int /*y1*/, int /*x2*/, int /*y2*/) {}
  void set_color(int /*c*/) {}
  void set_thickness(int /*t*/) {}
  
  void fill_rectangle(int /*x*/, int /*y*/, int /*w*/, int /*h*/) {}
  void fill_rectangle_white(int /*x*/, int /*y*/, int /*w*/, int /*h*/) {}
  void draw_rectangle_black(int /*x*/, int /*y*/, int /*w*/, int /*h*/) {}
  
  void set_xor()   {}
  void set_copy()  {}


// spy log file operations

 public:
   static oop   resetLog_prim(oop rcvr);  
   static oop   annotateLog_prim(oop rcvr);
 protected:
   static FILE* openLogFile(const char* filename);
   static void set_log_buf(FILE* /*f*/, char* /*buf*/, int /*bs*/) {}
};


extern fint lookupNesting;      // > 0 means lookup in progress
class showLookup {
 public:
  showLookup()  { lookupNesting++; }
  ~showLookup() { lookupNesting--; }
};

extern const char* methodBeingCompiled;

class showCompile: CHeapObj {
  void doShowCompile(oop selector, const char* compiler, bool opt);
public:
  showCompile(oop selector, const char* compiler, bool optimize);
  ~showCompile();
};

class showVMActivity: CHeapObj { 
  const char* oldActivity;
public:
  showVMActivity(const char* what);
  ~showVMActivity();
};


// keeps a sliding average over the last N values
class SlidingAverage : public CHeapObj {
  int32* values;
  fint n;           // window size
  fint index;       // next value to use
  int32 _sum;       // sliding sum
 public:
  SlidingAverage(fint N) {
    assert(N > 0, "must be positive");
    n = N; values = (int32*)AllocateHeap(N * sizeof(int32), "spy avg"); reset();
  }
  ~SlidingAverage() { delete values; }
  void reset() { 
    index = 0; _sum = 0;
    for (fint i = 0; i < n; i++) values[i] = 0;
  }
  void add(int32 v) {
    _sum -= values[index];  values[index] = v; _sum += v;
    index = index == n - 1 ? 0 : index + 1;
  }
  int32 average() { return _sum / n; }
  int32 sum()     { return _sum; }
};

void monitor_tick_measure();
void monitor_tick_redraw();

  // ******************* action indicators *********************
  
  class Indicator: public CHeapObj {
   protected:
    fint x, y, w;
    bool visible;
    void draw_under();
   public:
    Indicator();
    virtual void reposition(fint X, fint Y, fint W);
    virtual void show(const char *text);
    virtual void show() { SilenceOverrideWarning(); }
    virtual void show(const char *text, fint new_state)  { 
      Unused(text); Unused( new_state ); SilenceOverrideWarning(); }
    virtual void show(const char *name, const char* compiler, bool recompiling) {
      Unused(name); Unused(compiler); Unused(recompiling);
      SilenceOverrideWarning(); }

    void hide();
  };
  
  class IndicatorLabel : public Indicator {
   private:
    const char* text;
   public:
    IndicatorLabel(const char* t) { text = t; }
    void show() { Indicator::show(text); }
  };

  class SharedIndicator : public Indicator {
   private:
    fint state;
   public:
    SharedIndicator();
    void show(char *text, fint new_state);
    void hide();
  };
  
  
  class CompileIndicator : public Indicator {
#   define COMPILE_LEN 100
   private:
    char name[COMPILE_LEN];
   public:
    CompileIndicator() : Indicator() {};
    void show(const char* name, const char* compiler, bool recompiling);
  };
  
  
  class ValueIndicator : public Indicator {
   protected:
    const char* text;         // text string (with room at end for number)
    int32 lastVal;      // last value shown
    SlidingAverage* data;
    fint digits;        // number of digits
    fint offset;        // offset of last digit (from right end of string)
    bool showSum;       // show sliding sum instead of average
   public:
    bool changed;       // redrawn during last update() ?
    ValueIndicator(const char* t, bool sum, fint d, fint n = 1, fint off = 0) {
      text = OS::strdup(t); showSum = sum; lastVal = -1; digits = d; offset = off;
      data = new SlidingAverage(n);
    }
    void reposition(fint X, fint Y, fint W) {
      Indicator::reposition(X, Y, W); show(); }
    void show() { Indicator::show(text); }
    virtual void update(int32 newVal, bool incremental);
    int32 value() { return lastVal; }
  };

  class DifferenceIndicator : public ValueIndicator {
   protected:
    int32 lastSum;      // last sum shown
   public:
    DifferenceIndicator(const char* t, fint d, fint n = 1, fint off = 0)
      : ValueIndicator(t, d, n, off) { lastSum = -1; }
    void update(int32 newSum, bool incremental);
  };
