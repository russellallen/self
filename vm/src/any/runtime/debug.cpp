/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "debug.hh"
# include "_debug.cpp.incl"

# define DefineFlags(                                                         \
    flagName, flagType, flagTypeName, primReturnType,                         \
    initialValue, getCurrentValue, checkNewValue, setNewValue,                \
    explanation, wizardOnly)                                                  \
                                                                              \
    flagType flagName = initialValue;

FOR_ALL_DEBUG_PRIMS(DefineFlags)



void debug_init() {
  // initialize debug flags that use function calls
  DirPath = copy_c_heap_string("");   // so we can use free() when changing it
  SpyDisplay = copy_c_heap_string("");
  SpyFont = copy_c_heap_string("");
}

# undef DefineFlags



# if  GENERATE_DEBUGGING_AIDS

extern "C" void start_gdb_debugging() {
  // set up stuff for debugging a crashed process (call this after attach)
  // turn off timers etc. to prevent gdb crashes
  SignalBlocker sb(SignalBlocker::allow_user_int);
  static bool gdb_debugging_called = false;
  if (gdb_debugging_called) return;     // prevent multiple calls
  gdb_debugging_called = true;
  IntervalTimer::dont_use_any_timer = true;
  IntervalTimer::disable_all(true);
  TheSpy->deactivate();
  WizardMode = PrintOopAddress = true;
  flush_logFile();
}

extern "C" void redirect_stdio(char* filename) {
  // for debugging; redirect input/output to gdb window
  start_gdb_debugging();
  char devname[20];
  char* fn;
  static FILE* res;
  if (strlen(filename) == 2) {
    // shortcut: name of pseudo-tty from ps, e.g "p0" == "/dev/ttyp0"
    sprintf(devname, "/dev/tty%s", filename);
    fn = devname;
  } else {
    fn = filename;
  }
  res = freopen (fn, "a+", stdout);
  if (res) {
    lprintf("stdout redirected to %s.\n", fn);
  } else {
    lprintf("stdout couldn't be redirected to %s.\n", fn);
    perror("redirection failed");
  }
  res = freopen (fn, "a+", stderr);
  if (res) {
    lprintf("stderr redirected to %s.\n", fn);
  } else {
    lprintf("stderr couldn't be redirected to %s.\n", fn);
    perror("redirection failed");
  }
  res = freopen (fn, "r", stdin);
  if (res) {
    lprintf("stdin redirected to %s.\n", fn);
  } else {
    lprintf("stdin couldn't be redirected to %s.\n", fn);
    perror("redirection failed");
  }
  fflush(stderr);
}

#endif
