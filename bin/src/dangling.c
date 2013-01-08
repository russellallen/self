/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>

/*
 * tests whether a named file is a dangling link
 */

const char usage[] = "usage: dangling file\n";

main(argc, argv)
     int argc;
     char *argv[];
{
    struct stat buf;
    dev_t  dev;
    ino_t  ino;

    if (argc != 2) {
	fprintf(stderr, usage);
	exit(2);
    }
    
    if (lstat(argv[1], &buf) != 0) {
	fprintf(stderr, "can't read directory information for %s\n", argv[1]);
	perror("dangling");
	exit(2);
    }

    if ((buf.st_mode & S_IFMT) == S_IFLNK) {
	/* symbolic link */
	if (stat(argv[1], &buf) != 0) {
	    /* error accessing linked-to file -- assume dangling link */
	    exit(0);
	}
    }

    exit(1);			/* not dangling link */
}
