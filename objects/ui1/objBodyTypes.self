 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         methodBody = bootstrap define: bootstrap stub -> 'globals' -> 'methodBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'methodBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals methodBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         methodBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'methodBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits methodBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'methodBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodBody' -> () From: ( | {
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfFakeSlots = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         activationBody = bootstrap define: bootstrap stub -> 'globals' -> 'activationBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals methodBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'activationBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals activationBody.

CopyDowns:
globals methodBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         activationBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'activationBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits activationBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'activationBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         assignmentBody = bootstrap define: bootstrap stub -> 'globals' -> 'assignmentBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'assignmentBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals assignmentBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         assignmentBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'assignmentBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits assignmentBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'assignmentBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'assignmentBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         blockBody = bootstrap define: bootstrap stub -> 'globals' -> 'blockBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'blockBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals blockBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         blockBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'blockBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits blockBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'blockBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'blockBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fakeSlotsDo: block = ( |
            | 
            objMirror isLive ifFalse: [ ^ self ].
            block value: fakeSlot receiver        copyMirror: objMirror.
            block value: fakeSlot expressionStack copyMirror: objMirror.
            block value: fakeSlot position        copyMirror: objMirror.
            resend.fakeSlotsDo: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         numberOfFakeSlots = ( |
            | 
            objMirror isLive ifFalse: [ ^ 0 ].
            3 + resend.numberOfFakeSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'methodBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         methodActivationBody = bootstrap define: bootstrap stub -> 'globals' -> 'methodActivationBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals activationBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'methodActivationBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals methodActivationBody.

CopyDowns:
globals activationBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         methodActivationBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'methodActivationBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits methodActivationBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'methodActivationBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodActivationBody' -> () From: ( | {
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         numberOfFakeSlots = ( |
            | 
            resend.numberOfFakeSlots + 2 + (hasSender ifTrue: 1 False: 0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'activationBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         blockMethodActivationBody = bootstrap define: bootstrap stub -> 'globals' -> 'blockMethodActivationBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals methodActivationBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'blockMethodActivationBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals blockMethodActivationBody.

CopyDowns:
globals methodActivationBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         blockMethodActivationBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'blockMethodActivationBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits blockMethodActivationBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'blockMethodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'blockMethodActivationBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         blockMethodBody = bootstrap define: bootstrap stub -> 'globals' -> 'blockMethodBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'blockMethodBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals blockMethodBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         blockMethodBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'blockMethodBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits blockMethodBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'blockMethodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'blockMethodBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         byteVectorBody = bootstrap define: bootstrap stub -> 'globals' -> 'byteVectorBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'byteVectorBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals byteVectorBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         byteVectorBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'byteVectorBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits byteVectorBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'byteVectorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'byteVectorBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         canonicalStringBody = bootstrap define: bootstrap stub -> 'globals' -> 'canonicalStringBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'canonicalStringBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals canonicalStringBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         canonicalStringBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'canonicalStringBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits canonicalStringBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'canonicalStringBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'canonicalStringBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fctProxyBody = bootstrap define: bootstrap stub -> 'globals' -> 'fctProxyBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fctProxyBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fctProxyBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fctProxyBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fctProxyBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fctProxyBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fctProxyBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'fctProxyBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         floatBody = bootstrap define: bootstrap stub -> 'globals' -> 'floatBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'floatBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals floatBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         floatBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'floatBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits floatBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'floatBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'floatBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         integerBody = bootstrap define: bootstrap stub -> 'globals' -> 'integerBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'integerBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals integerBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         integerBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'integerBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits integerBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'integerBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'integerBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         mirrorBody = bootstrap define: bootstrap stub -> 'globals' -> 'mirrorBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mirrorBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mirrorBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         mirrorBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrorBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrorBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrorBody' -> ().
        } | ) 

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

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         processBody = bootstrap define: bootstrap stub -> 'globals' -> 'processBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         processBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'processBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         proxyBody = bootstrap define: bootstrap stub -> 'globals' -> 'proxyBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'proxyBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals proxyBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         proxyBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'proxyBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits proxyBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'proxyBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'proxyBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         slotsBody = bootstrap define: bootstrap stub -> 'globals' -> 'slotsBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotsBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotsBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         slotsBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotsBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotsBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotsBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'slotsBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         vectorBody = bootstrap define: bootstrap stub -> 'globals' -> 'vectorBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals objectBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'vectorBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals vectorBody.

CopyDowns:
globals objectBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         vectorBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'vectorBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits vectorBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'vectorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'vectorBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'assignmentBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'blockBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fakeSlotsDo: block = ( |
            | 
            block value: fakeSlot lexicalParent copyMirror: objMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'blockBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         numberOfFakeSlots = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'blockBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'blockMethodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fakeSlotsDo: block = ( |
            | 
            resend.fakeSlotsDo: block.
            block value: fakeSlot lexicalParent copyMirror: objMirror.
            block value: fakeSlot sender        copyMirror: objMirror.
            block value: fakeSlot selector      copyMirror: objMirror.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'blockMethodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfFakeSlots = ( |
            | resend.numberOfFakeSlots + 3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'blockMethodActivationBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'methodActivationBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'blockMethodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: public'
        
         fakeSlotsDo: block = ( |
            | 
            resend.fakeSlotsDo: block.
            block value:  fakeSlot sourceOffset  copyMirror: objMirror.
            block value:  fakeSlot sourceLength  copyMirror: objMirror.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'blockMethodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfFakeSlots = ( |
            | resend.numberOfFakeSlots + 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'blockMethodBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'methodBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         vectorishBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'vectorishBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits vectorishBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVectorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'vectorishBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canonicalStringBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxyBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'floatBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integerBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fakeSlotsDo: block = ( |
            | 
            block value: fakeSlot reflectee copyMirror: objMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         numberOfFakeSlots = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fakeSlotsDo: block = ( |
            | block value: fakeSlot stack copyMirror: objMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         numberOfFakeSlots = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vectorBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'vectorishBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vectorishBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         fakeSlotsDo: block = ( |
            | 
            numberOfFakeSlots do: [ | :i |
                block value: 
                  fakeSlot vectorElement copyMirror: objMirror ElementIndex: i ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vectorishBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         numberOfFakeSlots = ( |
            | objMirror reflecteeSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vectorishBody' -> () From: ( | {
         'ModuleInfo: Module: objBodyTypes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBody' -> ().
        } | ) 



 '-- Side effects'

 globals modules objBodyTypes postFileIn
