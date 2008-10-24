/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# include "_interruptedCtx_unix.cpp.incl"

# pragma implementation "interruptedCtx_unix.hh"


self_sig_context_t InterruptedContext::dummy_scp;




bool InterruptedContext::in_read_trap()  { return  in_system_trap()  &&  system_trap() == SYS_read;  }
bool InterruptedContext::in_write_trap() { return  in_system_trap()  &&  system_trap() == SYS_write; }
