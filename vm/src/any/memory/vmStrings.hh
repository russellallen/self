/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



// ErrorStrings used by vmStrings and also by ErrorCodes

// WARNING: when adding new error codes/changing the order of existing ones,
// you may need to update the file asmErrorCodes.h. 
// A consistency check is done in errorCodes.c.

# define ErrorStrings(template, project)                                      \
    project(template,PRIMITIVENOTDEFINEDERROR, "primitiveNotDefinedError",    \
    "Primitive not defined")                                                  \
    project(template,PRIMITIVEFAILEDERROR, "primitiveFailedError",            \
    "Primitive failed")                                                       \
    project(template,BADTYPEERROR, "badTypeError",                            \
    "Bad type of primitive receiver or argument(s)")                          \
    project(template,BADTYPESEALERROR, "badTypeSealError",                    \
    "Proxy's type seal did not match expected type seal")                     \
    project(template,DIVISIONBYZEROERROR, "divisionByZeroError",              \
    "Division by zero")                                                       \
    project(template,OVERFLOWERROR, "overflowError", "Overflow")              \
    project(template,BADSIGNERROR, "badSignError", "Bad sign")                \
    project(template,ALIGNMENTERROR, "alignmentError", "Bad alignment")       \
    project(template,BADINDEXERROR, "badIndexError", "Index out of range")    \
    project(template,BADSIZEERROR, "badSizeError",                            \
    "Bad size of byte vector, vector or C integer/float")                     \
    project(template,REFLECTTYPEERROR, "reflectTypeError",                    \
    "Bad type of reflectee of receiver or argument mirror")                   \
    project(template,OUTOFMEMORYERROR, "outOfMemoryError",                    \
    "Not enough memory to complete primitive")                                \
    project(template,STACKOVERFLOWERROR, "stackOverflowError",                \
    "The stack overflowed during execution of the primitive or program")      \
    project(template,SLOTNAMEERROR, "slotNameError", "Illegal slot name")     \
    project(template,BADSLOTNAMEERROR, "slotNameError",                       \
            "Slot name does not exist")                                       \
    project(template,ARGUMENTCOUNTERROR, "argumentCountError",                \
    "Wrong number of arguments")                                              \
    project(template,PARENTERROR, "parentError",                              \
    "Illegal parent priority")                                                \
    project(template,UNASSIGNABLESLOTERROR, "unassignableSlotError",          \
    "This slot cannot be assignable")                                         \
    project(template,LONELYASSIGNMENTSLOTERROR, "lonelyAssignmentSlotError",  \
    "Assignment slot must have a corresponding data slot")                    \
    project(template,PARALLELTWAINSERROR, "parallelTWAINSError",              \
    "Can't invoke TWAINS primitive (another process is already using it)")    \
    project(template,NOPROCESSERROR, "noProcessError",                        \
    "This process no longer exists")                                          \
    project(template,NOACTIVATIONERROR, "noActivationError",                  \
    "This method activation no longer exists")                                \
    project(template,NORECEIVERERROR, "noReceiverError",                      \
    "This activation has no receiver")                                        \
    project(template,NOPARENTERROR, "noParentError",                          \
    "This activation has no lexical parent")                                  \
    project(template,NOSENDERERROR, "noSenderError",                          \
    "This activation has no sender")                                          \
    project(template,DEADPROXYERROR, "deadProxyError",                        \
    "This proxy is dead (can not be passed as argument/used)")                \
    project(template,LIVEPROXYERROR, "liveProxyError",                        \
    "This proxy is live (can not be used to hold a result)")                  \
    project(template,WRONGNOOFARGSERROR, "wrongNoOfArgsError",                \
    "Wrong number of arguments was supplied with call of fctProxy")           \
    project(template,NULLPOINTERERROR, "nullPointerError",                    \
    "Foreign function returned null pointer")                                 \
    project(template,NULLCHARERROR, "nullCharError",                          \
    "Can not pass byte vector containing null char to fct expecting string")  \
    project(template,NODYNAMICLINKERERROR, "noDynamicLinkerError",            \
    "Prim. depends on dynamic linker (unsupported in this impl. of Self)")    \
    project(template,ENUMERATIONTARGETERROR, "enumerationTargetError",        \
    "The target for the enumeration is invalid")                              \
    project(template,NOPROFILINGINFOERROR, "noProfilingInfoError",            \
    "The profiler has no data samples")                                       \
    project(template,BADBRANCHERROR, "badBranchError",                        \
    "The method contains an invalid branch bytecode.")


