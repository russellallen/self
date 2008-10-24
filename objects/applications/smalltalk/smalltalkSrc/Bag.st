"======================================================================
|
|   Bag Method Definitions
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
Modified by Mario Wolczko, July 1995

$Revision: 30.1 $
"

Collection subclass: #Bag
	   instanceVariableNames: 'contents'
	   classVariableNames: ''
	   poolDictionaries: ''
	   category: 'Collections-Unordered'!

Bag comment:
'My instances are unordered collections of objects.  You can think
of me as a set with a memory; that is, if the same object is added to me
twice, then I will report that that element has been stored twice.'!


!Bag class methodsFor: 'instance creation'!

new
    ^super new initContents
! !



!Bag methodsFor: 'adding'!

add: newObject withOccurrences: anInteger
    contents at: newObject
	     put: (self occurrencesOf: newObject) + anInteger.
    ^newObject
!

add: newObject
    self add: newObject withOccurrences: 1.
    ^newObject 
!

at: index
    self error: 'at: is not allowed for a Bag'
!

at: index put: value
    self error: 'at:put: is not allowed for a Bag'
! !



!Bag methodsFor: 'removing'!

remove: oldObject ifAbsent: anExceptionBlock
    | count |
    "Remove oldObject from the collection and return it.  Since we're using
    a dictionary, we need decrement the value until it's zero, in which case
    we can then remove the object from the dictionary"
    count := self occurrencesOf: oldObject.
    count = 0 ifTrue: [ ^anExceptionBlock value ].
    count = 1 ifTrue: [ contents removeKey: oldObject ]
    	      ifFalse: [ contents at: oldObject
	      	    	    	  put: count - 1 ].
    ^oldObject
! !



!Bag methodsFor: 'testing'!

occurrencesOf: anObject
    ^contents at: anObject ifAbsent: [ ^0 ]
!

size
    | count |
    count := 0.
    contents do: [ :element | count := count + element ].
    ^count
!

hash
    ^contents hash
!

= aBag
    self class == aBag class
	ifFalse: [ ^false ].
    ^contents = aBag contents
! !



!Bag methodsFor: 'enumerating'!

do: aBlock
    "Perform the block for all members in the collection.  For Bags, we need
    to go through the contents dictionary, and perform the block for as many
    occurrences of the objects as there are."
    contents associationsDo:
      [ :assoc |  assoc value timesRepeat: [ aBlock value: assoc key ] ]
! !



!Bag methodsFor: 'printing'!

printOn: aStream
    | firstTime |
    aStream nextPutAll: self classNameString.
    aStream nextPutAll: ' ('.
    firstTime := true.
    contents associationsDo:
      [ :assoc | firstTime ifTrue: [ firstTime := false ]
      	    	    	   ifFalse: [ aStream nextPut: Character space ].
    	    	 assoc key storeOn: aStream.
		 aStream nextPut: $,.
		 assoc value storeOn: aStream ].
    aStream nextPut: $)
! !



!Bag methodsFor: 'storing'!

storeOn: aStream
    | noElements |
    aStream nextPut: $(.
    aStream nextPutAll: self classNameString.
    aStream nextPutAll: ' new'.
    noElements := true.
    contents associationsDo:
      [ :assoc | aStream nextPutAll: ' add: '.
    	    	 assoc key storeOn: aStream.
		 aStream nextPutAll: ' withOccurrences: '.
		 assoc value storeOn: aStream.
		 aStream nextPut: $;.
		 noElements := false ].
    noElements ifFalse: [ aStream nextPutAll: '; yourself' ].
    aStream nextPut: $)
! !



!Bag methodsFor: 'private'!

initContents
    contents := Dictionary new
!

contents
    ^contents
! !

