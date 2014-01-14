# ifdef __ppc__
/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

// This file is INCLUDED into the middle of the RegisterLocator class.


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


 private:
  oop*  _addresses[NumLocalNonVolRegisters];
  oop** addresses() { return _addresses; }
  void update_addresses_from_callee_of(frame* f,  fint callee_save_count);
  bool update_addresses_from_InterruptedContext(frame* f, InterruptedContext*);

  
 public:
  static RegisterLocator* for_NonVolSaving_frame(frame*);
# endif // __ppc__
