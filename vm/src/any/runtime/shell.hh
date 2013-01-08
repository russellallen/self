/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


void  abortSelf();                      // handle ^C

oop   evalExpressions(Scanner* scanner);

oop   eval(char* expression, const char* fn = "<an eval string>");

extern const char **prog_argv;
extern int          prog_argc;

void  run_the_VM();

extern char* startUpSelfFile;
