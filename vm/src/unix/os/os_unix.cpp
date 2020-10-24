/* Sun-$Revision: 30.32 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

/* There used to be a TARGET_OS_VERSION == MACOSX_VERSION check instead of __APPLE__.
 * However, the TARGET_OS_VERSION test only works after the header files are included,
 * but we need to have the Carbon header included before the other headers.
 * So we have to make an exception and not use the TARGET_OS_VERSION macro. -ma and dmu 4/02 */
# ifdef __APPLE__
  #  undef ASSEMBLER
  #  undef Alloc
  #  include <Carbon/Carbon.h>

  // remove Carbon macros to avoid name collisions
  #  undef assert
  #  undef assert_type
  #  undef assert_smi
  #  undef assert_byteVector
  #  undef assert_objVector

  #  include "asserts.hh"
  #  undef verify
  #  undef check
  #  undef XLIB
# endif

# include "_os_unix.cpp.incl"

# if TARGET_OS_VERSION == CYGWIN_VERSION
  #  include <sys/sysinfo.h>
  #  undef Status
  #  include <memoryapi.h>
# endif 

# if TARGET_OS_VERSION != MACOSX_VERSION 

  bool OS::is_directed_allocation_supported() { return true; } // should return desiredAddress

  char* OS::allocate_heap_aligned(caddr_t desiredAddress,
                                  int32 size, int32 align, const char* name,
                                  bool mustAllocate) {
  #  if TARGET_OS_VERSION == CYGWIN_VERSION
      const int32 allocation_size = size;
  #  else
      const int32 allocation_size = size + align;
  #  endif
      if ( desiredAddress != NULL
      &&   desiredAddress ==
                 mmap(desiredAddress, 
                      allocation_size,
                      PROT_READ|PROT_WRITE|PROT_EXEC,
                      MAP_PRIVATE|MAP_FIXED,
                      zero_fd, 0)) 
        return desiredAddress;
      
  #  if TARGET_OS_VERSION == CYGWIN_VERSION
      // Cygwin memalign() allocates from the top of memory down, which is pessimal
      // for our purposes. Instead, we use the raw Windows calls to find a large
      // enough free location
      char* b = (char *)VirtualAlloc(NULL, allocation_size, MEM_RESERVE, PAGE_NOACCESS);

      if (b) {
        VirtualFree(b, 0, MEM_RELEASE); 
        b = (char *)mmap(b, 
                    allocation_size,
                    PROT_READ|PROT_WRITE|PROT_EXEC,
                    MAP_PRIVATE|MAP_FIXED,
                    zero_fd, 0); 
      }
  #  else  
      char* b = (char*)memalign(align, size);
  #  endif
      if (b == NULL && mustAllocate)  allocate_failed(name);
      return b;     
  }


# else
  // No point in horsing around trying to make mmap work on OS X.
  // Works OK without it & and I have better things to do.  dmu 9/1
  
  bool OS::is_directed_allocation_supported() { return false; } 

  char* OS::allocate_heap_aligned(caddr_t ,
                                  int32 size, int32 align, const char* name,
                                  bool mustAllocate) {
    // fake it
    char* b = (char*)selfs_malloc(size + align - 1);
    if (b == NULL) {
      if (mustAllocate)
         allocate_failed(name);
      return b;
    }
    if ((int32)b & (align-1)) {
      char* newB = (char*) ((int32)b & ~(align-1)) + align;
      assert(b + size + align - 1 >=  newB + size, "rounding error");
      return newB;
    }
    else
      return b;
  }



