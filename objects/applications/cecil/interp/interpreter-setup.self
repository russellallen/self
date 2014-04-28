'Sun-$Revision: 9.1 $'

"this file should be read in before saving a Snapshot to be used as a 
 pre-loaded Cecil interpreter"

globals cecil_interp _AddSlots: ( |
    ^ cecilThenQuit = ( cecil. _Quit. ).
| )

systemInvokedActions snapshotAction _AddSlots: ( |
    ^ postRead  = (
	sendMessages: postReadMessages.
	_DirPath: '.:~/cecil/interp:~/cecil/ui:~/cecil/stdlib:~/cecil/tests:~/self/self:~:/projects/self/self-baseline/applications/cecil/interp:/projects/self/self-baseline/applications/cecil/ui:/projects/self/self-baseline/applications/cecil/stdlib:/projects/self/self-baseline/applications/cecil/tests:/projects/self/self-baseline/self'.
        scheduler startAndSend: 
            message copy receiver: lobby Selector: 'cecilThenQuit'.
	_Quit. 
    ).
| )
