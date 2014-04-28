"======================================================================
|
|   UndefinedObject Method Definitions
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

Object subclass: #UndefinedObject
       instanceVariableNames: ''
       classVariableNames: ''
       poolDictionaries: ''
       category: 'Kernel-Objects'!

UndefinedObject comment:
'I have the questionable distinction of being a class with only one
instance, which is the object "nil".  I suspect that I should be sent
messages when errors occur, but currently I am not.' !


!UndefinedObject methodsFor: 'testing'!

isNil
    ^true
!

notNil
    ^false
! !


