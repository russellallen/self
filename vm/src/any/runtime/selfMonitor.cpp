/* Sun-$Revision: 30.11 $ */

/* Copyright 1998-2006 Sun Microsystems, Inc.
   See the LICENSE file for license information. */

# pragma implementation "selfMonitor.hh"

# include "_selfMonitor.cpp.incl"


// control structures (hah, hah!)

  
# define NEW_INDICATOR(name, indType) \
    if (! name) name = new indType

# define NEW_LABEL(name, text) \
    if (! name) name = new IndicatorLabel(text)


# define FOR_ALL_BARS_DO(action) \
    FOR_ALL_CPU_BARS_DO(action); \
    FOR_ALL_MEM_BARS_DO(action);

# define FOR_ALL_CPU_BARS_DO(action) \
         _cpu_bar->action; \
        _self_bar->action; \
      _lookup_bar->action; \
    _compiler_bar->action; \
          _vm_bar->action;                                                            \

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
#   define FOR_ALL_ZONE_BARS_DO(action) \
      _i_zone->action; \
      _d_zone->action; \
      _s_zone->action; \
    _pic_zone->action;
    
#   define FOR_ALL_ZONE_BAR_LABELS_DO(action) \
     _pics_label->action, \
     _code_label->action, \
      _nic_label->action, \
      _sic_label->action, \
     _deps_label->action, \
    _debug_label->action
    
# else
#   define FOR_ALL_ZONE_BARS_DO(action)
#   define FOR_ALL_ZONE_BAR_LABELS_DO(action) 0
# endif
 

# define FOR_ALL_MEM_BARS_DO(action) \
    _eden->action; \
    _from->action; \
      _to->action; \
    {for (int32 _n=0; _n < _n_old_bars; ++_n) _old[_n]->action;} \
    FOR_ALL_ZONE_BARS_DO(action)
   

# define FOR_ALL_BAR_LABELS_DO(action) \
    FOR_ALL_ZONE_BAR_LABELS_DO(action)

# define FOR_ALL_LABELS_DO(action) \
        _self_label->action, \
         _cpu_label->action, \
      _lookup_label->action, \
    _compiler_label->action, \
    _show_sends ? _access_label->action : (void)0, \
          _vm_label->action, \
    FOR_ALL_BAR_LABELS_DO(action)

# define FOR_ALL_OPT_BARS_DO(action) \
    if (_show_sends) { \
      _access_bar->action; \
    }


// ========================================================
// Creation (& destruction)


void monitor_init() {
  TheSpy = new SelfMonitor();
}


void monitor_exit() { 
  TheSpy->deactivate(); 
}


SelfMonitor::SelfMonitor() : Monitor() {
  _is_paging_showing = _show_sends = false; 
  _pixels_per_mb = _n_old_bars = 0;
  _bpp = 1000000;
  _tick_no = _total_tick_no = _measurements_per_second = 0;
  _old_num_calls = _old_access_calls = _old_rsrc_used = _old_switches = 0;
  _sys = NULL;  _page = NULL;  _eden = NULL;  _from = NULL;  _to = NULL;  _old = NULL;
# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)
  _i_zone = _d_zone = _s_zone = _pic_zone = NULL;
# endif 
  _cpu_bar = NULL;  _self_bar = NULL;  _lookup_bar = NULL;   _compiler_bar = NULL;  _vm_bar = NULL;  _access_bar = NULL;  
  _activity = _resource_areas = NULL;
  _allocs = NULL;
  _blockClones = _blockInvocations = _sends = NULL;
  _blkShort = _blkLong = NULL;
     _cpu_label = _self_label = _lookup_label = _compiler_label =    _vm_label = NULL;
  _access_label = _pics_label =   _code_label =     _deps_label = _debug_label = NULL,
      _nic_label = _sic_label  = NULL;
  
  _compile = NULL;  
}


void SelfMonitor::reset()   {
  ShowLookupInMonitor::lookup_nesting = 0;
  ShowCompileInMonitor::method_being_compiled = NULL;
}


void SelfMonitor:: initialize_contents() {
  _show_sends = SpyShowSends;
  _mem_usage_line_len = 0;


  int tps = get_measurements_per_second();
  assert(tps > 1 && tps <= 100, 
         "ticks per sec must be between 2 and 100");
  _measurements_per_second = tps;

  create_bars();
  create_labels();
  
  resize_mem_zone_bars();
  resize_cpu_bars();
  create_labels_and_indicators();

  
  FOR_ALL_BARS_DO(init());
  FOR_ALL_OPT_BARS_DO(init());
  ProcessInfo::update();
  
  LoadLevelMonitor::initialize();
  
  _cpu_bar->init_CPU();
  _is_paging_showing = false;
  _old_rsrc_used = -1;
  _old_num_calls = MonitorCallsToVM::all_calls() - 1;
  _old_access_calls = MonitorCallsToVM::access_method_calls(); - 1;
  _elapsed_ticks = 0;
  _total_tick_no = 1;        // 1 to avoid divide-by-zero 
  _old_switches = 0;
}


