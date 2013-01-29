# ifdef __ppc__
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

{
  "NonLifoAbort", fntype(&NLRSupport::non_lifo_abort),
  InternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_CANABORT,
  "The PPC cannot use a real trap, so uses this primitive instead "
  "when trying to run a non-lifo block."
},
# endif // __ppc__
