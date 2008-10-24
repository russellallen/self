"======================================================================
|
|   ArrayedCollection Method Definitions
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

SequenceableCollection subclass: #ArrayedCollection
		       instanceVariableNames: ''
		       classVariableNames: ''
		       poolDictionaries: ''
		       category: 'Collections-Abstract'!

ArrayedCollection comment: 
'My instances are objects that are generally fixed size, and are accessed
by an integer index.  The ordering of my instance''s elements is determined 
externally; I will not rearrange the order of the elements.' !

!ArrayedCollection class methodsFor: 'instance creation'!

with: element1
    | anArrayedCollection |
    anArrayedCollection := self new: 1.
    anArrayedCollection at: 1 put: element1.
    ^anArrayedCollection
!

with: element1 with: element2
    | anArrayedCollection |
    anArrayedCollection := self new: 2.
    anArrayedCollection at: 1 put: element1.
    anArrayedCollection at: 2 put: element2.
    ^anArrayedCollection
!

with: element1 with: element2 with: element3
    | anArrayedCollection |
    anArrayedCollection := self new: 3.
    anArrayedCollection at: 1 put: element1.
    anArrayedCollection at: 2 put: element2.
    anArrayedCollection at: 3 put: element3.
    ^anArrayedCollection
!

with: element1 with: element2 with: element3 with: element4
    | anArrayedCollection |
    anArrayedCollection := self new: 4.
    anArrayedCollection at: 1 put: element1.
    anArrayedCollection at: 2 put: element2.
    anArrayedCollection at: 3 put: element3.
    anArrayedCollection at: 4 put: element4.
    ^anArrayedCollection
!

new: size withAll: value
    ^(self new: size) atAllPut: value
! !



!ArrayedCollection methodsFor: 'instance creation'!

add: value
    self shouldNotImplement
! !



!ArrayedCollection methodsFor: 'accessing'!

size
    "To prevent recursion in inherited method"
    ^self basicSize
! !


