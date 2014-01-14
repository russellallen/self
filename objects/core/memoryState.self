 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: memory management\x7fModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: public'
        
         memoryState = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( |
             {} = 'Comment: memoryState provides statistics on the current state of the underlying memory system used by Self.
Making a copy of the prototype captures the current statistics.  See _MemoryCurrentState: for
more information about some of the statistics.\x7fModuleInfo: Creator: globals memoryState.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: Capacity of old space\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         capacity <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: The current size of the card table used for scavenging.\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         card_table_size <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: The number of bytes used in the code cache.\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         code <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: The number of bytes used for debug information.\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         debug <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: The number of bytes used for compilation dependencies.\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         deps <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: See _MemoryCurrentState:.\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (vector copySize: 3 FillingWith: 0)\x7fVisibility: public'
        
         eden <- vector copySize: 3 FillingWith: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: Number of free bytes in old space.\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         free <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: See _MemoryCurrentState:.\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (vector copySize: 3 FillingWith: 0)\x7fVisibility: public'
        
         from <- vector copySize: 3 FillingWith: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: The largest contiguous free area in old space.\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         maxContiguousFree <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: The number of old space segments that are
non empty -- Mario, 1/31/95\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         numNonEmptyOldSpaceSegments <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: The number of scavenges since system startup.\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         num_scavenge <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: See _MemoryCurrentState:.\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (vector copyAddLast: vector copySize: 3 FillingWith: 0)\x7fVisibility: public'
        
         old <- vector copyAddLast: vector copySize: 3 FillingWith: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: public'
        
         memoryState = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'memoryState' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits memoryState.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'ModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'memoryState' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: The number of bytes occupied by polymorphic inline caches.\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         pics <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: See _MemoryCurrentState:.\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (vector copySize: 3 FillingWith: 0)\x7fVisibility: public'
        
         to <- vector copySize: 3 FillingWith: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memoryState' -> () From: ( | {
         'Comment: The total number of bytes used in old space.\x7fModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         used <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: memoryState InitialContents: FollowSlot'
        
         memoryState = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'memoryState' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'memoryState' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules memoryState.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'memoryState' -> () From: ( | {
         'ModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'memoryState' -> () From: ( | {
         'ModuleInfo: Module: memoryState InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'memoryState' -> () From: ( | {
         'ModuleInfo: Module: memoryState InitialContents: FollowSlot'
        
         myComment <- '\'memoryState is used to obtain statistics on the
            state of the memory system.\''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'memoryState' -> () From: ( | {
         'ModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'memoryState' -> () From: ( | {
         'ModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'memoryState' -> () From: ( | {
         'ModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy init).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'memoryState' -> () From: ( | {
         'Category: new generation\x7fModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: public'
        
         edenSize = ( |
            | eden at: 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'memoryState' -> () From: ( | {
         'Category: new generation\x7fModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: public'
        
         fromSize = ( |
            | from at: 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'memoryState' -> () From: ( | {
         'ModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: private'
        
         init = ( |
            | 
            _MemoryCurrentState:         self.
            capacity:                    0.
            used:                        0.
            maxContiguousFree:           0.
            numNonEmptyOldSpaceSegments: 0.
            old do: [| :v. thisCap. thisUsed. thisFree |
              thisCap:  (v at: 2).
              thisUsed: (v at: 0) + (v at: 1).
              thisUsed > 0 ifTrue: [
                numNonEmptyOldSpaceSegments: numNonEmptyOldSpaceSegments succ
              ].
              thisFree: thisCap  - thisUsed.
              used:     used     + thisUsed.
              capacity: capacity + thisCap.
              maxContiguousFree:  maxContiguousFree max: thisFree.
            ].
            free:                      capacity - used.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'memoryState' -> () From: ( | {
         'ModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: public'
        
         numOldSpaceSegments = ( |
            | old size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'memoryState' -> () From: ( | {
         'ModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'memoryState' -> () From: ( | {
         'Category: new generation\x7fModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: public'
        
         toSize = ( |
            | to at: 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'memoryState' -> () From: ( | {
         'ModuleInfo: Module: memoryState InitialContents: FollowSlot\x7fVisibility: public'
        
         worstCaseScavengeSize = ( |
            | 
            edenSize + fromSize + toSize).
        } | ) 



 '-- Side effects'

 globals modules memoryState postFileIn
