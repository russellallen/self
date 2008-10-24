/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# include "_glueDefs.cpp.incl"
# include "termcap.primMaker.hh"

//# define WHAT_GLUE C_DECLS
//    termcap_glue
//# undef WHAT_GLUE

#ifdef DYNAMIC
VERIFYCHECKSUM
#endif

// Interface to termcap
extern "C" {
int   tgetnum(char *id);
int   tgetflag(char *id);
int   tgetent(char *bp, char *name);
char *tgetstr(char id[2], char **area);
char *tgoto(char *cap, int col, int row);
}

static char termcap_buffer[1024];
static char termcap_decode_area[100];

char *tgetenv_wrapper(char *name, void *FH) {
  if( tgetent( termcap_buffer, name) != 1 ) unix_failure(FH);
  return termcap_buffer;
}

char *tgetstr_wrapper(char *id, void *FH) {
  char *area = termcap_decode_area;
  if( tgetstr( id, &area) == 0 ) unix_failure(FH);
  return termcap_decode_area;
}

char *tgoto_wrapper(char *cm, int destcol, int destline, void *FH) {
  char *goto_string;
  if( (goto_string = tgoto( cm, destcol, destline)) == 0 ) unix_failure(FH);
  return goto_string;
}

# define WHAT_GLUE FUNCTIONS
    termcap_glue
# undef WHAT_GLUE
