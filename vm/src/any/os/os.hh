/* Sun-$Revision: 30.14 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if TARGET_IS_PROFILED
extern "C" void moncontrol(bool);
# endif


class OS {
 private:
  static const int seconds_per_day = 86400;
  
  static char*   allocate_heap_aligned(caddr_t desired_address,
                                       int32 size, int32 align, const char* name,
                                       bool mustAllocate = true);
                                       
                                       
  static char*   expand_unix_dir(const char* in,  char* out);
  static bool    expand_user_name(const char* in, const char* slash, char*& dirName);
  static char*   get_user_directory(const char* user);
  static void    convert_unix_filename(const char* src, char* dst);
  static bool    is_pipe(FILE* f);
  static bool    is_fifo(mode_t);
  
  static time_t  combine_time(smi day, smi msec);
  static void    setDateTimeBuf(struct tm *tod, smi buf[]);

  

 public:
 
  // Starting and stopping the VM:
  static void init();
  static void terminate(int); // do not call this exit to avoid bugs
  static void handle_suspend_and_resume(bool stopping);

  
                                       
  // Memory
  // returns true if allocate_idealized_page_aligned should get desiredAddr below
  static bool   is_directed_allocation_supported();
  
  static char*  allocate_idealized_page_aligned(int32 &size, const char* name,
                                                caddr_t desiredAddr= 0, 
                                                bool mustAllocate= true);
  static void   allocate_failed(const char* what);

                                      
  // Sometimes we want not the real page size, but the largest page size
  // common to all architectures (we hope) (and hence likely to be a
  // page boundary on all systems).
  static char*  idealized_page_start(void *p) { return page_start(p, idealized_page_size); }
  static char*  idealized_page_end  (void *p) { return page_end  (p, idealized_page_size); }
  
  // On the other hand...
  static char*  real_page_start(void *p) { return page_start(p, get_page_size()); }
  static char*  real_page_end  (void *p) { return page_end  (p, get_page_size()); }

 private:
  static char*  page_start(void *, unsigned int pg_sz);
  static char*  page_end  (void *, unsigned int pg_sz);
 
 public:
  // File I/O
  static const char* mode_for_binary(const char*);
  static void  FRead(        void* buffer, int32 size, FILE* stream);
  static void  FRead_swap(   void* buffer, int32 size, FILE* stream);
  static void  FWrite( const void* buffer, int32 size, FILE* stream);
  static void  read_or_seek( void* buffer, int32 size, FILE* stream);

  static void  FRead_mem(void* buffer_start, void *buffer_end, FILE* stream) {
                   FRead(buffer_start, (char*)buffer_end - (char*)buffer_start, stream); 
               }
  static void  FRead_mem_swap(void* buffer_start, void *buffer_end, FILE* stream) {
                   FRead_swap(buffer_start, (char*)buffer_end - (char*)buffer_start, stream); 
               }
  static void  FWrite_mem(void* buffer_start, void *buffer_end, FILE* stream) {
                   // next three added solely to aid debugging
                   void* bs_debug = buffer_start;
                   void* be_debug = buffer_end;
                   FILE* stream_debug = stream;
                   FWrite(buffer_start, (char*)buffer_end - (char*)buffer_start, stream);
               }
  static void    Mmap(void* start, void *end, FILE* stream);
  static void    do_not_buffer(FILE* stream);
  
  // Source files:
  static char*   map_or_read_source_file(FILE* source_file, int32 length);
  static void    unmap_source_file(caddr_t first, int length);
  
  // File names
  static bool    expand_dir(const char* in, char* out);
  friend char*   ExpandDir_prim(const char* in, void* FH);
  static bool    is_non_unix_path(const char*);
  
  // Other file manipulation
  static bool    setup_snapshot_to_run(const char*);
  static void    set_log_buf(FILE* f, char* buf, int bs);
  static const char*   log_file_name();
  
  // Process calls:
  static void    set_args(int& argc, char**& argv);
  // (an encapsulation of a standard Unix facility)
  static int     getopt(int argc,  char* const* argv,  const char* optstring);
  static char*   optarg;
  static int     opterr, optind, optopt;
 private:
  static int     simulated_getopt(int argc,  char* const* argv, const char* optstring);
 public:
 
  static char*   get_environment_variable(const char* name) { return getenv(name); }  
  static bool    get_swap_space_info(int &totalK, int &freeK);
  static void    core_dump();
  static void    enable_core_dumps();
  
  // Snapshot helpers, etc.:
  static FILE*     start_compressing_snapshot(const char* compression_f, const char* fullFileName, SignalBlocker*& sb);
  static int         end_compressing_snapshot(FILE* snapFile);
  static FILE*   start_decompressing_snapshot(FILE* snap, const char* decompression_filter);
  static void      end_decompressing_snapshot();
  
  static void    snapshot_failed(FILE* snapFile, bool is_compressed, SignalBlocker* sb);
  
  static void  set_access_before_writing_space(void* objs_bottom, void* objs_top, void* bytes_bottom, void* bytes_top);
  static void reset_access_after_writing_space(void* objs_bottom, void* objs_top, void* bytes_bottom, void* bytes_top);
  
  static void set_sequential_access_before_writing_snapshot();
  static void set_normal_access_after_writing_snapshot();


  // Throw these pages away (ie unmap).  Frees resources quickly
  // but requires more time to get them back again.
  static void discard_pages(char* start, char* end);
  
  static int  get_page_size();
  static int  min_core(caddr_t addr, size_t len, char *vec);

  // hints to paging system
  static void     random_access(char* start, char* end);
  static void sequential_access(char* start, char* end);
  static void     normal_access(char* start, char* end);
  
  // uses hints:
  static void set_bytes(char* start, char* end, int filler);
  
  // Tell the OS we will/won't need these pages in the near future
  static void  will_need_pages(char* start, char* end);
  static void  dont_need_pages(char* start, char* end);
  
  // Set OS permissions on memory:
  static int make_statically_allocated_memory_executable(caddr_t addr, size_t len);

  static unsigned int real_mem_size;
  static void    profile(bool flag) {
#                  if TARGET_IS_PROFILED
                     moncontrol(flag);
#                  else
                     Unused(flag);
#                  endif
                 }

  // Time functions
  static smi       user_time();
  static smi     system_time();
  static smi        cpu_time();

  static void    real_time(smi* buf);                     // fills buf w. days & msec
  static void    date_time(smi day, smi msec, smi* buf);  // fills buf w. Y/M/D/WD/H/M/S/YD/DST
  
  static bool    time_to_day_and_ms(objVectorOop timeVector, smi* msAndDays); // fills msAndDays
  static char*   current_time_string();
  
  // OS-dependant string functions
  static char*   strdup(const char* s);

  // Other names:
  static       char*   get_host_name();
  static const char*   get_operating_system(); // Returns a string describing the OS.
  static const char*   get_user_name();
  static const char*   get_manufacturer_name();
  
  static void    print_memory();
  
  // For platforms that must poll for events:
  static void check_events();

  
# include "_os_pd.hh.incl"  
};

oop get_swap_space_prim(oop rcvrIgnored, void *FH);

