/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "os_mac.hh"
# pragma implementation "os_unix.hh"
# pragma implementation "os.hh"
# pragma implementation "os_includes.hh"


# include "_os.cpp.incl"

extern "C" {
  int uname(struct utsname *name);
}

// expand ~/asfd/wert/sd or ~user/wer/wer/sdf
// out is OS::max_path_length long
// returns NULL if successful; otherwise returns an error string
char* OS::expand_unix_dir(const char* in,  char* out) {
  static char err[max_path_length + 50];
  char* dirName = (char*) "";
  
  if (*in != '~') {
    if (strlen(in) >= max_path_length) {
      sprintf(err, "'%s' exceeds %d chars in length", in, max_path_length);
      return err;
    }
    strcpy(out, in);
    return NULL;
  }
  
  // slash is location of slash after user name
  const char* slash = strchr(in, '/');  
  if (slash == NULL)  
    slash = in + strlen(in);
  
  if (in + 1  ==  slash) {
    // ~/ use HOME
    char* p = get_environment_variable("HOME");
    if (p)
      dirName = p;
  } 
  else if (!expand_user_name(in, slash, dirName)) {
    return dirName; // really an error, here
  }
  
  if (strlen(dirName) + strlen(slash)  >=  max_path_length) {
    sprintf(err, "'%s%s' exceeds %d characters in length",
            dirName, slash, max_path_length);
    return err;
  }
  sprintf(out, "%s%s", dirName, slash);
  return NULL;
}


bool OS::expand_user_name(const char* in, const char* slash, char*& dirName) {
  // expands user name after tilde at in, up to slash
  // put result in dirName
  // return false on error

  char user[logname_max+1];
  const size_t ulen = slash - (in + 1);
  if (ulen >= sizeof(user)) {
    static char err[max_path_length + 50];
    static char buf[max_path_length + 50];
    lsprintf_string(buf, ulen, in + 1);
    sprintf(err, "'%s' exceeds %ld in length",
            buf,  long(sizeof(user) - 1));
    dirName = err;
    return false;
  }
  memcpy(user, in + 1, ulen);
  user[ulen] = '\0';
  dirName = get_user_directory(user);
  if (dirName == NULL) {
    static char err[max_path_length + 50];
    sprintf(err, "unable to find a home directory for user: %s\n", user);
    dirName = err;
    return false;
  }
  return true;
}


// is f a pipe?  cache a result to speed things up
bool OS::is_pipe(FILE *f) {
  static bool lastAns;
  static FILE *last= NULL;
  static int fd= -1;
  if (f == last  &&  fileno(f) == fd) return lastAns;
  last = f;
  fd= fileno(f);
  struct stat st_buf;
  if (fstat(fd, &st_buf)) fatal("fstat failed");
  lastAns= is_fifo(st_buf.st_mode);
  return lastAns;
}


void OS::setDateTimeBuf(struct tm *tod, smi buf[]) {
  buf[0] = tod->tm_year + 1900;
  buf[1] = tod->tm_mon + 1;
  buf[2] = tod->tm_mday;
  buf[3] = tod->tm_wday;
  buf[4] = tod->tm_hour;
  buf[5] = tod->tm_min;
  buf[6] = tod->tm_sec;
  buf[7] = tod->tm_yday;
  buf[8] = tod->tm_isdst;
}


// ============================================================


// Allocate on a page boundary, multiple of page size
// Set size to amount actually allocated, 0 if none
// If desiredAddress not 0, try to get that area; assume the caller 
// knows what he wants.

char* OS::allocate_idealized_page_aligned(int32 &size, const char *name,
                                          caddr_t desiredAddress, 
                                          bool mustAllocate) {
  size= roundTo(size, idealized_page_size);
  assert(idealized_page_size % get_page_size() == 0, "page size mismatch");
  char* b = allocate_heap_aligned(desiredAddress, size, idealized_page_size,
                                    name, mustAllocate);
  if (b == NULL) size= 0;
  return b;
}


void OS::allocate_failed(const char* what) {
  lprintf("\n**** could not allocate space for %s\n", what);
  lprintf("Out of virtual memory - please add swap space to your system.\n");

  fatal("out of memory");
}


// the address of the start of the page containing p
char* OS::page_start(void *p, unsigned int pg_sz) {
  return (char*)(int((char*)p) & ~(pg_sz - 1)); 
}
  
// the address of the start of the next page after p-1
char* OS::page_end(void *p, unsigned int pg_sz)   {
  return page_start(((char*)p) - 1, pg_sz) + pg_sz; 
}


// ===========================================================


