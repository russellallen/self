/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

/*
 * Compares two RCS-style revision numbers; returns -1, 0, or 1 depending
 * whether the first is less than, equal to, or greater than the second.
 * If the two are incomparable (e.g., 1.2 and 1.2.3), print an error.
 */

#include <stdio.h>
#include <memory.h>
# include <stdlib.h>

typedef enum { false, true } bool;

#define MaxFields 4

void usage(progname)
char* progname;
{
    fprintf(stderr, "usage: %s rev1 rev2\n", progname);
    exit(-2);
}

int cmp(a, b, numFields)
int a[];
int b[];
int numFields;
{
    register bool eq = true;
    register int i;
    for (i = 0; i < numFields; i++) {
	if (a[i] > b[i]) {
	    return 1;
	}
	else if (eq && a[i] < b[i]) {
	    eq = false;
	}
    }
    return eq ? 0 : -1;
}

main(argc, argv)
int argc;
char* argv[];
{
    int a[MaxFields + 1];
    int b[MaxFields + 1];

    int aNumFields;
    int bNumFields;

    if (argc != 3) {
	usage(argv[0]);
    }

    memset(a, '\0', sizeof(a));
    memset(b, '\0', sizeof(b));

    aNumFields = sscanf(argv[1], "%d.%d.%d.%d",
				  &a[0], &a[1], &a[2], &a[3]);
    bNumFields = sscanf(argv[2], "%d.%d.%d.%d",
				  &b[0], &b[1], &b[2], &b[3]);

    if (aNumFields != bNumFields) {
	fprintf(stderr, "cmprev: %s and %s are incomparable\n", argv[1],
		argv[2]);
	exit(-2);
    }
    else if (aNumFields > 0 && aNumFields < 4) {
	exit(cmp(a, b, aNumFields));
    }
    else {
	fprintf(stderr, "cmprev: comparing %s and %s is unimplemented\n",
		argv[1], argv[2]);
	exit(-2);
    }
}
