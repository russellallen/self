/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>

/*
 * resets the read and modified times of the argument file[s]
 */

static char usage[] = "usage: resetTime file ...\n";

static struct timeval tvp[2] = { 1, 0, 1, 0 };

main(argc, argv)
int argc;
char *argv[];
{
  register int i;

  for (i = 1; i < argc; i ++) {
    int e = utimes(argv[i], tvp);
    if (e) {
      perror("resetTime");
      exit(-1);
    }
  }

  exit(0);
}