extern stringOop VMString[];

void vmStrings_init();
#ifdef UNUSED
void VMStrings_oops_do(oopsDoFn f);
#endif
inline void VMStrings_scavenge_contents() {}
void VMStrings_gc_mark_contents();
void VMStrings_gc_unmark_contents();
void VMStrings_switch_pointers(oop from, oop to);
void VMStrings_read_snapshot(FILE* file);
void VMStrings_write_snapshot(FILE* file);
void VMStrings_relocate();
void VMStrings_verify(bool&);

// these macros are split up into pieces because the Mac can't handle more

# define VMStr_PROJECT(template,s1,s2,s3)  template(s1,s2)
# define VMStrings_DOErr1(template)     ErrorStrings(template, VMStr_PROJECT)

# define VMStrings_DO1(template)                                              \
    template(PARENT,"parent")

# define VMStrings_DO2(template)                                              \
    template(CODES,"codes")                                                   \
    template(LITERALS,"literals")                                             \
    template(FILE_NAME,"file")                                                \
    template(LINE_NUMBER,"line")                                              \
    template(SOURCE_CODE,"source")                                            \
    template(METHOD_POINTER,"methodPointer")

# define VMStrings_DO3(template)                                              \
    template(SELF,"self")                                                     \
    template(LEXICAL_PARENT,"lexical parent")                                 

# define VMStrings_DO4(template)                                              \
    template(VALUE,"value")                                                   \
    template(VALUE_,"value:")                                                 \
    template(VALUE_WITH_,"value:With:")                                       \
    template(VALUE_WITH_WITH_,"value:With:With:")                             \
    template(VALUE_WITH_WITH_WITH_,"value:With:With:With:")                   

# define VMStrings_DO5(template)                                              \
    template(BLOCK_CLONE,"_BlockClone")

# define VMStrings_DO6(template)                                              \
    template(REFLECTEE,"reflectee")                                           \
    template(DO_IT,"<top level expr>")

# define VMStrings_DO7(template)                                              \
    template(PRIMITIVE_FAILED_ERROR_NAME_,"primitiveFailedError:Name:")       

# define VMStrings_DO8(template)                                              \
    template(PLUS,"+")                                                        \
    template(MINUS,"-")                                                       \
    template(TIMES,"*")                                                       \
    template(DIVIDE,"/")                                                      \
    template(PERCENT,"%")                                                     \
    template(LESS_THAN,"<")                                                   \
    template(LESS_EQUAL,"<=")                                                 \
    template(EQUAL,"=")                                                       \
    template(NOT_EQUAL,"!=")                                                  \
    template(GREATER_EQUAL,">=")                                              \
    template(GREATER_THAN,">")                                                

# define VMStrings_DO9(template)                                              \
    template(OR,"||")                                                         \
    template(AND,"&&")                                                        \
    template(XOR,"^^")                                                        \
    template(MIN_,"min:")                                                     \
    template(MAX_,"max:")                                                     \
    template(NOT,"not")                                                       

# define VMStrings_DO10(template)                                             \
    template(SUCCESSOR,"successor")                                           \
    template(SUCC,"succ")                                                     \
    template(PREDECESSOR,"predecessor")                                       \
    template(PRED,"pred")                                                     \
    template(ABSOLUTE_VALUE,"absoluteValue")                                  \
    template(INVERSE,"inverse")                                               \
    template(NEGATE,"negate")                                                 \
    template(COMPLEMENT,"complement")                                         


# define VMStrings_DO11(template)                                             \
    template(DO_,"do:")                                                       \
    template(TO_DO_,"to:Do:")                                                 \
    template(TO_BY_DO_,"to:By:Do:")                                           \
    template(TO_BYPOSITIVE_DO_,"to:ByPositive:Do:")                           \
    template(TO_BYNEGATIVE_DO_,"to:ByNegative:Do:")                           \
    template(UP_TO_DO_,"upTo:Do:")                                            \
    template(UP_TO_BY_DO_,"upTo:By:Do:")                                      \
    template(DOWN_TO_DO_,"downTo:Do:")                                        \
    template(DOWN_TO_BY_DO_,"downTo:By:Do:")                                  