int32 SelfMonitor::get_measurements_per_second() {
    return (int32)IntervalTimer::Real_timer()->ticks_per_second();
}


void SelfMonitor::resize_contents() {
  resize_mem_zone_bars();
}


void SelfMonitor::tick_measure() {
  if (!is_active())        return; // for gdb

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
    // Return if the profiler is active.
    if (profilerSemaphore) return;
# endif

  count_ticks();
  measure_current_tick_activity();
  
  if (SilentSpy) {
    if (_tick_no >= _measurements_per_second) {
      if (logf) fputc('\n', logf);
      _tick_no = 0;
    }
  }    
}


void SelfMonitor::tick_redraw() {  
  if (!is_active() || _eden == NULL) return; // in progress activating
  if (MallocInProgress) return;  // to be safe, don't do X calls
  if (_elapsed_ticks < ticks_per_update  &&  incremental)  return;
  
  if (!mw()->pw->is_open()) {
    mw()->close();
    return;
  }
  if (!mw()->pw->pre_draw(incremental))  return;
  
  if ( !incremental ) {
    mw()->pw->clear_rectangle(0, mw()->width(), 0, mw()->height());
  }

  ProcessInfo::update();
            
  redraw_paging();
  redraw_labels();
  redraw_resources();
  _allocs->update(TrackCHeapInMonitor::allocated(), incremental);   
  redraw_context_switches();
  redraw_method_being_compiled();
  show_sends();
  show_activities();
  redraw_mem_usage();
  redraw_bars(incremental);
       
  mw()->pw->post_draw(incremental);

  incremental= true;
}


// Accessors, etc.


void SelfMonitor::show_paging(long how_many) { 
  char s[10];
  sprintf(s, " page%3ld", how_many);
  _page->show(s);
  _is_paging_showing = true;
}
  

void SelfMonitor::hide_paging() { 
  if (_is_paging_showing) { _page->hide();  _is_paging_showing = false; }
}

  
// Locations & sizes of graphical components:
int SelfMonitor::co_w()   {  return  CompileIndicator::compile_len*mw()->font_width(); }
int SelfMonitor::co_x()   {  return  2 + mw()->font_width(); }
int SelfMonitor::co_y()   {  return  2; }
  
int SelfMonitor::vm_w()   {  return  ind_w(); }
int SelfMonitor::vm_x()   {  return  co_x() - mw()->font_width(); }
int SelfMonitor::vm_y()   {  return  co_y() + ind_gap(); }
int SelfMonitor::vm_wb()  {  return  ind_bar_w(); }
int SelfMonitor::vm_xb()  {  return  vm_x() + vm_w() + mw()->font_width()/2; }
int SelfMonitor::vm_yb()  {  return  vm_y() + 2; }
int SelfMonitor::vm_hb()  {  return  ind_bar_h(); }
  
int SelfMonitor::lkup_w()   {  return  ind_w(); }
int SelfMonitor::lkup_x()   {  return  vm_x(); }
int SelfMonitor::lkup_y()   {  return  vm_y() + ind_gap(); }
int SelfMonitor::lkup_wb()  {  return  ind_bar_w() ; }
int SelfMonitor::lkup_xb()  {  return  vm_xb(); }
int SelfMonitor::lkup_yb()  {  return  lkup_y() + ind_bar_yoff(); }
int SelfMonitor::lkup_hb()  {  return  ind_bar_h(); }

int SelfMonitor::comp_w()   {  return  ind_w(); }
int SelfMonitor::comp_x()   {  return  vm_x(); }
int SelfMonitor::comp_y()   {  return  lkup_y() + ind_gap(); }
int SelfMonitor::comp_wb()  {  return  ind_bar_w(); }
int SelfMonitor::comp_xb()  {  return  vm_xb(); }
int SelfMonitor::comp_yb()  {  return  comp_y() + ind_bar_yoff(); }
int SelfMonitor::comp_hb()  {  return  ind_bar_h(); }

int SelfMonitor::self_w()   {  return  ind_w() ; }
int SelfMonitor::self_x()   {  return  vm_x(); }
int SelfMonitor::self_y()   {  return  comp_y() + ind_gap(); }
int SelfMonitor::self_wb()  {  return  ind_bar_w() ; }
int SelfMonitor::self_xb()  {  return  vm_xb(); }
int SelfMonitor::self_yb()  {  return  self_y() + ind_bar_yoff(); }
int SelfMonitor::self_hb()  {  return  ind_bar_h(); }

int SelfMonitor::cpu_w()   {  return  ind_w() ; }
int SelfMonitor::cpu_x()   {  return  vm_x(); }
int SelfMonitor::cpu_y()   {  return  self_y() + ind_gap(); }
int SelfMonitor::cpu_wb()  {  return  ind_bar_w() ; }
int SelfMonitor::cpu_xb()  {  return  vm_xb(); }
int SelfMonitor::cpu_yb()  {  return  cpu_y() + ind_bar_yoff(); }
int SelfMonitor::cpu_hb()  {  return  ind_bar_h(); }

