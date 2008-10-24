/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

 private:
  int32 sig, timer; 
  
  IntervalTimer(int32 sig, int32 timer);
  
 public: // for IntervalTimerTick
   void do_async_tasks();
  
 public:
  enum { LRU_resolution = 4 }; // LRU timer resolution in secs
