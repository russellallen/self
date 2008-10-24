/* Ole Agesen, 1994. */
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

#define FALSE  0
#define TRUE   1

#define MAX_LINE_LEN 10000

FILE *inFile, *outFile;

int lineNo = 0;
int stack[1000], stackTop = 0;

void push(int e) {
  stack[stackTop] = e;
  stackTop++;
}

int pop() {
  if (0 == stackTop) {
    fprintf(stderr, "Empty stack, line %d.\n", lineNo);
    exit(-1);
  }
  stackTop--;
  return stack[stackTop];
}


int isLoneBar(char line[], int i) {
  char ch;
  if (0 != i) {
    ch = line[i-1];
    if (strchr("!@#$%^&*-+=~/?<>,;|`\\", ch)) /* Probably a binary operator. */
      return FALSE;
  }
  ch = line[i+1];
  if (ch) {
    if (strchr("!@#$%^&*-+=~/?<>,;|`\\", ch)) /* Probably a binary operator. */
      return FALSE;
  }
  return TRUE;
}


void escapeError(char ch) {
  fprintf(stderr, "Should not escape %c, line %d\n", ch, lineNo);
  exit(-1);
}

int isBlank(char ch) {
  return ch == ' ' || ch == '\n' || ch == '\t';
}


char outLine[MAX_LINE_LEN];
int  outIdx = 0;

void output1(char ch) {
  outLine[outIdx++] = ch;
}

void output(char *str) {
  while (*str) outLine[outIdx++] = *str++;
}

void back2() {
  return;    /* Currently not used. */
  if (0 != outIdx && outLine[outIdx-1] == ' ') outIdx--;
  if (0 != outIdx && outLine[outIdx-1] == ' ') outIdx--;
}

int checkFor(char *target, char *line, int i) {
  if (i != 0 && !isBlank(line[i-1]))             return FALSE;
  if (strncmp(target, line + i, strlen(target))) return FALSE;
  i = i + strlen(target);
  if (line[i] && !isBlank(line[i]) && line[i] != '\\') return FALSE;
  return TRUE;
}

void printOutput() {
  outLine[outIdx] = '\0';
  fputs(outLine, outFile);
}

void processFile(char *filename) {
   char inLine[MAX_LINE_LEN], bakFilename[1000];
   int  inSlotList = 0, inSingleQuotes = 0, inDoubleQuotes = 0;

   fprintf(stderr, "Converting privacy decl's in %s\n", filename);

   strcpy(bakFilename, filename);
   strcat(bakFilename, ".BAK");
   if (rename(filename, bakFilename)) {
     fprintf(stderr, "Could not rename file %s to %s: ", 
             filename, bakFilename);
     perror(NULL);
     exit(-1);
   }

   inFile  = fopen(bakFilename, "r");
   if (!inFile) {
     fprintf(stderr, "Could not open file %s for reading: ", bakFilename);
     perror(NULL);
     exit(-1);
   }
  
   outFile = fopen(filename, "w");
   if (!outFile) {
     fprintf(stderr, "Could not open file %s for writing: ", filename);
     perror(NULL);
     exit(-1);
   }

   lineNo = 0;
   while(fgets(inLine, MAX_LINE_LEN, inFile)) {
     int len, esc = 0;  /* NB: It is correct to start each line non-escaped! */
     int i = 0;
     outIdx = 0;        /* Start new output line. */
     len = strlen(inLine);
     lineNo++;

     while (i < len) {
       int isPrinted = 0;
       switch (inLine[i]) {
         case '\'':  if (!inDoubleQuotes && !esc) 
                       inSingleQuotes = !inSingleQuotes;
                     break;
         case '"':   if (!inSingleQuotes && !esc)
                       inDoubleQuotes = !inDoubleQuotes;
                     break;
         case '|':   if (!inSingleQuotes && 
                         !inDoubleQuotes && isLoneBar(inLine,i)) {
                       if (esc) escapeError(inLine[i]);
                       inSlotList = !inSlotList;
                     }
                     break;
         case '[':
         case '(':   if (!inSingleQuotes && !inDoubleQuotes) {
                       if (esc) escapeError(inLine[i]);
                       push(inSlotList);
                       inSlotList = FALSE;
                     }
                     break;
         case ']':
         case ')':   if (!inSingleQuotes && !inDoubleQuotes) {
                       if (esc) escapeError(inLine[i]);
                       inSlotList = pop();
                     }
                     break;
         case '_':   if (inSlotList && !inSingleQuotes && !inDoubleQuotes) {
                       if (esc) escapeError(inLine[i]);
                       if (checkFor("_", inLine, i)) {
                         back2();
                         output("\"_\"");
                         isPrinted = TRUE;
                       } else if(checkFor("_^", inLine, i)) {
                         back2();
                         output("\"_^\"");
                         isPrinted = TRUE;
                         i++;
                       }
                     }
                     break;
         case '^':   if (inSlotList && !inSingleQuotes && !inDoubleQuotes) {
                       if (esc) escapeError(inLine[i]);
                       if (checkFor("^", inLine, i)) {
                         back2();
                         output("\"^\"");
                         isPrinted = TRUE;
                       } else if(checkFor("^_", inLine, i)) {
                         back2();
                         output("\"^_\"");
                         isPrinted = TRUE;
                         i++;
                       }
                     }
                     break;
         default:    break;
       }
       if (inLine[i] == '\\') 
         esc = !esc;
       else
         esc = 0;

       if (!isPrinted) output1(inLine[i]);
       i++;
     }
     printOutput();
   }

   fclose(inFile);
   fclose(outFile);

   if (inSingleQuotes)
     fprintf(stderr, 
             "Warning: finished inside single-quotes - check result!\n");

   if (inDoubleQuotes)
     fprintf(stderr, 
             "Warning: Finished inside double-quotes - check result!\n");

   if (stackTop) 
     fprintf(stderr, "Warning: Finished with non-empty stack (size %d) "
                     "- check result!\n", 
             stackTop);
}


int main(int argc, char *argv[]) {
  int i = 1;
  if (argc == 1 || (argc > 1 && !strcmp("-h", argv[1]))) {
    fprintf(stderr, "%s is a program that will convert Self privacy decl's "
                    "to comments.\n", argv[0]);
    fprintf(stderr, "Usage: %s filename1 filename2 ...\n", argv[0]);
    fprintf(stderr, "The original files will be saved with extension .BAK\n");
    exit(0);
  }
    
  while (i < argc) {
    processFile(argv[i++]);
  }
}
