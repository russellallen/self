// $Revision: 30.11 $
// 
// Copyright 1993-2006 Sun Microsystems, Inc. 901 San Antonio Road,
// Palo Alto, California, 94303, U.S.A.  All Rights Reserved.
// 
// This software is the confidential and proprietary information of Sun
// Microsystems, Inc. ("Confidential Information").  You shall not
// disclose such Confidential Information and shall use it only in
// accordance with the terms of the license agreement you entered into
// with Sun.
// 
// CopyrightVersion 1.2


/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
   

// This program reads an include file database.
// The database should cover each self .cpp and .hh file,
//   but not files in /usr/include
// The database consists of pairs of nonblank words, where the first word is
//   the filename that needs to include the file named by the second word.
// For each .cpp file, this program generates a fooIncludes.hh file that 
//  the .cpp file may include to include all the needed files in the right order.
// It also generates a foo.dep file to include in the makefile.
// Finally it detects cycles, and can work with two files, an old and a new one.
// To incrementally write out only needed files after a small change.
//
// Based on a suggestion by Roland Conybeare, algorithm suggested by Craig
//  Chambers, written by David Ungar, 3/1/89.
//  Added PREFIX, {DEP/INC}_DIR, smaller dep output  10/92  -Urs

// Add something for precompiled headers


// To handle different platforms, I am introducing a platform file.
// The platform file contains lines like:
// os = svr4
//
// Then, when processing the includeDB file, a token such as <os>
// gets replaced by svr4. -- dmu 3/25/97

// Modified to centralize Dependencies to speed up make -- dmu 5/97

// a line like: "filename no_precompiled_headers" means that a .cpp file
// does not use a precompiled header.

// Changed to support new filename extensions: .cpp and .hh -- dmu 2/01

# ifdef __linux__
#   include <new>
# endif


# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <ctype.h>


# define TARGET_IS_SELF


typedef int Bool;
const Bool False = 0;
const Bool True = 1;

static const int maxMatches = 10;

class FileName { 
protected:
  char dir[BUFSIZ], prefix[BUFSIZ], stem[BUFSIZ], suffix[BUFSIZ], 
       altSuffix[BUFSIZ], inverseDir[BUFSIZ];

  char dpss[BUFSIZ], psa[BUFSIZ], dpsa[BUFSIZ], pss[BUFSIZ];

public:
  void check_length();

  FileName(const char* d, const char* p, const char* s, const char* x, const char* i, const char* a) {
    strcpy( dir, d);
    strcpy( prefix, p);
    strcpy( stem, s);
    strcpy( suffix, x);
    strcpy( inverseDir, i);
    strcpy( altSuffix, a);

    sprintf(  pss, "%s%s%s",        prefix, stem, suffix);
    sprintf( dpss, "%s%s%s%s", dir, prefix, stem, suffix);
    sprintf(  psa, "%s%s%s",        prefix, stem, altSuffix);
    sprintf( dpsa, "%s%s%s%s", dir, prefix, stem, altSuffix);

    check_length();
  }

  inline const char* dir_pre_stem_suff()    { return dpss; }
  inline const char* pre_stem_altSuff()     { return psa; }
  inline const char* dir_pre_stem_altSuff() { return dpsa; }
  inline const char* pre_stem_suff()        { return pss; }

  FileName* copy_stem(const char* newStem) {
    return new FileName(dir, prefix, newStem, suffix, inverseDir, altSuffix);
  }

  Bool suffix_matches(const char* s);

  const char* nameOfList() { return stem; }

  const char* getInvDir() { return inverseDir; }

};


// file name templates capture naming conventions

FileName * DummyFileTemplate = new FileName( "", "", "", "", "", "");

FileName * InclFileTemplate;  // an incl file is produced per .cpp file and contains all the includes it needs
FileName *   GIFileTemplate;  // a GI (grand-include) file has any file used more than N times for precompiled headers
FileName*    GDFileTemplate;  // a GD (grand-dependencies) file that tells Unix make all the .o's needed for linking and the include dependencies




// I define what must be specified for each platform
class AbstractPlatform {
 public:
  // an incl file is the file included by each.cpp file that includes all needed header files

    
  void setupFileTemplates() {
    abort(); // should not run me; copy me for each platform
    InclFileTemplate = new FileName( "", "_", "",                     ".incl", "", "");
      GIFileTemplate = new FileName( "", "",  "", "",      "", "");
      GDFileTemplate = new FileName( "", "",  "Dependencies.hh",       "",      "", "");
  }

  const char** outer_suffixes() { 
    abort(); // should not run me; copy me for each platform
    /* Compiler bug:
      static char *suffs[] = { ".cpp", 0 };
      return suffs;
    */
    return NULL;
  }

  // empty file name -> no grand include file
  inline Bool haveGrandInclude() { return GIFileTemplate->nameOfList()[0]; }

  inline Bool writeDeps() const { return GDFileTemplate->nameOfList()[0]; }

  // a gi file is the grand-include file. It includes in one file any file that
  // is included more than a certain number of times.
  // It is used for precompiled header files.
  // It has a source name, that is the file that this program generates,
  // and a compiled name; that is the file that is included by other files.
  // (Non-animorphic platforms have this program actually explictly include
  // the preprocessed gi file-- see includeGIInEachIncl().)
  // Also, some platforms need a pragma in the GI file.
  
  Bool includeGIInEachIncl() { return False; }

  // For some platforms, e.g. Solaris, include the grand-include dependencies
  // in the makefile. For others, e.g. Windows, do not.

  Bool includeGIDependencies() { return False; }

  void writeGIPragma(FILE* /*giFile*/) {}

