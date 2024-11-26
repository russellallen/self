/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef XLIB
 
# pragma implementation "xlibPrims.hh"
# include "_xlibPrims.cpp.incl"

  const char* Display_seal = "Display";

  Display* XOpenDisplay_wrap(char *name, void *FH) {
    // XOpenDisplay fails if a signal is received during the call.
    // All signals except user interrupts are therefore blocked. 
    SignalBlocker sb(SignalBlocker::allow_user_int);
    
    Display* result = XOpenDisplay(name);
    if (result == 0)  {
      prim_failure(FH, PRIMITIVEFAILEDERROR);
      return result;
    }

      XSetErrorHandler(XErrorHandlers::handle_X_error);
    XSetIOErrorHandler(XErrorHandlers::handle_X_IO_error);

    // add this file descriptor to list of all open files
#ifdef USE_EPOLL
    register_file_descriptor(ConnectionNumber(result));
#else
    FD_SET(ConnectionNumber(result), &activeFDs);
#endif
    return result;
  }

  void XCloseDisplay_wrap(Display* display) {
    int fd = ConnectionNumber(display);
#ifdef USE_EPOLL
    struct epoll_event event;
    if (epoll_ctl(epollFD, EPOLL_CTL_DEL, fd, &event) < 0) {
      printf("epoll_ctl delete for X11 descriptor failed: %s\n", strerror(errno));
    }
#else
    FD_CLR(fd, &activeFDs);
#endif
    XCloseDisplay(display);
  }

# define WHAT_GLUE FUNCTIONS
    xlib_static_glue
# undef  WHAT_GLUE

  int XErrorHandlers::handle_X_error(Display* disp, XErrorEvent* error) {
    const int msg_buf_len = 100;
    char buf[msg_buf_len];
    XGetErrorText(disp, error->error_code, buf, msg_buf_len);
    if (TheSpy->is_active()  &&  disp == (Display*)TheSpy->mw()->pw->xdisplay()) {
      if (PrintSpyXErrors) {
        warning2("X Error in the Spy: %s (request code %d).\n",
                 buf, (int)error->request_code);
      }
    } 
    else {
      lprintf("X Error: %s.\n", buf);
      print_stack_and_abort();
    }
    return(0);
  }

  // the X I/O error handler must not return (or X will abort Self)
  int XErrorHandlers::handle_X_IO_error(Display* display) {
    Unused(display);
    const char *msg= "X I/O Error .. aborting process.\n";
    ssize_t ret;   // to mollify compiler
    ret = write(1, msg, strlen(msg)); // don't use lprintf (calls malloc)
    print_stack_and_abort();
    return ret;    // to mollify compiler
  }
 

  void XErrorHandlers::print_stack_and_abort() {
    //  currentProcess->stack()->print();  // this corrupts the system
    currentProcess->abort();
  }
  
# endif
