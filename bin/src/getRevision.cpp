/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# include <stdio.h>
# include "rcsfile.hh"

extern "C" void exit(int);

main(int argc,char* argv[])
//  Searches the files for an occurrence of, "$Revision:" and print out
//  the ident following this pattern.
{
  if (argc < 2) {
    fprintf(stderr, "Usage: %s <file> ... \n", argv[0]);
    exit(1);
  }
  char *revision;
  for(int i = 1; i < argc; i++) 
    switch (getRevision(argv[i], &revision)) {
     case GOT_REVISION:
      printf("%s\n", revision); exit(0);
     case NO_REVISION:
      fprintf(stderr, "no revision number in %s\n", argv[i]);
      exit(1);
     default:
      fprintf(stderr, "%s failed on %s\n",argv[0], argv[i]);
      exit(1);
    }
}