# define VMStrings_DO12(template)                                             \
    template(COMPARE_LESS_EQUAL_GREATER_,"compare:IfLess:Equal:Greater:")     \
    template(AS_FLOAT,"asFloat")                                              \
    template(WHILETRUE_,"whileTrue:")                                         \
    template(WHILEFALSE_,"whileFalse:")                                       \
    template(UNTILTRUE_,"untilTrue:")                                         \
    template(UNTILFALSE_,"untilFalse:")                                       \
    template(IF_TRUE_,"ifTrue:")                                              \
    template(IF_FALSE_,"ifFalse:")                                            \
    template(IF_TRUE_FALSE_,"ifTrue:False:")                                  \
    template(IF_FALSE_TRUE_,"ifFalse:True:")                                  

# define VMStrings_DO13(template)                                             \
    template(AT_,"at:")                                                       \
    template(AT_PUT_,"at:Put:")                                               \
    template(SIZE,"size")                                                     

# define VMStrings_DO14(template)                                             \
    template(_CLONE,"_Clone")                                                 \
    template(_CLONE_FILLER_,"_Clone:Filler:")                                 \
    template(_CLONE_0,"_Clone0")                                              \
    template(_CLONE_1,"_Clone1")                                              \
    template(_CLONE_2,"_Clone2")                                              \
    template(_CLONE_3,"_Clone3")                                              \
    template(_CLONE_4,"_Clone4")                                              \
    template(_CLONE_5,"_Clone5")                                              \
    template(_CLONE_6,"_Clone6")                                              \
    template(_CLONE_7,"_Clone7")                                              \
    template(_CLONE_8,"_Clone8")                                              \
    template(_CLONE_9,"_Clone9")                                              

# define VMStrings_DO15(template)                                             \
    template(_INT_EQ_,"_IntEQ:")                                              \
    template(_INT_NE_,"_IntNE:")                                              \
    template(_INT_LT_,"_IntLT:")                                              \
    template(_INT_LE_,"_IntLE:")                                              \
    template(_INT_GE_,"_IntGE:")                                              \
    template(_INT_GT_,"_IntGT:")                                              

# define VMStrings_DO16(template)                                             \
    template(_INT_ADD_,"_IntAdd:")                                            \
    template(_INT_SUB_,"_IntSub:")                                            \
    template(_INT_MUL_,"_IntMul:")                                            \
    template(_INT_DIV_,"_IntDiv:")                                            \
    template(_INT_MOD_,"_IntMod:")                                            \
    template(_INT_AND_,"_IntAnd:")                                            \
    template(_INT_OR_,"_IntOr:")                                              \
    template(_INT_XOR_,"_IntXor:")                                            \
    template(_INT_ALSHIFT_,"_IntArithmeticShiftLeft:")                        \
    template(_INT_LLSHIFT_,"_IntLogicalShiftLeft:")                           \
    template(_INT_ARSHIFT_,"_IntArithmeticShiftRight:")                       \
    template(_INT_LRSHIFT_,"_IntLogicalShiftRight:")                          

# define VMStrings_DO17(template)                                             \
    template(_EQ_,"_Eq:")                                                     \
    template(_AT_,"_At:")                                                     \
    template(_AT_PUT_,"_At:Put:")                                             \
    template(_SIZE,"_Size")                                                   \
    template(_BYTE_AT_,"_ByteAt:")                                            \
    template(_BYTE_AT_PUT_,"_ByteAt:Put:")                                    \
    template(_BYTE_SIZE,"_ByteSize")                                          \
    template(_RESTART,"_Restart")                                             \
    template(_RESTART_IF_FAIL,"_RestartIfFail:")                              \
        \
    template(DEFINE_LABEL_BEFORE, "__DefineLabel:Before:") \
    template(DEFINE_LABEL_AFTER,  "__DefineLabel:After:") \


