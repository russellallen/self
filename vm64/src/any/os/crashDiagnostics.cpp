/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "crashDiagnostics.hh"

# include "_crashDiagnostics.cpp.incl"

# if defined(__linux__) && !defined(__GLIBC__)
    // musl has no <execinfo.h> (Alpine dropped libexecinfo in 3.17). Stub the
    // backtrace API: the hybrid trace degrades to its banners plus the
    // "(backtrace_symbols failed)" note.
    static int backtrace(void**, int) { return 0; }
    static char** backtrace_symbols(void* const*, int) { return 0; }
    static void backtrace_symbols_fd(void* const*, int, int) {}
# else
#   include <execinfo.h>
# endif
# include <dlfcn.h>
# include <signal.h>
# include <sys/utsname.h>
# include <unistd.h>
# include <cxxabi.h>
# include <stdlib.h>
# include <string.h>
# include <errno.h>
# include <pthread.h>
# include <fcntl.h>
# include <stdio.h>

# if TARGET_OS_VERSION == MACOSX_VERSION
#   include <mach/mach.h>
#   include <mach/mach_vm.h>
#   include <sys/sysctl.h>
# endif


static const char* segv_code_name(int code) {
  switch (code) {
    case SEGV_MAPERR: return "SEGV_MAPERR: address not mapped to object";
    case SEGV_ACCERR: return "SEGV_ACCERR: invalid permissions for mapped object";
    default:          return "unknown";
  }
}


static const char* bus_code_name(int code) {
  switch (code) {
    case BUS_ADRALN: return "BUS_ADRALN: invalid address alignment";
    case BUS_ADRERR: return "BUS_ADRERR: nonexistent physical address";
    case BUS_OBJERR: return "BUS_OBJERR: object-specific hardware error";
    default:         return "unknown";
  }
}


static const char* trap_code_name(int code) {
  switch (code) {
    case TRAP_BRKPT: return "TRAP_BRKPT: process breakpoint (brk instruction)";
    case TRAP_TRACE: return "TRAP_TRACE: process trace trap (single-step)";
    default:         return "unknown";
  }
}


static const char* ill_code_name(int code) {
  switch (code) {
    case ILL_ILLOPC: return "ILL_ILLOPC: illegal opcode";
    case ILL_ILLOPN: return "ILL_ILLOPN: illegal operand";
    case ILL_ILLADR: return "ILL_ILLADR: illegal addressing mode";
    case ILL_ILLTRP: return "ILL_ILLTRP: illegal trap";
    case ILL_PRVOPC: return "ILL_PRVOPC: privileged opcode";
    default:         return "unknown";
  }
}


static void print_platform_info() {
# if TARGET_OS_VERSION == MACOSX_VERSION
  char version[64] = "unknown";
  size_t len = sizeof(version);
  sysctlbyname("kern.osproductversion", version, &len, NULL, 0);

  char model[64] = "unknown";
  len = sizeof(model);
  sysctlbyname("hw.model", model, &len, NULL, 0);

  uint64_t memsize = 0;
  len = sizeof(memsize);
  sysctlbyname("hw.memsize", &memsize, &len, NULL, 0);

  lprintf("Platform: macOS %s, %s, "
#   if defined(__aarch64__)
          "aarch64"
#   elif defined(__x86_64__)
          "x86_64"
#   else
          "unknown arch"
#   endif
          ", %llu MB RAM, page size %d\n",
          version, model,
          (unsigned long long)(memsize / (1024 * 1024)),
          OS::get_page_size());

# else  // Linux, Solaris, etc.
  struct utsname uts;
  if (uname(&uts) == 0) {
    lprintf("Platform: %s %s, %s, page size %d\n",
            uts.sysname, uts.release, uts.machine,
            OS::get_page_size());
  }
# endif
}


static void print_vm_info() {
  lprintf("VM: version %d.%d%s, snapshot format %d, %s, built %s, ",
          VM_major_version, VM_minor_version,
          VM_is_development_version ? " (development)" : "",
          int(VM_snapshot_version),
          vmBuildID, vmBuildDate);

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  lprintf("JIT compiled");
# else
  lprintf("interpreter-only (no JIT)");
# endif

  lprintf(", pid %d\n", (int)getpid());
}