  // Use writeGIInclude to write out the actual include statement in an indiv. incl file
  // that pulls in the Grand Include file.
 
  void writeGIInclude(FILE* /* inclFile */) {
    fatal("writeGIInclude unimplemented for this platform");
  }
  
  
  // The comment prefix indicates a comment line in includeDB
  
  inline const char* commentPrefix()  const { return "//"; }


  // A line with a filename and the noGrandInclude string means that
  // this file cannot use the precompiled header.
  
  inline const char* noGrandInclude()  const { return "no_precompiled_headers"; }
  
  // A line with a filename and the generatePlatformDependentInclude means that
  // an include file for the header file must be generate.
  // Does not effect the dependency computation.

  // For example, the line foo_<arch>.hh generate_platform_dependent_include
  // means that this program will create a file called "foo_pd.hh"
  // containing # include "foo_sparc.hh" (assuming arch = sparc).
    
  inline const char* generatePlatformDependentInclude()  const { return "generate_platform_dependent_include"; }

  // Format strings for emitting Makefile rules
  virtual const char* obj_file_format()  = 0;
  virtual const char* asm_file_format()  = 0;
  virtual const char* dependent_format() = 0;

  // platform-dependent exit routines:
  // abort means an internal error
   
  virtual void abort() = 0;
   
  void set_args(int& /*argc*/, const char**& /*argv*/) {} // per-platform argument setting

  Bool fileNameStringEquality(const char* a, const char* b) { return strcmp(a, b) == 0; }

  void fileNamePortabilityCheck(const char* name );
  void fileNamePortabilityCheck(const char* name, const char* matchingName);

  int fileNameLengthLimit() { return 31; } // max is 31 on mac, so warn

  int  defaultGrandIncludeThreshold() { return 30; }
  
  virtual const char* GIFileForDependency() { return GIFileTemplate->pre_stem_suff(); }

  virtual void fatal(const char* msg = "See console window") { fprintf(stderr, "%s\n", msg); exit(1); }
};

# if defined(__GNUC__) && defined(__APPLE__)

// For Apple Project Builder under OS X (MACHO) or just gcc on OS X

class MACOSX_Platform: public AbstractPlatform {
 public:
  void setupFileTemplates() {
    InclFileTemplate = new FileName( "incls/", "_", "",  ".incl", "", "");
      GIFileTemplate = new FileName( "incls/", "",  "_precompiled", ".hh", "", ".hh.gch");
      GDFileTemplate = new FileName( "", "",  "Dependencies.hh",      "",      "", "");
  }
      
  const char** outer_suffixes() { 
      static const char *suffs[] = { ".cpp", ".c", ".s", ".S", ".m", ".mm", 0 };
      return suffs;
  }

  const char* obj_file_format()  { return "%s.o"; }
  const char* asm_file_format()  { return "%s.i"; }
  const char* dependent_format() { return "%s";   }

  void abort()     { ::abort(); }

  int defaultGrandIncludeThreshold() { return 10000; }

  Bool includeGIDependencies() { return True; }
 
  Bool includeGIInEachIncl() { return False; }

  void writeGIInclude(FILE* inclFile ) {
    fprintf(inclFile, "# include \"%s\"\n", GIFileTemplate->pre_stem_suff());
  }
 
  void set_args(int& argc, const char**& argv) {
#   ifdef TARGET_IS_SELF
      if (argc == 1) {
          static const char *default_args[] = {
              "makeDeps", "-100000", "Platform_mac", "includeDB", 
              "../../src/Platform_mac", "../../src/includeDB"};
          argc = sizeof(default_args) / sizeof(default_args[0]);
          argv = default_args;
      }
#   endif
  }

} Plat;

# elif defined(_WIN32)

#include <windows.h> // for MessageBox

class WinGammaPlatform: public AbstractPlatform {
 public:
  void setupFileTemplates() {
    InclFileTemplate = new FileName( "incls\\", "_", "",                      ".incl", "", "");
      GIFileTemplate = new FileName( "incls\\", "",  "_precompiled", ".incl", "", "");
      GDFileTemplate = new FileName( "", "",  "Dependencies",         "",      "", "");
  }

  const char** outer_suffixes() { 
   static const char* suffs[] = { ".cpp", ".c", 0 };
   return suffs;
  }

  const char* obj_file_format()  { return "%s.obj";       }
  const char* asm_file_format()  { return "%s.i";         }
  const char* dependent_format() { return "$(VM_PATH)%s"; }

  Bool includeGIInEachIncl() { return False;}

  void abort() { ::abort(); }
     
  // I think windows file names are case-insensitive -- dmu
  virtual Bool fileNameStringEquality(const char* a, const char* b) { return stricmp(a, b) == 0; }

  void fatal(const char* msg = "See console window") {
    MessageBox(NULL, msg, "makeDeps error:", MB_OK);
    exit(1);
  }

} Plat;

# elif defined(__linux__)

class LinuxPlatform: public AbstractPlatform {
 public:
  void setupFileTemplates() {
    InclFileTemplate = new FileName( "incls/", "_", "",                     ".incl", "", "");
      GIFileTemplate = new FileName( "incls/", "",  "_precompiled", ".hh", "", ".hh.gch");
      GDFileTemplate = new FileName( "", "",  "Dependencies.hh",      "",      "", "");
  }
      
  const char** outer_suffixes() { 
    static const char* suffs[] = { ".cpp", ".c", ".s", ".S", 0 };
    return suffs;
  }

  const char* obj_file_format()  { return "%s.o"; }
  const char* asm_file_format()  { return "%s.i"; }
  const char* dependent_format() { return "%s";   }

