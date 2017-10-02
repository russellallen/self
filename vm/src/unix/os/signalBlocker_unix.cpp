/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "signalBlocker.hh"

SignalBlocker::SignalBlocker(SignalBlockerType sbt) {
 
  sigset_t new_mask;
  
  switch ( sbt ) {
   case block_signals_self_uses:
    if (sigprocmask(SIG_BLOCK, &SignalInterface::sig_mask, &saved_mask))
      perror("sigprocmask");
    break;
  
   default:
    if ( sigfillset(&new_mask) ) perror("sigemptyset");
    if ( sbt == allow_user_int ) {
      if (sigdelset(&new_mask, SIGINT)) perror("sigdelset");
    }
    if (sigprocmask(SIG_SETMASK, &new_mask, &saved_mask))
      perror("sigprocmask");
    break;
  }
}


SignalBlocker::~SignalBlocker() {
  if (sigprocmask(SIG_SETMASK, &saved_mask, NULL)) perror("sigprocmask");
}
