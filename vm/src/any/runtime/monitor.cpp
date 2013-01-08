/* Sun-$Revision: 30.8 $ */

/* Copyright 1998-2006 Sun Microsystems, Inc.
   See the LICENSE file for license information. */
   
// Implementation of general (abstract) spy.


# pragma implementation "monitor.hh"

# include "_monitor.cpp.incl"

// Variables:

Monitor* TheSpy;


// Creation (& destruction)

Monitor::Monitor() : _mw() {
  incremental = _is_active = false; 
  logf = 0; logfn = 0;
}

Monitor::~Monitor() { deactivate(); }


// Activating


void Monitor::activate(const char* filename)   {
  _measurements_per_second = get_measurements_per_second();
  if (filename) {
    logfn = OS::strdup(filename);
    logf = open_log_file(logfn);
  }
  if (!mw()->open_and_resize(this)) {
    _is_active = false;
    return;
  }
  _is_active = true; // this must be true so resize_mem_zone_bars, e.g. works 
  bool gotSema = _mw.pw->pre_draw(false);
  if (!gotSema) warning("could not get graphics semaphore");
  initialize_contents(); // does drawing, must do pre_draw above
  if (gotSema) _mw.pw->post_draw(false);
  incremental= false; // be sure to redraw whole thing  
  tick_redraw(); // draw the inside now
  enroll();        
}


void Monitor::deactivate() {
  if (!is_active())
    return;
  // must falsify me before calling mw()->close() to prevent recursion
  _is_active = false;
  withdraw();
  mw()->close();
  if (logf != 0) {
    fclose(logf); 
    logf = 0; 
  } 
}


// And the log file...

FILE* Monitor::open_log_file(const char* filename) {
  FILE* logf = fopen(filename, "w");
  if (!logf) {
    perror("spy: cannot open log file");
  } 
  else {
    // NB: must allocate buffer here because default file buffer is allocated
    // lazily --> crash if first write to file is in tick_*() when tick
    // interrupts another malloc
    char* buf = AllocateHeap(32 * K, "spy log buffer");
    OS::set_log_buf(logf, buf, 32 * K);
  }
  return logf;
}


void Monitor::reset_log() {
  if (logf) {
    // you might think that ftruncate would do the job...but it doesn't work
    // (SunOS 4.1.3)
    FILE* f = logf;
    logf = 0;
    fclose(f);
    unlink(logfn);
    logf = open_log_file(logfn);
  }
}


void Monitor::annotate_log(const char* fn) {
  if (logf) {
    SignalBlocker sb;   // to block timer ticks 
    fputc('\n', logf);
    fputc('%',  logf);
    fputs(fn, logf);
    fputc('\n', logf);
  }
}



// Enrolling/withdrawing the periodic interrupt handler(s)


void Monitor::enroll() {
  // sync because mac needs it and because of X race condition
  IntervalTimer::Real_timer()->enroll_async_if_safe( _measurements_per_second, monitor_tick);
}

void Monitor::withdraw() {
  IntervalTimer::Real_timer()->withdraw(monitor_tick); // removes monitor_tick_measure, too
}

void Monitor::full_redraw() {
  incremental= false;
  tick_redraw();
}


// ==============================================

// Meat: starting with the interrupt handlers:



// this is called at every tick of our timer, synchronously
void Monitor::monitor_tick() {
  // need the casts to circumvent C++ funny privacy rules!
  TheSpy->tick_measure(); // cannot crawl up stack async, hit 68k frames    
  TheSpy->tick_redraw();
}
  
  
void Monitor::adjust_after_resize() {
  resize_contents();
}


fint Monitor::max_height() {
  if (!is_active()) return 0;
  return mw()->height();
}


// General indicator locations:

int Monitor::ind_w()        {  return  5*mw()->font_width(); }
int Monitor::ind_h()        {  return  mw()->font_height() + 2; }
int Monitor::ind_gap()      {  return  ind_h() + 1; }
int Monitor::ind_bar_w()    {  return  6*mw()->font_width(); }
int Monitor::ind_bar_h()    {  return  ind_h() / 2; }
int Monitor::ind_bar_yoff() {  return  2; }