  void abort()     { ::abort(); }
  int defaultGrandIncludeThreshold() { return 100; } // does not speed things up

  // For Unix make, include the dependencies for precompiled header files.
  Bool includeGIDependencies() { return True; }

  Bool includeGIInEachIncl() { return False; }

  void writeGIInclude(FILE* inclFile ) {
    fprintf(inclFile, "# include \"%s\"\n", GIFileTemplate->pre_stem_suff());
  }
  
  const char* GIFileForDependency() { return GIFileTemplate->pre_stem_altSuff(); }
 
} Plat;


# else

class UnixPlatform: public AbstractPlatform {
 public:
  void setupFileTemplates() {
    InclFileTemplate = new FileName( "incls/", "_", "",                     ".incl", "", "");
      GIFileTemplate = new FileName( "incls/", "",  "", "", "", "");
      GDFileTemplate = new FileName( "", "",  "Dependencies.hh",      "",      "", "");
  }
      
  const char** outer_suffixes() { 
    static char *suffs[] = { ".cpp", ".c", ".s", ".S", 0 };
    return suffs;
  }

  const char* obj_file_format()  { return "%s.o"; }
  const char* asm_file_format()  { return "%s.i"; }
  const char* dependent_format() { return "%s";   }

  void abort()     { ::abort(); }
  // Do not change this; unless you fix things so precompiled header files
  // get translated into make dependencies. - Ungar
  int defaultGrandIncludeThreshold() { return 1 << 30; }

  // For Unix make, include the dependencies for precompiled header files.
  Bool includeGIDependencies() { return True; }

} Plat;


# endif


void FileName::check_length() {
  const char* s = strlen(suffix) >= strlen(altSuffix)  ?  suffix  :  altSuffix;
  int len = strlen(prefix) + strlen(stem) + strlen(s);
  int lim = Plat.fileNameLengthLimit();
  if ( len  >  lim ) {
    char buf[BUFSIZ];
    sprintf( buf, "%s%s%s is too long; %d >= %d\n",
             prefix, stem, s, len, lim);
    Plat.fatal(buf);
  }
}


Bool suffix_matches(const char* s, const char** suffixes) {
  register int len = strlen(s);
  for ( char** suffp = (char**) suffixes;  *suffp;  ++suffp ) {
    register int suffLen = strlen(*suffp);
    if ( len >= suffLen  
    &&  Plat.fileNameStringEquality(&s[len - suffLen], *suffp))
         return True;
  } 
  return False;
}

Bool is_outer_file(const char* s) { return suffix_matches(s, Plat.outer_suffixes()); }



int exitCode = 0;



class item;
class database;

const item* NullItem = 0;

// a list (of files)

class list {
 public:
  item *first;
  item *last;
  char *name;

  Bool beenHere;
  Bool mayBeCycle;
  Bool isCycle;
  Bool useGrandInclude; // put in list because a file can refuse to
  const char* platformDependentInclude; // e.g. if this is sig_unix.hh this field contains sig_pd.hh
  list* platformDependentIncludees; // e.g. if this is sig.hh this field contains sig_unix.hh
  int  count;

  list(const char* n) {
    first = last = (item*)NullItem;
    beenHere =  mayBeCycle = isCycle = False;
    platformDependentInclude = NULL;
    platformDependentIncludees = NULL;
    name = new char[(int)strlen(n) + 1];
    count = 0;
    strcpy(name, n);
    useGrandInclude = Plat.haveGrandInclude();
  }

  list* listForFile(const char*);
  Bool  isEmpty() { return first == 0; }
  void  add(list*);
  void  addFirst(list*);
  void  addIfAbsent(list*);
  void  doFiles(list* s);
  list* doCFile();
  void  doHFile(list* s);
  void  traceCycle(list* s);
  Bool  compareLists(list* s, database* cur = NULL, database* prev = NULL);

  void  put_incl_file( database* );
};


// a list item

class item {
 public:
  item* next;
  list *contents;
  item(list* c) {next = (item*)NullItem;  contents = c;}
};


// I hold the macro definitions
// A token <macroName> is replaced by the macro's contents.

class macro_definitions {
  struct macro {
    char* name;
    char* contents;
  };
  macro macros[1000];
  int nmacros;

  char** lookupAll(const char* name, int nameLen,
               const char* pltf, const char* dbf, const char* line, int lineNo // for error msgs
               ) {
    char** r = new char*[maxMatches + 1];
    int j = 0;
    
    for (int i = 0;  i < nmacros;  ++i)
      if ( strncmp( macros[i].name, name, nameLen) == 0  &&  strlen(macros[i].name) == nameLen ) {
        if (j >= maxMatches)  Plat.fatal("raise n");
        r[j++] = macros[i].contents;
      }
    if (j > 0) {
      r[j] = NULL;
      return r;
    }
      
    char err[BUFSIZ];
    sprintf(err, "macro %.*s is not defined, Platform file: %s, DB file: %s, Line: %s, Line no.: %d\n" \
                  "\n (Possibly the CRs are the wrong type in the platform file.)", 
            nameLen, name,
            pltf, dbf, line, lineNo);
    print_to(err);
    Plat.fatal(err);
    return NULL;
  }

  
  public:

  macro_definitions() {
    nmacros = 0;
  }

  void add_macro(char* name, char* contents) {
    if ((unsigned)nmacros >= sizeof(macros) / sizeof(macros[0])) {
      Plat.fatal( "too many macros!");
    }
    
    macros[nmacros].name     = new char[(int)strlen(name) + 1];  strcpy(macros[nmacros].name,     name    );
    macros[nmacros].contents = new char[(int)strlen(contents) + 1];  strcpy(macros[nmacros].contents, contents);
    ++nmacros;
  }


