 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: public'
        
         fakeSlotsIterator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlotsIterator.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         dispatchOn: m = ( |
            | 
            "the order is important here: children before parents"
            m isReflecteeAssignment       ifTrue: [^ noFakeSlots].
            m isReflecteeBlockMethodActivation
                                          ifTrue: [^ fakeBlockMethodActivationSlots].
            m isReflecteeMethodActivation ifTrue: [^ fakeMethodActivationSlots ].
            m isReflecteeActivation       ifTrue: [^ fakeActivationSlots ].
            m isReflecteeBlock            ifTrue: [^ fakeBlockSlots].
            m isReflecteeBlockMethod      ifTrue: [^ fakeBlockMethodSlots].
            m isReflecteeByteVector       ifTrue: [^ fakeByteVectorSlots ].
            m isReflecteeFctProxy         ifTrue: [^ noFakeSlots].
            m isReflecteeFloat            ifTrue: [^ noFakeSlots].
            m isReflecteeInteger          ifTrue: [^ noFakeSlots].
            m isReflecteeMethod           ifTrue: [^ fakeMethodSlots].
            m isReflecteeMirror           ifTrue: [^ fakeMirrorSlots].
            m isReflecteeProcess          ifTrue: [^ fakeProcessSlots].
            m isReflecteeProxy            ifTrue: [^ noFakeSlots].
            m isReflecteeSlots            ifTrue: [^ noFakeSlots].
            m isReflecteeString           ifTrue: [^ noFakeSlots].
            m isReflecteeVector           ifTrue: [^ fakeVectorSlots].
            m isReflecteeProfiler         ifTrue: [^ noFakeSlots].
            noFakeSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         fakeActivationSlots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeActivationSlots' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlotsIterator fakeActivationSlots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeActivationSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: mirr Do: block = ( |
            | 
            mirr isLive ifFalse: [ ^ self ].
            block value: fakeSlot receiver        copyMirror: mirr.
            block value: fakeSlot expressionStack copyMirror: mirr.
            block value: fakeSlot position        copyMirror: mirr.
            fakeMethodSlots mirror: mirr Do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeActivationSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: m OneOfEachDo: b = ( |
            | 
            mirror: m Do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeActivationSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         fakeBlockMethodActivationSlots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeBlockMethodActivationSlots' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlotsIterator fakeBlockMethodActivationSlots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeBlockMethodActivationSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: mirr Do: block = ( |
            | 
            fakeMethodActivationSlots mirror: mirr Do: block.
            block value: fakeSlot lexicalParent copyMirror: mirr.
            block value: fakeSlot sourceOffset  copyMirror: mirr.
            block value: fakeSlot sourceLength  copyMirror: mirr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeBlockMethodActivationSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: m OneOfEachDo: b = ( |
            | 
            mirror: m Do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeBlockMethodActivationSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         fakeBlockMethodSlots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeBlockMethodSlots' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlotsIterator fakeBlockMethodSlots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeBlockMethodSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: mirr Do: block = ( |
            | 
            fakeMethodSlots mirror: mirr Do: block.
            block value:  fakeSlot sourceOffset  copyMirror: mirr.
            block value:  fakeSlot sourceLength  copyMirror: mirr.
            block value:  fakeSlot lexicalParent copyMirror: mirr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeBlockMethodSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: m OneOfEachDo: b = ( |
            | 
            mirror: m Do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeBlockMethodSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         fakeBlockSlots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeBlockSlots' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlotsIterator fakeBlockSlots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeBlockSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: mirr Do: block = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeBlockSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: m OneOfEachDo: b = ( |
            | 
            mirror: m Do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeBlockSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         fakeByteVectorSlots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeByteVectorSlots' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlotsIterator fakeByteVectorSlots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeByteVectorSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: mirr Do: block = ( |
            | 
            fakeVectorishSlots mirror: mirr Do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeByteVectorSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: m OneOfEachDo: b = ( |
            | 
            fakeVectorishSlots mirror: m OneOfEachDo: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeByteVectorSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         fakeMethodActivationSlots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeMethodActivationSlots' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlotsIterator fakeMethodActivationSlots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeMethodActivationSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: mirr Do: block = ( |
            | 
            fakeActivationSlots mirror: mirr Do: block.
            block value: fakeSlot selector     copyMirror: mirr.
            block value: fakeSlot methodHolder copyMirror: mirr.
            mirr hasSender ifTrue: [
               block value: fakeSlot sender copyMirror: mirr ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeMethodActivationSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: m OneOfEachDo: b = ( |
            | 
            mirror: m Do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeMethodActivationSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         fakeMethodSlots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeMethodSlots' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlotsIterator fakeMethodSlots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeMethodSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: mirr Do: block = ( |
            | 
            block value: fakeSlot codes         copyMirror: mirr.
            block value: fakeSlot literals      copyMirror: mirr.
            block value: fakeSlot sourceString  copyMirror: mirr.
            block value: fakeSlot file          copyMirror: mirr.
            block value: fakeSlot line          copyMirror: mirr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeMethodSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: m OneOfEachDo: b = ( |
            | 
            mirror: m Do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeMethodSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         fakeMirrorSlots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeMirrorSlots' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlotsIterator fakeMirrorSlots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeMirrorSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: mirr Do: block = ( |
            | 
            block value: fakeSlot reflectee copyMirror: mirr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeMirrorSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: m OneOfEachDo: b = ( |
            | 
            mirror: m Do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeMirrorSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         fakeProcessSlots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeProcessSlots' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlotsIterator fakeProcessSlots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeProcessSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: mirr Do: block = ( |
            | 
            block value: fakeSlot stack copyMirror: mirr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeProcessSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: m OneOfEachDo: b = ( |
            | 
            mirror: m Do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeProcessSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         fakeSlot = bootstrap stub -> 'globals' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         fakeVectorSlots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeVectorSlots' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlotsIterator fakeVectorSlots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeVectorSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         ifMirror: m HasMethodPointerDo: b = ( |
            | 
            m reflecteeHasMethodPointer ifTrue: [
              b value: fakeSlot methodPointer copyMirror: m
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeVectorSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: mirr Do: block = ( |
            | 
            fakeVectorishSlots mirror: mirr Do: block.
            ifMirror: mirr HasMethodPointerDo: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeVectorSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: m OneOfEachDo: b = ( |
            | 
            fakeVectorishSlots mirror: m OneOfEachDo: b.
            ifMirror: m HasMethodPointerDo: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeVectorSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         fakeVectorishSlots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeVectorishSlots' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlotsIterator fakeVectorishSlots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeVectorishSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: mirr Do: block = ( |
            | 
            (mirr reflecteeSizeIfFail: [^ self]) do: [ | :i |
              block value: 
              fakeSlot vectorElement copyMirror: mirr ElementIndex: i ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeVectorishSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: m OneOfEachDo: b = ( |
            | 
            (m reflecteeSizeIfFail: [^ self]) = 0 
             ifFalse: [ b value: fakeSlot vectorElement copyMirror: m ElementIndex: 0 ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'fakeVectorishSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: public'
        
         mirror: m Do: block = ( |
            | 
            (dispatchOn: m) mirror: m Do: [| :fs | block value: fs With: fs key]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: public'
        
         mirror: m OneOfEachDo: block = ( |
            | 
            (dispatchOn: m) mirror: m OneOfEachDo: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         noFakeSlots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'noFakeSlots' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlotsIterator noFakeSlots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'noFakeSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: mirr Do: block = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'noFakeSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: m OneOfEachDo: b = ( |
            | 
            mirror: m Do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> 'noFakeSlots' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlotsIterator' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot'
        
         fakeSlotsIterator = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlotsIterator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlotsIterator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules fakeSlotsIterator.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlotsIterator' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlotsIterator' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlotsIterator' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot'
        
         myComment <- 'Iterates over fake slots in an object'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlotsIterator' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlotsIterator' -> () From: ( | {
         'ModuleInfo: Module: fakeSlotsIterator InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules fakeSlotsIterator postFileIn
