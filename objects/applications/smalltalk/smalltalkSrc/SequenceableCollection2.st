"Second part of SequenceableCollection.st -- see that file for copyright
info"

"Modified by Mario Wolczko, July 1995"

"$Revision: 30.1 $"


!SequenceableCollection methodsFor: 'accessing'!

atAll: aCollection put: anObject
    aCollection do: [ :index | self at: index put: anObject ]
!

atAllPut: anObject
    1 to: self size do: [ :index | self at: index put: anObject ]
!

first
    ^self at: 1
!

last
    self size < 1 ifTrue: [ ^self error: 'last not defined with no elements' ].
    ^self at: self size
!

indexOf: anElement ifAbsent: exceptionBlock
    1 to: self size do: [ :index | (self at: index) = anElement
    	    	    	    	     ifTrue: [ ^index ] ].
    ^exceptionBlock value
!

indexOf: anElement
    ^self indexOf: anElement ifAbsent: [ ^0 ]
! !



!SequenceableCollection methodsFor: 'private'!

matchSubCollection: aSubCollection startingAt: anIndex
    2 to: aSubCollection size do:
    	[ :index | (self at: anIndex + index - 1) ~= (aSubCollection at: index)
	    	       ifTrue: [ ^false ]
	].
    ^true
!

indexOfSubCollection: aSubCollection startingAt: anIndex
    ifAbsent: exceptionBlock
    | selfSize subSize |
    subSize  := aSubCollection size.
    selfSize := self size.
    anIndex + subSize - 1 <= selfSize ifTrue:
	[ anIndex to: selfSize - subSize + 1 do:
	      [:index | (self at: index) = (aSubCollection at: 1)
			    ifTrue: [(self matchSubCollection: aSubCollection
					   startingAt: index)
					 ifTrue: [^index]
					 ]
			    ]
	      ].
    ^exceptionBlock value
!

indexOfSubCollection: aSubCollection startingAt: anIndex
    ^self indexOfSubCollection: aSubCollection startingAt: anIndex
    	ifAbsent: [ ^0 ]
!

