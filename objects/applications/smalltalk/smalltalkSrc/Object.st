"======================================================================
|
|   Object Method Definitions
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

Object comment: 
'I am the root of the Smalltalk class system. 
All classes in the system are subclasses of me.' !


!Object methodsFor: 'comparing'!

== anObject
   <primitive: '_Eq: anObject '>
   ^self primitiveFailed
!

= anObject
   ^self == anObject
!

~= anObject
    ^(self = anObject) == false
!

~~ anObject
    ^(self == anObject) == false 
!

isNil
    ^false
!

notNil
    ^true
! !



!Object methodsFor: 'accessing'!

at: index
    ^self basicAt: index
!

at: index put: value
    ^self basicAt: index put: value
!

basicAt: index
    ^self primBasicAt: index - 1
!

basicAt: index put: value
    self primBasicAt: index - 1 put: value.
    ^value
!

basicSize
   <primitive: '_Size'>
   ^self primitiveFailed
!

primBasicAt: index
    <primitive: '_At: index '>
    ^self primitiveFailed
!

primBasicAt: index put: value
    <primitive: '_At: index Put: value '>
    ^self primitiveFailed
!

size
    ^self basicSize
! !

!Object methodsFor: 'access to Self'!

selfLobby
    "This provides access to the Self world."
    ^0 lobby
!

smalltalkEmulator
    "This provides access to the Smalltalk translator itself.
     Feeling reflective?  Make my day!!"
    ^self selfLobby smalltalkEmulator
! !