  void  read_from(const char* fileName, Bool missing_ok = False) {
    FILE* f = fopen(fileName, "r");
    if (!f && missing_ok)  return;
    if (!f) perror(fileName), Plat.fatal();

    while (!feof(f)) {
      char line[BUFSIZ];
      if (fgets( line, sizeof(line), f) == NULL) {
        if (feof(f))
          return;
        perror(fileName);  
        Plat.fatal("error opening platform file");
      }
      char tok1[BUFSIZ];
      char tok2[BUFSIZ];
      int r = sscanf(line, " %s", tok1);
      if (r == 0  ||  r == EOF) {}  // empty line
      else if (strcmp(tok1, "//") == 0) {} // comment
      else {
	      r = sscanf(line, " %s = %s", tok1, tok2);
	      if (r != 2) {
	        char err[BUFSIZ];
	        sprintf( err, 
	                 "line %d of file %s:" \
	                 "expected \"macroName = value\"" \
	                 " but found:\n %s\n",
	                 nmacros,
	                 fileName,
	                 line);
	        Plat.fatal(err);
	      }
	      add_macro(tok1, tok2);  
      } 
     }
   }


  char** expandAll(const char* token, 
               const char* pltf, const char* dbf, const char* line, int lineNo // for error msgs only
               ) { 
    // the token may contain one or more <macroName>'s

    const char* in = token;
    static const int maxMacrosPerLine = 10;
    char** macros[maxMacrosPerLine];
    int nMacros = 0;
    
    while (*in) {
      if (*in != '<') { ++in; }
      else {
        // a macro!
        const char* leftAngle = in;
        const char* rightAngle = leftAngle + 1;
        for ( ; *rightAngle != '>';  ++rightAngle)
          if (!*rightAngle) {
            char err[BUFSIZ];
            sprintf(err, "Could not find right angle-bracket in token %s" \
                          "\nPlatform file: %s  DB file: %s  line: %s  line number: %d\n",
                           token, 
                           pltf, dbf, line, lineNo);
            Plat.fatal(err);
          }
        macros[nMacros++] = lookupAll(leftAngle + 1, rightAngle - leftAngle - 1, pltf, dbf, line, lineNo);
        if (nMacros >= maxMacrosPerLine) Plat.fatal("too many");
        in = rightAngle + 1;
      }
    }
    macros[nMacros] = NULL;
    
    int nExpansions = 1;
    for (int i = 0;  i < nMacros;  ++i) {
      int n = 0;  while(macros[i][n++]) {}
      nExpansions *= n-1;
    }
    char** expansions = new char*[nExpansions+1];
    int* indices = new int[nMacros];
    for (int i = 0;  i < nMacros;  indices[i++] = 0) {}
    
    for (int exp = 0;  exp < nExpansions; ++exp) {
      in = token;
      char* out = expansions[exp] = new char[1024];
      int whichMacroInLine = 0;
      while ( *in ) {
        if (*in != '<')  *out++ = *in++;
        else { // a macro
          for (char* p = macros[whichMacroInLine][indices[whichMacroInLine]];  *p;  *out++ = *p++) {}
          if (!macros[whichMacroInLine][++indices[whichMacroInLine]])
                                          indices[whichMacroInLine] = 0;
          ++whichMacroInLine;
          ++in;  while (*in++ != '>'); // skip over >
        }
      }
      *out = '\0';
    }
    expansions[nExpansions] = NULL;
    return expansions;
  }
  
  
  macro_definitions* copy() {
    macro_definitions* r = new macro_definitions();
    for (int i = 0;  i < nmacros;  ++i)
      r->macros[i] = macros[i];
    r->nmacros = nmacros;
    return r;
  }

  void set_all_macro_bodies_to(char* s) {
    for (int i = 0;  i < nmacros;  ++i)
      macros[i].contents = s;
  }
  
  void print_to(char* buf) {
    for (int i = 0;  i < nmacros;  ++i)
      sprintf(buf, "%s%s = %s\n", buf, macros[i].name, macros[i].contents);
  }
};


// the whole database

class database {
  macro_definitions* macros;
  list*   allFiles;
  list* outerFiles;
  list* indiv_includes;
  list* grand_include; // the results for the grand include file
  long int   threshold;
  int   nOuterFiles;
  int   nPrecompiledFiles;
  Bool  missing_ok;
  
 public:
  
  void absolute_generation( const char* new_plat_fn, const char* new_db_fn);
  void relative_generation( database* prev, 
                            const char* old_plat_fn, const char* old_db_fn, 
                            const char* new_plat_fn, const char* new_db_fn);
  void copy_file(const char* src, const char* dst);
  void can_be_missing() { missing_ok = True; }
  void get(const char *macro_file, const char * db_file);
  void compute();
  void put();
  void verify();
  void putDiffs(database*);

   database(long int t) {
    macros          = new macro_definitions();
      allFiles      = new list("allFiles");
    outerFiles      = new list("outerFiles");
    indiv_includes  = new list("indiv_includes");
     grand_include  = new list(GIFileTemplate->nameOfList());
     
    threshold = t;
    nOuterFiles = 0;
    nPrecompiledFiles = 0;
    missing_ok = False;
  };
  
  Bool hfile_is_in_grand_include(list* hfile, list* cfile) {
    return  hfile->count >= threshold  &&  cfile->useGrandInclude;
  }

  protected:
   void create_file_if_absent( const char* );
   void write_grand_include();
   void write_grand_unix_makefile();
   void write_individual_includes();
   void write_individual_includes(database* previous);
   
