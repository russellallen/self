/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include <stddef.h> 
# include <stdio.h>
# include <stdlib.h>
# include <dirent.h>
# include <string.h>
# include <sys/types.h>
# include <sys/stat.h>
# include <sys/param.h>
# include <errno.h>
#if TARGET_OS_VERSION == SOLARIS_VERSION \
||  TARGET_OS_VERSION == MAC_OSX_VERSION
# include <unistd.h>
#else
  extern "C" int unlink(const char *);
#endif

# include "table.hh"
# include "rcsfile.hh"

#if TARGET_OS_VERSION == SUNOS_VERSION
  extern "C" char* sys_errlist[];
  extern "C" char* getwd(char*);
# define getcwd(a,b) getwd(a)
#endif

const char* remove_keyword      = "Removed";
const char* copy_keyword        = "Copy";
const char* rcs_keyword         = "RCS";

const char* timeStampFilter     = "sed -e '/.*fileOutTime <- .*$/d'";

# define LINE_LENGTH 512

int save    = 1;
int verbose = 0;
int do_echo = 0;

char* forced_revision_number = NULL;
char* forced_revision_date = NULL;

int forced_revision() {
  return forced_revision_number || forced_revision_date;
}

# define line_buf_size 200
static char line_buf[line_buf_size];

char* program;

stringTable table;

int execute(char* command) {
  if (do_echo) {
    printf("%s\n", command);
    return 0;
  } else {
    int result = system(command);
    if (result) {
      fprintf(stderr, "\nCouldn't execute: %s\n", command);
      fprintf(stderr, "   error code: 0x%x\n", result);
    }
    return result;
  }
}

void usage() {
  fprintf(stderr, "Usage: UpdateFiles [-d rootdir] [-n] [-s] [-v] [-e] [-] [file ...]\n");
  fprintf(stderr, "   or: UpdateFiles -h\n");
  fprintf(stderr, " -d: Override SELF_WORKING_DIR as the root directory.\n");
  fprintf(stderr, " -n: No execution mode. Print commands on stdout.\n");
  fprintf(stderr, "     The output can be used as input to sh.\n");
  fprintf(stderr, " -s: Does not save .OLD file when updating or copying.\n");
  fprintf(stderr, " -v: Report decision making logic.\n");
  fprintf(stderr, " -e: The following files are excluded from the update.\n");
  fprintf(stderr, " -r <rev> : Use <rev> for updating.\n");
  fprintf(stderr, " -t <date> : Use <date> for updating.\n");
  fprintf(stderr, " - : The following arguments are files.\n");
  fprintf(stderr, " -h: print this message.\n");
  fprintf(stderr, " If no files are specified, the directory is updated.\n");
}

struct File {
  char* path;

  File(char* s0, char* s1 = NULL, char* s2 = NULL, char* s3 = NULL);
  ~File() { free(path); }

  time_t modTime();

  int exists();

  void become(File& src, int save);
  void becomeIfConfirmed(File& basefile, int save);
  void becomeIfOutdated(File& basefile, int save);

  int addTrailingNewline();
  int addTrailingNewlineInto(File*& copy, char* copy_name);

  char *getRevisionFromDate(char *date);

  int isSelfFile();

  void merge(File& src, File& rcs, char* localrev, char* srcrev);

  void remove();
  int  un_link();
  
  File* isRootedIn(File& root);

  friend int operator==(File& first, File& second);
};

char* File::getRevisionFromDate(char *date) {
  File tmp("revision.tmp");
  sprintf(line_buf, 
	  "rlog -d\"%s\" %s | egrep '^revision' | awk '{ print $2 }' > %s",
	  date, path, tmp.path);
  if (execute(line_buf)) exit(-1);

  FILE* file;
  if (!(file = fopen(tmp.path, "r"))) {
    fprintf(stderr, "Couldn't open %s for reading\n", path);
    exit(-1);
  }

  fgets(line_buf, line_buf_size, file);
  line_buf[strlen(line_buf) - 1] = '\0';
  fclose(file);
  return strdup(line_buf);
}

