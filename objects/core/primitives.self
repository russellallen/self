 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: primitives InitialContents: FollowSlot'
        
         primitives = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'primitives' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'primitives' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules primitives.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'primitives' -> () From: ( | {
         'ModuleInfo: Module: primitives InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'primitives' -> () From: ( | {
         'ModuleInfo: Module: primitives InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'primitives' -> () From: ( | {
         'ModuleInfo: Module: primitives InitialContents: FollowSlot'
        
         myComment <- '\'Primitive documentation\''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'primitives' -> () From: ( | {
         'ModuleInfo: Module: primitives InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'primitives' -> () From: ( | {
         'ModuleInfo: Module: primitives InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: Virtual Machine interface\x7fModuleInfo: Module: primitives InitialContents: FollowSlot\x7fVisibility: public'
        
         primitives = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitives' -> () From: ( |
             {} = 'Comment: Helps retrieve primitive documentation.\x7fModuleInfo: Creator: globals primitives.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitives' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: primitives InitialContents: FollowSlot\x7fVisibility: public'
        
         at: prim = ( |
            | at: prim IfFail: [error: 'primitive not found']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitives' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: primitives InitialContents: FollowSlot\x7fVisibility: public'
        
         at: prim IfFail: fb = ( | {
                 'ModuleInfo: Module: primitives InitialContents: FollowSlot'
                
                 doc.
                } 
            | 
            doc: documentationAt: prim IfFail: [|:e| ^ fb value: e].
            doc isEmpty ifFalse: [^doc].
            "Try again for simple primitive"
            documentationAt: prim, ':' IfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitives' -> () From: ( | {
         'Category: Iteration\x7fModuleInfo: Module: primitives InitialContents: FollowSlot\x7fVisibility: public'
        
         do: blk = ( |
            | primitiveList do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitives' -> () From: ( | {
         'Category: Primitives\x7fModuleInfo: Module: primitives InitialContents: FollowSlot\x7fVisibility: public'
        
         documentationAt: prim IfFail: fb = ( |
            | 
            prim _PrimitiveDocumentationIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitives' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: primitives InitialContents: FollowSlot\x7fVisibility: public'
        
         match: pattern = ( |
             l <- bootstrap stub -> 'globals' -> 'list' -> ().
            | 
            l: l copy.
            primitiveList filterBy: [| :s |
              s matchesPattern: pattern IgnoreCase: false
            ] Into: l.
            l asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitives' -> () From: ( | {
         'ModuleInfo: Module: primitives InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitives' -> () From: ( | {
         'Category: Primitives\x7fModuleInfo: Module: primitives InitialContents: FollowSlot\x7fVisibility: public'
        
         primitiveList = ( |
            | _PrimitiveListIfFail: [|:error|
                'outOfMemoryError' == error ifFalse: [
                  error: error
                ] True: [
                  memory allocationFailed.
                  _PrimitiveList
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitives' -> () From: ( | {
         'Category: Printing\x7fModuleInfo: Module: primitives InitialContents: FollowSlot\x7fVisibility: public'
        
         printList = ( |
            | 
            do: [|:prim|
              prim       printLine.
              (at: prim) printLine.
            ].
            self).
        } | ) 



 '-- Side effects'

 globals modules primitives postFileIn
