"======================================================================
|
|   Time Method Definitions
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

Magnitude subclass: #Time
	  instanceVariableNames: 'privateSeconds'
	  classVariableNames: ''
	  poolDictionaries: ''
	  category: 'Magnitudes'!

Time comment: 
'My instances represent times of the day.  I provide methods for instance 
creation, methods that access components (hours, minutes, and seconds) of a 
time value, and a block execution timing facility.' !

!Time class methodsFor: 'instance creation'!

now
    ^self new setSeconds: Time secondClock
!

fromSeconds: secondCount
    ^self new setSeconds: (Time secondClock \\ (24*60*60)) + secondCount
!

millisecondClockValue
    ^self millisecondClock
!

millisecondsToRun: timedBlock
    | startTime|
    startTime := self millisecondClock.
    timedBlock value.
    ^self millisecondClock - startTime
! !



!Time methodsFor: 'accessing'!

hours
    ^(privateSeconds // (60*60)) \\ 24
!

minutes
    ^(privateSeconds // 60) \\ 60
!

seconds
    ^privateSeconds \\ 60
! !



!Time methodsFor: 'arithmetic'!

addTime: timeAmount
    ^Time new setSeconds: privateSeconds + timeAmount
!

subtractTime: timeAmount
    ^Time new setSeconds: privateSeconds - timeAmount
!

printOn: aStream
    self hours printOn: aStream.
    aStream nextPut: $:.
    self minutes < 10 ifTrue: [ aStream nextPut: $0 ].
    self minutes printOn: aStream.
    aStream nextPut: $:.
    self seconds < 10 ifTrue: [ aStream nextPut: $0 ].
    self seconds printOn: aStream
! !



!Time methodsFor: 'private'!

setSeconds: secs
    privateSeconds := secs
! !

!Time class methodsFor: 'primitives'!

secondClock
   ^(self selfLobby time current day * 24 * 60 * 60)
    + (self millisecondClock // 1000)
!

millisecondClock
   ^self selfLobby time current msec
! !


