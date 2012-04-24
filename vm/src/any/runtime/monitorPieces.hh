/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// Pieces of the spy.
// These classes are needed by the spy, but not references by the rest of the VM.

// First, non-graphical pieces. These are called by the spy
// to figure out what has been going on.
// They in turn call out to the VM:



class ProcessTime {
  friend class ProcessInfo;
  
 private:
  int _secs;
  int _nano_secs;
  
 public:
  void clear()     { _secs = _nano_secs = 0; }
  int secs()       { return _secs; }
  int nano_secs()  { return _nano_secs; }
  int micro_secs() { return _nano_secs / 1000; }
  int milli_secs() { return secs() * 1000 + micro_secs() / 1000; }
  float milli_secs_as_float() {
    return   ((float) secs())      * 1000.0
           + ((float) nano_secs()) / 1000000.0; }
  float secs_as_float() {
    return   ((float) secs())
           + ((float) nano_secs()) * 1e-9; }
  ProcessTime operator-(const ProcessTime& t);
  ProcessTime operator+(const ProcessTime& t);
  static ProcessTime get_real_time();
};


// Interface to the resource utilization for the running process.
class ProcessInfo /* AllStatic */ {
 public:
  // Takes a snapshot of the current resource utilization.
  static void  update();

  // Returns the number of page faults requiring physical I/O.
  static int page_faults_IO();
  // Returns the number of page faults NOT requiring physical I/O.
  static int page_faults_NonIO();

  // Returns the number of block input operations.
  static int block_input_operations();
  // Returns the number of block output operations.
  static int block_output_operations();

  // Returns the number of forces context switches.
  static int forced_context_switches();
  // Returns the number of volunatry context switches.
  static int voluntary_context_switches();
  
  // Returns the user time.
  static ProcessTime user_time();
  // Returns the system time.
  static ProcessTime system_time();
};



class OSActivityMonitor {
 public:
  enum SystemState { nothing,
                     reading, writing, disk_IO, disk_in, disk_out, in_os, idle};
  static OSActivityMonitor::SystemState activity();
  static const char* state_string(OSActivityMonitor::SystemState);
};



class LoadLevelMonitor {
 public:
  static void initialize();
  static void  compute_load_level();
  static fint  load_level;  // [0..100]; 50 = we're missing half the ticks
};


class ResourceAreaMonitor {
 public:
  static bool  is_consistent();
  static int32 used();
};


class InterruptedFrameMonitor {
 public:
  static void  get_frame_and_pc( frame*& f, char*& pc );
};


// Now. the graphical pieces:

// ******************* action indicators *********************

// Shows some text
class Indicator: public CHeapObj {
 protected:
  fint x, y, w;
  bool visible;
  void draw_under();
 public:
  Indicator();
  virtual void reposition(fint X, fint Y, fint W);
  // C++ compiler gives warnings, forcing me to change the names
  virtual void show(const char *text);
  void hide();
};


// Constant text
class IndicatorLabel : public Indicator {
 private:
  const char* text;
 public:
  IndicatorLabel(const char* t) { text = t; }
  void show() { Indicator::show(text); }
  void show(const char* t) {Indicator::show(t);} // silence STUPID C++ warning
};


class SharedIndicator : public Indicator {
 private:
  fint state;
 public:
  SharedIndicator();
  void show(const char *text, fint new_state);
  void show(const char* t) {Indicator::show(t);} // silence STUPID C++ warning
  void hide();
};


class SlidingAverage;

class ValueIndicator : public Indicator {
 protected:
  char* text;         // text string (with room at end for number)
  int32 lastVal;      // last value shown
  SlidingAverage* data;
  fint digits;        // number of digits
  fint offset;        // offset of last digit (from right end of string)
  bool showSum;       // show sliding sum instead of average
 public:
  bool changed;       // redrawn during last update() ?
  ValueIndicator(const char* t, bool sum, fint d, fint n = 1, fint off = 0);
  void reposition(fint X, fint Y, fint W) {
    Indicator::reposition(X, Y, W); show(); }
  void show() { Indicator::show(text); }
  void show(const char* t) {Indicator::show(t);} // silence STUPID C++ warning
  virtual void update(int32 newVal, bool incremental);
  int32 value() { return lastVal; }
  
 protected:
  static void printWithCommas( char* s, fint length, fint offset, int32 n);
};

class DifferenceIndicator : public ValueIndicator {
 protected:
  int32 lastSum;      // last sum shown
 public:
  DifferenceIndicator(const char* t, fint d, fint n = 1, fint off = 0)
    : ValueIndicator(t, d, n, off) { lastSum = -1; }
  void update(int32 newSum, bool incremental);
};


