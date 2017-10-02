/* Sun-$Revision: 30.8 $ $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "timer.hh"

// gdb 4.7 has this nasty bug causing lots of sig 8s after evaluating stuff
// from the command line.  Set workAroundSignal8Bug to true to get rid of
// must of these signals (but return incorrect times).   -Urs 12/92
bool workAroundSignal8Bug = false;


void ElapsedTimer::reset_platform() {
  t.tv_sec = t.tv_usec = 0;
}
  

void ElapsedTimer::start() { 
  if (!is_running) {
    gettimeofday(&start_time, 0);
    is_running = true;
  }
}


void ElapsedTimer::stop() {
  if (is_running) {
    timeval stop_time;
    gettimeofday(&stop_time, 0);
    is_running = false;

    if (stop_time.tv_usec < start_time.tv_usec) {
      assert( stop_time.tv_sec > start_time.tv_sec, "secs must have inc.");
      t.tv_sec  += stop_time.tv_sec  - start_time.tv_sec - 1;
      t.tv_usec += one_million - (start_time.tv_usec - stop_time.tv_usec);
    } else {
      t.tv_sec  += stop_time.tv_sec  - start_time.tv_sec;
      t.tv_usec += stop_time.tv_usec - start_time.tv_usec;
    }

    // Check for usec overflow 
    if (t.tv_usec > one_million) {
      t.tv_usec -= one_million;
      t.tv_sec++;
    }
  }
}

float ElapsedTimer::millisecs() { 
  if (workAroundSignal8Bug) return 1.0;
  return (float) t.tv_sec * one_thousand + (float) t.tv_usec / one_thousand;
}


fint ElapsedTimer::secs() { 
  if (workAroundSignal8Bug) return 0;
  return  t.tv_usec < one_million/2 ? t.tv_sec : t.tv_sec + 1; 
}
