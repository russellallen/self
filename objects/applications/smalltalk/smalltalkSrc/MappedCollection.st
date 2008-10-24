"======================================================================
|
|   MappedCollection Method Definitions
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

Collection subclass: #MappedCollection
	   instanceVariableNames: 'domain map'
	   classVariableNames: ''
	   poolDictionaries: ''
	   category: 'Collections-Unordered'!

MappedCollection comment: 
'I represent collections of objects that are indirectly indexed by names.
There are really two collections involved: domain and a map.  The map maps
between external names and indices into domain, which contains the
real association.  In order to work properly, the domain and map objects must
be instances of a subclass of SequenceableCollection or Dictionary. ' !

!MappedCollection class methodsFor: 'instance creation'!

collection: aCollection map: aMap
    ^self new setCollection: aCollection andMap: aMap
!

new
    self error: 'new not available for MappedCollections; use collection:map:'
! !


!MappedCollection methodsFor: 'accessing'!

at: key
    ^domain at: (map at: key)
!

at: key put: value
    ^domain at: (map at: key) put: value
!

contents
    | contents |
    contents := Bag new.
    map do: [ :domainKey | contents add: domain at: domainKey ].
    ^contents
!

size
    ^domain size
!

add: anObject
    self shouldNotImplement
!

contents
    | aBag |
    aBag := Bag new.
    map do: [ :value | aBag add: (domain at: value) ].
    ^aBag
!

do: aBlock
    map do: [ :value | aBlock value: (domain at: value) ]
!

collect: aBlock
    | aStream |
    aStream := WriteStream on: (self species new: self size).
    self do: [ :value | aStream nextPut: (aBlock value: value) ].
    ^aStream contents
!

select: aBlock
    | aStream |
    aStream := WriteStream on: (self species new: self size).
    self do: [ :value | (aBlock value: value) ifTrue:
    	    	[ aStream nextPut: value ] ].
    ^aStream contents
! !



!MappedCollection methodsFor: 'private'!

setCollection: aCollection andMap: aMap
    domain := aCollection.
    map := aMap
!

species
    ^domain species
! !