File::File(char* s0, char* s1, char* s2, char* s3) {
  int length =             strlen(s0)
    	       + (s1 ? 1 + strlen(s1) : 0)
	       + (s2 ? 1 + strlen(s2) : 0)
	       + (s3 ? 1 + strlen(s3) : 0);
  path = (char*) malloc(length + 1);
  strcpy(path, s0);
  if (s1) { strcat(path, "/"); strcat(path, s1); }
  if (s2) { strcat(path, "/"); strcat(path, s2); }
  if (s3) { strcat(path, "/"); strcat(path, s3); }
}

time_t File::modTime() {
  struct stat s;
  if (stat(path, &s) == 0) {
    return s.st_mtime;
  } else {
    return -1;
  }
}

int File::exists() {
  struct stat s;
  if (stat(path, &s) == 0) {
    return 1;
  } else {
    if (errno != ENOENT) {
      perror("File::exists");
      exit(-1);
    }
    return 0;
  }
}

int File::isSelfFile() {
  const char* prefix1 = ".sm";
  const int   l1      = 3;

  const char* prefix2 = ".self";
  const int   l2      = 5;

  int l = strlen(path);
  if (l > l1) {
    if (strcmp(&path[l-l1], prefix1) == 0) return 1;
    if (l > l2) {
      if (strcmp(&path[l-l2], prefix2) == 0) return 1;
    }
  }
  return 0;
}

void File::become(File& src, int save) {
  // Copy the src file to this path and make the resuling file writable.
  int copy = exists();
  char line[LINE_LENGTH];
  fprintf(stderr, "%s %s\n", copy ? "Copying" : "Creating", path);
  if (copy && save) {
    sprintf(line, "mv %s %s.OLD", path, path);
    if (execute(line)) exit(-1);
  }
  sprintf(line, "cp -p %s %s; chmod +w %s", src.path, path, path);
  if (execute(line)) {
    exit(-1);
  }
}

void File::becomeIfConfirmed(File& basefile, int save) {
  char line[LINE_LENGTH];
  fprintf(stderr, "Copy %s to %s [yn]? ", basefile.path, path);
  gets(line);
  if (line[0] == '\0' || line[0] == 'y' || line[0] == 'Y') {
    become(basefile, save);
  }
}

void File::becomeIfOutdated(File& basefile, int save) {
  if (modTime() < basefile.modTime()) {
    if (verbose) {
      fprintf(stderr,
	      "Updating %s since outdated\n"
	      "  (local file mod time: %d; basefile mod time: %d)",
	      path, modTime(), basefile.modTime());
    }
    if (strcmp(path, program) == 0) {
      // The file we are about to overwrite has the same name as the
      // executing footprint. Moving/removing the file before the copy
      // seems to solve the "Segmentation fault" problem.
      char line[LINE_LENGTH];
      if (save) {
	fprintf(stderr, "Saving old %s\n", path);
	sprintf(line, "mv %s %s.OLD", path, path);
	if (execute(line)) exit(-1);
      } else {
	fprintf(stderr, "Removing %s\n", path);
	sprintf(line, "rm %s", path);
	if (execute(line)) exit(-1);
      }
      become(basefile, 0);
    } else {
      become(basefile, save);
    }
  } else {
    if (verbose) {
      fprintf(stderr,
	      "Not updating %s since not outdated\n"
	      "  (local file mod time: %d; basefile mod time: %d)",
	      path, modTime(), basefile.modTime());
    }
  }
}

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