replaceFrom: start to: stop with: replacementCollection startingAt: repStart
    (self == replacementCollection and: [ repStart ~= 1 ])
    	ifTrue: [ ^self error: 'replaceFrom:to:with:startingAt: called for 
in-place replacement, but starting index was not 1' ].
    1 to: stop - start + 1 do:
    	[ :index |
	  self at: (start + index - 1)
    	       put: (replacementCollection at: (repStart + index - 1)) ]
!

replaceFrom: start to: stop with: replacementCollection
    stop - start + 1 ~= replacementCollection size
    	ifTrue: [ ^self error: 'replacement range does not equal size of
replacement collection' ].
    self replaceFrom: start to: stop with: replacementCollection startingAt: 1
! !



!SequenceableCollection methodsFor: 'copying'!

, aSequenceableCollection
    | aStream |
    aStream := WriteStream on: (self species new: self size + aSequenceableCollection size).
    aStream nextPutAll: self ; nextPutAll: aSequenceableCollection.
    ^aStream contents
!

copyFrom: start to: stop
    | newCollection len |
    len := stop - start + 1.
    newCollection := self species new: len.
    newCollection replaceFrom: 1 to: len with: self startingAt: start.
    ^newCollection
!

copyReplaceAll: oldSubCollection with: newSubCollection
    | numOld newCollection sizeDifference newSubSize oldSubSize
      newStart oldStart copySize index |
    numOld := self countSubCollectionOccurrencesOf: oldSubCollection.
    newSubSize := newSubCollection size.
    sizeDifference := newSubSize - oldSubCollection size + 1.
    newCollection := self species new: (self size - (sizeDifference * numOld)).
    oldStart := newStart := 1.
    [ index := self indexOfSubCollection: oldSubCollection
    	    	   startingAt: oldStart.
      index > 0 ] whileTrue:
    	[ copySize := index - oldStart + 1.
	  newCollection replaceFrom: newStart
	    	    	to: newStart + copySize - 1
			with: self
			startingAt: oldStart.
	  newStart := newStart + copySize - 1.
	  newCollection replaceFrom: newStart
	    	    	to: newStart + newSubSize - 1
			with newSubCollection.
    	  oldStart := oldStart + copySize.
    	  newStart := newStart + newSubSize ].
    "Copy the remaining part of self onto the tail of the new collection."
    newCollection replaceFrom: newStart
    	    	 to: newCollection size
		 with: self
		 startingAt: oldStart.
    ^newCollection
!

copyReplaceFrom: start to: stop with: replacementCollection
    | newCollection newSize repSize |
    "### check for bounds "
    repSize := replacementCollection size.
    newSize := self size + repSize - (stop - start + 1).
    newCollection := self species new: newSize.
    newCollection replaceFrom: 1 to: start - 1 with: self startingAt: 1.
    newCollection replaceFrom: start
    	    	  to: start + repSize - 1
		  with: replacementCollection.
    newCollection replaceFrom: start + repSize
    	    	  to: newCollection size
		  with: self
		  startingAt: stop + 1.
    ^newCollection
!

copyWith: newElement
    | newCollection len |
    len := self size + 1.
    newCollection := self species new: len.
    newCollection replaceFrom: 1 to: self size with: self.
    newCollection at: len put: newElement.
    ^newCollection
!

copyWithout: oldElement
    | newCollection numOccurrences i |
    numOccurrences := 0.
    self do:
    	[ :element |
	  element = oldElement
	    ifTrue: [ numOccurrences := numOccurrences + 1 ] ].
    newCollection := self species new: (self size - numOccurrences).
    i := 1.
    self do:
    	[ :element |
	  element ~= oldElement
	    ifTrue: [ newCollection at: i put: element.
	    	      i := i + 1 ]
	].
    ^newCollection
! !



!SequenceableCollection methodsFor: 'enumerating'!

do: aBlock
    "Evaluate aBlock for all elements in the sequenceable collection"
    1 to: self size do:
    	[ :i | aBlock value: (self at: i) ]
!

findFirst: aBlock
    "Returns the index of the first element of the sequenceable collection
    for which aBlock returns true"
    1 to: self size do:
    	[ :i | (aBlock value: (self at: i))
	    	 ifTrue: [ ^i ] ].
    ^0
!

findLast: aBlock
    self size to: 1 by: -1 do:
    	[ :i | (aBlock value: (self at: i))
	    	 ifTrue: [ ^i ] ].
    ^0
!

reverse
	| aStream |
	aStream := WriteStream on: (self species new: self size).
	self reverseDo: [:el | aStream nextPut: el].
	^aStream contents
!

reverseDo: aBlock
     self size to: 1 by: -1 do:
    	[ :i | aBlock value: (self at: i) ]
!

select: aBlock
	| s |
	s := WriteStream on: (self species new: self size).
	1 to: self size do: [ :i |
		(aBlock value: (self at: i)) ifTrue:
			[s nextPut: (self at: i)]].
	^ s contents
!

with: aSequenceableCollection do: aBlock
    self size = aSequenceableCollection size
    	ifFalse:
	    [ ^self error: 'sequenceable collections must have same size' ].
    1 to: self size do:
    	[ :i | aBlock value: (self at: i)
	    	      value: (aSequenceableCollection at: i) ]
! !



!SequenceableCollection methodsFor: 'private'!

countSubCollectionOccurrencesOf: aSubCollection
    | colIndex subColIndex count |
    colIndex := 1.
    count := 0.
    [ subColIndex := self indexOfSubCollection: aSubCollection
    	    	    	 startingAt: colIndex.
      subColIndex > 0 ] whileTrue:
      	[ count := count + 1.
	  colIndex := colIndex + aSubCollection size ].
    ^count
!

grow
    | newCollection |
    newCollection := self species new: self basicSize + self growSize.
    newCollection replaceFrom: 1 to: self size with: self.
    ^self become: newCollection
!
    
growSize
    ^self basicSize max: 4

! !


!SequenceableCollection methodsFor: 'comparing'!

= aCollection
    self species == aCollection species ifFalse: [^false].
    self size = aCollection size ifFalse: [ ^false ].
    1 to: self size do:
    	[ :i | (self at: i) = (aCollection at: i)
	    	  ifFalse: [ ^false ] ].
    ^true
!

hash
    "Return the hash value of the collection"
    "### I don't like this hashing algorithm"
    | hashValue |
    hashValue := 0.
    self do: [ :element | hashValue := (hashValue bitXor:  element hash)
					bitAnd: 16r1FFFFFFF ].
    ^hashValue
! !


