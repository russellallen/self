/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "unixPrims.hh"
# include "fields.hh"
# include "files.hh"
# include "frame.hh"
# include "interruptedCtx.hh"
# include "label_inline.hh"
# include "monitorHooks.hh"
# include "nmethod_inline.hh"
# include "os_includes.hh"
# include "process.hh"
# include "scanner.hh"
# include "sig.hh"
# include "signalBlocker.hh"
# include "stack.hh"
# include "uncommonBranch.hh"
# include "universe.hh"
# include "vframe.hh"
# include "zone.hh"



self_sig_context_t InterruptedContext::dummy_scp;


void InterruptedContext::set_the_self_thread() { 
  the_self_thread = pthread_self(); }

bool InterruptedContext::is_in_self_thread() {
  return pthread_self() == the_self_thread;
}

void InterruptedContext::must_be_in_self_thread() {
  if (CheckAssertions && !is_in_self_thread())
    fatal("must_be_in_self_thread");
}



bool InterruptedContext::forwarded_to_self_thread(int sig) {
  if (is_in_self_thread()) return false;
  if (pthread_kill(the_self_thread, sig)) {
    perror("pthread_kill");
    fatal("forwarded_to_self_thread failed");
  }
  return true;
}


bool InterruptedContext::in_read_trap()  { return  in_system_trap()  &&  system_trap() == SYS_read;  }
bool InterruptedContext::in_write_trap() { return  in_system_trap()  &&  system_trap() == SYS_write; }
