'Sun-$Revision: 30.6 $'

primitiveMaker reader copy staticLinking create: 'unixPrims' From: '

    -- Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
    -- See the LICENSE file for license information.
 
 traits: globals unixGlobals os
 macroName:	   unix

 visibility: privateSlot
    void basicOpenFileName: string Flags: int Mode: int = \
	   proxy_or_errno int UnixFile_seal -1 {os_file deadCopy}  \
	   call open_wrap

    void basicSocketDomain: int Type: int Protocol: int = \
	   proxy_or_errno int UnixFile_seal -1 {os_file deadCopy}  \
	   call socket_wrap

    void basicBindSocket:  proxy_null int UnixFile_seal \
                  Family:  short \
	            Port:    unsigned_short \
                 Address:   cbv_len char*  = \
	   int_or_errno  -1 call bind_wrap passFailHandle

    void basicConnectSocket:   proxy_null int UnixFile_seal \
                     Family:   short \
	               Port:   unsigned_short \
                    Address:   cbv_len char* = \
               int_or_errno -1 call connect_wrap passFailHandle

    void basicGetHostByAddr: cbv_len char* \
                       Type: int \
                = string call gethostbyaddr_wrap passFailHandle

    void basicGetHostByName: string = \
	 oop call gethostbyname_wrap passFailHandle

    void basicListenSocket: proxy_null int UnixFile_seal  \
                   Backlog: int = \
		   int_or_errno -1 call listen
			     

    void basicAcceptSocket: proxy_null int UnixFile_seal \
                      Info: oop objVector = \
         proxy_or_errno int UnixFile_seal -1 {os_file deadCopy} \
	 call accept_wrap

    void basicFcntlFile: proxy_null int UnixFile_seal Request: int Arg: int \
           = int_or_errno -1  call fcntl

    void basicCloseFile:  proxy_null int UnixFile_seal \
           = int_or_errno -1  call close_wrap

    void basicReadFile:  proxy_null int UnixFile_seal  \
                    Into:  bv_len char* \
		  Offset:  int \
		   Count:  int \
	   = int_or_errno -1  call read_wrap passFailHandle

    void basicWriteFile:  proxy_null int UnixFile_seal  \
                     Into:  cbv_len char* \
		   Offset:  int \
		    Count:  int \
	   = int_or_errno -1  call write_wrap passFailHandle

    void basicLseekFile:  proxy_null int UnixFile_seal \
                   Offset:  int \
		   Whence:  int \
	   = int_or_errno -1  call lseek

    void basicSelectInto: oop objVector  Size: int \
	   = int call select_wrap passFailHandle

    void basicSelectReadInto: oop objVector  Size: int \
	   = int call select_read_wrap passFailHandle

    void basicUnlink: string = int_or_errno -1 call unlink

   visibility: publicSlot
    void getpid = int call getpid

  traits: traits unixFile 

   visibility: privateSlot
    void setFd: int \
           = proxy_null int UnixFile_seal {self} call MYSELF

  traits: traits unixFile 
    proxy_null int UnixFile_seal fileDescriptor = int call MYSELF


  traits: traits unixFile 

   visibility: publicSlot
    void expand: string = string call ExpandDir_prim passFailHandle

    proxy_null int UnixFile_seal setsockoptLevel: int \
                                         OptName: int \
                                          OptVal: cbv_len_null char*  = \
	                                   int_or_errno -1 call setsockopt

  traits: globals unixGlobals os
    
   visibility: publicSlot
    void command: string = int call system_wrap

    void environmentAt: string = string call getenv
    void environmentAt: string Put: string = int call putenv_wrap 

    void getcwd = string call getcwd_wrap passFailHandle
'