int SelfMonitor::ruler_y()     {  return  eden_y() + (3 + old_thick()) * bar_height() + 12; }
int SelfMonitor::short_tick()  {  return  5; }
int SelfMonitor::long_tick()   {  return 10; }
int SelfMonitor::contents_height() {  return  max( ruler_y(), (cpu_y() + mw()->font_height()) ) + 4;  }

// process switch dot
int SelfMonitor::ctx_x()   {  return  cpu_x() + mw()->font_width(); }
int SelfMonitor::ctx_y()   {  return  cpu_y() + 12; }
int SelfMonitor::ctx_w()   {  return  cpu_xb() + cpu_wb() - ctx_x(); }
int SelfMonitor::ctx_s()   {  return  2; }

// scavenge/GC/flushing/compacting/icflush/lrusweep
int SelfMonitor::act_w()   {  return  12 * mw()->font_width(); }
int SelfMonitor::act_x()   {  return  vm_xb() + vm_wb() + 2; }
int SelfMonitor::act_y()   {  return  vm_y(); }

// page
int SelfMonitor::pg_w()    {  return  8 * mw()->font_width(); }
int SelfMonitor::pg_x()    {  return  act_x(); }
int SelfMonitor::pg_y()    {  return  lkup_y(); }

// read/write/diskio/unix/idle/nothing
int SelfMonitor::sys_w()   {  return  10 * mw()->font_width(); }
int SelfMonitor::sys_x()   {  return  pg_x() + pg_w() + 2; }
int SelfMonitor::sys_y()   {  return  pg_y(); }

// RSRC  
int SelfMonitor::res_w()   {  return  30 * mw()->font_width(); }
int SelfMonitor::res_x()   {  return  self_xb() + self_wb() + 5; }
int SelfMonitor::res_y()   {  return  self_y(); }

// C-Heap  
int SelfMonitor::all_w()   {  return  20 * mw()->font_width(); }
int SelfMonitor::all_x()   {  return  res_x(); }
int SelfMonitor::all_y()   {  return  cpu_y(); }

// sends/block creations etc (optional)
int SelfMonitor::opt_x()   {  return  res_x() + res_w() + 5; }
int SelfMonitor::opt_w()   {  return  19 * mw()->font_width(); }

// block clones
int SelfMonitor::blkcln_x()   {  return  opt_x();  }
int SelfMonitor::blkcln_w()   {  return  opt_w();  }
int SelfMonitor::blkcln_y()   {  return  vm_y();  }

// block invocations
int SelfMonitor::blkinv_x()   {  return  opt_x();  }
int SelfMonitor::blkinv_w()   {  return  opt_w();  }
int SelfMonitor::blkinv_y()   {  return  lkup_y();  }

// % block invocations (short / long-term)
int SelfMonitor::blks_x()   {  return  opt_x();  }
int SelfMonitor::blks_w()   {  return  13 * mw()->font_width();  }
int SelfMonitor::blks_y()   {  return  comp_y();  }
int SelfMonitor::blkl_x()   {  return  blks_x() + blks_w();  }
int SelfMonitor::blkl_w()   {  return  5 * mw()->font_width();  }
int SelfMonitor::blkl_y()   {  return  blks_y();  }

// total sends
int SelfMonitor::sends_x()   {  return  opt_x();  }
int SelfMonitor::sends_w()   {  return  opt_w();  }
int SelfMonitor::sends_y()   {  return  self_y();  }

// data access sends
int SelfMonitor::acc_x()    {  return  opt_x();  }
int SelfMonitor::acc_w()    {  return  10 * mw()->font_width();  }
int SelfMonitor::acc_y()    {  return  cpu_y();  }
int SelfMonitor::acc_wb()   {  return  ind_bar_w() ;  }
int SelfMonitor::acc_xb()   {  return  acc_x() + acc_w();  }
int SelfMonitor::acc_yb()   {  return  acc_y() + ind_bar_yoff();  }
int SelfMonitor::acc_hb()   {  return  ind_bar_h();  }

// memory bars position
int SelfMonitor::mbar_x()   {  return  opt_x() + (_show_sends ? opt_w() : 0);  }
int SelfMonitor::eden_y()   {  return  vm_yb();  }

// memory bar label positions
int         SelfMonitor::pics_x()   {  return  _pic_zone->x;  }
int         SelfMonitor::pics_y()   {  return  _pic_zone->y - mw()->font_height();  }
const char* SelfMonitor::pics_t()   {  return  "PICs";  }
int         SelfMonitor::pics_w()   {  return  4*mw()->font_width();  }

int         SelfMonitor::code_x()   {  return  _i_zone->x + (_i_zone->w / 2) - (code_w() / 2);  }
int         SelfMonitor::code_y()   {  return  _i_zone->y + _i_zone->h + 2;  }
const char* SelfMonitor::code_t()   {  return  "code";  }
int         SelfMonitor::code_w()   {  return  4*mw()->font_width();  }

