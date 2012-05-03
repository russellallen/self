/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "interruptedCtx.hh"
# pragma implementation "asserts.hh"
# pragma implementation "error.hh"

# include "_interruptedCtx.cpp.incl"


static int32 abortLevel = 0;

class InterruptedContext AbortContext;


void InterruptedContext::fatal_menu() {
  // this really belongs in lprintf_fatal but the declarations are a mess
  lprintf("\nVM Version: %d.%d.%d, %s\n", 
          Memory ? (void*)Memory->major_version     : 0, 
          Memory ? (void*)Memory->minor_version     : 0,
          Memory ? (void*)Memory->snapshot_version  : 0,
          vmDate);
  // block all interrupts (e.g. timers)
  continuePC = NULL;
  SignalBlocker* sb = new SignalBlocker(SignalBlocker::block_signals_self_uses);
  
  OS::handle_suspend_and_resume(true);            // set stdin to normal mode

  static char buf[BUFSIZ];
  setbuf(stdin, buf); // Needed by Mac to get input working for menu


  PrintVMMessages = true;
  if (++abortLevel > 3) {
    lprintf("\nError while handling error - hit return to exit >");
    getchar();
    OS::terminate(1);
  }
  int32 iter = 0;
  for (;;) {
    lprintf("\nSelf process %ld on %s has crashed.\nDo you want to:\n",
           long(getpid()), OS::get_host_name());
    lprintf("   1) Quit Self (optionally attempting to write a snapshot)\n");
    lprintf("   2) Try to print the Self stack\n");
    lprintf("   3) Try to return to the Self prompt\n");
    lprintf("   4) Force a core dump\n");
    lprintf("   5) Print the interrupted context registers\n");
    lprintf("Your choice: ");
    char c[255];
    fgets(c, sizeof(c), stdin);

    if (feof(stdin) || iter > 10) {
      print_stack();
      lprintf("\nAborting because of eof(stdin).\n");
      delete sb;
      OS::core_dump();
    }
    switch (c[0]) {
     case '1':
      quit_self();
     case '2':
      print_stack();
      break;
     case '3':
      return_to_prompt(sb);
      ShouldNotReachHere();
     case '4':
      delete sb;
      OS::core_dump();
      break;
     case '5':
      print_registers();
      break;
     default:
      lprintf("\nIllegal choice.\n");
      iter++;
    }
  }
}

void InterruptedContext::quit_self() {
  lprintf("Enter snapshot name (hit return to omit snapshot) > ");
  char c[255];
  c[0] = '\0';
  fgets(c, sizeof(c), stdin);
  if (c[0] == '\n') {
    lprintf("No snapshot specified, will skip this step\n");
  }
  else {
    lprintf("Attempting to write a snapshot to `%s'...", c);
    Memory->write_snapshot(c, NULL, NULL, &Memory->current_sizes);
    lprintf("done.\n");
    lprintf("Note that it cannot be guaranteed that the snapshot is good.\n");
    lprintf("Even if it appears to start without problems, it is prudent\n");
    lprintf("to verify the state of the system after startup using the\n");
    lprintf("_Verify primitive.  If this reports problems, it is not\n");
    lprintf("wise to continue using the snapshot.\n");
    lprintf("Hit return to exit > ");
    fgets(c, 255, stdin);
  }
  currentProcess = NULL;            // to avoid a silly assertion failure 
  OS::terminate(-1);
}


void InterruptedContext::print_stack() {
  FlagSetting wm(WizardMode, true);
  FlagSettingInt spl(StackPrintLimit, 1000);
  if (abortLevel == 1) {
    // try to print the C stack
    AbortContext.print_C_stack();
  }
  if (currentProcess->inSelf()) {
    char* pc = the_interrupted_context ? AbortContext.pc() : NULL;
    frame* vmfr = NULL;
    char* oldPC = NULL;
    if (pc && Memory->code->contains(pc)) {
      // patch stack so that last Self frame is displayed
      vmfr = currentProcess->stack()->first_VM_frame();
      oldPC = vmfr->real_return_addr();
      vmfr->set_real_return_addr(pc);
    }
    currentProcess->stack()->print();
    if (vmfr) vmfr->set_real_return_addr(oldPC);  // restore state
  } else {
    lprintf("\nNo Self method is running.\n");
  }
}


void InterruptedContext::print_C_stack() {
  // print C stack of interrupted process
  frame* f;
  FlushRegisterWindows();
  if (sp()) {
    f = (frame*)sp();
    lprintf("Interrupt at PC %#lx\n", (pc()));
  } else {
    f = currentFrame();
  }
  while (f && !f->is_compiled_self_frame()) {
    lprintf("C frame %#lx  (retPC %#lx)\n", f,
           (long unsigned)(f->real_return_addr()));
    f = f->sender();
  }
}


void InterruptedContext::return_to_prompt(SignalBlocker* sb) {
  if (SignalInterface::is_initializing() || !vmProcess->inSelf()) {
    lprintf("\nCannot return to the prompt - Self is not properly initialized\n");
    return;
  }
  delete sb;
  abortLevel = 0;
  AbortContext.invalidate();
  // Don't bother to zap blocks on stack (too complicated)
  processes->discardAll();
  ShouldNotReachHere();
}


void InterruptedContext::continue_abort_at(char *addr, bool addDummyFrame) {
  // continue abort handling code on normal stack; resume at addr
  // create a dummy frame for the last frame peice so that Self stack trace
  // is complete
  InterruptedContext::the_interrupted_context->must_be_in_self_thread();
  

  if (addDummyFrame) {
    the_interrupted_context->set_sp(
      the_interrupted_context->sp()
        ->make_full_frame_after_trap(the_interrupted_context->pc()));
  }
  // make sure set_continuation_address works
  the_interrupted_context->set_next_pc(the_interrupted_context->pc() + 4);
  set_continuation_address(addr, true, true);
}



volatile void fatal_handler() {
  error_breakpoint();
  SignalInterface::simulate_fatal_signal();
  OS::terminate(-1);
}


void InterruptedContext::set(self_sig_context_t* scp_arg) {
  must_be_in_self_thread();
  if (scp_arg && is_set())
     fatal2("should not be set already, possibly signals were not blocked,\n"
            "see comment about ApplicationEnhancer in sig_unix.hh,\n"
            "currentTimerSignal = %d, currentNonTimerSignal = %d",
            SignalInterface::currentTimerSignal,
            SignalInterface::currentNonTimerSignal);
  scp = scp_arg ? scp_arg : &dummy_scp;
}


void InterruptedContext::invalidate() {
  // mark as invalid
  set();
}


char* InterruptedContext::pc() { return *pc_addr(); }
void  InterruptedContext::set_pc(void *pc) { *pc_addr() = (char*)pc; }


frame* InterruptedContext::sp() { 
  return !is_set() ? NULL : (frame*) *sp_addr(); } 
  
void InterruptedContext::set_sp(void* sp) { *sp_addr() = (int) sp; }


int InterruptedContext::code_at_pc() {
  return ((int*) pc())[0];
}


class InterruptedContext* InterruptedContext::the_interrupted_context;


void abort_init() {
  InterruptedContext::the_interrupted_context = new InterruptedContext();
  InterruptedContext::the_interrupted_context->set_the_self_thread();
  InterruptedContext::the_interrupted_context->invalidate();
}  
