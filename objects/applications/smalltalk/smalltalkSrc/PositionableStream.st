"======================================================================
|
|   PositionableStream Method Definitions
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

Stream subclass: #PositionableStream
       instanceVariableNames: 'collection ptr endPtr access'
       classVariableNames: ''
       poolDictionaries: ''
       category: 'Collections-Streams'!

PositionableStream comment: 
'My instances represent streams where explicit positioning is permitted.
Thus, my streams act in a manner to normal disk files: you can read
or write sequentially, but also position the file to a particular place
whenever you choose.  Generally, you''ll want to use ReadStream, WriteStream
or ReadWriteStream instead of me to create and use streams.' !


!PositionableStream class methodsFor: 'instance creation'!

on: aCollection
    self subclassResponsiblity
!

on: aCollection from: firstIndex to: lastIndex
    ^self on: (aCollection copyFrom: firstIndex to: lastIndex)

! !



!PositionableStream methodsFor: 'reading'!

next
    | element |
    (access bitAnd: 1) = 0
    	ifTrue: [ ^self shouldNotImplement ].
    self atEnd ifTrue: [ ^self error: 'end of stream reached' ].
    element := collection at: ptr.
    ptr := ptr + 1.
    ^element
!

next: anInteger
    "Returns a collection of the same type that the stream accesses, that has
    the next anInteger elements from the stream."
    | newStream |
    newStream := WriteStream on: (collection species new: 0).
    anInteger timesRepeat: [ newStream nextPut: (self next) ].
    ^newStream contents
!

peek
    "Returns the next element of the stream without moving the pointer.
    Returns nil when at end of stream."
    | peekValue |
    self atEnd ifTrue: [ ^nil ].
    peekValue := self next.
    self skip: -1.
    ^peekValue    
!

peekFor: anObject
    "Returns true and gobbles the next element from the stream of it is
    equal to anObject, returns false and doesn't gobble the next element
    if the next element is not equal to anObject."
    (self peek) = anObject
    	ifTrue: [ self next.
	    	  ^true ]
    	ifFalse: [ ^false ]
!

upTo: anObject
	| newStream element |
	newStream := WriteStream on: (collection species new: 0).
	[self atEnd]
		whileFalse:
			[element := self next.
			element = anObject
				ifTrue: [^newStream contents].
			newStream nextPut: element.].
	^newStream contents
!

contents
    "Returns a collection of the same type that the stream accesses, up to 
    and including the final element."
    ^collection copyFrom: 1 to: endPtr
!

reverseContents
    "Returns a collection of the same type that the stream accesses, up to 
    and including the final element, but in reverse order."
    | newCollection |
    newCollection := collection species new: endPtr.
    1 to: endPtr do:
        [ :i | newCollection at: i put: (collection at: endPtr - i + 1) ].
    ^newCollection
! !



!PositionableStream methodsFor: 'testing'!

atEnd
    ^ptr > endPtr
!

isEmpty
    ^endPtr = 0
! !



!PositionableStream methodsFor: 'enumerating'!

!



!PositionableStream methodsFor: 'positioning'!

position
    ^ptr
!

position: anInteger
    (anInteger between: 1 and: endPtr)
	ifTrue: [ ptr := anInteger ]
	ifFalse: [ ^self error: 'position out of range' ]
!

reset
    ptr := 1
!

setToEnd
    ptr := endPtr + 1
!

skip: anInteger
    ptr := (ptr + anInteger max: 1) min: endPtr
!

skipTo: anObject
    "Moves the current position to after the next occurrence of anObject
    and returns true if anObject was found.  If anObject doesn't exist, the 
    position is unchanged, and false is returned."
    | curPos |
    curPos := self position.
    [ self atEnd ] whileFalse:
    	[ (self nextMatchFor: anObject)
	    ifTrue: [ ^true ] ].
    self position: curPos.
    ^false    

! !


!PositionableStream methodsFor: 'private'!

access: anInteger
    access := anInteger
! !
