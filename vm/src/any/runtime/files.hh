/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// redone for new path stuff -- dmu 10/91

# ifndef _NFILE
  // it doesn't hurt if _NFILE is > than the number of files the system supports
# define _NFILE 20
# endif

const fint FileTableSize = _NFILE - 3;  // -3 for stdin, stdout, stderr

class FileTable {
private:
  FILE*         _table[FileTableSize];

  FILE*         record(FILE* f);
  FILE*         tryOpen(const char* name, const char* suffix,
                        const char* mode, char** fullName = NULL);
public:
  FileTable();
  ~FileTable();

  // general file opener
  // returns file or null on error--takes care to set errno for caller

  FILE*         openFile(const char*  name,
                         const char*  mode   = "r",
                         const char*  path   = "",
                         const char*  suffix = "",
                         char** fullname = NULL);

  // specific openers
  FILE*         openSnapshotFile(const char*  name,
                                 const char*  modeArg,
                                 char** fullname = NULL);

  FILE*         openSelfFile(const char*  name, char** fullname = NULL) {
                  return openFile(name, "r", DirPath, 
                                  "" /* was ".self" */, 
                                  fullname);
                }

  void          closeFile(FILE* f);
  void          closeAll();

};

extern FileTable* Files;