static void print_signal_info(int sig, int32 code) {
  const char* code_desc = "unknown";
  if (sig == SIGSEGV)      code_desc = segv_code_name(code);
  else if (sig == SIGBUS)  code_desc = bus_code_name(code);
  else if (sig == SIGTRAP) code_desc = trap_code_name(code);
  else if (sig == SIGILL)  code_desc = ill_code_name(code);

# if TARGET_OS_VERSION == MACOSX_VERSION
  char sig_name[16] = "unknown";
  if (sig >= 0 && sig < NSIG) {
    const char* s = sys_signame[sig];
    size_t i;
    for (i = 0; s[i] && i < sizeof(sig_name) - 1; i++)
      sig_name[i] = (s[i] >= 'a' && s[i] <= 'z') ? s[i] - 32 : s[i];
    sig_name[i] = '\0';
  }
  lprintf("Signal: SIG%s (code %d = %s)\n", sig_name, (int)code, code_desc);
# else
  const char* sig_desc = strsignal(sig);
  if (!sig_desc) sig_desc = "unknown";
  lprintf("Signal: %s (signal %d, code %d = %s)\n", sig_desc, sig, (int)code, code_desc);
# endif
}


static void print_activity_state() {
  lprintf("Activity:");
# if defined(QUARTZ_LIB)
  if (quartz_semaphore) lprintf(" GUI drawing in progress,");
  lprintf(" %d window(s) open", WindowSet::num_windows());
# endif
  if (GCInProgress) lprintf(", GC in progress");
  if (ScavengeInProgress) lprintf(", scavenge in progress");
  lprintf("\n");
}


static void print_address_info(char* addr) {
  lprintf("\nFaulting address 0x%lx: ", (unsigned long)addr);

  if (Memory && Memory->new_gen && Memory->new_gen->contains(addr)) {
    lprintf("in new generation (eden/survivor)\n");
  } else if (Memory && Memory->old_gen && Memory->old_gen->contains(addr)) {
    lprintf("in old generation\n");
  } else if (Memory && Memory->code && Memory->code->contains(addr)) {
    lprintf("in code zone (nmethods)\n");
  } else {
    lprintf("not in VM heap (external)\n");
  }

# if TARGET_OS_VERSION == MACOSX_VERSION
  mach_vm_address_t region_addr = (mach_vm_address_t)addr;
  mach_vm_size_t region_size;
  vm_region_basic_info_data_64_t info;
  mach_msg_type_number_t count = VM_REGION_BASIC_INFO_COUNT_64;
  mach_port_t obj_name;
  kern_return_t kr = mach_vm_region(mach_task_self(), &region_addr, &region_size,
      VM_REGION_BASIC_INFO_64, (vm_region_info_t)&info, &count, &obj_name);
  if (kr == KERN_SUCCESS) {
    lprintf("  Page protection: %c%c%c  (region 0x%llx-0x%llx)\n",
        info.protection & VM_PROT_READ    ? 'r' : '-',
        info.protection & VM_PROT_WRITE   ? 'w' : '-',
        info.protection & VM_PROT_EXECUTE ? 'x' : '-',
        (unsigned long long)region_addr,
        (unsigned long long)(region_addr + region_size));
  } else {
    lprintf("  Page protection: unmapped (mach_vm_region failed)\n");
  }
# endif

  Dl_info dl;
  if (dladdr((void*)addr, &dl) && dl.dli_fname) {
    lprintf("  dladdr: %s", dl.dli_fname);
    if (dl.dli_sname)
      lprintf(" (%s + 0x%lx)", dl.dli_sname,
              (unsigned long)((char*)addr - (char*)dl.dli_saddr));
    lprintf("\n");
  } else {
    lprintf("  dladdr: (no matching library)\n");
  }
}


