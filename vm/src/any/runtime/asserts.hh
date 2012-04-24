/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


void assert(bool b, const char* fmt);
extern bool CheckAssertions; // defined in debug.h but need it sooner


# if GENERATE_DEBUGGING_AIDS
# define assert(b,msg)                                                        \
    if (!CheckAssertions  ||  b) {} else fatal1("assertion failed:  %s",(msg[0] ? msg : XSTR(b)))
# else
# define assert(b,msg)
# endif


// Bogosity alert:  for non-ANSI C, `obj' and `t' must not be separated
//  by whitespace in either the parameters of the definition or
//  the arguments of the call.  

# define assert_type(obj,t,msg)                                               \
    assert(CONC(oop(obj)->is_,t()), msg)

# define assert_mark(obj,msg)                                                 \
    assert_type(obj,mark,msg)

# define assert_smi(obj,msg)                                                  \
    assert_type(obj,smi,msg)

# define assert_mem(obj,msg)                                                  \
    assert_type(obj,mem,msg)

# define assert_slots(obj,msg)                                                \
    assert_type(obj,slots,msg)

# define assert_objVector(obj,msg)                                            \
    assert_type(obj,objVector,msg)

# define assert_byteVector(obj,msg)                                           \
    assert_type(obj,byteVector,msg)

# define assert_string(obj,msg)                                               \
    assert_type(obj,string,msg)

# define assert_float(obj,msg)                                                \
    assert_type(obj,float,msg)

# define assert_block(obj,msg)                                                \
    assert_type(obj,block,msg)

# define assert_map(obj,msg)                                                  \
    assert_type(obj,map,msg)

# define assert_mirror(obj,msg)                                               \
    assert_type(obj,mirror,msg)

# define assert_process(obj,msg)                                              \
    assert_type(obj,process,msg)

