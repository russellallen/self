/* Sun-$Revision: 30.7 $ $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "timer.hh"
# pragma implementation "timer_abstract.hh"
# pragma implementation "timer_inline.hh"

# include "_timer.cpp.incl"

const long  ElapsedTimer::one_million  = 1000 * 1000;
const float ElapsedTimer::one_thousand = 1000.0;


void ElapsedTimer::init(bool start_timer) {
  reset(); 
  if (start_timer) start();
}

void ElapsedTimer::reset() { 
  is_running = false;
  reset_platform();
}


void ElapsedTimer::print() { 
  lprintf("%2.2f (ms)", millisecs()); 
}