# endif

  
# ifdef EXPERIMENT_WITH_APPLE_EVENTS
  
  static OSErr handle_open_app_event(const AppleEvent *theAppleEvent, AppleEvent *reply, long /*handlerRefcon*/) {
    lprintf("handle_open_app_event\n");
    long int n = -1;
    if (AECountItems(theAppleEvent, &n) != noErr) {warning("AECountItems failed"); return noErr;}
    lprintf("n = %d\n", n);
    return noErr;
  }
  static OSErr handle_open_document_event(const AppleEvent *theAppleEvent, AppleEvent *reply, long /*handlerRefcon*/) {
    lprintf("handle_open_document_event\n");
    long int n = -1;
    if (AECountItems(theAppleEvent, &n) != noErr) {warning("AECountItems failed"); return noErr;}
    lprintf("n = %d\n", n);
    AEDesc theAEDesc;
    OSErr e = AEGetParamDesc ( theAppleEvent, keyDirectObject, typeFSRef, &theAEDesc);
    if (e != noErr) {warning("AEGetParemDesc"); return noErr;}
    
    AppleEvent newAppleEvent;
    // e = AECreateAppleEvent(kCoreEventClass, kAEOpenApplication, 
    e =  AESendMessage (&newAppleEvent, NULL, kAENoReply, 0);
    if (e != noErr) {warning1("AESend %d", e); return noErr;}

    return noErr;
  }

  void handle_dropped_snapshot() {
    lprintf("handle_dropped_snapshot\n");
    OSErr e;
    e = AEInstallEventHandler ( kCoreEventClass,  kAEOpenApplication, handle_open_app_event, 0, false );
    if (e != noErr) {
      warning1("could not install event handler: %d", (int)e);
      return;
    }
    e = AEInstallEventHandler ( kCoreEventClass,  kAEOpenDocuments, handle_open_document_event, 0, false );
    if (e != noErr) {
      warning1("could not install event handler: %d", (int)e);
      return;
    }
    EventRecord evt;
    do {
      WaitNextEvent( highLevelEventMask, &evt, 0, NULL ); // was 1 instead of zero but buttons sluggish
        if ( evt.what == kHighLevelEvent ) {
          OSErr r = AEProcessAppleEvent(&evt);
          if (r != noErr)
            warning1("ignoring failed Apple event:, %d", (int)r);
        }
    } while ( evt.what != nullEvent ); 
  }  
  
  # endif // EXPERIMENT_WITH_APPLE_EVENTS


char* OS::get_user_directory(const char* user) {
  struct passwd* p = getpwnam(user);
  return  p == NULL  ?  NULL  :  p->pw_dir;
}


bool OS::is_fifo(mode_t m) {  return S_ISFIFO(m); }

time_t OS::combine_time(smi day, smi msec) {
  return  day * seconds_per_day + msec / 1000;
}


void OS::init() {

  SignalInterface::initialize(false);           // everything except ^C

  zero_fd= open("/dev/zero", O_RDONLY);
  if (zero_fd < 0) fatal("couldn't open /dev/zero");


# if  TARGET_OS_VERSION == SOLARIS_VERSION 

  real_mem_size=
    get_page_size() * (sysconf(_SC_PHYS_PAGES) - sysconf(_SC_AVPHYS_PAGES));

# elif  TARGET_OS_VERSION == SUNOS_VERSION
  // can't get this from SunOS without being super user, so do the
  // next best thing (which is pretty disgusting)
  {
    void (*old_h)(int, void*)= signal(SIGCHLD, SIG_IGN);
    bool ok= false;
    // assume 32Mb machine - 12Mb for Unix and X
    real_mem_size= 20 * 1024 * 1024; 
    FILE *p= popen("/etc/dmesg | /usr/bin/grep '^mem = '", "r");
    if (p) {
      if (fscanf(p, "mem = %dK", &real_mem_size) == 1) {
        real_mem_size *= 1024;  ok= true;
      }
      pclose(p);
    }
    if (!ok) {
      p= popen("/usr/bin/sed -n '/.*mem = \\([0-9]*\\)K.*/s//\\1/p' /var/adm/messages*", "r");
      if (p) {
        if (fscanf(p, "%d", &real_mem_size) == 1) {
          real_mem_size *= 1024;  ok= true;
        }
        pclose(p);
      }
    }
    signal(SIGCHLD, old_h);
  }
# elif  TARGET_OS_VERSION ==  MACOSX_VERSION

  int mib[2], mem_size;
  size_t len;

  mib[0] = CTL_HW;
  mib[1] = HW_USERMEM;
  len = sizeof(mem_size);
  sysctl(mib, 2, &mem_size, &len, NULL, 0);
  real_mem_size = mem_size;
# elif TARGET_OS_VERSION == LINUX_VERSION
  real_mem_size = 0x40000000; // punt for now
# elif TARGET_OS_VERSION == CYGWIN_VERSION
  real_mem_size = 
    get_page_size() * (get_phys_pages() - get_avphys_pages());
# else
  # error which?
# endif

# if TARGET_OS_VERSION == SUNOS_VERSION
  { // don't run SunOS 4 VM under Solaris!
    struct utsname name;
    uname(&name);
    if (name.release[0] == '5') {
      lprintf("This version of the Self virtual machine is for SunOS 4\n"
             "and cannot be used under SunOS 5 (aka Solaris 2).  Sorry!\n\n");
      exit(1);
    }
  }
#endif
}


