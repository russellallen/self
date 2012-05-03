/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

/* control stuff for instruction tracing with shade */
/* C not C++ for compatibility with shade */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# define NTRBUF 50          /* size of trace buffer */
# define MAGIC  123456789

typedef enum TraceFun {
  TraceOff, TraceOn, TraceClear, TracePrint, TraceFinish
  } TraceFun;

typedef class TraceControl {
 public:
  int magic;                /* must have value MAGIC */
  int ack;                  /* set to 1 by tracer when data received */
  TraceFun fn;              /* 1 = switch tracing on, 0 = switch off */
  int niranges;             /* # of address ranges to trace (instructions) */
  char* irange[50*3];       /* 3 entries per address range: */
                            /* 1. = name, 2./3. = [start..end) */
                            /* name == NULL means dont trace this range */
  int ndranges;             /* # of data address ranges */
  char* drange[50*3];       /* 3 entries per address range: */
                            /* 1. = name, 2./3. = [start..end) */
} TraceControl;

  /* encoding for TypeTestStart */
# define tt_immediateOnlyMask    (1 << 9)
# define tt_prologueMask         (1 << 8)
# define tt_arityMask           ((1 << 7) - 1)

# if defined(SIC_COMPILER) && !defined(NOASM)
  oop itrace_prim(oop onoff, oop mode);
  void itrace(bool onoff);
# endif
