/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

#include <stdio.h>
#include <std.h>
#include <syscall.h>
#include <sys/types.h>

extern "C" {
  int chroot(char*);
  int seteuid(uid_t);
};

char* lockFile[] = {
  "/pub/bin/self/.lock",
  "/pub/bin/sun3/.lock",
  "/pub/bin/sun4/.lock",
  NULL
};

char* docfile = "/etc/hello";

int main(int argc, char** argv) {
  argc, 0;
  if (chroot("/home/ftp") < 0) {	// must be setuid root at this time
    perror("chroot");
    exit(1);
  }
  if (seteuid(getuid()) < 0) {		// reset effective uid
    perror("seteuid");
    exit(1);
  }

  FILE* f = NULL;
  // print hello message etc
  f = fopen(docfile, "r");
  if (f) {
    char buf[16000];
    fread(buf, 1, 16000, f);
    printf("%s\n", buf);
  }

  // check for locks
  f = NULL;
  for (int i = 0; lockFile[i] && f == NULL; i++) {
    f = fopen(lockFile[i], "r");
  }

  if (f != NULL) {
    printf("\n\nSorry - the Self distribution is being updated right now.\n");
    printf("Please try again later.\n\n");
    exit(2);
  }
  
  if (execv("/bin/ftp", argv) < 0) {	// and start ftp
    perror("execv");
    exit(1);
  }
}
