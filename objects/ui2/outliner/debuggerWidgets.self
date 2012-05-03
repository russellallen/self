 '$Revision: 30.6 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         debuggerWidgets = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'debuggerWidgets' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'debuggerWidgets' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules debuggerWidgets.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debuggerWidgets' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debuggerWidgets' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debuggerWidgets' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debuggerWidgets' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            objectPushButton initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debuggerWidgets' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debuggerWidgets' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Debugging\x7fModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         objectPushButton = bootstrap define: bootstrap stub -> 'globals' -> 'objectPushButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals pushButton copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'objectPushButton' -> () From: ( |
             {} = 'Comment: Do not use me!!
Use ui2Button instead.\x7fModuleInfo: Creator: globals objectPushButton.

CopyDowns:
globals pushButton. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectPushButton' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: InitializeToExpression: (reflect: ())'
        
         mirror <- reflect: ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Debugging\x7fModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         objectPushButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'objectPushButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits objectPushButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectPushButton' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'objectPushButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectPushButton' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         copyMirror: mirr Color: c = ( |
            | 
            ((copy mirror: mirr) color: c) initializeStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectPushButton' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         copyMirror: mirr Style: sty = ( |
            | 
            ((copy mirror: mirr) color: sty color) initializeStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectPushButton' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         initializePrototype = ( |
            | 
            removeAllMorphs.
            beShrinkWrap.
            borderWidth: 1.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectPushButton' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         initializeStyle = ( |
            | 
            addMorph:  
              ((rowMorph copy beShrinkWrap color: color) borderWidth: 0) addMorphFirst:
                 (labelMorph copyLabel: name)
                              fontSpec: outlinerPreferences tinyFontSpec copyName: 'palatino'.
            recolor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectPushButton' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         leftMouseUp: evt = ( |
            | 
            evt sourceHand unsubscribeCursor: self.         
            isDown ifTrue: [
                isDown: false.
                sprout: evt.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectPushButton' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'objectPushButton'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectPushButton' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         name = ( |
            | 
            mirror  isReflecteeBlock ifTrue: [^'[]'].
            mirror nameSize: 10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectPushButton' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'pushButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectPushButton' -> () From: ( | {
         'ModuleInfo: Module: debuggerWidgets InitialContents: FollowSlot'
        
         sprout: evt = ( |
            | 
            evt sourceHand attach: world outlinerForMirror: mirror.
            self).
        } | ) 



 '-- Side effects'

 globals modules debuggerWidgets postFileIn
