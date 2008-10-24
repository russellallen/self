"======================================================================
|
|   LinkedList Method Definitions
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
Modified by Mario Wolczko, July 1995.

$Revision: 30.1 $
"

SequenceableCollection subclass: #LinkedList
		       instanceVariableNames: 'firstLink lastLink'
		       classVariableNames: ''
		       poolDictionaries: ''
		       category: 'Collections-Ordered'!

LinkedList comment:
'I provide methods that access and manipulate linked lists.  I assume that 
the elements of the linked list are subclasses of Link, because I use 
the methods that class Link supplies to implement my methods.' !

!LinkedList methodsFor: 'accessing'!

at: index
    "Return the element that is index into the linked list."
    | i element |
    i := 1.
    element := firstLink.
    [element isNil] whileFalse:
    	[ i = index ifTrue: [ ^element ].
	  i := i + 1.
	  element := element nextLink ].
    ^self error: 'index out of bounds in linked list'
!

at: index put: object
    self error: 'Do not store into a LinkedList using at:put:'
! !



!LinkedList methodsFor: 'adding'!

add: aLink
    "Add aLink at the end of the list; return aLink."
    self addLast: aLink.
    ^aLink
!

addFirst: aLink
    "Add aLink at the head of the list; return aLink."
    lastLink isNil ifTrue: [ lastLink := aLink ].
    aLink nextLink: firstLink.
    firstLink := aLink.
    ^aLink
!

addLast: aLink
    "Add aLink at then end of the list; return aLink."
    firstLink isNil ifTrue: [ firstLink := aLink ].
    lastLink notNil ifTrue: [ lastLink nextLink: aLink ].
    lastLink := aLink.
    ^aLink
!

removeFirst
    "Remove the first element from the list and return it, or error if the
    list is empty."

    ^self remove: firstLink
    	  ifAbsent: [ ^self error: 'attempted to remove from an empty list' ]
!    

removeLast
    "Remove the final element from the list and return it, or error if the
    list is empty."

    ^self remove: lastLink
    	  ifAbsent: [ ^self error: 'attempted to remove from an empty list' ]
!

remove: aLink ifAbsent: aBlock
    "Remove aLink from the list and return it, or invoke aBlock if it's not
    found in the list."
    | temp |
    aLink == firstLink
    	ifTrue: [ firstLink := firstLink nextLink.
	    	  firstLink isNil ifTrue: [ lastLink := nil ] ]
	ifFalse: [ temp := firstLink.
	    	   [ temp isNil ifTrue: [ ^aBlock value ].
		     temp nextLink == aLink ] whileFalse:
		     	[ temp := temp nextLink ].
		   temp nextLink: aLink nextLink.
		   aLink == lastLink ifTrue: [ lastLink := temp ] ].
    aLink nextLink: nil.
    ^aLink
! !



!LinkedList methodsFor: 'enumerating'!

do: aBlock
    | aLink |
    aLink := firstLink.
    [ aLink notNil] whileTrue:
    	[ aBlock value: aLink.
	  aLink := aLink nextLink]
! !



!LinkedList methodsFor: 'testing'!

isEmpty
    "Returns true if the list contains no members"
    ^firstLink isNil
! !



!LinkedList methodsFor: 'printing'!

printOn: aStream
    aStream nextPutAll: self classNameString.
! !



