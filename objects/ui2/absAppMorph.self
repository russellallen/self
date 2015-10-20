 '$Revision: 30.2 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Applications\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractSimpleApplicationMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSimpleApplicationMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> () From: ( | {
         'ModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSimpleApplicationMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         addDuplicateButtonTo: menu = ( |
            | 
            menu addButtonTarget: self
                     ScriptBlock: [target duplicate: event]
                           Label: 'Duplicate'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         addLabel = ( |
            | 
            addMorph: 
              ((labelMorph copy
              fontSpec: fontSpec)
              color: fontColor)
              label: titleString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: copying\x7fCategory: override me\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         addLabelIfNeeded = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: background menu\x7fCategory: override me if you want\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         backgroundMenuButtonLabel = ( |
            | 
            'New ', morphTypeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: background menu\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         contributeToBackgroundMenu: m = ( |
            | 
            m addButton: (((
              ui2Button copy scriptBlock: [ event sourceHand attach: buttonArgs first copy ])
                                   label: backgroundMenuButtonLabel)
                              buttonArgs: vector copyAddFirst: self)
                ToGroup: 'applications'.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            resend.copy initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: absAppMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: style\x7fCategory: override me\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultColor = paint copyRed: 0.534702 Green: 0.839687  Blue: 0.789834.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: style\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         fontColor = ( |
            | 
            color textColorForBackground).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: style\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         fontSpec = ( |
            | globals fontSpec copyName: 'helvetica' Size: 12).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            resend.initializePrototype.
            removeAllMorphs.
            colorAll: defaultColor.
            addLabelIfNeeded.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | 
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fCategory: override me\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'abstractSimpleApplicationsMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy color: nonpluggableOutliner menuColor.
            addButtonsToMenu: menu.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: error handling\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         reportError: msg Event: event = ( |
             se.
            | 
            se: syntaxErrorMorph copyTitle: 'Error:' Message: msg.
            world safelyDo: [  
              world addMorph: se.  
              se globalPosition: event cursorPoint.
              world moveToFront: se.  
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> () From: ( | {
         'Category: copying\x7fCategory: override me\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 
            'a ', morphTypeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSimpleApplicationMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: absAppMorph InitialContents: FollowSlot'
        
         absAppMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'absAppMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'absAppMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules absAppMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absAppMorph' -> () From: ( | {
         'ModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absAppMorph' -> () From: ( | {
         'ModuleInfo: Module: absAppMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absAppMorph' -> () From: ( | {
         'ModuleInfo: Module: absAppMorph InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absAppMorph' -> () From: ( | {
         'ModuleInfo: Module: absAppMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
             resend.postFileIn.
            abstractSimpleApplicationMorph initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absAppMorph' -> () From: ( | {
         'ModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absAppMorph' -> () From: ( | {
         'ModuleInfo: Module: absAppMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules absAppMorph postFileIn
