"======================================================================
|
|   String Method Definitions
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

"because Strings are required for bootstrapping we do this in two
phases, installing the methods in a different class then renaming the
class."
ArrayedCollection variableByteSubclass: #String2
		  instanceVariableNames: ''
		  classVariableNames: ''
		  poolDictionaries: ''
		  category: 'Collections-Text'!

String2 comment: 
'My instances represent string data types.  I provide accessing and
manipulation methods for string data types.' !

!String2 class methodsFor: 'initialize'!

initialize
   "install String2 as String"
   Smalltalk at: #String put: String2.
   Smalltalk removeKey: #String2 ifAbsent: []
! !

!String2 class methodsFor: 'instance creation'!

fromSelfString: selfString
   | s i |
   s := self new: selfString size.
   i := 1.
   selfString bytesDo: [ :b :j |
     s at: i put: (Character value: b).
     i := i + 1].
   ^s
!

fromString: aString
    " ### probably should use regular copy"
    ^aString copyFrom: 1 to: aString size
!

readFrom: aStream
    | str newChar |
    str := WriteStream on: (self new: 0).
    aStream do:			" ### Is this risky, doing a next inside? "
    	[ :char | char == $'
	    	      ifTrue: [ newChar := aStream next.
		      	        newChar == $' ifFalse: [ str nextPut: $' ].
				str nextPut: newChar ]
    	    	      ifFalse: [ str nextPut: char ]
	].
    ^str contents
! !


!String2 methodsFor: 'accessing'!

basicAt: index
    ^Character value: (self primBasicAt: index - 1)!

basicAt: index Put: character
    ^self primBasicAt: index - 1 put: character asciiValue!

primBasicAt: index
    <primitive: '_ByteAt: index '>
    self primitiveFailed
!

primBasicAt: index put: byteValue
    <primitive: '_ByteAt: index Put: byteValue '>
    self primitiveFailed
!
basicSize
    <primitive: '_ByteSize'>
    self primitiveFailed
! !


!String2 methodsFor: 'comparing'!

< aString
    "Return true if the receiver is less than aString, ignoring case
    differences."
    self >= aString ifTrue: [ ^false ]
    	    	    ifFalse: [ ^true ]
!

> aString
    "Return true if the receiver is greater than aString, ignoring case
    differences."
    self <= aString ifTrue: [ ^false ]
    	    	    ifFalse: [ ^true ]
!

<= aString
    "Returns true if the receiver is less than or equal to aString,
    ignoring case differences.  If is receiver is an initial substring of
    aString, it is considered to be less than aString."
    | c1 c2 |
    " Scan self and aString until a character is clearly greater or lesser
      (All preceding characters must have been equal).  If the end is reached,
      one of the strings is a possibly improper initial substring of the other,
      and for the receiver to be less than aString, it must be the initial
      substring."
    1 to: (self size min: aString size) do:
    	[ :i | c1 := (self at: i) asLowercase.
	       c2 := (aString at: i) asLowercase.
	       c1 < c2 ifTrue: [ ^true ].
	       c1 > c2 ifTrue: [ ^false ] ].
    ^self size <= aString size
!

>= aString
    "Returns true if the receiver is greater than or equal to aString,
    ignoring case differences.  If is aString is an initial substring of
    the receiver, it is considered to be less than the receiver."
    | c1 c2 |
    1 to: (self size min: aString size) do:
    	[ :i | c1 := (self at: i) asLowercase.
	       c2 := (aString at: i) asLowercase.
	       c1 < c2 ifTrue: [ ^false ].
	       c1 > c2 ifTrue: [ ^true ] ].
    ^self size >= aString size
!



sameAs: aString
    "Returns true if the receiver is the same string as aString, ignoring
    case differences."
    self size ~= aString size ifTrue: [ ^false ].
    1 to: self size do:
    	[ :i | (self at: i) asLowercase ~= (aString at: i) asLowercase
	    	ifTrue: [ ^false ] ].
    ^true
!


match: aString
    ^self asLowercase matchSubstring: 1 in: aString asLowercase at: 1
! !



!String2 methodsFor: 'converting'!

asUppercase
    "Returns a copy of self as an uppercase string"
    | newStr |
    newStr := self species new: self size.
    1 to: self size do:
    	[ :i | newStr at: i put: (self at: i) asUppercase ].
    ^newStr
!

asLowercase
    "Returns a copy of self as a lowercase string"
    | newStr |
    newStr := self species new: self size.
    1 to: self size do:
    	[ :i | newStr at: i put: (self at: i) asLowercase ].
    ^newStr
!

asString
    "But I already am a string!!  Really!!"
    ^self
!

asSelfString
    "Return a Self mutable string for self"
    | s |
    s := self selfLobby globals mutableString copySize: self size.
    1 to: self size do: [ :i |
        s at: i - 1 put: (self at: i) asciiValue].
    ^s
!

fileName
    "But I don't HAVE a file name!!"
    ^nil
!

filePos
    "But I don't HAVE a file position!!"
    ^nil
!

asSymbol
    "Returns the symbol corresponding to the string"
    ^Symbol intern: self
! !



!String2 methodsFor: 'copying'!

shallowCopy
    | newStr |
    newStr := self species new: self size.
    1 to: self size do:
    	[ :i | newStr at: i put: (self at: i) ].
    ^newStr
!

deepCopy
    ^self shallowCopy
! !

!String2 methodsFor: 'file in'!

fileIn
    self smalltalkEmulator fileIn: self asSelfString! !


!String2 methodsFor: 'printing'!

printOn: aStream
    ^self do: 
	[ :char | aStream nextPut: char ] "this seems too primitive"
! !



!String2 methodsFor: 'storing'!

storeOn: aStream
    aStream nextPut: $'.
    self do:
    	[ :char | char == $' ifTrue: [ aStream nextPut: char ].
	    	  aStream nextPut: char ].
    aStream nextPut: $'
! !



!String2 methodsFor: 'private'!

matchSubstring: p in: aString at: s
    | pc |
    p > self size
    	ifTrue: [ ^s > aString size ].
    pc := self at: p.
    pc = $*
    	ifTrue: [ s to: (aString size) + 1 do:
	    	    [ :ss | (self matchSubstring: p + 1
		    	    	  in: aString
				  at: ss)
			        ifTrue: [ ^true ] ].
		  ^false ].
    s > aString size ifTrue: [ ^false ].
    pc = $#
    	ifTrue: [ ^self matchSubstring: p + 1 in: aString at: s + 1 ].

    pc = (aString at: s)
    	ifTrue: [ ^self matchSubstring: p + 1 in: aString at: s + 1 ].
    ^false
! !

String2 initialize!
