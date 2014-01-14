"======================================================================
|
|   Character Method Definitions
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


Magnitude subclass: #Character 
	  instanceVariableNames: 'asciiValue'
	  classVariableNames: 'CharTable'
	  poolDictionaries: ''
	  category: 'Magnitudes'!

Character comment: 
'My instances represent the 256 characters of the character set.  I provide
messages to translate between integers and character objects, and provide
names for some of the common unprintable characters.' !


!Character class methodsFor: 'initialization'!

initialize
    CharTable := Array new: 256.
    0 to: 255 do: [ :i |
      CharTable at: i+1 put: (self new asciiValue: i)]
! !

!Character class methodsFor: 'instance creation'!

value: anInteger
    "Returns the character object corresponding to anInteger.  Error if
     anInteger is not an integer, or not in 0..255."
    ^CharTable at: anInteger + 1
! !

!Character class methodsFor: 'constants'!

backspace
    "Returns the character 'backspace'"
    ^Character value: 8
!

tab
    "Returns the character 'tab'"
    ^Character value: 9
!

nl
    "Returns the character 'nl'"
    ^Character value: 10
!

newPage
    "Returns the character 'newPage'"
    ^Character value: 12
!

cr
    "Returns the character 'cr'"
    ^Character value: 13
!

esc
    "Returns the character 'esc'"
    ^Character value: 27
!

space
    "Returns the character 'space'"
    ^Character value: 32	"could also return $ "
! !




!Character methodsFor: 'comparing'!

= char
    "Boolean return value; true if the characters are equal"
    ^self asciiValue = char asciiValue
! !


!Character methodsFor: 'converting'!

asInteger
   ^self asciiValue!

asciiValue
    ^asciiValue!

asciiValue: a
    asciiValue := a
! !



!Character methodsFor: 'comparing'!

< aCharacter
    ^self asciiValue < aCharacter asciiValue
!

<= aCharacter
    ^self asciiValue <= aCharacter asciiValue
!

> aCharacter
    ^self asciiValue > aCharacter asciiValue
!

>= aCharacter
    ^self asciiValue >= aCharacter asciiValue
! !


"must do this before any literal characters appear"
Character initialize!


!Character methodsFor: 'testing'!

isDigit
    "True if self is a 0-9 digit"
    ^self between: $0 and: $9
!

isLetter
    "True if self is an upper- or lowercase letter"
    ^(self between: $a and: $z) or: [ self between: $A and: $Z ]
!

isAlphaNumeric
    "True if self is a letter or a digit"
    ^self isLetter or: [ self isDigit ]
!

isLowercase
    "True if self is a lowercase letter"
    ^self between: $a and: $z
!

isUppercase
    "True if self is uppercase"
    ^self between: $A and: $Z
!

isSeparator
    "Returns true if self is a space, cr, tab, nl, or newPage"
    self > Character space ifTrue: [ ^false ].
    self = Character space ifTrue: [ ^true ].
    self = Character cr ifTrue: [ ^true ].
    self = Character tab ifTrue: [ ^true ].
    self = Character nl ifTrue: [ ^true ].
    self = Character newPage ifTrue: [ ^true ].
    ^false
!

isVowel
    "Returns true if self is a, e, i, o, or u; case insensitive"
    | char |
    char := self asLowercase.
    char = $a ifTrue: [ ^true ].    
    char = $e ifTrue: [ ^true ].    
    char = $i ifTrue: [ ^true ].    
    char = $o ifTrue: [ ^true ].    
    char = $u ifTrue: [ ^true ].    
    ^false
! !



!Character methodsFor: 'coercing'!

asLowercase
    "Returns self as a lowercase character if it's an uppercase letter,
     otherwise returns the character unchanged."
    self isUppercase ifFalse: [ ^self ].
    ^Character value: (self asciiValue) + 32
!

asUppercase
    "Returns self as a uppercase character if it's an lowercase letter,
     otherwise returns the character unchanged."
    self isLowercase ifFalse: [ ^self ].
    ^Character value: (self asciiValue) - 32
!

asSymbol
    "Returns the character self as a symbol."
    ^Symbol internCharacter: self
! !



!Character methodsFor: 'printing'!

printOn: aStream
    aStream nextPut: self
! !



!Character methodsFor: 'storing'!

storeOn: aStream
    aStream nextPut: $$.
    aStream nextPut: self
! !

