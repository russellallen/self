"Sun-$Revision: 9.1 $"

"interface for scanner.self"

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_interface = () | )
traits cecil_interface _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    blkSize = 8192.    "The maximum for each block is 8K(as in unix.self)"

    ^ createOnRead: fileName = ( | tmp. |
	tmp: clone fileName: fileName.
	tmp openFileForRead.
	tmp ).

    ^ createOnWrite: fileName = ( | tmp. |
	tmp: clone fileName: fileName.
	tmp openFileForWrite.
	tmp ).

    openFileForRead = (
	fd: unixFile openForReading: fileName.
	leftUnread: fd size.
	self).

    ^ readFile = ( | tmpdata. data <- ''. |
	[  
	  tmpdata: read.
	  data: data, tmpdata.
	] untilTrue: [ tmpdata = '' ].
	data ).

    read = ( | data. |
	(leftUnread = 0)
	      ifTrue: [ data: '' ]
	       False: [
	        (leftUnread > blkSize) 
			ifTrue: [ leftUnread: leftUnread - blkSize ]
			 False: [ leftUnread: 0 ].
	 	data: fd read.       "Maximum is 8k"	     
		leftUnread = 0 ifTrue: [ closeFile ].
	      ].
	data ).

    ^ writeFile: tokens = (
	tokens do: [ | :t | fd write: t printString, '\n' ].
        closeFile.
	).

    ^ openFileForWrite = (
        fd: unixFile openForWriting: fileName.
	self.
    ).

    ^ closeFile = ( fd close ).
|)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_interface = () | )
cecil_interface _Define: ( |
    _ parent* = traits cecil_interface.
    _ thisObjectPrints = true.
    _ fd.
    _ leftUnread <- 0.
    fileName <- ''.
| )




