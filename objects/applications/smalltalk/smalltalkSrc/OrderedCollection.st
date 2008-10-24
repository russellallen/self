"======================================================================
|
|   OrderedCollection Method Definitions
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

SequenceableCollection subclass: #OrderedCollection
		       instanceVariableNames: 'firstIndex lastIndex myArray'
		       classVariableNames: ''
		       poolDictionaries: ''
		       category: 'Collections-Ordered' !

OrderedCollection comment: 
'My instances represent ordered collections of arbitrary typed objects which
are not directly accessible by an index.  They can be accessed indirectly
through an index, and can be manipulated by adding to the end or based
on content (such as add:after:)' !

!OrderedCollection class methodsFor: 'instance creation'!

new: anInteger
    ^super new init: anInteger
!

new
    ^self new: 16

! !



!OrderedCollection methodsFor: 'accessing'!

at: index
    | realIndex |
    realIndex := index + firstIndex - 1.
    (realIndex >= firstIndex and: [ realIndex <= lastIndex ])
    	ifTrue: [ ^self basicAt: realIndex ]
	ifFalse: [ self error: 'index out of bounds for ordered collection' ]
!

at: index put: anObject
    | realIndex |
    realIndex := index + firstIndex - 1.
    (realIndex >= firstIndex and: [ realIndex <= lastIndex ])
    	ifTrue: [ ^self basicAt: realIndex put: anObject ]
	ifFalse: [ self error: 'index out of bounds for ordered collection' ]
!    

after: oldObject
    "Return the element after oldObject.  Error if oldObject not found or
    if no following object is available"
    firstIndex to: lastIndex do:
    	[ :index |		"should we use '=' or '==' here?"
	    (self basicAt: index) = oldObject
	    	ifTrue: [
		    index < lastIndex
		    	ifTrue: [ ^self basicAt: index + 1 ]
			ifFalse: [ ^self error: 'no following object' ] ]
    	].
    self error: 'object not found'
!

before: oldObject
    "Return the element after oldObject.  Error if oldObject not found or
    if no following object is available"
    firstIndex to: lastIndex do:
    	[ :index |		"should we use '=' or '==' here?"
	    (self basicAt: index) = oldObject
	    	ifTrue: [
		    index > firstIndex
		    	ifTrue: [ ^self basicAt: index - 1 ]
			ifFalse: [ ^self error: 'no preceding object' ] ]
    	].
    self error: 'object not found'
!

copyEmpty
    ^self species new: self basicSize
!

size
    ^lastIndex - firstIndex + 1
! !



!OrderedCollection methodsFor: 'adding'!

add: anObject
    ^self addLast: anObject
!

add: newObject after: oldObject
    firstIndex to: lastIndex do:
    	[ :i | (self basicAt: i) = oldObject
	       	 ifTrue: [ self at: i + 1 insertObject: newObject.
    	       	    	   ^newObject ] ].
    self error: 'object not found in collection'
!

add: newObject before: oldObject
    firstIndex to: lastIndex do:
    	[ :i | (self basicAt: i) = oldObject
	       	 ifTrue: [ self at: i - 1 insertObject: newObject.
    	       	    	   ^newObject ] ].
    self error: 'object not found in collection'
!


addAllFirst: anOrderedCollection
    anOrderedCollection reverseDo:
    	[ :element | self addFirst: element ].
    ^anOrderedCollection
!
    
addAllLast: anOrderedCollection
    anOrderedCollection do:
    	[ :element | self addLast: element ].
    ^anOrderedCollection
!
    

addFirst: newObject
    firstIndex = 1
    	ifTrue: [ self growFirst ].
    firstIndex := firstIndex - 1.
    ^self basicAt: firstIndex put: newObject
!
    
addLast: newObject
    lastIndex = self basicSize
    	ifTrue: [ self growLast ].
    lastIndex := lastIndex + 1.
    ^self basicAt: lastIndex put: newObject
! !

!OrderedCollection methodsFor: 'copying'!

, aColl
    | newColl |
    newColl := self species new: self size + aColl size.
    self do: [ :e | newColl add: e].
    aColl do: [ :e | newColl add: e].
    ^newColl
! !



!OrderedCollection methodsFor: 'removing'!

remove: oldObject ifAbsent: exceptionBlock
    firstIndex to: lastIndex do: [ :index |
        (self basicAt: index) = oldObject
	    ifTrue: [self removeIndex: index.  ^oldObject]].
    ^exceptionBlock value
!

removeFirst
    lastIndex < firstIndex
    	ifTrue: 
    	    [ ^self error: 'attempted to remove from an empty collection' ].
    firstIndex := firstIndex + 1.
    ^self basicAt: firstIndex - 1
!

removeLast
    lastIndex < firstIndex
    	ifTrue: 
    	    [ ^self error: 'attempted to remove from an empty collection' ].
    lastIndex := lastIndex - 1.
    ^self basicAt: lastIndex + 1
! !



!OrderedCollection methodsFor: 'private'!

basicSize
    ^myArray size
!

basicAt: i
    ^myArray at: i
!

basicAt: i put: x
    ^myArray at: i put: x
!

init: anInteger
    myArray := Array new: anInteger.
    ^self initIndices
!

initIndices
    firstIndex := 1.
    lastIndex := firstIndex - 1
!

firstIndex: first lastIndex: last
    firstIndex := first.
    lastIndex := last
!

growFirst
    "Make growSize room at the start of the ordered collection, and copy
    all the elements of the old collection into the new one starting
    at the value that growSize returned."
    | newA delta |
    delta := self growSize.
    newA := Array new: myArray size + delta.
    firstIndex to: lastIndex do:
    	[ :index | newA at: delta + index - 1
	    	    	put: (myArray at: index) ].
    myArray := newA.
    self firstIndex: delta + firstIndex - 1
          lastIndex: delta + lastIndex - 1.
    ^self
!

growLast
    "Make growSize room at the end of the ordered collection, and copy
    all the elements of the old collection into the new one starting
    at firstIndex."
    | newA |
    newA := Array new: myArray size + self growSize.
    firstIndex to: lastIndex do:
    	[ :index | newA at: index
	    	       put: (myArray at: index) ].
    myArray := newA.
    ^self
!

grow
    ^self growLast
!

growTo: anInteger
    ^self species new: anInteger
!    

growSize
    ^self basicSize max: 4
!

privateArray
  ^myArray!

at: index insertObject: anObject
    lastIndex = self basicSize ifTrue: [ self growLast ].
    lastIndex to: index by: -1 do:
    	[ :i | self basicAt: i + 1
	    	    put: (self basicAt: i) ].
    self basicAt: index put: anObject.
    ^anObject
!

removeIndex: realIndex 
    "assumes removedIndex is within bounds"
    realIndex to: lastIndex - 1 do: [ :index |
        self basicAt: index put: (self basicAt: index + 1)].
    self basicAt: lastIndex put: nil.
    lastIndex := lastIndex - 1
! !
