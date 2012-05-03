 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         hiddenSlotMenuItem = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'hiddenSlotMenuItem' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals hiddenSlotMenuItem.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hiddenSlotMenuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: private'
        
         altName.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hiddenSlotMenuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         hiddenSlot <- bootstrap stub -> 'globals' -> 'slots' -> 'plain' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         hiddenSlotMenuItem = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'hiddenSlotMenuItem' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits hiddenSlotMenuItem.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hiddenSlotMenuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hiddenSlotMenuItem' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hiddenSlotMenuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: public'
        
         submenuItems <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         menuItem = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'menuItem' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals menuItem.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'item'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         menuItem = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'menuItem' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits menuItem.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'menuItem' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         sortingOrder <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: public'
        
         submenuItems <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot'
        
         menuItem = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'menuItem' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'menuItem' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules menuItem.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotMenuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | 
            altName ifNil: [ | tail <- '' |
                preferences mergeAssignmentSlots && [hiddenSlot isAssignable]
                    ifTrue: [ tail: '  :' ].
                altName: hiddenSlot menuKey, tail. ].
            altName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotMenuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         name: n = ( |
            | altName: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotMenuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'menuItem' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotMenuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         sortingOrder = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         < x = ( |
            | 
            sortingOrder compare: x sortingOrder
                IfLess: true
                Equal: [name < x name]
                Greater: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | (sortingOrder =  x) sortingOrder  &&  [name =  x name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: x IfLess: lb Equal: eb Greater: gb = ( |
            | 
            sortingOrder compare: x sortingOrder
                IfLess: lb
                Equal: [name compare: x name
                    IfLess: lb
                    Equal: eb
                    Greater: gb
            ]   Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy submenuItems: list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         hasSubmenu = ( |
            | submenuItems isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | name hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuItem' -> () From: ( | {
         'ModuleInfo: Module: menuItem InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'orderedClonable' -> ().
        } | ) 



 '-- Side effects'

 globals modules menuItem postFileIn
