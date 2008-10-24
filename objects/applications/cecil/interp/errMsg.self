"Sun-$Revision: 9.1 $"

"cecil Error Handler"

globals cecil_interp _AddSlotsIfAbsent: ( | token_location = () | )

mixins cecil_interp _AddSlotsIfAbsent: (| cecil_error_handling = () |)
mixins cecil_error_handling _Define: ( |
    error_abort_block <- ( |
	parent* = traits oddball.
	value = ( error: 'unrecoverable error' ).
    | ).
    haltOnCecilErrors <- false.

    "Print out the error messages and 
     terminate the current read-eval-print loop"
    "could add a cecil stack dump"
    _ errPrint: msg With: postHandlingBlock = (
	msg printLine. 
	postHandlingBlock value. 
	haltOnCecilErrors ifTrue: [ halt ].
	error_abort_block value.
    ).
    _ errPrint: msg = (
	msg printLine. 
	haltOnCecilErrors ifTrue: [ halt ].
	error_abort_block value.
    ).

    "warning will not stop the current read-eval-print loop"
    cecilWarning: errMsg With: blk = ( 
	('Cecil Warning: ', errMsg) printLine.
        blk value.
	haltOnCecilErrors ifTrue: [ halt ].
    ).
    cecilWarning: errMsg = ( 
	('Cecil Warning: ', errMsg) printLine.
	haltOnCecilErrors ifTrue: [ halt ].
    ).

    typeErr: errMsg AtLocation: location = ( | str |
	str: '# Type Error: ', errMsg.
	location lineNum = 0 ifFalse: [
	    str: str, '\n  [', location printString, ']'.
	].
	str printLine.
	haltOnCecilErrors ifTrue: [ halt ].
    ).

    typeErr: errMsg = ( typeErr: errMsg AtLocation: location ).

    typeErrNoLocation: errMsg = (
	typeErr: errMsg AtLocation: token_location copy ).

    "Different headings for error messages"
    syntaxErr: errString With: blk = ( 
	errPrint: 'Syntax Error: ', errString With: blk.
    ).
    syntaxErr: errString = ( 
	errPrint: 'Syntax Error: ', errString.
    ).
    cecilErr: errString = ( 
	errPrint: 'Cecil Error: ', errString.
    ).

    " turn off debug messages by sending 'beQuiet: true' to
      e.g. the cecil_interpreter; this is shared state, though (blech) "
    " definitely need to reorg this code "
    debugMsg: s = ( beQuiet ifFalse: [ s printLine ]. self ).
    beQuiet <- false.
| )

