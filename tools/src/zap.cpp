/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// zap sends signal SIGKILL to all processes owned by you 
// and which command line has argv[1] as prefix.

#include <stdio.h>
#include <string.h> // jaguar
#include <signal.h>
#include <sys/param.h>
#include <unistd.h>
#include <stdlib.h>

#if defined(sun) || defined(__sun)
# include <sys/systeminfo.h>
# define MAXHOSTNAMELEN 257
# define gethostname(h,l) sysinfo(SI_HOSTNAME,(h),(l)) 
#endif

const char *ps = "ps -gx";

char hostname[MAXHOSTNAMELEN];

void kill_if_match(int pid, char *pid_text, char *match_text) {
  int i;
  int ok = 1;

  for (i = 0; i < strlen(match_text); i++)
    ok = ok && match_text[i] == pid_text[i];

  if (ok && (pid_text[i] == ' ' || pid_text[i] == '\0')) {
    printf("Zapping \"%s\"(%d) on %s.\n", 
      pid_text, pid,
      gethostname(hostname, MAXHOSTNAMELEN) ? "unknown host" : hostname);
    kill( pid, SIGKILL);
  }
}

#if !defined(__APPLE__)
  extern "C" FILE *popen(...);
# endif

int main(int argc, char **argv) {
  FILE *fin;
  char buf[BUFSIZ];
  int pid, text_pos, i;
  char *pid_text;

  if (argc != 2) {
    fprintf( stderr, "usage: %s <name>\n", argv[0]);
    exit(1);
  }

  if ((fin = popen(ps, "r")) == 0) {
    fprintf( stderr, "%s: can't run %s\n", argv[0], ps);
    exit(1);
  }

  if (fgets(buf, sizeof buf, fin) == 0) {
    fprintf( stderr, "cant read from process\n" );
    exit(1);
  }

  for ( i=0; buf[i] != 'C' && buf[i] != '\0'; i++);
  if (buf[i] == 'C')
    text_pos = i;
  else{
    fprintf( stderr, "%s: can't find C in COMMAND column\n", argv[0]);
    exit(1);
  }

  while (fgets(buf, sizeof buf, fin) != 0) {
    sscanf(buf, "%d", &pid);
    buf[strlen(buf)-1] = '\0';
    pid_text = &buf[text_pos];
    kill_if_match( pid, pid_text, argv[1]);
  }
}
