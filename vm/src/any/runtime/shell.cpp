/* Sun-$Revision: 30.22 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "unixPrims.hh"
# include "allocation.hh"
# include "codeSlotsMap.hh"
# include "dynLink.hh"
# include "expr.hh"
# include "files.hh"
# include "fprofiler.hh"
# include "hprofiler.hh"
# include "init.hh"
# include "interpreter.hh"
# include "interruptedCtx.hh"
# include "itimer.hh"
# include "mapTable.hh"
# include "monitor.hh"
# include "monitorHooks.hh"
# include "nlrSupport.hh"
# include "os_includes.hh"
# include "parser.hh"
# include "process.hh"
# include "recompile.hh"
# include "scanner.hh"
# include "shell.hh"
# include "sig.hh"
# include "simpleLookup_inline.hh"
# include "vmStrings.hh"

oop evalExpressions(Scanner* scanner) {
  // evaluate expressions until scanner is at EOF or an error occurs
  oop res = NULL;
  fint line, len;
  const char* source;
  while (!res->is_mark() && !scanner->is_done()) {
    // This resource mark must be inside the loop otherwise long files can 
    // cause the resource area to become huge -miw, 12/5/94
    ResourceMark rm;
    Parser parser(scanner, false);
    scanner->commentList = new TokenList(100);
    Expr* e = parser.readExpr(line, source, len);
    if (e &&
        (AddFileAnnotationsToSlots ||
         (ConvertCommentsIntoAnnotations && 
          scanner->commentList->length() > 0))
      ) {
      e->addCommentAnnotations(scanner);
    }
    
    if (e) {
      preservedObj x(e);                // for GenByteCodes
      if (ScavengeInPrimitives && Memory->needs_scavenge()) {
        Memory->scavenge();
      }
      
      ByteCode b(true);
      slotsOop evalMethod;
      if (! e->GenByteCodes(&b, 0) 
      ||  NLRSupport::have_NLR_through_C() )
        res = badOop;
      else if ( !b.Finish(scanner->fileName(), line, source, len)) {
        e->ErrorMessage(b.errorMessage);
        res = badOop;
      }
      else
        evalMethod = create_outerMethod(EMPTY, &b);
      if (!res->is_mark()) {
        res = currentProcess->runDoItMethod(Memory->lobbyObj, evalMethod);
        if (NLRSupport::have_NLR_through_C()) break;             // let NLR go through
      }
    } else if (!parser.noParseError()) {
      res = badOop;
    } else {
      // empty line
    }
    // Tokens are allocated in the resource area, which is about to be freed.
    // Reset the list so that we don't attempt to use any next time.
    scanner->resetTokenList();
  }
  
  if (currentProcess->hadStackOverflow()) {
    res = ErrorCodes::vmString_prim_error(STACKOVERFLOWERROR);
  }
  return res;
}

oop eval(const char* expression, const char* fn) {
  StringScanner scanner(expression, strlen(expression), fn);
  return evalExpressions(&scanner);
}

static char* spyLogFile= NULL;
char* startUpSelfFile= NULL;

const char **prog_argv;
int    prog_argc;



static void processArguments(int argc, const char *argv[]) {

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
# else
  Interpret = true; // no compiler!
# endif
  

  // Some implementations of getopt (I'm looking at you, GNU) rearrange argv for their own purposes.
  // So we give getopt a copy of argv so we can later expose the real original argv to 
  // Self via _CommandLine
  // rca 2 Feb 2014
  char **copy_of_argv = (char **) malloc( sizeof(char *) * argc );
  memcpy(copy_of_argv, argv, sizeof(char *) * argc);
  
  char c;
  fint opt_i;
  OS::opterr= 0; // disable printed warning about unrecognized options
  while(opt_i= OS::optind,
        (c = OS::getopt(argc, (char* const*)copy_of_argv, "Ff:hl:prtcs:woa")) != (char)-1) {
    if (strlen(argv[opt_i]) != 2) continue; // ignore multi-character options
    switch(c) {
    case 'F':
      okToUseCodeFromSnapshot= false;
      lprintf("not okToUseCodeFromSnapshot\n");
      break;
    case 'f':
      // file to read after snapshot has been loaded (for debugging)
      startUpSelfFile= OS::optarg;
      break;
    case 'h': // help
      lprintf("%s: usage: %s [-f filename] [-h] [-s snapshot] ...\n", argv[0], argv[0]);
      lprintf("Options:\n");
      lprintf("  -f filename\tReads filename (Self source) immediately after startup\n");
      lprintf("  -h\t\tPrints this message\n");
      lprintf("  -p\t\tDon't do `snapshotAction postRead' after reading snapshot\n");
      lprintf("  -s snapshot\tReads initial world from snapshot\n");
      lprintf("  -w\tSuppress warnings about optimized code being discarded\n");
      lprintf("For debugging use only:\n");
      lprintf("  -F\t\tDiscards saved code from snapshot\n");
      lprintf("  -l logfile\twrite spy log to logfile\n");
      lprintf("  -r\t\tDisable real timer\n");
      lprintf("  -t\t\tDisable all timers\n");
      lprintf("  -c\t\tUse real timer instead of CPU timer (for OS X)\n");
      lprintf("  -o\t\tOversample the timers (Run them 10x faster to flush out bugs)\n");
      lprintf("  -a\t\tTest the Assembler (added for Intel)n");
      lprintf("Other command line switches may be interpreted by the Self world\n");
      ::exit(0);
      break;
     case 'r':
      // dont use real timer (useful for gdb)
      IntervalTimer::dont_use_real_timer = true;
      lprintf("Setting IntervalTimer::dont_use_real_timer to %s\n",
              IntervalTimer::dont_use_real_timer ? "true" : "false");
      break;
     case 't':
      // dont use any timer (needed for tracing)
      IntervalTimer::dont_use_any_timer = true;
      lprintf("Setting IntervalTimer::dont_use_any_timer to %s\n",
              IntervalTimer::dont_use_any_timer ? "true" : "false");
      break;
     case 'c':
      // dont use CPU timer (needed for X under OS X)
      // sometimes, process dies with SIGVTALRM when you start X -- dmu 8/1
      // Put in inversion for experimentation.
      IntervalTimer::use_real_instead_of_cpu_timer = !IntervalTimer::use_real_instead_of_cpu_timer;
      lprintf("Setting IntervalTimer::use_real_instead_of_cpu_timer to %s\n",
              IntervalTimer::use_real_instead_of_cpu_timer ? "true" : "false");
      break;
     case 'l':
      // write spy log to a log file 
      spyLogFile= OS::optarg;
      break;
     case 's':
      // default world
      WorldName= OS::optarg;
      break;
     case 'p':
      // turn off post-read snapshot evaluation
      postReadSnapshot= false;
      break;
     case 'w':
      noCodeWarnings= true;
      break;
     case 'o':
      IntervalTimer::oversample_rate = 10;
      break;
     case 'a':
      Assembler::do_the_tests = true;
      break;
     }
  }
  // save remaining args for Self-level access
  prog_argc= argc;
  prog_argv= argv;
  
  // clean up argv copy
  free(copy_of_argv);
}

void abortSelf() {
  // ^C was hit at the prompt or while _RunScripting
  lprintf("\n*user abort*\n");
  if (currentProcess->inSelf())
    currentProcess->stack()->print();
  VMScanner->reset();
  VMScanner->discardInput();
  Indent = 0;
  if (currentProcess->nesting > 0) currentProcess->abort();
}


void run_the_VM() {
  assert(! bootstrapping, "don't get screwed again by this");
  Memory->scavenge();
  SignalInterface::initialize();
  initHProfiler();
  
  IntervalTimer::start_all();

  ResourceMark mark;

  InteractiveScanner scanner;
  VMScanner = &scanner;

  resetTerminal();

  if (startUpSelfFile) { 
    ResourceMark m;
    FileScanner scnr(startUpSelfFile);
    if (scnr.fileError) {
      fatalNoMenu1("Couldn't read file %s!\n\n", startUpSelfFile);
    } else {
      lprintf("Reading %s...", scnr.fileName());
      (void) evalExpressions(&scnr);
      lprintf("done\n");
    }
  }
  
  // After reading a snapshot we need to evaluate the snapshot actions.
  if (postReadSnapshot) {
    postReadSnapshot = false;
    eval("snapshotAction postRead", "<postRead Snapshot>");
  }

  // The read-eval-print loop
  for (;;) {
    ResourceMark m;
    fint line, len;
    const char* source = NULL;
    Parser parser(VMScanner, false);
    resetTerminal();
    VMScanner->start_line("VM# ");
    processes->idle = true;
    if (VMScanner->is_done())
      break;
    processes->idle = false;
   
    Expr* e = parser.readExpr(line, source, len);  // dont fail
    if (e) {
      preservedObj x(e);
      oop res = e->Eval(true, false, true);
      assert(currentProcess->isClean(), "vm process should be clean now");
      if (res == badOop) {
        VMScanner->reset();
        clearerr(stdin);          // don't get hung on ^D
      }
    }
    if (Memory->needs_scavenge()) Memory->scavenge();
  }

  lprintf("\n");
# if TARGET_IS_PROFILED
    lprintf("Writing profile statistics...\n");
# endif
  clearerr(stdin);
  OS::handle_suspend_and_resume(true);            // make sure stdin is in normal mode
  OS::terminate(0);
}


# if TARGET_OS_FAMLIY == UNIX_FAMILY
extern "C" void __main() {}     // so we can link with the standard linker
# endif


# if COCOA_EXP
#   define main old_main  // the "real" main is in main.m
# endif

int main(int argc, char *argv[]) {
  // On Mac, the first printf does an InstallConsole which sets AE handlers
  // so init os first to clear SIOUXSettings.standalone to fix this
  OS::init();
  OS::set_args(argc, argv);

  /* Do not buffer stdin. If stdin is buffered, input will disappear at the
     Self level. The reason is that the VM will use fread(stdin, ...) which 
     does a read-ahead on the descriptor for stdin (0). Self, however, reads 
     directly from the descriptor, so any characters that were read ahead 
     in the fread(stdin, ...) call will not show up at the Self level. */

  OS::do_not_buffer(stdin);

  /* Set the maximum core size to be large, so that core dumps are produced
     when Self crashes.  (Under Mac OS X, the default core size is 0, so
     core dumps weren't produced. -mabdelmalek 4/28/03 */
  OS::enable_core_dumps();

  processArguments(argc, (const char **)argv);
  
  TrackCHeapInMonitor::reset();
  init_globals();
  set_flags_for_platform();
  bootstrapping = false; 

# ifdef DYNLINK_SUPPORTED
    initDynLinker(argc, (const char **)argv);
# endif

  if (spyLogFile) TheSpy->activate(spyLogFile);

# ifdef EXPERIMENT_WITH_APPLE_EVENTS
  extern void handle_dropped_snapshot();
  handle_dropped_snapshot();
# endif  
  
  vmProcess = new Process(NULL, SelfStackLimit);
  processes->startVMProcess();
  ShouldNotReachHere();
  return 0;
}
