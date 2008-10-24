"======================================================================
|
|   Set Method Definitions
|
 ======================================================================"


"======================================================================
|
| Copyright (C) 1990, 1991 Free Software Foundation, Inc.
| Written by Steve Byrne.
|
| This file is part of GNU Smalltalk.
|
| GNU Smalltalk is free software; you can redistribute it and/or modify it
| under the terms of the GNU General Public License as published by the Free
| Software Foundation; either version 1, or (at your option) any later version.
| 
| GNU Smalltalk is distributed in the hope that it will be useful, but WITHOUT
| ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
| FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
| details.
| 
| You should have received a copy of the GNU General Public License along with
| GNU Smalltalk; see the file COPYING.  If not, write to the Free Software
| Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.  
|
 ======================================================================"


"
Modified by Mario Wolczko and David Ungar, July 1995

$Revision: 30.1 $
"

Collection subclass: #Set
	   instanceVariableNames: 'tally myArray'
	   classVariableNames: ''
	   poolDictionaries: ''
	   category: 'Collections-Unordered'!

Set comment:
'I am the typical set object; I can store any objects uniquely.  I
use the = operator to determine duplication of objects.' !

!Set class methodsFor: 'instance creation'!

new
    ^self new: 4
!

new: anInteger
    ^(super new initArray: anInteger) setTally
! !



!Set methodsFor: 'accessing'!

at: index
    self error: 'at: not allowed for Set'
!

at: index put: value
    self error: 'at:put: not allowed for Set'
!

add: newObject
    | index |
    newObject isNil ifTrue: [ ^newObject ].
    index := self findObjectIndex: newObject.
    (self basicAt: index) isNil
    	ifTrue: [ self basicAt: index put: newObject.
	    	  tally := tally + 1 ].
    ^newObject
! !



!Set methodsFor: 'removing'!

remove: oldObject ifAbsent: anExceptionBlock
    | index |
    index := self findObjectIndexNoGrow: oldObject
    	    	 ifAbsent: [ ^anExceptionBlock value ].
    tally := tally - 1.
    self rehashObjectsAfter: index.
    ^oldObject
! !



!Set methodsFor: 'testing'!

includes: anObject
    ^(self basicAt: (self findObjectIndex: anObject)) ~~ nil
!

isEmpty
    ^tally == 0
!

occurrencesOf: anObject
    "Return the number of occurrences of anObject.  Since we're a set, this
    is either 0 or 1.  Nil is never directly in the set, so we special case
    it here."
    anObject isNil ifTrue: [ ^1 ].
    (self includes: anObject)
    	ifTrue: [ ^1 ]
	ifFalse: [ ^0 ]
!

size
    ^tally
!

hash
    "Return the hash code for the members of the set.  Since order is
    unimportant; we use a commutative operator to compute the hash value."
    ^self inject: tally
    	  into: [ :hashValue :member | hashValue + member hash ]
!

= aSet
    "Returns true if the two sets have the same membership, false if not"
    tally = aSet size  ifFalse: [ ^false ].
    self do: [ :element | (aSet includes: element)
    	    	    	    ifFalse: [ ^false ] ].
    ^true
! !



!Set methodsFor: 'enumerating'!

do: aBlock
    "Enumerate all the non-nil members of the set"
    1 to: self basicSize do:
    	[ :i | (self basicAt: i) notNil
	    	  ifTrue: [ aBlock value: (self basicAt: i) ] ]
! !



!Set methodsFor: 'printing'!

printOn: aStream
    | firstTime |
    aStream nextPutAll: self class name , ' ('.
    firstTime := true.
    self do:
    	[ :element | firstTime ifTrue: [ firstTime := false ]
	    	    	       ifFalse: [ aStream nextPutAll: ' ' ].
		     element storeOn: aStream ].
    aStream nextPut: $).
! !



!Set methodsFor: 'storing'!

storeOn: aStream
    | hasElements |
    aStream nextPutAll: '(Set new'.
    hasElements := false.
    self do:
    	[ :element | aStream nextPutAll: ' add: '.
		     element storeOn: aStream.
		     aStream nextPut: $;.
		     hasElements := true ].
    hasElements ifTrue: [ aStream nextPutAll: ' yourself' ].
    aStream nextPut: $).
! !



!Set methodsFor: 'private'!

basicAt: i
    ^myArray at: i
!

basicAt: i put: x
    ^myArray at: i put: x.
!

basicSize
    ^myArray size
!

initArray: anInteger
  myArray := Array new: anInteger
!

setTally
    "Instance variable initialization."
    tally := 0
!

rehashObjectsAfter: index
    "Rehashes all the objects in the collection after index to see if any of
    them hash to index.  If so, that object is copied to index, and the
    process repeats with that object's index, until a nil is encountered."
    | i size count element |
    i := index.
    size := self basicSize.
    count := size.
    self basicAt: index put: nil.
    [ count := count - 1.
      i := i \\ size + 1.
      element := self basicAt: i.
      count > 0 and: [ element notNil ] ]
    	whileTrue:
	    [ self basicAt: i put: nil.
	      self basicAt: (self findObjectIndex: element) put: element ].
    ^self
!

findObjectIndex: anObject ifFull: aBlock
    "Tries to see if anObject exists as an indexed variable.  If it's searched
    the entire set and the object is not to be found, aBlock is evaluated and
    it's value is returned."
    | index count size newSet element |
    size := self basicSize.
    index := anObject hash \\ size + 1.
    count := size.
    [ count > 0 ]
    	whileTrue:
	    [ element := self basicAt: index.
    	      (element isNil or: [ element = anObject ])
	    	ifTrue: [ ^index ].
	      index := index \\ size + 1.
	      count := count - 1 ].
    ^aBlock value
!
	    
findObjectIndex: anObject
    "Finds the given object in the set and returns its index.  If the set
    doesn't contain the object and there is no nil element, the set is
    grown and then the index of where the object would go is returned."
    ^self findObjectIndex: anObject
     	  ifFull: [ self grow.
	    	    self findObjectIndexNoGrow: anObject
		     	   ifAbsent: [ self error: 'failed to grow a new empty element!!' ] ]
!

findObjectIndexNoGrow: anObject ifAbsent: aBlock
    | index |
    index := self findObjectIndex: anObject ifFull: [ 0 ].
    index = 0 
    	ifTrue: [ ^aBlock value ]
	ifFalse: [ ^index ]
!

grow
    | newSet |
    newSet := self species new: self basicSize + self growSize.
    self do: [ :element | newSet add: element ].
    myArray := newSet privateArray.
    ^self
!

privateArray
    ^myArray
!

growSize
    ^self basicSize max: 4
! !
