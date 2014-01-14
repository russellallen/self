"======================================================================
|
|   ReadWriteStream Method Definitions
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

WriteStream subclass: #ReadWriteStream
	    instanceVariableNames: ''
	    classVariableNames: ''
	    poolDictionaries: ''
	    category: 'Collections-Streams'!

ReadWriteStream comment: 
'I am the class of streams that may be read and written from simultaneously.
In some sense, I am the best of both ReadStream and WriteStream.' !


!ReadWriteStream class methodsFor: 'instance creation'!

on: aCollection
    | stream |
    stream := (super on: aCollection) access: 3.
    stream useWholeStream.
    ^stream
! !



!ReadWriteStream methodsFor: 'private'!

useWholeStream
    "Makes sure that the contents message to this object returns the
     whole contents, not just that which has been written so far."
    endPtr := collection size
! !
     