   void get_pair(const char* unexpanded_includer, const char* unexpanded_includee,
                 const char* plat_fileName, const char* db_fileName, const char* line, int lineNo // for errors
                 );
   void get_quad(const char* plat_dep_inc, 
                 const char* unexpanded_foo_hh, const char* unexpanded_foo_pd_hh, const char* unexpanded_foo_arch_hh,
                 const char* plat_fileName, const char* db_fileName, const char* line, int lineNo // for errors
                 );
};



void AbstractPlatform::fileNamePortabilityCheck(const char* name, const char* matchingName) {
  if (strcmp(name, matchingName) != 0) {
    char err[BUFSIZ];
    sprintf(err, 
	    "Error: file %s also appears as %s.  "
	    "Case must be consistent for portability.\n",
	    matchingName, name);
    Plat.fatal(err);
  }
}


void AbstractPlatform::fileNamePortabilityCheck(const char* name) {
  if ('A' <= name[0]  &&  name[0] <= 'Z') {
    char err[BUFSIZ];
    sprintf(err, 
	    "Error: for the sake of portability\n"
            " we have chosen to avoid files starting with an uppercase letter.\n"
            " Please rename %s.",
            name);
    Plat.fatal(err);
  }
}


     
list* list::listForFile(const char* namea) {
  for ( register item* p = first;  p;  p = p->next)
    if ( Plat.fileNameStringEquality(p->contents->name, namea) ) {
      Plat.fileNamePortabilityCheck( namea, p->contents->name );
      return p->contents;
    }

  Plat.fileNamePortabilityCheck( namea ); 
  register list *s = new list(namea);
  add(s);
  return s;
}


Bool list::compareLists(register list* s, database* cur, database* prev) {
  if (    platformDependentInclude != NULL
  &&   s->platformDependentInclude != NULL
  &&   strcmp(    platformDependentInclude, 
               s->platformDependentInclude ) != 0 )
    return False; // difference in platformDependentIncludes
    
  register item *mine, *his;
  for ( mine = first,  his = s->first;
        ;
        mine = mine->next,  his = his->next) {

    if ( (mine == NullItem)  !=  (his == NullItem) )
            return False; // one ends first
    if ( mine == NullItem )
            return True; // equal
    if ( !Plat.fileNameStringEquality( mine->contents->name, his->contents->name))
            return False; // crude: order dependent
    if ( cur == NULL )
      ;
    else if ( cur ->hfile_is_in_grand_include( mine->contents, this )
         !=   prev->hfile_is_in_grand_include( his->contents,  s    ))
            return False; // one is in grand, other is not
  }
}


void list::add(list* s) {
  register item* i = new item(s);
  // next two statements are for debugging
  if (  i->next     )    { printf("next %p\n", i->next);      Plat.abort();}
  if ( !i->contents )    { printf("c = %p\n",  i->contents);  Plat.abort();}
  
  if (last)   last->next = i;
  else             first = i;
  
  last = i;
}


void list::addFirst(list* s) {
  register item* i = new item(s);
  if (first) {
      i->next = first;
      first = i->next;
  }
  else {
      first = last = i;
  }
}


void list::addIfAbsent(list* s) {
  for ( register item* p = first;  p;  p = p->next)
    if (p->contents == s)
      return;
  add(s);
}


void list::doFiles(list* s) {
  for ( register item* p = first;  p;  p = p->next) {
    list* h = p->contents;
    if (h->platformDependentInclude != NULL) {
      fprintf(stderr, "Error: The source for %s is %s.\n\tIt shouldn't be included directly by %s.\n",
	      h->platformDependentInclude,
	      h->name,
	      name);
      h->platformDependentInclude = NULL; // report once per file
      exitCode = 1;
    }
    h->doHFile(s);
  }
}


void list::traceCycle(list* s) {
  if (isCycle) // already traced
    return;
  isCycle = True;
  fprintf(stderr, "\ttracing cycle for %s\n", name);
  exitCode = 1;
  for (register item* p = first; p; p = p->next) {
    register list* q = p->contents;
    if (q->mayBeCycle)
      if (s == q) {
        char err[BUFSIZ];
        sprintf(err, "\tend of cycle for %s\n", s->name);
        Plat.fatal(err);
      }
      else
        q->traceCycle(s);
  }
}


void list::doHFile(list* s) {
  if (beenHere) {
    if (mayBeCycle) 
      traceCycle(this);
    return;
  }
  beenHere = True;
  mayBeCycle = True;
  doFiles(s);
  mayBeCycle = False;
  s->add(this);
}


list* list::doCFile() {
  list* s = new list(name);
  s->useGrandInclude = useGrandInclude; // propagate this
  doFiles(s);
  for ( register item *si = s->first;  si;  si = si->next)
    si->contents->beenHere = False;
  return s;
}


FILE* fileFor(const char* fname) {
  if (fname == NULL  ||  fname[0] == '\0')
    Plat.fatal("fileFor: empty or null name");
  FILE *r = fopen(fname, "w");
  if (r == NULL) {
    perror(fname);
    Plat.fatal();
  }
  return r;
}


char* remove_suffix_from(const char* s) {
  char* r = new char[BUFSIZ];
  strcpy( r, s);
  char* p;
  for ( p = &r[strlen(r)];  *p != '.';  --p)
    if (p <= r)  abort();
  *p = '\0';
  return r;
} 


