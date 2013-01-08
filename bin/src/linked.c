/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>

/*
 * tests whether two named files are linked together
 */

const char usage[] = "usage: linked file1 file2\n";

main(argc, argv)
     int argc;
     char *argv[];
{
    struct stat buf;
    dev_t  dev;
    ino_t  ino;

    if (argc != 3) {
	fprintf(stderr, usage);
	exit(2);
    }
    
    if (stat(argv[1], &buf) != 0) {
	fprintf(stderr, "can't read directory information for %s\n", argv[1]);
	perror("linked");
	exit(2);
    }

    dev = buf.st_dev;
    ino = buf.st_ino;
    
    if (stat(argv[2], &buf) != 0) {
	fprintf(stderr, "can't read directory information for %s\n", argv[2]);
	perror("linked");
	exit(2);
    }

    if (dev == buf.st_dev && ino == buf.st_ino) {
	exit(0);
    }
    else {
	exit(1);
    }
}
