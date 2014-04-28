"Second part of Character.st -- see that file for copyright
info"

"Modified by Mario Wolczko, July 1995"

"$Revision: 30.1 $"


!Character class methodsFor: 'instance creation'!

digitValue: anInteger
    "Returns a character that corresponds to anInteger.  0-9 map to $0-$9,
    10-35 map to $A-$Z"
    (anInteger between: 0 and: 9)
    	ifTrue: [ ^Character value: anInteger + 48 ]. "48 == $0"
    (anInteger between: 10 and: 35)
    	ifTrue: [ ^Character value: anInteger - 10 + 65 ]. "65 = $A"
    ^self error: 'value not in range 0 to 35'
! !

!Character methodsFor: 'converting'!

digitValue
    "Returns the value of self interpreted as a digit.  Here, 'digit' means
    either 0-9, or uppercase A-Z, which maps to 10-35."
    (self between: $0 and: $9) ifTrue: [ ^self asciiValue - 48 ].
				"48 is $0"
    (self between: $A and: $Z) ifTrue: [ ^self asciiValue - 65 + 10 ].
				"65 is $A"
    ^self error: 'Invalid digit character'
! !

