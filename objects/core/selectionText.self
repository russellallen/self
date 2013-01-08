 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot'
        
         selectionText = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selectionText' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selectionText' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selectionText.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selectionText' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selectionText' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selectionText' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selectionText' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selectionText' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionText = bootstrap define: bootstrap stub -> 'globals' -> 'selectionText' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals textLines copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selectionText' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selectionText.

CopyDowns:
globals textLines. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionText = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits selectionText.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionText' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'selectionText' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionText' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         selection <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selectionText' -> 'selection' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selectionText selection.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionText' -> 'selection' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         end <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionText' -> 'selection' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionText' -> 'selection' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         start <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             new <- bootstrap stub -> 'globals' -> 'selectionText' -> ().
            | 
            new: resend.copy.
            new selection: new selection copy.
            new selection start: 0@0.
            new selection end:   0@0.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         copyLines: str = ( |
            | 
            (copy lines: convertToLines: str) nullIfEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         do: blk AtSelectionStart: startBlk AtSelectionEnd: endBlk = ( | {
                 'ModuleInfo: Module: selectionText InitialContents: FollowSlot'
                
                 lineNo <- 0.
                } 
            | 

             hasSelection ifTrue: [
                 lines do: [|:line|
                    line do:[| :c. :i |
                        (selection start y = lineNo)
                    && [ selection start x = i ] ifTrue: [ startBlk value: c ].
                    blk value: c.
                        (selection end   y = lineNo)
                    && [ selection end   x = i succ ] ifTrue: [ endBlk value: c ]].
                    lineNo = lines size ifFalse: [ blk value: '\n' ].
                    lineNo: lineNo succ.]
            ] False: [
             lines do: [|:line|
                line do:[| :c. :i | blk value: c].
                lineNo = lines size ifFalse: [ blk value: '\n' ].
                lineNo: lineNo succ.]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: accessingSelection\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         endChar = ( |
            | selection end x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: modifyingSelection\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         endChar: char = ( | {
                 'ModuleInfo: Module: selectionText InitialContents: FollowSlot'
                
                 y.
                } 
            | 
            y: selection end y.
            selection end: selection end copyX: char Y: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: accessingSelection\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         endLine = ( |
            | selection end y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: modifyingSelection\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         endLine: line = ( | {
                 'ModuleInfo: Module: selectionText InitialContents: FollowSlot'
                
                 x.
                } 
            | 
            x: selection end x.
            selection end: selection end copyX: x Y: line).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: modifyingSelection\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         endPos: pos = ( |
            | 
            selection end: selection end copyX: pos x Y: pos y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         hasSelection = ( |
            | selection start != selection end).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'textLines' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: modifyingSelection\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionInBounds = ( | {
                 'ModuleInfo: Module: selectionText InitialContents: FollowSlot'
                
                 endLineSize.
                }  {
                 'ModuleInfo: Module: selectionText InitialContents: FollowSlot'
                
                 paraSize.
                }  {
                 'ModuleInfo: Module: selectionText InitialContents: FollowSlot'
                
                 retVal <- bootstrap stub -> 'globals' -> 'false' -> ().
                }  {
                 'ModuleInfo: Module: selectionText InitialContents: FollowSlot'
                
                 startLineSize.
                } 
            | 
            paraSize: (numberOfLines - 1).
            (startLine >= 0) && 
                [(startLine <= paraSize) &&
                [(endLine >= 0) && [endLine <= paraSize]]] ifTrue: [
                    startLineSize: (lines at: startLine IfAbsent: ['']) size.
                    endLineSize: (lines at: endLine IfAbsent: ['']) size.
                    retVal: (startChar >= 0) && 
                        [(startChar <= startLineSize) && 
                            [(endChar >= 0) && [endChar <= endLineSize]]]
            ].
            retVal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: modifyingSelection\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionStart: sp End: ep = ( |
            | startPos: sp. endPos: ep).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: modifyingSelection\x7fComment: Method to make sure that startSelection is before endSelection \x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         startBeforeEnd = ( |
            | 
            (endLine < startLine) ifTrue: [ 
                swapStartAndEnd
            ] False: [
                (endLine = startLine) ifTrue: [
                    (endChar < startChar) ifTrue: [
                        swapStartAndEnd
                    ]
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: accessingSelection\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         startChar = ( |
            | selection start x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: modifyingSelection\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         startChar: char = ( | {
                 'ModuleInfo: Module: selectionText InitialContents: FollowSlot'
                
                 y.
                } 
            | 
            y: selection start y.
            selection start: selection start copyX: char Y: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: accessingSelection\x7fComment: Methods to get selections. \x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         startLine = ( |
            | selection start y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: modifyingSelection\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         startLine: line = ( | {
                 'ModuleInfo: Module: selectionText InitialContents: FollowSlot'
                
                 x.
                } 
            | 
            x: selection start x.
            selection start: selection start copyX: x Y: line).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: modifyingSelection\x7fComment: Methods to set selections. \x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         startPos: pos = ( |
            | 
            selection start: selection start copyX: pos x Y: pos y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'ModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | fb value: 'unimplemented').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionText' -> () From: ( | {
         'Category: modifyingSelection\x7fModuleInfo: Module: selectionText InitialContents: FollowSlot\x7fVisibility: private'
        
         swapStartAndEnd = ( | {
                 'ModuleInfo: Module: selectionText InitialContents: FollowSlot'
                
                 tempPoint.
                } 
            | 
            tempPoint: selection start.
            selection start: selection end.
            selection end: tempPoint).
        } | ) 



 '-- Side effects'

 globals modules selectionText postFileIn
