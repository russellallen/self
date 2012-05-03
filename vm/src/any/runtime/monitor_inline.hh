/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif





# define TicksPerUpdate 5

  // **************** indicator and cpu bar positioning ******************* 


# define IND_W          (5*spy->font_w())
# define IND_H          (spy->font_h() + 2)
# define IND_GAP        (IND_H + 1)
# define IND_BAR_W      (6*spy->font_w())
# define IND_BAR_H      (IND_H / 2)
# define IND_BAR_YOFF   2
  
// compiling...
# define CO_W   (COMPILE_LEN*spy->font_w())
# define CO_X   (2 + spy->font_w())
# define CO_Y   2
  
# define VM_W   IND_W
# define VM_X   (CO_X - spy->font_w())
# define VM_Y   (CO_Y + IND_GAP)
# define VM_WB  IND_BAR_W
# define VM_XB  (VM_X + VM_W + spy->font_w()/2)
# define VM_YB  (VM_Y + 2)
# define VM_HB  IND_BAR_H
  
# define LKUP_W   IND_W
# define LKUP_X   VM_X
# define LKUP_Y   (VM_Y + IND_GAP)
# define LKUP_WB  IND_BAR_W 
# define LKUP_XB  VM_XB
# define LKUP_YB  (LKUP_Y + IND_BAR_YOFF)
# define LKUP_HB  IND_BAR_H

# define COMP_W   IND_W
# define COMP_X   VM_X
# define COMP_Y   (LKUP_Y + IND_GAP)
# define COMP_WB  IND_BAR_W
# define COMP_XB  VM_XB
# define COMP_YB  (COMP_Y + IND_BAR_YOFF)
# define COMP_HB  IND_BAR_H

# define SELF_W   IND_W 
# define SELF_X   VM_X
# define SELF_Y   (COMP_Y + IND_GAP)
# define SELF_WB  IND_BAR_W 
# define SELF_XB  VM_XB
# define SELF_YB  (SELF_Y + IND_BAR_YOFF)
# define SELF_HB  IND_BAR_H

# define CPU_W   IND_W 
# define CPU_X   VM_X
# define CPU_Y   (SELF_Y + IND_GAP)
# define CPU_WB  IND_BAR_W 
# define CPU_XB  VM_XB
# define CPU_YB  (CPU_Y + IND_BAR_YOFF)
# define CPU_HB  IND_BAR_H

# define RULER_Y (EDEN_Y + (3 + OLD_THICK) * HEIGHT + 12)
# define SHORT_TICK 5
# define LONG_TICK  10
# define BOTTOM  (max( RULER_Y, (CPU_Y + spy->font_h()) ) + 4)

// process switch dot
# define CTX_X  (CPU_X + spy->font_w())
# define CTX_Y  (CPU_Y + 12)
# define CTX_W  (CPU_XB + CPU_WB - CTX_X)
# define CTX_S  2

// scavenge/GC/flushing/compacting/icflush/lrusweep
# define ACT_W  (12*spy->font_w())
# define ACT_X  (VM_XB + VM_WB + 2)
# define ACT_Y  VM_Y

// page
# define PG_W   (8*spy->font_w())
# define PG_X   ACT_X
# define PG_Y   LKUP_Y

// read/write/diskio/unix/idle/nothing
# define SYS_W  (10*spy->font_w())
# define SYS_X  (PG_X + PG_W + 2)
# define SYS_Y  PG_Y

// RSRC  
# define RES_W  (30*spy->font_w())
# define RES_X  (SELF_XB + SELF_WB + 5)
# define RES_Y  SELF_Y

// C-Heap  
# define ALL_W  (20*spy->font_w())
# define ALL_X  RES_X
# define ALL_Y  CPU_Y

// sends/block creations etc (optional)
# define OPT_X  (RES_X + RES_W + 5)
# define OPT_W  (19*spy->font_w())

// block clones
# define BLKCLN_X  OPT_X
# define BLKCLN_W  OPT_W
# define BLKCLN_Y  VM_Y

// block invocations
# define BLKINV_X  OPT_X
# define BLKINV_W  OPT_W
# define BLKINV_Y  LKUP_Y

// % block invocations (short / long-term)
# define BLKS_X   OPT_X
# define BLKS_W   (13 * spy->font_w())
# define BLKS_Y   COMP_Y
# define BLKL_X   (BLKS_X + BLKS_W)
# define BLKL_W   (5 * spy->font_w())
# define BLKL_Y   BLKS_Y