int         SelfMonitor::nic_x()   {  return  _i_zone->x;  }
int         SelfMonitor::nic_y()   {  return  code_y();  }
const char* SelfMonitor::nic_t()   {  return  "NIC";  }
int         SelfMonitor::nic_w()   {  return  3*mw()->font_width();  }

int         SelfMonitor::sic_x()   {  return  _i_zone->x + _i_zone->w - sic_w();  }
int         SelfMonitor::sic_y()   {  return  code_y();  }
const char* SelfMonitor::sic_t()   {  return  "SIC";  }
int         SelfMonitor::sic_w()   {  return  3*mw()->font_width();  }

int         SelfMonitor::deps_x()   {  return  _d_zone->x;  }
int         SelfMonitor::deps_y()   {  return  _d_zone->y + _d_zone->h + 2;  }
const char* SelfMonitor::deps_t()   {  return  "deps";  }
int         SelfMonitor::deps_w()   {  return  4*mw()->font_width();  }

int         SelfMonitor::dbug_x()   {  return  _s_zone->x;  }
int         SelfMonitor::dbug_y()   {  return  _s_zone->y + _s_zone->h + 2;  }
const char* SelfMonitor::dbug_t()   {  return  "debug";  }
int         SelfMonitor::dbug_w()   {  return  5*mw()->font_width();  }



oop SelfMonitor::resetLog_prim(oop rcvr) {  
  TheSpy->reset_log();
  return rcvr;
}


oop SelfMonitor::annotateLog_prim(oop rcvr) { 
  ResourceMark rm;
  if (rcvr->is_byteVector())
    TheSpy->annotate_log(byteVectorOop(rcvr)->copy_null_terminated());
  return rcvr;
}


void SelfMonitor::set_bytes_per_pixel() {
  // find which of to and old space are widest
  fint maxMem= TrackObjectHeapInMonitor::new_capacity();
  fint t=      TrackObjectHeapInMonitor::old_capacity() / old_thick();
  if (t > maxMem) maxMem= t;
  
  int zone_gap = 0;
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
    zone_gap = mz_gap() + (2*z_gap());
# endif

  int32 cap = 0;
  cap = MonitorCallsToVM::code_capacity();
  
  _bpp=
    (maxMem + cap/old_thick()) / 
      (mw()->width()
        - (mbar_x())
        - ((TrackObjectHeapInMonitor::n_spaces() - 1) * m_gap())
        - zone_gap
        - right_margin());
        
  if (_bpp == 0) _bpp = 1; // hack to prevent overflow below      
  _pixels_per_mb= MB / (_bpp * old_thick());
}


void SelfMonitor::draw_mem_usage_line() {
  const int line_len= TrackObjectHeapInMonitor::old_used() / (bytes_per_pixel() * old_thick());
  if (!incremental && line_len  ==  _mem_usage_line_len) return;
  mw()->pw->set_color(mw()->pw->white());
  mw()->pw->draw_line(mbar_x(), ruler_y(), mbar_x() + _mem_usage_line_len, ruler_y());
  mw()->pw->set_color(mw()->pw->black());
  _mem_usage_line_len= line_len;
  mw()->pw->draw_line(mbar_x(), ruler_y(), mbar_x() + _mem_usage_line_len, ruler_y());
}


void SelfMonitor::draw_reserve_lines() {
  // red line
  const fint red_line_len=
    TrackObjectHeapInMonitor::old_VM_reserved_memory() / (bytes_per_pixel() * old_thick());
  mw()->pw->set_color(mw()->pw->red());
  mw()->pw->set_thickness(mw()->pw->is_mono() ? 3 : 2);
  fint end=   mbar_x() + _ruler_len;
  fint start= end - red_line_len;
  mw()->pw->draw_line(start, ruler_y(), end, ruler_y());
  // yellow line
  const fint yellow_line_len=
    TrackObjectHeapInMonitor::old_low_space_threshold() / (bytes_per_pixel() * old_thick())
      - red_line_len;
  end=   start;
  start= end - yellow_line_len;
  mw()->pw->set_color(mw()->pw->yellow());
  mw()->pw->set_thickness(2);
  mw()->pw->draw_line(start, ruler_y(), end, ruler_y());
  mw()->pw->set_color(mw()->pw->black());
  mw()->pw->set_thickness(0);
}


void SelfMonitor::draw_memory_ruler() {
  _ruler_len= TrackObjectHeapInMonitor::old_capacity() / (bytes_per_pixel() * old_thick());
  const fint nTicks= _ruler_len / _pixels_per_mb + 1;
  for (int x_off= mbar_x(), n= 0; n < nTicks; ++n, x_off += _pixels_per_mb)
    mw()->pw->draw_line(x_off, ruler_y(), x_off,
                        ruler_y() - (n % 5 == 0 ? long_tick() : short_tick()));
}



