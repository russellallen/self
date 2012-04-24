/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// monitor monitors system activity ("Self spy")

// the platform-specific one should be typedefed to monitor


class Monitor: public CHeapObj { 
  friend class Indicator;
  friend class SharedIndicator; // needs incremental
  
 protected:
 
  bool _is_active;              // true if spy is running
  bool incremental;             // set to true if nobody else will draw in
                                // our portion of the screen
                                
  MonitorWindow _mw;
                                
  FILE* logf;                   // log file
  const char* logfn;                  // log file name
  
  int32 _measurements_per_second;
  
  static const  int K = 1024;
  static const  int MB = K * K;
                                

 public:
  void activate(const char* filename = NULL);
  void deactivate();
  bool is_active()    { return _is_active; }
  
  // accessors
  MonitorWindow* mw() { return &_mw; }
  void adjust_after_resize();  
  fint max_height();
  
  void     reset_log();
  void  annotate_log(const char*);
  
  void full_redraw();

  
  // contents fn:
  virtual void  reset() = 0;
  virtual int   contents_height() = 0; // height of body (excludes border)
  virtual void  resize_contents() = 0;
  
 protected:
  
  Monitor();
  ~Monitor();
  
  void enroll();
  void withdraw();
  
  FILE* open_log_file(const char* filename);
  
  // interrupt handlers
  static void monitor_tick();
  
  // contents fns:
  virtual void  initialize_contents() = 0;
  virtual int32 get_measurements_per_second() = 0;
  virtual void  tick_measure() = 0;
  virtual void  tick_redraw() = 0;
  
  int ind_w(), ind_h(), ind_gap(), ind_bar_w(), ind_bar_h(), ind_bar_yoff();
};


extern Monitor* TheSpy;
