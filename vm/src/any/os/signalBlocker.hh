/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



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
  
# include "_signalBlocker_pd.hh.incl"  
};

