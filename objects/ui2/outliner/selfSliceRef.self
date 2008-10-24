 '$Revision: 30.2 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfSliceRef InitialContents: FollowSlot'
        
         selfSliceRef = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceRef' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceRef' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfSliceRef.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceRef' -> () From: ( | {
         'ModuleInfo: Module: selfSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceRef' -> () From: ( | {
         'ModuleInfo: Module: selfSliceRef InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceRef' -> () From: ( | {
         'ModuleInfo: Module: selfSliceRef InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceRef' -> () From: ( | {
         'ModuleInfo: Module: selfSliceRef InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceRef' -> () From: ( | {
         'ModuleInfo: Module: selfSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceRef' -> () From: ( | {
         'ModuleInfo: Module: selfSliceRef InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fCategory: SliceOutliner & helpers\x7fModuleInfo: Module: selfSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         selfSliceReferrent = bootstrap define: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals sliceReferrent copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceReferrent.

CopyDowns:
globals sliceReferrent. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> () From: ( | {
         'ModuleInfo: Module: selfSliceRef InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceReferrent parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: selfSliceRef InitialContents: FollowSlot'
        
         = x = ( |
            | 
            (mirror safeName = x mirror safeName) && [slots = x slots]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: selfSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: x IfLess: lb Equal: eb Greater: gb = ( |
            | 
            mirror safeName compare: x mirror safeName
             IfLess: lb
             Equal: (slots compare: x slots IfLess: lb Equal: eb Greater: gb)
             Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selfSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForNone: holder = ( |
            | 
            copyMirror: holder Slots: vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selfSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForOne: aSlot = ( |
            | 
            copyMirror: aSlot holder Slots: vector copyAddFirst: aSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selfSliceRef InitialContents: FollowSlot'
        
         copyMirror: m Selector: s = ( |
            | 
            copyMirror: m Slot: m at: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selfSliceRef InitialContents: FollowSlot'
        
         copyMirror: m Slot: s = ( |
            | 
            copyMirror: m Slots: vector copyAddFirst: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selfSliceRef InitialContents: FollowSlot'
        
         copyMirror: m Slots: s = ( |
            | 
            (copy mirror: m) slots: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: selfSliceRef InitialContents: FollowSlot'
        
         hash = ( |
            | 
            mirror safeName hash ^^ slots hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfSliceRef InitialContents: FollowSlot'
        
         mirror = ( |
            | holder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfSliceRef InitialContents: FollowSlot'
        
         mirror: m = ( |
            | holder: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfSliceRef InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceReferrent' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfSliceRef InitialContents: FollowSlot'
        
         slots = ( |
            | items).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfSliceRef InitialContents: FollowSlot'
        
         slots: s = ( |
            | items: s).
        } | ) 



 '-- Side effects'

 globals modules selfSliceRef postFileIn
