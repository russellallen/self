#pragma precompile_target "::mac_ppc:mwHeader" 

// $Revision: 30.6 $

// Copyright 1993-2006 Sun Microsystems, Inc. 901 San Antonio Road,
// Palo Alto, California, 94303, U.S.A.  All Rights Reserved.
//
// This software is the confidential and proprietary information of Sun
// Microsystems, Inc. ("Confidential Information").  You shall not
// disclose such Confidential Information and shall use it only in
// accordance with the terms of the license agreement you entered into
// with Sun.
//
// CopyrightVersion 1.2

# include <bool.h>
# include <SIOUX.h>
# include <console.h>
# include <new.h> // for setting new handler

# define frame macintosh_frame // avoid conflict with our frames

# include <MacHeaders.c>

# undef frame

// setup configuration for Self

# define   HOST_ARCH         PPC_ARCH
# define TARGET_ARCH         PPC_ARCH
# define TARGET_OS_FAMILY    MACOS_FAMILY
# define TARGET_OS_VERSION   MACOS_SYSTEM_7_VERSION
# define COMPILER            MWERKS_COMPILER
# define ASSEMBLER
# define TARGET_IS_DEBUGGED // for now
# define TARGET_IS_SELF 1


typedef char* caddr_t;
