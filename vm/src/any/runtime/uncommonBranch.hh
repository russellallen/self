/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// run-time system code to handle uncommon branches and other uncommon traps

# if defined(SIC_COMPILER)

  // instp must point to an uncommon trap (unimp n) for the next two methods
  bool shouldRestartSend(int32* instp); // should the trapping send be restarted or not?
  unsigned trapCount(int32* instp);     // how many times was trap taken?
  extern "C" char* recompileUncommon(char* pc);

# endif // SIC_COMPILER

// returns true if the trap was an uncommon branch
bool handleUncommonTrap();


bool isMapLoad(int* instp);  // is instr a map load?
void handleMapLoadTrap(InterruptedContext* c);