int File::addTrailingNewlineInto(File*& copy, char* copy_name) {
  FILE* file;
  if (!(file = fopen(path, "r"))) {
    fprintf(stderr, "Couldn't open %s, which should already exist\n", path);
    if (fclose(file)) {
      fprintf(stderr, "Couldn't close %s\n", path);
    }
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
  
  // copy file and append newline if not already there
  if (ch != '\n') {
    copy = new File(copy_name);
    char line[LINE_LENGTH];
    sprintf(line, "cp -p %s %s", path, copy->path);
    if (execute(line)) {
      delete copy;
      if (fclose(file)) {
	fprintf(stderr, "Couldn't close %s\n", path);
      }
      return -1;
    }
    sprintf(line, "test -w %s || chmod +w %s", copy->path, copy->path);
    if (execute(line)) {
      copy->un_link();
      delete copy;
      if (fclose(file)) {
	fprintf(stderr, "Couldn't close %s\n", path);
      }
      return -1;
    }
    if (copy->addTrailingNewline()) {
      copy->un_link();
      delete copy;
      if (fclose(file)) {
	fprintf(stderr, "Couldn't close %s\n", path);
      }
      return -1;
    }
  }
  
  if (fclose(file)) {
    fprintf(stderr, "Couldn't close %s\n", path);
    return -1;
  }

  return 0;
}

void File::merge(File& src, File& rcs, char* localrev, char* srcrev) {
  // Merge this file with the src file.
  File tempfile("mergefile.tmp");
  char line[LINE_LENGTH];
  fprintf(stderr, "Updating %s (%s -> %s).\n", path, localrev, srcrev);
  
  if (save) {
    sprintf(line, "cp -p %s %s.OLD", path, path);
    if (execute(line)) exit(-1);
  }

  if (isSelfFile()) {
    // If this is a self file remove the fileOutTime slot
    sprintf(line, "co -q -p%s %s,v | %s > %s",
	    localrev, rcs.path, timeStampFilter, tempfile.path);
    if (execute(line)) {
      tempfile.un_link();
      exit(-1);
    }
  } else {
    sprintf(line, "co -q -p%s %s,v > %s", localrev, rcs.path, tempfile.path);
    if (execute(line)) {
      tempfile.un_link();
      exit(-1);
    }
  }
  
  File* tempfile1 = &src;
  if (!do_echo) {
    // diff3, called from within merge, crashes if compared files don't end
    // in newlines.  So add them now.
    if (addTrailingNewline())          { tempfile.un_link(); exit(-1); }
    if (tempfile.addTrailingNewline()) { tempfile.un_link(); exit(-1); }
    if (src.addTrailingNewlineInto(tempfile1, "mergefile.tmp1")) {
      tempfile.un_link(); exit(-1); 
    }
  }
  
  File tempfile2("mergefile.tmp2");
  File tempfile3("mergefile.tmp3");

  if (isSelfFile()) {
    sprintf(line, "%s %s > %s", timeStampFilter, path, tempfile3.path);
    if (execute(line)) {
      tempfile3.un_link(); exit(-1);
    }
    sprintf(line, "merge -p %s %s %s >%s",
	    tempfile3.path, tempfile.path, tempfile1->path, tempfile2.path);
  } else {
    sprintf(line, "merge -p %s %s %s >%s",
	    path, tempfile.path, tempfile1->path, tempfile2.path);
  }

  if (do_echo) {
    printf("%s\n",line);
  } else {
    int result = system(line);
    int merge_result = result >> 8;
    int wait_result = result & ((1 << 8) - 1);
    switch (merge_result) {
     case 0: // no error
      break;
     case 1: // merge conflicts
      result = result - (merge_result << 8);	// a non-fatal error
      break;
     default: // some other kind of error
      fprintf(stderr, "\nCouldn't execute: %s\n", line);
      fprintf(stderr, "   error code: %d\n", merge_result);
    }
    if (wait_result) {
      fprintf(stderr, "\nCouldn't execute: %s\n", line);
#if TARGET_OS_VERSION == SOLARIS_VERSION
      fprintf(stderr, "   %d: %s\n", wait_result, strerror(wait_result));
#else
      fprintf(stderr, "   %d: %s\n", wait_result, sys_errlist[wait_result]);
#endif
    }
    if (result) {
      tempfile.un_link();
      if (tempfile1 != &src) tempfile1->un_link();
      tempfile2.un_link();
      exit(-1);
    }
  }
  


  if (isSelfFile()) {
    if (do_echo) {
      printf("rm %s\n", tempfile3.path);
    } else {
      if (tempfile3.un_link()) exit(-1);
    }
  }

  if (tempfile1 != &src) {
    if (tempfile1->un_link()) {
      delete tempfile1;
      tempfile.un_link();
      tempfile2.un_link();
      exit(-1);
    }
    delete tempfile1;
  }

  if (do_echo) {
    printf("rm %s\n", tempfile.path);
  } else {
    if (tempfile.un_link()) { tempfile2.un_link(); exit(-1); }
  }

  sprintf(line, "test ! -x %s || chmod +x %s", src.path, tempfile2.path);
  if (execute(line)) {
    tempfile2.un_link();
    exit(-1);
  }
  
  sprintf(line, "mv %s %s", tempfile2.path, path);
  if (execute(line)) {
    tempfile2.un_link();
    exit(-1);
  }
}

int File::un_link() {
 int res = unlink(path);
 if (res) fprintf(stderr, "Couldn't remove %s\n", path);
 return res;
}

void File::remove() {
  // Remove this file.
  char line[LINE_LENGTH];
  fprintf(stderr, "Removing %s\n", path);
  if (save) {
    sprintf(line, "mv %s %s.OLD", path, path);
    if (execute(line)) 
      exit(-1);
  } else {
    if (do_echo) {
      printf("rm %s\n", path);
    } else {
      if (un_link()) exit(-1);
    }
  }
}

File* File::isRootedIn(File& root) {
  // Returns the the sub path from root to this if this is rooted in
  // root. Otherwise NULL is returned.
  
  if (*this == root) return new File(".");
  
  File tmp(this->path);
  
  char* p;
  while ((p = strrchr(tmp.path, '/')) && (p != tmp.path)) {
    *p = '\0';
    if (tmp == root) return new File(&this->path[p-tmp.path+1]);
  }
  return NULL;
}

int operator==(File& first, File& second) {
  // Returns true iff the two files have same inode and device numbers.
  struct stat firstStat;
  struct stat secondStat;

  if (stat(first.path, &firstStat) == -1) {
    perror("stat failed");
    fprintf(stderr,"d on %s (You cannot use ~ in your SELF_WORKING_DIR env. var.)\n", first.path);
    return 0;
  }

  if (stat(second.path, &secondStat) == -1) {
    perror("stat failed");
    fprintf(stderr," on %s (You cannot use ~ in your SELF_WORKING_DIR env. var.)\n", second.path);
    return 0;
  }
  
  return    (firstStat.st_ino == secondStat.st_ino)
         && (firstStat.st_dev == secondStat.st_dev);
}


struct Directories {
  char* baseline;
  char* working;
  char* other;
  char  current[MAXPATHLEN];

  File* subdir;

  Directories() {
    baseline = NULL; working = NULL; other = NULL; subdir = NULL; }
  
  void initialize();
};

void Directories::initialize() {
  if (baseline == NULL && (baseline = getenv("SELF_BASELINE_DIR")) == NULL) {
    fprintf(stderr, "environment variable SELF_BASELINE_DIR is not set.\n");
    exit(-1);
  }
  if (working == NULL && (working = getenv("SELF_WORKING_DIR")) == NULL) {
    fprintf(stderr, "environment variable SELF_WORKING_DIR is not set.\n");
    exit(-1);
  }
  if (!getcwd(current, MAXPATHLEN)) {
    fprintf(stderr, "getcwd failed with %s\n", current);
    exit(-1);
  }
  
  File cwd(current);
  File wd(working);

  if (subdir == NULL && (subdir = cwd.isRootedIn(wd)) == NULL) {
    fprintf(stderr, "You need to be in a subdirectory of %s.\n", working);
    exit(-1);
  }
}

Directories dirs;

void processFile(char* name) {
  stringNode* node;
  if (node = table.lookup(name)) {
    if (!node->isMarked()) {
      node->mark();
      File localfile(name);
      if (node->version == remove_keyword) {
	if (verbose) {
	  fprintf(stderr, "File %s keyword is %s; removing\n",
		  name, node->version);
	}
	localfile.remove();
      } else {
	File basefile(dirs.baseline, dirs.subdir->path, localfile.path); 
	if (node->version == copy_keyword) {
	  if (verbose) {
	    fprintf(stderr, "File %s keyword is %s; copying if outdated\n",
		    name, node->version);
	  }
	  localfile.becomeIfOutdated(basefile, save);
	} else {
	  // The file must have a revision
	  char* revision;
	  switch (getRevision(localfile.path, &revision)) {
	   case GOT_REVISION:
	    if (verbose) {
	      fprintf(stderr,
		      "Testing revisions of %s:\n"
		      "  local: \"%s\"; baseline: \"%s\"...",
		      localfile.path, revision, node->version);
	    }

            char* version;
            if (forced_revision()) {
              version = forced_revision_number ?
		forced_revision_number :
		basefile.getRevisionFromDate(forced_revision_date);
            } else version = node->version; 
	    switch (cmpRevisions(revision, version)) {
	     case EQUAL:
	      if (verbose) {
		fprintf(stderr, "same; no action.\n");
	      }
	      break;
	     case LESS_THAN:
	      {
		if (verbose) {
		  fprintf(stderr, "revision is behind; merge.\n");
		}
		File rcsfile(dirs.baseline, dirs.subdir->path, "RCS",
			     localfile.path); 
                if (forced_revision()) {
		  File tempfile("forced_mergefile.tmp");
		  char line[LINE_LENGTH];
		  sprintf(line, "co -q -p%s %s,v > %s",
			  version, rcsfile.path, tempfile.path);
		  if (execute(line)) {
		    tempfile.un_link();
		    exit(-1);
		  }
		  localfile.merge(tempfile, rcsfile, revision, version);
		  tempfile.un_link();
		} else {
		  localfile.merge(basefile, rcsfile, revision, version);
		}
	      }
	      break;
	     case GREATER_THAN:
	      if (verbose) {
		fprintf(stderr, "\n");
	      }
	      fprintf(stderr, "%s has a newer revision number than baseline.\n",
		      localfile.path);
	      localfile.becomeIfConfirmed(basefile, 1);
	      break;
	      
	     case FAILED:
	      if (verbose) {
		fprintf(stderr, "\n");
	      }
	      fprintf(stderr, 
		      "%s has a conflicting revision number with baseline.\n",
		      localfile.path);
	      localfile.becomeIfConfirmed(basefile, 1);
	      break;
	     default:
	      fprintf(stderr, "unexpected cmpRevisions result");
	      exit(-1);
	    }
	    break;
	   case NO_REVISION:
	    if (strcmp(node->version, "none") == 0) {
	      // baseline has no revision; copy if outdated
	      if (verbose) {
		fprintf(stderr,
			"%s has no revision number; copying if outdated\n",
			localfile.path);
	      }
	      localfile.becomeIfOutdated(basefile, 1);
	    } else {
	      // baseline does have a revision num, but local file doesn't;
	      // ask!
	      fprintf(stderr,
		      "%s has no revision number (baseline's is %s).\n",
		      localfile.path, node->version);
	      localfile.becomeIfConfirmed(basefile, 1);
	    }
	    break;
	   default:
	    fprintf(stderr, "getRevision failed on %s\n", name);
	    localfile.becomeIfConfirmed(basefile, 1);
	    break;
	  }
	}
      }
    } else {
      if (verbose) {
	fprintf(stderr, "File %s is marked; ignoring\n", name);
      }
    }
  } else {
    if (verbose) {
      fprintf(stderr, "File %s not found in table; ignoring\n", name);
    }
  }
}

void processFileArgument(char* name) {
  if (!table.lookup(name)) {
    fprintf(stderr, "File %s is not present in baseline.\n", name);
    return;
  }

  File localfile(name);
  if (localfile.exists()) {
    processFile(name);
  } else {
    if (forced_revision()) {
      File tempfile("forced_mergefile.tmp");
      File rcsfile(dirs.baseline, dirs.subdir->path, "RCS",
		   localfile.path); 
      char line[LINE_LENGTH];
      char* version = forced_revision_number ? forced_revision_number :
	rcsfile.getRevisionFromDate(forced_revision_date);
      sprintf(line, "co -q -p%s %s,v > %s",
	      version, rcsfile.path, tempfile.path);
      if (execute(line)) {
	tempfile.un_link();
	exit(-1);
      }
      localfile.become(tempfile, save);
      tempfile.un_link();
    } else {
      File basefile(dirs.baseline, dirs.subdir->path, localfile.path); 
      localfile.become(basefile, save);
    }
  }
}

void processLine(char* name) {
  char file_id[60];
  char file_type[20];
  char file_version[10];

  switch (sscanf(name, "%s%s%s", file_id, file_type, file_version)) {
   case 2:
    if (strcmp(file_type, remove_keyword) == 0) 
      table.add(strdup(file_id), (char*) remove_keyword);
    else {
      if (strcmp(file_type, copy_keyword) == 0) {
	table.add(strdup(file_id), (char*) copy_keyword);
      } else {
	fprintf(stderr, "***WARNING: keyword is missing in %s", name);
      }
    }
    break;
   case 3:
    if (strcmp(file_type, rcs_keyword) != 0) {
      fprintf(stderr, "warning RCS is missing in %s\n", name);
    }
    table.add(strdup(file_id), strdup(file_version));
    break;
   default:
    fprintf(stderr, "***WARNING: wrong arguments in %s", name);
    break;
  }
}


void processAllFilesInDir() {
  DIR* dirp = opendir(".");
  if (dirp == NULL) {
    fprintf(stderr, "Couldn't find current directory.\n");
    exit(-1);
  }
  for (dirent* dp = readdir(dirp); dp != NULL; dp = readdir(dirp)) {
    processFile(dp->d_name);
  }
  closedir (dirp);
}

void readBaseFileStatus(char* filename) {
  FILE* file;
  char line[MAXPATHLEN];
  if (!(file = fopen(filename, "r"))) {
    // Let's try to create the .file_status in the baseline system
    fprintf(stderr, "CreateFileStatus (.file_status is missing)\n");
    sprintf(line, "CreateFileStatus -d %s", dirs.working);
    if (execute(line)) {
      exit(-1);
    }
    if (!(file = fopen(filename, "r"))) {
      fprintf(stderr, "Couldn't open %s and CreateFileStatus failed.\n",
	      filename);
      exit(-1);
    }
  }

  // The first line of the file is a comment so skip it.
  if (fgets(line_buf, line_buf_size, file) == NULL) {
    fprintf(stderr, "Couldn't read the first line of %s\n", filename);
    exit(-1);
  }

  while (fgets(line_buf, line_buf_size,  file) != NULL) {
    processLine(line_buf);
  }

  if (fclose(file)) {
    fprintf(stderr, "Couldn't close %s\n", filename);
    exit(-1);
  }
}


int handlenode(stringNode* node) {
  if (node->version != remove_keyword) {
    if (!node->isMarked()) {
      if (verbose) {
	fprintf(stderr, "Updating %s since not removed nor marked\n",
		node->string);
      }
      File localfile(node->string);
      File baseline (dirs.baseline, dirs.subdir->path, node->string);
      localfile.become(baseline, save);
    } else {
      if (verbose) {
	fprintf(stderr, "File %s is marked; ignoring\n", node->string);
      }
    }
  } else {
    if (verbose) {
      fprintf(stderr, "File %s should be removed; ignoring\n", node->string);
    }
  }
  return 1;
}

void scanTable() { table.enumerate(handlenode); }

main(int argc, char** argv) {
  int excludes = 0;

  program = argv[0];

  while (--argc,++argv, argc>=1 && ((*argv)[0] == '-')) {
    switch ((*argv)[1]) {
     case 'd':
      {
	--argc,++argv;
	if (argc == 0) {
	  usage(); exit(-1);
	}
	File f(*argv);
	if (!f.exists()) {
	  fprintf(stderr, "Directory %s doesn\'t exist", *argv);
	  fprintf(stderr, " (or needs to be file-name-expanded).\n");
	  usage(); exit(-1);
	}
	dirs.working = *argv;
      } break;
     case 'n': do_echo  = 1; break;
     case 's': save     = 0; break;
     case 'v': verbose  = 1; break;
     case 'e': excludes = 1; break;
     case 'r': 
      {
	--argc,++argv;
	if (argc == 0) {
	  usage(); exit(-1);
	}
	forced_revision_number = *argv;
      } break;
     case 't': 
      {
	--argc,++argv;
	if (argc == 0) {
	  usage(); exit(-1);
	}
	forced_revision_date = *argv;
      } break;
     case 'h': usage(); exit(0);
     case '\0': goto done;
     default:
      fprintf(stderr, "Option %s unknown.\n", *argv);
      usage(); exit(-1);
    }
  }
 done: ;

  dirs.initialize();

  File statusfile(dirs.baseline, dirs.subdir->path, ".file_status"); 
  readBaseFileStatus(statusfile.path);

  if (excludes) {
    // process all files, excluding listed files
    stringNode* node;
    for(; argc>=1; --argc,++argv) {
      if (node = table.lookup(*argv)) {
	node->mark();
      }
    }
    processAllFilesInDir();
    scanTable();
  } else if (argc > 0) {
    // process only listed files
    for (; argc>=1; --argc,++argv) {
      processFileArgument(*argv);
    }
  } else {
    // normal case; process all files
    processAllFilesInDir();
    scanTable();
  }

  exit(0);
}
