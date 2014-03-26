#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "sig.hh"




class SignalBlocker {
 public:
  enum SignalBlockerType {
    block_all,
    allow_user_int,
    block_signals_self_uses
  };
  
 public:
   SignalBlocker(SignalBlockerType sbt = block_all);
  ~SignalBlocker();
 
//# if TARGET_OS_FAMLIY == UNIX_FAMILY 
# include "signalBlocker_unix.hh"
//# endif
};

