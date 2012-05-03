/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation

# include <stdio.h>
# include "rcsfile.hh"
# include <string.h>

# define BUFSIZE 500

static char line[BUFSIZE];

# define true  1
# define false 0

static int isprefix(const char* s,const char* t) {
  //return true if t is prefix of s; false otherwise  */
  int  j, k;

  for (j=0, k=0; t[k] != '\0' && s[j] != '\0' && s[j] == t[k]; ++j,++k)
      ;
  if ( t[k] != '\0' )
    return(false);
  if (s[j] == ':')
    return(true);
  return(false);
}

static char *match(FILE* fp) {
   register int c;
   register char * tp;

   tp = line;
   while( (c = getc(fp)) != '$' ) {
      *tp++ = c;
      if ( c==EOF || c=='\n' || tp>= line+BUFSIZE-2)
         return(0);
      }
   *tp++=c;
   *tp='\0';
   if (isprefix(line, REVISION_KEYWORD)){
     /* the line should have the following format "REVISION_KEYWORD: 1.10 $" */
     /* So let's dig out the revision number "1.10". */
       char * id = line;
       char * end;
       /* remove the first argument */
       while( *id  &&  ' ' != *id) id++;
       while( *id  &&  ' ' == *id) id++;
       end = id;
       while( *end  &&  ' ' != *end) end++;
       *end = '\0';
     return( id);
   } else {
      ungetc(c,fp );
      return(0);
   }
}

int getRevision(char* filename, char** revision){
  FILE *fp;
  register int c;
  register char *ident;

  if ( (fp = fopen( filename, "r") ) == NULL )
    return FAILED;

  while( (c=getc(fp)) != EOF) {
    if ( (char)c=='$')
      if ( ident = match(fp) ){
	*revision = ident;
	fclose(fp);
	return GOT_REVISION;
      } 
  }

  fclose(fp);
  return NO_REVISION;
}


static int cmp(int* a, int* b, int numFields) {
    register int i;
    for (i = 0; i < numFields; i++) {
	if (a[i] > b[i])
	    return GREATER_THAN;
	else if (a[i] < b[i])
            return LESS_THAN;
    }
    return EQUAL;
}

int cmpRevisions(char* revA, char* revB) {

  int a[MaxFields + 1];
  int b[MaxFields + 1];

  int aNumFields;
  int bNumFields;

  memset(a, '\0', sizeof(a));
  memset(b, '\0', sizeof(b));

  aNumFields = sscanf(revA, "%d.%d.%d.%d", &a[0], &a[1], &a[2], &a[3]);
  bNumFields = sscanf(revB, "%d.%d.%d.%d", &b[0], &b[1], &b[2], &b[3]);

  if (aNumFields != bNumFields) return FAILED;

  if (aNumFields > 0 && aNumFields < 4)
    return cmp(a, b, aNumFields);
   
  return FAILED;
}
