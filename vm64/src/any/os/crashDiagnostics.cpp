/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "crashDiagnostics.hh"

# include "_crashDiagnostics.cpp.incl"

# include <execinfo.h>
# include <dlfcn.h>
# include <signal.h>
# include <sys/utsname.h>
# include <unistd.h>

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
  lprintf("VM: version %ld.%ld.%ld, built %s, ",
          Memory ? (long)Memory->major_version     : 0,
          Memory ? (long)Memory->minor_version     : 0,
          Memory ? (long)Memory->snapshot_version   : 0,
          vmDate);

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


static void print_native_stack_trace() {
  lprintf("\nNative stack trace:\n");
  void* frames[64];
  int n = backtrace(frames, 64);
  // Write directly to stderr to avoid malloc (backtrace_symbols is not signal-safe).
  // This bypasses lprintf, so the backtrace won't appear in the VM log file.
  backtrace_symbols_fd(frames, n, STDERR_FILENO);
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

  print_native_stack_trace();

  lprintf("--------------------------\n");
}