// if .hh file is included thresh times, put it in the grand include file
void list::put_incl_file( database* db ) {

  FileName* inclName = InclFileTemplate->copy_stem(name);
  FILE*     inclFile = fileFor( inclName->dir_pre_stem_suff() );
  

  if ( Plat.haveGrandInclude()  &&  Plat.includeGIInEachIncl()  &&  useGrandInclude ) {
    Plat.writeGIInclude(inclFile);
  }
  
  for (register item *si = first;  si;  si = si->next) {
    if ( !db->hfile_is_in_grand_include( si->contents, this ) )
      fprintf( inclFile, 
               "# include \"%s%s\"\n", 
               InclFileTemplate->getInvDir(),
               si->contents->name);
  }
  fclose(inclFile);
}


void database::get(const char* plat_fileName, const char* db_fileName) {
  printf("\treading platform file: %s\n", plat_fileName);
  macros->read_from(plat_fileName, missing_ok);

  FILE* f = fopen(db_fileName, "r");
  if (!f && missing_ok)  return;
  if (!f) perror(db_fileName), Plat.fatal();
  printf("\treading database: %s\n", db_fileName);

  int lineNo = 0;
  while (!feof(f)) {
#   define LEN 1024
    char line[LEN];
    
    
    // read line into line[]
    int i, c;
    for ( i = 0,  c = fgetc(f);
          i < LEN-1  &&  c != EOF  &&  (char)c != '\n'  &&  (char)c != '\r';
          ++i,  c = fgetc(f) )
      line[i] = (char)c;

    line[i] = '\0';
    lineNo++;
    
    // check for comment
    if ( strncmp( line,  Plat.commentPrefix(),  strlen(Plat.commentPrefix()))
         == 0)
      continue;

    static char token1[BUFSIZ];
    static char token2[BUFSIZ];
    static char token3[BUFSIZ];
    static char token4[BUFSIZ];
    
    static bool cannot_recurse = 0;
    if (cannot_recurse)
      Plat.fatal("cannot_recurse");
    cannot_recurse = true;

    token1[0] = token2[0] = token3[0] = token4[0] = '\0';
    int n = sscanf(line, " %s %s %s %s", token1, token2, token3, token4);
    if (n <= 0) {
      // empty line?
      char *c;
      for (c = line; *c && isspace(*c); c++) {}
      if (*c == '\0')
        n = 0; // flag empty line, error
      else if (n == 0)
        n = -1; // flag error
    }
    
    if ( n == 0 ) {  // empty line
    } 
    else if (n == 2)
      get_pair(token1, token2,                 plat_fileName, db_fileName, line, lineNo - 1);	 
    else if (n == 4) 
      get_quad(token1, token2, token3, token4, plat_fileName, db_fileName, line, lineNo - 1);
    else {
      char err[BUFSIZ];
      sprintf(err, "invalid line: \"%s\"\nerror position: line %ld\n", line, (long)lineNo);
      Plat.fatal(err);
    }
    cannot_recurse = false;  
  }   
}




void database::get_pair(const char* unexpanded_includer, const char* unexpanded_includee,
                        const char* pltf, const char* dbf, const char* line, int lineNo // for errors
                        ) {
  char** includers = macros->expandAll(unexpanded_includer, pltf, dbf, line, lineNo );
  char** includees = macros->expandAll(unexpanded_includee, pltf, dbf, line, lineNo );
  
  for (char** includerp = &includers[0];  *includerp;  ++includerp) {
  
    list *p = allFiles->listForFile(*includerp);
    
    if (is_outer_file(*includerp))
      outerFiles->addIfAbsent(p);

    for (char** includeep = &includees[0];  *includeep;  ++includeep) {
        if (strcmp( *includeep, Plat.generatePlatformDependentInclude() ) == 0 ) {
        
          char err[BUFSIZ];
          sprintf(err, "invalid line: \"%s\"\nerror position: line %ld."
                  " Old-style %s. Use \"%s foo.hh foo_pd.hh foo_<arch>.hh\".\n",
                  line, (long)lineNo, Plat.generatePlatformDependentInclude(), 
                  Plat.generatePlatformDependentInclude());
          Plat.fatal(err);
      } 
      else if ( strcmp( *includeep, Plat.noGrandInclude() ) == 0 ) {
        p->useGrandInclude = False;
      }
      else {            
        list *q = allFiles->listForFile(*includeep);
        p->addIfAbsent(q);
      }
    }
  }
}


void database::get_quad(const char* plat_dep_inc, 
                        const char* unexpanded_foo_hh, const char* unexpanded_foo_pd_hh, const char* unexpanded_foo_arch_hh,
                        const char* pltf, const char* dbf, const char* line, int lineNo // for errors
                       ) {
  if (strcmp( plat_dep_inc, Plat.generatePlatformDependentInclude()) != 0) {
      char err[BUFSIZ];
      sprintf(err, "invalid line: \"%s\"\nerror position: line %ld."
              " First token of four-word line should be %s.\n", line, (long)lineNo, Plat.generatePlatformDependentInclude());
      Plat.fatal(err);
  }
  char** foo_hhs      = macros->expandAll(unexpanded_foo_hh,      pltf, dbf, line, lineNo);
  char** foo_pd_hhs   = macros->expandAll(unexpanded_foo_pd_hh,   pltf, dbf, line, lineNo);
  char** foo_arch_hhs = macros->expandAll(unexpanded_foo_arch_hh, pltf, dbf, line, lineNo);
  
  for (char** foo_pd_hhp = &foo_pd_hhs[0];  *foo_pd_hhp;  ++foo_pd_hhp) {
    FileName* foo_pd_hh_name = InclFileTemplate->copy_stem(*foo_pd_hhp);
    const char* incls_foo_pd_hh = foo_pd_hh_name->dir_pre_stem_suff();
    FILE* foo_pd_file = fileFor( incls_foo_pd_hh );
    for (char** foo_arch_hhp = &foo_arch_hhs[0];  *foo_arch_hhp;  ++foo_arch_hhp)
      fprintf(foo_pd_file, "# include \"%s\"\n", *foo_arch_hhp);
    fclose(foo_pd_file);

    list *foo_pd_list = allFiles->listForFile(*foo_pd_hhp);
    foo_pd_list->platformDependentInclude = incls_foo_pd_hh; // mark foo_unix.hh for error checking    

    // figure out sig.hh given: sig_<os>.hh, then put sig_unix.hh into sig.hh's platformDependentInclude
    for (char** foo_hhp = &foo_hhs[0];  *foo_hhp;  ++foo_hhp) {
      list* foo_list = allFiles->listForFile(*foo_hhp);
      if (foo_list->platformDependentIncludees == NULL)
        foo_list->platformDependentIncludees = new list("my platformDependentIncludees");
      for (char** foo_arch_hhp = &foo_arch_hhs[0];  *foo_arch_hhp;  ++foo_arch_hhp)
        foo_list->platformDependentIncludees->add(allFiles->listForFile(*foo_arch_hhp));
    }
  }
}


