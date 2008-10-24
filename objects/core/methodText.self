 'Sun-$Revision: 30.13 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractMethodText = bootstrap define: bootstrap stub -> 'globals' -> 'abstractMethodText' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals textLines copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractMethodText' -> () From: ( |
             {} = 'Comment: language-independent method text\x7fModuleInfo: Creator: globals abstractMethodText.

CopyDowns:
globals textLines. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractMethodText = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractMethodText' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractMethodText.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractMethodText' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractMethodText' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot'
        
         methodText = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'methodText' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'methodText' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules methodText.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'methodText' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'methodText' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'methodText' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot'
        
         myComment <- 'These objects used by oldFileOut, debugger, and UI.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'methodText' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.13 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'methodText' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractMethodText' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForMethod: aMirror = ( |
            | 
            clone initializeForMethod: aMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractMethodText' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'textLines' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         selfMethodText = bootstrap define: bootstrap stub -> 'globals' -> 'selfMethodText' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractMethodText copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfMethodText' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfMethodText.

CopyDowns:
globals abstractMethodText. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfMethodText' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         indentation <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfMethodText' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         method <- bootstrap stub -> 'globals' -> 'mirrors' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         selfMethodText = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits selfMethodText.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfMethodText' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'selfMethodText' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: formatting\x7fCategory: helpers\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         addSlotList = ( |
             sl.
            | 
            sl: convertToLines: slotList.
            firstLine isAllWhiteSpace ifTrue: [
              sl last: sl last, firstLine.
              lines removeFirst.
            ].
            isDisassembled ifTrue: [ lines addFirst: '' ].
            lines addAllFirst: sl.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: conversions\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         asCode = ( |
            | copy formatCode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: conversions\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         asMethod = ( |
            | copy formatMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: conversions\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         asSlotContents = ( |
            | copy formatSlotContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: formatting\x7fCategory: helpers\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         format: firstLineTest = ( |
            | 
            detabify.
            leftShrinkwrap.
            addSlotList.
            removeFirstLineIf: firstLineTest.
            indentBody: indentation.
            parenthesize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: formatting\x7fCategory: helpers\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         formatCode = ( |
            | detabify. leftShrinkwrap. indentBody: indentation. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: formatting\x7fCategory: helpers\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         formatMethod = ( |
            | format: [ firstLine isAllWhiteSpace ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         formatMethodBody = ( |
            | 
            detabify.
            leftShrinkwrap.
            addSlotList.
            removeFirstLineIf: firstLine isAllWhiteSpace).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         formatMethodBodyWithoutSlots = ( |
            | 
            detabify.
            leftShrinkwrap.
            removeFirstLineIf: firstLine isAllWhiteSpace.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: formatting\x7fCategory: helpers\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         formatSlotContents = ( |
            | 
            indentation: 4.
            format: [ (height = 2) && [firstLine isAllWhiteSpace] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: formatting\x7fCategory: helpers\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         indentBody: n = ( |
            | 
            indent: n.
            firstLine: firstLine leftShrinkwrapped.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeForMethod: aMirror = ( |
             s.
            | 
            method: aMirror.
            s: sourceOrBytecodes.
            originalSource: s.
            lines: convertToLines: s.
            nullIfEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         isDisassembled = ( |
            | 
            method mustBeDisassembled).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: methodText InitialContents: FollowSlot'
        
         originalSource: s = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractMethodText' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: formatting\x7fCategory: helpers\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         parenthesize = ( |
            | 
            firstLine: '( ', firstLine.
            lastLine: lastLine isAllWhiteSpace ifTrue: ')'
                                                False: [ lastLine, ')' ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: formatting\x7fCategory: helpers\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         removeFirstLineIf: test = ( |
            | 
            test value ifTrue: [ lines removeFirst ].
            nullIfEmpty.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: formatting\x7fCategory: helpers\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         shrinkLine: i = ( |
            | i > 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: formatting\x7fCategory: helpers\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         slotList = ( |
             m <- bootstrap stub -> 'globals' -> 'list' -> ().
             maxLineLength.
             maxMaxLineLength <- 70.
             sl <- '| '.
             slop = 5.
             slotSeparator = '. '.
             totalSize.
            | 

            "Do a bit of fiddling to try to get the lines to be all
             approximately the same length, without going too far
             over either 70 characters or the length of the longest
             line in the method (whichever is greater). -- Adam, 8/04"

            m: method evalStringsForLocalSlots.

            m isEmpty ifTrue: [^ ''].

            totalSize: sl size.
            m do: [|:s| totalSize: totalSize + s size + slotSeparator size].

            lines do: [|:line| maxMaxLineLength: maxMaxLineLength max: line size].

            maxLineLength:  (totalSize /+ (totalSize /+ maxMaxLineLength)) + slop.

            m   doFirst: [|:s| sl: sl, s]
             MiddleLast: [|:s| sl: sl, slotSeparator.
                               (sl lastLine size + s size) > maxLineLength ifTrue: [
                                 sl: sl, '\n  '.
                               ].
                               sl: sl, s].
            sl, ' |').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: methodText InitialContents: FollowSlot'
        
         sourceOrBytecodes = ( |
            | 
            isDisassembled ifTrue: [method disassemble] False: [method source]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodText' -> () From: ( | {
         'Comment: no asMethodText\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringWorks = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         selfMethodTextWithPositionConversion = bootstrap define: bootstrap stub -> 'globals' -> 'selfMethodTextWithPositionConversion' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfMethodText copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfMethodTextWithPositionConversion' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfMethodTextWithPositionConversion.

CopyDowns:
globals selfMethodText. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfMethodTextWithPositionConversion' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         originalSource <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         selfMethodTextWithPositionConversion = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'selfMethodTextWithPositionConversion' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits selfMethodTextWithPositionConversion.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfMethodTextWithPositionConversion' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'selfMethodTextWithPositionConversion' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfMethodTextWithPositionConversion' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         savedExcess.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodTextWithPositionConversion' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         convertBCIToLine: bci = ( |
             bciString.
            | 
            bciString: bci printString, ':'.
            lines asVector "asVector so 2nd arg will be lineNo"
                  findFirst: [|:lin| bciString isPrefixOf: lin leftShrinkwrapped]
                  IfPresent: [|:lin. :i| i ]
                  IfAbsent:  [ error: 'bci not found' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodTextWithPositionConversion' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         convertPosition: pt FormatBlock: blk = ( |
             mt.
             x.
             y.
            | 
            mt: clone lines: convertToLines: sourceOrBytecodes copySize: pt x.
            blk value: mt.
            x: mt asString size.

            mt: clone lines: convertToLines: sourceOrBytecodes copySize: pt y.
            blk value: mt.
            y: mt asString size.

            x @ y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodTextWithPositionConversion' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: public'
        
         leftShrinkwrap = ( |
            | 
            savedExcess
              ifNil:    [resend.leftShrinkwrap]
              IfNotNil: [leftShrinkwrap: savedExcess]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selfMethodTextWithPositionConversion' -> () From: ( | {
         'ModuleInfo: Module: methodText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'selfMethodText' -> ().
        } | ) 



 '-- Side effects'

 globals modules methodText postFileIn
