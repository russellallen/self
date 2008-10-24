/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifndef __linux__
# include <libc.h> // jaguar
# endif

# include <stdio.h>
# include <dirent.h>
# include <sys/types.h>
# include <sys/stat.h>
# include <sys/param.h>
# include <string.h>
# include <unistd.h>

#if TARGET_OS_VERSION == SUNOS_VERSION
# define getcwd(p,l) getwd(p)
extern "C" char *getwd(char []);
extern "C" void  exit(int);
#endif

# ifdef __linux__
# include <cstdlib>
# endif

/* Check if current working directory is rooted in argv[1]. */

void getstat(char *path,struct stat *s) {
  if (stat(path, s) == -1) {
    fprintf(stderr,"stat failed on %s\n", path);
    exit(1);
  }
}

int equal(struct stat *a, struct stat *b) {
  return (a->st_ino == b->st_ino) && (a->st_dev == b->st_dev);
}

main(int argc, char **argv){
  struct stat root;
  struct stat leaf;
  char current[MAXPATHLEN];
  char *p, *s;

  if (argc != 2) {
    fprintf(stderr, "Usage: %s directory\n", argv[0]);
    fprintf(stderr, "Returns 0 iff cwd is rooted in directory.\n");
    fprintf(stderr, "Furthermore it prints the path from directory to cwd.\n");
    exit(1);
  }

  if (!getcwd(current, MAXPATHLEN)) {
    fprintf(stderr, "getcwd failed with %s\n", current);
    exit(1);
  }

  getstat(argv[1], &root);
  getstat(current, &leaf);

  if (equal(&root,&leaf)) {
    printf(".\n");
    exit(0);
  }
     
  s = (char *) strdup(current);

  while ((p = strrchr(s, '/')) && (p != s)) {
    *p = '\0';
    getstat(s, &leaf);
    if (equal(&root,&leaf)) {
      printf("%s\n", &current[p-s+1]);
      exit(0);
    }
  }
  fprintf( stderr, "%s is not rooted in %s.\n", current, argv[1]);
  exit(1);
}