void OS::terminate(int code) {
   prepare_to_exit_self();
   ::exit(code);
}


void OS::handle_suspend_and_resume(bool stopping) {
  static int  stdinFlags = 0;
  if (stopping) {
    stdinFlags = fcntl(0, F_GETFL, 0);
    if (stdinFlags == -1)                        perror("fcntl");
    if (fcntl(0, F_SETFL, 0) == -1)          perror("fcntl");
  } else {
    if (fcntl(0, F_SETFL, stdinFlags) == -1) perror("fcntl");
  }
}


void OS::Mmap(void *start, void *fin, FILE *file)
{
  long int len= (char*)fin - (char*)start;
  if (len == 0) return;

# if TARGET_OS_VERSION == CYGWIN_VERSION
  // CYGWIN can't handle remapping, so help it out.
  MEMORY_BASIC_INFORMATION info;

  SIZE_T size = VirtualQuery(start, &info, sizeof(info));
  if (size && info.State != MEM_FREE) {
//    munmap(info.AllocationBase, info.RegionSize);
    VirtualFree(info.AllocationBase, 0, MEM_RELEASE);
    if (info.AllocationBase < start)
      VirtualAlloc(info.AllocationBase, (char *)start - (char *)info.AllocationBase, info.State | MEM_RESERVE, info.Protect);
    if ((char *)start + info.RegionSize > (char *) fin)
      VirtualAlloc(fin, ((char *)start + info.RegionSize) - (char *)fin, info.State | MEM_RESERVE, info.Protect);
  }
# endif

  if (mmap((char*)start,
           len,
           PROT_READ|PROT_WRITE,
           MAP_PRIVATE|MAP_FIXED,
           fileno(file),
           ftell(file)) != start) {
    perror("cannot read from file");
    fatal("read error");
  }
  if (fseek(file, len, SEEK_CUR) < 0) {
    perror("cannot read from file");
    fatal("seek error");
  }
}

void OS::do_not_buffer(FILE* stream) { ::setbuf(stream, NULL); }


# if TARGET_OS_VERSION == SUNOS_VERSION
extern "C" {
  int munmap(caddr_t addr, int len);
}
# endif

char* OS::map_or_read_source_file(FILE* source_file, int32 length) {
  return (char*) mmap(0, length, PROT_READ, MAP_PRIVATE, fileno(source_file), 0);
}


void OS::unmap_source_file(caddr_t first, int length) {
  munmap(first, length);
}


bool OS::is_non_unix_path(const char* s) {
  Unused((char*)s);
  return false;
}


# if TARGET_OS_VERSION != MACOSX_VERSION

bool OS::setup_snapshot_to_run(const char* fileName) {
  // make executable
  struct stat stb;
  if (stat(fileName, &stb)) return false;
  mode_t old_perms= stb.st_mode;
  mode_t mask= umask(0);
  (void)umask(mask);
  if (chmod(fileName,
       old_perms | (~mask & (S_IXUSR | S_IXGRP | S_IXOTH))))
    return false;
  return true;
}