// ********************* interrupt handler *********************


void SelfMonitor::resize_mem_zone_bars() {
  if ( !is_active()  ||  _eden == NULL )   return;
  SignalBlocker sb;
  mw()->pw->clear_rectangle(mbar_x(), 0, mw()->width() - mbar_x(),  mw()->height());
  incremental = false;
  set_bytes_per_pixel();
  _eden->resize(mbar_x(), eden_y(),            bar_height(), 1);
  _from->resize(mbar_x(), eden_y() + bar_height(),   bar_height(), 1);
    _to->resize(mbar_x(), eden_y() + 2*bar_height(), bar_height(), 1);
  int lastX= mbar_x();
  for (int n= 0;  n < _n_old_bars;  lastX += _old[n++]->w + m_gap())
    _old[n]->resize(lastX, eden_y() + 3*bar_height(), bar_height(), old_thick());

  lastX -= m_gap();
  if (lastX < mbar_x() + _to->w) lastX= mbar_x() + _to->w; // to is wider than old
  lastX += mz_gap();

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)
  // pic_zone can move
  _pic_zone->resize(lastX, eden_y() + 2*bar_height(), bar_height(), 1,
                  Memory->code->stubs->zone());
    _i_zone->resize(lastX, eden_y() + 3*bar_height(), bar_height(), old_thick());
  lastX += _i_zone->w + z_gap();
    _d_zone->resize(lastX, eden_y() + 3*bar_height(), bar_height(), old_thick());
  lastX += _d_zone->w + z_gap();
    _s_zone->resize(lastX, eden_y() + 3*bar_height(), bar_height(), old_thick());

   _pics_label->reposition(pics_x(), pics_y(), pics_w());
   _code_label->reposition(code_x(), code_y(), code_w());
    _nic_label->reposition( nic_x(),  nic_y(),  nic_w());
    _sic_label->reposition( sic_x(),  sic_y(),  nic_w());
   _deps_label->reposition(deps_x(), deps_y(), deps_w());
  _debug_label->reposition(dbug_x(), dbug_y(), dbug_w());
  
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

  TrackObjectHeapInMonitor::reserve_changed();
}


void SelfMonitor::create_bars() {
  if (!_eden) { // otherwise reuse objects
    _eden= new MonitorMemBar(Memory->new_gen->eden_space);
    _from= new MonitorMemBar(Memory->new_gen->from_space);
    _to=   new MonitorMemBar(Memory->new_gen->to_space);
    
#   if defined(FAST_COMPILER) || defined(SIC_COMPILER)
    _i_zone=   new MonitorCodeCacheBar(Memory->code->iZone);
    _pic_zone= new MonitorZoneBar(Memory->code->stubs->zone());
    _d_zone=   new MonitorZoneBar(Memory->code->dZone);
    _s_zone=   new MonitorZoneBar(Memory->code->sZone);
#   endif
  }

  _cpu_bar      = new MonitorCPUBar(1000000 * ticks_per_update / _measurements_per_second);
  _vm_bar       = new MonitorSampledBar();
  _self_bar     = new MonitorSampledBar();
  _lookup_bar   = new MonitorSampledBar();
  _compiler_bar = new MonitorSampledBar();
  _access_bar   = new MonitorSampledBar();

  create_old_bars();
}

void SelfMonitor::create_old_bars() {    
  // need to recreate this as the number of spaces may have changed
  if (_old) {
    for (int n= 0;  n < _n_old_bars;  ++n) {
      delete _old[n];
      _old[n] = NULL; // paranoia
    }
    delete [] _old;
    _old = NULL; // paranoia
  }
  _old=  new MonitorMemBar *[TrackObjectHeapInMonitor::n_spaces()];
  _n_old_bars= 0;
  {FOR_EACH_OLD_SPACE(s) 
    _old[_n_old_bars++]= new MonitorMemBar(s);}
}


void SelfMonitor::create_labels() {
    
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  NEW_LABEL( _pics_label, pics_t());
  NEW_LABEL( _code_label, code_t());
  NEW_LABEL(  _nic_label,  nic_t());
  NEW_LABEL(  _sic_label,  sic_t());
  NEW_LABEL( _deps_label, deps_t());
  NEW_LABEL(_debug_label, dbug_t());
# endif
}


void SelfMonitor::resize_cpu_bars() {
       _cpu_bar->resize(  cpu_xb(),  cpu_yb(),  cpu_wb(),  cpu_hb());
        _vm_bar->resize(   vm_xb(),   vm_yb(),   vm_wb(),   vm_hb());
      _self_bar->resize( self_xb(), self_yb(), self_wb(), self_hb());
    _lookup_bar->resize( lkup_xb(), lkup_yb(), lkup_wb(), lkup_hb());
  _compiler_bar->resize( comp_xb(), comp_yb(), comp_wb(), comp_hb());
  if (_show_sends) {
    _access_bar->resize(  acc_xb(),  acc_yb(),  acc_wb(),  acc_hb());
  }      
}


