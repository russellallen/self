/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
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
                        const char* mode, const char** fullName = 0);
public:
  FileTable();
  ~FileTable();

  // general file opener
  // returns file or null on error--takes care to set errno for caller

  FILE*         openFile(const char*  name,
                         const char*  mode   = "r",
                         const char*  path   = "",
                         const char*  suffix = "",
                         const char** fullname = 0);

  // specific openers
  FILE*         openSnapshotFile(const char*  name,
                                 const char*  modeArg,
                                 const char** fullname = 0);

  FILE*         openSelfFile(const char*  name, const char** fullname = 0) {
                  return openFile(name, "r", DirPath, 
                                  "" /* was ".self" */, 
                                  fullname);
                }

  void          closeFile(FILE* f);
  void          closeAll();

};

extern FileTable* Files;
