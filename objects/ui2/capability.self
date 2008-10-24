 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: capability InitialContents: FollowSlot\x7fVisibility: public'
        
         capabilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'capabilities' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals capabilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'capabilities' -> () From: ( | {
         'Comment: Use this as a prototype to make new capabilities.
Set the typeCode to distinguish this from the rest.\x7fModuleInfo: Module: capability InitialContents: FollowSlot\x7fVisibility: public'
        
         capabilityMorph = bootstrap define: bootstrap stub -> 'globals' -> 'capabilities' -> 'capabilityMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals circleMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'capabilities' -> 'capabilityMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals capabilities capabilityMorph.

CopyDowns:
globals circleMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'capabilities' -> 'capabilityMorph' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'capabilities' -> 'capabilityMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals capabilities capabilityMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'capabilities' -> 'capabilityMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: FollowSlot'
        
         morphTypeName = ( |
            | typeCode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'capabilities' -> 'capabilityMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'circleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'capabilities' -> 'capabilityMorph' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: InitializeToExpression: (\'leftMouse\')'
        
         typeCode <- 'leftMouse'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'capabilities' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: InitializeToExpression: (capabilities capabilityMorph copy typeCode: \'editText\')\x7fVisibility: public'
        
         editText = capabilities capabilityMorph copy typeCode: 'editText'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'capabilities' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: InitializeToExpression: (capabilities capabilityMorph copy typeCode: \'grabObject\')\x7fVisibility: public'
        
         grabObject = capabilities capabilityMorph copy typeCode: 'grabObject'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'capabilities' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: FollowSlot'
        
         initializeCapabilityMorphs = ( |
             lbl.
             lbl2.
            | 
            pressButton removeAllMorphs.
            pressButton color: (0 paint copyRed: 0.55 Green: 0.95 Blue: 0.6).
            pressButton radius: 30.
            lbl:  labelMorph copyLabel: 'press'.
            lbl2: labelMorph copyLabel: 'button'.
            lbl  position: pressButton center - (16 @ 1).
            lbl2 position: lbl position   + (0 @ 12).
            pressButton addMorph: lbl.
            pressButton addMorph: lbl2.

            editText removeAllMorphs.
            editText color: (0 paint copyRed: 0.65 Green: 0.85 Blue: 0.6).
            editText radius: 30.
            lbl:  labelMorph copyLabel: 'edit'.
            lbl2: labelMorph copyLabel: 'text'.
            lbl  position: editText center - (11 @ 1).
            lbl2 position: lbl position   + (0 @ 12).
            editText addMorph: lbl.
            editText addMorph: lbl2.

            middleMouse removeAllMorphs.
            middleMouse color: (0 paint copyRed: 0.75 Green: 0.75 Blue: 0.6).
            middleMouse radius: 30.
            lbl:  labelMorph copyLabel: 'mouse'.
            lbl2: labelMorph copyLabel: 'middle'.
            lbl  position: middleMouse center - (16 @ 1).
            lbl2 position: lbl position   + (0 @ 12).
            middleMouse addMorph: lbl.
            middleMouse addMorph: lbl2.

            grabObject removeAllMorphs.
            grabObject color: (0 paint copyRed: 0.85 Green: 0.65 Blue: 0.6).
            grabObject radius: 30.
            lbl:  labelMorph copyLabel: 'grab'.
            lbl2: labelMorph copyLabel: 'object'.
            lbl  position: grabObject center - (16 @ 1).
            lbl2 position: lbl position   + (0 @ 12).
            grabObject addMorph: lbl.
            grabObject addMorph: lbl2.

            rightMouse removeAllMorphs.
            rightMouse color: (0 paint copyRed: 0.95 Green: 0.55 Blue: 0.6).
            rightMouse radius: 30.
            lbl:  labelMorph copyLabel: 'mouse'.
            lbl2: labelMorph copyLabel: 'right'.
            lbl  position: rightMouse center - (16 @ 1).
            lbl2 position: lbl position   + (0 @ 12).
            rightMouse addMorph: lbl.
            rightMouse addMorph: lbl2.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'capabilities' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: InitializeToExpression: (capabilities capabilityMorph copy typeCode: \'keyPress\')\x7fVisibility: public'
        
         keyPress = capabilities capabilityMorph copy typeCode: 'keyPress'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'capabilities' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: InitializeToExpression: (capabilities capabilityMorph copy typeCode: \'middleMouse\')\x7fVisibility: public'
        
         middleMouse = capabilities capabilityMorph copy typeCode: 'middleMouse'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'capabilities' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'capabilities' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: InitializeToExpression: (capabilities capabilityMorph copy typeCode: \'pressButton\')\x7fVisibility: public'
        
         pressButton = capabilities capabilityMorph copy typeCode: 'pressButton'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'capabilities' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: InitializeToExpression: (capabilities capabilityMorph copy typeCode: \'rightMouse\')\x7fVisibility: public'
        
         rightMouse = capabilities capabilityMorph copy typeCode: 'rightMouse'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: FollowSlot'
        
         capability = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'capability' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'capability' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules capability.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'capability' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'capability' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'capability' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'capability' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            transporter moduleDictionary resetFillingSemaphore.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: transporter moduleDictionary
                           Selector: 'resetFillingSemaphore'.
            resend.postFileIn.
            capabilities initializeCapabilityMorphs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'capability' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'capability' -> () From: ( | {
         'ModuleInfo: Module: capability InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules capability postFileIn
