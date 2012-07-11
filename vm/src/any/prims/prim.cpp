/* Sun-$Revision: 30.18 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "prim.hh"
# include "_prim.cpp.incl"



# ifndef DYNAMIC
// causes warnings on Tiger -- dmu 5/05
// # include "include_glue.hh"
# endif



# define WHAT_GLUE PROTOTYPES
  # ifdef stat_entries
          stat_glue
  # endif
  # ifdef termcap_entries
          termcap_glue
  # endif
  # ifdef transcendental_entries
          transcendental_glue
  # endif
  # ifdef xlib_entries
          xlib_glue
  # endif
# undef WHAT_GLUE

  

inline void PrimDesc::verify() {
  // static consistency checks for PrimDescs
  assert(!canAbortProcess() || canScavenge(),
         "inconsistent prim table entry: canAbortProcess implies canScavenge");
  assert(!canWalkStack()    || canScavenge(),
         "inconsistent prim table entry: canWalkStack implies canScavenge");
  assert(docString(), "forgot a boolean flag?");
}

fint PrimDesc::arg_count() {
  // For internal primitives, there is no way to know the number
  // of arguments (e.g. interruptCheck has none, not even a receiver),
  // so return -1 for them (see frame::outgoing_arg_count).
  // I am assuming we never need to restart a send to an internal primitive,
  // seems like a safe bet to me.
  // -- dmu 2/03
  return _type == InternalPrimitive  ?  -1
                                     : str_arg_count(_name);
}


/* The following 3 macros define common settings for the 6 boolean flags
   describing primitives. These are the properties:
          SIDEEFFECTS                              NOSIDEEFFECTS
      ----------------------------------------------------------------
      can    fail                              can    fail
      cannot cause scavenge                    cannot cause scavenge
      cannot be constant folded                can    be constant folded
      cannot be moved or cut                   can    be moved or cut
      cannot walk stack                        cannot walk stack
      cannot abort process                     cannot abort process

   Ole, 11/23/91.
*/
# define SIDEEFFECTS               true, false, false, true,  false, false
# define SIDEEFFECTS_WALKSTACK     true, true , false, true,  true , false
# define SIDEEFFECTS_CANABORT      true, true,  false, true,  true, true
# define NOSIDEEFFECTS             true, false, true,  false, false, false
# define SAFE_SIDEEFFECTS          false,false, false, true,  false, false
# define SAFE_NONIDEMPOTENT        false,false, false, false, false, false


