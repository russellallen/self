Native 3
========

Description
-----------

Development notes on the third attempt at Native running on the Self VM.

Differences from the second attempt are:

- we pass oops into the native code without automatic conversion, and provide helper native functions to enable the native code to convert if they want (ie no more NativeHelperArray).

- by convention, a vector of native primitives and a vector of useful core objects are passed in as arguments.

Differences from the first attempt are:

- by mallocing outside the gc and linking from a fctProxy, hopefully we avoid having to re-mark the memory as executable every time we call it (ie no need for kernel call)

- we pass oops into the native code not char*/byteVectors.

- we allow any oop to be passed in.

- we return a result (an oop)

Primitives:

(fctProxy) _AllocateFromByteVector: (byteVector) -> (fctProxy)
(fctProxy) _Run(With:With:With:With: oop) IfDead: blk -> (oop)
(fctProxy) _FreeMemory -> (fctProxy)

fctProxy must be changed to keep reference to size so that free can work.

Within _RunWith:

Runs code with oops as args. The type signature of the C function is:

   oop fct(oop this, oop arg1 ... oop argN, void *useful_array_of_functions, void *FH)

this is the oop of the fctProxy.
useful_array_of_functions is an array of pointers to useful C functions.
FH is the failure handler.

These are (The standard compiling framework on the Self side defines a bunch of nice macros to help)

  BV_CHAR char *byteVectorOop_to_char_ptr(oop, bvOop)

  IS_SMI  bool  is_smi(oop)

  FAILURE void  failure(void* FH, int errno)
      // errno is VMStringsIndex

Following conversion functions are planned:

  char *stringOop_to_char_ptr(oop stringOop)
  oop  *vectorOop_to_oop_ptr(oop vectorOop)
  void *proxyOop_to_void_ptr(oop proxyOop)

  bool is_float(oop)
  bool is_etc

  MAX_SMI
  MIN_SMI


Progress
--------

2015-11-12     Created this readme file.
2015-11-13     Created _AllocateFromByteVector: primitive.
2017-06-14     Start of native3
2017-07-29     Cleanup, successful build
2017-08-01     Initial integration of FH
2017-08-03     Added smi code

TO_DO
=====

* Handle floats