void database::compute() {
  printf("\tcomputing closures\n");
  register item* si;
  for ( si = outerFiles->first;  si;  si = si->next) {
    // build both indiv and grand results
    indiv_includes->add(si->contents->doCFile());
    ++nOuterFiles;
  }
  if (!Plat.haveGrandInclude())
    return; // nothing in grand include
          
  // count how many times each include is included in grand-includable context
  // & add em to grand
  for ( register item* cf = indiv_includes->first;  cf;  cf = cf->next) {
    list *indiv_include = cf->contents;

    if ( !indiv_include->useGrandInclude )
      continue; // do not bump count if my files cannot be in grand include

    indiv_include->doFiles(grand_include); // put em on grand_include list


    for ( register item* incListItem = indiv_include->first;
          incListItem;
          incListItem = incListItem->next ) {
      ++incListItem->contents->count;
    }
  }
}


void database::verify() {
  for (register item *si = indiv_includes->first;  si;  si = si->next) {
    if ( !si->contents) Plat.abort();
  }
}

void database::write_individual_includes() {
  printf("\twriting individual include files\n");
  
  register item* si;
  for ( si = indiv_includes->first;  si;  si = si->next) {
    printf("\tcreating %s\n", si->contents->name);
    si->contents->put_incl_file( this );
  }
}

void database::write_individual_includes(database* previous) {
  register item *ci, *pi;
  for ( ci = indiv_includes->first,  pi = previous->indiv_includes->first;
        ci;
        ci = ci->next,  pi = pi->next) {

    register list  *newCFileList = ci->contents;
    register list *prevCFileList = pi->contents;
    if (!newCFileList->compareLists(prevCFileList, this, previous)) {
        printf("\tupdating %s\n", newCFileList->name);
        newCFileList->put_incl_file( this );
    }
  }
}
 
  

void database::write_grand_include() {
  printf("\twriting grand include file\n");
  FILE* inc = fileFor(GIFileTemplate->dir_pre_stem_suff());
  Plat.writeGIPragma(inc);
  // For xcode on MacOSX, only way to get compiler to not process grand include file
  // is to go to the .cpp file that does not want precompiled headers
  //  (i.e. grep for no_precompiled_headers in includeDB)
  // open the .cpp file in xcode, hit command-I, and put -D NO_PRECOMPILED_HEADERS
  // in additional compile flags field of inspector. -- dmu 11/03
  
  fprintf( inc,  "# ifdef __cplusplus\n\n");

  for ( item* si = grand_include->first;  si;  si = si->next) {
    //printf("  %4d  %s\n", si->contents->count, si->contents->name);
    if (si->contents->count >= threshold) {
      fprintf( inc, "# include \"%s%s\"\n", 
               GIFileTemplate->getInvDir(), si->contents->name);
      nPrecompiledFiles += 1;
    }
  }
  fprintf( inc, "\n");
  fprintf( inc, "\n# endif // __cplusplus\n");
  fclose( inc );
}

static void print_dependent_on(FILE* gd, const char* name) {
  fprintf( gd, " ");
  fprintf( gd, Plat.dependent_format(), name);
}

