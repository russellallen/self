/* Sun-$Revision: 30.9 $ */

/* Copyright 1998-2006 Sun Microsystems, Inc.
   See the LICENSE file for license information. */
   
// This file contains declarations for a Self-specific spy.
// Monitor monitors system activity ("Self spy")
   

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



class SelfMonitor: public Monitor { 
// My state:  
 private:
    
  static const int ticks_per_update = 5; // for speed, measure 5 times, display once
  
  // Display modes:
  bool _show_sends;               // show optional info on sends / blocks?
 
  // Memory bar info: 
  int  _bpp;
  int  _pixels_per_mb;
  int  _ruler_len;
  int  _mem_usage_line_len;  
  int  _n_old_bars;
  
  bool _is_paging_showing;

  // Tick counters:
  int32 _tick_no;                 // # of tick within this second
  int32 _total_tick_no;           // # of ticks since start
  fint  _elapsed_ticks;           // ticks since last screen update
  fint  _measurements_per_second;

  // Remember old values to know when to redisplay these:  
  int32 _old_num_calls;
  int32 _old_access_calls;
  int32 _old_rsrc_used;
  int32 _old_switches;
  
  
  // Display components:

  SharedIndicator* _sys;
  Indicator*       _page;
 
  // Memory:
  MonitorMemBar*  _eden;
  MonitorMemBar*  _from;
  MonitorMemBar*  _to;
  MonitorMemBar** _old;
  
# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)
  // Zone
  MonitorZoneBar*   _i_zone;
  MonitorZoneBar*   _d_zone;
  MonitorZoneBar*   _s_zone;
  MonitorZoneBar* _pic_zone;  
# endif

  // Activities:
      MonitorCPUBar*      _cpu_bar;
  MonitorSampledBar*     _self_bar;
  MonitorSampledBar*   _lookup_bar;
  MonitorSampledBar* _compiler_bar;
  MonitorSampledBar*       _vm_bar;
  MonitorSampledBar*   _access_bar;
  
  
  Indicator           *_activity,  *_resource_areas;
  ValueIndicator      *_allocs;
  DifferenceIndicator *_blockClones, *_blockInvocations, *_sends;
  ValueIndicator      *_blkShort, *_blkLong;
  IndicatorLabel      *_cpu_label, *_self_label, *_lookup_label, *_compiler_label, *_vm_label,
                      *_access_label, *_pics_label, *_code_label, *_deps_label, *_debug_label,
                      *_nic_label, *_sic_label;
  
  CompileIndicator*  _compile;
  
  
 public:
  SelfMonitor();
    
  static oop      resetLog_prim(oop rcvr);  
  static oop   annotateLog_prim(oop rcvr);
  
  void  reset();
  void  resize_contents();
  int   contents_height();
  
  void  recreate_old_bars();
  int   bytes_per_pixel() { return _bpp; }
  
 
 protected:
  void  set_bytes_per_pixel();
  void  tick_measure();
  void  tick_redraw();
  void  create_labels_and_indicators();
  
  void  count_ticks();
  void  measure_current_tick_activity();
  void  count_compiler_ticks(char* pc);
  
  // Self-specific:
  void  initialize_contents();
  void  create_bars();
  void  create_old_bars();
  void  create_labels();
  
  void  resize_mem_zone_bars();
  void  resize_cpu_bars();
  
  void  redraw_paging();
  void  redraw_resources();
  void  redraw_context_switches();
  void  redraw_method_being_compiled();
  void  show_sends();
  void  show_activitives();
  void  redraw_mem_usage();
  void  redraw_bars(bool incr);
  void  redraw_labels();
  void  update_load_level();
  void  update_time_bars();
  void  show_activities();

  void  show_paging(long how_many);
  void  hide_paging();
  
  void draw_mem_usage_line();
  void draw_reserve_lines();
  void draw_memory_ruler();
  
  
  // platform fns:
  int32 get_measurements_per_second();

  
  
  // **************** indicator and cpu bar positioning ******************* 
  

  static int  bar_height()  { return 9; }         /* bar height in pixel */
  static int  old_thick()   { return 4; } // old space is 4 times thicker
  
  int co_w(), co_x(), co_y();
  int vm_w(), vm_x(), vm_y(), vm_wb(), vm_xb(), vm_yb(), vm_hb();
  int lkup_w(), lkup_x(), lkup_y(), lkup_wb(), lkup_xb(), lkup_yb(), lkup_hb();
  int comp_w(), comp_x(), comp_y(), comp_wb(), comp_xb(), comp_yb(), comp_hb();
  int self_w(), self_x(), self_y(), self_wb(), self_xb(), self_yb(), self_hb();
  int  cpu_w(),  cpu_x(),  cpu_y(),  cpu_wb(),  cpu_xb(),  cpu_yb(),  cpu_hb();
  
  int ruler_y(), short_tick(), long_tick();
  
  int ctx_x(), ctx_y(), ctx_w(), ctx_s();
  int act_w(), act_x(), act_y();
  int  pg_w(),  pg_x(),  pg_y();
  int sys_w(), sys_x(), sys_y();
  int res_w(), res_x(), res_y();
  int all_w(), all_x(), all_y();
  int opt_w(), opt_x();
  
  int blkcln_x(),  blkcln_y(),  blkcln_w();
  int blkinv_x(),  blkinv_y(),  blkinv_w();
  int blks_x(), blks_w(), blks_y();
  int blkl_x(), blkl_w(), blkl_y();
  
  int sends_x(), sends_w(), sends_y();
  int acc_x(), acc_w(), acc_y(), acc_wb(), acc_hb(), acc_xb(), acc_yb();
  
  int mbar_x(), eden_y();
  int pics_x(), pics_y(), pics_w();  const char* pics_t();
  int code_x(), code_y(), code_w();  const char* code_t();
  int  nic_x(),  nic_y(),  nic_w();  const char*  nic_t();
  int  sic_x(),  sic_y(),  sic_w();  const char*  sic_t();
  int deps_x(), deps_y(), deps_w();  const char* deps_t();
  int dbug_x(), dbug_y(), dbug_w();  const char* dbug_t();
  
  
  int mz_gap() { return 30; }
  int  z_gap() { return 10; }
  int  m_gap() { return  5; }
  int right_margin() { return 10; }
};

// Classes unique to Self Monitor

// Report back which execution activity has been taking place this tick
class ExecutionMonitor {

 public:
  enum Activities {
    lookup, fast_compiler, opt_compiler, int_execution, fast_execution, opt_execution,
    virtual_machine, scavenge, gc, idle };
  static void initialize();
  static Activities current_tick_activity();
  static fint self_ticks[3];
  static fint lookup_ticks;
  static fint vm_ticks;
  static fint all_ticks() { return self_ticks[0] + self_ticks[1] + self_ticks[2]
                                 + lookup_ticks  + vm_ticks; }
                                 
  static int32 _used_ticks;              // # of ticks of CPU used since start
  static char count_tick_and_return_log_char();

 private:
  static Activities compiled_activity(char*);
};


class MonitorCallsToVM {
 public:
  static bool in_read_trap();
  static bool in_write_trap();
  static bool in_system_trap();
  
  static int block_clones();
  static int block_method_calls();
  static int access_method_calls();
  static int method_calls();
  static int di_method_calls();
  static int all_calls();
  
  static fint code_capacity();
};
