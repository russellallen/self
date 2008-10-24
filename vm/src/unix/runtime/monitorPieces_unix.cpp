/* Sun-$Revision: 30.13 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# include "_monitorPieces_unix.cpp.incl"

 
const int one_billion = 1000 * 1000 * 1000;

ProcessTime ProcessTime::get_real_time() {
  ProcessTime res;
  struct timeval t;
  if (gettimeofday(&t, 0))       perror("unable to set real_time");
  res._secs      = t.tv_sec;
  res._nano_secs = t.tv_usec * 1000;
  return res;
}


# if  TARGET_OS_VERSION == SOLARIS_VERSION

static int       process_info_fd = -1;
static prusage_t process_info_pr;


void processInfo_init() {
  char buffer[12]; // len("/proc/NNNNN") + 1
  sprintf(buffer, "/proc/%05ld", getpid());
  process_info_fd = open(buffer, O_RDONLY);
}

void ProcessInfo::update() {
  if (ioctl(process_info_fd, PIOCUSAGE, &process_info_pr) == -1) 
    perror("ioctl");
}

int ProcessInfo::page_faults_IO()             { return process_info_pr.pr_majf;  }
int ProcessInfo::page_faults_NonIO()          { return process_info_pr.pr_minf;  }
int ProcessInfo::block_input_operations()     { return process_info_pr.pr_inblk; }
int ProcessInfo::block_output_operations()    { return process_info_pr.pr_oublk; }
int ProcessInfo::forced_context_switches()    { return process_info_pr.pr_ictx;  }
int ProcessInfo::voluntary_context_switches() { return process_info_pr.pr_vctx;  }

ProcessTime ProcessInfo::user_time() {
  ProcessTime t;
  t._secs      = process_info_pr.pr_utime.tv_sec;
  t._nano_secs = process_info_pr.pr_utime.tv_nsec;
  return t;
}
ProcessTime ProcessInfo::system_time(){
  ProcessTime t;
  t._secs      = process_info_pr.pr_stime.tv_sec;
  t._nano_secs = process_info_pr.pr_stime.tv_nsec;
  return t;
} 

# elif  TARGET_OS_VERSION == SUNOS_VERSION  \
  ||  TARGET_OS_VERSION ==   LINUX_VERSION

static struct rusage process_info_ru;

extern "C" int getrusage(int who, struct rusage *rusage);

void processInfo_init() { }

void ProcessInfo::update() { 
  if (getrusage(RUSAGE_SELF, &process_info_ru)) perror("getrusage");
}

int ProcessInfo::page_faults_IO()             { return process_info_ru.ru_majflt;  }
int ProcessInfo::page_faults_NonIO()          { return process_info_ru.ru_minflt;  }
int ProcessInfo::block_input_operations()     { return process_info_ru.ru_inblock; }
int ProcessInfo::block_output_operations()    { return process_info_ru.ru_oublock; }
int ProcessInfo::forced_context_switches()    { return process_info_ru.ru_nivcsw;  }
int ProcessInfo::voluntary_context_switches() { return process_info_ru.ru_nvcsw;   }

ProcessTime ProcessInfo::user_time() {
  ProcessTime t;
  t._secs      = process_info_ru.ru_utime.tv_sec;
  t._nano_secs = process_info_ru.ru_utime.tv_usec * 1000;
  return t;
}

ProcessTime ProcessInfo::system_time(){
  ProcessTime t;
  t._secs      = process_info_ru.ru_stime.tv_sec;
  t._nano_secs = process_info_ru.ru_stime.tv_usec * 1000;
  return t;
} 

# elif  TARGET_OS_VERSION == MACOSX_VERSION

// Use Mach facilities; could try SUNOS version, too.
// -- dmu 2/04

# include <mach/mach.h>
# include <mach/mach_error.h>

static thread_basic_info my_thread_info;
static  task_events_info   my_task_info;

void processInfo_init() {
}

void ProcessInfo::update() {
  SignalBlocker sb; // attempt to head off weird mach errors
  
  unsigned int thread_info_count = THREAD_BASIC_INFO_COUNT;
  unsigned int   task_info_count =  TASK_EVENTS_INFO_COUNT;
  
  kern_return_t thread_err, task_err;
  thread_err = thread_info( mach_thread_self(),  THREAD_BASIC_INFO,  (thread_info_t)&my_thread_info,  &thread_info_count);
    task_err =   task_info( mach_task_self(),     TASK_EVENTS_INFO,    (task_info_t)&  my_task_info,  &  task_info_count);
    
  static bool aw = true,  hw = true;
  if (   task_err == MIG_ARRAY_TOO_LARGE  ||   task_err == MACH_RCV_TOO_LARGE) { if (aw) {aw = false; warning("  task_info has grown"); }    task_err = KERN_SUCCESS; }
  if ( thread_err == MIG_ARRAY_TOO_LARGE  || thread_err == MACH_RCV_TOO_LARGE) { if (hw) {hw = false; warning("thread_info has grown"); }  thread_err = KERN_SUCCESS; }
  
  // I don't know why this sometimes fails, but it's not fatal. -- dmu 2/04
  if (  task_err != KERN_SUCCESS  &&  !aw)  {aw = true; warning1("Error calling   task_info() %s\n", mach_error_string(  task_err)); }
  if (thread_err != KERN_SUCCESS  &&  !hw)  {hw = true; warning1("Error calling thread_info() %s\n", mach_error_string(thread_err)); }
}


int ProcessInfo::page_faults_IO()             { return my_task_info.faults;  }
int ProcessInfo::page_faults_NonIO()          { return 0;  }
int ProcessInfo::block_input_operations()     { return 0; }
int ProcessInfo::block_output_operations()    { return 0; }
int ProcessInfo::forced_context_switches()    { return my_task_info.csw / 2;  } // all switches
int ProcessInfo::voluntary_context_switches() { return my_task_info.csw / 2;  }

// could add (Mach-specific):
//  struct task_events_info {
//          integer_t       faults;         /* number of page faults */
//          integer_t       pageins;        /* number of actual pageins */
//          integer_t       cow_faults;     /* number of copy-on-write faults */
//          integer_t       messages_sent;  /* number of messages sent */
//          integer_t       messages_received; /* number of messages received */
//          integer_t       syscalls_mach;  /* number of mach system calls */
//          integer_t       syscalls_unix;  /* number of unix system calls */
//          integer_t       csw;            /* number of context switches */
//  };

ProcessTime ProcessInfo::user_time() {
  ProcessTime t;
  t._secs      = my_thread_info.user_time.seconds;
  t._nano_secs = my_thread_info.user_time.microseconds * 1000;
  return t;
}

ProcessTime ProcessInfo::system_time() {
  ProcessTime t;
  t._secs      = my_thread_info.system_time.seconds;
  t._nano_secs = my_thread_info.system_time.microseconds * 1000;
  return t;
} 

# else
  # error which?

#endif



void LoadLevelMonitor::compute_load_level() {
  static timeval oldT;
  
  timeval t;
  if (gettimeofday(&t, 0) != 0)
    return;
   
  int32 usecs = 1000000 * (t.tv_sec  - oldT.tv_sec) +
                          (t.tv_usec - oldT.tv_usec);
  oldT = t;
  load_level = 100 * 1000000 / usecs;
}


void InterruptedFrameMonitor::get_frame_and_pc( frame*& f, char*& pc ) {
  f  = InterruptedContext::the_interrupted_context->sp();
  pc = InterruptedContext::the_interrupted_context->pc();
}

