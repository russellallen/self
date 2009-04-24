 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         message = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'message' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals message.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'message' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         arguments <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'message' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         delegatee.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'message' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         methodHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: types of messages\x7fModuleInfo: Module: message InitialContents: FollowSlot'
        
         normal = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'message' -> 'normal' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits message normal.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'message' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'message' -> 'normal' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'message' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         receiver.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'message' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: private'
        
         selectorString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         message = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'message' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'message' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules message.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'message' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'message' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'message' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         myComment <- 'Message protocol for indirect sends.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'message' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'message' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         message = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'message' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits message.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         = m = ( |
            | 
             (receiver = m receiver)   &&
            [(selector = m selector)   &&
            [(arguments = m arguments) &&
            [((reflect: delegatee) = (reflect: m delegatee)) &&
            [(reflect: methodHolder) = (reflect: m methodHolder)]]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone arguments: arguments copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: types of messages\x7fModuleInfo: Module: message InitialContents: FollowSlot'
        
         delegated = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'message' -> 'delegated' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits message delegated.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'delegated' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'message' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'delegated' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         send = ( |
            | selector sendTo: receiver DelegatingTo: delegatee
            WithArguments: arguments).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'delegated' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         type = 'delegated'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: types of messages\x7fModuleInfo: Module: message InitialContents: FollowSlot'
        
         directedResend = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'message' -> 'directedResend' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits message directedResend.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'directedResend' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         isResend = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'directedResend' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'message' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'directedResend' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         send = ( |
            | selector sendTo: receiver
            DelegatingTo: (delegatee sendTo: methodHolder)
            WithArguments: arguments).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'directedResend' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         type = 'directedResend'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: forking\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         fork = ( |
            | (process copySend: self) resume).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: forking\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         forkForBirthEvent: evt = ( |
            | 
            ( (process copySend: self) birthEvent: evt) resume).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            (reflect: receiver) hash ^^
            selector hash ^^
            (reflect: delegatee) hash ^^
            (reflect: methodHolder) hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: types of messages\x7fModuleInfo: Module: message InitialContents: FollowSlot'
        
         implicitSelf = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'message' -> 'implicitSelf' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits message implicitSelf.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'implicitSelf' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'message' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'implicitSelf' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         send = ( |
            | selector sendTo: receiver WithArguments: arguments).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'implicitSelf' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         type = 'implicitSelf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         isImmutableForFilingOut = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         isResend = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: lookup\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupSlotUsing: aSlotFinder = ( |
            | aSlotFinder soleSlotFrom:  lookupSlotsUsing: aSlotFinder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: lookup\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupSlotsUsing: aSlotFinder = ( |
            | 
            aSlotFinder selector: selector.
            case
              if:   [type = undirectedResend type] Then: [ aSlotFinder                                                                 findSlotsInParents]
              If:   [type =   directedResend type] Then: [(aSlotFinder copyForMirror: (aSlotFinder mirror slotAt: delegatee) contents) findSlots         ]
                                                   Else: [ aSlotFinder                                                                 findSlots         ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'normal' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'message' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'normal' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         send = ( |
            | selector sendTo: receiver WithArguments: arguments).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'normal' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         type = 'normal'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver: r Selector: s = ( |
            | receiver: r Selector: s Arguments: vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver: r Selector: s Arguments: a = ( |
            | 
            receiver: r Selector: s Type: 'normal' Delegatee: nil MethodHolder: nil
              Arguments: a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver: r Selector: s Type: t Delegatee: d MethodHolder: mh Arguments: a = ( |
            | 
            type: t.
            receiver: r.
            delegatee: d.
            selector: s.
            arguments: a.
            methodHolder: mh).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver: r Selector: s With: a0 = ( |
            | 
            receiver: r Selector: s Arguments: (vector copySize: 1) at: 0 Put: a0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver: r Selector: s With: a0 With: a1 = ( |
            | 
            receiver: r Selector: s Arguments: ((vector copySize: 2) at: 0 Put: a0)
                                                                     at: 1 Put: a1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver: r Selector: s With: a0 With: a1 With: a2 = ( |
            | 
            receiver: r Selector: s
              Arguments: (((vector copySize: 3) at: 0 Put: a0)
                                                at: 1 Put: a1)
                                                at: 2 Put: a2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver: r Selector: s With: a0 With: a1 With: a2 With: a3 = ( |
            | 
            receiver: r Selector: s
              Arguments: ((((vector copySize: 4) at: 0 Put: a0)
                                                 at: 1 Put: a1)
                                                 at: 2 Put: a2)
                                                 at: 3 Put: a3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         selector = ( |
            | selectorString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: accessing\x7fComment: fix it so prims do not fail\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         selector: s = ( |
            | selectorString: s asString canonicalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         sendIfFail: failBlock = ( | {
                 'ModuleInfo: Module: message InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            "send me and if any errors happen, invoke failBock with the 
             error object as argument"

            p: (process copySend: self)
                causeOfBirth: process this causeOfBirth.
            p resume.
            p waitForSuspension.
            p causeOfDeath = 'terminated'   
              ifTrue: [                  p returnValue  ] 
               False: [ failBlock value: p causeOfError ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            (reflect: receiver) name, ' ', statePrintStringWithoutReceiver).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintStringWithoutReceiver = ( |
            | 
            selector asSelector
                intersperse: 
                    arguments copyMappedBy: [ | :arg | (reflect: arg) name ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( | {
                 'ModuleInfo: Module: message InitialContents: FollowSlot'
                
                 r <- ''.
                } 
            | 
            arguments size > 3 ifTrue: [^ fb value: 'too many arguments'].
            r:  'message copy ', 
                ' receiver: (', 
                (receiver storeStringIfFail: [|:e| ^fb value: e]), ')',
                ' Selector: (', 
                (selector storeStringIfFail: [|:e| ^fb value: e]), ')'.
            arguments do: [|:arg. :i|
                r: r, ' With: (', (arg storeStringIfFail: [|:e| ^fb value: e]), ')'.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | message).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: accessing\x7fComment: David wants to remove dynamic inheritance in messages. -- Adam, 3/04\x7fModuleInfo: Module: message InitialContents: FollowSlot\x7fVisibility: private'
        
         type: t = ( |
            | 
            [delegated].
            [directedResend].
            [undirectedResend].
            [implicitSelf].
            [normal].
            parent: t sendTo: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> () From: ( | {
         'Category: types of messages\x7fModuleInfo: Module: message InitialContents: FollowSlot'
        
         undirectedResend = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'message' -> 'undirectedResend' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits message undirectedResend.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'undirectedResend' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         isResend = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'undirectedResend' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'message' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'undirectedResend' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         send = ( |
            | 
            error:
            'The undirectedResend message object has not been implemented yet').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'message' -> 'undirectedResend' -> () From: ( | {
         'ModuleInfo: Module: message InitialContents: FollowSlot'
        
         type = 'undirectedResend'.
        } | ) 



 '-- Side effects'

 globals modules message postFileIn
