/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

#include <stdio.h>
#include <signal.h>
#include <time.h>
#include <pwd.h>
#include <sys/param.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>

#if TARGET_OS_VERSION == SOLARIS_VERSION
# include <sys/systeminfo.h>
# define MAXHOSTNAMELEN 257
# define gethostname(h,l) sysinfo(SI_HOSTNAME,(h),(l)) 
#endif


# define LOCK_NAME "/tmp/compile_veto"

int lock_fd = -1;
char *lock_fn = NULL;

void cleanup()
{
  if (lock_fn && lock_fd >= 0) {
    (void) close(lock_fd);
    (void) unlink(lock_fn);
  }
}

void cleanup_and_quit(int junk)
{
  cleanup();
  exit(-1);
}

bool check_veto() {
  FILE* veto;
  int n, l_yday, l_hour, l_min;
  char l_user[512];

  veto = fopen(LOCK_NAME, "r");
  if (!veto) return false;
  
  n = fscanf(veto, "%s %d %d %d",
	     l_user, &l_yday, &l_hour, &l_min);
  if (n != 4) {
    fprintf(stderr, "compile lock file %s has wrong format - ignoring\n",
	    LOCK_NAME);
    return false;
  }
  
  struct passwd* pw = getpwuid(getuid());
  if (strcmp(pw->pw_name, l_user) == 0) return false;	/* my own lock */

  /* check date and time */
  time_t t = time(NULL);
  struct tm *tm = localtime(&t);
  if (tm->tm_yday + 1 <= l_yday &&   /* tm has yday 0..365, date uses 1..366 */
      tm->tm_hour * 60 + tm->tm_min < l_hour * 60 + l_min) {
    fprintf(stderr, "user %s vetoes compiles until %d:%02d\n",
	    l_user, l_hour, l_min);
    return true;		     /* user does not want compiles now */
  } else {
    fclose(veto);
    unlink(LOCK_NAME);
    return false;
  }
}
  
int lock_file(char *name) {
  lock_fd = open(name, O_WRONLY | O_CREAT | O_EXCL, 0664);

  if (lock_fd == -1) {
    if (errno == EEXIST) {
      return 0;
    }
    perror(name);
    return 2;
  }

  // write locking host name to lock file (to see which compile locks it)
  char hostname[MAXHOSTNAMELEN];
  gethostname(hostname, MAXHOSTNAMELEN);
  char msg[2*MAXHOSTNAMELEN];
  strcpy(msg, "locked by compile on ");
  strcat(msg, hostname);
  write(lock_fd, msg, strlen(msg));
  return 0;
}

main(int argc, char *argv[]) {
  int  status = 0;
  
  if (argc != 3) {
    fprintf(stderr, "usage:  %s file command-string\n", argv[0]);
    exit(-1);
  }

  lock_fn = argv[1];

  signal(SIGHUP, cleanup_and_quit);
  signal(SIGINT, cleanup_and_quit);
  signal(SIGQUIT, cleanup_and_quit);

  if (check_veto()) {
    status = 1;
  } else {
    status = lock_file(lock_fn);
    if (lock_fd >= 0) {
      status = system(argv[2]);
    }
  }

  cleanup();
  if (status) {
    char hostname[MAXHOSTNAMELEN];
    fprintf(stderr, "%s failed on \"%s\" with status = %d.\n", argv[0], 
	    gethostname(hostname, MAXHOSTNAMELEN) ? "unknown" : hostname,
	    status >> 8);
  }
  exit(status);
}