# else




/* The following two functions were written by Kristen McIntyre, 
 changed by Tobias Pape because of deprecation warnings. */
static bool path_to_fsref(const char *path, FSRef *fref)
{
    if (FSPathMakeRef((UInt8*) path, fref, NULL) == noErr)
        return true;
    return false;
}

static bool set_type_creator(const char *path, const char *type, const char *creator)
{
  FileInfo* finfo;
  FSRef fsr;
  FSCatalogInfo cinfo;
    
  if (path_to_fsref(path, &fsr) == false) {
    return false;
  }
  if (FSGetCatalogInfo(&fsr, kFSCatInfoFinderInfo | kFSCatInfoFinderInfo, &cinfo, NULL, NULL, NULL) != noErr) {
    return false;
  }
  
  finfo = (FileInfo*) &cinfo.finderInfo;

  finfo->fileType = 0;
  if (type != NULL) {
    for (int i = 0; i < 4; i++) {
        finfo->fileType |= ((unsigned char)type[i]) << ((3 - i) * 8); 
    }
  }

  finfo->fileCreator = 0;
  if (creator != NULL) {
    for (int i = 0; i < 4; i++) {
       finfo->fileCreator |= (unsigned char)creator[i] << ((3 - i) * 8);
    }
  }

  return FSSetCatalogInfo(&fsr, kFSCatInfoFinderInfo, &cinfo) == noErr;
}

bool OS::setup_snapshot_to_run(const char* fileName) {
  return set_type_creator(fileName, "Snap", "Self");
}

# endif


void OS::set_log_buf(FILE* f, char* buf, int bs) {    
# if  TARGET_OS_VERSION == SOLARIS_VERSION \
  ||  TARGET_OS_VERSION ==  MACOSX_VERSION \
  ||  TARGET_OS_VERSION ==   LINUX_VERSION \
  ||  TARGET_OS_VERSION ==  CYGWIN_VERSION
  setvbuf(f, buf, _IOFBF, bs);
  
# elif  TARGET_OS_VERSION == SUNOS_VERSION
  extern "C" void setbuffer(FILE *stream, char *buf, int size);
  setbuffer(f, buf, bs);

# else
  error NO OS VERSION
# endif
}


const char* OS::log_file_name() {
  static char fname[100];
  sprintf(fname, "/tmp/Self.vmlog.%ld", long(getpid()));
  assert(strlen(fname) < sizeof(fname), "");
  return fname;
}

void OS::set_args(int& , char**& ) {}


# if  TARGET_OS_VERSION == SOLARIS_VERSION

extern "C" int swapctl(int cmd, void *arg);


bool OS::get_swap_space_info(int &totalK, int &freeK) {
  struct anoninfo ai;

  // documentation for this syscall is a little, ermm, sparse..
  if (swapctl(SC_AINFO, &ai) == -1) return false;

  // allocated = anon memory not free
  // reserved = anon memory reserved but not allocated
  // available = anon memory not reserved
  int allocated= ai.ani_max - ai.ani_free;
  int reserved= ai.ani_resv - allocated;
  int available= ai.ani_max - ai.ani_resv;

  int pageSize= get_page_size();
  if (pageSize >= K) {
    totalK= (allocated + reserved) * (pageSize / K);
    freeK= available * (pageSize / K);
  } else {
    totalK= (allocated + reserved) / (K / pageSize);
    freeK= available / (K / pageSize);
  }
  return true;
}


# elif  TARGET_OS_VERSION ==  SUNOS_VERSION \
    ||  TARGET_OS_VERSION == MACOSX_VERSION \
    ||  TARGET_OS_VERSION ==  LINUX_VERSION \
    ||  TARGET_OS_VERSION == CYGWIN_VERSION 


bool OS::get_swap_space_info(int &, int &) {
  return false;
}

# endif


