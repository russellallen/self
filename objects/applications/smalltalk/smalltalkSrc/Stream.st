"======================================================================
|
|   Stream Method Definitions
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

Object subclass: #Stream
       instanceVariableNames: ''
       classVariableNames: ''
       poolDictionaries: ''
       category: 'Collections-Streams'!

Stream comment: 
'I am an abstract class that provides interruptable sequential access to
objects.  I can return successive objects from a source, or accept
successive objects and store them sequentially on a sink.  I provide
some simple iteration over the contents of one of my instances, and 
provide for writing collections sequentially.' !

!Stream methodsFor: 'reading'!

next
    self subclassResponsibility
!

next: anInteger
    "### I think that I should be able to implement this, but I'm not sure
    how to obtain the class element type in a generic fashion"
    self subclassResponsibility
!

nextMatchFor: anObject
    ^anObject = self next
!

contents
    "### I think that this should be implemented here, but right now I can't
    exactly see how to do it."
    self subclassResponsibility
! !



!Stream methodsFor: 'writing'!

nextPut: anObject
    self subclassResponsibility
!

nextPutAll: aCollection
    aCollection do: [ :element | self nextPut: element ].
    ^aCollection
!

next: anInteger put: anObject
    anInteger timesRepeat: [ self nextPut: anObject ].
    ^anObject
! !



!Stream methodsFor: 'testing'!

atEnd
    self subclassResponsibility
! !



!Stream methodsFor: 'enumerating'!

do: aBlock
    [self atEnd] whileFalse:
    	[aBlock value: self next ]

! !



!Stream methodsFor: 'printing'!

print: anObject
    anObject printOn: self
! !
