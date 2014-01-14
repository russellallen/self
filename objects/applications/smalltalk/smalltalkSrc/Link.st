"======================================================================
|
|   Link Method Definitions
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

Object subclass: #Link
       instanceVariableNames: 'privateNextLink'
       classVariableNames: ''
       poolDictionaries: ''
       category: 'Collections-Ordered'!

Link comment: 
'I represent simple linked lists.  Generally, I am not used by myself, but
rather a subclass adds other instance variables that hold the information
for each node, and I hold the glue that keeps them together.' !

!Link class methodsFor: 'instance creation'!

nextLink: aLink
    ^self new nextLink: aLink

! !



!Link methodsFor: 'accessing'!

nextLink
    ^privateNextLink
!

nextLink: aLink
    privateNextLink := aLink.
    ^aLink
! !

