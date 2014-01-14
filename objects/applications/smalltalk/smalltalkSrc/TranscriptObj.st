"TranscriptObj.st

Copyright 1995 Sun Microsystems, Inc.
See the LICENSE file for license information.

"

"$Revision: 30.1 $"

Object subclass: #TranscriptObj
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Emulation'!

!TranscriptObj methodsFor: 'printing'!

cr
	self show: (String with: Character nl)!

nextPutAll: s
	^self show: s!

show: s
	self smalltalkEmulator report: s! !


Smalltalk at: #Transcript put: TranscriptObj new!