class CompileIndicator : public Indicator {
  friend class SelfMonitor; // uses compile_len

 private:
  static const int compile_len = 100;
  char name[compile_len];
 public:
  CompileIndicator() : Indicator() {};
  void show(const char* name, const char* compiler, bool recompiling);
  void show(const char* t) {Indicator::show(t);} // silence STUPID C++ warning
};


// A MonitorBar represents a bar displaying a space's allocation status.
// Spaces have a lower and an upper part (growing in opposite directions);
// the latter can be of size 0 (e.g. the zone)
class MonitorBar: public CHeapObj {
public:
  fint x, y, w, h;
protected:
  fint old_len_1, old_len_2;
  fint in_core_percentage_1;     // % of space in real memory [0..100]
  fint in_core_percentage_2;
public:
  MonitorBar();
  void resize(fint X, fint Y, fint W, fint H);
  virtual void init();
  void draw(bool incremental);
  virtual void draw_long_term(bool mustDraw) { Unused(mustDraw); }
  virtual void calculate_VM_stats();    // update in_core_percentage
  
  virtual int32 capacity() = 0;
  virtual int32 used1()    = 0;
  virtual int32 used2()    { return 0; }

protected:
  virtual char* start1() = 0;
  virtual char* start2() { return NULL; }
  
  void  calculateVMRegion( int32 startAddr,
                           int32 size, 
                           fint& in_core_percentage,
                           fint& oldlen);
};


class MonitorMemBar : public MonitorBar {
private:
  space *s;
public:
  MonitorMemBar(space *S) : MonitorBar() { s = S; init(); }
  int32 capacity()   { return s->capacity(); }
  int32 used1()      { return s->oops_used() * sizeof(oop); }
  int32 used2()      { return s->bytes_used(); }
  char* start1()   { return (char*) s->oopsStart(); }
  char* start2()   { return s->bytesStart(); }
  void resize(fint X, fint Y, fint H, fint factor);
};
  
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

class MonitorZoneBar : public MonitorBar {
private:
  Heap* z;
public:
  MonitorZoneBar(Heap* Z) : MonitorBar() { z = Z; }
  int32 capacity()   { return z->capacity(); }
  int32 used1()      { return z->usedBytes(); }
  char* start1()   { return z->startAddr(); }
  void resize(fint X, fint Y, fint H, fint factor, Heap *newZ= NULL);
};


class MonitorCodeCacheBar : public MonitorZoneBar {
public:
  MonitorCodeCacheBar(Heap *Z) : MonitorZoneBar(Z) { }
  int32 used1()      { return Memory->code->used_per_compiler[nm_nic]; }
  int32 used2()      { return Memory->code->used_per_compiler[nm_sic]; }
  void calculate_VM_stats();    
};

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
  
  
class MonitorCPUBar : public MonitorBar {
  
  // keep the CPU usage as a sliding average over n_intervals intervals
  static const int n_intervals = 10;
  int32 interval_usec;             // microseconds in one time interval
  int32 interval_usecN;            // microseconds in n_intervals time intervals
  int32 usedU, used_usecsU[n_intervals], usecsU, secsU, sum_usecsU;
  int32 usedS, used_usecsS[n_intervals], usecsS, secsS, sum_usecsS;
  fint  n;
public:
  MonitorCPUBar(int32 usec);
  void  init();
  void  init_CPU();
  int32 capacity()            { return 100; }
  inline int32 used1();
  int32 current_usage()        { return (usedU + usedS); }
  char* start1()   { return NULL; }
  void calculate_VM_stats();
  void update();
};


class MonitorSampledBar : public MonitorBar {
  // keep system usage as a sliding average over n_samples intervals
  // has 4 categories
  static const int n_samples = 10;
  fint sum1, samples1[n_samples];
  fint sum2, samples2[n_samples];
  fint sum3, samples3[n_samples];
  fint sum4, samples4[n_samples];
  double sum1T, sum2T, sum3T, sum4T, elapsedT; // totals - floats to avoid overflow
  fint old_lta1, old_lta2, old_lta3, old_lta4; // long-term averages [0..w)
  fint elapsed_ticks, ticks[n_samples];
  fint n;
public:
  MonitorSampledBar();
  void  init();
  int32 capacity()   { return elapsed_ticks ? elapsed_ticks : 100; }
  int32 used1();
  int32 used2();
  char* start1()     { return NULL; }
  void calculate_VM_stats();
  void update(fint count1, fint count2, fint elapsed_ticks);
  void update(fint count1, fint count2, fint count3, fint count4, fint elapsed_ticks);
  void update0();
  void draw_long_term(bool mustDraw);
};
