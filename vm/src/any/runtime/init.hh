/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// init_globals replaces C++ global objects so we can use the standard linker
// to link Self (which is at least twice as fast as using the GNU C++ linker). 
// Also, init.c gives explicit control over the sequence of initialization.

// Programming convention: instead of using a global object (e,g, "Foo foo;"), 
// use "Foo* foo;", create a function init_foo() in foo.c, and add a call
// to init_foo in init.c.

void init_globals();            // call constructors at startup

extern bool do_exit_cleanup;
void prepare_to_exit_self();
