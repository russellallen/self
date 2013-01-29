# include <stdlib.h>
# include <fcntl.h>
# include <stdio.h>
# include <sys/mman.h>
# if defined(__APPLE__) \
  && defined(__ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__) \
  && ((__ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__-0) >= 1050)
  # include <libkern/OSCacheControl.h>
  # define DO_INVALIDATE_ICACHE
# endif
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
  	mprotect(buf, len, PROT_EXEC | PROT_READ | PROT_WRITE);
#if defined(DO_INVALIDATE_ICACHE)
	sys_icache_invalidate(buf, len);
#endif
	typedef int (*fn_t)(...);
	int args[3];
	int argsToSkip = 2; // name of me, name of testfile
	for (int i = 0; i < argc - argsToSkip;  ++i)
		args[i] = atoi(argv[i + argsToSkip]);
	int r = ((fn_t)buf) (args[0], args[1], args[2]);
	printf("result = %d\n", r);
}