// total sends
# define SENDS_X  OPT_X
# define SENDS_W  OPT_W
# define SENDS_Y  SELF_Y

// data access sends
# define ACC_X   OPT_X
# define ACC_W   (10 * spy->font_w())
# define ACC_Y   CPU_Y
# define ACC_WB  IND_BAR_W 
# define ACC_XB  (ACC_X + ACC_W)
# define ACC_YB  (ACC_Y + IND_BAR_YOFF)
# define ACC_HB  IND_BAR_H

// memory bars position
# define MBAR_X  (OPT_X + (showSends ? OPT_W : 0))
# define EDEN_Y  VM_YB

// memory bar label positions
# define PICS_X  picZone->x
# define PICS_Y  (picZone->y - spy->font_h())
# define PICS_T  "PICs"
# define PICS_W  (4*spy->font_w())

# define CODE_X  (iZone->x + (iZone->w / 2) - (CODE_W / 2))
# define CODE_Y  (iZone->y + iZone->h + 2)
# define CODE_T  "code"
# define CODE_W  (4*spy->font_w())

# define NIC_X   iZone->x
# define NIC_Y   CODE_Y
# define NIC_T   "NIC"
# define NIC_W   (3*spy->font_w())

# define SIC_X   (iZone->x + iZone->w - SIC_W)
# define SIC_Y   CODE_Y
# define SIC_T   "SIC"
# define SIC_W   (3*spy->font_w())

# define DEPS_X  dZone->x
# define DEPS_Y  (dZone->y + dZone->h + 2)
# define DEPS_T  "deps"
# define DEPS_W  (4*spy->font_w())

# define DBUG_X  sZone->x
# define DBUG_Y  (sZone->y + sZone->h + 2)
# define DBUG_T  "debug"
# define DBUG_W  (5*spy->font_w())



  // ********************* memory and zone bars *********************
  
# define HEIGHT      9          /* bar height in pixel */
# define OLD_THICK   4          /* old space is 4 times thicker */


# define MZ_GAP         30
# define Z_GAP          10
# define M_GAP          5
# define RIGHT_MARGIN   10

# define FOR_ALL_BARS_DO(action)                                              \
    FOR_ALL_CPU_BARS_DO(action);                                              \
    FOR_ALL_MEM_BARS_DO(action);

# define FOR_ALL_CPU_BARS_DO(action)                                          \
    cpuBar->action;                                                           \
    selfBar->action;                                                          \
    lookupBar->action;                                                        \
    compilerBar->action;                                                      \
    vmBar->action;                                                            \

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
#   define FOR_ALL_ZONE_BARS_DO(action)                                       \
    iZone->action;                                                            \
    dZone->action;                                                            \
    sZone->action;                                                            \
    picZone->action;
    
#   define FOR_ALL_ZONE_BAR_LABELS_DO(action)                                 \
    picsLabel->action,                                                        \
    codeLabel->action,                                                        \
    nicLabel->action,                                                         \
    sicLabel->action,                                                         \
    depsLabel->action,                                                        \
    debugLabel->action
    
# else
#   define FOR_ALL_ZONE_BARS_DO(action)
#   define FOR_ALL_ZONE_BAR_LABELS_DO(action) 0
# endif
 

# define FOR_ALL_MEM_BARS_DO(action)                                          \
    eden->action;                                                             \
    from->action;                                                             \
    to->action;                                                               \
    {for (int32 _n=0; _n < nOld; ++_n) old[_n]->action;}                      \
    FOR_ALL_ZONE_BARS_DO(action)
   

# define FOR_ALL_BAR_LABELS_DO(action)                                        \
    FOR_ALL_ZONE_BAR_LABELS_DO(action)

# define FOR_ALL_LABELS_DO(action)                                            \
    selfLabel->action,                                                        \
    cpuLabel->action,                                                         \
    lookupLabel->action,                                                      \
    compilerLabel->action,                                                    \
    showSends ? accessLabel->action : (void)0,                                \
    vmLabel->action,                                                          \
    FOR_ALL_BAR_LABELS_DO(action)

# define FOR_ALL_OPT_BARS_DO(action)                                          \
    if (showSends) {                                                          \
      accessBar->action;                                                      \
    }