# define VMStrings_DO18(template)                                             \
    template(NOT_A_STRING, "<not a string>")                                  \
    template(UNDEFINEDSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_,\
    "undefinedSelector:Receiver:Type:Delegatee:MethodHolder:Arguments:")      \
    template(AMBIGUOUSSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_,\
    "ambiguousSelector:Receiver:Type:Delegatee:MethodHolder:Arguments:")      \
    template(MISSINGPARENTSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_,\
    "missingParentSelector:Receiver:Type:Delegatee:MethodHolder:Arguments:")  \
    template(MISMATCHEDARGUMENTCOUNTSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_,\
    "mismatchedArgumentCountSelector:Receiver:Type:Delegatee:MethodHolder:Arguments:") \
    template(PERFORMTYPEERRORSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_, \
    "performTypeErrorSelector:Receiver:Type:Delegatee:MethodHolder:Arguments:")

# define VMStrings_DO19(template)                                             \
    template(NORMAL,"normal")                                                 \
    template(IMPLICITSELF,"implicitSelf")                                     \
    template(RESEND,"undirectedResend")                                       \
    template(DIRECTEDRESEND,"directedResend")                                 \
    template(DELEGATED,"delegated")

# define VMStrings_DO20(template)                                             \
    template(PROCESS_TERMINATED,"terminated")                                 \
    template(PROCESS_ABORTED,"aborted")                                       \
    template(STACK_OVERFLOW,"stackOverflow")                                  \
    template(INTERRUPT_CHECK,"_InterruptCheck")                               \
    template(NON_LIFO,"nonLifoBlock")                                         \
    template(SINGLESTEPPED,"singleStepped")                                   \
    template(FINISHEDACTIVATION,"finishedActivation")                         \
    template(YIELDED,"yielded")                                               \
    template(SIGNAL,"signal")                                                 \
    template(LOWONSPACE,"lowOnSpace")                                         \
    template(COULDNTALLOCATESTACK,"couldntAllocateStack")                     \
    
# define VMStrings_DO21(template)                                             \
    template(SIG_INT,"sigint")                                                \
    template(SIG_QUIT,"sigquit")                                              \
    template(SIG_IO,"sigio")                                                  \
    template(SIG_USER1,"siguser1")                                            \
    template(SIG_USER2,"siguser2")                                            \
    template(SIG_PIPE,"sigpipe")                                              \
    template(SIG_TERM,"sigterm")                                              \
    template(SIG_URG,"sigurg")                                                \
    template(SIG_CHILD,"sigchild")                                            \
    template(SIG_HUP,"sighup")                                                \
    template(SIG_WINCH,"sigwinch")                                            \
    template(SIG_REALTIMER,"sigrealtimer")                                    \
    template(SIG_CPUTIMER,"sigcputimer")                                      \
    template(SIG_UNKNOWN, "sigunknown")                                       \
    
# define VMStrings_DO22(template)                                             \
    template(NIC,"nic")                                                       \
    template(SIC,"sic")                                                       \
    template(NONE,"none")                                                     \
                                                                              \
    template(VERSION,"version")                                               \
    template(POINTER_DESCRIPTORS,"pointerDescriptors")                        \
                                                                              \
    template(ASSMALLINTEGER, "asSmallInteger") 
    
# define VMStrings_DO(template)                                               \
    VMStrings_DOErr1(template)                                                \
                                                                              \
    VMStrings_DO1(template)                                                   \
    VMStrings_DO2(template)                                                   \
    VMStrings_DO3(template)                                                   \
    VMStrings_DO4(template)                                                   \
    VMStrings_DO5(template)                                                   \
    VMStrings_DO6(template)                                                   \
    VMStrings_DO7(template)                                                   \
    VMStrings_DO8(template)                                                   \
    VMStrings_DO9(template)                                                   \
    VMStrings_DO10(template)                                                  \
    VMStrings_DO11(template)                                                  \
    VMStrings_DO12(template)                                                  \
    VMStrings_DO13(template)                                                  \
    VMStrings_DO14(template)                                                  \
    VMStrings_DO15(template)                                                  \
    VMStrings_DO16(template)                                                  \
    VMStrings_DO17(template)                                                  \
    VMStrings_DO18(template)                                                  \
    VMStrings_DO19(template)                                                  \
    VMStrings_DO20(template)                                                  \
    VMStrings_DO21(template)                                                  \
    VMStrings_DO22(template)    

# define VMStrings_Enum_Template(x,s) x,

enum VMStringsIndex {
  VMStrings_DO(VMStrings_Enum_Template) // ,
  LAST_VM_STRING
};