void SelfMonitor::create_labels_and_indicators() {
  NEW_INDICATOR( _page, Indicator) ;
  _page->reposition(pg_x(), pg_y(), pg_w());

  NEW_LABEL(_cpu_label, " CPU ");
  _cpu_label->reposition(cpu_x(), cpu_y(), cpu_w());
  NEW_LABEL(_vm_label, " VM ");
  _vm_label->reposition(vm_x(), vm_y(), vm_w());
  NEW_LABEL(_self_label, " Self ");
  _self_label->reposition(self_x(), self_y(), self_w());
  NEW_LABEL(_lookup_label, " Lkup ");
  _lookup_label->reposition(lkup_x(), lkup_y(), lkup_w());
  NEW_LABEL(_compiler_label, " Comp ");
  _compiler_label->reposition(comp_x(), comp_y(), comp_w());
  NEW_LABEL(_access_label, "% access ");
  _access_label->reposition(acc_x(), acc_y(), acc_w());
  
  NEW_INDICATOR(_resource_areas, Indicator);
  _resource_areas->reposition(res_x(), res_y(), res_w());
  NEW_INDICATOR(_allocs, ValueIndicator(" C-Heap: XX,XXX,XXX", false, 8));
  _allocs->reposition(all_x(), all_y(), all_w());
  NEW_INDICATOR(_compile, CompileIndicator);
  _compile->reposition(co_x(), co_y(), co_w());


  NEW_INDICATOR(_sys, SharedIndicator);
  _sys->reposition(sys_x(), sys_y(), sys_w());
  NEW_INDICATOR(_activity, Indicator);
  _activity->reposition(act_x(), act_y(), act_w());
  if (_show_sends) {
    fint tps = _measurements_per_second / ticks_per_update;
    NEW_INDICATOR(_blockClones,
                  DifferenceIndicator("BlkClone: XXX,XXX", true, 6, tps));
    _blockClones->reposition(blkcln_x(), blkcln_y(), blkcln_w());
    NEW_INDICATOR(_blockInvocations,
                  DifferenceIndicator("BlkInvoc: XXX,XXX", true, 6, tps));
    _blockInvocations->reposition(blkinv_x(), blkinv_y(), blkinv_w());
    NEW_INDICATOR(_blkShort, ValueIndicator("% blkInv:XXX%", false, 3, 1, 1));
    _blkShort->reposition(blks_x(), blks_y(), blks_w());
    NEW_INDICATOR(_blkLong, ValueIndicator("/XXX%", false, 3, 1, 1));
    _blkLong->reposition(blkl_x(), blkl_y(), blkl_w());
    NEW_INDICATOR(_sends, DifferenceIndicator("Tot Snds: XXX,XXX", true, 6, tps));
    _sends->reposition(sends_x(), sends_y(), sends_w());
  }
}

  
void SelfMonitor::count_ticks() {
  BlockProfilerTicks bpt(exclude_monitor);
  ++_tick_no;
  ++_total_tick_no;
  ++_elapsed_ticks;
}


void SelfMonitor::measure_current_tick_activity() {
  char c = ExecutionMonitor::count_tick_and_return_log_char();
  if (logf != NULL)  fputc(c, logf);
}



void SelfMonitor::redraw_labels() {
  if (!incremental) {
    FOR_ALL_LABELS_DO(show());
  }
}


void SelfMonitor::redraw_paging() {
  long faults   = ProcessInfo::page_faults_IO();
  
  update_load_level();
  update_time_bars();
  
  if (faults != ProcessInfo::page_faults_IO()) {
    show_paging(ProcessInfo::page_faults_IO() - faults);
  } else {
    hide_paging();
  }
}


void SelfMonitor::redraw_resources() {
  char s[50];
  int32 rsrc_used;
  if (!ResourceAreaMonitor::is_consistent()) {
    // interrupt during inconsistent state -- do nothing till next time
    rsrc_used = _old_rsrc_used;
  }
  else {
    rsrc_used = ResourceAreaMonitor::used() / K;
  }
  if (_old_rsrc_used != rsrc_used || ! incremental) {
    sprintf(s, " RSRC: %5ldK (%5ldK used) ", long(resources.capacity() / K),
            long(rsrc_used));
    _resource_areas->show(s);
    _old_rsrc_used = rsrc_used;
  }
}


void SelfMonitor::redraw_context_switches() {
  int32 cs = ShowContextSwitchInMonitor::context_switches();
  if (_old_switches != cs) {
    // don't get here every cs so clear all
    mw()->pw->clear_rectangle(ctx_x(), ctx_y(), ctx_w(), ctx_s() + 1);
    int32 pos = cs % (ctx_w() - ctx_x());
    mw()->pw->draw_square(ctx_x() + pos, ctx_y(), ctx_s());
    _old_switches = cs;
  }
}