static void print_pc_info() {
  char* pc = InterruptedContext::the_interrupted_context->pc();
  lprintf("\nPC 0x%lx:\n", (unsigned long)pc);

  Dl_info dl;
  if (dladdr((void*)pc, &dl) && dl.dli_fname) {
    lprintf("  Library: %s\n", dl.dli_fname);
    if (dl.dli_sname)
      lprintf("  Symbol: %s + 0x%lx\n", dl.dli_sname,
              (unsigned long)((char*)pc - (char*)dl.dli_saddr));
  }
}


static void print_heap_layout() {
  if (!Memory) return;

  lprintf("\nHeap layout:\n");
  if (GCInProgress || ScavengeInProgress) {
    lprintf("  (skipped: GC/scavenge in progress, metadata may be inconsistent)\n");
    return;
  }
  if (Memory->new_gen) Memory->new_gen->print();
  if (Memory->old_gen) Memory->old_gen->print();
}


// Write directly to a fd. Retries on EINTR / partial writes so signals
// don't drop bytes. For stderr, callers should keep individual writes
// < PIPE_BUF (512 on macOS) for atomicity vs. concurrent writers; regular
// files are not subject to that limit.
// -- dmu & claude, 5/26
static void write_fd(int fd, const char* s, size_t n) {
  if (fd < 0) return;
  while (n > 0) {
    ssize_t w = write(fd, s, n);
    if (w < 0) { if (errno == EINTR) continue; break; }
    if (w == 0) break;
    s += w; n -= (size_t)w;
  }
}
static void write_stderr(const char* s, size_t n) {
  write_fd(STDERR_FILENO, s, n);
}

// Crash-trace file fd, set by print_native_backtrace_hybrid for the duration
// of a single trace. -1 means no file sink (writes go only to stderr).
// -- dmu & claude, 5/26
static int trace_file_fd = -1;

// Tee one logical line (always ends with '\n') to stderr and the trace file
// (if open). Stderr write is one write() call <= 480 bytes so the kernel
// won't split it against concurrent writers (macOS PIPE_BUF == 512).
// -- dmu & claude, 5/26
static void writeln_tee(const char* s) {
  char buf[480];
  size_t n = strlen(s);
  if (n > sizeof(buf) - 2) n = sizeof(buf) - 2;
  memcpy(buf, s, n);
  buf[n++] = '\n';
  write_stderr(buf, n);
  write_fd(trace_file_fd, buf, n);
}

// Tee a line built from three parts (prefix + name + suffix) — used for the
// demangled-line case to avoid extra string copies.
// -- dmu & claude, 5/26
static void writeln_tee3(const char* a, size_t alen,
                         const char* b, size_t blen,
                         const char* c, size_t clen) {
  char buf[480];
  size_t cap = sizeof(buf) - 1; // leave room for '\n'
  size_t off = 0;
  size_t take = alen < cap - off ? alen : cap - off;
  memcpy(buf + off, a, take); off += take;
  take = blen < cap - off ? blen : cap - off;
  memcpy(buf + off, b, take); off += take;
  take = clen < cap - off ? clen : cap - off;
  memcpy(buf + off, c, take); off += take;
  buf[off++] = '\n';
  write_stderr(buf, off);
  write_fd(trace_file_fd, buf, off);
}

// Parse one line of backtrace_symbols output and tee a demangled version
// to stderr + crash-trace file.
// Darwin format: "<frame#> <binary> <addr> <_mangled> + <offset>"
// -- dmu & claude, 5/26
static void emit_demangled_line(const char* line) {
  const char* z = strstr(line, " __Z");
  int skip = 2;
  if (!z) { z = strstr(line, " _Z"); skip = 1; }
  if (!z) { writeln_tee(line); return; }
  const char* mangled = z + skip;
  const char* end = mangled;
  while (*end && *end != ' ') ++end;
  size_t mlen = end - mangled;
  char mcopy[256];
  if (mlen >= sizeof(mcopy)) { writeln_tee(line); return; }
  memcpy(mcopy, mangled, mlen);
  mcopy[mlen] = '\0';

  int status = 0;
  char* demangled = abi::__cxa_demangle(mcopy, nullptr, nullptr, &status);
  if (status == 0 && demangled) {
    size_t prefix_len = (z + 1) - line;
    writeln_tee3(line, prefix_len,
                 demangled, strlen(demangled),
                 end, strlen(end));
    free(demangled);
  } else {
    char tail[320];
    int n = snprintf(tail, sizeof(tail), "   [demangle status=%d, token=\"%s\"]",
                     status, mcopy);
    writeln_tee3(line, strlen(line), tail, n > 0 ? (size_t)n : 0, "", 0);
  }
}

