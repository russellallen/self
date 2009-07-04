 'Sun-$Revision: 30.22 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot'
        
         slot = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'slot' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'slot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules slot.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot'
        
         myComment <- 'traits slots plain, parent, argument, method\"
            \"<globals> slots plain, parent, argument, method\"
            \"A slot is a key-value pair representing a slot in an object.
             The key is the name of the slot; the value is the contents of the slot.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.22 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: slots\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         slots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slots' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         argument = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slots' -> 'argument' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slots argument.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> 'argument' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: InitializeToExpression: ( ( | snort: argSlot = ( self ) | ) _Mirror _MirrorContentsAt: \'snort:\' )\x7fVisibility: private'
        
         mirror <-  ( | snort: argSlot = ( self ) | ) _Mirror _MirrorContentsAt: 'snort:' .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         argument = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slots' -> 'argument' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slots argument.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> 'argument' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'slots' -> 'argument' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> 'argument' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         storedName <- 'argSlot'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         method = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slots' -> 'method' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slots method.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: InitializeToExpression: ( ( | method = ( self ) | ) _Mirror  )\x7fVisibility: private'
        
         mirror <-  ( | method = ( self ) | ) _Mirror  .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         method = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slots' -> 'method' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slots method.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'slots' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         storedName <- 'method'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         parent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slots' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slots parent.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: InitializeToExpression: ( ( | parent* = (). | ) _Mirror )\x7fVisibility: private'
        
         mirror <-  ( | parent* = (). | ) _Mirror .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         parent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slots' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slots parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'slots' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         storedName <- 'parent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         plain = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slots' -> 'plain' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slots plain.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> 'plain' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: InitializeToExpression: ( ( | aSlot. | ) _Mirror )\x7fVisibility: private'
        
         mirror <-  ( | aSlot. | ) _Mirror .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         plain = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( |
             {} = 'Comment: These were restructured by David Ungar June, 1994.
Most programming changes are done with slot objects instead of mirrors.

All of the following take an optional \"IfFail: failBlock\" argument
at the end.  If the operation fails, the failBlock will be invoked
with a reason string as argument, and the result of the block will
be returned.

Unless otherwise stated, each returns a slot.

Additionally, \"copyHolderFor\" may be prepended to each of the following.
If so, the operation does not take place on the slot itself, but
on a copy of the slot in a cloned holder object.  The copy of the slot
is returned.

contents: aMir -- changes the contents of the slot
visibility: aVis -- changes the visibility, vis should be one of
                    undeclaredSlot, privateSlot, or publicSlot
name: aString -- changes the name of the slot
annotation: aSlotAnnotation -- sets the slot\' annotation
module: aString -- sets the slot\'s module
initialContents: aCon -- aCon should be transporter moduleInfo followSlot
              or a clone of transporter moduleInfo initializeToExpression
isParent: aBool -- sets whether the slot is a parent
isArgument: aBool -- makes the slot be an argument slot (or not)
categories: strings -- sets the categories annotation
category: aString -- sets the whole category
comment: aString -- sets the comment annotation

name: aString Contents: aMir -- sets both at the same time
      (needed because the VM insists that the number of arguments 
      in the contents match the number in the selector).

remove -- removes the slot from its holder\x7fModuleInfo: Creator: traits slots plain.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> 'plain' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slots' -> 'plain' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         storedName <- 'aSlot'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: slots\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         visibility* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'visibility' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals visibility.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         slots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slots' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'argument' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         argumentPrefix = ':'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'argument' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isArgument = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'argument' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'argument' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         sortingOrder = 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         invalid = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slots invalid.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         = s = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         annotationIfFail: fb = ( |
            | slotAnnotation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         checkHolderOf: s = ( |
            | 
            ^ error: 'incomparable slots').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         copyForError: aString = ( |
            | 
            copy invalidValue: invalidValue copy error: aString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         copyMirror: m Name: n = ( |
            | error: 'Should not copy an invalid slot').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         exists = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | key hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         invalidValue <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> 'invalidValue' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slots invalid invalidValue.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> 'invalidValue' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: InitializeToExpression: (\'invalid\')'
        
         error <- 'invalid'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> 'invalidValue' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> 'invalidValue' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot'
        
         statePrintString = ( |
            | error).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         isAssignable = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         isAssignment = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         statePrintString = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: InitializeToExpression: (\'invalid\')'
        
         storedName = 'invalid'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         unparsedAnnotationIfFail: fb = ( |
            | '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         valueIfFail: fb = ( |
            | 
            reflect: invalidValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         valueName = '<invalid slot>'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         valueNameSize: n = ( |
            | valueName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'invalid' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         visibility = bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         basicPrintString = ( |
            | 
            longKey, ' = ',
             (selfMethodText copyForMethod: value) asSlotContents asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isMethod = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         plumpKey = ( |
            | key asSelector intersperse: value arguments).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isParent = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         parentPostfix = '*'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         sortingOrder = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         < s = ( |
            | compare: s IfLess: true Equal: false Greater: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         = s = ( |
            | (holder = s holder)  &&  [key = s key]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: fb = ( |
            | mirror primitiveContentsAt: name IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         annotation = ( |
            | 
            annotationIfFail: [ | :err | makeInvalid: err. annotation ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: annotation\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         annotation: x = ( |
            | annotation: x IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: annotation\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         annotation: x IfFail: fb = ( |
            | 
            inPlaceIfy: [copyHolderForAnnotation: x IfFail: [|:e| ^ fb value: e]] IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         annotationIfFail: fb = ( |
             a.
            | 
            holder areReflecteesSlotsMutable ifFalse: [^ slotAnnotation].
            a: unparsedAnnotationIfFail: [|:e| ^ fb value: e].
            a isAnnotation ifFalse: [ 
              a: slotAnnotation parse: a IfFail: [|:e|
                  warning: 'Could not parse annotation of: ',
                           name, ' in: ', holder creatorPath printString,
                           ', reason: ', e,
                           '\nIt will be ignored.'.
                  a copyForComment: 'Unparsable: ', a
              ].
              holder isOKToTransformAnnotationAfterParsing ifTrue: [
                holder frozenDefine: (
                  copyHolderForAnnotation: a IfFail: [|:e| ^ fb value: e]
                ) holder
                IfFail: [|:e| ^ fb value: e]
              ]
            ].
            a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentPrefix = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         basicPrintString = ( |
            | longKey, ' = ', valueName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         basicPrintStringAssignable = ( |
            | 
            isAssignable ifTrue: [ longerKey, ' <- ', value name ]
                          False: [ basicPrintString ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         basicPrintStringSize: s = ( | {
                 'ModuleInfo: Module: slot InitialContents: FollowSlot'
                
                 a.
                } 
            | 
            a: longKey,  ' = '.
            a, valueNameSize: 0 max: s - a size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         categories = ( |
            | annotation categories).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: categories\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         categories: strings = ( |
            | categories: strings IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: categories\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         categories: strings IfFail: fb = ( |
            | 
            annotation: (annotation copyForCategories: strings) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         category = ( |
            | 
            categoryIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: category\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         category: aString = ( |
            | category: aString IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: category\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         category: aString IfFail: fb = ( |
            | 
            annotation: (annotation copyForCategory: aString) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         categoryIfFail: fb = ( |
            | 
            ( annotationIfFail: [|:e| 
               ^ e = 'badTypeError' ifTrue: '' False: [fb value: e]]
            ) category).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming environment\x7fCategory: changing the category\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         changeCategoriesTo: cats = ( |
            | 
            isCopiedDown  ifTrue: [
              holder copyDowns: vector copyAddFirst:
                holder copyDowns first copyForSlotsToOmit: [|:sto| sto copyAddLast: name]
            ].
            categories: cats.
            (transporter moduleDictionary copiesOfSlot: self) do:
              [|:s| s categories: cats ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming environment\x7fCategory: changing the contents\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         changeContentsInHolderAndDescendantsTo: mir = ( |
            | 
            holder
              changeContentsOfSlotInMeAndDescendantsToName: name
                                                  Contents: mir).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming environment\x7fCategory: changing the slot\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         changeSlotInObjectTo: nSlotPair IfFail: fb = ( |
             anno.
             ds.
             nSlot.
             oContents.
             oHolder.
             oName.
             oWasA.
             oWasC.
            | 
            ds: nSlotPair 
                          findFirst: [|:s| s isAssignment not] 
                          IfPresent: [|:s| s] 
                           IfAbsent: [nSlotPair first].

            "If slot was copied down, do not keep some info."
            anno: annotation.
            isCopiedDown ifTrue: [
                anno: anno copyForComment: ''.
                anno: anno copyForFile: ''.
                anno: anno copyForModuleInfo: slotAnnotation moduleInfo.
            ].
            ds: ds copyHolderForAnnotation: anno.


            ds initialContents: ds contents = contents 
                                  ifTrue: [ initialContents  ] 
                                   False: [ transporter moduleInfo followSlot ].
            oWasA:     isAssignable.
            oWasC:     contents creatorSlotIfPresent: [|:s| s = self] IfAbsent: false.
            oName:     name.
            oContents: contents.
            oHolder:   holder.

            holder addOrChange: ds holder FormerlyKnownAs: name IfAnyFail: [^ fb value].

            nSlot: oHolder at: ds name.

            case if: [ds name != oName]  Then: [   "name changed, remove old slot"
              oHolder removeSlotsFromMeAndDescendants: vector copyAddFirst: self.
            ].
            "if old slot was creator, make new one creator"
            oWasC && [ds contents = oContents]
              ifTrue: [ nSlot contents creatorSlot: nSlot ].

            nSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         checkHolderOf: s = ( |
            | 
            holder = s holder ifFalse: [^ error: 'incomparable slots'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         comment = ( |
            | annotation comment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: comment\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         comment: aString = ( |
            | comment: aString IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: comment\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         comment: aString IfFail: fb = ( |
            | 
            annotation: (annotation copyForComment: aString) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: x IfLess: lb Equal: eb Greater: gb = ( |
            | 
            case
              if: [exists not && [x exists not]] Then: eb
              If: [               x exists not ] Then: lb
              If: [exists not                  ] Then: gb

              Else: [
                checkHolderOf: x.
                sortingOrder compare: x sortingOrder
                    IfLess: lb
                    Equal: [ compareKeys: x IfLess: lb Equal: eb Greater: gb ]
                    Greater: gb
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         compareKeys: x IfLess: lb Equal: eb Greater: gb = ( |
            | 
            key compare: x key  IfLess: lb  Equal: eb  Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         contents = ( |
            | value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: contents\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         contents: mir = ( |
            | contents: mir IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: contents\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         contents: mir IfFail: fb = ( |
            | 
            inPlaceIfy: [copyHolderForContents: mir IfFail: [|:e| ^ fb value: e]] IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsIfFail: fb = ( |
            | 
            valueIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownInfoIfPresent: presentBlock IfAbsent: absentBlock = ( |
             cds.
            | 
            "if slot is copied down, invoke presentBlock, passing it
             the copyDown moduleInfo object, else invoke absentBlock"

             cds: holder copyDowns.
             cds isEmpty ifTrue: [^ absentBlock value]. "hack for speed"
             cds reverseDo: [|:cd. :i|
                   (cd slotsToOmit includes: name) not
               && [ cd parentMirror includesKey: name ] 
                       ifTrue: [^ presentBlock value: cd With: i].
            ].
            absentBlock value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: annotation\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForAnnotation: x = ( |
            | copyHolderForAnnotation: x IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: annotation\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         copyHolderForAnnotation: x IfFail: fb = ( |
            | 
            (
              holder primitiveCopyAt: name 
                         PutContents: contents
                            IsParent: isParent 
                          IsArgument: isArgument
                          Annotation: x 
                              IfFail: [|:e| ^ fb value: e]
             ) at: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: categories\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForCategories: strings = ( |
            | copyHolderForCategories: strings IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: categories\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForCategories: strings IfFail: fb = ( |
            | 
            copyHolderForAnnotation: (annotation copyForCategories: strings)
                             IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: category\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForCategory: aString = ( |
            | copyHolderForCategory: aString IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: category\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForCategory: aString IfFail: fb = ( |
            | 
            copyHolderForAnnotation: (annotation copyForCategory: aString)
                             IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: comment\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForComment: aString = ( |
            | copyHolderForComment: aString IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: comment\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForComment: aString IfFail: fb = ( |
            | 
            copyHolderForAnnotation: (annotation copyForComment: aString)
                             IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: contents\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForContents: mir = ( |
            | copyHolderForContents: mir IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: contents\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         copyHolderForContents: mir IfFail: fb = ( |
            | 
            (
              holder primitiveCopyAt: name 
                         PutContents: mir
                            IsParent: isParent 
                          IsArgument: isArgument
                          Annotation: annotation
                              IfFail: [|:e| ^ fb value: e]
             ) at: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: initialContents\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForInitialContents: con = ( |
            | copyHolderForInitialContents: con IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: initialContents\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForInitialContents: con IfFail: fb = ( |
            | copyHolderForModuleInfo: (moduleInfo copyForInitialContents: con) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: isArgument\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForIsArgument: isA = ( |
            | copyHolderForIsArgument: isA IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: isArgument\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         copyHolderForIsArgument: isA IfFail: fb = ( |
             anno.
            | 
            anno: annotationIfFail: [|:e| ^ fb value: e].
            isArgument = isA ifTrue: [^ copyHolderIfFail: fb].
            (
              (copyHolderForRemoveIfFail: [|:e| ^ fb value: e])
                      primitiveCopyAt: name 
                          PutContents: mirrors slots
                             IsParent: isParent
                           IsArgument: isA
                           Annotation: annotation
                               IfFail: [|:e| ^ fb value: e]
             ) at: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: isParent\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForIsParent: isP = ( |
            | copyHolderForIsParent: isP IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: isParent\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         copyHolderForIsParent: isP IfFail: fb = ( |
            | 
            (
              holder primitiveCopyAt: name 
                         PutContents: contents 
                            IsParent: isP
                          IsArgument: isArgument
                          Annotation: annotation
                              IfFail: [|:e| ^ fb value: e]
            ) at: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: module\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForModule: m = ( |
            | copyHolderForModule: m IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: module\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForModule: m IfFail: fb = ( |
            | copyHolderForModuleInfo: (moduleInfo  copyForModule: m) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: moduleInfo\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForModuleInfo: mi = ( |
            | copyHolderForModuleInfo: mi IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: moduleInfo\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForModuleInfo: mi IfFail: fb = ( |
            | 
            copyHolderForAnnotation: (annotation copyForModuleInfo: mi)
                             IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: name\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForName: n = ( |
            | copyHolderForName: n IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: name\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         copyHolderForName: n IfFail: fb = ( |
             r.
            | 
            r: copyHolderForRemoveIfFail: [|:e| ^ fb value: e].
            (
               r primitiveCopyAt: n 
                     PutContents: contents 
                        IsParent: isParent 
                      IsArgument: isArgument
                      Annotation: annotation
                          IfFail: [|:e| ^ fb value: e]
             ) at: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: name and contents together\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForRemove = ( |
            | copyHolderForRemoveIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: name and contents together\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForRemoveIfFail: fb = ( |
            | 
            holder primitiveCopyRemoveSlot: name IfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: visibility\x7fComment: Suitable values for the argument \'v\' can be
found in the object \'visibility\'.\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForVisibility: v = ( |
            | copyHolderForVisibility: v IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: visibility\x7fComment: Suitable values for the argument \'v\' can be
found in the object \'visibility\'.\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForVisibility: v IfFail: fb = ( |
            | 
            copyHolderForAnnotation: 
             (annotation copyForVisibility: v)
            IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         copyHolderIfFail: fb = ( |
            | 
            (holder cloneReflecteeIfFail: [|:e| ^ fb value: e]) at: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         copyMirror: m Name: n = ( |
            | 
            (clone mirror: m) storedName: n canonicalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         correspondingAssignmentSlot = ( |
            | 
            mirror slotAt: key, ':'
                 IfAbsent: [ | :err | makeInvalid: err. correspondingAssignmentSlot ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         correspondingDataSlot = ( |
            | 
            mirror slotAt: key copyWithoutLast
                 IfAbsent: [ | :err | makeInvalid: err. correspondingDataSlot ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         couldBeACopiedDownCopyOf: aSlot = ( |
            | 
            couldBeACopyOf: aSlot FilteringAnnotationBy: [|:a| a copyForCopyDownTest]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         couldBeACopyOf: aSlot = ( |
            | 
            couldBeACopyOf: aSlot FilteringAnnotationBy: [|:a| a]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         couldBeACopyOf: aSlot FilteringAnnotationBy: filterBlk = ( |
            | 
                  "answer true if slots are similar enough to be copies"
                ( name       = aSlot name)
            && [( isArgument = aSlot isArgument )
            && [( isParent   = aSlot isParent ) 
            && [ (isAssignable || [contents   = aSlot contents])
            && [   (filterBlk value:       annotation)
                 = (filterBlk value: aSlot annotation)]]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         evalStringAssignable = ( |
             s.
            | 
            exists ifFalse: [ ^ '"non-existent slot"' ].
            s: longerKey.
            isAssignable ifTrue: [
              (reflect: nil) = value ifTrue: [^s].
              s: s, ' <- '
            ] False: [s: s, ' = ' ].
            s, value evalName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         exists = ( |
            | 
            holder primitiveContentsAt: key
                   IfFail: [ | :err | makeInvalid: err. ^ exists ].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: fast approximate sorting\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         fastApproxEQ: s = ( |
            | = s key).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: fast approximate sorting\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         fastApproxLT: s = ( |
            | 

                       categories
            compare: s categories
             IfLess: true
              Equal: [ sortingOrder compare: s sortingOrder 
                                     IfLess: true
                                      Equal: [ keyLessThanKeyOf: s ]
                                    Greater: false ]
            Greater: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: fast approximate sorting\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         fastApproxSorter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> 'fastApproxSorter' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slots plain fastApproxSorter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> 'fastApproxSorter' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot'
        
         element: s1 Equals: s2 = ( |
            | s1 fastApproxEQ: s2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> 'fastApproxSorter' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot'
        
         element: s1 Preceeds: s2 = ( |
            | s1 fastApproxLT: s2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         file = ( |
            | annotation file).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         fullName = ( |
            | longKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | holder hash ^^ key hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         holder = ( |
            | mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         inPlaceIfy: blk IfFail: fb = ( |
            | 
            "do blk, which is functional, and do the defines to make it in-place"
            (
              holder defineAndSave: blk value holder IfFail: [|:e| ^ fb value: e]
            ) at: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         initialContents = ( |
            | moduleInfo initialContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: initialContents\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         initialContents: con = ( |
            | initialContents: con IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: initialContents\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         initialContents: con IfFail: fb = ( |
            | moduleInfo: (moduleInfo copyForInitialContents: con) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: filing out slots\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isAnnotationIgnored = ( |
            | isAssignment || [ isCopiedDown ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isArgument = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: isArgument\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isArgument: isA = ( |
            | 
            isArgument = isA ifTrue: [^ self].
            isArgument: isA IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: isArgument\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isArgument: isA IfFail: fb = ( |
            | 
            inPlaceIfy: [ copyHolderForIsArgument: isA IfFail: [|:e| ^ fb value: e] ] IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isAssignable = ( |
            | 
            mirror primitiveIsAssignableAt: name
                   IfFail: [ | :err | makeInvalid: err. isAssignable ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isAssignment = ( |
            | 
            (contentsIfFail: [^ false]) isReflecteeAssignment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isBlockValueSlot = ( |
            | 
            holder isReflecteeBlock && [name = holder valueSlotName]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isCodes = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: filing out slots\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isContentsFiledOut = ( |
            | 
            isContentsFiledOutIfTrue: true False: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: filing out slots\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isContentsFiledOutIfTrue: trueBlock False: falseBlock = ( |
             c.
            | 
            "answer true if the object I contain should be filed out"
            c: contents.
            c isReflecteeAssignment  ifTrue: [
              ^ falseBlock value: 'assignment slots are not explicitly filed out'.
            ].
            initialContents isOKToFollow  ifFalse: [
              ^ falseBlock value: 'initial contents is not follow slot'.
            ].
            copyDownInfoIfPresent: [
              ^ falseBlock value: 'slot is copied-down and so not filed out'.
            ] IfAbsent: [
            ].
            isUntransportable ifTrue: [ 
              ^ falseBlock value: 'slot\'s module indicates it is not to be transported' 
            ].
            trueBlock value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isCopiedDown = ( |
            | copyDownInfoIfPresent: true IfAbsent: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isCreator = ( |
            | 
            "return true if this slot is the creator of its contents"
            contents creatorSlotIfPresent: [|:s| = s] IfAbsent: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isFake = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: filing out slots\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isFiledOut = ( |
            | 
            ( isAnnotationIgnored  ||  [ isUntransportable  ])  not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isLexicalParent = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isLiterals = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isMethod = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isParent = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: isParent\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isParent: isP = ( |
            | isParent: isP IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: isParent\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isParent: isP IfFail: fb = ( |
            | 
            inPlaceIfy: [ copyHolderForIsParent: isP IfFail: [|:e| ^ fb value: e] ] IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflectee = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isSourceFile = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isSourceLength = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isSourceLine = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isSourceOffset = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isSourceString = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: filing out slots\x7fComment: used for generated slots, for example\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isUntransportable = ( |
            | transporter moduleDictionary isModuleNameUntransportable: module).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isVectorElement = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming environment\x7fCategory: setting transporter info\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         isWorthAskingAboutCreator = ( |
            | 
                  isMethod not                                                  "methods are immutable, just duplicate them"
            && [  contents areReflecteesSlotsMutable                            "other immutable objects, e.g. 17"
            && [ (contents creatorSlotHint != self)                             "does not already have in-place creator"
            && [ holder filedOutCreatorPathIfPresent: true IfAbsent: false ]]]  "holder had good creator path").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = ( |
            | name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         keyLessThanKeyOf: s = ( |
            | key < s key).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         longKey = ( |
            | 
            exists ifFalse: [^'<nonexistent>'].
            argumentPrefix, plumpKey, parentPostfix).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         longNakedKey = ( |
            | argumentPrefix, plumpKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         longerKey = ( |
            | 
            argumentPrefix, plumpKey, parentPostfix).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         longerKeyWithAssigner = ( |
            | 
            longerKey, (isAssignable ifTrue: ' <-' False: ' =')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming environment\x7fCategory: makeing creator\x7fComment: Make me be the creator of my contents and
deal with the ancilliary info. -- dmu 6/1\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         makeCreator = ( |
            | 
            contents creatorSlot: self.
            initialContents: transporter moduleInfo followSlot
                     IfFail: ["allow for making an indexable slot a creator"
                              "So, allow this to fail.--dmu 3/03"].
            copyDownInfoIfPresent: [| :cd |
              holder copyDowns:
                holder copyDowns copyMappedBy: [|:c|
                  c = cd ifFalse: [c] 
                            True: [ cd copyForSlotsToOmit: [|:sto| sto asList addLast: name ] ]
                ].
            ] IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: invalidation\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         makeInvalid: err = ( |
            | 
            parent:  traits slots invalid copyForError: err).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming environment\x7fCategory: setting transporter info\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         maybeSetInitialContentsFromEditString: str = ( |
             ic <- ''.
            | 
            isAssignable not || [ isCopiedDown ] ifTrue: [^ self].

            ic:
                isAssignable  ifTrue: [
                  "Should be cleaned up"
                  "Compute the rhs. expression"
                  str findFirst: [|:c. :i. | (c = '<') && [(str at: i succ) = '-']]
                      IfPresent: [|:c. :i| (str copyFrom: i + 2) shrinkwrapped]
                      IfAbsent:  'nil'. "foo."
                ] False: [
                  str findFirst: [|:c. :i. |  c = '=' ]
                      IfPresent: [|:c. :i| (str copyFrom: i + 1) shrinkwrapped]
                      IfAbsent:  [error: 'What was after the "="?'].
                ].

                 initialContents isInitializeToExpression
            && [ initialContents expressionSource = ic]
              ifTrue: [^ self].

            initialContents: 
              (transporter moduleInfo initializeToExpression copyForExpression: ic).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming environment\x7fCategory: setting transporter info\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         maybeSetModuleTo: defaultModule IfNot: okModules = ( |
            | 
            module isEmpty && [defaultModule isEmpty not] ifTrue: [ 
               module: defaultModule. 
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         menuKey = ( |
            | longKey copyAtMostWithEllipsis: menuKeySize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         menuKeySize = 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         module = ( |
            | moduleInfo module).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: module\x7fComment: argument is really the module name
-- dmu 7/99\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         module: m = ( |
            | module: m IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: module\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         module: m IfFail: fb = ( |
            | moduleInfo: (moduleInfo copyForModule: m) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleInfo = ( |
            | 
            moduleInfoIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: moduleInfo\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleInfo: mi = ( |
            | moduleInfo: mi IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: moduleInfo\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleInfo: mi IfFail: fb = ( |
            | 
            annotation: (annotation copyForModuleInfo: mi) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleInfoIfFail: fb = ( |
            | 
            (annotationIfFail: [|:e| ^ fb value: e]) 
              moduleInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | storedName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: name\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         name: n = ( |
            | name: n IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: name\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         name: n IfFail: fb = ( |
            | 
            (
              holder defineAndSave: (
                copyHolderForName: n IfFail: [|:e| ^ fb value: e]
              ) holder IfFail: [|:e| ^ fb value: e]
            ) at: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'ModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'orderedClonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         parentPostfix = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         plumpKey = ( |
            | key).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
             a.
             b.
            | 
            b: basicPrintString.
            a: annotationIfFail: [|:e|  ^ b, ' (annotation failed: ', e, ')'].
            a printStringFor: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringAssignable = ( |
            | 
            isAssignable ifTrue: [ 
              annotation printStringFor: basicPrintStringAssignable.
            ] False: [ printString ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: name and contents together\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         remove = ( |
            | removeIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: name and contents together\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         removeIfFail: fb = ( |
            | 
            holder defineAndSave: 
              (copyHolderForRemoveIfFail: [|:e| ^ fb value: e]) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: private'
        
         sortingOrder = ( |
            | 200 + visibility sortingOrder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            annotation printStringFor: basicPrintString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         unparsedAnnotation = ( |
            | 
            unparsedAnnotationIfFail: [ | :err | makeInvalid: err. unparsedAnnotation ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing annotations\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         unparsedAnnotationIfFail: fb = ( |
            | 
            mirror primitiveAnnotationAt: name IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         value = ( |
            | 
            valueIfFail: [ "the parent has been changed" value ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         valueIfFail: fb = ( |
            | 
            actualValueIfFail: [ | :e | makeInvalid: e. fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         valueName = ( |
            | value name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slot InitialContents: FollowSlot'
        
         valueNameSize: n = ( |
            | value nameSize: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         visibility = ( |
            | annotation visibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: visibility\x7fComment: Suitable values for the argument \'v\' can be
found in the object \'visibility\'.\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         visibility: v = ( |
            | visibility: v IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: programming\x7fCategory: visibility\x7fComment: Suitable values for the argument \'v\' can be
found in the object \'visibility\'.\x7fModuleInfo: Module: slot InitialContents: FollowSlot\x7fVisibility: public'
        
         visibility: v IfFail: fb = ( |
            | 
            inPlaceIfy: [ copyHolderForVisibility: v IfFail: [|:e| ^ fb value: e] ] IfFail: fb).
        } | ) 



 '-- Side effects'

 globals modules slot postFileIn