void OS::FRead(void* buffer, int32 size, FILE* stream) {
  if (size != 0  &&  fread((char*)buffer, size, 1, stream) != 1) {
    perror("cannot read from file");
    fatal("read error");
  }
}


void OS::FRead_swap(void* buffer, int32 size, FILE* stream) {
  FRead(buffer, size, stream);
  int32* end = (int32*)((char*)buffer + size);
  for (int32* p = (int32*)buffer;  p < end;  p++)
    if (Memory->is_snapshot_other_endian) 
      swap_bytes(p); 
}


// use this only to write snapshots
void OS::FWrite(const void* buffer, int32 size, FILE* stream) {
  if (size && fwrite((char*)buffer, size, 1, stream) != 1)
    universe::snapshot_failed();
}


// used to skip unusable portions of the snapshot
void OS::read_or_seek(void* ptr, int32 size, FILE* f) {
  if (okToUseCodeFromSnapshot) {
    OS::FRead(ptr, size, f);
  } else if (!is_pipe(f)) {
    // can't just let fseek fail as it alters the state of f
    if (fseek(f, size, SEEK_CUR)) fatal("seek failed");
  } else {
    while (size--) getc(f);
  }
  if (ferror(f)) fatal("read error");
}


// =====================================================


bool OS::expand_dir(const char* in,  char* out) { // returns true on success
  static char mid[max_path_length];
  if (is_non_unix_path(in)) {
     if (strlen(in) >= max_path_length)
       fatal("path too long");
     strcpy(out, in);
     return true;
  }
  char* err = expand_unix_dir(in, mid);
  convert_unix_filename(mid, out);
  if ( err != NULL ) {
    warning(err);
    return false;
  }
  return true;
}


char* OS::ExpandDir_prim(const char* in, void* FH) {
  static char mid[OS::max_path_length];
  static char out[OS::max_path_length];
  char* err = OS::expand_unix_dir(in, mid);
  if (err) {
    failure(FH, err);
    return NULL;
  }
  OS::convert_unix_filename(mid, out);
  return out;
}


// ==============================================================


unsigned int OS::real_mem_size;


// ==============================================================

smi OS::user_time() {
  ProcessInfo::update();
  return ProcessInfo::user_time().milli_secs();
}
  
smi OS::system_time() {
  ProcessInfo::update();
  return ProcessInfo::system_time().milli_secs();
}
  
smi OS::cpu_time() {
  ProcessInfo::update();
  return ProcessInfo::user_time().milli_secs() 
    + ProcessInfo::system_time().milli_secs();
}


void OS::date_time(smi day, smi msec, smi buf[]) {
  time_t l = combine_time(day, msec);
  setDateTimeBuf(localtime(&l), buf);      // Set local time info
  setDateTimeBuf(   gmtime(&l), buf + 9);  // and GMT info. All at once.
}

    
// ================================================================


const char *OS::get_operating_system() {
  struct utsname name;
  char* str = NEW_RESOURCE_ARRAY(char, sizeof(utsname));
  uname(&name);
  sprintf(str,"%s %s.%s", name.sysname, name.release, name.version);
  return str;
}
 

// ================================================================


oop get_swap_space_prim(oop rcvrIgnored, void *FH) {
  Unused(rcvrIgnored);
  int totalK, freeK;
  if (OS::get_swap_space_info(totalK, freeK)) {
    objVectorOop arr= Memory->objVectorObj->cloneSize(2);
    arr->obj_at_put(0, as_smiOop(totalK));
    arr->obj_at_put(1, as_smiOop(freeK));
    return arr;
  } else {
    failure(FH, "Couldn't get swap space info");
    return 0;
  }
}

// ================================================================
 
char*   OS::optarg;
int     OS::opterr, OS::optind = 1, OS::optopt;

// simulate Unix stdlib routine


int OS::simulated_getopt(int argc,  char* const* argv,  const char* optstring) {
  if (optind >= argc) return EOF;
  int i = optind;
  ++optind;
  if (argv[i][0] != '-') return EOF;
  char c = argv[i][1];
  if (c == '-') { // -- delims opts
    return EOF;
  }
  
  optarg = NULL;
  for ( const char* osp = optstring;  *osp;  ++osp) {
    if ( *osp == ':' ) continue;
    if ( *osp != c   ) continue;
    if ( osp[1] != ':')  return c;
    if ( argv[i][2] ) {
      optarg = &argv[i][2];
      return c;
    }
    i = optind;
    ++optind;
    if ( i < argc ) {
      optarg = &argv[i][0];
      return c;
    }
    // error: no opt arg
    c = '\0';
    break;
  }
  
  // matched none
   optopt = c;
  if (opterr)
    fprintf(stderr, "?\n");
  return '?';
}
