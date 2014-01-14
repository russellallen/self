"======================================================================
|
|   Symbol Method Definitions
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

String variableByteSubclass: #Symbol
       instanceVariableNames: 'selfCanonicalString'
       classVariableNames: ''
       poolDictionaries: ''
       category: 'Collections-Text'!

Symbol comment: 
'My instances are unique throughout the Smalltalk system.  My instances 
behave for the most part like strings, except that they print differently,
and I guarantee that any two instances that have the same printed 
representation are in fact the same instance.' !

!Symbol class methodsFor: 'instance creation'!

internCharacter: aCharacter
    | s |
    s := String new: 1.
    s at: 1 put: aCharacter.
    ^self intern: s
! !


!Symbol class methodsFor: 'private'!

intern: aString
    | newSym canStr |
    canStr := aString asSelfString canonicalize.
    newSym := self fromSelfString: canStr.
    newSym selfCanonicalString: canStr.
    ^newSym
! !

!Symbol methodsFor: 'private'!

selfCanonicalString: s
    selfCanonicalString := s! !


!Symbol methodsFor: 'converting'!

asSelfString
  ^selfCanonicalString!

asSymbol
    ^self
! !



!Symbol methodsFor: 'comparing'!

= aSymbol
    ^selfCanonicalString == aSymbol selfCanonicalString
!

== aSymbol
    ^selfCanonicalString == aSymbol selfCanonicalString
! !


!Symbol methodsFor: 'misc'!

species
    ^String
! !



!Symbol methodsFor: 'storing'!

storeOn: aStream
    ('#' , self) printOn: aStream
! !




!Symbol methodsFor: 'accessing'!

hash
    ^selfCanonicalString hash

! !
