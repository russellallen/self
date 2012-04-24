/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# ifdef XLIB

  extern const char* Display_seal;

  Display* XOpenDisplay_wrap(char*, void*);
  void XCloseDisplay_wrap(Display*);

# define xlib_static_glue \
 C_func_1(proxy,(Display*,Display_seal), XOpenDisplay_wrap, XOpenDisplay_glue, \
          fail, string_null,)                                                  \
 C_func_1(void,, XCloseDisplay_wrap, XCloseDisplay_glue,,                      \
          proxy,(Display*,Display_seal))

# define WHAT_GLUE PROTOTYPES
    xlib_static_glue
# undef  WHAT_GLUE


  class XErrorHandlers {
   public:
    static int handle_X_error(Display*, XErrorEvent*);
    static int handle_X_IO_error(Display*);
   private:
    static void print_stack_and_abort();
  };
  
# endif
