 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         objBodyTypes = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyTypes' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyTypes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules objBodyTypes.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyTypes' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyTypes' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyTypes' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyTypes' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyTypes' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         methodBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'methodBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'methodBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 methodBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         methodBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'methodBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 methodBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'methodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'methodBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'methodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: public'
        
         fakeSlotsDo: block = ( |
            | 
            block value:  fakeSlot codes         copyMirror: objMirror.
            block value:  fakeSlot literals      copyMirror: objMirror.
            block value:  fakeSlot sourceString  copyMirror: objMirror.
            block value:  fakeSlot file          copyMirror: objMirror.
            block value:  fakeSlot line          copyMirror: objMirror.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'methodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfFakeSlots = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'methodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         activationBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'activationBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 methodBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'activationBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 activationBody.

CopyDowns:
globals ui1 methodBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         activationBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'activationBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 activationBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'activationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'activationBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         assignmentBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'assignmentBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'assignmentBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 assignmentBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         assignmentBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'assignmentBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 assignmentBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'assignmentBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'assignmentBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         blockBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'blockBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'blockBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 blockBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         blockBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'blockBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 blockBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'blockBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'blockBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'activationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fakeSlotsDo: block = ( |
            | 
            objMirror isLive ifFalse: [ ^ self ].
            block value: fakeSlot receiver        copyMirror: objMirror.
            block value: fakeSlot expressionStack copyMirror: objMirror.
            block value: fakeSlot position        copyMirror: objMirror.
            resend.fakeSlotsDo: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'activationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         numberOfFakeSlots = ( |
            | 
            objMirror isLive ifFalse: [ ^ 0 ].
            3 + resend.numberOfFakeSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'activationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'methodBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         methodActivationBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'methodActivationBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 activationBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'methodActivationBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 methodActivationBody.

CopyDowns:
globals ui1 activationBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         methodActivationBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'methodActivationBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 methodActivationBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'methodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'methodActivationBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'methodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fakeSlotsDo: block = ( |
            | 
            resend.fakeSlotsDo: block.
            block value: fakeSlot selector     copyMirror: objMirror.
            block value: fakeSlot methodHolder copyMirror: objMirror.
            objMirror hasSender ifTrue: [
                block value: fakeSlot sender copyMirror: objMirror ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'methodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         numberOfFakeSlots = ( |
            | 
            resend.numberOfFakeSlots + 2 + (hasSender ifTrue: 1 False: 0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'methodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'activationBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         blockMethodActivationBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'blockMethodActivationBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 methodActivationBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'blockMethodActivationBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 blockMethodActivationBody.

CopyDowns:
globals ui1 methodActivationBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         blockMethodActivationBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'blockMethodActivationBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 blockMethodActivationBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'blockMethodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'blockMethodActivationBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         blockMethodBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'blockMethodBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'blockMethodBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 blockMethodBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         blockMethodBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'blockMethodBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 blockMethodBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'blockMethodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'blockMethodBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         byteVectorBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'byteVectorBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'byteVectorBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 byteVectorBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         byteVectorBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'byteVectorBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 byteVectorBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'byteVectorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'byteVectorBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         canonicalStringBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'canonicalStringBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'canonicalStringBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 canonicalStringBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         canonicalStringBody = bootstrap define: bootstrap stub -> 'traits' -> 'ui1' -> 'canonicalStringBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'canonicalStringBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 canonicalStringBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'canonicalStringBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'canonicalStringBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fctProxyBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'fctProxyBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'fctProxyBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 fctProxyBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fctProxyBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'fctProxyBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 fctProxyBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'fctProxyBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'fctProxyBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         floatBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'floatBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'floatBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 floatBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         floatBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'floatBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 floatBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'floatBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'floatBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         integerBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'integerBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'integerBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 integerBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         integerBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'integerBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 integerBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'integerBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'integerBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         mirrorBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'mirrorBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'mirrorBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 mirrorBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         mirrorBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'mirrorBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 mirrorBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'mirrorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'mirrorBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         processBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'processBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'processBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 processBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         processBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'processBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 processBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'processBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'processBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         proxyBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'proxyBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'proxyBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 proxyBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         proxyBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'proxyBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 proxyBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'proxyBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'proxyBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         slotsBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'slotsBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'slotsBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 slotsBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         slotsBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'slotsBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 slotsBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'slotsBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'slotsBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         vectorBody = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'vectorBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui1 objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'vectorBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 vectorBody.

CopyDowns:
globals ui1 objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         vectorBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'vectorBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 vectorBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'vectorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'vectorBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'assignmentBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'blockBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fakeSlotsDo: block = ( |
            | 
            block value: fakeSlot lexicalParent copyMirror: objMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'blockBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         numberOfFakeSlots = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'blockBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'blockMethodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fakeSlotsDo: block = ( |
            | 
            resend.fakeSlotsDo: block.
            block value: fakeSlot lexicalParent copyMirror: objMirror.
            block value: fakeSlot sender        copyMirror: objMirror.
            block value: fakeSlot selector      copyMirror: objMirror.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'blockMethodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfFakeSlots = ( |
            | resend.numberOfFakeSlots + 3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'blockMethodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'methodActivationBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'blockMethodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: public'
        
         fakeSlotsDo: block = ( |
            | 
            resend.fakeSlotsDo: block.
            block value:  fakeSlot sourceOffset  copyMirror: objMirror.
            block value:  fakeSlot sourceLength  copyMirror: objMirror.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'blockMethodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfFakeSlots = ( |
            | resend.numberOfFakeSlots + 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'blockMethodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'methodBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         vectorishBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'vectorishBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 vectorishBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'byteVectorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'vectorishBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'canonicalStringBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'fctProxyBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'floatBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'integerBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'mirrorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fakeSlotsDo: block = ( |
            | 
            block value: fakeSlot reflectee copyMirror: objMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'mirrorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         numberOfFakeSlots = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'mirrorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'processBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fakeSlotsDo: block = ( |
            | block value: fakeSlot stack copyMirror: objMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'processBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         numberOfFakeSlots = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'processBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'proxyBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'slotsBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'vectorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'vectorishBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'vectorishBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fakeSlotsDo: block = ( |
            | 
            numberOfFakeSlots do: [ | :i |
                block value: 
                  fakeSlot vectorElement copyMirror: objMirror ElementIndex: i ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'vectorishBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         numberOfFakeSlots = ( |
            | objMirror reflecteeSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'vectorishBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'objectBody' -> ().
        } | ) 



 '-- Side effects'

 globals modules objBodyTypes postFileIn
