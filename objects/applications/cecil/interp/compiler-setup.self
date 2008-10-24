'Sun-$Revision: 9.1 $'

"this file should be read in before saving a Snapshot to be used as a 
 pre-loaded Cecil compiler"

systemInvokedActions snapshotAction _AddSlots: ( |
    ^ postRead  = (
	sendMessages: postReadMessages.
	_DirPath: '.:~/cecil/interp:~/cecil/ui:~/cecil/stdlib:~/cecil/tests:~/self/self:~'.
	prompt start.
	_Quit.
    ).
| )
