"Second part of Collection.st -- see that file for copyright
info"

"Modified by Mario Wolczko, July 1995"

"$Revision: 30.1 $"

!Collection class methodsFor: 'instance creation'!

with: anObject
    ^self new add: anObject; yourself
!

with: firstObject with: secondObject
    ^self new add: firstObject; add: secondObject; yourself
!

with: firstObject with: secondObject with: thirdObject
    ^self new add: firstObject; add: secondObject; add: thirdObject; yourself
!

with: firstObject with: secondObject with: thirdObject with: fourthObject
    ^self new add: firstObject; add: secondObject; add: thirdObject;
    	add: fourthObject; yourself
! !



!Collection methodsFor: 'adding'!

add: newObject
    self subclassResponsibility
!

addAll: aCollection
    aCollection do: [ :element | self add: element ].
    ^aCollection
! !




!Collection methodsFor: 'removing'!

remove: oldObject ifAbsent: anExceptionBlock
    self subclassResponsibility
!

remove: oldObject
    self remove: oldObject
         ifAbsent: [ ^self error: 'Failed to remove object' ].
    ^oldObject
!

removeAll: aCollection
    " ??? we're supposed to report an error if an object can't be removed
      properly.  I've elected to let remove: report the error.  Also, it's
      not clear whether we're supposed to remove all occurrences of the
      members of aCollection from the receiver, or only the first."
    aCollection do: [ :element | self remove: element ].
    ^aCollection
! !



!Collection methodsFor: 'testing'!

includes: anObject
    self do: [ :element | anObject = element ifTrue: [ ^true ] ].
    ^false
!

isEmpty
    ^self size == 0
!

occurrencesOf: anObject
    | count |
    count := 0.
    self do: [ :element | anObject == element ifTrue: [ count := count + 1 ] ].
    ^count
!

size
    | count |
    count := 0.
    self do: [ :element | count := count + 1].
    ^count
! !



!Collection methodsFor: 'enumerating'!

do: aBlock
    self subclassResponsibility
!

select: aBlock
    | newCollection |
    " ### I don't know if this is the right way to create a new collection
      in all cases...I suspect that it is not..."
    newCollection := self species new.
    self do: [ :element | (aBlock value: element)
    	    	    	    ifTrue: [ newCollection add: element ]
	     ].
    ^newCollection
!

reject: aBlock
    | newCollection |
    " ### I don't know if this is the right way to create a new collection
      in all cases...I suspect that it is not..."
    newCollection := self species new.
    self do: [ :element | (aBlock value: element)
    	    	    	    ifFalse: [ newCollection add: element ]
	     ].
    ^newCollection
!

collect: aBlock
    | newCollection |
    " ### I don't know if this is the right way to create a new collection
      in all cases...I suspect that it is not..."
    newCollection := self species new.
    self do: [ :element | newCollection add: (aBlock value: element) ].
    ^newCollection
!

detect: aBlock ifNone: exceptionBlock
    self do: [ :element | (aBlock value: element) ifTrue: [ ^element ] ].
    exceptionBlock value    
!
    
detect: aBlock
    ^self detect: aBlock ifNone: [ ^self error: 'Collection detect: failed']
!

inject: thisValue into: binaryBlock
    self do: [ :element | thisValue := binaryBlock value: thisValue
    	    	    	    	    	    	  value: element ].
    ^thisValue
! !



!Collection methodsFor: 'converting'!

asBag
    | aBag |
    aBag := Bag new.
    self do: [ :element | aBag add: element ].
    ^aBag
!

asSet
    | aSet |
    aSet := Set new: self size.
    self do: [ :element | aSet add: element ].
    ^aSet
!

asOrderedCollection
    | anOrderedCollection |
    anOrderedCollection := OrderedCollection new: self size.
    self do: [ :element | anOrderedCollection add: element ].
    ^anOrderedCollection
!

asSortedCollection
    | aSortedCollection |
    aSortedCollection := SortedCollection new.
    self do: [ :element | aSortedCollection add: element ].
    ^aSortedCollection
!

asSortedCollection: aBlock
    | aSortedCollection |
    aSortedCollection := SortedCollection sortBlock: aBlock.
    self do: [ :element | aSortedCollection add: element ].
    ^aSortedCollection
! !

!Collection methodsFor: 'printing'!

printOn: aStream
    | firstTime |
    firstTime := true.
    aStream nextPutAll: self classNameString.
    aStream nextPutAll: ' ('.
    self do:
    	[ :element | firstTime ifTrue: [ firstTime := false ]
	   	    	        ifFalse: [ aStream nextPut: Character space ].
		      element printOn: aStream ].
    aStream nextPut: $)
! !



!Collection methodsFor: 'storing'!

store: aStream
    | noElements |
    aStream nextPut: $(.
    aStream nextPutAll: self classNameString.
    aStream nextPutAll: ' new'.
    noElements := true.
    self do:
    	[ :element | aStream nextPutAll: ' add: '.
    	    	     element storeOn: aStream.
		     aStream nextPut: $;.
		     noElements := false ].
    noElements ifFalse: [ aStream nextPutAll: ' yourself' ].
    aStream nextPut: $)
! !

