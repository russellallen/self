"======================================================================
|
|   Association Method Definitions
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

LookupKey subclass: #Association
	  instanceVariableNames: 'key value'
	  classVariableNames: ''
	  poolDictionaries: ''
	  category: 'Magnitudes'!

Association comment: 
'My instances represent a mapping between two objects.  Typically, my
"key" object is a symbol, but I don''t require this.  My "value" object has 
no conventions associated with it; it can be any object at all.' !
	      

!Association class methodsFor: 'instance creation'!

key: aKey value: aValue
    ^self new key: aKey value: aValue
! !



!Association methodsFor: 'accessing'!

value: aValue
    value := aValue
!

key: aKey value: aValue
    key := aKey.
    value := aValue
!

key
    ^key
!

value
    ^value
! !



!Association methodsFor: 'testing'!

= anAssociation
    ^key = anAssociation key and: [ value = anAssociation value ]
!

hash
    ^key hash + value hash

! !




!Association methodsFor: 'printing'!

printOn: aStream
    self key storeOn: aStream.
    aStream nextPutAll: ' -> '.
    self value storeOn: aStream
! !



!Association methodsFor: 'storing'!

storeOn: aStream
    aStream nextPutAll: '(Association key: '.
    self key storeOn: aStream.
    aStream nextPutAll: ' value: '.
    self value storeOn: aStream.
    aStream nextPut: $)
! !

