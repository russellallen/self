'Sun-$Revision: 30.6 $'

primitiveMaker reader copy staticLinking create: 'macPrims' From: '

    -- Copyright 1992-2012 AUTHORS.
    -- See the LICENSE file for license information.
 
 traits: globals macOSGlobals os
 macroName:	   macOS

 visibility: privateSlot
    void basicOpenFileName: string Flags: int Mode: int = \
	   proxy_or_errno int MacOS_File_seal -1 {os_file deadCopy}  \
	   call open_wrap


    void basicCloseFile:  proxy_null int MacOS_File_seal \
           = int_or_errno -1  call close_wrap

    void basicReadFile:  proxy_null int MacOS_File_seal  \
                    Into:  bv_len char* \
		  Offset:  int \
		   Count:  int \
	   = int_or_errno -1  call read_wrap passFailHandle canAWS
	   
	   -- Set canAWS so a read can be interrupted and returned to prompt
	   

    void basicWriteFile:  proxy_null int MacOS_File_seal  \
                     Into:  cbv_len char* \
		   Offset:  int \
		    Count:  int \
	   = int_or_errno -1  call write_wrap passFailHandle
	   
	  void get_SIOUX_nonblocking \
	   = bool call get_SIOUX_nonblocking_prim
	   
	  void set_SIOUX_nonblocking: bool \
	   = void call set_SIOUX_nonblocking_prim
	   
	 visibility: publicSlot
	  
	   void basicRename: string To: string \
	    = int_or_errno -1 call rename_wrap passFailHandle
    
    void basicUnlink: string = must_be_zero call unlink


  traits: traits macOS_File 

   visibility: privateSlot
    void setFd: int \
           = proxy_null int MacOS_File_seal {self} call MYSELF

    proxy_null int MacOS_File_seal fileDescriptor = int call MYSELF


   visibility: publicSlot
    void expand: string = string call ExpandDir_prim passFailHandle
    

-- C++ cannot deal with struct stat, so we assume typedef struct stat stat_t;

traits: traits macOS_statStructure

 visibility: publicSlot
  void new        = stat_t {macOSGlobals statStructure deadCopy}  new  
  stat_t delete     = void           delete  

  stat_t st_mode    = unsigned_long  getMember st_mode
  stat_t st_ino     = unsigned_long  getMember st_ino
  stat_t st_dev     = unsigned_long  getMember st_dev
  stat_t st_nlink   = short          getMember st_nlink
  stat_t st_uid     = unsigned_long  getMember st_uid
  stat_t st_gid     = unsigned_long  getMember st_gid
  stat_t st_rdev    = unsigned_long  getMember st_rdev
  stat_t st_size    = long           getMember st_size
  stat_t st_blksize = long           getMember st_blksize
  stat_t st_blocks  = long           getMember st_blocks


  stat_t st_atime   = oop call stat_st_atime_wrapper
  stat_t st_mtime   = oop call stat_st_mtime_wrapper
  stat_t st_ctime   = oop call stat_st_ctime_wrapper

traits: globals macOSGlobals os

 visibility: privateSlot
  void basicStatFileName: string Into: stat_t = int_or_errno -1 call stat 

  void basicStatOpenFile: proxy_null int MacOS_File_seal Into: stat_t = int_or_errno -1  call fstat

 visibility: publicSlot
  void throwException = void call throw_exception_prim
'
