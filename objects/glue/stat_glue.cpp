/* Sun-$Revision: 30.5 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "_glueDefs.cpp.incl"
# include "stat.primMaker.hh"

#ifdef DYNAMIC
VERIFYCHECKSUM
#endif

// also declared in unixPrims.h
// (but unixPrims.h cannot be included here without including other files)
extern const char *UnixFile_seal;

const char* stat_type_seal = "stat_type_seal";

typedef struct stat stat_type;

stat_type* stat_wrapper(char* path, void* FH) {
  stat_type *buf;
  buf = new stat_type;
  if (stat(path, buf) == -1) {
    unix_failure(FH);
    return NULL;
  }
  return buf;
}

stat_type* lstat_wrapper(char* path, void* FH) {
  stat_type *buf;
  buf = new stat_type;
  if (lstat(path, buf) == -1) {
    unix_failure(FH);
    return NULL;
  }
  return buf;
}

stat_type* fstat_wrapper(int fd, void* FH) {
  stat_type *buf;
  buf = new stat_type;
  if (fstat(fd, buf) == -1) {
    unix_failure(FH);
    return NULL;
  }
  return buf;
}

# include <time.h>
oop time_to_vector(time_t t) {
  const int seconds_per_day = 60 * 60 * 24;
  objVectorOop res = Memory->objVectorObj->cloneSize(2);
  res->obj_at_put(0, as_smiOop(t / seconds_per_day), false);         //days
  res->obj_at_put(1, as_smiOop((t % seconds_per_day) * 1000), false);//msecs
  return res;
}

bool s_isdir_wrapper(stat_type *buf)  { return S_ISDIR(buf->st_mode); }
bool s_ischr_wrapper(stat_type *buf)  { return S_ISCHR(buf->st_mode); }
bool s_isblk_wrapper(stat_type *buf)  { return S_ISBLK(buf->st_mode); }
bool s_isreg_wrapper(stat_type *buf)  { return S_ISREG(buf->st_mode); }
bool s_islnk_wrapper(stat_type *buf)  { return S_ISLNK(buf->st_mode); }
bool s_issock_wrapper(stat_type *buf) { return S_ISSOCK(buf->st_mode); }
bool s_isfifo_wrapper(stat_type *buf) { return S_ISFIFO(buf->st_mode); }

oop stat_st_atime_wrapper(stat_type* s) { return time_to_vector(s->st_atime); }
oop stat_st_mtime_wrapper(stat_type* s) { return time_to_vector(s->st_mtime); }
oop stat_st_ctime_wrapper(stat_type* s) { return time_to_vector(s->st_ctime); }

# define WHAT_GLUE FUNCTIONS
    stat_glue
# undef WHAT_GLUE
