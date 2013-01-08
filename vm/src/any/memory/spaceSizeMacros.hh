/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

/* This file is also processed by the assembler, so do not include any */
/* non-cpp code */

// This must be the size of the largest page of all platforms, to load 
// snapshots using mmap.
// sun4c machines use 4096, sun4 use 8192.
// On PPC=, for Altivec, must be multiple of 16. -- dmu 3/04
# define idealized_page_size 8192

# define is_idealized_page_multiple(n)    (n % idealized_page_size == 0)

// eden and surv sizes below were doubled by dmu on: 1/02 because machines are bigger.
// And increased again (esp. eden) by dmy on: 5/04.
// see  Desired_Surv_Size= 400 * K; in universe.cpp
// Cut these back down for a small machine.

# define        default_eden_size        (      4000 * 1024)
# define        default_surv_size        (       800 * 1024)
# define        default_old_size         ( 20 * 1024 * 1024)
# define space_sizes_ok(init,eden,surv) ((init) >= 2*(surv) + (eden))

# if !space_sizes_ok(default_old_size,                                  \
                     default_eden_size,                                 \
                     default_surv_size)                                 \
     || !is_idealized_page_multiple(init)                               \
     || !is_idealized_page_multiple(eden)                               \
     || !is_idealized_page_multiple(surv)
# error "error in default space sizes"
# endif 

// Doubled 8 to 16 below -- dmu 1/02
# define        default_code_size        (16 * 1024 * 1024)
# define        default_deps_size        DepsSize(default_code_size)
# define        default_debug_size       DebugSize(default_code_size)
# define        default_pic_size         ((int)PicSize(default_code_size))
  
// change the values of this group to tune the zone; see output of
// _PrintMemory

# define InstsWeight            45.0
# define LocsWeight              7.0
# define DepsWeight             10.0
# define ScopesWeight            6.0
# define PcsWeight               4.0
# define TotalWeight            (InstsWeight + LocsWeight + DepsWeight + \
                                ScopesWeight + PcsWeight)
# define InstsFrac              (InstsWeight / TotalWeight)
# define LocsFrac               (LocsWeight  / TotalWeight)
# define DepsFrac               (DepsWeight  / TotalWeight)
# define ScopesFrac             (ScopesWeight/ TotalWeight)
# define PcsFrac                (PcsWeight   / TotalWeight)
# define PcsFrac                (PcsWeight   / TotalWeight)

# define SafetyFactor           1.5  /* so as not to underestimate VM parts */

# define InCoreFrac             (InstsFrac + LocsFrac)
# define InVMFrac               (1.0 - InCoreFrac)

# define CoreSize(f,size)       (int)((f / InCoreFrac) * size)
# define VMSize(f,size)         (int)(CoreSize(f,size) * SafetyFactor)

# define AvgNMethodSize         500     /* wild guess */
# define NrOfNMethods(size)     (size / AvgNMethodSize)
# define NMethodDescSize(size)  NrOfNMethods(size) * 50
# define RealSize(size)         (size + NMethodDescSize(size))

# define DepsSize(size)         VMSize(DepsFrac,size)
# define ScopesSize(size)       VMSize(ScopesFrac,size)
# define PcsSize(size)          VMSize(PcsFrac,size)
# define DebugSize(size)        ScopesSize(size) + PcsSize(size)

# define CacheStubSize          28      /* sizeof(CacheStub) - const for asm */
/* # define CacheStubsPerNMethod        3 / 2   / * wild guess */
// This has been increased with NIC nmethod reuse
# define CacheStubsPerNMethod   3       /* wild guess */
# define SmallestStub           (CacheStubSize + 10*4)
# define StubsSize(size)        (NrOfNMethods(size) * SmallestStub *          \
                                        CacheStubsPerNMethod)
# define PicSize(size)          StubsSize(size) 
 
/* the following must be understandable to the assembler! */
/* (don't use floats in expressions) */
# define ProfiledZoneSize       (default_code_size + PicSize(default_code_size) + 1024*16)

#define PrologueSize  15        /* est. size (words) of nmethod prologue code */

