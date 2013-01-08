 '$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Module Outliner\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleModel = bootstrap define: bootstrap stub -> 'globals' -> 'moduleModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals moduleHolderModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleModel.

CopyDowns:
globals moduleHolderModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: the menu\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals moduleHolderModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleModel parent buttonDescriptions.

CopyDowns:
globals moduleHolderModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: Added or Changed Slots\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: public'
        
         addedOrChangedSlots = ( |
            | 
            target safelyDo: [
              event sourceHand attach: 
                addedOrChangedSlotsInModuleMorph copyModule: target model module]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: All Objects\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: public'
        
         allObjects = ( |
            | 
            target safelyDo: [
              event sourceHand attach:
                slotHoldersMorph copyModule: target model module Event: event]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: All Slots\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: public'
        
         allSlots = ( |
            | 
            target safelyDo: [
              event sourceHand attach:
                slotsInModuleMorph copyModule: target model module]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: clean & dirty\x7fCategory: Forget I was changed\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: public'
        
         forgetChanges = ( |
            | 
            target model module beClean).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: Get Module Object\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         getModuleObject = ( |
            | 
            target safelyDo: [
              event sourceHand attach:
                event sourceHand world
                  outlinerForMirror: target model module asMirror
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: Get Owner Module\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         getOwner = ( |
            | 
            target safelyDo: [
              event sourceHand attach: 
                moduleModel newOutlinerFor:
                  target model module owner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: No Owner\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         noOwner = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleModel parent buttonDescriptions parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> 'parent' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleModel parent buttonDescriptions parent parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: reading & writing\x7fCategory: Read Module\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: public'
        
         readModule = ( |
            | 
            target model module fileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: Removed Slots\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: private'
        
         removedSlots = ( |
            | 
            target model removedSlots: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: reading & writing\x7fCategory: Write Module\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: public'
        
         writeModule = ( |
            | 
            target model module fileOut).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: the menu\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
            | 
            (
                'readModule' & 'writeModule' & 'forgetChanges' & myOutliner showOrHideComment & nil
              & 'getModuleObject' & 'yank'
              & (module ownerIfPresent: 'getOwner' IfAbsent: 'noOwner')
              & nil
              & 'allObjects' & 'allSlots' & 'addedOrChangedSlots' & 'removedSlots'
            ) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         comment = ( |
            | module comment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         comment: c = ( |
            | module comment: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: adapting to framework\x7fComment: an optimization\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         hasSubmodules = ( |
            | 
            module hasSubparts).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: public'
        
         headerButtonContents = ( |
             r.
            | 
            r: vector copyAddFirst: 'W' @ 
              'A target model module  fileOut'.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isCommentButtonWanted = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: accessing the module\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         module = ( |
            | referrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: adapting to framework\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         receiver = ( |
            | module).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: the menu\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: private'
        
         removedSlots: event = ( |
             rsp.
            | 
            rsp: module removedSlotPaths.
            event sourceHand attach:
              rsp isEmpty ifTrue: [ 
                textViewerMorph copyTitle: 'No removed slots in module ', module name
              ] False: [ | t <- '' |
                rsp do: [|:p| t: t & p fullName & '\n'].
                textViewerMorph copyTitle:  'Removed slots in module ', module name
                                     Text: t flatString.
              ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: adapting to framework\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         submodules = ( |
            | module subparts).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         submodulesUpdater = bootstrap define: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'submodulesUpdater' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals moduleHolderModel parent submodulesUpdater copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'submodulesUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleModel parent submodulesUpdater.

CopyDowns:
globals moduleHolderModel parent submodulesUpdater. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'submodulesUpdater' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'submodulesUpdater' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleModel parent submodulesUpdater parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'submodulesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         orderedThings = ( |
            | things).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> 'submodulesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> 'submodulesUpdater' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 
            module nameOrNone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleModel' -> 'parent' -> () From: ( | {
         'Category: editing name\x7fModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: private'
        
         unprotectedFinishChangingName: rr = ( |
             changedToExistingModule.
             newModule.
             newName.
            | 
            newName: rr editor contentsString.

            isForEditingNew && [newName isEmpty] ifTrue: [
             ^ myOutliner cancelChangingNameEditor: rr editor Event: rr event
            ].

            newModule: module changeNameTo: newName IfFail: [^ self].

            resend.unprotectedFinishChangingName: rr.

            safelyDo: [ myOutliner update ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         moduleModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'moduleModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'moduleModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules moduleModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleModel' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleModel' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleModel' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleModel' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleModel' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleModel' -> () From: ( | {
         'ModuleInfo: Module: moduleModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules moduleModel postFileIn
