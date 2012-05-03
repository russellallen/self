 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: searching\x7fModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerating = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'enumerating' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals enumerating.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerating' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         all = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'enumerating' -> 'all' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals enumerating all.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerating' -> 'all' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         limit <-  1e100 "infinity".
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         all = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumerating' -> 'all' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits enumerating all.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerating' -> 'all' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'enumerating' -> 'all' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerating' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         implementors = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'enumerating' -> 'implementors' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals enumerating implementors.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerating' -> 'implementors' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         limit <-  1e100 "infinity".
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         implementors = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumerating' -> 'implementors' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits enumerating implementors.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerating' -> 'implementors' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'enumerating' -> 'implementors' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerating' -> 'implementors' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         target <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerating' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         references = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'enumerating' -> 'references' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals enumerating references.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerating' -> 'references' -> () From: ( | {
         'Comment: filter holders by me\x7fModuleInfo: Module: enumerating InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         filterBlock <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerating' -> 'references' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         limit <-  1e100 "infinity".
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         references = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumerating' -> 'references' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits enumerating references.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerating' -> 'references' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'enumerating' -> 'references' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerating' -> 'references' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         target <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot'
        
         enumerating = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'enumerating' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'enumerating' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules enumerating.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'enumerating' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'enumerating' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'enumerating' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'enumerating' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'enumerating' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerating = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumerating' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits enumerating.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         abstract = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumerating' -> 'abstract' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits enumerating abstract.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         descendantResponsibilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumerating' -> 'abstract' -> 'descendantResponsibilities' -> () From: ( |
             {} = 'Comment: The following methods must be implemented by a descendant.\x7fModuleInfo: Creator: traits enumerating abstract descendantResponsibilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'abstract' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         enumerateOnceIfFail: failBlock = ( |
            | 
            'Return collection of objects found by this enumeration.
             If the enumeration fails, evaluate failBlock').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'abstract' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | 'Test this kind of enumeration.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerateIfFail: failBlock = ( |
            | 
            enumerateOnceIfFail: [|:e|
              'outOfMemoryError' == e  ifFalse: [
                failBlock value: e
              ] True: [
                memory allocationFailed.
                enumerateOnceIfFail: failBlock
              ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractWithTarget = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumerating' -> 'abstractWithTarget' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits enumerating abstractWithTarget.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'abstractWithTarget' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerate: mirr = ( |
            | 
            enumerateContents: (vector copyAddLast: mirr)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'abstractWithTarget' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerate: mirr IfFail: b = ( |
            | 
            enumerateContents: (vector copyAddLast: mirr)  IfFail: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'abstractWithTarget' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerateContents: vec = ( |
            | 
            (target: vec) enumerateIfFail: [|:e| 
                error: 'enumeration failed: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'abstractWithTarget' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerateContents: vec IfFail: b = ( |
            | 
            (target: vec) enumerateIfFail: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'abstractWithTarget' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'enumerating' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'all' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerate = ( |
            | enumerateIfFail: [|:e| error: 'enumeration failed: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'all' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         enumerateOnceIfFail: failBlock = ( |
            | 
            _EnumerateAllLimit: limit IfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'all' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'enumerating' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'all' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( | {
                 'ModuleInfo: Module: enumerating InitialContents: FollowSlot'
                
                 testSize = 10001.
                } 
            | 
            (copy limit: testSize) enumerate size  =  testSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'implementors' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerateOnceIfFail: b = ( |
            | 
            target _EnumerateVectorImplementorsLimit: limit IfFail: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'implementors' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         forTesting = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumerating' -> 'implementors' -> 'forTesting' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits enumerating implementors forTesting.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'implementors' -> 'forTesting' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot'
        
         aVeryPeculiarFisk.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'implementors' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'enumerating' -> 'abstractWithTarget' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'implementors' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | 
               ((copy enumerate: 'aVeryPeculiarFisk' ) size = 1)
            && [(copy enumerate: 'aVeryPeculiarFisk:') size = 1]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'references' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerateOnceIfFail: failBlock = ( |
             mirs.
             slots.
             targetSet.
            | 
            mirs: target _EnumerateVectorReferencesLimit: limit 
                                                  IfFail: [|:e| ^ failBlock value: e].
            slots: list copyRemoveAll. 
            targetSet: target asSet.
            mirs do: [|:m|
              (filterBlock value: m) ifTrue: [
                [|:b|
                 m do: b.
                 m fakeSlotsDo: b.
                ] value: [|:s|
                  (targetSet includes: s contents)  ifTrue: [
                    slots addLast: s.
                    slots size >= limit  ifTrue: [^ slots asVector].
                  ].
                ].
              ].
            ].
            slots asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'references' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         forTesting = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumerating' -> 'references' -> 'forTesting' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits enumerating references forTesting.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'references' -> 'forTesting' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot'
        
         aConstantObject = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumerating' -> 'references' -> 'forTesting' -> 'aConstantObject' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits enumerating references forTesting aConstantObject.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'references' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'enumerating' -> 'abstractWithTarget' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerating' -> 'references' -> () From: ( | {
         'ModuleInfo: Module: enumerating InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
             res.
            | 
            res: copy enumerate: reflect: forTesting aConstantObject.
            "correct result: forTesting object below, mirror created in prev.
             line"
            res size = 2 ifFalse: [
                error: 'size is ', res size printString, ' instead of 2'].
            true).
        } | ) 



 '-- Side effects'

 globals modules enumerating postFileIn
