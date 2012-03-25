# include <stdlib.h>
# include <fcntl.h>
# include <stdio.h>
# include <sys/mman.h>

// $Revision: 30.2 $

int
main(int argc, char* argv[]) {
	if (argc <= 1) {
   		fprintf(stderr, "Usage: %s testFile test args...\n", argv[0]);
		exit(1);
	}
	FILE* f = fopen(argv[1], "r");
	if (f == NULL) {
		perror(argv[1]);
		exit(1);
	}
	if (fseek(f, 0, SEEK_END)) {
		perror("seek");
		exit(1);
	}
	int len = ftell(f);
	rewind(f);
	char* buf = new char[len];
	if (fread(buf, len, 1, f) != 1) {
		perror("fread");
		exit(1);
	}
  	mprotect(buf, len, PROT_EXEC || PROT_READ || PROT_WRITE);
	typedef int (*fn_t)(...);
	int args[3];
	int argsToSkip = 2; // name of me, name of testfile
	for (int i = 0; i < argc - argsToSkip;  ++i)
		args[i] = atoi(argv[i + argsToSkip]);
	int r = ((fn_t)buf) (args[0], args[1], args[2]);
	printf("result = %d\n", r);
}
