#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "os_includes.hh"
# include "top.hh"



// Timers for simple measurements


class timer {                  // measures user CPU time in ms
 public:
  int32 user_time;
  
  timer() {}
  void start() { user_time = OS::cpu_time(); }
  int32 time() { return OS::cpu_time() - user_time; }
  int32 secs() { return (time() + 500) / 1000; }
  int32 millisecs() { return time(); }
  int32 timeRestart() { int32 t = time(); start(); return t; }
  int32 secsRestart() { return (timeRestart() + 500) / 1000; }
};

class startTimer: public timer {
 public:
  startTimer() { start(); }
};

// portable version: must be subclassed:

class ElapsedTimer {            // measures elapsed time in us
 private:
  bool is_running;

  static const long  one_million;
  static const float one_thousand;
  
 public:
 
  ElapsedTimer(bool start_timer = false) { init(start_timer); }
  void reset();
  void start();
  void stop();

  float millisecs();
  fint  secs();

  void print();

 private:

  void init(bool start_timer);
  void reset_platform();
 
//# if TARGET_OS_FAMLIY == UNIX_FAMILY 
# include "timer_unix.hh"
//# endif

};

