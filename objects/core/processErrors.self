 'Sun-$Revision: 30.11 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot'
        
         processErrors = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'processErrors' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'processErrors' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules processErrors.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot'
        
         myComment <- 'This file defines error objects used to appropriately handle
             errors for processes when the Self scheduler is running.
             It was written by Lars Bak, and Dave Ungar took a pass through
             the messages. -- dmu 2/15/92'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         processErrors = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processErrors' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processErrors.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         undefinedSelector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processErrors' -> 'undefinedSelector' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processErrors undefinedSelector.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'undefinedSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         arguments <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'undefinedSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         delegatee <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'undefinedSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         methodHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         undefinedSelector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'undefinedSelector' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors undefinedSelector.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'undefinedSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'undefinedSelector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'undefinedSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'undefinedSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         selector <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'undefinedSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         type <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         abstract = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors abstract.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         descendantResponsibilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> 'descendantResponsibilities' -> () From: ( |
             {} = 'Comment: The following methods must be implemented by a descendant.\x7fModuleInfo: Creator: traits processErrors abstract descendantResponsibilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         errorString = ( |
            | 
            'Returns a string describing the error.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         firstInterestingFrameMatchingSelector: procStack = ( |
            | 
            procStack findFirst: [|:activation|
                matchingSelector = activation selector
            ] IfPresent: [|:f. :i| i succ]
              IfAbsent:  -1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         firstInterestingFrameOf: s = ( |
            | 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         formatCollection: coll Do: blk = ( | {
                 'ModuleInfo: Module: processErrors InitialContents: FollowSlot'
                
                 r <- ''.
                } 
            | 
            coll doFirst: [|:v| r: blk value: v]
                  Middle: [|:v| r: r, ', '    , (blk value: v)]
                    Last: [|:v| coll size != 2 ifTrue: [ r: r, ',' ].
                                r: r, ' and ', (blk value: v)]
                 IfEmpty: [].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         isUndefinedSelectorError = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         quote: str = ( |
            | '\'', str, '\'').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         reportError: proc ForceStackTrace: sft = ( |
            | 
            proc stderr write: errorString, '\n'.
            process != proc ifFalse: [
                ^ self  "can't print nice stack trace if running raw VM prompt"].  
            (sft || [preferences printStackOnError])
                ifTrue: [ proc filteredStackTrace ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            errorString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractLookupError = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors abstractLookupError.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         methodHolderString = ( |
            | 
            nil == methodHolder ifTrue: [ '' ] False: [
             '\nSending method holder is ', (reflect: methodHolder) safeName, '.']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors abstractLookupError parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         firstInterestingFrameOf: procStack = ( |
            | 
            procStack findFirst: [|:activation|
                       ( (reflect: receiver) = activation receiver ) 
                    && [           selector  = activation selector ]
            ] IfPresent: [|:f. :i| i ]
              IfAbsent:  -1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'undefinedSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         errorString = ( |
            | 
            'No ', (quote: selector), ' slot found in ', (reflect: receiver) safeName,
            '.', methodHolderString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'undefinedSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         isUndefinedSelectorError = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'undefinedSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'undefinedSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | birdAndFish).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         ambiguousSelector = bootstrap define: bootstrap stub -> 'globals' -> 'processErrors' -> 'ambiguousSelector' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals processErrors undefinedSelector copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processErrors' -> 'ambiguousSelector' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processErrors ambiguousSelector.

CopyDowns:
globals processErrors undefinedSelector. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'ambiguousSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         conflictingSlots <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         ambiguousSelector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'ambiguousSelector' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors ambiguousSelector.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'ambiguousSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'ambiguousSelector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         mismatchedArgumentCountSelector = bootstrap define: bootstrap stub -> 'globals' -> 'processErrors' -> 'mismatchedArgumentCountSelector' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals processErrors undefinedSelector copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processErrors' -> 'mismatchedArgumentCountSelector' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processErrors mismatchedArgumentCountSelector.

CopyDowns:
globals processErrors undefinedSelector. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         mismatchedArgumentCountSelector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'mismatchedArgumentCountSelector' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors mismatchedArgumentCountSelector.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'mismatchedArgumentCountSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'mismatchedArgumentCountSelector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         missingDelegatee = bootstrap define: bootstrap stub -> 'globals' -> 'processErrors' -> 'missingDelegatee' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals processErrors undefinedSelector copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processErrors' -> 'missingDelegatee' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processErrors missingDelegatee.

CopyDowns:
globals processErrors undefinedSelector. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         missingDelegatee = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'missingDelegatee' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors missingDelegatee.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'missingDelegatee' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'missingDelegatee' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         nonLifoBlock = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processErrors' -> 'nonLifoBlock' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processErrors nonLifoBlock.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         nonLifoBlock = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'nonLifoBlock' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors nonLifoBlock.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'nonLifoBlock' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'nonLifoBlock' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         ok = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processErrors' -> 'ok' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processErrors ok.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         ok = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'ok' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors ok.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'ok' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'ok' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         performTypeErrorSelector = bootstrap define: bootstrap stub -> 'globals' -> 'processErrors' -> 'performTypeErrorSelector' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals processErrors undefinedSelector copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processErrors' -> 'performTypeErrorSelector' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processErrors performTypeErrorSelector.

CopyDowns:
globals processErrors undefinedSelector. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         performTypeErrorSelector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'performTypeErrorSelector' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors performTypeErrorSelector.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'performTypeErrorSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'performTypeErrorSelector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         primitiveFailed = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processErrors' -> 'primitiveFailed' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processErrors primitiveFailed.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'primitiveFailed' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         error <- 'some error'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         primitiveFailed = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'primitiveFailed' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors primitiveFailed.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'primitiveFailed' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'primitiveFailed' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'primitiveFailed' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'primitiveFailed' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         selector <- 'selector'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         stackOverflow = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processErrors' -> 'stackOverflow' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processErrors stackOverflow.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         stackOverflow = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'stackOverflow' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors stackOverflow.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'stackOverflow' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'stackOverflow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         userError = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processErrors' -> 'userError' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processErrors userError.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'userError' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         message <- 'an error message'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         userError = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'userError' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors userError.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'userError' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'userError' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'userError' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractUserError = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractUserError' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors abstractUserError.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractUserError' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         errorString = ( |
            | 
            'Error: ', message,  '.\n',
            'Receiver is: ', (reflect: receiver) safeName, '.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractUserError' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         firstInterestingFrameOf: procStack = ( |
            | 
            firstInterestingFrameMatchingSelector: procStack).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractUserError' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         matchingSelector = 'suspendAndTrace:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractUserError' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'userError' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractUserError' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'userError' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | lobby error: 'user error').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         userErrorWithArguments = bootstrap define: bootstrap stub -> 'globals' -> 'processErrors' -> 'userErrorWithArguments' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals processErrors userError copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processErrors' -> 'userErrorWithArguments' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processErrors userErrorWithArguments.

CopyDowns:
globals processErrors userError. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'userErrorWithArguments' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         arguments <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         userErrorWithArguments = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'userErrorWithArguments' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors userErrorWithArguments.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processErrors' -> 'userErrorWithArguments' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'userErrorWithArguments' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         processErrors = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractNonRecoverable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractNonRecoverable' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processErrors abstractNonRecoverable.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractNonRecoverable' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractRecoverable = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'ambiguousSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         errorString = ( |
            | 
            'More than one ', (quote: selector), ' slot was found in ',
            (reflect: receiver) safeName, '.',
            methodHolderString, '\n',
            'The matching slots are: ',
            (formatCollection: conflictingSlots Do: [|:s| s holder safeName]),
            '.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'ambiguousSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'ambiguousSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | (|  parent* = lobby. b* = (| x |). c* = (| x |) |) x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'mismatchedArgumentCountSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         errorString = ( |
            | 
            'The selector ', (reflect: selector) safeName, ' could not be sent to ',
            (reflect: receiver) safeName, ' because it does not take ',
            arguments size printString, ' arguments.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'mismatchedArgumentCountSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'mismatchedArgumentCountSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | lobby _Perform: 'add:' With: 1 With: lobby).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'missingDelegatee' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         errorString = ( |
            | 
            'No ', (quote: delegatee), ' delegatee slot was found in ',
            (reflect: receiver) safeName, '.', methodHolderString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'missingDelegatee' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'missingDelegatee' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | (| parent* = lobby. bird = ( fish.a ) |) bird).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'nonLifoBlock' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         errorString = 'Self 4.0 cannot run a block after its enclosing method has returned.
(Self cannot resume this process, either.)'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'nonLifoBlock' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractNonRecoverable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'nonLifoBlock' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | test1 value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'nonLifoBlock' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         test1 = ( |
            | [ error: 'shouldn\'t be running this' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'ok' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         errorString = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'ok' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         firstInterestingFrameOf: s = ( |
            | 
            "If halt is on the stack return its activation number + 1,
             ( halt is uninteresting )
             else if performInScheduler:IfInside: is on the stack, return its
             successor, otherwise return 0."
            s findFirst: [| :activation |
                     activation isReflecteeMethodActivation
                && [('defaultBehavior' = (activation methodHolderIfFail: [nil asMirror]) name) 
                && [ 'halt'            = (activation     selectorIfFail: 'noSelector'  )
            ]]] IfPresent: [|:f. :i| i succ ] IfAbsent: [
            s findFirst: [| :activation |
                   activation isReflecteeMethodActivation
              && [('mixins system schedulerCalls' = (activation methodHolderIfFail: [nil asMirror]) name) 
              && [ 'performInScheduler:IfInside:' = (activation     selectorIfFail: 'noSelector'  )
            ]]] IfPresent: [|:f. :i| i succ ] IfAbsent: 0 ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'ok' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'performTypeErrorSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         errorString = ( |
            | 
            'The selector ', (reflect: selector) safeName, ' could not be sent to ',
            (reflect: receiver) safeName, ' because it ',
            ((reflect: selector) isReflecteeString ifFalse:  'is not a string.'
                                                      True:  [
             selector isEmpty                       ifTrue:  'is empty.'
                                                     False:  [
             selector isCapitalized                 ifTrue:  'is capitalized.'
                                                     False:  [
             selector first = '_'                   ifTrue:  
                'starts with an underscore and Self 4.0 cannot _Perform primitives.'
                                                     False:  
                'contains a character not allowed in a slot name.'
             ]]])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'performTypeErrorSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'performTypeErrorSelector' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | lobby _Perform: 12222).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'primitiveFailed' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         errorString = ( |
            | 
            error, ': the ', (quote: selector), ' primitive failed.\n',
            'Its receiver was ', (reflect: receiver) safeName, '.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'primitiveFailed' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         firstInterestingFrameOf: procStack = ( |
            | 
            firstInterestingFrameMatchingSelector: procStack).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'primitiveFailed' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         matchingSelector = 'primitiveFailedError:Name:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'primitiveFailed' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractLookupError' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'primitiveFailed' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | lobby _IntAdd: lobby).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'stackOverflow' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         errorString = 'The stack has grown too big. 
(Self 4.0 limits stack sizes, and cannot resume processes with stack overflows.)'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'stackOverflow' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractNonRecoverable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'stackOverflow' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | (| parent* = 0 |) even).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'userErrorWithArguments' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         errorString = ( |
            | 
            resend.errorString, '\n',
            (arguments isEmpty  ifTrue: 'No arguments' False: [
             arguments size = 1 ifTrue: 'Argument is: '
                                 False: 'Arguments are: ']),
            (formatCollection: arguments Do: [|:arg| (reflect: arg) safeName]),
            '.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'userErrorWithArguments' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processErrors' -> 'abstractUserError' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processErrors' -> 'userErrorWithArguments' -> () From: ( | {
         'ModuleInfo: Module: processErrors InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | lobby error: 'user error with argument'
            Arguments: (vector copyAddLast: lobby)).
        } | ) 



 '-- Side effects'

 globals modules processErrors postFileIn