void SelfMonitor::redraw_method_being_compiled() {
  if (ShowCompileInMonitor::method_being_compiled == NULL) {
    _compile->hide();
  }
  else if (ShowCompileInMonitor::method_changed()) {
    _compile->hide();
    _compile->show(ShowCompileInMonitor::method_being_compiled, 
                  ShowCompileInMonitor::current_compiler_name, 
                  ShowCompileInMonitor::recompiling);
  }
}


void SelfMonitor::redraw_mem_usage() {
  if (!incremental  ||  _mem_usage_line_len == 0) {
#     if defined(FAST_COMPILER) || defined(SIC_COMPILER)
    mw()->pw->clear_rectangle(mbar_x(), ruler_y() - long_tick(),
                              _i_zone->x - mbar_x(), mw()->height() - ruler_y() - long_tick());
#     endif
    draw_memory_ruler();
    draw_reserve_lines();
  }
  draw_mem_usage_line();
}


void SelfMonitor::redraw_bars(bool incremental) {
  FOR_ALL_MEM_BARS_DO(draw(incremental)); 
  FOR_ALL_OPT_BARS_DO(draw(incremental)); 
  FOR_ALL_CPU_BARS_DO(draw(incremental));
}


void SelfMonitor::update_load_level() {
  if (_tick_no >= _measurements_per_second) {
    // quick reality check: if we're running on a loaded machine, we'll miss
    // ticks, and so what we think is a second is really more
    LoadLevelMonitor::compute_load_level();
    _tick_no = 0;
    FOR_ALL_BARS_DO(calculate_VM_stats());    // only once a second (expensive)
  }    
}
  

void SelfMonitor::update_time_bars() {
    
  _cpu_bar->update();

  fint nticks = ExecutionMonitor::all_ticks()
              + ShowCompileInMonitor     ::all_ticks();
              
  if (nticks == 0) {
    // just reset the bars, don't update long-term averages etc
        _self_bar->update0();
      _lookup_bar->update0();
    _compiler_bar->update0();
          _vm_bar->update0();
  } 
  else {
    fint percent = _cpu_bar->current_usage();
    fint elapsed = _elapsed_ticks * 100;
    if (Interpret)
      _self_bar->update(percent * ExecutionMonitor::self_ticks[0], 
                       percent * ExecutionMonitor::self_ticks[1], 
                       percent * ExecutionMonitor::self_ticks[2],
                       0,
                       elapsed);
    else
      _self_bar->update(percent * ExecutionMonitor::self_ticks[1], 
                       percent * ExecutionMonitor::self_ticks[2], 
                       elapsed);
    _lookup_bar->update(percent * ExecutionMonitor::lookup_ticks, 0, elapsed);
    _compiler_bar->update(percent * ShowCompileInMonitor::compiler_ticks[0],
                         percent  * ShowCompileInMonitor::compiler_ticks[1], elapsed);
    _vm_bar->update(percent * ExecutionMonitor::vm_ticks, 0, elapsed);
    ExecutionMonitor::_used_ticks += percent * nticks;
                            
  }
  ExecutionMonitor::self_ticks[0] = ExecutionMonitor::self_ticks[1] = ExecutionMonitor::self_ticks[2] = ExecutionMonitor::lookup_ticks = 0;
  ShowCompileInMonitor::compiler_ticks[0] = ShowCompileInMonitor::compiler_ticks[1] = ExecutionMonitor::vm_ticks = 0;
  _elapsed_ticks = 0;
  if (logf) fputc('\n', logf);
}



void SelfMonitor::show_sends() {
  if (!_show_sends) 
    return;
    
  _blockClones->     update(MonitorCallsToVM::block_clones(),       incremental);
  _blockInvocations->update(MonitorCallsToVM::block_method_calls(), incremental);
  int32 shortPercent = _blockClones->value()
    ?  _blockInvocations->value() * 100 / _blockClones->value()
    :  0;
  _blkShort->update(shortPercent, incremental);
  int32 longPercent = MonitorCallsToVM::block_clones() 
    ? int32(100.0 * MonitorCallsToVM::block_method_calls() / MonitorCallsToVM::block_clones()) 
    : 0;
  _blkLong->update(longPercent, incremental);

  int32 numCalls = MonitorCallsToVM::all_calls();
  int32 calls = numCalls - _old_num_calls;
  _old_num_calls = numCalls;
  _sends->update(numCalls, incremental);
  if (_old_access_calls > MonitorCallsToVM::access_method_calls()) _old_access_calls = 0;
  int32 percentAccess;
  if (calls) {
    percentAccess =
      (MonitorCallsToVM::access_method_calls() - _old_access_calls) * 100 / calls;
    _access_bar->update(percentAccess, 0, 100);
  }
  _old_access_calls = MonitorCallsToVM::access_method_calls();
}

  
  