void OS::core_dump() {
  SignalBlocker sb; // ensure nothing is lost on OS X -- dmu 2/03
  IntervalTimer::disable_all(true); // a shotgun attempt to remedy MacOSX coredump/crash bug -- dmu 5/03
  lprintf("\nForcing core dump (and disabling IntervalTimer)...\n");
  SignalInterface::install_signal(SIGABRT, Signal_Handler_t(SIG_DFL));
  abort(); // will signal SIGABRT
}


void OS::enable_core_dumps() {
  // lprintf("\nSetting core limit to maximum value...\n");
  struct rlimit corelim;
  if (getrlimit(RLIMIT_CORE, &corelim) == -1)
    perror("getting core limit");
  corelim.rlim_cur = corelim.rlim_max;
  if (setrlimit(RLIMIT_CORE, &corelim) == -1)
    perror("setting core limit");
}


void OS::discard_pages(char *start, char *end) {
  # if TARGET_OS_VERSION == MACOSX_VERSION \
    || TARGET_OS_VERSION == MACOSX_VERSION
    return; // mmap of /dev/zero just fails on OSX -- dmu 6/04
        // and just punt for now in Linux - dmu 12/07
  # endif

  if (end - start < 2 * dont_bother) return;

  char *ps= real_page_end  (start);
  char *pe= real_page_start(end  );

 # if TARGET_OS_VERSION == CYGWIN_VERSION
  madvise(ps, pe - ps, MADV_DONTNEED);
 # else 
  if (mmap(ps, pe - ps,
           PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
           zero_fd, 0) != ps)
    warning("mmap of /dev/zero failed");
 # endif
}


int OS::get_page_size() {
# if  TARGET_OS_VERSION == SOLARIS_VERSION
    static int p= sysconf(_SC_PAGESIZE);
    return p;
# else
    return getpagesize();
# endif 
}


int OS::min_core(caddr_t addr, size_t len, char *vec) {
  # if TARGET_OS_VERSION == LINUX_VERSION
    return  mincore(addr, len, (unsigned char*)vec);
  # elif TARGET_OS_VERSION == CYGWIN_VERSION
    memset(vec, 1, len);
    return 0;
  # else
    return  mincore(addr, len, vec);
  # endif
}


# if TARGET_OS_VERSION == SOLARIS_VERSION // decl wont come it!
  extern "C" {int madvise(caddr_t, size_t, int);}
# endif

#if  TARGET_OS_VERSION == SOLARIS_VERSION \
 ||  TARGET_OS_VERSION ==  MACOSX_VERSION \
 ||  TARGET_OS_VERSION ==  CYGWIN_VERSION
  void OS::setPageAdvisory(char *start, char *end, int code) {
    if (end - start < OS::dont_bother) return;
    char *ps= real_page_start(start);
    char *pe= real_page_end  (end  );
    if (madvise(ps, pe - ps, code) != 0) {
      // Solaris 2.4 returns -1 for no apparent reason sometimes
      // warning("madvise() returned unexpected value");
    }
  }


  void OS::random_access(char *start, char *end) {
    setPageAdvisory(start, end, MADV_RANDOM); 
  }

  void OS::sequential_access(char *start, char *end) {
    setPageAdvisory(start, end, MADV_SEQUENTIAL); 
  }
   
  void OS::normal_access(char *start, char *end) {
    setPageAdvisory(start, end, MADV_NORMAL); 
  }

  void OS::will_need_pages(char *start, char *end) {
    setPageAdvisory(start, end, MADV_WILLNEED); 
  }

  void OS::dont_need_pages(char *start, char *end) {
    setPageAdvisory(start + get_page_size(),
                    end - get_page_size(),
                    MADV_DONTNEED); }

  void OS::set_bytes(char* start, char* end, int filler) {
    OS::  will_need_pages(start, end);
    OS::sequential_access(start, end);
    memset(start, filler, end-start);
    OS::random_access(start, end);
  }


  void  OS::set_access_before_writing_space(void* /* objs_bottom*/, void* /* objs_top*/, 
                                            void* /*bytes_bottom*/, void* /*bytes_top*/) {
    // disabled until I figure out why it pages everything out
    // OS::sequential_access((char*)objs_bottom, (char*)objs_top);
    // OS::sequential_access((char*)bytes_bottom, (char*)bytes_top);
  }

  void  OS::reset_access_after_writing_space(void* /* objs_bottom*/, void* /* objs_top*/, 
                                             void* /*bytes_bottom*/, void* /*bytes_top*/) {
    //  OS::normal_access((char*) objs_bottom,  (char*) objs_top);
    //  OS::normal_access((char*)bytes_bottom,  (char*)bytes_top);
  }

  void OS::set_sequential_access_before_writing_snapshot() {}
  void OS::set_normal_access_after_writing_snapshot() {}


