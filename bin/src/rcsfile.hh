/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma interface

# define REVISION_KEYWORD "Revision"
# define NO_REVISION   0
# define GOT_REVISION  1
# define FAILED       -1

int getRevision(char* filename, char** revision);


# define MaxFields     4

# define EQUAL         0
# define LESS_THAN     2
# define GREATER_THAN  1

int cmpRevisions(char* revA, char* revB);
