 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot'
        
         slotNameCpt = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'slotNameCpt' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'slotNameCpt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules slotNameCpt.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         slotNameCpt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotNameCpt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotNameCpt.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         button <- bootstrap stub -> 'globals' -> 'slotButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         location <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         slotNameCpt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotNameCpt.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotNameCpt' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         slot <- bootstrap stub -> 'globals' -> 'slotCpt' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         = sn = ( |
            | name = sn name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
            | name asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         assignmentSlotInfo = ( |
            | container assignmentSlotInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: containing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         componentsDo: block = ( |
            | block value: button).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: containing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         container = ( |
            | slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         create: n On: slt = ( |
            | 
            slot: slt.
            name: n.
            button: slotButton copy createOn: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | 
            button draw.
            drawBodyText: name
                      At: nameLocation
                    Font: nameFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: hiding\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         hide = ( |
            | container hide).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         isAssignable = ( |
            | slot isAssignable).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         isFakeSlot = ( |
            | container isFakeSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         isParent = ( |
            | slot isParent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrivate = ( |
            | slot isPrivate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         isPublic = ( |
            | slot isPublic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         minSize = ( |
            | 
            boxSizing minSlotNameSize: nameSize
                           ButtonSize: button minSize
                           Assignable: isAssignable).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         nameFont = ( |
            | 
            preferences useFontStyles ifTrue: [
                isParent ifTrue: [
                    isPublic ifTrue: [ ^ boxSizing boxPublicParentFont ].
                    isPrivate ifTrue: [ ^ boxSizing boxPrivateParentFont ].
                    ^ boxSizing boxParentFont.
                ] False: [
                    isPublic ifTrue: [ ^ boxSizing boxPublicFont ].
                    isPrivate ifTrue: [ ^ boxSizing boxPrivateFont ].
                ].
            ].
            boxSizing boxFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: placing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         nameLocation = ( |
            | 
            boxSizing slotNameLocationWithButtonSize: button minSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         nameSize = ( |
            | 
            nameFont sizeOfString: name asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfLines = ( |
            | (name occurrencesOf: '\n') succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: placing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         placeAt: pt = ( |
            | 
            location: pt.
            button placeAt: boxSizing slotButtonLocation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         printStringID = ( |
            | name asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         recreate = ( |
            | button recreate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAssignmentSlot = ( |
            | container removeAssignmentSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         removeSlot = ( |
            | container removeSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         resize: sz = ( |
            | 
            size: sz.
            button resize: boxSizing minSlotButtonSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         setSlotButtonCluster: cluster = ( |
            | button joinCluster: cluster).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'ModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         slotInfo = ( |
            | container slotInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         textColor = ( |
            | uiColors text).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameCpt' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: slotNameCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         visibility: v = ( |
            | 
            slot visibility: v).
        } | ) 



 '-- Side effects'

 globals modules slotNameCpt postFileIn
