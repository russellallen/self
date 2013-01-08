/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>


int main(int argc, char** argv) {
  struct stat buf;

  if (argc == 2) {
    if (!lstat(argv[1], &buf)) {
      if ((buf.st_mode & S_IFLNK) == S_IFLNK) {
	exit(0);
      } else {
	exit(1);
      }
    } else {
      perror("lstat failed");
    }
  } else {
    printf("usage: %s filename        returns 0 if file is a link\n", argv[0]);
  }
}