// Process-wide lock so two concurrent fatals (e.g. another thread also
// crashing) don't interleave their traces. Uses a CAS spinlock instead of
// pthread_mutex because this can be called from a signal handler where
// pthread_mutex_lock is technically unsafe.
static volatile int trace_lock = 0;

static void acquire_trace_lock() {
  // Up to ~1s of spinning, then proceed without the lock. We never want a
  // fatal handler to deadlock here.
  for (int i = 0; i < 10000; ++i) {
    if (__sync_bool_compare_and_swap(&trace_lock, 0, 1)) return;
    usleep(100);
  }
}
static void release_trace_lock() {
  __sync_bool_compare_and_swap(&trace_lock, 1, 0);
}


void print_native_backtrace_hybrid() {
  acquire_trace_lock();
  fflush(stderr);

  // Open a dedicated crash-trace file. Stderr is best-effort (the Xcode
  // debugger console silently drops bytes once its buffer fills); the file
  // is the source of truth.
  char trace_path[64];
  snprintf(trace_path, sizeof(trace_path),
           "/tmp/Self.crash_trace.%d.log", (int)getpid());
  trace_file_fd = open(trace_path, O_WRONLY | O_CREAT | O_TRUNC, 0644);

  // Tell stderr where the durable copy lives, before printing the trace.
  char ptr_msg[128];
  snprintf(ptr_msg, sizeof(ptr_msg),
           "(full native trace also written to %s)", trace_path);
  writeln_tee("");
  writeln_tee(ptr_msg);

  void* frames[64];
  int n = backtrace(frames, 64);

  writeln_tee("==================================================================");
  writeln_tee("  NATIVE STACK TRACE -- RAW (async-signal-safe, always mangled)");
  writeln_tee("==================================================================");
  writeln_tee("");
  // We use backtrace_symbols (not _fd) so each frame can be teed to both
  // stderr and the trace file. backtrace_symbols allocates with malloc and
  // is not async-signal-safe, but if heap is corrupt we still got the rest
  // of the trace context above (the raw banner) before this point.
  char** symbols = backtrace_symbols(frames, n);
  if (symbols) {
    for (int i = 0; i < n; ++i) writeln_tee(symbols[i]);
  } else {
    // Fallback: backtrace_symbols failed. Use the async-signal-safe fd
    // variant so we still get *something* on stderr (won't reach the file).
    backtrace_symbols_fd(frames, n, STDERR_FILENO);
  }

  writeln_tee("");
  writeln_tee("==================================================================");
  writeln_tee("  NATIVE STACK TRACE -- DEMANGLED (best-effort, may fail on heap bugs)");
  writeln_tee("==================================================================");
  writeln_tee("");
  if (symbols) {
    for (int i = 0; i < n; ++i) emit_demangled_line(symbols[i]);
    free(symbols);
  } else {
    writeln_tee("  (backtrace_symbols failed)");
  }
  writeln_tee("==================================================================");
  writeln_tee(ptr_msg);
  writeln_tee("");

  // Flush + close before returning. fatal_handler is about to call
  // simulate_fatal_signal / OS::terminate; without fsync, buffered bytes
  // could be lost.
  if (trace_file_fd >= 0) {
    fsync(trace_file_fd);
    close(trace_file_fd);
    trace_file_fd = -1;
  }

  release_trace_lock();
}


void print_crash_diagnostics(int sig, char* addr, int32 code) {
  lprintf("\n--- Crash Diagnostics ---\n");

  print_platform_info();
  print_vm_info();
  print_signal_info(sig, code);
  print_activity_state();
  print_address_info(addr);
  print_pc_info();
  print_heap_layout();

  lprintf("\nRegisters:\n");
  InterruptedContext::print_registers();

  print_native_backtrace_hybrid();

  lprintf("--------------------------\n");
}
