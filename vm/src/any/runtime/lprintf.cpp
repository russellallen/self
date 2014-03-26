/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "lprintf.hh"
# include "os.hh"
# include "sig.hh"
# include "signalBlocker.hh"
# include "top_includes.hh"
# include "types.hh"
# include "util.hh"

# include <stdarg.h>

static FILE* logFile = NULL;
static char fname[80];

// dont't use include files for the thing below because this would include
// the conflicting defs of lprintf et al.
extern bool PrintVMMessages;
extern bool LogVMMessages;
extern "C" {
  void breakpoint();
  void error_breakpoint();
  volatile void fatal_handler();
}

void lprintf_exit() {
  if (logFile) {
    fclose(logFile);
    logFile = NULL;
    unlink(fname);
  }
}


void vlprintf(const char* msg, va_list ap) {
  char buf[10000];
  vsprintf(buf, msg, ap);
    
  if (LogVMMessages && !logFile) {
    logFile = fopen(OS::log_file_name(), "w");
  }
  if (LogVMMessages) {
    fputs(buf, logFile);
    fflush(logFile);
  }
  if (PrintVMMessages) {
    # if TARGET_OS_VERSION == MACOSX_VERSION \
      || TARGET_OS_VERSION ==  LINUX_VERSION
      // Mac OS X does not patch write: to restart when signals arrive
      SignalBlocker sb; // ensure nothing is lost on OS X -- dmu 2/03
    # endif
    fflush(stdout);
    fputs(buf, stderr);
    fflush(stderr);
  }
}


extern "C" void lprintf(lprint_format_t msg, ...) {
  va_list ap;
  va_start(ap, msg);
  vlprintf(msg, ap);
  va_end(ap);
}


extern "C" void lprint_error(lprint_format_t msg, ...) {
  bool saved = PrintVMMessages; PrintVMMessages = true;
  lprintf("Self VM error: " );
  va_list ap;
  va_start(ap, msg);
  vlprintf(msg, ap);
  va_end(ap);
  lprintf("\n" );
  error_breakpoint();
  PrintVMMessages = saved;
}

extern "C" void lprint_warning(lprint_format_t msg, ...) {
  bool saved = PrintVMMessages; PrintVMMessages = true;
  lprintf("Self VM warning: ", 0);
  va_list ap;
  va_start(ap, msg);
  vlprintf(msg, ap);
  va_end(ap);
  lprintf("\n" );
  breakpoint();
  PrintVMMessages = saved;
}

extern "C" volatile void lprint_fatal(const char* file, int line, lprint_format_t msg, ...) {
  bool saved = PrintVMMessages; PrintVMMessages = true;
  lprintf("Self VM fatal error (%s, line %ld): ", file, (void*)line );
  va_list ap;
  va_start(ap, msg);
  vlprintf(msg, ap);
  va_end(ap);
  lprintf("\n");
  PrintVMMessages = saved;
  fatal_handler();
}

extern "C" volatile void lprint_fatalNoMenu(const char* file, int line, lprint_format_t msg, ...) {
  Unused(file);
  Unused(line);
  bool saved = PrintVMMessages; PrintVMMessages = true;
  lprintf("\n\nSelf: fatal error: ");
  va_list ap;
  va_start(ap, msg);
  vlprintf(msg, ap);
  va_end(ap);
  lprintf("\n");
  PrintVMMessages = saved;
  breakpoint();
  OS::terminate(1);
}

void flush_logFile() { if (logFile) fflush(logFile); }

extern "C" void mysprintf(char*& buf, lprint_format_t fmt, ...) {
  // like sprintf, but updates the buf pointer so that subsequent
  // sprintfs append to the string
  va_list ap;
  va_start(ap, fmt);
  vsprintf(buf, fmt, ap);
  va_end(ap);
  buf += strlen(buf);
}


volatile void fatal_handler() {
  error_breakpoint();
  SignalInterface::simulate_fatal_signal();
  OS::terminate(-1);
}

static const int max_len = 500; // really 509 but I'll be conservative
// I wrote these becase MetroWerks crashes on a %.*s where length is > 509 or something
void volatile lprintf_string(int len, const char* bytes) {
  for (char *p = (char*)bytes, *end = (char*)bytes + len;  p  <  end;  p += max_len)
    lprintf("%.*s", min(max_len,  end - p), p);
}

void volatile lsprintf_string(char* buf, int len, const char* bytes) {
  for (char *p = (char*)bytes, *end = (char*)bytes + len, *dst = buf;  p  <  end;  p += max_len,  dst += max_len)
    sprintf(dst, "%.*s", min(max_len,  end - p), p);
}
