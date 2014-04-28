/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

    unix_entries

{
    "Syscall", fntype(&syscall0_glue),
    ExternalPrimitive, IntegerPrimType,
    SIDEEFFECTS,
    "The receiver is an integer which specifies the function that the "
    "indirect system call should perform.  Each pair of arguments to "
    "the primitive specifies an argument passed to syscall.  "
    "Argument conversion is described in the manual.  The return "
    "value is a byte vector containing the result value."
},
{
    "SyscallWith:And:", fntype(&syscall1_glue),
    ExternalPrimitive, IntegerPrimType,
    SIDEEFFECTS,
    "The receiver is an integer which specifies the function that the "
    "indirect system call should perform.  Each pair of arguments to "
    "the primitive specifies an argument passed to syscall.  "
    "Argument conversion is described in the manual.  The return "
    "value is a byte vector containing the result value."
},
{
    "SyscallWith:And:With:And:", fntype(&syscall2_glue),
    ExternalPrimitive, IntegerPrimType,
    SIDEEFFECTS,
    "The receiver is an integer which specifies the function that the "
    "indirect system call should perform.  Each pair of arguments to "
    "the primitive specifies an argument passed to syscall.  "
    "Argument conversion is described in the manual.  The return "
    "value is a byte vector containing the result value."
},
{
    "SyscallWith:And:With:And:With:And:", 
    fntype(&syscall3_glue),
    ExternalPrimitive, IntegerPrimType,
    SIDEEFFECTS,
    "The receiver is an integer which specifies the function that the "
    "indirect system call should perform.  Each pair of arguments to "
    "the primitive specifies an argument passed to syscall.  "
    "Argument conversion is described in the manual.  The return "
    "value is a byte vector containing the result value."
},
{
    "SyscallWith:And:With:And:With:And:With:And:", 
    fntype(&syscall4_glue),
    ExternalPrimitive, IntegerPrimType,
    SIDEEFFECTS,
    "The receiver is an integer which specifies the function that the "
    "indirect system call should perform.  Each pair of arguments to "
    "the primitive specifies an argument passed to syscall.  "
    "Argument conversion is described in the manual.  The return "
    "value is a byte vector containing the result value."
},
{
    "SyscallWith:And:With:And:With:And:With:And:With:And:", 
    fntype(&syscall5_glue),
    ExternalPrimitive, IntegerPrimType,
    SIDEEFFECTS,
    "The receiver is an integer which specifies the function that the "
    "indirect system call should perform.  Each pair of arguments to "
    "the primitive specifies an argument passed to syscall.  "
    "Argument conversion is described in the manual.  The return "
    "value is a byte vector containing the result value."
},
{
    "SyscallWith:And:With:And:With:And:With:And:With:And:With:And:", 
    fntype(&syscall6_glue),
    ExternalPrimitive, IntegerPrimType,
    SIDEEFFECTS,
    "The receiver is an integer which specifies the function that the "
    "indirect system call should perform.  Each pair of arguments to "
    "the primitive specifies an argument passed to syscall.  "
    "Argument conversion is described in the manual.  The return "
    "value is a byte vector containing the result value."
},
# if TARGET_OS_VERSION == MACOSX_VERSION \
  || TARGET_OS_VERSION ==  LINUX_VERSION
{  "SysName", fntype(& sysname_glue), ExternalPrimitive, StringPrimType, SIDEEFFECTS, "See man 3 uname" },
{ "NodeName", fntype(&nodename_glue), ExternalPrimitive, StringPrimType, SIDEEFFECTS, "See man 3 uname" },
{  "Release", fntype(& release_glue), ExternalPrimitive, StringPrimType, SIDEEFFECTS, "See man 3 uname" },
{  "Version", fntype(& version_glue), ExternalPrimitive, StringPrimType, SIDEEFFECTS, "See man 3 uname" },
{  "Machine", fntype(& machine_glue), ExternalPrimitive, StringPrimType, SIDEEFFECTS, "See man 3 uname" },
# endif
