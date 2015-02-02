 '$Revision: 30.4 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: profileSliceRef InitialContents: FollowSlot'
        
         profileSliceRef = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceRef' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceRef' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules profileSliceRef.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceRef' -> () From: ( | {
         'ModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceRef' -> () From: ( | {
         'ModuleInfo: Module: profileSliceRef InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceRef' -> () From: ( | {
         'ModuleInfo: Module: profileSliceRef InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceRef' -> () From: ( | {
         'ModuleInfo: Module: profileSliceRef InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceRef' -> () From: ( | {
         'ModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.4 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceRef' -> () From: ( | {
         'ModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fCategory: Profile Slice Outliner & helpers\x7fModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         profileSliceReferrent = bootstrap define: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals sliceReferrent copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceReferrent.

CopyDowns:
globals sliceReferrent. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> () From: ( | {
         'ModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceReferrent parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         bci = ( |
            | 
            holder bci).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         bcisAndNodes = ( |
            | 
            items).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForOne: bciAndNode = ( |
            | 
            copyForHolder: bciAndNode Items: vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         holderIDString = ( |
            | 
            node holderIDString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         mirror = ( |
            | 
            node methodHolderMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         noBCI = -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         node = ( |
            | 
            holder node).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         ownerIDString = ( |
            | 
            node ownerIDString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profileSliceRef InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceReferrent' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: public'
        
         slots = ( |
             r.
            | 
            r: list copyRemoveAll.
            subnodesDo: [|:aNode| [|:exit| r addLast: aNode slotIfNone: exit] exit].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceReferrent' -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profileSliceRef InitialContents: FollowSlot\x7fVisibility: private'
        
         subnodesDo: blk = ( |
            | 
            bcisAndNodes do: [|:p| blk value: p node With: p bci]).
        } | ) 



 '-- Side effects'

 globals modules profileSliceRef postFileIn
