"======================================================================
|
|   IdentityDictionary Method Definitions
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

Dictionary variableSubclass: #IdentityDictionary
	   instanceVariableNames: 'values'
	   classVariableNames: ''
	   poolDictionaries: ''
	   category: 'Collections-Unordered'!

IdentityDictionary comment:
'I am similar to dictionary, except that my representation is
different, and I use the object identity comparision message == to
determine equivalence of indices.' !

!IdentityDictionary class methodsFor: 'instance creation'!

new
    ^self new: 4
!

new: anInteger
    ^(super new: anInteger) initValues

! !



!IdentityDictionary methodsFor: 'accessing'!

add: anAssociation
    self at: anAssociation key put: anAssociation value.
    ^anAssociation
!

at: key put: value
    | index |
    index := self findKeyIndex: key.
    (self basicAt: index) isNil
    	ifTrue: [ tally := tally + 1 ].
    self basicAt: index put: key.
    values basicAt: index put: value.
    ^value
!

at: key ifAbsent: aBlock
    | index |
    index := self findKeyIndex: key.
    (self basicAt: index) isNil
    	ifTrue: [ ^aBlock value ].
    ^values basicAt: index
!    
    
associationAt: key ifAbsent: aBlock
    | index assoc|
    ^Association key: key
		 value: (self at: key
		    	      ifAbsent: [ ^aBlock value ])
!

keyAtValue: value ifAbsent: exceptionBlock
    self indicesDo:
    	[ :i | value = (values basicAt: i)
    	         ifTrue: [ ^self basicAt: i] ].
    ^exceptionBlock value
! !



!IdentityDictionary methodsFor: 'testing'!
includesAssociation: anAssociation
    | index |
    index := self findKeyIndex: anAssociation key.
    ^(self basicAt: index) notNil
    	and: [ (values basicAt: index) = anAssociation value ]
!

includesKey: key
    ^(self basicAt: (self findKeyIndex: key)) notNil
! !



!IdentityDictionary methodsFor: 'removing'!
removeKey: key ifAbsent: aBlock
    | index value|
    index := self findKeyIndexNoGrow: key ifAbsent: [ ^aBlock value ].
    value := values basicAt: index.
    self basicAt: index put: nil.
    values basicAt: index put: nil.
    tally := tally - 1.
    self rehashObjectsAfter: index.
    ^ value
! !



!IdentityDictionary methodsFor: 'enumerating'!
associationsDo: aBlock
    self indicesDo:
    	[ :i | aBlock value: (Association key: (self basicAt: i)
	    	    	    	    	  value: (values basicAt: i)) ]
!

"These could be implemented more efficiently by 
 doing the explicit scanning of the dictionary by hand"
keysDo: aBlock
    self indicesDo: [ :i | aBlock value: (self basicAt: i) ]
!

do: aBlock
    self indicesDo: [ :i | aBlock value: (values basicAt: i) ]
!

select: aBlock
    | newDict |
    newDict := self species new.
    self indicesDo:
    	[ :i | (aBlock value: (values basicAt: i))
    	         ifTrue: [ newDict add: (Association key: (self basicAt: i)
		    	    	    	    	    value: (values basicAt: i))] ].
    ^newDict
! !



!IdentityDictionary methodsFor: 'comparing'!

= aDictionary
    tally ~= aDictionary size ifTrue: [ ^false ].
    self indicesDo:
    	[ :i | (values basicAt: i) = (aDictionary at: (self basicAt: i)
	    	    	    	                  ifAbsent: [ ^false ])
    	         ifFalse: [ ^false ] ].
    ^true
!

hash
    | hashValue |
    hashValue := tally.
    self indicesDo:
    	[ :i | hashValue := hashValue + (self basicAt: i) hash.
	       hashValue := hashValue + (values basicAt: i) hash ].
    ^hashValue
! !



!IdentityDictionary methodsFor: 'printing'!

printOn: aStream
    aStream nextPutAll: self class name , ' (' .
    aStream nl.
    self indicesDo:
    	[ :i | aStream tab.
	       (self basicAt: i) storeOn: aStream.
	       aStream nextPut: $,.
	       (values basicAt: i) storeOn: aStream.
	       aStream nl ].
    aStream nextPut: $)
! !



!IdentityDictionary methodsFor: 'storing'!

storeOn: aStream
    | hasElements |
    aStream nextPutAll: '(', self class name , ' new'.
    hasElements := false.
    self indicesDo:
    	[ :i | aStream nextPutAll: ' at: '.
    	       (self basicAt: i) storeOn: aStream.
	       aStream nextPutAll: ' put: '.
    	       (values basicAt: i) storeOn: aStream.
	       aStream nextPut: $;.
	       hasElements := true ].
    hasElements ifTrue: [ aStream nextPutAll: ' yourself' ].
    aStream nextPut: $)
! !



!IdentityDictionary methodsFor: 'private'!

initValues
    values := Array new: self basicSize
!

indicesDo: aBlock
    "Invokes aBlock with all the indices of the set that have valid keys"
    1 to: self basicSize do:
    	[ :i | (self basicAt: i) notNil
	    	  ifTrue: [ aBlock value: i ] ]
!    

rehashObjectsAfter: index
    "### rehash bug needs to be fixed!!"
    "Rehashes all the objects in the collection after index to see if any of
    them hash to index.  If so, that object is copied to index, and the
    process repeats with that object's index, until a nil is encountered."
    | i size count key |
    i := index.
    size := self basicSize.
    count := size.
    [ count > 0 ]
    	whileTrue:
	    [ i := i \\ size + 1.
    	      key := self basicAt: i.
	      key isNil ifTrue: [ ^self ].
    	      ((key hash \\ size) + 1) = index
	      	ifTrue: [ self basicAt: index put: key.
		    	  values basicAt: index put: (values basicAt: i).
		    	  self basicAt: i put: nil.  "Be tidy"
			  values basicAt: i put: nil."Be tidy"
			  index := i ].
    	      count := count - 1 ]
!

findKeyIndex: aKey ifFull: aBlock
    "Tries to see if aKey exists as the key of an indexed variable (which is an
    association).  If it's searched the entire dictionary and the key is 
    not to be found, aBlock is evaluated and it's value is returned."
    | index count size key |
    size := self basicSize.
    index := aKey hash \\ size + 1.
    count := size.
    [ count > 0 ]
    	whileTrue:
	    [ key := self basicAt: index.
    	      (key isNil or: [ key == aKey ])
	    	ifTrue: [ ^index ].
	      index := index \\ size + 1.
	      count := count - 1. ].
    ^aBlock value
!
	    
findKeyIndex: aKey
    "Finds an association with the given key in the dictionary and returns its
    index.  If the dictionary doesn't contain the object and there is no nil
    element, the dictionary is grown and then the index of where the object
    would go is returned."
    ^self findKeyIndex: aKey
     	  ifFull: [ self grow.
	    	    self findKeyIndexNoGrow: aKey
		     	 ifAbsent: [ ^self error: 'failed to grow a new empty element!!' ] ]
!

grow
    | newDict |
    newDict := self species new: self basicSize + self growSize.
    self indicesDo: [ :i | newDict at: (self basicAt: i)
				   put: (values basicAt: i) ].
    ^self become: newDict
!

growSize
    ^self basicSize max: 4

! !


