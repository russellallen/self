/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// replaces first occurrence of "from" pattern with "to" pattern
// used to patch object files

# include <stdio.h>
# include <stdlib.h>
# include <ctype.h>
# include <sys/types.h>
# include <sys/stat.h>
# include <memory.h>
# include <string.h>

void usage(char* program_name) {
  printf("usage: %s [ -DTARGET_OS_VERSION=SOLARIS_VERSION | -DTARGET_OS_VERSION=SUNOS_VERSION ] [ -D<ignored> ] patch_file from-label to-label\n",
   program_name);
}

enum {unknown, solaris, bsd};
int os = unknown;

char* entryPoint(char* name) {
  if (os == solaris) return name;
  // prepend an "_"
  char* new_name = (char*) malloc(strlen(name)+2);
  sprintf(new_name, "_%s", name);
  return new_name;
}


int is_match(char* ident, int len,char* pos,char* buf) {
  if (! pos                              ) return 0;
  if (memcmp(ident, pos, len)            ) return 0;
  if (os == solaris) {
    if (! (pos > buf && *(pos-1) == '\0')) return 0;
  } else {
    if (! (pos > buf && *(pos-1) != '_') ) return 0;
  }
  return 1;
}

int main(int argc, char* argv[]) {
  int index = 1;

  while(index < argc && *argv[index] == '-') {
    if (strcmp("-DTARGET_OS_VERSION=SOLARIS_VERSION", argv[1]) == 0) {
      os = solaris;
    } else if (strcmp("-DTARGET_OS_VERSION=SUNOS_VERSION", argv[1]) == 0) {
      os = bsd;
    }
    index++;
  }

  if (os == unknown || (argc - index) != 3) {
    usage(argv[0]);
    exit(1);
  }
    
  char* fname = argv[index++];
  char* from  = entryPoint(argv[index++]);
  char* to    = entryPoint(argv[index++]);
  int   len   = strlen(from);

  if (len != strlen(to)) {
    printf("error: from- and to-patterns have different length\n");
    exit(1);
  }
    
  struct stat sbuf;
  if (!stat(fname, &sbuf)) {
    int   size = int(sbuf.st_size);
    char* buf = (char*) malloc(size);
    char* end = buf + size - len + 1;
    FILE* f = fopen(fname, "r+");
    if (1 !=  fread(buf, size, 1, f)) {
      perror("error");
      exit(1);
    }
    char* fromPos = buf;
    while(1) {
      fromPos = (char*)memchr(fromPos, from[0], end - fromPos);
      if (is_match(from,len+1,fromPos, buf)) break;
      if (fromPos == NULL) {
  printf("error: from pattern (%s) not found\n", from);
  exit(1);
      }
      fromPos++;
    }
    memcpy(fromPos, to, len);
    rewind(f);
    fwrite(buf, size, 1, f);
    free(buf);
    fclose(f);
  } else {
    perror("error");
    exit(1);
  }
}