# elif  TARGET_OS_VERSION == SUNOS_VERSION

  void OS::    random_access(char*, char*) { vadvise(VA_ANOM); }
  void OS::sequential_access(char*, char*) { vadvise(VA_SEQL); }
  void OS::    normal_access(char*, char*) { vadvise(VA_NORM); }
  void OS::  will_need_pages(char*, char*) {}
  void OS::  dont_need_pages(char*, char*) {}
    

  void OS::set_bytes(char* start, char* end, int filler) {
    OS::sequential_access(start, end);
    memset(start, filler, end-start);
    OS::normal_access(start, end);
  }
    
  void  OS::set_access_before_writing_space( void*, void*, void*, void*) {}
  void  OS::reset_access_after_writing_space(void*, void*, void*, void*) {}


  void OS::set_sequential_access_before_writing_snapshot() {
    sequential_access((char*)0, (char*)~0);
  }
  
  void OS::set_normal_access_after_writing_snapshot() {
    normal_access((char*)0, (char*)~0);
  }

# elif  TARGET_OS_VERSION == LINUX_VERSION
  void OS::setPageAdvisory(char *start, char *end, int code) {
    if (end - start < OS::dont_bother) return;
    char *ps= real_page_start(start);
    char *pe= real_page_end  (end  );
    if (madvise(ps, pe - ps, code) != 0) {
      // Solaris 2.4 returns -1 for no apparent reason sometimes
      // warning("madvise() returned unexpected value");
    }
  }

  void OS::random_access(char *start, char *end) {
    setPageAdvisory(start, end, MADV_RANDOM);
  }

  void OS::sequential_access(char *start, char *end) {
    setPageAdvisory(start, end, MADV_SEQUENTIAL);
  }

  void OS::normal_access(char *start, char *end) {
    setPageAdvisory(start, end, MADV_NORMAL);
  }

  void OS::will_need_pages(char *start, char *end) {
    setPageAdvisory(start, end, MADV_WILLNEED);
  }

  void OS::dont_need_pages(char *start, char *end) {
    setPageAdvisory(start + get_page_size(),
                    end - get_page_size(),
                    MADV_DONTNEED); }

  void OS::set_bytes(char* start, char* end, int filler) {
    OS::  will_need_pages(start, end);
    OS::sequential_access(start, end);
    memset(start, filler, end-start);
    OS::random_access(start, end);
  }


  void  OS::set_access_before_writing_space(void* /* objs_bottom*/, void* /* objs_top*/,
                                            void* /*bytes_bottom*/, void* /*bytes_top*/) {
    // disabled until I figure out why it pages everything out
    // OS::sequential_access((char*)objs_bottom, (char*)objs_top);
    // OS::sequential_access((char*)bytes_bottom, (char*)bytes_top);
  }

  void  OS::reset_access_after_writing_space(void* /* objs_bottom*/, void* /* objs_top*/,
                                             void* /*bytes_bottom*/, void* /*bytes_top*/) {
    //  OS::normal_access((char*) objs_bottom,  (char*) objs_top);
    //  OS::normal_access((char*)bytes_bottom,  (char*)bytes_top);
  }

  void OS::set_sequential_access_before_writing_snapshot() {}
  void OS::set_normal_access_after_writing_snapshot() {}
