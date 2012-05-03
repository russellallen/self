/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

# include <stdarg.h>

// use lprintf instead of lprintf for VM debugging messages
// Currently, the message is logged to a file if LogVMMessages is true and
// printed to stderr if PrintVMMessages is true

typedef const char* lprint_format_t; // const for MW 6


extern "C" void lprintf(lprint_format_t m, ...);
                        
extern "C" void lprint_error(lprint_format_t m, ...);
                        
extern "C" void lprint_warning(lprint_format_t m, ...);
                        
extern "C" void volatile lprint_fatal(const char* file, int line, lprint_format_t m, ...);
                        
extern "C" void volatile lprint_fatalNoMenu(const char* file, int line, lprint_format_t m, ...);

// like sprintf, but updates the buf pointer so that subsequent
// sprintf invocations append to the string
extern "C" void mysprintf(char*& buf, lprint_format_t fmt, ...);

void flush_logFile();


extern "C" void volatile lprintf_string(int len, const char* bytes);
extern "C" void volatile lsprintf_string(char* buf, int len, const char* bytes);



// In case you want to "override" lprintf
void vlprintf(const char* msg, va_list ap);
