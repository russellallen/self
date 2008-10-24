 '$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         selfParseNodes = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfParseNodes' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfParseNodes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfParseNodes.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParseNodes' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/selfParser'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParseNodes' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParseNodes' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParseNodes' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParseNodes' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParseNodes' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfBlock = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfImplicitSelf = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfMethod = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfObject = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSlotGroup = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSlotList = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         parseNodes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: message sends\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractMessageSend = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit parseNodes node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes abstractMessageSend.

CopyDowns:
globals parseKit parseNodes node. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes abstractMessageSend parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCountAsSlotContents = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> () From: ( | {
         'Category: abstract send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         arguments = ( |
            | childShouldImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> () From: ( | {
         'Category: abstract send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         delegateeIfPresent: pb IfAbsent: ab = ( |
            | childShouldImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> () From: ( | {
         'Category: abstract send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrimitive = ( |
            | 
            firstSelectorNode source first = '_').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> () From: ( | {
         'Category: abstract send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isResend = ( |
            | delegateeIfPresent: true IfAbsent: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> () From: ( | {
         'Category: abstract send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isUndirectedResend = ( |
            | 
            delegateeIfPresent: [|:d| d isSelfResendToken ]
                      IfAbsent: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> () From: ( | {
         'Category: abstract send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = ( |
            | firstSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> () From: ( | {
         'Category: abstract send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorNodes = ( |
            | childShouldImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> () From: ( | {
         'Category: abstract send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorString = ( |
            | childShouldImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         testResultString: depth = ( |
             padding.
             r <- ''.
             ra.
            | 
            padding: '' copySize: depth FillingWith: ' '.
            r: '\n', padding.
            padding: padding, ' '.
            preComments do: [|:pc| r: r, (pc testResultString: depth + 2)].
            r: r, basicTestResultString, ': ', (delegateeIfPresent: [|:d| d source] IfAbsent: ''), selectorString.
            postComments do: [|:pc| r: r, (pc testResultString: depth + 2)].
            ra: arguments asVector copyAddFirst: receiver.
            ra do: [|:x|
              x hasSubnodes ifFalse: [r: r, '\n', padding, (x testResultString: depth + 2)]
                              True:  [r: r, (x testResultString: depth + 2)].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractSlotName = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractSlotName' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit parseNodes node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractSlotName' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes abstractSlotName.

CopyDowns:
globals parseKit parseNodes node. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractSlotName' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractSlotName' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes abstractSlotName parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractSlotName' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isArgumentSlotName = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractSlotName' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: slot lists\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         slotSeries = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotSeries' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit parseNodes node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotSeries' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes slotSeries.

CopyDowns:
globals parseKit parseNodes node. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotSeries' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotSeries' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes slotSeries parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotSeries' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentSlotCount = ( |
             r <- 0.
            | 
            slotsWithAnnotationsDo: [|:s| s isArgument ifTrue: [r: r succ]].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotSeries' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         closeBracket = ( |
            | 
            dotIfPresent: [subnodes at: subnodeCount - 2]
               IfAbsent:  [ lastSubnode ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotSeries' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         openBracket = ( |
            | firstSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotSeries' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotSeries' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsAndGroups = ( |
             r.
            | 
            r: subnodes copy.
            r removeFirst.
            removeAnnotationAndDotIfPresent: r.
            r removeLast.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotSeries' -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         slotsWithAnnotationsDo: blk Prepending: a = ( |
             r.
            | 
            slotsAndGroups do: [|:sg|
              sg isSelfSlotGroup ifTrue: [ sg slotsWithAnnotationsDo: blk Prepending: a ]
                                  False: [ r: blk value: sg With: a ]
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: slot lists\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         annotatedSlotGroup = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'annotatedSlotGroup' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes slotSeries copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'annotatedSlotGroup' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes annotatedSlotGroup.

CopyDowns:
globals selfParser parseNodes slotSeries. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'annotatedSlotGroup' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'annotatedSlotGroup' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes annotatedSlotGroup parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'annotatedSlotGroup' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         addDot: d = ( |
            | addSubnode: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'annotatedSlotGroup' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         annotation = ( |
            | subnodes at: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'annotatedSlotGroup' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpen: o Annotation: a SlotsAndGroups: s Close: c = ( |
            | 
            (((copyRemoveAll
              addSubnode: o)
              addSubnode: a)
              addAllSubnodes: s)
              addSubnode: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'annotatedSlotGroup' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         dotIfPresent: pb IfAbsent: ab = ( |
            | 
            lastSubnode isSelfSlotSeparator ifTrue: [pb value: lastSubnode] False: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'annotatedSlotGroup' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSlotGroup = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'annotatedSlotGroup' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotSeries' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'annotatedSlotGroup' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         removeAnnotationAndDotIfPresent: lst = ( |
            | 
            dotIfPresent: [lst removeLast] IfAbsent: [].
            lst removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'annotatedSlotGroup' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         slotsWithAnnotationsDo: blk Prepending: a = ( |
            | 
            resend.slotsWithAnnotationsDo: blk Prepending: a, '\x07', annotation value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: message sends\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         unaryOrBinarySend = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unaryOrBinarySend' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes abstractMessageSend copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unaryOrBinarySend' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes unaryOrBinarySend.

CopyDowns:
globals selfParser parseNodes abstractMessageSend. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unaryOrBinarySend' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unaryOrBinarySend' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes unaryOrBinarySend parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unaryOrBinarySend' -> 'parent' -> () From: ( | {
         'Category: send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         delegateeIfPresent: pb IfAbsent: ab = ( |
            | 
            subnodeCount = subnodeCountWithDelegatee
              ifTrue: [  pb value: subnodes at: 1 ]
               False: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unaryOrBinarySend' -> 'parent' -> () From: ( | {
         'Category: send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         firstSelectorNode = ( |
            | selectorNode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unaryOrBinarySend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unaryOrBinarySend' -> 'parent' -> () From: ( | {
         'Category: send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorNodes = ( |
            | 
            list copyRemoveAll addFirst: selectorNode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unaryOrBinarySend' -> 'parent' -> () From: ( | {
         'Category: send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorString = ( |
            | 
            selectorNode source).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: message sends\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         binarySend = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySend' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes unaryOrBinarySend copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySend' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes binarySend.

CopyDowns:
globals selfParser parseNodes unaryOrBinarySend. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySend' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySend' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes binarySend parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySend' -> 'parent' -> () From: ( | {
         'Category: send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         arguments = ( |
            | vector copyAddLast: lastSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySend' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyReceiver: rcvr Delegatee: delOrNil Selector: s Argument: arg = ( |
             r.
            | 
            r: copyRemoveAll addSubnode: rcvr.
            delOrNil = nil  ifFalse: [ r addSubnode: delOrNil ].
            r addSubnode: s.
            r addSubnode: arg.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unaryOrBinarySend' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySend' -> 'parent' -> () From: ( | {
         'Category: send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorNode = ( |
            | 
            subnodes at: subnodeCount - 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySend' -> 'parent' -> () From: ( | {
         'Category: send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         subnodeCountWithDelegatee = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         binarySlotNameWithFormal = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithFormal' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes abstractSlotName copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithFormal' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes binarySlotNameWithFormal.

CopyDowns:
globals selfParser parseNodes abstractSlotName. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithFormal' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithFormal' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes binarySlotNameWithFormal parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithFormal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCountAsSlotName = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithFormal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOperator: op Formal: f = ( |
            | 
            (copyRemoveAll addSubnode: op) addSubnode: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithFormal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         formal = ( |
            | lastSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithFormal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         operator = ( |
            | firstSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithFormal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractSlotName' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithFormal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         suppliesAnyArgumentNames = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         binarySlotNameWithoutFormal = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithoutFormal' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes abstractSlotName copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithoutFormal' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes binarySlotNameWithoutFormal.

CopyDowns:
globals selfParser parseNodes abstractSlotName. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithoutFormal' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithoutFormal' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes binarySlotNameWithoutFormal parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithoutFormal' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCountAsSlotName = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithoutFormal' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOperator: o = ( |
            | copyRemoveAll addSubnode: o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithoutFormal' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         nameToken = ( |
            | firstSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithoutFormal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractSlotName' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'binarySlotNameWithoutFormal' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         suppliesAnyArgumentNames = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: objects & blocks\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         blockOrObjectOrMethod = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit parseNodes node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes blockOrObjectOrMethod.

CopyDowns:
globals parseKit parseNodes node. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         hasBody <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         hasSlotList <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes blockOrObjectOrMethod parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCountAsSlotContents = ( |
            | 
            slotListIfPresent: [|:sl| sl argumentSlotCount] IfAbsent: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         bodyIfPresent: pb IfAbsent: ab = ( |
            | 
            hasBody ifTrue: [pb value: subnodes at: subnodeCount - 2] False: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         canHaveArguments = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         closeBracket = ( |
            | lastSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpen: o Close: c = ( |
            | 
            copyOpen: o SlotList: nil Body: nil Close: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpen: o SlotList: slOrNil Body: bOrNil Close: c = ( |
             r.
            | 
            r: copyRemoveAll addSubnode: o.
            nil = slOrNil ifTrue: [r hasSlotList: false]  False: [r addSubnode: slOrNil. r hasSlotList:  true].
            nil =  bOrNil ifTrue: [r hasBody:     false]  False: [r addSubnode:  bOrNil. r hasBody:      true].
            r addSubnode: c.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         copySubnodesFrom: n = ( |
            | 
            ((resend.copySubnodesFrom: n)
              hasSlotList: n hasSlotList)
              hasBody:     n hasBody).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         openBracket = ( |
            | firstSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAllSubnodes = ( |
            | 
            (resend.removeAllSubnodes hasSlotList: false) hasBody: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         slotListIfPresent: pb IfAbsent: ab = ( |
            | 
            hasSlotList ifTrue: [pb value: subnodes at: 1] False: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: objects & blocks\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         block = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'block' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes blockOrObjectOrMethod copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'block' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes block.

CopyDowns:
globals selfParser parseNodes blockOrObjectOrMethod. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'block' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes block parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'block' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfBlock = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'block' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         expressionSeries = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'expressionSeries' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit parseNodes node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'expressionSeries' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes expressionSeries.

CopyDowns:
globals parseKit parseNodes node. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'expressionSeries' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'expressionSeries' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes expressionSeries parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'expressionSeries' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: message sends\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordSend = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSend' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes abstractMessageSend copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes keywordSend.

CopyDowns:
globals selfParser parseNodes abstractMessageSend. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: InitializeToExpression: (vector)\x7fVisibility: public'
        
         arguments <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSend' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes keywordSend parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSend' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyReceiver: rcvr Delegatee: delOrNil Keywords: kws Arguments: args = ( |
             c.
             r.
            | 
            r: copyRemoveAll.
            r addSubnode: rcvr.
            delOrNil = nil  ifFalse: [r addSubnode: delOrNil ].
            r selectorNodes:  kws asVector.
            r arguments:     args asVector.
            r selectorNodes size = r arguments size ifFalse: [error: 'keyword/argument mismatch'].
            c: collector copyFirst: ''.
            r selectorNodes  with:  r arguments Do: [|:k. :a|
              r addSubnode: k.  r addSubnode: a.  c: c & k source.
            ].
            r selectorString: c flatString.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSend' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         copySubnodesFrom: n = ( |
            | 
            (((resend.copySubnodesFrom: n) 
              arguments:     n arguments)
              selectorNodes: n selectorNodes)
              selectorString: n selectorString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSend' -> 'parent' -> () From: ( | {
         'Category: send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         delegateeIfPresent: pb IfAbsent: ab = ( |
             d.
            | 
            d: subnodes at: 1.
            d isSelfDelegatee ifTrue: [pb value: d] False: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSend' -> 'parent' -> () From: ( | {
         'Category: send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         firstSelectorNode = ( |
            | selectorNodes first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractMessageSend' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSend' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAllSubnodes = ( |
            | 
            ((resend.removeAllSubnodes arguments: vector)
               selectorNodes: vector)
               selectorString: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: InitializeToExpression: (vector)\x7fVisibility: public'
        
         selectorNodes <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         selectorString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordSlotNameWithFormals = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithFormals' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes abstractSlotName copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithFormals' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes keywordSlotNameWithFormals.

CopyDowns:
globals selfParser parseNodes abstractSlotName. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithFormals' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: public'
        
         formals <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithFormals' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: public'
        
         keywords <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithFormals' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithFormals' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes keywordSlotNameWithFormals parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithFormals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCountAsSlotName = ( |
            | formals size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithFormals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyKeywords: kws Formals: frmls = ( |
             r.
            | 
            r: copyRemoveAll.
            r keywords: kws.
            r formals: frmls.
            kws with: frmls Do: [|:k. :f|  r addSubnode: k.  r addSubnode: f. ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithFormals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         copySubnodesFrom: n = ( |
            | 
            ((resend.copySubnodesFrom: n)
            keywords: n keywords)
             formals: n formals).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithFormals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractSlotName' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithFormals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAllSubnodes = ( |
            | 
            ((resend.removeAllSubnodes)
             keywords: list copyRemoveAll)
             formals:  list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithFormals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         suppliesAnyArgumentNames = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordSlotNameWithoutFormals = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithoutFormals' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes abstractSlotName copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithoutFormals' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes keywordSlotNameWithoutFormals.

CopyDowns:
globals selfParser parseNodes abstractSlotName. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithoutFormals' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithoutFormals' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes keywordSlotNameWithoutFormals parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithoutFormals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCountAsSlotName = ( |
            | subnodeCount).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithoutFormals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyKeywords: kws = ( |
            | 
            copyRemoveAll addAllSubnodes: kws).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithoutFormals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         keywords = ( |
            | subnodes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithoutFormals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractSlotName' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'keywordSlotNameWithoutFormals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         suppliesAnyArgumentNames = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: objects & blocks\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         method = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'method' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes blockOrObjectOrMethod copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'method' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes method.

CopyDowns:
globals selfParser parseNodes blockOrObjectOrMethod. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'method' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes method parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'method' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfMethod = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'method' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: objects & blocks\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         object = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'object' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes blockOrObjectOrMethod copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'object' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes object.

CopyDowns:
globals selfParser parseNodes blockOrObjectOrMethod. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'object' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes object parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'object' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         canHaveArguments = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'object' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfObject = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'object' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'blockOrObjectOrMethod' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         slot = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slot' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit parseNodes node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slot' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes slot.

CopyDowns:
globals parseKit parseNodes node. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slot' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes slot parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slot' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         assignmentAndValueIfPresent: pb IfAbsent: ab = ( |
            | 
            subnodeCount > (dotIfPresent: 2 IfAbsent: 1)
              ifTrue: [pb value: (subnodes at: 1) With: subnodes at: 2]
               False: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slot' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n Assignment: aOrNil Value: vOrNil Dot: dOrNil = ( |
             r.
            | 
            r: copyRemoveAll addSubnode: n.
            nil = aOrNil ifFalse: [
              r addSubnode: aOrNil.
              r addSubnode: vOrNil.
            ].
            nil = dOrNil ifFalse: [
              r addSubnode: dOrNil.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slot' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         dotIfPresent: pb IfAbsent: ab = ( |
            | 
            lastSubnode isSelfSlotSeparator ifTrue: [pb value: lastSubnode] False: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slot' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isArgument = ( |
            | 
            nameNode isArgumentSlotName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slot' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         nameNode = ( |
            | firstSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slot' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         objectAnnotationSlot = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlot' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes slot copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlot' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes objectAnnotationSlot.

CopyDowns:
globals selfParser parseNodes slot. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlot' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlot' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes objectAnnotationSlot parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlot' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slot' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         objectAnnotationSlotName = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlotName' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes abstractSlotName copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlotName' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes objectAnnotationSlotName.

CopyDowns:
globals selfParser parseNodes abstractSlotName. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlotName' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlotName' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes objectAnnotationSlotName parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlotName' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         annotationToken = ( |
            | firstSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlotName' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCountAsSlotName = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlotName' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAnnotation: a = ( |
            | copyRemoveAll addSubnode: a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlotName' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractSlotName' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'objectAnnotationSlotName' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         suppliesAnyArgumentNames = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         pop = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'pop' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit parseNodes node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'pop' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes pop.

CopyDowns:
globals parseKit parseNodes node. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'pop' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'pop' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes pop parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'pop' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyExpression: e Dot: d = ( |
            | 
            (copyRemoveAll addSubnode: e) addSubnode: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'pop' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         dot = ( |
            | lastSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'pop' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         expression = ( |
            | firstSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'pop' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         return = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'return' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit parseNodes node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'return' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes return.

CopyDowns:
globals parseKit parseNodes node. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'return' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'return' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes return parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'return' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyReturn: r Expression: e = ( |
            | 
            (copyRemoveAll addSubnode: r) addSubnode: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'return' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         expression = ( |
            | lastSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'return' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'return' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         returnToken = ( |
            | firstSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: slot lists\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         slotList = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotList' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes slotSeries copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotList' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes slotList.

CopyDowns:
globals selfParser parseNodes slotSeries. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotList' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes slotList parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotList' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpen: o SlotsAndGroups: s Close: c = ( |
            | 
            ((copyRemoveAll
              addSubnode: o)
              addAllSubnodes: s)
              addSubnode: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotList' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         dotIfPresent: pb IfAbsent: ab = ( |
            | 
            ab value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotList' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSlotList = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotList' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotSeries' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotList' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         removeAnnotationAndDotIfPresent: list = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'slotList' -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsWithAnnotationsDo: blk = ( |
            | 
            "eval blk with each slot and its anno string"
            slotsWithAnnotationsDo: blk Prepending: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: message sends\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         unarySend = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySend' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes unaryOrBinarySend copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySend' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes unarySend.

CopyDowns:
globals selfParser parseNodes unaryOrBinarySend. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySend' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySend' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes unarySend parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySend' -> 'parent' -> () From: ( | {
         'Category: send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         arguments = ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySend' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyReceiver: rcvr Delegatee: delOrNil Selector: sel = ( |
             r.
            | 
            r: copyRemoveAll addSubnode: rcvr.
            delOrNil = nil  ifFalse: [ r addSubnode: delOrNil ].
            r addSubnode: sel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unaryOrBinarySend' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySend' -> 'parent' -> () From: ( | {
         'Category: send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         selectorNode = ( |
            | lastSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySend' -> 'parent' -> () From: ( | {
         'Category: send methods\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         subnodeCountWithDelegatee = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot'
        
         unarySlotName = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySlotName' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser parseNodes abstractSlotName copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySlotName' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals selfParser parseNodes unarySlotName.

CopyDowns:
globals selfParser parseNodes abstractSlotName. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySlotName' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySlotName' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser parseNodes unarySlotName parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySlotName' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCountAsSlotName = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySlotName' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n = ( |
            | copyName: n Star: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySlotName' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n Star: s = ( |
             r.
            | 
            r: copyRemoveAll addSubnode: n.
            nil = s  ifFalse: [ r addSubnode: n ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySlotName' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isArgumentSlotName = ( |
            | 
            nameToken isSelfArgument).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySlotName' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         nameToken = ( |
            | firstSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySlotName' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'abstractSlotName' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySlotName' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorString = ( |
            | nameToken value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySlotName' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         starIfPresent: pb IfAbsent: ab = ( |
            | 
            subnodeCount > 1  ifTrue: [pb value: lastSubnode]
                               False: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'parseNodes' -> 'unarySlotName' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfParseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         suppliesAnyArgumentNames = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 



 '-- Side effects'

 globals modules selfParseNodes postFileIn