void database::write_grand_unix_makefile() {
  if (!Plat.writeDeps()) 
    return;

  // 2012-05-02 topa: newer cpp do not like the multi-line style
  // hence, we generate the file with one-line things directly
  printf("\twriting dependencies file\n");
  FILE* gd = fileFor(GDFileTemplate->dir_pre_stem_suff());
  
  { // write Obj_Files = ...

    // fprintf(gd, "Obj_Files = \\\n");
    fprintf(gd, "Obj_Files = ");
    for ( item* si = outerFiles->first;  si;  si = si->next) {
      list* anOuterFile = si->contents;
      char* stemName = remove_suffix_from(anOuterFile->name);
      fprintf(gd, Plat.obj_file_format(), stemName);
      // fprintf(gd, " \\\n");
      fprintf(gd, " ");
    }
    fprintf(gd, "\n\n");
  }

  if ( Plat.includeGIDependencies()  &&  nPrecompiledFiles > 0 ) {
      // write Precompiled_Files = ...
      // fprintf(gd, "Precompiled_Files = \\\n");
      fprintf(gd, "Precompiled_Files = ");
      for ( item* si = grand_include->first;  si;  si = si->next) {
	      if (si->contents->count < threshold) 
	        continue;
        // fprintf(gd, "%s \\\n", si->contents->name);
        fprintf(gd, "%s ", si->contents->name);
        // if .hh has plat dep incls, we also depend on them:
        if (si->contents->platformDependentIncludees != NULL)
          for ( item* pdi = si->contents->platformDependentIncludees->first;  pdi;  pdi = pdi->next)
	    // fprintf(gd, "%s \\\n", pdi->contents->name);
            fprintf(gd, "%s ", pdi->contents->name);
      }
      fprintf(gd, "\n\n");
  }

  { // write each dependency
    for ( item* si = indiv_includes->first;  si;  si = si->next) {
      list* anII = si->contents;

      const char*     stemName = remove_suffix_from(anII->name);
      const char* inclFileName = InclFileTemplate->copy_stem(anII->name)->pre_stem_suff();

      fprintf(gd, Plat.obj_file_format(), stemName);
      fprintf(gd, " ");
      fprintf(gd, Plat.asm_file_format(), stemName);
      fprintf(gd, ": ");

      print_dependent_on(gd, anII->name);
      print_dependent_on(gd, inclFileName );

      if ( Plat.haveGrandInclude() ) {
        print_dependent_on(gd, GIFileTemplate->pre_stem_altSuff());
      }

      for ( item* hi = anII->first;  hi;  hi = hi->next ) {
        if ( hfile_is_in_grand_include( hi->contents, anII ) ) 
          continue;
         print_dependent_on( gd, hi->contents->name);
         // need to add dependency for e.g., sig_unix.hh
        if (hi->contents->platformDependentIncludees != NULL) 
          for ( item* pdi = hi->contents->platformDependentIncludees->first;  pdi;  pdi = pdi->next)
            print_dependent_on(gd, pdi->contents->name);
      }
      fprintf( gd, "\n\n");
    }
  }
  
  // write deps for grand include file:
  if ( Plat.includeGIDependencies()  
  &&   nPrecompiledFiles > 0 ) {
      fprintf( gd, "%s: ", Plat.GIFileForDependency());
      fprintf( gd, "$(Precompiled_Files) \n" );
  }

  fclose( gd );
}


void database::put() {
  write_individual_includes();
  
  if (Plat.haveGrandInclude())
    write_grand_include();
   
  write_grand_unix_makefile();
}


void database::putDiffs(database* previous) {  
  printf("\tupdating output files\n");

  if ( !indiv_includes->compareLists(previous->indiv_includes)
  ||   !grand_include ->compareLists(previous->grand_include )) {
    printf(
      "The order of .cpp or .s has changed, or the grand include file has changed.\n");
    put();
    return;
  }

  write_individual_includes(previous);
   
  write_grand_unix_makefile();
}


int main(int argc, const char **argv) {
  Plat.setupFileTemplates();

  long int t = Plat.defaultGrandIncludeThreshold();
  Plat.set_args(argc, argv);
  
  if (argc > 1  &&  argv[1][0] == '-') {
    t = atoi(&argv[1][1]);
    --argc; ++argv;
  }
  database* previous = new database( t );
  database* current  = new database( t );

  previous->can_be_missing();
  
  switch (argc) {
   case 3:
    current->absolute_generation(argv[1], argv[2]);
    break;
    
   case 5:
    current->relative_generation(previous, argv[1], argv[2], argv[3], argv[4]);
    break;
    
   default:
    Plat.fatal( "usage:\n  makeDeps     platform-file     database-file\nor\n"
                        "  makeDeps old-platform-file old-database-file new-platform-file new-database-file\n");
  }
  if (exitCode != 0) {
    Plat.fatal( "Error: an error occured earlier\n");
  }
  exit(exitCode);
  return exitCode;
}

void database::absolute_generation(const char* new_plat_fn, const char* new_db_fn) {
  printf("New database:\n");
  get(new_plat_fn, new_db_fn);
  compute();
  put();
}

void database::create_file_if_absent(const char* fn) {
  FILE* f = fopen(fn, "r");
  if ( f == NULL ) {
    printf("Cannot open old file %s; will create then anew\n", fn);
    f = fopen(fn, "w");
    if (f == NULL) { perror(fn); Plat.fatal(); }
  }
  fclose(f);
}
  
                                   
void database::relative_generation(database* prev, 
                                   const char* old_plat_fn, const char* old_db_fn, 
                                   const char* new_plat_fn, const char* new_db_fn) {
  create_file_if_absent(old_plat_fn);
  create_file_if_absent(old_plat_fn);
                                   
  printf("Old database:\n");  prev->get(old_plat_fn, old_db_fn);  prev->compute();
  printf("New database:\n");        get(new_plat_fn, new_db_fn);        compute();

  printf("Deltas:\n");        putDiffs(prev);
  
  printf("Copying new to old files:\n");
  copy_file(new_plat_fn, old_plat_fn);
  copy_file(new_db_fn,   old_db_fn);
  printf("Copying finished\n");
}

void database::copy_file(const char* src,const char* dst) {
  static char buf[16 * 1024];
  printf("Copying %s -> %s...\n", src, dst);
  FILE* s = fopen(src, "r");  if (s == NULL) { perror(src); Plat.fatal(); }
  FILE* d = fopen(dst, "w");  if (s == NULL) { perror(dst); Plat.fatal(); }
  for (;;) {
    size_t n = fread( buf, 1, sizeof(buf), s );
         if (n == 0)   break;
	 else if (ferror(s) != 0) { perror(src); Plat.fatal(); }
    size_t nn = 0;
    for (;;) {
      nn += fwrite( buf, 1, n, d);
           if (nn == n)   break;
      else if (nn >  n) { fprintf(stdout, "what??\n"); Plat.fatal(); }
    }
  } 
  if (fclose(s)) { perror(src); Plat.fatal(); }   
  if (fclose(d)) { perror(dst); Plat.fatal(); }   
  printf("Copy finished\n");
}