static PrimDesc fntable1[] = {

  // internal prims, in alphabetical order

  // CAUTION: the flags of internal prims are (mostly) for documentation
  // purposes, i.e. they are hardwired into the compiler(s)!
{
  "BlockClone", fntype(&clone_block_prim),
  InternalPrimitive, ReceiverMapPrimType,
  SAFE_NONIDEMPOTENT,
  "Internal primitive"
},
{
  "Clone0", fntype(&clone0_prim),
  InternalPrimitive, ReceiverMapPrimType,
  SAFE_NONIDEMPOTENT,
  "Internal primitive"
},
{
  "Clone1", fntype(&clone1_prim),
  InternalPrimitive, ReceiverMapPrimType,
  SAFE_NONIDEMPOTENT,
  "Internal primitive"
},
{
  "Clone2", fntype(&clone2_prim),
  InternalPrimitive, ReceiverMapPrimType,
  SAFE_NONIDEMPOTENT,
  "Internal primitive"
},
{
  "Clone3", fntype(&clone3_prim),
  InternalPrimitive, ReceiverMapPrimType,
  SAFE_NONIDEMPOTENT,
  "Internal primitive"
},
{
  "Clone4", fntype(&clone4_prim),
  InternalPrimitive, ReceiverMapPrimType,
  SAFE_NONIDEMPOTENT,
  "Internal primitive"
},
{
  "Clone5", fntype(&clone5_prim),
  InternalPrimitive, ReceiverMapPrimType,
  SAFE_NONIDEMPOTENT,
  "Internal primitive"
},
{
  "Clone6", fntype(&clone6_prim),
  InternalPrimitive, ReceiverMapPrimType,
  SAFE_NONIDEMPOTENT,
  "Internal primitive"
},
{
  "Clone7", fntype(&clone7_prim),
  InternalPrimitive, ReceiverMapPrimType,
  SAFE_NONIDEMPOTENT,
  "Internal primitive"
},
{
  "Clone8", fntype(&clone8_prim),
  InternalPrimitive, ReceiverMapPrimType,
  SAFE_NONIDEMPOTENT,
  "Internal primitive"
},
{
  "Clone9", fntype(&clone9_prim),
  InternalPrimitive, ReceiverMapPrimType,
  SAFE_NONIDEMPOTENT,
  "Internal primitive"
},
{
  "SendDIMessage_stub", fntype(&SendDIMessage_stub),
  InternalPrimitive, UnknownPrimType,
  false, true, false, true, true, true,
  "Internal primitive"
},
{
  "DIRecompile_stub", fntype(&DIRecompile_stub),
  InternalPrimitive, UnknownPrimType,
  false, true, false, false, true, false,
  "Internal primitive"
},
{
  "InterruptCheck", fntype(&interruptCheck),
  InternalPrimitive, UnknownPrimType,
  false, true, false, true, true, true,
  "Internal primitive"
},
{
  "SendMessage_stub", fntype(&SendMessage_stub),
  InternalPrimitive, UnknownPrimType,
  false, true, false, true, true, true,
  "Internal primitive"
},
{
  "Recompile_stub", fntype(&Recompile_stub),
  InternalPrimitive, UnknownPrimType,
  false, true, false, false, true, false,
  "Internal primitive"
},
{
  "CatchInterprocessReturns", fntype(&catch_interprocess_returns),
  InternalPrimitive, UnknownPrimType,
   SAFE_NONIDEMPOTENT,
  "Internal primitive for debugging"
},
  
  // called from Self code
{  
"AbortProcess", fntype(&AbortProcess_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS_CANABORT,
 "The receiver is a process object.  The associated process is aborted; "
 "if it was the initial process, control will return to the VM prompt; "
 "otherwise, if the aborted process was the current process, the "
 "TWAINS primitive will return 'aborted'.  Otherwise (if the aborted "
 "process isn't the current process), _AbortProcess returns the "
 "receiver."
},
{
"ActivationAt:", fntype(&ActivationAt_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS,     // treat as side-effecting because it can't be const
 "Return a mirror on the activation whose number is given as an "
 "argument (0 = most recent activation)."
},
{
"ActivationStack", fntype(&ActivationStack_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS_WALKSTACK,     // treat as side-effecting because it can't be const, needs WALKSTACK for PPC
 "Receiver is a process.  Returns a vector containing all activations "
 "on the process stack.  Added to optimize stack tracing.  The same "
 "result can be obtained by iterating through the stack using "
 "_ActivationAt: but is roughly an order of magnitude slower due to "
 "the internal representation of activation mirrors."
},
{
"AddSlots:", fntype(&add_slots_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
  SIDEEFFECTS_WALKSTACK, // needs WALKSTACK because it includes a define
 "Add all slots of the argument to the receiver."
},
{
"AddSlotsIfAbsent:", fntype(&add_slots_if_absent_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS_WALKSTACK, // needs WALKSTACK because it includes a define
 "Same as _AddSlots:, except that existing slots are never changed."
},
{
"AddressAsObject", fntype(&address_as_oop_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 NOSIDEEFFECTS,
 "Returns the receiver (an integer denoting an address) converted into "
 "an object.  This primitive is used for low-level debugging (addresses "
 "of objects change upon scavenges and garbage collections)."
},
{
"AnnotateSpyLog", fntype(&SelfMonitor::annotateLog_prim),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "For internal consumption only."
},
{
"AsObject", fntype(&as_object_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 NOSIDEEFFECTS,
 "Returns the receiver (an integer) converted to an object.  The "
 "integer receiver is an object reference number displayed by _Print "
 "or a stack trace."
},
{
  // [Byte]At:[Put:] & Size not glueified for better performance   -Urs 9/92
  // (glue made them 2-3x slower)
"At:", fntype(&ov_at_prim),
 AtPrimitive, UnknownPrimType,
 SIDEEFFECTS,      // cannot be constant-folded
 "Return the element of the receiver (an object vector) indexed by the "
 "argument (an integer).  Vectors are indexed beginning with 0."
},
{
"At:Put:", fntype(&ov_at_put_prim),
 AtPutPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Store into an object vector element.  The receiver is the object "
 "vector, the first argument is the integer index, and the second "
 "argument is the object to be stored.  Returns the receiver."
},
{
"BitSize", fntype(&bitSize_glue),
  ExternalPrimitive, IntegerPrimType,
  NOSIDEEFFECTS,
 "The receiver is a string designating a type.  The primitive returns "
 "an integer, the number of bits in the representation of that "
 "type.  The following strings are valid receivers: 'self_int', "
 "'self_float', 'char', 'short', 'int', 'long', 'float', 'double' and "
 "'void *'.  If sent to any other string the primitive fails."
},
{
"BlockSignals", fntype(&BlockSignals_prim_glue),
 ExternalPrimitive, BooleanPrimType,
 SIDEEFFECTS_CANABORT,  // can do a yield on unblock
 "Sent to true or false.  Enables/disables signals."
},
{
"Breakpoint", fntype(&breakpoint_prim),
 ExternalPrimitive, ReceiverPrimType,
 false, true, false, true, true, true,
 "For debugging the VM; returns the receiver."
},
{
"ByteAt:", fntype(&byteVectorOopClass::bv_at_prim),
 ByteAtPrimitive, IntegerPrimType,
 SIDEEFFECTS,      // cannot be constant-folded (exc. for string literal)
 "Analogous to _At:, but for byte vectors.  Returns an integer in the "
 "range [0..255]."
},
{
"ByteAt:Put:", fntype(&byteVectorOopClass::bv_at_put_prim),
 ByteAtPutPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Store into a byte vector element; analogous to _At:Put:.  The value "
 "to be stored must be an integer in the range [0..255].  Fails if the "
 "receiver is a canonical string."
},
{
"ByteSize", fntype(&byteVectorOopClass::bv_size_prim),
 ByteSizePrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Analogous to _Size, but for byte vectors."
},
{
"ByteVectorCompare:", fntype(&byteVectorOopClass::bv_compare_prim),
 ExternalPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Compares two byte vectors, returning -1, 0, or 1 if the receiver is "
 "less than, equal to, or greater than the argument, respectively."
},
{
"ByteVectorConcatenate:Prototype:", fntype(&bv_concatenate_prim_glue),
 ExternalPrimitive, UnknownPrimType,  // NOT ByteVectorPrimType - depends on arg
 NOSIDEEFFECTS,
 "Clones the second argument, and copies into it a concatentation of "
 "the receiver and first arguments (which should be byte vectors).  "
 "May fail due to lack of space, or if the prototype is a canonical string."
},
{
"CopyByteRangeDstPos:Src:SrcPos:Length:", fntype(&copyByteRange_prim),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Copies 'Length:' bytes into the receiver byte vector at position 'DstPos:' "
 "from the 'Src:' byte vector (or string) at position 'SrcPos:'. May fail "
 "with badTypeError or badIndexError. The destination (receiver) and source "
 "can be identical. Note: the receiver cannot be a canonical string since "
 "these are immutable. Returns the receiver."
},
{
"CopyRangeDstPos:Src:SrcPos:Length:", fntype(&copyRange_prim),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Copies 'Length:' elements into the receiver vector at position 'DstPos:' "
 "from the 'Src:' vector at position 'SrcPos:'. May fail with "
 "badTypeError or badIndexError. The estination (receiver) and source "
 "can be identical. Returns the receiver."
},
{
"CFloatDouble:At:", fntype(&CFloatDouble_At_prim_glue),
 ExternalPrimitive, FloatPrimType,
 NOSIDEEFFECTS,
 "The receiver must be a byte vector, the first argument a boolean and "
 "the second argument an integer index.  The return value is a float "
 "obtained by interpreting the bytes in the byte vector starting at "
 "the given index as either a C float (if the boolean is false) or a C "
 "double (if the boolean is true).  Note that precision may be "
 "lost.  The number of bytes occupied by a C float or C double is "
 "implementation dependent.  The actual sizes can be found using the "
 "_BitSize primitive."
},
{
"CFloatDouble:At:Put:", fntype(&CFloatDouble_At_Put_prim_glue),
 ExternalPrimitive, IntegerPrimType,  /* Always returns 0. */ 
 SIDEEFFECTS,
 "Analogous to _CFloatDouble:At: but stores a floating point "
 "value at a given index in the byte vector.  The last argument is the "
 "value to be stored.  Returns (integer) zero."
},
#  ifndef NO_LONG_LONG // no long long
  {
  "CSignedIntSize:At:", fntype(&CSignedIntSize_At_prim_glue),
   ExternalPrimitive, IntegerPrimType,
   SIDEEFFECTS,
   "The receiver must be a byte vector, the first argument an integer "
   "and the second argument an integer index.  The return value is an "
   "integer obtained by interpreting the bytes in the byte vector "
   "starting at the given index as a C int type.  The first argument "
   "gives the size of this integer in bits.  Not all bit sizes are "
   "supported, but the bit sizes corresponding to the C types char, "
   "short, int and long are guaranteed to be valid.  Note: may fail with "
   "overflow error."
  },
  {
  "CSignedIntSize:At:Put:", fntype(&CSignedIntSize_At_Put_prim_glue),
   ExternalPrimitive, IntegerPrimType,  /* Always returns 0.  */
   SIDEEFFECTS,
   "Analogous to _CSignedIntSize:At: but stores an integer value "
   "at a given index in the byte vector.  The last argument is the value "
   "to be stored.  Returns zero."
  },
  {
  "CUnsignedIntSize:At:", fntype(&CUnsignedIntSize_At_prim_glue),
   ExternalPrimitive, IntegerPrimType,
   SIDEEFFECTS,
   "Analogous to _CSignedIntSize:At: but interprets the bytes in the "
   "byte vector starting at the given index as a C unsigned int type."
  },
  {
  "CUnsignedIntSize:At:Put:", fntype(&CUnsignedIntSize_At_Put_prim_glue),
   ExternalPrimitive, IntegerPrimType,  /* Always returns 0. */
   SIDEEFFECTS,
   "Analogous to _CUnsignedIntSize:At: but stores an unsigned integer "
   "value at a given index in the byte vector.  The last argument is the "
   "value to be stored.  Returns zero."
  },
  
  {
  "BigEndianSignedIntSize:At:", fntype(&BigEndianSignedIntSize_At_prim_glue),
   ExternalPrimitive, IntegerPrimType,
   SIDEEFFECTS,
   "The receiver must be a byte vector, the first argument an integer "
   "and the second argument an integer index.  The return value is an "
   "integer obtained by interpreting the bytes in the byte vector "
   "starting at the given index as a big endian C int type (msbyte first).  The first argument "
   "gives the size of this integer in bits.  Not all bit sizes are "
   "supported, but the bit sizes corresponding to the C types char, "
   "short, int and long are guaranteed to be valid.  Note: may fail with "
   "overflow error."
  },
  {
  "BigEndianSignedIntSize:At:Put:", fntype(&BigEndianSignedIntSize_At_Put_prim_glue),
   ExternalPrimitive, IntegerPrimType,  /* Always returns 0.  */
   SIDEEFFECTS,
   "Analogous to _BigEndianSignedIntSize:At: but stores an integer value "
   "at a given index in the byte vector.  The last argument is the value "
   "to be stored.  Returns zero."
  },
  {
  "BigEndianUnsignedIntSize:At:", fntype(&BigEndianUnsignedIntSize_At_prim_glue),
   ExternalPrimitive, IntegerPrimType,
   SIDEEFFECTS,
   "Analogous to _BigEndianSignedIntSize:At: but interprets the bytes in the "
   "byte vector starting at the given index as a BigEndian unsigned int type."
  },
  {
  "BigEndianUnsignedIntSize:At:Put:", fntype(&BigEndianUnsignedIntSize_At_Put_prim_glue),
   ExternalPrimitive, IntegerPrimType,  /* Always returns 0. */
   SIDEEFFECTS,
   "Analogous to _BigEndianUnsignedIntSize:At: but stores an unsigned integer "
   "value at a given index in the byte vector.  The last argument is the "
   "value to be stored.  Returns zero."
  },
  
  
  {
  "LittleEndianSignedIntSize:At:", fntype(&LittleEndianSignedIntSize_At_prim_glue),
   ExternalPrimitive, IntegerPrimType,
   SIDEEFFECTS,
   "The receiver must be a byte vector, the first argument an integer "
   "and the second argument an integer index.  The return value is an "
   "integer obtained by interpreting the bytes in the byte vector "
   "starting at the given index as a little endian C int type (lsb first).  The first argument "
   "gives the size of this integer in bits.  Not all bit sizes are "
   "supported, but the bit sizes corresponding to the C types char, "
   "short, int and long are guaranteed to be valid.  Note: may fail with "
   "overflow error."
  },
  {
  "LittleEndianSignedIntSize:At:Put:", fntype(&LittleEndianSignedIntSize_At_Put_prim_glue),
   ExternalPrimitive, IntegerPrimType,  /* Always returns 0.  */
   SIDEEFFECTS,
   "Analogous to _LittleEndianSignedIntSize:At: but stores an integer value "
   "at a given index in the byte vector.  The last argument is the value "
   "to be stored.  Returns zero."
  },
  {
  "LittleEndianUnsignedIntSize:At:", fntype(&LittleEndianUnsignedIntSize_At_prim_glue),
   ExternalPrimitive, IntegerPrimType,
   SIDEEFFECTS,
   "Analogous to _LittleEndianSignedIntSize:At: but interprets the bytes in the "
   "byte vector starting at the given index as a LittleEndian unsigned int type."
  },
  {
  "LittleEndianUnsignedIntSize:At:Put:", fntype(&LittleEndianUnsignedIntSize_At_Put_prim_glue),
   ExternalPrimitive, IntegerPrimType,  /* Always returns 0. */
   SIDEEFFECTS,
   "Analogous to _LittleEndianUnsignedIntSize:At: but stores an unsigned integer "
   "value at a given index in the byte vector.  The last argument is the "
   "value to be stored.  Returns zero."
  },
  
# endif // NO_LONG_LONG
{
"Call",   fntype(&call0_prim),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_CANABORT,
 "The receiver is a live fctProxy.  Calls to foreign routine it "
 "represents and return its return value converted to a Self object"
},
{
"Call:",   fntype(&call1_prim),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "The receiver is a live fctProxy. Passes the arguments to the foreign "
 "routine and calls the foreign routine it represents, and return its "
 "return value converted to a Self object."
},
{
"Call:With:",   fntype(&call2_prim),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "The receiver is a live fctProxy. Passes the arguments to the foreign "
 "routine and calls the foreign routine it represents, and return its "
 "return value converted to a Self object."
},
{
"Call:With:With:",   fntype(&call3_prim),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "The receiver is a live fctProxy. Passes the arguments to the foreign "
 "routine and calls the foreign routine it represents, and return its "
 "return value converted to a Self object."
},
{
"Call:With:With:With:",   fntype(&call4_prim),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "The receiver is a live fctProxy. Passes the arguments to the foreign "
 "routine and calls the foreign routine it represents, and return its "
 "return value converted to a Self object."
},
{
"Call:With:With:With:With:",   fntype(&call5_prim),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "The receiver is a live fctProxy. Passes the arguments to the foreign "
 "routine and calls the foreign routine it represents, and return its "
 "return value converted to a Self object."
},
{
"Call:With:With:With:With:With:",   fntype(&call6_prim),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "The receiver is a live fctProxy. Passes the arguments to the foreign "
 "routine and calls the foreign routine it represents, and return its "
 "return value converted to a Self object."
},
{
"Call:With:With:With:With:With:With:",  
 fntype(&call7_prim),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "The receiver is a live fctProxy. Passes the arguments to the foreign "
 "routine and calls the foreign routine it represents, and return its "
 "return value converted to a Self object."
},
{
"Call:With:With:With:With:With:With:With:",  
 fntype(&call8_prim),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "The receiver is a live fctProxy. Passes the arguments to the foreign "
 "routine and calls the foreign routine it represents, and return its "
 "return value converted to a Self object."
},
{
"Call:With:With:With:With:With:With:With:With:",  
 fntype(&call9_prim),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "The receiver is a live fctProxy. Passes the arguments to the foreign "
 "routine and calls the foreign routine it represents, and return its "
 "return value converted to a Self object."
},
{
"Call:With:With:With:With:With:With:With:With:With:",  
 fntype(&call10_prim),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "The receiver is a live fctProxy. Passes the arguments to the foreign "
 "routine and calls the foreign routine it represents, and return its "
 "return value converted to a Self object."
},
{
"CallAndConvert", fntype(&call_and_convert0_glue),
  ExternalPrimitive, ByteVectorPrimType,
  SIDEEFFECTS_CANABORT,
 "Similar to _Call, but returns a byte vector that literally contains "
 "the bit pattern that the foreign routine returned."
},
{
"CallAndConvertWith:And:", fntype(&call_and_convert1_glue),
 ExternalPrimitive, ByteVectorPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _CallAndConvert but passes arguments to the foreign "
 "routine. These arguments are determined by interpreting each pair of "
 "Self level arguments using the `any' conversion."
},
{
"CallAndConvertWith:And:With:And:", fntype(&call_and_convert2_glue),
 ExternalPrimitive, ByteVectorPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _CallAndConvert but passes arguments to the foreign "
 "routine. These arguments are determined by interpreting each pair of "
 "Self level arguments using the `any' conversion."
},
{
"CallAndConvertWith:And:With:And:With:And:",  
 fntype(&call_and_convert3_glue),
 ExternalPrimitive, ByteVectorPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _CallAndConvert but passes arguments to the foreign "
 "routine. These arguments are determined by interpreting each pair of "
 "Self level arguments using the `any' conversion."
},
{
"CallAndConvertWith:And:With:And:With:And:With:And:",  
 fntype(&call_and_convert4_glue),
 ExternalPrimitive, ByteVectorPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _CallAndConvert but passes arguments to the foreign "
 "routine. These arguments are determined by interpreting each pair of "
 "Self level arguments using the `any' conversion."
},
{
"CallAndConvertWith:And:With:And:With:And:With:And:With:And:",   
fntype(&call_and_convert5_glue),
 ExternalPrimitive, ByteVectorPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _CallAndConvert but passes arguments to the foreign "
 "routine. These arguments are determined by interpreting each pair of "
 "Self level arguments using the `any' conversion."
},
{
"CallAndConvertWith:And:With:And:With:And:With:And:With:And:With:And:",  
 fntype(&call_and_convert6_glue),
 ExternalPrimitive, ByteVectorPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _CallAndConvert but passes arguments to the foreign "
 "routine. These arguments are determined by interpreting each pair of "
 "Self level arguments using the `any' conversion."
},
{
"CallAndConvertWith:And:With:And:With:And:With:And:With:And:With:And:With:And",  
 fntype(&call_and_convert7_glue),
 ExternalPrimitive, ByteVectorPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _CallAndConvert but passes arguments to the foreign "
 "routine. These arguments are determined by interpreting each pair of "
 "Self level arguments using the `any' conversion."
},
{
"CallAndConvertWith:And:With:And:With:And:With:And:With:And:With:And:With:And:With:And",  
 fntype(&call_and_convert8_glue),
 ExternalPrimitive, ByteVectorPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _CallAndConvert but passes arguments to the foreign "
 "routine. These arguments are determined by interpreting each pair of "
 "Self level arguments using the `any' conversion."
},
{
"CallAndConvertWith:And:With:And:With:And:With:And:With:And:With:And:With:And:With:And:With:And",  
 fntype(&call_and_convert9_glue),
 ExternalPrimitive, ByteVectorPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _CallAndConvert but passes arguments to the foreign "
 "routine. These arguments are determined by interpreting each pair of "
 "Self level arguments using the `any' conversion."
},
{
"CallAndConvertWith:And:With:And:With:And:With:And:With:And:With:And:With:And:With:And:With:And:With:And",  
 fntype(&call_and_convert10_glue),
 ExternalPrimitive, ByteVectorPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _CallAndConvert but passes arguments to the foreign "
 "routine. These arguments are determined by interpreting each pair of "
 "Self level arguments using the `any' conversion."
},
{
"Clone", fntype(&clone_prim_glue),
 ClonePrimitive, ReceiverMapPrimType,
 true, true, false, false, false, false, 
 "Return a clone (a shallow copy) of the receiver.  Cloning is the only "
 "way to create new objects in Self.  Returns its receiver (not a copy) "
 "when sent to integers, floats, and canonical strings.  May fail due to "
 "lack of space."
},
{
"Clone:Filler:", fntype(&ov_clone_prim_glue),
  CloneVectorPrimitive, ReceiverMapPrimType,
 true, true, false, false, false, false, 
 "Return a clone (shallow copy) of the receiver object vector, "
 "possibly resized.  The receiver must be an object vector.  The first "
 "argument (an integer) specifies the length of the new vector, and "
 "the second argument specifies the initial value of extra elements if "
 "the result vector is longer than the receiver vector.  Fails with "
 "badSizeError if the first argument is negative.  May also fail due to "
 "lack of space.\n"
 "_Clone:Filler: is "
 "identical to _Clone if the first argument is the same as the length "
 "of the receiver."
},
{
"CloneBytes:Filler:", fntype(&bv_clone_prim_glue),
  CloneVectorPrimitive, ReceiverMapPrimType,
 true, true, false, false, false, false, 
 "Analogous to _Clone:Filler, but for byte vectors.  The receiver must "
 "be a byte vector, and the second argument must be an integer in the "
 "range [0..255].  The integer is used to initialize new "
 "elements.  Fails with badTypeError if sent to a canonical string."
},
{
"CommandLine", fntype(&command_line_prim_glue),
 ExternalPrimitive, ObjVectorPrimType,
 SIDEEFFECTS,
 "Return the command line arguments as a vector of strings.  "
 "May fail due to lack of space."
},
{
"Compact", fntype(&compact_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SAFE_SIDEEFFECTS,
 "Compact the compiled code cache."
},
{
"CompileCounts", fntype(&get_compile_counts_prim_glue),
 ExternalPrimitive, ObjVectorPrimType,
 SIDEEFFECTS,
 "For internal consumption only."
},
{
"Compilers", fntype(&get_compilers_prim_glue),
 ExternalPrimitive, ObjVectorPrimType,
 NOSIDEEFFECTS,
 "For internal consumption only."
},
{
"Compilers:Limits:", fntype(&set_recompilation_prim_glue),
 ExternalPrimitive, ObjVectorPrimType,
 SIDEEFFECTS,
 "For internal consumption only."
},
{
"CoreDump", fntype(&core_dump_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS,
 "For internal consumption only."
},
{
"CreateBlockMethodBytecodes:Literals:File:Line:Source:",  
 fntype(&create_block_method_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS,
 "Creates a new block method given a byteVector of bytecodes, a vector "
 "of literals, a string for the file name, a small integer for the "
 "line number, and a string for the source code.  The literals are "
 "recursively searched for blocks, which are copied and set with the "
 "appropriate lexical parents."
},
{
"CreateOuterMethodBytecodes:Literals:File:Line:Source:",
 fntype(&create_outer_method_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Creates a new outer method given a byteVector of bytecodes, a vector "
 "of literals, a string for the file name, a small integer for the "
 "line number, and a string for the source code.  The literals are "
 "recursively searched for blocks, which are copied and set with the "
 "appropriate lexical parents."
},
{
"Credits", fntype(&credits_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS,
 "Prints out the credit message."
},
{
"CurrentHash:", fntype(&set_current_hash_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Whenever an identity hash value is assigned to an object, the value "
 "is computed by incrementing a counter that is kept in the process "
 "that requests the identity hash.  This primitive allows the counter "
 "to be reset.  It's main use is to allow for reproducible debugging."
},
{
"CurrentTimeString", fntype(&current_time_string_prim_glue),
  ExternalPrimitive, StringPrimType,
  SIDEEFFECTS, 
 "Returns a human readable string containing the current time.  "
 "Receiver is ignored."
},
{
"DateTime:", fntype(&date_time_prim_glue),
  ExternalPrimitive, ObjVectorPrimType,
  SIDEEFFECTS,
 "Receiver is an integer, number of days after Jan. 1, 1970 describing "
 "the date.  The argument is an integer, number of milliseconds "
 "describing the time of the date.  (_TimeReal can be used to obtain "
 "these numbers for the current time.)  "
 "Converts the date and time integers into two blocks of 9 integers: "
 "year, month, day, weekday (0 = Sunday), hour, minute, second, "
 "yearday (Jan. 1st = 0), and is-daylight-savings-time (positive=yes, "
 "zero=no, negative=unknown). The first block of nine integers describes "
 "local time, the second block describes UTC/GMT."
},
{
"Define:", fntype(&define_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS_WALKSTACK, // needs WALKSTACK because it includes a define
 "Define slots of the receiver.  "
 "Can fail due to low memory."
},
{
"EnumerateAllLimit:", fntype(&all_prim_glue),
 ExternalPrimitive, ObjVectorPrimType,
 SIDEEFFECTS_WALKSTACK, // needs WALKSTACK for debugging
 "Receiver is any object.  Returns a vector containing mirrors on all "
 "objects in the system up to the limit specified by the "
 "argument.  Using a limit of floating-point infinity yields a vector "
 "of mirrors on all objects in the entire Self system."
},
{
"EnumerateVectorImplementorsLimit:", fntype(&ov_implementors_prim_glue),
  ExternalPrimitive, ObjVectorPrimType,
 SIDEEFFECTS,
 "Receiver is a vector of selectors (strings) for the messages of "
 "interest.  Returns a vector of mirrors on objects containing a slot "
 "that matches some target selector.  The argument specifies the "
 "maximum size of the result vector.  A limit of floating-point infinity "
 "specifies an unlimited enumeration."
},
{
"EnumerateVectorReferencesLimit:", fntype(&ov_references_prim_glue),
  ExternalPrimitive, ObjVectorPrimType,
 SIDEEFFECTS,
 "Receiver is a vector of mirrors on the target objects for which "
 "references are sought.  Returns a vector of mirrors on objects that "
 "refer to any of the target objects.  The limit (either a positive "
 "integer or floating-point infinity) limits the maximum size of the "
 "result vector, to avoid running out of space inadvertently.  A limit "
 "of floating-point infinity specifies an unlimited enumeration."
},
{
"Eq:", fntype(&oop_eq_prim_glue),
 EQPrimitive, BooleanPrimType,
 false, false, true, false, false, false,
 "Identity test; return true iff the receiver and the argument are the same "
 "object."
},
{
"ErrorMessage", fntype(&error_msg_prim_glue),
 ExternalPrimitive, StringPrimType,
 NOSIDEEFFECTS,
 "Return a short description (a canonical string) of the receiver, "
 "which should be an error string returned by a primitive "
 "failure.  Especially useful for UNIX errors.\nExample: 'E2BIG' "
 "_ErrorMessage returns 'Arg list too long'."
},
{
"FindNmethodsRcvr:Selector:", fntype(&findNMethods_prim),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "For internal consumption only."
},
// float arithmetic/comparisons are unglued for performance reasons
{
"FloatAdd:", fntype(&float_add_prim),
 FloatArithmeticPrimitive, FloatPrimType,
 NOSIDEEFFECTS,
 "Floating-point add.  Returns sum of receiver and argument.  The range "
 "of floating-point numbers currently is approximately "
 "[-4.3*10^-9..4.3*10^9]; the precision is 6 decimal digits (this is "
 "IEEE standard 32-bit float, but with two fewer exponent bits).  Does "
 "not overflow or underflow (but may go to 0.0 or Inf, IEEE "
 "floating-point infinity)."
},
{
"FloatAsInt", fntype(&as_int_prim),
 ExternalPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Return the floating-point receiver rounded as in _FloatRound.  The "
 "result is an integer.  May overflow."
},
{
"FloatCeil", fntype(&float_ceil_prim),
 ExternalPrimitive, FloatPrimType,
 NOSIDEEFFECTS,
 "Return the greatest integral value greater than or equal to the "
 "receiver (i.e., rounding towards positive infinity).  The result is a "
 "floating-point number."
},
{
"FloatDiv:", fntype(&float_div_prim),
 FloatArithmeticPrimitive, FloatPrimType,
 NOSIDEEFFECTS,
 "Floating-point division.  Returns receiver divided by argument.  May "
 "fail because of division by zero."
},
{
"FloatEQ:", fntype(&float_eq_prim),
 FloatComparisonPrimitive, BooleanPrimType,
 NOSIDEEFFECTS,
 "Floating-point equality.  Two floating point numbers may be _FloatEQ: "
 "but not _Eq: (e.g. 0.0 and -0.0)."
},
{
"FloatFloor", fntype(&float_floor_prim),
 ExternalPrimitive, FloatPrimType,
 NOSIDEEFFECTS,
 "Return the greatest integral value less than or equal to the "
 "floating-point receiver (i.e. rounding towards negative "
 "infinity).  The result is a floating-point number."
},
{
"FloatGE:", fntype(&float_ge_prim),
 FloatComparisonPrimitive, BooleanPrimType,
 NOSIDEEFFECTS,
 "Floating-point greater than or equal."
},
{
"FloatGT:", fntype(&float_gt_prim),
 FloatComparisonPrimitive, BooleanPrimType,
 NOSIDEEFFECTS,
 "Floating-point greater than."
},
{
"FloatLE:", fntype(&float_le_prim),
 FloatComparisonPrimitive, BooleanPrimType,
 NOSIDEEFFECTS,
 "Floating-point less than or equal."
},
{
"FloatLT:", fntype(&float_lt_prim),
 FloatComparisonPrimitive, BooleanPrimType,
 NOSIDEEFFECTS,
 "Floating-point less than."
},
{
"FloatMod:", fntype(&float_mod_prim),
 FloatArithmeticPrimitive, FloatPrimType,
 NOSIDEEFFECTS,
 "Floating-point modulus.  Returns receiver modulo argument.  If r is (x "
 "_FloatMod: y), then 0 <= r < abs(y), and (x-r)/y is an integral "
 "number (even though it might not be representable as a Self "
 "integer).  May fail because of division by zero."
},
{
"FloatMul:", fntype(&float_mul_prim),
 FloatArithmeticPrimitive, FloatPrimType,
 NOSIDEEFFECTS,
 "Floating-point multiplication.  Returns product of receiver and "
 "argument.  Does not overflow or underflow."
},
{
"FloatNE:", fntype(&float_ne_prim),
 FloatComparisonPrimitive, BooleanPrimType,
 NOSIDEEFFECTS,
 "Floating-point inequality."
},
{
"FloatPrintString", fntype(&print_string_prim_glue),
 ExternalPrimitive, StringPrimType,
 NOSIDEEFFECTS,
 "Return the receiver, a floating-point number, formatted into an "
 "canonical string (similar to C's sprintf(\"%g\") format)."
},
{
"FloatPrintStringPrecision:", fntype(&print_string_precision_prim_glue),
 ExternalPrimitive, StringPrimType,
 NOSIDEEFFECTS,
 "Analogous to _FloatPrintString, but takes an integer argument that "
 "specifies the number of digits after the decimal point."
},
{
"FloatRound", fntype(&float_round_prim),
 ExternalPrimitive, FloatPrimType,
 NOSIDEEFFECTS,
 "Return the receiver rounded to the nearest integer. 0.5 is rounded "
 "to even, so 1.5 rounds to 2, and 2.5 also rounds to 2.  The result is "
 "a floating-point number."
},
{
"FloatSub:", fntype(&float_sub_prim),
 FloatArithmeticPrimitive, FloatPrimType,
 NOSIDEEFFECTS,
 "Floating-point subtraction.  Returns receiver minus argument.  Does "
 "not overflow or underflow."
},
{
"FloatTruncate", fntype(&float_truncate_prim),
 ExternalPrimitive, FloatPrimType,
 NOSIDEEFFECTS,
 "Return the receiver truncated towards zero.  The result is a "
 "floating-point number."
},
{
"Flush", fntype(&flush_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SAFE_SIDEEFFECTS,
 "Flush all compiled methods from the compiled code cache."
},
{
"FlushInlineCache", fntype(&flush_inline_cache_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SAFE_SIDEEFFECTS,
 "Flush all inline caches.  An inline cache caches the result of "
 "message lookups at the site of a message send.  Inline caching speeds "
 "up subsequent executions of the particular send if the type of the "
 "receiver does not change.  See [DS84] for details."
},
{
"FlushUnusedCode", fntype(&flushUnused_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SAFE_SIDEEFFECTS,
 "Flush unused methods from the compiled code cache."
},
{
"MarkCodeUnused", fntype(&markAllUnused_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SAFE_SIDEEFFECTS,
 "Mark all code as unused in the compiled code cache."
},
{
"ForeignHash", fntype(&foreign_hash_glue),
 ExternalPrimitive, IntegerPrimType,
 SIDEEFFECTS,
 "The receiver is a proxy or fctProxy object.  Return an integer hash "
 "value for the proxy.  Note that this hash value is dependent on what "
 "the proxy is referring."
},
{
"ForeignIsLive", fntype(&foreign_is_live_glue),
 ExternalPrimitive, BooleanPrimType,
 SIDEEFFECTS,
 "The receiver is a proxy or fctProxy object.  Returns true iff it "
 "receiver is live."
},
{
"ForeignIsNull", fntype(&foreign_is_null_glue),
 ExternalPrimitive, BooleanPrimType,
 SIDEEFFECTS,
 "The receiver is a proxy or fctProxy object.  Returns true iff the "
 "pointer it encapsulates is 0."
},
{
"ForeignKill", fntype(&foreign_kill_glue),
 ExternalPrimitive, IntegerPrimType,
 SIDEEFFECTS,
 "The receiver is a proxy or fctProxy object.  Kills this "
 "object.  Returns 0."
},
{
"GarbageCollect", fntype(&garbage_collect_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 false, true, false, true, false, false,
 "Force a full garbage collection (this may take several seconds "
 "depending on your hardware and the size of old space)."
},
{
"GotoByteCode:ExpressionStack:", fntype(&GotoByteCode_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 true, true, false, true,  false, false, // SIDEEFFECTS & CAN_CAUSE_SCAVENGE
 "Receiver is a process.  Changes the current byte code index and "
 "replaces the expression stack of the current activation."
},
{
"IdentityHash", fntype(&identity_hash_prim_glue),
  ExternalPrimitive, IntegerPrimType,
  false, false, true, false, false, false, 
 "Return an integer hash value for the receiver.  The hash for a "
 "particular object is constant, but it is not unique (several objects "
 "might have the same hash value)."
},
// int arithmetic/comparisons are unglued for performance reasons
{
"IntAdd:", fntype(&smi_add_prim),
 IntArithmeticPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Integer addition.  Returns sum of receiver and argument.  The range of "
 "integers is [-229..229-1], i.e., roughly 536,000,000 (standard 30-bit "
 "two's complement).  May fail because of overflow."
},
{
"IntAnd:", fntype(&smi_and_prim),
 IntArithmeticPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Returns bitwise AND of receiver and argument."
},
{
"IntArithmeticShiftLeft:", fntype(&smi_arithmetic_shift_left_prim),
 IntArithmeticPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Shift receiver left by the number of bits indicated by the argument "
 "(an integer).  Will fail with overflowError if the resulting number "
 "is too large to be represented as an integer (equivalent to "
 "multiplying by a power of 2)."
},
{
"IntArithmeticShiftRight:", fntype(&smi_arithmetic_shift_right_prim),
 IntArithmeticPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Arithmetic right shift of receiver by the number of bits indicated "
 "by the argument (an integer).  The sign bit is preserved."
},
{
"IntAsFloat", fntype(&as_float_prim),
 ExternalPrimitive, FloatPrimType,
 NOSIDEEFFECTS,
 "Return the integer receiver converted to a float."
},
{
// could be IntArithmeticPrimitive, but would need more work
// since a unary primitive, not a binary primitive
"IntComplement", fntype(&smi_complement_prim),
 ExternalPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Returns bitwise complement (i.e., invert all bits) of receiver."
},
{
"IntDiv:", fntype(&smi_div_prim),
 IntArithmeticPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Integer division.  Returns integer part of receiver divided by "
 "argument.  May fail because of overflow or division by zero."
},
{
"IntEQ:", fntype(&smi_eq_prim),
 IntComparisonPrimitive, BooleanPrimType,
 NOSIDEEFFECTS,
 "Integer equality.  If two integers are _IntEQ: then they are _Eq:."
},
{
"IntGE:", fntype(&smi_ge_prim),
 IntComparisonPrimitive, BooleanPrimType,
 NOSIDEEFFECTS,
 "Integer greater than or equal."
},
{
"IntGT:", fntype(&smi_gt_prim),
 IntComparisonPrimitive, BooleanPrimType,
 NOSIDEEFFECTS,
 "Integer greater than."
},
{
"IntLE:", fntype(&smi_le_prim),
 IntComparisonPrimitive, BooleanPrimType,
 NOSIDEEFFECTS,
 "Integer less than or equal."
},
{
"IntLT:", fntype(&smi_lt_prim),
 IntComparisonPrimitive, BooleanPrimType,
 NOSIDEEFFECTS,
 "Integer less than."
},
{
"IntLogicalShiftLeft:", fntype(&smi_logical_shift_left_prim),
 IntArithmeticPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Bitwise shift receiver left by the number of bits indicated by the "
 "argument (an integer).  No overflow will occur."
},
{
"IntLogicalShiftRight:", fntype(&smi_logical_shift_right_prim),
 IntArithmeticPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Logical right shift of receiver by the number of bits indicated by "
 "the argument (an integer).  0 is shifted into the most significant "
 "bit."
},
{
"IntMod:", fntype(&smi_mod_prim),
 IntArithmeticPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Integer modulus.  Returns receiver modulo argument, with range 0 <= "
 "(n _IntMod: m) < abs(m).  May fail because of division by zero."
},
{
"IntMul:", fntype(&smi_mul_prim),
 IntArithmeticPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Integer multiplication.  Returns product of receiver and "
 "argument.  May fail because of overflow."
},
{
"IntNE:", fntype(&smi_ne_prim),
 IntComparisonPrimitive, BooleanPrimType,
 NOSIDEEFFECTS,
 "Integer inequality."
},
{
"IntOr:", fntype(&smi_or_prim),
 IntArithmeticPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Returns bitwise inclusive OR of receiver and argument."
},
{
"IntSub:", fntype(&smi_sub_prim),
 IntArithmeticPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Integer subtraction.  Returns receiver minus argument.  May fail "
 "because of overflow."
},
{
"IntXor:", fntype(&smi_xor_prim),
 IntArithmeticPrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Returns bitwise exclusive OR of receiver and argument."
},
{
"KillActivationsUpTo:", fntype(&KillUpTo_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 true, true, false, true,  false, false, // SIDEEFFECTS & CAN_CAUSE_SCAVENGE
 "Receiver is a process (not the current process or the scheduler); "
 "argument is the number of activations to kill."
},
{
"Manufacturer", fntype(&manufacturer_prim_glue),
 ExternalPrimitive, StringPrimType,
 SAFE_NONIDEMPOTENT,
 "Return the name (a canonical string) of the manufacturer of the host "
 "computer."
},
{
"MemoryCurrentSpaceSizes:", fntype(&get_current_space_sizes_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS,
 "Argument is a prototype which will be filled in with the current VM "
 "startup parameters.  See result of _MemoryDefaultSpaceSizes for slot "
 "names.  Receiver is ignored.  Fails if a slot is not assignable."
},
{
"MemoryCurrentState:", fntype(&get_mem_current_state_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS,
 "Argument is a prototype which will be filled in with the current VM "
 "memory occupancy.\n"
 "Memory spaces:  slot names are 'eden', 'from', 'to', and 'old'.\n"
 " 'old' will be set to reference a new vector, the size being the same as "
 "the number of old space segments.  Each of these elements, together "
 "with the slots called 'eden', 'from', and 'to' will be set to reference "
 "a vector with these elements:\n"
 "\t0 is the number of bytes occupied by oops\n"
 "\t1 is the number of bytes occupied by byte strings.\n"
 "\t2 is the capacity of the space in bytes.  Note that the capacity of"
 " a space may be less than its size as reported by _MemoryCurrentSpaceSizes:,"
 " due to alignment requirements, padding, etc."
 "(Future versions may supply extra elements.)\n"
 "GC and card table:\n"
 " 'card_table_size' will be set to the size of the card table in bytes.\n"
 " 'num_scavenge' will be set to the number of scavenges since system "
 "  startup.\n"
 "Zone: slots called 'code', 'deps', 'pics' and 'debug' will be set to the "
 "number of bytes used in the corresponding spaces.\n"
 "Any slot can be omitted, in which case the corresponding information "
 "is omitted.  Extra slots are ignored.  "
 "Note that calling this primitive affects the very statistics it returns!\n"
 "Can fail due to insufficient memory, or if a slot is not assignable.  "
 "Receiver is ignored."
},
{
"MemoryDefaultSpaceSizes", fntype(&get_default_space_sizes_prim),
 ExternalPrimitive, UnknownPrimType,
 SAFE_SIDEEFFECTS,
 "Returns an object containing the default VM startup parameters.  "
 "Receiver is ignored."
},
{
"MemoryExpandHeap:", fntype(&expand_heap_prim_glue),
 ExternalPrimitive, IntegerPrimType,
 SIDEEFFECTS_WALKSTACK, // Walkstack for PPC to reload byte-map-base
 "Attempt to expand the Self by heap by the (non-negative smallInt) number "
 "of bytes which is the argument.  "
 "Either expands by the desired amount (or possibly a little more due to "
 "rounding to page boundaries), or performs no expansion.  Returns "
 "the actual number of bytes added to the heap.  "
 "Receiver is ignored."
},
{
"MemoryLowSpaceThreshold", fntype(&get_memory_low_space_threshold_prim_glue),
 ExternalPrimitive, IntegerPrimType,
 SAFE_SIDEEFFECTS,
 "Returns the low space threshold for the object heap (old space).  "
 "When the amount of free space drops below this amount, the scheduler "
 "is awakened in order to reclaim or expand memory.  "
 "Receiver is ignored."
},
{
"MemoryLowSpaceThreshold:", fntype(&set_memory_low_space_threshold_prim_glue),
 ExternalPrimitive, IntegerPrimType,
 SIDEEFFECTS,
 "Sets the low space threshold (see _MemoryLowSpaceThreshold) from the "
 "argument (which must be a smallInt as least as large as "
 "_MemoryVMReservedAmount; otherwise the prim fails).  "
 "Returns the previous threshold.  Receiver is ignored."
},
{
"MemorySwapSpace", fntype(&get_swap_space_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS,
 "Returns an array whose first element is the total number of kilobytes in "
 "the swap area, and whose second element is the number of kilobytes free.  "
 "Receiver is ignored.  Only supported on Solaris 2.X at present."
},
{
"MemoryTenuringThreshold", fntype(&get_memory_tenuring_threshold_prim_glue),
 ExternalPrimitive, IntegerPrimType,
 SAFE_SIDEEFFECTS,
 "Returns the desired tenuring threshold (in bytes).  The scavenger will "
 "attempt to keep the occupancy of the survivor space after scavenging below "
 "this amount.  Receiver is ignored."
},
{
"MemoryTenuringThreshold:", fntype(&set_memory_tenuring_threshold_prim_glue),
 ExternalPrimitive, IntegerPrimType,
 SIDEEFFECTS,
 "Sets the tenuring threshold (see _MemoryTenuringThreshold) from the "
 "argument (which must be a non-negative smallInt, less than the size of a "
 "survivor space [see _MemoryCurrentSpaceSizes:], otherwise the prim fails).  "
 "Returns the previous threshold.  Receiver is ignored."
},
{
"MemoryVMReservedAmount", fntype(&VM_reserved_mem_prim_glue),
 ExternalPrimitive, IntegerPrimType,
 SAFE_SIDEEFFECTS,
 "Return the amount of memory in old space (in bytes) reserved by the VM.  "
 "Receiver is ignored."
},
{
"MemoryWriteSnapshot:Compress:Sizes:SaveCode:", fntype(&full_write_snapshot_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Write a snapshot to the file named by the first argument, a byte vector.\n"
 "The second argument "
 "dictates whether the snapshot will be compressed or not.  "
 "It must be a slots objects.  "
 "If it contains slots named 'compression_filter' and "
 "'decompression_filter', and the values of these slots are byte vectors, "
 "they will be used to compress and decompress the binary part of the "
 "snapshot.  Each is used as a pure filter (i.e., reads from stdin, "
 "writes to stdout).  The value of the PATH environment variable will be "
 "used to locate the programs.  The decompression filter is only used at "
 "system startup -- it is _essential_ that a valid filter be named, "
 "otherwise the snapshot will be incapable of startup.  Suitable choices "
 "are 'compress' and 'zcat'.\n"
 "The third "
 "argument is used to set the default space sizes in the snapshot, and "
 "should be an object with slots like those in the object returned by "
 "_MemoryDefaultSpaceSizes.  You may omit slots to use the current "
 "values; extra slots are ignored.  Returns the "
 "first argument.  Receiver is ignored.  Fails if the snapshot cannot "
 "be written (e.g, due to the disk being full, etc.).\n"
 "The fourth argument, a boolean, says whether to save compiled code in the "
 "snapshot.  Note that setting this to true does not guarantee that the code "
 "can be used when the snapshot is read."
},
{
"MethodPointer", fntype(&ov_methodPointer_prim_glue),
  ExternalPrimitive, ObjVectorPrimType,
  SIDEEFFECTS,
 "Receiver is an object vector.  If the object vector is a literal "
 "vector it returns a mirror on the method referring to the literal "
 "vector.  Otherwise the primitive fails."
},
{
"Mirror", fntype(&as_mirror_prim),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Returns a mirror on the receiver (any object).  A mirror gives a view "
 "of an object that looks like a vector of slots.  Mirrors are used to "
 "obtain information about aspects of objects that are not directly "
 "observable on the Self level, for example, the names of an object's "
 "slots or the source code of a method.\nThe object on which a mirror "
 "is created is called its reflectee.  The mirror answers all questions "
 "by inspecting its reflectee.  There are a different kinds of mirrors "
 "for different kinds of objects, but all respond to "
 "the same set of primitives (with a few "
 "exceptions).  _Mirror operates by cloning the mirror prototype "
 "appropriate for the type of its receiver, installing the receiver as "
 "the reflectee of the cloned mirror, and returning the new cloned "
 "mirror."
},
{
"MirrorAnnotation", fntype(&get_annotation_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Returns the annotation for the mirror's reflectee."
},
{
"MirrorAnnotationAt:", fntype(&annotation_at_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Returns the annotation of the slot named by the argument."
},
{
"MirrorByteCodePosition", fntype(&bci_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_WALKSTACK, // needs WALKSTACK because it looks at the stack
 "Return the current position within the method.  (Future releases will "
 "include a way to find the current source position.)"
},
{
"MirrorCodes", fntype(&codes_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Receiver is a mirror on a method.  Returns the byte code vector."
},
{
"MirrorContentsAt:", fntype(&contents_at_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_WALKSTACK,
 "Return a mirror on the contents of the specified slot of the "
 "reflectee.  The argument, a canonical string, is the name of the slot."
},
{
"MirrorCopyAt:Put:IsParent:IsArgument:Annotation:",
  fntype(&copy_add_slot_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_WALKSTACK, // conservative; not sure if really can walk stack
 "Make a copy of the mirror's reflectee with a new or changed "
 "slot.  The arguments are: the name of the slot (a string), "
 "a mirror on the new contents, "
 "if it is a parent slot, if it is an argument slot, "
 "and the annotation for the slot (an object).  "
 "If the slot already "
 "exists, its attributes and contents are replaced; if it doesn't "
 "exist, a new slot is added.  Returns a mirror on the copy.  "
 "May fail due to lack of space for the copy."
},
{
"MirrorCopyAnnotation:", fntype(&copy_set_annotation_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Make a copy of the mirror's reflectee with its annotation set to the "
 "argument.  May fail due to lack of space for the copy."
},
{
"MirrorCopyRemoveSlot:", fntype(&copy_remove_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS,
 "Make a copy of the mirror's reflectee with the named slot removed.  "
 "May fail if the reflectee cannot have the slot removed due to lack of space for the copy."
},
{
"MirrorCreateBlock",   fntype(&create_block_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Receiver is a mirror containing a block method.  Returns a block "
 "whose value slot contains the method of the receiver."
},
{
"MirrorDefine:", fntype(&mirror_define_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_WALKSTACK,  // needs WALKSTACK because it includes a define
 "The mirror version of _Define:.  The receiver is a mirror on the "
 "object to be changed, the argument is an object defining the new "
 "contents.  Can fail due to lack of space."
},
{
"MirrorEvaluate:", fntype(&evaluate_in_context_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_CANABORT,
 "Receiver is a mirror.  Takes a mirror on a method as "
 "argument.  Evaluates the method in the context of the reflectee of "
 "the receiver."
},
{
"MirrorExpressionStack", fntype(&expr_stack_prim_glue),
  ExternalPrimitive, ObjVectorPrimType,
  SIDEEFFECTS_WALKSTACK, // needs WALKSTACK to look up the stack
 "Return a vector containing the values of all expressions of a "
 "statement which have been evaluated but not yet consumed by any "
 "message send.  For example, if an activation were suspended just "
 "before sending the `+' message in the statement i: i + 1, the "
 "expression stack would contain i and 1."
},
{
"MirrorFile", fntype(&file_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Receiver is a mirror on a method.  Returns the file name from where "
 "the method was parsed.  Methods parsed at the prompt yields "
 "'<prompt>'."
},
{
"MirrorIsArgumentAt:", fntype(&is_argument_at_prim_glue),
  ExternalPrimitive, BooleanPrimType,
  SIDEEFFECTS_WALKSTACK,
 "Test if the specified slot is an argument slot.  The argument, a "
 "canonical string, is the name of the slot being tested."
},
{
"MirrorIsAssignableAt:", fntype(&is_assignable_at_prim_glue),
  ExternalPrimitive, BooleanPrimType,
  SIDEEFFECTS_WALKSTACK,
 "Test if the specified slot is assignable.  The argument, a "
 "canonical string, is the name of the slot being tested."
},
{
"MirrorIsParentAt:", fntype(&is_parent_at_prim_glue),
  ExternalPrimitive, BooleanPrimType,
  SIDEEFFECTS_WALKSTACK,
 "Test if the specified slot is a parent slot.  The argument, a "
 "canonical string, is the name of the slot being tested."
},
{
"MirrorLexicalParent", fntype(&parent_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_WALKSTACK, // needs WALKSTACK to look up the stack
 "If the reflectee of the receiver is a block activation, return the "
 "activation corresponding to the lexically enclosing scope.  This "
 "primitive will fail for method activations, since method activations "
 "have no lexically enclosing scope."
},
{
"MirrorLine", fntype(&line_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Receiver is a mirror on a method.  Returns the line in which the "
 "method was parsed."
},
{
"MirrorLiterals", fntype(&literals_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Receiver is a mirror on a method.  Returns the literal vector."
},
{
"MirrorMethodHolder", fntype(&methodHolder_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_WALKSTACK, // needs WALKSTACK to look up the stack
 "Return the activation's method holder, i.e., the object containing "
 "the slot whose evaluation created this activation."
},
{
"MirrorNames", fntype(&names_prim_glue),
  ExternalPrimitive, ObjVectorPrimType,
  SIDEEFFECTS_WALKSTACK, // could be vframe oop,see mirror_names comment
 "Return a vector containing the names of all the slots of the "
 "reflectee."
},
{
"MirrorNameAt:", fntype(&name_at_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_WALKSTACK,
 "Return the name of the local slot at index, for read/write local bytecodes."
},
{
"MirrorReceiver", fntype(&receiver_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_WALKSTACK, // needs WALKSTACK to look up the stack
 "Return the receiver of this activation."
},
{
"MirrorReflectee", fntype(&get_reflectee_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Return this mirror's reflectee.  Fails if invoked on a mirror on a "
 "method."
},
{
"MirrorReflecteeEq:", fntype(&reflectee_eq_prim),
  ExternalPrimitive, BooleanPrimType,
  NOSIDEEFFECTS,
 "Test if the receiver and argument are mirrors on the same "
 "object.  See _Eq:."
},
{
"MirrorReflecteeIdentityHash",  
  fntype(&reflectee_id_hash_prim),
  ExternalPrimitive, IntegerPrimType,
  NOSIDEEFFECTS,  
 "Return the identity hash of the reflectee of the receiver.  See "
 "_IdentityHash."
},
{
"MirrorSelector", fntype(&selector_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_WALKSTACK, // needs WALKSTACK to look up the stack
 "Return the name of the activation, i.e., the selector of the slot in "
 "which the activation's method is stored."
},
{
"MirrorSender", fntype(&sender_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_WALKSTACK, // needs WALKSTACK to look up the stack
 "Return a mirror on the sender activation, i.e., the activation which "
 "created the receiver activation.  This primitive will fail if the "
 "activation was created by the VM (e.g., for a doIt method)."
},
{
"MirrorSize", fntype(&size_prim_glue),
  ExternalPrimitive, IntegerPrimType,
  SIDEEFFECTS,
 "Return the number of bytes the reflectee occupies in the heap."
},
{
"MirrorSource", fntype(&source_prim_glue),
  ExternalPrimitive, StringPrimType,
  SIDEEFFECTS,
 "Receiver is a mirror on a method.  Returns the source code of the "
 "method as a string.  If the method is nested in another (e.g., is a "
 "block), then the string may contain source of the enclosing code.  "
 "Use _MirrorSourceOffset and _MirrorSourceLength to determine the "
 "appropriate substring; if _MirrorSourceOffset is non-zero, then take "
 "the substring defined by offset and length, otherwise take the whole "
 "string."
},
{
"MirrorSourceOffset", fntype(&source_offset_prim_glue),
  ExternalPrimitive, IntegerPrimType,
  SIDEEFFECTS,
 "In combination with _MirrorSource (q.v.) and _MirrorSourceLength can be "
 "used to get the source of a method."
},
{
"MirrorSourceLength", fntype(&source_length_prim_glue),
  ExternalPrimitive, IntegerPrimType,
  SIDEEFFECTS,
 "In combination with _MirrorSource (q.v.) and _MirrorSourceOffset can be "
 "used to get the source of a method."
},
{
"NewProcessSize:Receiver:Selector:Arguments:", fntype(&NewProcess_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS,
 "Returns a new process object which is obtained by cloning the "
 "current process object. The new process is not started. The first "
 "argument is an integer giving a minimal stack size in bytes; the "
 "system may actually allocate more stack space. The right size "
 "depends on the future behavior of the process so some "
 "experimentation may be necessary. A good first try could be 64"
 "Kb. The last two arguments are analogous to the arguments of "
 "_Perform:With:. They determine the first message that the process"
 "sends when it is started. The receiver of "
 "_NewProcessSize:Selector:Arguments will also be the receiver of the "
 "first message send of the new process."
},
{
"NoOfArgs", fntype(&get_noOfArgs_prim_glue),
 ExternalPrimitive, IntegerPrimType,
 SIDEEFFECTS,
 "Receiver is a fctProxy.  Return how many arguments should be supplied "
 "when calling this function.  The value -1 designates a function that "
 "takes a variable number of arguments."
},
{
"NoOfArgs:", fntype(&set_noOfArgs_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Receiver is a fctProxy.  Set how many arguments it should take when "
 "called.  The value -1 will allow it to be called with any number of "
 "arguments.  Warning: this call is potentially dangerous, since no "
 "attempt is done at checking that the given value is "
 "reasonable.  Returns receiver.  Calls the foreign routine it "
 "represents, and return its return value converted to a Self "
 "object."
},
{
"ObjectID", fntype(&objectID_prim_glue),
 ExternalPrimitive, IntegerPrimType,
 SAFE_SIDEEFFECTS,
 "Returns the reference number of the receiver, assigning one if "
 "necessary.  _ObjectID is the reverse to _AsObject"
},
{
 "OnNonLocalReturn:", fntype(&oopClass::unwind_protect_prim),
 UnwindProtectPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "Sends 'value' to the receiver; "
 "if this returns V normally, then return V as the result of the primitive.  "
 "Otherwise, it attempts to return V non-locally, or aborts; if so "
 "send 'value: V' to the first argument of the primitive.  "
 "If this in turn returns V', normally or non-locally, then "
 "continue the original non-local-return/abort with V' as the value "
 "returned.  Otherwise, continue aborting."
},
{
"OperatingSystem", fntype(&operating_system_prim_glue),
 ExternalPrimitive, StringPrimType,
 SAFE_NONIDEMPOTENT,
 "Returns a string describing the operating system.  The receiver is "
 "ignored."
},
{
"ParseObjectFileName:ErrorObj:",
 fntype(&parseObject_prim_glue),
 ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_CANABORT,
 "Parse the receiver, a string, as a Self object.  The argument"
 "filename is used to annotating parsed methods with "
 "source code information.  The last argument is an object for the  "
 "parse error information.  Returns the object created by the parser.  "
 "Can fail due to lack of space."
},
{
"ParseObjectIntoPositionTable",
 fntype(&parseObjectIntoPositionTable_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "Receiver is the source code for a method (a string, typically obtained "
 "using _MirrorSource).  Returns a vector containing two elements for "
 "each byte code associated with the method.  For each byte code these "
 "two elements describe the corresponding text selection in the source "
 "code.  The first element is the selection start in the source, the "
 "second is the length of the selection."
},
{
"Perform:",
 fntype(0),
 NotReallyAPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "Sends the unary message named by the first argument (a canonical string) to the "
 "receiver, and returns the result.\n"
 "Example: x _Perform: 'foo'  has exactly the same semantics as  x foo.\n"
 "_Performs never evaluate their IfFail: argument upon failure (in the case "
 "where the IfFail: extension is used); instead, one of the runtime message "
 "lookup errors will be invoked.  These messages are peculiar to "
 "_Perform:\n"
 "mismatchedArgumentCountSelector:Type:Delegatee:MethodHolder:Arguments: is "
 "used when the number of arguments does not match that specified by the "
 "selector, e.g. x _Perform: '+'.\n"
 "performTypeErrorSelector:Type:Delegatee:MethodHolder:Arguments: is used "
 "when the selector is not a canonical string, e.g., x _Perform: nil.\n"
},
{
"Perform:With:",
 fntype(0),
 NotReallyAPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _Perform:, except that the selector must be a binary or "
 "one-argument keyword selector, and the second argument to the primitive "
 "is passed as the argument to the message.\n"
 "Example:  x _Perform: '+' With: 3  is identical to  x+3."
},
{
"Perform:With:With:",
 fntype(0),
 NotReallyAPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _Perform:, except that the selector must be a "
 "two-argument keyword selector, and the second and third arguments to the primitive "
 "are passed as the arguments to the message.  Adding more With:s adds more "
 "arguments.\n"
 "Example:  x _Perform: 'foo:Bar:' With: 3 With: nil  is identical to  x "
 "foo: 2 Bar: nil."
},
{
"PerformResend:",
 fntype(0),
 NotReallyAPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _Perform:, except that it performs an undirected resend.\n"
 "Example: x _PerformResend: 'foo'  has exactly the same semantics as  x "
 "resend.foo.\n"
 "In the current implementation you cannont `perform' a directed resend."
},
{
"PerformResend:With:",
 fntype(0),
 NotReallyAPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _PerformResend:, except that the selector must be a binary or "
 "one-argument keyword selector, and the second argument to the primitive "
 "is passed as the argument to the message."
},
{
"Perform:With:With:",
 fntype(0),
 NotReallyAPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _PerformResend:, except that the selector must be a "
 "two-argument keyword selector, and the second and third arguments to the primitive "
 "are passed as the arguments to the message.  Adding more With:s adds more arguments."
},
{
"Perform:DelegatingTo:",
 fntype(0),
 NotReallyAPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "This primitive performs a delegated send.  "
 "It sends the unary message named by the first argument (a canonical string) to the "
 "receiver, but lookup starts in the second argument.  Any references to self "
 "in the resulting method will refer to the receiver of the _Perform."
},
{
"Perform:DelegatingTo:With:",
 fntype(0),
 NotReallyAPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _Perform:DelegatingTo:, except that the selector must be a binary or "
 "one-argument keyword selector, and the third argument to the primitive "
 "is passed as the argument to the message."
},
{
"Perform:DelegatingTo:With:With:",
 fntype(0),
 NotReallyAPrimitive, UnknownPrimType,
 SIDEEFFECTS_CANABORT,
 "Similar to _Perform:DelegatingTo:, except that the selector must be a "
 "two-argument keyword selector, and the third and fourth arguments to the primitive "
 "are passed as the arguments to the message.  Adding more With:s adds more "
 "arguments."
},
{
"PrimitiveDocumentation",
 fntype(&primitive_documentation_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS,
 "Receiver is a name of a primitive, a string. "
 "Returns the documentation string for the primitive."
},
{
"PrimitiveList",
 fntype(&primitive_list_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS,
 "Returns a vector containing the names of all primitives.  "
 "Receiver is ignored.  May fail due to lack of space."
},
{
"Print", fntype(&print_prim_glue),
 ExternalPrimitive, UnknownPrimType,
 SAFE_SIDEEFFECTS,
 "Print the receiver in a low-level format and return nil."
},
{
"PrintDebugSpace", fntype(&PrintDebugSize_prim),
 ExternalPrimitive, IntegerPrimType,
 SAFE_SIDEEFFECTS,
 "For internal consumption only."
},
{
"PrintEventLog:", fntype(&printEvent_prim),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "For internal consumption only."
},
{
"PrintFlatProfile:", fntype(&PrintFlatProfile_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Print the flat profile; the argument is an integer specifying how "
 "many lines should be printed.  The profile shows the time consumed by "
 "each compiled method (including the time consumed by any methods "
 "inlined into the compiled method, but not including any time spent "
 "in the VM)."
},
{
"PrintMemory", fntype(&print_memory_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SAFE_SIDEEFFECTS,
 "Print low-level debugging information about the memory system."
},
{
"PrintMemoryHistogram:", fntype(&print_memory_histogram_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Prints out two histograms.  The first one is based on VM object "
 "types, the second based on the word size of the objects.  The "
 "argument is a number defining the upper limit size in the second "
 "histogram."
},
{
"PrintNMethodCode", fntype(&printNMethodCode_prim),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "For internal consumption only."
},
{
"PrintNMethodHistogram:", fntype(&print_nmethod_histogram_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "For internal consumption only."
},
{
"PrintSlotStats", fntype(&print_slot_stats_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Print slot statistics."
},
{
"PrintZoneStats", fntype(&print_zone_stats_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Print zone statistics in short form."
},
{
"PrintOptionPrimitives", fntype(&print_option_primitives_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SAFE_SIDEEFFECTS,
 "Print a list of the available option primitives with a short "
 "explanation of their function and their current settings."
},
{
"PrintChangedOptionPrimitives", fntype(&print_changed_option_primitives_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SAFE_SIDEEFFECTS,
 "Print a list of the available option primitives with a short "
 "explanation of their function and their current settings "
 "that have been changed from their defaults."
},
{
"PrintPICHistogram", fntype(&pic_histogram_prim),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "For internal consumption only."
},
{
"PrintProcessStack", fntype(&PrintProcessStack_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS_CANABORT, // needs WALKSTACK to look up the stack, CANABORT so you can interrupt it
 "Print the stack of the process associated with the receiver (a "
 "process object).  The number of stack frames printed is determined by "
 "_StackPrintLimit."
},
{
"PrintProfileCutoff:Skip:MaxDepth:", fntype(&PrintProfile_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Print the profile.  Subtrees of the call tree using a smaller "
 "fraction of the total time than cutoff (specified as a float, "
 "e.g., 0.02 = 2%) will be suppressed.  Furthermore, a method will only "
 "be displayed if its time (including the time of its callees) differs "
 "by more than skip from its caller.  MaxDepth (an integer) specifies "
 "the maximum call depth to be displayed.  As in the flat profile, an "
 "inlined method is charged to its caller (i.e., inlining is not "
 "transparent)."
},
{
"PrintVMObj", fntype(&printVMObj_prim),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "For internal consumption only."
},
{
"ProcessReturnValue", fntype(&ProcessReturnValue_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 NOSIDEEFFECTS,
 "Receiver is a process.  Returns the result of the expression "
 "evaluated in the process if the process has terminated.  The return "
 "value is undefined if the process is still active."
},
{
"Profile:", fntype(&Profile_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SAFE_SIDEEFFECTS,
 "Receiver is a process.  Activate/deactivate profiling of Self code "
 "executed by the receiver.  The argument is boolean, true activates "
 "the profiler.  Profiling incurs little run-time overhead.  By default "
 "profiling on a process is deactivated."
},
{
"ProfilerCopyGraphMethod:Block:Access:Prim:Leaf:Fold:Unknown:Cutoff:",
 fntype(&ProfilerCopyGraph_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Receiver is a profiler.  Returns a Self-level copy of the VM-level "
 "call graph created using _ProfilerEngage: and _ProfilerDisengage.  "
 "All but the penultimate argument are prototypes for the different kinds of "
 "call graph nodes.  The penultimate argument is used for reconstructing a "
 "dummy receiver object in case the receiver type of a node has no "
 "corresponding object. The last argument gives a percentage of total time.  "
 "Nodes smaller than that will not be copied."
},
{
"ProfilerDisengage", fntype(&ProfilerDisengage_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Receiver is a profiler.  Stops profiling the profiled process."
},
{
"ProfilerEngage:", fntype(&ProfilerEngage_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Receiver is a profiler and argument a process.  Starts profiling."
},
{
"ProfilerPrint:", fntype(&ProfilerPrint_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Receiver is a profiler.  Prints the VM-level call graph."
},
{
"ProfilerProcess", fntype(&ProfilerProcess_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Receiver is a profiler.  Returns the process currently being "
 "profiled."
},
{
"ProfilerReset", fntype(&ProfilerReset_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Receiver is a profiler.  Frees all VM-level state associated with the "
 "profiler."
},
{
"ProfilerTicks:", fntype(&ProfilerTicks_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Receiver is a profiler and argument a prototype for the tick "
 "information.  Returns a copy of the prototype with tick "
 "statistics.  The following data slots will be assigned by the "
 "primitive (unit is ticks):\n inSelf - executing Self code\n inPrim - "
 "executing primitives.\ninLookup - performing lookup.\n inSemaphore - "
 "unable to collect stack.  (switching process or inside the "
 "profiler)"
},
{
"ProfilerTimes:", fntype(&ProfilerTimes_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Receiver is a profiler and argument a prototype for the time "
 "information.  Returns a copy of the prototype with time "
 "statistics.  The following data slots will be assigned by the "
 "primitive (unit is milliseconds):\n runtime - program execution.\n "
 "collect - collecting stack samples\n build - constructing the "
 "VM-level call graph.\n monitor - spy.\n compile - compiling.\n "
 "recompile - recompiling.\n uncommon - compiling uncommon branches.\n "
 "scavenge - scavenges.\n garbageCollect - total garbage "
 "collections.\n methodCompact - compacting the instruction cache.\n "
 "methodFlush - flushing compiled methods."
},
{
  "ProgrammingTimestamp", fntype(&programming_timestamp_prim_glue),
  ExternalPrimitive, IntegerPrimType,
  SAFE_NONIDEMPOTENT,
 "Returns a count from the VM of the number of define's that have been "
 "executed.  Used by the pathCache to stay up to date."
},
{
  "SetProgrammingTimestamp", fntype(&set_programming_timestamp_prim_glue),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
 "Sets the count in the VM of the number of define's that have been "
 "executed.  Used by the pathCache to stay up to date."
},
{
"Quit", fntype(&quit_prim_glue),
 ExternalPrimitive, NoReturnPrimType,
 SAFE_SIDEEFFECTS,
 "Quit the system (equivalent to typing ^D (control-D) at the "
 "VM prompt).  The state of the world is not saved."
},
{
"RecompileLimits", fntype(&get_recompile_limits_prim_glue),
 ExternalPrimitive, ObjVectorPrimType,
 NOSIDEEFFECTS,
 "For internal consumption only."
},
{
"RemoveAllSlots", fntype(&remove_all_slots_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS_WALKSTACK, // needs WALKSTACK because it includes a define
 "Removes all slots from the receiver.  Fails if the receiver is a "
 "smallInteger, string, block or float.  May fail due to lack of space "
 "(I am not kidding)."
},
{
"RemoveSlot:", fntype(&remove_slot_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS_WALKSTACK, // needs WALKSTACK because it includes a define
 "Remove the designated slot from the receiver (the argument is a "
 "string, the name of the slot).  May fail due to lack of space (yes, really)."
},
{
"ResetFlatProfile", fntype(&ResetFlatProfile_prim),
 ExternalPrimitive, ReceiverPrimType,
 SAFE_SIDEEFFECTS,
 "Reset the flat profile counters in order to start new "
 "measurements."
},
{
"ResetProfile", fntype(&ResetProfile_prim),
 ExternalPrimitive, ReceiverPrimType,
 SAFE_SIDEEFFECTS,
 "Reset the profile counters in order to start new measurements."
},
{
"ResetSpyLog", fntype(&SelfMonitor::resetLog_prim),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "For internal consumption only."
},
{
"Restart", 0,
 RestartPrimitive, UnknownPrimType,
 false, true, false, true, true, true,
 "Restart the current method, i.e., jump to the beginning of the "
 "method.  Used to implement looping in blocks."
},
{
"RunScript", fntype(&run_script_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS_CANABORT,
 "Read in the file containing a list of Self expressions and evaluate "
 "the expressions.  The receiver "
 "is a string naming the file to be read.  Returns the result of the "
 "last expression on the file."
},
{
"SamePointerAs:", fntype(&same_pointer_as_glue),
 ExternalPrimitive, BooleanPrimType,
 SIDEEFFECTS,
 "The receiver and argument must both be proxy or fctProxy "
 "objects.  Returns true iff they encapsulate the same pointers."
},
{
"Scavenge", fntype(&scavenge_prim),
 ExternalPrimitive, ReceiverPrimType,
 false, true, false, true, false, false,
 "Force a scavenge (a fast, partial garbage collection; see [Ung84],"
 "[Ung86], [Lee88])."
},
{
"SetCPUTimer", fntype(&setCPUTimer_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Similar to _SetRealTimer, but sets the CPU timer."
},
{
"SetRealTimer", fntype(&setRealTimer_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Set real-time interval timer.  The receiver is an integer denoting "
 "the number of milliseconds per interval."
},
{
"Size", fntype(&ov_size_prim),
 SizePrimitive, IntegerPrimType,
 NOSIDEEFFECTS,
 "Returns an integer, the number of elements in the receiver object "
 "vector."
},
{
"StackDepth", fntype(&StackDepth_prim_glue),
 ExternalPrimitive, IntegerPrimType,
 SIDEEFFECTS_WALKSTACK,     // treat as side-effecting because it can't be const, need walking for Mac
 "Return the number of activations on the process' stack."
},
{
"StringCanonicalize", fntype(&string_canonicalize_prim_glue),
 ExternalPrimitive, StringPrimType,
  NOSIDEEFFECTS,
 "Return the canonical version of the receiver (a byte vector).  All "
 "byte vectors containing the same sequence of bytes map to the same "
 "canonical string object, and only one canonical string object with a "
 "particular sequence of bytes ever exists in the system.  Therefore, "
 "two canonical strings can be tested for equality efficiently using "
 "_Eq: rather than by comparing byte-by-byte.  All string literals are "
 "canonical strings."
},
{
"StringPrint", fntype(&string_print_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Print the characters of the receiver, a byte vector, on "
 "stdout.  Returns the receiver."
},
{
"TWAINSResultSize", fntype(&TWAINSResultSize_prim_glue),
 ExternalPrimitive, IntegerPrimType,
 SIDEEFFECTS_CANABORT,
 "Maximum size required of the second argument of "
 "_TWAINS:ResultVector:."
},
{
  "TestA1:A2:A3:A4:A5:A6:A7:A8:A9:A10:A11:A12:A13:A14:A15:A16:", 
  fntype(&test_args_prim),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS_WALKSTACK,
  "Takes a bunch of arguments and tests things."
},
{
"TWAINSResultVector:SingleStep:StopAt:", fntype(&TWAINS_prim_glue),
 ExternalPrimitive, StringPrimType,
 SIDEEFFECTS_CANABORT,
 "Transfer and wait for next signal.  The receiver is a process "
 "object to transfer to. \nThe first argument must be an object vector "
 "of size at least _TWAINSResultSize.  Control is "
 "transferred to the indicated process.  When control is transferred "
 "back the return value indicates the cause of the transfer: "
 "'aborted', 'stackOverflow', 'nonLifoBlock', 'yielded', 'lowOnSpace', "
 "'couldntAllocateStack' or 'signal'.  The result vector is used to provide "
 "additional information.  If the cause is 'signal', the first element of the "
 "result vector is modified to contain the number of signals and the "
 "rest of the result vector is modified to contain a list of the "
 "signals that accumulated in between returns from the primitive.  The "
 "possible signals are: 'sigint', 'sigquit', 'sighup', 'sigwinch', "
 "'sigio', 'siguser1', 'siguser2', 'sigpipe', 'sigterm', 'sigurg', "
 "'sigchild', 'sigrealtimer' and 'sigcputimer'.\nThe third argument "
 "must be either true or false and specifies whether the process is to "
 "execute in single-stepping mode.  If the argument is true, the "
 "process will execute at most one message send before returning with "
 "a value of 'singleStepped'.  (If a signal occurs before the send "
 "could be executed, i.e., if the return value is 'signal', no step was "
 "executed.)\nThe last argument is either nil or a \"stop\" "
 "activation.  In the latter case, the process will stop with a return "
 "value of 'finishedActivation' as soon as this activation finishes "
 "(the activation must be a \"live\" activation of the process).  Note "
 "that TWAINS may return before this occurs (e.g., because of a "
 "signal)."
},
{
"Tenure", fntype(&tenure_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 false, true, false, true, false, false,
 "Tenure all objects.  Force the memory management system to move all "
 "objects into the old heap.  Receiver is ignored."
},
{
"ThisProcess", fntype(&ThisProcess_prim),
 ExternalPrimitive, UnknownPrimType,
 SAFE_NONIDEMPOTENT,
 "Return process object of current process.  Ignores receiver."
},
{
"TimeCPU", fntype(&cpu_time_glue),
  ExternalPrimitive, IntegerPrimType,
  SAFE_SIDEEFFECTS,
 "Returns the total CPU time (in milliseconds) used by the Self system "
 "(identical to _TimeUser + _TimeSystem).  Ignores receiver."
},
{
"TimeReal", fntype(&real_time_prim_glue),
  ExternalPrimitive, ObjVectorPrimType,
  SIDEEFFECTS,
 "Returns a 2-element vector representing the real time and date, "
 "measured from 00:00 UTC, Jan 1, 1970.  "
 "The first element is the integer number of days, and the second element "
 "is the integer number of milliseconds since midnight, UTC.  "
 "Ignores the receiver."
},
{
"TimeSystem", fntype(&system_time_glue),
  ExternalPrimitive, IntegerPrimType,
  SAFE_SIDEEFFECTS,
 "Returns the system time (in milliseconds) used by the Self "
 "system.  Ignores the receiver."
},
{
"ConvertToDayMs", fntype(&convert_to_day_ms_prim_glue),
  ExternalPrimitive, ObjVectorPrimType,
  SIDEEFFECTS, 
 "Receiver is a vector with 8 integers describing a time: "
 "year, month, date, weekday, hour, minute, second, daylight savings (-1, 0, +1). "
 "Returns a vector with two equivalent integers: days and milliseconds since "
 "1/1/70 0:00:00 (like the unix function mktime). This primitive is approximately "
 "the inverse of _DateTime."
},
{
"TimeUser", fntype(&user_time_glue),
  ExternalPrimitive, IntegerPrimType,
  SAFE_SIDEEFFECTS,
 "Returns the user time (in milliseconds) used by the Self "
 "system.  Ignores the receiver."
},
{
"TypeSealResultProxy:", fntype(&get_type_seal_glue),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS,
 "Receiver is a proxy or fctProxy object.  Return proxy representing "
 "type seal of receiver."
},
{
"Verify", fntype(&verify_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 true, true, false, true, true, false,
 "Verify the integrity of the Self virtual machine."
},
{
"VerifyOptions", fntype(&verify_opts_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Select which parts of the system the _Verify primitive will check.  "
 "The receiver is a byte vector containing characters to enable specific checks:\n"
 "\te - verify eden\n"
 "\ts - verify survivor spaces\n"
 "\tn - verify new generation (implies 'e' and 's')\n"
 "\to - verify old generation\n"
 "\tz - verify zone\n"
 "\tp - verify processes\n"
 "\tr - verify remembered set\n"
 "\tS - verify string table\n"
 "\tv - verify VM strings\n"
 "\tO - verify VM oops\n"
 "\tm - verify VM maps\n"
 "\tN - verify new maps\n"
 "\tM - verify map table.\n"
 "\ti - verify block slot iterator.\n"
},
{
"VMversion", fntype(&VMversion_prim),
 ExternalPrimitive, UnknownPrimType,
 SIDEEFFECTS,
 "Returns a three-element vector containing the VM (major,minor,snapshot) "
 "version numbers."
},
{
"WriteSnapshot", fntype(&write_snapshot_prim_glue),
 ExternalPrimitive, ReceiverPrimType,
 SIDEEFFECTS,
 "Write a snapshot to the file named by the receiver, a byte vector.  "
 "Returns the receiver."
},
{
"Yield:", fntype(&Yield_prim),
 ExternalPrimitive, ReceiverPrimType,
  false, true, false, true, true, true,
 "Gives up the CPU.  Control is returned to the TWAINS process.  Ignores "
 "receiver."
},
{
"ZombieProcesses", fntype(&zombie_prim_glue),
 ExternalPrimitive, ObjVectorPrimType,
 SIDEEFFECTS,
 "Returns a vector of processes that were unreachable at the last "
 "garbage collection.  This is only guaranteed to be valid immediately "
 "after a GC.  Receiver is ignored."
},
# ifdef SIC_COMPILER
{
    "SICParamsAt:", fntype(&get_sic_params_prim_glue),
    ExternalPrimitive, ObjVectorPrimType,
    SIDEEFFECTS,
    "For internal consumption only"
},
{
    "SICParamsAt:Put:", fntype(&set_sic_params_prim_glue),
    ExternalPrimitive, ObjVectorPrimType,
    SIDEEFFECTS,
    "For internal consumption only"
},
#  ifndef NOASM
{
    "ITrace:", fntype(&itrace_prim),
    ExternalPrimitive, ReceiverPrimType,
    SIDEEFFECTS,
    "For internal consumption only"
},
#  endif
# endif

{
    "SpyHeight", fntype(&monitor_height_prim_glue),
    ExternalPrimitive, IntegerPrimType,
    true, false, false, false, false, false,
    "Return the height (in pixels) of the screen area used by the "
    "system monitor."
},


# ifdef DYNLINK_SUPPORTED
{
      "Dlopen:ResultProxy:", fntype(&dlopen_wrap_glue),
      ExternalPrimitive, UnknownPrimType,
      SIDEEFFECTS,
      "This primitive corresponds to the Sun OS call dlopen. It "
      "dynamically links in a shared object file.  The receiver is a "
      "byte vector, the path of the shared object, the argument is an "
      "integer.  The last argument is a proxy object.  Returns the "
      "result proxy object, representing the loaded shared object."
},
{
      "Dlsym:ResultProxy:", fntype(&dlsym_wrap_glue),
      ExternalPrimitive, UnknownPrimType, SIDEEFFECTS,
      "The primitive corresponds to the Sun OS call dlsym().  It looks "
      "up a symbol address in a shared object.  The receiver is a proxy "
      "representing the shared object, the argument is a byte vector, "
      "the name of the symbol.  Note that symbol names in object files "
      "are not always exactly the same as in source code.  For example, "
      "the C convention is to prepend a '_' to the name in the object "
      "file.  The last argument is a proxy object.  Returns the result "
      "proxy with the address of the symbol."
},
{
      "Dlclose", fntype(&dlclose_wrap_glue),
      ExternalPrimitive, IntegerPrimType,
      SIDEEFFECTS,
      "The primitive corresponds to the Sun OS call dlclose().  It "
      "unlinks a shared object.  The receiver is a proxy.  "
      "Returns 0 if successful."
},
{
      "FctLookup:ResultProxy:", fntype(&fctLookup_glue),
      ExternalPrimitive, UnknownPrimType,
      SIDEEFFECTS,
      "This primitive is similar to _Dlsym:ResultProxy:.  However, it "
      "looks up a function and returns a fctProxy rather than a "
      "proxy.  Warning: no attempt is made to ensure that the given "
      "name really refers to a function."
},
{
      "NoOfArgsFct:", fntype(&noOfArgsFct_glue),
      ExternalPrimitive, IntegerPrimType,
      SIDEEFFECTS,
      "The receiver is a proxy representing a shared object, the "
      "argument is the name of a function defined using glue code in "
      "the shared object.  Returns the number of arguments this "
      "function takes.  Note: the call will always return -1 for "
      "functions not defined using glue code."
},
# endif

# define  IN_PRIM_TABLE // makeDeps will include these files up top, too
# include "prim_table_arch.hh"
# include "prim_table_os.hh"
# include "prim_table_quartz.hh"
# undef   IN_PRIM_TABLE


#ifdef stat_entries
stat_entries
#endif

#ifdef termcap_entries
termcap_entries
#endif

#ifdef transcendental_entries
transcendental_entries
#endif

#ifdef xlib_entries
xlib_entries
#endif

LARGE_INT_PRIM_TABLE_ENTRIES

{
  // must be last entry in each prim table
  0, fntype(&bad_prim),
  ExternalPrimitive, UnknownPrimType,
  true, false, false, true, false, false,
  ""
}
  };

// two prim tables because cfront runs out of input buffer space
static PrimDesc fntable2[] = {

# ifdef XLIB
    // Xlib primitives that are actual X calls must have canAbortProcess and
    // canWalkStack (and therefore canScavenge) set to true, because an
    // X error can abort Xlib calls.  See xError.c. -- Bay
    // That is why we use canAWS in the primMaker templates. -- Dave
{
    "XOpenDisplayResultProxy:", fntype(&XOpenDisplay_glue),
    ExternalPrimitive, UnknownPrimType,
    SIDEEFFECTS_CANABORT,
    "The receiver is a string (the X display name that you want to open a "
    "connection on).  The argument is a dead proxy (xlib display)."
},
{
    "XCloseDisplay", fntype(&XCloseDisplay_glue),
    ExternalPrimitive, UnknownPrimType,
    SIDEEFFECTS_CANABORT,
    "The receiver is a proxy (xlib display that was returned by "
    "_XOpenDisplayResultProxy:)"
},
# endif

# if GCC
  // define debug prims last 'cause they mess up indentation
  # define DefineDebugPrim(                                                     \
    flagName, flagType, flagTypeName, primReturnType,                         \
    initialValue, getCurrentValue, checkNewValue, setNewValue,                \
    explanation, wizardOnly)                                                  \
                                                                              \
    {XSTR(flagName), fntype(&CONC3(get_,flagName,_prim)),                     \
    ExternalPrimitive, primReturnType,  SAFE_SIDEEFFECTS,                     \
    "Simple "  flagTypeName  " primitive: "  explanation },                   \
    {XSTR(flagName:), fntype(&CONC3(set_,flagName,_prim)),                    \
    ExternalPrimitive, primReturnType, SIDEEFFECTS,                           \
    "Simple "  flagTypeName  " primitive: "  explanation},                    
# else
  // define debug prims last 'cause they mess up indentation
  # define DefineDebugPrim(                                                     \
    flagName, flagType, flagTypeName, primReturnType,                         \
    initialValue, getCurrentValue, checkNewValue, setNewValue,                \
    explanation, wizardOnly)                                                  \
                                                                              \
    {XSTR(flagName), fntype(&CONC3(get_,flagName,_prim)),                     \
    ExternalPrimitive, primReturnType,                                        \
    SAFE_SIDEEFFECTS,                                                         \
    "Simple " ## flagTypeName ## " primitive: " ## explanation},              \
    {XSTR(CONC(flagName,:)), fntype(&CONC3(set_,flagName,_prim)),             \
    ExternalPrimitive, primReturnType, SIDEEFFECTS,                           \
    "Simple " ## flagTypeName ## " primitive: " ## explanation},
# endif

    FOR_ALL_DEBUG_PRIMS(DefineDebugPrim)
# undef DefineDebugPrim
          
  // must be last entry in each prim table
{
  0, fntype(&bad_prim),
  ExternalPrimitive, UnknownPrimType,
  SIDEEFFECTS,
  ""
}   
  };

static PrimDesc* fntable[] = { &fntable1[0], &fntable2[0], 0 };

PrimDesc** primDescTable() { return fntable; }

PrimDesc* getPrimDescOfSelector(stringOop selector, bool internal) {
  char* s = selector->bytes();
  fint l = selector->length();
  return getPrimDescOfBytes(s, l, internal);
}

PrimDesc* getPrimDescOfBytes(const char* s, fint len, bool internal) {
  assert(str_is_prim_name(s, len), "primitive doesn't begin with a '_'");
  s++, len--;
  PrimDesc* e;
  for (PrimDesc** ft = &fntable[0]; *ft; ft++) {
    for (e = *ft; e->name(); e++) {
      if (strncmp(s, e->name(), len) == 0 && e->name()[len] == '\0') {
        if (   (e->type() == InternalPrimitive && !internal)
            || e->type() == NotReallyAPrimitive) {
          goto error;
        } else {
          goto done;
        }
      }
    }
  }
 error: ;
  // set e to the 0 primitive entry (bad primitive)
  e = &fntable1[sizeof(fntable1)/sizeof(PrimDesc) - 1];
 done: ;
  e->verify();
  return e;
}

// for the run-time system
PrimDesc* getPrimDescOfFunction(fntype fn, bool internal) {
  return getPrimDescOfFirstInstruction(first_inst_addr((void*)fn), internal);
}

PrimDesc* getPrimDescOfFirstInstruction(char* fn_start_arg, bool internal) {
  // compensate for trapdoors:
  pc_t fn_start = Memory->code->trapdoors->follow_trapdoors(fn_start_arg);

  PrimDesc* e;
  for (PrimDesc** ft = &fntable[0]; *ft; ft++) {
    for (e = *ft; true; e++) {
      if ( e->fn() != 0
      &&   fn_start == first_inst_addr((void*)e->fn())) {
        if (   (e->type() == InternalPrimitive && !internal)
            || e->type() == NotReallyAPrimitive) {
          return 0;
        } else {
          // NB: matches even badPrim because check for e->name() is below
          return e;
        }
      }
      if (e->name() == 0) break;        // end of table
    }
  }
  return 0;
}

const char* getPrimName(char* fn_start) {
  PrimDesc* e;
  for (PrimDesc** ft = &fntable[0]; *ft; ft++) {
    for (e = *ft; e->name(); e++) {
      if (first_inst_addr((void*)e->fn()) == fn_start) return e->name();
    }
  }
  return first_inst_addr((void*)e->fn()) == fn_start  ? "badPrimitive" : "??";
}


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

int32 getPrimCallEndOffset(char* fn_start) {
  // offset of first instruction after prim call, measured from sendDesc ptr
  // (in bytes)
  
  // This is easy on some platforms:
  if ( sendDesc::abortable_prim_continue_offset == sendDesc::nonabortable_prim_continue_offset )
    return sendDesc::abortable_prim_continue_offset;
    
  PrimDesc* e;
  for (PrimDesc** ft = &fntable[0]; *ft; ft++) {
    for (e = *ft; true; e++) {
      if (e->fn() != 0  &&  first_inst_addr((void*)e->fn()) == fn_start) {
        int32 off =
          e->canAbortProcess() ? sendDesc::abortable_prim_continue_offset 
                               : sendDesc::nonabortable_prim_continue_offset;
        return off;
      }
      if (e->name() == 0) break;
    }
  }
  ShouldNotReachHere(); // primitive not found
  return 0;
}

# endif


# if COMPILER == gcc_pre_2_4_5
  // gcc (pre 2.4.5) has a weird code generation strategy and calls a global
  // initializer function to initialize fntable.  Since we don't want to use
  // the GNU linker, the initializer is called here explicitly.

  // The "reason" why gcc creates the initializer is the & of the functions
  // (i.e. &SendMessage_stub triggers it but SendMessage_stub doesn't).
  // To get rid of the
  // hack below, we could change all entries to omit the & (but then, gcc
  // complains about fntype(someClass::somefunc) so we'd have to get rid
  // of member functions).
  
  extern "C" void initializePrimDesc();
  
  void prim_init() { initializePrimDesc(); }
# else // compiler not gcc_pre_2_4_5
  void prim_init() { }
# endif