# else
  # error which?
#endif


void OS::real_time(smi buf[]) {
  struct timeval t;
  gettimeofday(&t, 0); // changed for OS X, maybe should use unix headers after all?
  buf[0] = t.tv_sec / seconds_per_day;                               //days
  buf[1] = (t.tv_sec % seconds_per_day) * 1000 + (t.tv_usec / 1000); //msecs    
}


// Returns a string containing the current time in same format
// as the Self level time printString.
char* OS::current_time_string() {
  char*  buffer  = NEW_RESOURCE_ARRAY(char, 100);
  
  struct timeval t;
  gettimeofday(&t, 0);
# if TARGET_OS_VERSION == MACOSX_VERSION
  time_t sec = t.tv_sec;
  strftime(buffer, 100, "%A, %d %B %Y, %T", localtime(&sec));
# else
  strftime(buffer, 100, "%A, %d %B %Y, %T", localtime(&t.tv_sec));
# endif

  return buffer;
}


char* OS::strdup(const char* s) { return ::strdup(s); }


// Convert the (local) time specified in the objVector to days and ms
// Return boolean: true => success, false => failure.
bool OS::time_to_day_and_ms(objVectorOop timeVector, smi* msAndDays) {
  struct tm tod;
  tod.tm_year  = ((smiOop) timeVector->obj_at(0))->value() - 1900;
  tod.tm_mon   = ((smiOop) timeVector->obj_at(1))->value() - 1;
  tod.tm_mday  = ((smiOop) timeVector->obj_at(2))->value();
  tod.tm_wday  = ((smiOop) timeVector->obj_at(3))->value();
  tod.tm_hour  = ((smiOop) timeVector->obj_at(4))->value();
  tod.tm_min   = ((smiOop) timeVector->obj_at(5))->value();
  tod.tm_sec   = ((smiOop) timeVector->obj_at(6))->value();
  tod.tm_isdst = ((smiOop) timeVector->obj_at(7))->value();  // often -1.
  
  time_t t = mktime(&tod);
  if (t == -1) return false;
  msAndDays[0] = t / seconds_per_day;          //days
  msAndDays[1] = (t % seconds_per_day) * 1000; //msecs
  return true;
}


# if  TARGET_OS_VERSION == SUNOS_VERSION
  extern "C" {
    int gethostname(char *n, int len);
  }
# endif


char* OS::get_host_name() {
  char* b = NEW_RESOURCE_ARRAY( char, 255); // mac needs 255
  gethostname(b, 255);
  return b;
}


const char* OS::get_user_name() {
  static struct passwd* p = getpwuid (getuid());
  const char *username= p ? p->pw_name : "the user with no name";
  return username;
};


void OS::convert_unix_filename(const char* src, char* dst) {
  if (strlen(src) >= MAXPATHLEN)
    fatal("path too long");
  strcpy( dst, src);
}


int OS::zero_fd;


FILE*  OS::start_compressing_snapshot(const char* compression_f, const char* fullFileName, SignalBlocker*& sb) {
  char *cmd= new char[strlen(compression_f) + 4 +
                      strlen(fullFileName)  + 1];
  strcpy(cmd, compression_f);
  strcat(cmd, " >> ");
  strcat(cmd, fullFileName);
  sb= new SignalBlocker;
  FILE* snapFile= popen(cmd, "w");
  delete [] cmd;
  return snapFile;
}


int OS::end_compressing_snapshot(FILE* f) { return pclose(f); }


static pid_t child;

# if TARGET_OS_VERSION == SUNOS_VERSION
extern "C" {
  int seteuid(uid_t euid);
  int setegid(gid_t egid);
}
# endif

