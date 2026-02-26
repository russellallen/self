# if defined(__i386__) || defined(__x86_64__)
/* Sun-$Revision: 1.3 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
{
  "NonLifoAbort", fntype(&NLRSupport::non_lifo_abort),
  InternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_CANABORT,
  "The Mac cannot use a real trap, so uses this primitive instead "
  "when trying to run a non-lifo block."
},
# endif
# endif // defined(__i386__) || defined(__x86_64__)