void SelfMonitor::show_activities() {
  long inblock  = ProcessInfo::block_input_operations();
  long outblock = ProcessInfo::block_output_operations();
  ProcessInfo::update();
 
   inblock  = ProcessInfo:: block_input_operations() -  inblock;
  outblock  = ProcessInfo::block_output_operations() - outblock;

  OSActivityMonitor::SystemState s = OSActivityMonitor::activity();
  if ( s == OSActivityMonitor::nothing )  _sys->hide();
  else                                _sys->show( OSActivityMonitor::state_string(s), s);
  
  _activity->hide();
  if (ShowVMActivityInMonitor::current_activity) {
    _activity->show(ShowVMActivityInMonitor::current_activity);
  }
}
 
  
void SelfMonitor::recreate_old_bars() {
  if (!is_active()) return;
  SignalBlocker sb; // block out signals until done

  create_old_bars();

  set_bytes_per_pixel();
  adjust_after_resize();
}






fint  ExecutionMonitor::self_ticks[3] = {0, 0, 0};
fint  ExecutionMonitor::lookup_ticks = 0;
fint  ExecutionMonitor::vm_ticks = 0;

int32 ExecutionMonitor::_used_ticks    = 1; // avoid divide by zero

void ExecutionMonitor::initialize() {
  _used_ticks = 1;
}


ExecutionMonitor::Activities ExecutionMonitor::compiled_activity(char* pc) {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
    nmethod* nm = findNMethod(pc);
    fint c = nm->compiler();
    return  c == NIC  ?  fast_execution  :  opt_execution;
# else
    return idle;
# endif
}


ExecutionMonitor::Activities ExecutionMonitor::current_tick_activity() {
  // find part of system to which current tick should be attributed
  if ( ShowLookupInMonitor::lookup_nesting >  1 
  ||   ShowLookupInMonitor::lookup_nesting == 1  &&  !ShowCompileInMonitor::method_being_compiled )
    return lookup;
  
  if (ShowCompileInMonitor::method_being_compiled)
    return ShowCompileInMonitor::current_compiler_ticks == &ShowCompileInMonitor::compiler_ticks[0] 
             ?  fast_compiler
             :   opt_compiler;

  
  frame* f;
  char* pc;
  InterruptedFrameMonitor::get_frame_and_pc( f, pc );
    
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

    if (Memory->code->contains(pc))
      return compiled_activity(pc);
    
    if (Memory->code->stubs->contains(pc)) {
      // charge PIC time to Self
      NCodeBase* s = findThing(pc);
      if (s->isCacheStub()) {
        pc = (char*) ((CacheStub*)s)->sd();
      } 
      else {
        assert(s->isCountStub(), "what is it?");
        CacheStub* pic = ((CountStub*)s)->pic();
        pc = pic ? (char*)pic->sd() : (char*)((CountStub*)s)->sd();
      }
      return compiled_activity(pc);
    }
# endif  // defined(FAST_COMPILER) || defined(SIC_COMPILER)

  if ( f != NULL  &&  f->is_interpreted_self_frame())
    return int_execution;

  if (processes->isIdle())  return idle;
  if (ScavengeInProgress)   return scavenge;
  if (     GCInProgress)    return gc;
                            return virtual_machine;
}


char ExecutionMonitor::count_tick_and_return_log_char() {
  static fint dummy = 0;
  switch ( current_tick_activity() ) { 
   case          lookup: ++lookup_ticks;                          return 'L';
   case   fast_compiler: ++*ShowCompileInMonitor::current_compiler_ticks;  return 'F';
   case    opt_compiler: ++*ShowCompileInMonitor::current_compiler_ticks;  return 'O';
   case   int_execution: ++self_ticks[0];                         return 'i';
   case  fast_execution: ++self_ticks[1];                         return 's';
   case   opt_execution: ++self_ticks[2];                         return 'S';
   case virtual_machine: ++vm_ticks;                              return 'V';
   case        scavenge: ++vm_ticks;                              return 'g';
   case              gc: ++vm_ticks;                              return 'G';
   case            idle: ++dummy;                                 return ' ';
   default: fatal("should not be here"); 
  }
  return '\0';
}



bool MonitorCallsToVM::in_read_trap()   { return InterruptedContext::the_interrupted_context->in_read_trap(); }
bool MonitorCallsToVM::in_write_trap()  { return InterruptedContext::the_interrupted_context->in_write_trap(); }
bool MonitorCallsToVM::in_system_trap() { return InterruptedContext::the_interrupted_context->in_system_trap(); }


int MonitorCallsToVM::block_clones()         { return NumberOfBlockClones; }
int MonitorCallsToVM::block_method_calls()   { return NumberOfBlockMethodCalls; }
int MonitorCallsToVM::access_method_calls()  { return NumberOfAccessMethodCalls; }
int MonitorCallsToVM::method_calls()         { return NumberOfMethodCalls; }
int MonitorCallsToVM::di_method_calls()      { return NumberOfDIMethodCalls; }
int MonitorCallsToVM::all_calls() { 
  return block_method_calls() + access_method_calls() + method_calls() + di_method_calls(); 
}

fint MonitorCallsToVM::code_capacity() { return Memory->code->capacity(); }

