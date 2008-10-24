"Second part of ArrayedCollection.st -- see that file for copyright
and version info"

"Modified by Mario Wolczko, July 1995"

"$Revision: 30.1 $"

!ArrayedCollection methodsFor: 'printing'!

printOn: aStream
    | firstTime |
    aStream nextPutAll: self classNameString.
    aStream nextPutAll: ' ('.
    firstTime := true.
    self do:
    	[ :element | firstTime ifTrue: [ firstTime := false ]
    	    	    	       ifFalse: [ aStream nextPut: Character space ].
    	    	     element storeOn: aStream ].
    aStream nextPut: $)
! !



!ArrayedCollection methodsFor: 'storing'!

storeOn: aStream
    | index |
    aStream nextPutAll: '(('; nextPutAll: self classNameString; 
        nextPutAll: ' basicNew: '.
    self basicSize printOn: aStream.
    aStream nextPut: $).
    index := 1.
    self do:
    	[ :element | aStream nextPutAll: ' at: '.
	    	     index printOn: aStream.
		     aStream nextPutAll: ' put: '.
    	    	     element storeOn: aStream.
		     aStream nextPut: $;.
    	    	     index := index + 1 ].
    index > 1 ifTrue: [ aStream nextPutAll: ' yourself' ].
    aStream nextPut: $)
! !

