 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'false' -> () From: ( | {
         'Comment: if b is a block, && skips evaluation of b (short-circuit) and\x7fModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         && b = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'false' -> () From: ( | {
         'Comment: xor\x7fModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         ^^ b = ( |
            | b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'false' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         asInteger = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'false' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: b IfLess: lb Equal: eb Greater: gb = ( |
            | b ifFalse: eb True: lb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'false' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         ifTrue: b1 False: b2 = ( |
            | 
            b2 value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'false' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         not = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         boolean = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'boolean' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits boolean.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'false' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'boolean' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'false' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'false' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'false' -> () From: ( | {
         'Comment: or\x7fModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         || b = ( |
            | b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot'
        
         boolean = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'boolean' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'boolean' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules boolean.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boolean' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boolean' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boolean' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot'
        
         myComment <- 'Init must have already created true and false from systemObjects'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boolean' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boolean' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'true' -> () From: ( | {
         'Comment: and\x7fModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         && b = ( |
            | b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'true' -> () From: ( | {
         'Comment: xor\x7fModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         ^^ b = ( |
            | b value not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'true' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         asInteger = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'true' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: b IfLess: lb Equal: eb Greater: gb = ( |
            | b ifTrue: eb False: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'true' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         ifTrue: b1 False: b2 = ( |
            | 
            b1 value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'true' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         not = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'true' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'boolean' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'true' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'true' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'true' -> () From: ( | {
         'Comment: if b is a block, || skips evaluation of b (short-circuit) or\x7fModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         || b = ( |
            | true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boolean' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot'
        
         = b = ( |
            | == b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boolean' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | identityHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boolean' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         ifFalse: b = ( |
            | ifTrue: nil False: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boolean' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         ifFalse: b1 True: b2 = ( |
            | ifTrue: b2  False: b1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boolean' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot\x7fVisibility: public'
        
         ifTrue: b = ( |
            | ifTrue: b   False: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boolean' -> () From: ( | {
         'ModuleInfo: Module: boolean InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'orderedOddball' -> ().
        } | ) 



 '-- Side effects'

 globals modules boolean postFileIn
