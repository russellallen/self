 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: comparing\x7fCategory: to nil\x7fModuleInfo: Module: nil InitialContents: FollowSlot\x7fVisibility: public'
        
         ifNil: b = ( |
            | 
            ifNil: b IfNotNil: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: comparing\x7fCategory: to nil\x7fModuleInfo: Module: nil InitialContents: FollowSlot\x7fVisibility: public'
        
         ifNil: nilBlk IfNotNil: notNilBlk = ( |
            | notNilBlk value: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: comparing\x7fCategory: to nil\x7fModuleInfo: Module: nil InitialContents: FollowSlot\x7fVisibility: public'
        
         ifNotNil: b = ( |
            | 
            ifNil: [self] IfNotNil: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: comparing\x7fCategory: to nil\x7fModuleInfo: Module: nil InitialContents: FollowSlot\x7fVisibility: public'
        
         ifNotNil: notNilBlk IfNil: nilBlk = ( |
            | 
            ifNil: nilBlk IfNotNil: notNilBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: comparing\x7fCategory: to nil\x7fModuleInfo: Module: nil InitialContents: FollowSlot\x7fVisibility: public'
        
         isNil = ( |
            | ifNil: true IfNotNil: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: comparing\x7fCategory: to nil\x7fModuleInfo: Module: nil InitialContents: FollowSlot\x7fVisibility: public'
        
         isNotNil = ( |
            | isNil not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: nil InitialContents: FollowSlot'
        
         nil = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'nil' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'nil' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules nil.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nil' -> () From: ( | {
         'ModuleInfo: Module: nil InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nil' -> () From: ( | {
         'ModuleInfo: Module: nil InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nil' -> () From: ( | {
         'ModuleInfo: Module: nil InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nil' -> () From: ( | {
         'ModuleInfo: Module: nil InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nil' -> () From: ( | {
         'ModuleInfo: Module: nil InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nil' -> () From: ( | {
         'Category: comparing to nil\x7fModuleInfo: Module: nil InitialContents: FollowSlot\x7fVisibility: public'
        
         ifNil: nilBlk IfNotNil: notNilBlk = ( |
            | 
            nilBlk value: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nil' -> () From: ( | {
         'ModuleInfo: Module: nil InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nil' -> () From: ( | {
         'ModuleInfo: Module: nil InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 'nil').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nil' -> () From: ( | {
         'ModuleInfo: Module: nil InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 



 '-- Side effects'

 globals modules nil postFileIn