// Spawn off a decompression program reading from snap at the current offset
// and return a stream reading from the decompression program.
FILE* OS::start_decompressing_snapshot(FILE *snap, const char* decompression_filter)
{
  // The trick here is get the decompression program started in the
  // right place in the file...were it not for this, we could just
  // use popen(). 

  int p[2];
  if (pipe(p))
    fatal("Couldn't open pipe to do snapshot decompression");
  
  pid_t pid= FORK();
  if (pid == (pid_t)-1)
    fatal("Couldn't fork process to do snapshot decompression");

  if (pid == 0) { // this is the child
    long offset= ftell(snap);
    int fd= fileno(snap);
    if (lseek(fd, (off_t)offset, SEEK_SET) != (off_t)offset)
      fatal("lseek failed!");
    if (   dup2(fd, 0) < 0
        || dup2(p[1], 1) < 0)
      fatal("dup2 failed!");
    seteuid(getuid()); // just in case someone makes Self setuid...
    setegid(getgid());
    execlp(decompression_filter, decompression_filter, (char*)0);
    fatal("exec failed!");
  }
  child= pid;
  // this is the parent
  return fdopen(p[0], "r");
}


void OS::end_decompressing_snapshot() {
  int status;
  if (    wait(&status) != child
      ||  !WIFEXITED(status)
      ||  WEXITSTATUS(status))
    fatal("Decompression of snapshot failed");
}


void OS::snapshot_failed(FILE* snapFile, bool compressed_snapshot, SignalBlocker* sb) {
  if (errno == EINTR)
    lprintf("fwrite has failed. If you are writing to a Sun OS 4.1.1 machine\n"
            "the problem is most likely a known kernel bug. You can get\n"
            "a patch to fix the write problem from Sun (bug ID 1052649).\n"
            "Or, try using adb to clear ufs_WRITES in the kernel.\n");

  if (compressed_snapshot) {
    pclose(snapFile); delete sb;
  } else
    fclose(snapFile);
}

const char* OS::get_manufacturer_name() { return "sun"; }

void OS::print_memory() {
  Indent++;
  # if TARGET_OS_VERSION == MACOSX_VERSION
    warning("OS::print_memory unimp for OSX");
  # else
    printIndent();
    lprintf("Text: 0x%lx (%ld) bytes\n", (long)&etext, (long)&etext);
    printIndent();
    lprintf("Data: 0x%lx (%ld) bytes\n\n",
           (long)&end - (long)&etext,  (long)&end - (long)&etext);
  # endif
  Indent--;
}

const char* OS::mode_for_binary(const char* m)  { return m; }


# if TARGET_OS_VERSION == SUNOS_VERSION
  extern "C" {
    int getopt(int argc, char *const *argv, const char *optstring);
    extern char *optarg;
    extern int opterr, optind;
  }
# endif


# if    COMPILER != GCC_COMPILER  &&  TARGET_OS_VERSION == SUNOS_VERSION
  typedef const char* const*  argv_t;
# elif  COMPILER == GCC_COMPILER  ||  TARGET_OS_VERSION == SUNOS_VERSION
  typedef       char* const*  argv_t;
# endif

  
int     OS::getopt(int argc,  char* const* argv,  const char* optstring) {
  ::optarg = optarg;
  ::optopt = optopt;
  ::opterr = opterr;
  ::optind = optind;
  
  int r = ::getopt(argc, (argv_t)argv, optstring);
  
  optarg = ::optarg;
  optopt = ::optopt;
  opterr = ::opterr;
  optind = ::optind;
  
  return r;
}


void OS::check_events() { 
  # if defined(QUARTZ_LIB)
    QuartzWindow::check_carbon_events();
  # endif
} 


# if  TARGET_OS_VERSION == SOLARIS_VERSION \
  ||  TARGET_OS_VERSION ==  MACOSX_VERSION \
  ||  TARGET_OS_VERSION ==  LINUX_VERSION  \
  ||  TARGET_OS_VERSION == CYGWIN_VERSION 
extern "C" {
  int malloc_verify() { return 1; }
}
# endif


int OS::make_memory_executable(void* addr, size_t len) {
  return mprotect(addr, len, PROT_READ|PROT_WRITE|PROT_EXEC);
}
