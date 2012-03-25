'Sun-$Revision: 30.6 $'

primitiveMaker reader copy staticLinking create: 'stat' From: '

  -- Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
  -- See the LICENSE file for license information.

  macroName: stat
  glueLibraryName: stat_glue.o


traits: traits unixStatStructure

 visibility: publicSlot
  stat_type delete     = void           delete  

  stat_type st_dev     = short          getMember st_dev
  stat_type st_ino     = unsigned_long  getMember st_ino
  stat_type st_mode    = unsigned_short getMember st_mode
  stat_type st_nlink   = short          getMember st_nlink
  stat_type st_uid     = unsigned_short getMember st_uid
  stat_type st_gid     = unsigned_short getMember st_gid
  stat_type st_rdev    = short          getMember st_rdev
  stat_type st_size    = long           getMember st_size
  stat_type st_blksize = long           getMember st_blksize
  stat_type st_blocks  = long           getMember st_blocks

  stat_type s_isdir    = bool call s_isdir_wrapper
  stat_type s_ischr    = bool call s_ischr_wrapper
  stat_type s_isblk    = bool call s_isblk_wrapper
  stat_type s_isreg    = bool call s_isreg_wrapper
  stat_type s_islnk    = bool call s_islnk_wrapper
  stat_type s_issock   = bool call s_issock_wrapper
  stat_type s_isfifo   = bool call s_isfifo_wrapper

  stat_type st_atime   = oop call stat_st_atime_wrapper
  stat_type st_mtime   = oop call stat_st_mtime_wrapper
  stat_type st_ctime   = oop call stat_st_ctime_wrapper

traits: globals unixGlobals os

 visibility: publicSlot
  void stat: string = stat_type {statStructure deadCopy} call stat_wrapper \
			passFailHandle

  void lstat: string = stat_type {statStructure deadCopy} call lstat_wrapper \
			 passFailHandle

traits: traits unixFile

 visibility: publicSlot
  proxy_null int UnixFile_seal fstat = stat_type {statStructure deadCopy} \
					 call fstat_wrapper passFailHandle

'
