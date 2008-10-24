"======================================================================
|
|   Message Method Definitions
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

$Revision: 30.2 $
"

Object subclass: #Message
       instanceVariableNames: 'selector args'
       classVariableNames: ''
       poolDictionaries: ''
       category: 'System'!

Message comment: 
'An instance is created when a message is not understood.' !
	   
!Message class methodsFor: 'instance creation'!

selector: s arguments: a
  ^self new selector: s arguments: a
!

!Message methodsFor: 'initialization'!

selector: s arguments: a
  selector := s.
  args := a
!

!Message methodsFor: 'invocation'!

reinvokeFor: aReceiver
    ^aReceiver perform: selector withArguments: args
!

!Message methodsFor: 'accessing'!

selector
    ^selector
! !
