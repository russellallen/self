# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "allocation.hh"
# include "fields.hh"
# include "label_inline.hh"
# include "nmethod.hh"
# include "uncommonBranch.hh"


# if defined(SIC_COMPILER)

bool shouldRestartSend(int32* instp) {
  Unused(instp);
  fatal("unimp intel"); // do uncommon branches?
  return false;
}

unsigned trapCount(int32* instp) {
  Unused(instp);
  fatal("unimp intel");
  return 0;
}

void setTrapCount(int32* instp, unsigned count) {
  Unused(instp); Unused(count);
  fatal("unimp intel");
}

# endif


bool isMapLoad(int* instp) {
  fatal("Unused Intel");  return 0; 
}


void handleMapLoadTrap(InterruptedContext* c) {
  Unused(c);
  fatal("Unused Intel");
}
# endif // TARGET_ARCH == I386_ARCH
