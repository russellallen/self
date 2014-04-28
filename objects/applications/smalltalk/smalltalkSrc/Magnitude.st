"======================================================================
|
|   Magnitude Method Definitions
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

Object subclass: #Magnitude
       instanceVariableNames: ''
       classVariableNames: ''
       poolDictionaries: ''
       category: 'Magnitudes'!

Magnitude comment: 
'I am an abstract class.  My objects represent things that are discrete and 
map to a number line.  My instances can be compared with < and >.' !

!Magnitude methodsFor: 'comparing'!

"Relational operators.  '==', '~=', '~~' are inherited from Object"

= aMagnitude
    self subclassResponsibility
!

< aMagnitude
    self subclassResponsibility
!

> aMagnitude
    self subclassResponsibility
!

<= aMagnitude
    ^(self < aMagnitude) | (self = aMagnitude)
!

>= aMagnitude
    ^(self > aMagnitude) | (self = aMagnitude)
! !



!Magnitude methodsFor: 'misc methods'!

between: min and: max
    "Returns true if object is inclusively between min and max."
    ^(self >= min) and: [ self <= max ]
!

min: aMagnitude
    self < aMagnitude ifTrue: [ ^self ]
    	    	      ifFalse: [ ^aMagnitude ]
!

max: aMagnitude
    self > aMagnitude ifTrue: [ ^self ]
    	    	      ifFalse: [ ^aMagnitude ]
! !

