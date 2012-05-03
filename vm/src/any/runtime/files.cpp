/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "files.hh"
# include "_files.cpp.incl"

FileTable* Files;

void files_init() { Files = new FileTable; }
void files_exit() { delete Files; }

FileTable::FileTable() {
  for (fint i = 0; i < FileTableSize; i++) {
    _table[i] = NULL;
  }
}

FileTable::~FileTable() {
  closeAll();
}


static bool isFullPath(const char* path) {
  switch (path[0]) {
   case '/':  case '~':  return true;

   case '.':
    switch (path[1]) {
     case '.':  case '/':  case '\0': return true;
    }
  }
  return false;
}


FILE* FileTable::openSnapshotFile( const char*  name,
                                   const char*  modeArg,
                                   const char**       fullFileName) {
  return openFile(name, OS::mode_for_binary(modeArg), NULL, "", fullFileName);
}


// searches path, where path is colon separated list of directories,
// and a null path component means the current directory-- dmu 10/91

// returns the full path name of the file in *fullname if the file
// could be opened and if fullname != NULL.  The string is allocated
// statically.

FILE* FileTable::openFile(const char* name,
                          const char* mode,
                          const char* path,
                          const char* suffix,
                          const char** fullname) {

  if (fullname) *fullname = NULL;
  
  // null path means current directory
  if (OS::is_non_unix_path(name)  ||  isFullPath(name)  ||  !path) {
    return tryOpen(name, suffix, mode, fullname);
  }

  int name_length = strlen(name);
  const char *s, *e;

  for (s = path;  ;   s = e + 1) {
    const char* tryMe;

    // s points to  start of next path element or colon or null

    for ( e = s;  *e  &&  *e != ':';  e++) {} // find end of this component
    // s <= e. e is just past end of segment

    char dirAndName[OS::max_path_length]; // must have same scope as tryOpen call

    if (s == e) { // null path seg
      tryMe = name;

    } else {
      // s < e

      const char  delimiter[] = "/";
      const int   delimiter_length = sizeof(delimiter) - 1;


      if (e - s  >=  sizeof(dirAndName)) {
        char* buf = new char[e - s + 1];
        lsprintf_string(buf, e - s, s);
        fatal2("%s exceeds %d chars in length", buf,  sizeof(dirAndName) - 1);
      }
      lsprintf_string(dirAndName, e - s,  s);

      if (e - s  +  delimiter_length + name_length  >=  sizeof(dirAndName)) {
        fatal4("file name %s%s%s is longer than %d",
               dirAndName,  delimiter,  name,  sizeof(dirAndName) - 1);
      }
      char buf[OS::max_path_length]; 
      strcpy(buf, dirAndName);
      sprintf(dirAndName, "%s%s%s",  buf,  delimiter, name);

      tryMe = dirAndName;
    }
    
    FILE* f = tryOpen(tryMe, suffix, mode, fullname);
    if (f != NULL) {
      return f;
    }
    if (!*e)
      return NULL;
  }
}


FILE* FileTable::tryOpen(const char*   name,
                         const char*   suffix,
                         const char*   mode,
                         const char**  fullname) {

  static char expandedName[OS::max_path_length];
  if (!OS::expand_dir(name, expandedName)) return NULL;


  FILE* f= fopen(expandedName, mode);
  if (f == NULL) {
    if (!suffix) return NULL;
  
    if (strlen(expandedName) + strlen(suffix)  >=  sizeof(expandedName)) {
      fatal3("file name %s%s is longer than %d",
             expandedName,  suffix,  sizeof(expandedName) - 1);
    }
    
    sprintf(expandedName, "%s%s", expandedName, suffix);
    f= fopen(expandedName, mode);
  }
  if (f) {
    // sanity check
    struct stat st_buf;
    if (fstat(fileno(f), &st_buf) != 0
        || S_ISDIR(st_buf.st_mode)) { // no directories allowed
      fclose(f);
      f= NULL;
#     if TARGET_OS_FAMILY == UNIX_FAMILY
        errno= EISDIR;
#     endif
    }
  }
  if (f && fullname) *fullname= expandedName;
  return f;
}


FILE* FileTable::record(FILE* f) {
  for (fint i = 0;  i < FileTableSize;  i++) {
    if (_table[i] == NULL) {
      _table[i] = f;
      return f;
    }
  }
  fclose(f);
  error("Can't open file -- file table full");
  errno = 0;
  return NULL;
}


void FileTable::closeFile(FILE* f) {
  for (fint i = 0; i < FileTableSize; i++) {
    if (_table[i] == f) {
      _table[i] = NULL;
    }
  }
  (void) fclose(f);
}


void FileTable::closeAll() {
  for (fint i = 0; i < FileTableSize; i++) {
    if (_table[i] != NULL) {
      (void) fclose(_table[i]);
      _table[i] = NULL;
    }
  }
}
