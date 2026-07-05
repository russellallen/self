/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include <stdio.h>
# include <stdlib.h>
# include <string.h> // jaguar

static char* program;

void usage() {
  fprintf(stderr, "Usage: %s file...\n", program);
  fprintf(stderr, "    or %s -h (to get this message)\n", program);
}

struct File {
  char* path;

  File(char* s) { path = (char*) malloc(strlen(s) + 1); strcpy(path, s); }
  ~File() { free(path); }

  int addTrailingNewline();
};

int File::addTrailingNewline() {
  FILE* file;
  if (!(file = fopen(path, "r+"))) {
    fprintf(stderr, "Couldn't open %s for writing\n", path);
    return -1;
  }
  
  // seek to end of file
  if (fseek(file, -1, 2)) {
    fprintf(stderr, "Couldn't seek to end of %s\n", path);
    if (fclose(file)) {
      fprintf(stderr, "Couldn't close %s\n", path);
    }
    return -1;
  }
  
  // read last character
  int ch = getc(file);
  if (ch == EOF) {
    fprintf(stderr, "Internal error: didn't really seek to end of %s\n",
	    path);
    if (fclose(file)) {
      fprintf(stderr, "Couldn't close %s\n", path);
    }
    return -1;
  }
  // just test to make sure
  if (getc(file) != EOF) {
    fprintf(stderr, "Internal error: didn't really seek to end of %s\n",
	    path);
    if (fclose(file)) {
      fprintf(stderr, "Couldn't close %s\n", path);
    }
    return -1;
  }
  
  // append newline if not already there
  if (ch != '\n') {
    if (putc('\n', file) != '\n') {
      fprintf(stderr, "Couldn't append newline to %s\n", path);
      if (fclose(file)) {
	fprintf(stderr, "Couldn't close %s\n", path);
      }
      return -1;
    } else {
      fprintf(stderr, "Added newline to %s\n", path);
    }
  }
  
  if (fclose(file)) {
    fprintf(stderr, "Couldn't close %s\n", path);
    return -1;
  }

  return 0;
}

int main(int argc, char** argv) {
  program = argv[0];

  while (--argc,++argv, argc>=1 && ((*argv)[0] == '-')) {
    switch ((*argv)[1]) {
     case 'h': usage(); exit(0);
     case '\0': goto done;
     default:
      fprintf(stderr, "Option %s unknown.\n", *argv);
      usage(); exit(-1);
    }
  }
 done: ;

  for (; argc>=1; --argc,++argv) {
    File f(*argv);
    f.addTrailingNewline();
  }

  exit(0);
}
