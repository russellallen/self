/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef SIC_COMPILER

# pragma implementation "tracing.hh"
# include "_tracing.cpp.incl"

  TraceControl trc;

  static bool have_ranges = false;

  static void all_mode() {
    // trace all instructions
    trc.niranges = 1;
    trc.irange[0] = (char*) "all";
    trc.irange[1] = 0;
    trc.irange[2] = (char*) -1;
  }
  
  static void self_mode() {
    // trace only Self & stubs
    trc.niranges = 0;

    // turn off tracing everywhere
    trc.irange[trc.niranges * 3    ] = 0;
    trc.irange[trc.niranges * 3 + 1] = 0;
    trc.irange[trc.niranges * 3 + 2] = (char*)-1;
    trc.niranges++;

    // nmethods
    trc.irange[trc.niranges * 3    ] = (char*) "Self";
    trc.irange[trc.niranges * 3 + 1] = Memory->code->iZone->startAddr();
    trc.irange[trc.niranges * 3 + 2] = Memory->code->iZone->  endAddr();
    trc.niranges++;

    // PICs, count stubs
    trc.irange[trc.niranges * 3    ] = (char*) "stubs";
    trc.irange[trc.niranges * 3 + 1] = Memory->code->stubs->zone()->startAddr();
    trc.irange[trc.niranges * 3 + 2] = Memory->code->stubs->zone()->  endAddr();
    trc.niranges++;
  }
  
#  ifndef NOASM

  oop itrace_prim(oop fncode, oop mode) {
    ResourceMark rm;
    if (!fncode->is_smi())
      return ErrorCodes::general_prim_error("fn code isn't a smi");
    smi fn = smiOop(fncode)->value();
    if (fn >= 0 && fn <= TraceFinish) {
      // ok
    } else {
      return ErrorCodes::general_prim_error("fn code has bad value");
    }

    switch (fn) {
     case TracePrint:
      // "mode" really is a string to print
      if (mode->is_byteVector()) {
        trc.irange[0] = byteVectorOop(mode)->copy_null_terminated();
      } else {
        return ErrorCodes::general_prim_error("arg must be a byte vector");
      }
      break;
     default:
      if (mode == as_smiOop(0)) {
        all_mode();
      } else if (mode == as_smiOop(1)) {
        self_mode();
      } else {
        return ErrorCodes::general_prim_error("arg must be 0 or 1");
      }
    }
    itrace(fn);
    return fncode;
  }

  void itrace(fint fn) {
    trc.magic = MAGIC;
    trc.fn = TraceFun(fn);
    trc.ndranges = 0;

    if (!have_ranges && fn == TraceOn) {
      // old space
      trc.drange[trc.ndranges * 3    ] = (char*) "old space";
      trc.drange[trc.ndranges * 3 + 1] = Memory->old_gen->low_boundary;
      trc.drange[trc.ndranges * 3 + 2] = Memory->old_gen->high_boundary;
      trc.ndranges++;

      // survivor spaces
      trc.drange[trc.ndranges * 3    ] = (char*) "from space";
      trc.drange[trc.ndranges * 3 + 1] = Memory->new_gen->from_space->spaceStart();
      trc.drange[trc.ndranges * 3 + 2] = Memory->new_gen->from_space->spaceEnd();
      trc.ndranges++;
      trc.drange[trc.ndranges * 3    ] = (char*) "to space";
      trc.drange[trc.ndranges * 3 + 1] = Memory->new_gen->to_space->spaceStart();
      trc.drange[trc.ndranges * 3 + 2] = Memory->new_gen->to_space->spaceEnd();
      trc.ndranges++;

      // eden
      trc.drange[trc.ndranges * 3    ] = (char*) "eden space";
      trc.drange[trc.ndranges * 3 + 1] = Memory->new_gen->eden_space->spaceStart();
      trc.drange[trc.ndranges * 3 + 2] = Memory->new_gen->eden_space->spaceEnd();
      trc.ndranges++;
      have_ranges = true;
    }
    
    // send data to analyzer and wait for ack
    trc.ack = 0;
    for (fint i = 0; !trc.ack && i < 2 * NTRBUF; i++) {
# if TARGET_ARCH == SPARC_ARCH
      asm volatile ("taddcctv %0, %%g0, %%g0"
                    : /* no output */
                    : "r" (&trc)
                    : "memory", "cc");
# else
      fatal("shade tracing unimplemented on this platform");
# endif
      currentSPLimit();    // gcc bug - ignores "memory" in asm directive (2.3.3)
    }
    if (!trc.ack) {
      error("didn't get any ACK from analyzer - no analyzer running?");
    }
  }

#  endif
# endif
