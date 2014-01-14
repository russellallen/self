 'Sun-$Revision: 30.34 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot'
        
         larsText = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'larsText' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'larsText' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules larsText.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'larsText' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'larsText' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'larsText' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot'
        
         myComment <- 'Lars\' text editor in ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'larsText' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.34 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'larsText' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2_textBuffer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui2_textBuffer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui2_textBuffer.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textBuffer' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         areDataInClipboard <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textBuffer' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         contents = ( |
            | 
            desktop isOpen ifFalse: [ myContents ]
                              True: [ contentsForWorld: desktop w ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textBuffer' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         contents: s = ( |
            | 
            areDataInClipboard: true.
            desktop isOpen ifTrue: [
              setContentsTo: s ForWorld: desktop w.
            ].
            myContents: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textBuffer' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsForWorld: w = ( |
            | 
            areDataInClipboard ifTrue: [|canvas|
              canvas:  w anyOpenWindowCanvasIfNone:    [^ myContents ].
              canvas display fetchFromClipboardIfFail: [  myContents ]
            ] False: [ myContents ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textBuffer' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         myContents <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textBuffer' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textBuffer' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         setContentsTo: s ForWorld: w = ( |
             wc.
            | 
            myContents: s.
            areDataInClipboard: false.
            wc: w anyOpenWindowCanvasIfNone: [^ self].
            wc display storeToClipboard: s IfFail: [^ self].
            areDataInClipboard: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2_textField = bootstrap define: bootstrap stub -> 'globals' -> 'ui2_textField' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals abstractEditorMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui2_textField.

CopyDowns:
globals abstractEditorMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         c = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui2_textField' -> 'c' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui2_textField c.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> 'c' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot'
        
         adjust = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> 'c' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot'
        
         off = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> 'c' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot'
        
         on = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         contents <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: InitializeToExpression: (paint named: \'black\')\x7fVisibility: public'
        
         fontColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         fontHeight <- 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         fontStruct.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         fontWidth <- 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         hasSelection <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         insertionPoint <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isSelecting <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: InitializeToExpression: (fontSpec copyName: \'6x13\' Size: 13 Style: \'\')\x7fVisibility: private'
        
         myFontSpec <- fontSpec copyName: '6x13' Size: 13 Style: ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         off <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2_textField = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui2_textField.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui2_textField' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'Comment: receiver mirror for do it, get it, etc.
-- Ungar, 12/26/94\x7fModuleInfo: Module: larsText InitialContents: InitializeToExpression: (lobby asMirror)\x7fVisibility: public'
        
         receiver <- lobby asMirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionEnd <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         shouldNextCtrlKAppend <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         slider.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: misc. commands\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptTextChanges: e = ( |
            | 
            editorMorph panel ifNil: [
              (message copy receiver: self Selector: 'get_it_cmd:' With: e ) forkForBirthEvent: e.
            ]
            IfNotNil: [|:p|
              p acceptButton simulateButtonPress: e.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         appendString: str = ( |
             first <- bootstrap stub -> 'globals' -> 'true' -> ().
             i.
             nl.
            | 
            nl: str asTextLines.
            i: contents lastKey.
            contents: contents copySize: i + nl numberOfLines.
            nl do: [ | :line |
                first ifTrue: [ contents at: i Put: (contents at: i), line.
                                first: false. ]
                       False: [ contents at: i Put: line ].
                i: i succ.
            ].
            gotoEnd.
            textHasChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         backspace = ( |
             col <- 0.
             line <- ''.
             lineno <- 0.
            | 
            hasSelection ifTrue: [ ^cut_cmd ].
            lineno: insertionPoint y.
            line: contents at: lineno.
            col: insertionPoint x.
            col = 0 ifTrue: [
              join_with_prev_line.
              scrollIntoView.
              changed.
            ] False: [
                contents at: lineno Put:
                ((line copyAtMost: col pred), (line copyFrom: col)).
                insertionPoint: insertionPoint - (1@0).
                drawLine: lineno.
                textHasChanged
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         backspaceCount: n = ( |
            | n do: [backspace]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: moving\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         backward_char = ( |
            | 
            goto: previousCharPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: moving\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         backward_word = ( |
            | 
            goto: previousWordPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         baseCopy = ( |
             new.
            | 
            new: resend.baseCopy.
            new setText: contentsString.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: aCanvas = ( |
             c.
            | 
            "Note: this method should clip and should only try to redraw
             the lines that are visible to minimize X calls"
             resend.baseDrawOn: aCanvas.
             aCanvas withClip: baseBounds Do: [| c |
               c: (aCanvas copyOffset: position).
               off upTo: off + linesToDraw Do: [| :i | drawLine1: i On: c ].
               hasSelection ifFalse: [drawCursorOn: c].
             ].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: moving\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         beginning_of_line = ( |
            | goto: 0@insertionPoint y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: misc. commands\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         cancelTextChanges: e = ( |
            | 
            editorMorph panel ifNotNil: [|:p|
               p cancelButton simulateButtonPress: e
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: slider operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         changeSliderValue = ( |
            | 

            slider ifNil: [
              linesInView <  contents size ifTrue: [ editorMorph addSlider   ]
            ] IfNotNil: [
              linesInView >= contents size ifTrue: [ editorMorph deleteSlider].
            ].

            slider ifNotNil: [| v |
                v:  (linesInView < contents size
                        ifTrue: [ off asFloat / (contents size - linesInView) ]
                         False: [ 0.0 ]) min: 1.0.
                slider myValue: 1.0 - v.
                slider changed.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         clear = ( |
            | setText: ''. gotoStart).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         clearSelection = ( |
            | 
            "Remove the current selection"
            hasSelection ifFalse: [^self].
            inSelection: [| :a. :b |
              hasSelection: false.
              drawLinesFrom: a y To: b y.
            ].
            c on.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         closingDelimiters = ')}]\'\"'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            resend.colorAll: newC.
            fontColor: newC textColorForBackground.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         columnsInView = ( |
            | extent x /- fontWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString = ( |
            | 
            contents reduceWith: [|:s1. :s2| s1, '\n', s2]
                IfSingleton: [|:s1| s1]
                IfEmpty: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString: s = ( |
            | setText: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         convertPointToScalar: p = ( |
             r <- 0.
            | 
            p y do: [|:i| r: r + (contents at: i) size].
            r + p x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         convertScalarToPoint: s = ( |
             ss.
            | 
            ss: s.
            contents do: [|:line. :i|
              line size >= ss  ifTrue: [
                ^ ss @ i
              ].
              ss: ss - line size.
              ss: ss pred. "for the new line"
            ].
            contents last size @ contents lastKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection commands\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         copy_cmd = ( |
            | 
            isInWorld && [hasSelection] ifTrue: [ ui2_textBuffer setContentsTo: textInSelection ForWorld: world].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         corner_offset = ( |
            | 1@1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         currentLine = ( |
            | contents at: insertionPoint y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         currentWord = ( |
            | currentLine copyFrom: currentWordStart UpTo: currentWordEnd).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         currentWordEnd = ( |
            | (insertionPoint x = currentLine size) || [(currentLine at: insertionPoint x) isWordSeparator]
            ifTrue: [insertionPoint x]
             False: [indexOfNextWordFrom: insertionPoint]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         currentWordStart = ( |
            | 
            indexOfPreviousWordFrom: insertionPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection commands\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         cut_cmd = ( |
            | copy_cmd. cut_cmd: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection commands\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         cut_cmd: silent = ( |
            | 
            hasSelection ifFalse: [^self].
            inSelection: [|:a. :b|
              deleteFrom: a To: b Silent: silent.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteForward = ( |
            | 
            hasSelection ifTrue: [ ^cut_cmd ].
            delete_next_char).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteFrom: startPoint To: endPoint Silent: silent = ( |
            | 
            insertionPoint: startPoint.
            hasSelection: false.
            startPoint y = endPoint y ifTrue: [| l |
              "selection on same line"
              l: contents at: startPoint y.
              contents at: startPoint y Put: 
                (l copyAtMost: startPoint x), 
                ( endPoint x < l size  ifTrue: [ l copyFrom: endPoint x ] False: '' ).
              silent ifFalse: [drawLinesFrom: startPoint y To: startPoint y].
              c on.
            ] False: [| line_no. diff |
              "multiple line to cut"
              contents at: startPoint y Put: 
                ((contents at: startPoint y) copyAtMost: startPoint x), 
                ((contents at:   endPoint y) copyFrom:     endPoint x).
              line_no: startPoint y succ.
              "delete lines [line_no..endPoint y]"
              diff: (endPoint y - line_no) succ.
              diff > 0 ifTrue: [
                 line_no upTo: contents size - diff Do: [|:i|
                   contents at: i Put: (contents at: i + diff)].
                contents: contents copySize: contents size - diff.
              ].
              silent ifFalse: [changed].
            ].
            textHasChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         delete_line = ( |
             col <- 0.
             line <- ''.
             lineno <- 0.
             whatWasKilled <- ''.
            | 
            isInWorld ifFalse: [^ self].
            clearSelection.
            lineno: insertionPoint y.
            line: contents at: lineno.
            col: insertionPoint x.
            (col = 0) && [lineno != contents lastKey ] ifTrue: [
              whatWasKilled: line.
              lineno upTo: contents size pred Do:[|:i|
                contents at: i Put: (contents at: i succ)].
              contents: contents copySize: (contents size pred).
              scrollIntoView.
              changed.
            ] False: [
              whatWasKilled:  line copyFrom:  col min: line size.
              contents at: lineno Put:  line copyAtMost: col.
              drawLine: lineno.
            ].

            shouldNextCtrlKAppend ifFalse: [ ui2_textBuffer setContentsTo: '' ForWorld: world].
            ui2_textBuffer contents:  (ui2_textBuffer contentsForWorld: world), whatWasKilled, '\n'.
            shouldNextCtrlKAppend: true.
            textHasChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         delete_next_char = ( |
            | 
            insertionPoint = nextCharPosition ifTrue: [^self "at end"].
            forward_char.
            backspace).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         delete_word_backwards = ( |
            | 
            deleteFrom: previousWordPosition To: insertionPoint Silent: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         drawCursorOn: c = ( |
            | 
            inView ifTrue: [| cursorX. cursorY |
                cursorX:  (insertionPoint x        *   fontWidth) 
                          + corner_offset x succ.
                cursorY: ((insertionPoint y - off) * line_height) + corner_offset y.
                c fillRectangle: (cursorX@cursorY) ## (1@line_height)
                          Color: modifiedCursorColor.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         drawLine1: line_no On: c = ( |
             hl_range.
             left_top.
            | 
            hl_range: (lineSelection: line_no).
            hl_range: (hl_range x * fontWidth)@
                      (hl_range y * fontWidth min: extent x).
            left_top: corner_offset + (1@(line_height * (line_no - off))).

            "draw the background"
            fill_rectangle: left_top ## 
                            (hl_range x @ line_height)  Inv: false On: c.
            fill_rectangle: (left_top addX: hl_range x) ##
                            (hl_range y @ line_height)  Inv: true  On: c.
            fill_rectangle: (left_top addX: hl_range y) ##
                            ((extent x - hl_range y) @ line_height)
                                                        Inv: false On: c.

            "draw the text"
            line_no < contents size ifTrue: [
                c text: (contents at: line_no)
                    At:    left_top + (1 @ fontHeight pred)
                    FontSpec:  fontSpec
                    Color: fontColor.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLine: i = ( |
            | 
            drawLinesFrom: i To: i.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLinesFrom: from To: to = ( |
            | 
            "For efficiency, this should report the box bounding the given lines."

            changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         dropEvent: evt OnSubmorphsAt: globalPt IfHandled: handledBlock = ( |
            | 
            "Don't pass any events to submorphs."

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         editorMorph = ( |
            | owner owner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         editorMorphOrNil = ( |
            | 
            owner ifNil: nil IfNotNil: [owner owner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: moving\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         end_of_line = ( |
            | goto: maxSmallInt@insertionPoint y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: extending selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_backward_char = ( |
            | 
            extend_selection_to: previousCharPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: extending selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_backward_word = ( |
            | 
            extend_selection_to: previousWordPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: extending selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_beginning_of_line = ( |
            | 
            extend_selection_to: 0@insertionPoint y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: extending selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_end_of_line = ( |
            | 
            extend_selection_to: maxSmallInt@insertionPoint y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: extending selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_forward_char = ( |
            | 
            extend_selection_to: nextCharPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: extending selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_forward_word = ( |
            | 
            extend_selection_to: nextWordPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: extending selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_next_line = ( |
            | 
            extend_selection_to: insertionPoint x@insertionPoint y succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: extending selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_previous_line = ( |
            | 
            extend_selection_to: insertionPoint x@insertionPoint y pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: extending selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         extend_selection_to: pt = ( |
             ipt.
            | 
            ipt: textGrid: pt.
            "avoid sending selectionHasChanged when it hasn't -- jb 4/03"
            (ipt = insertionPoint)  &&  [ipt = selectionEnd]
              ifTrue: [ hasSelection: false. ^ self ].

            hasSelection ifFalse: [selectionEnd: insertionPoint.
                                   hasSelection: true].

            moveInsertionPointTo: ipt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         extent = ( |
            | bounds size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         fill_rectangle: r Inv: inv On: c = ( |
             fillColor.
            | 
            0 = r width ifTrue: [ ^self ].

            fillColor: inv ifTrue: [modifiedSelectionColor] False: [backgroundColor].
            c fillRectangle: r Color: fillColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         flushLayoutCaches = ( |
            | 
            resend.flushLayoutCaches.
            fontStruct: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         fontSpec = ( |
            | myFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         fontSpec: fs = ( |
            | 
            myFontSpec: fs.
            fontStruct: nil.
            setFontStruct).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: moving\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         forward_char = ( |
            | goto: nextCharPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: moving\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         forward_word = ( |
            | goto: nextWordPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: moving\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         goto: pt = ( |
             ipt.
            | 
            ipt: textGrid: pt.
            "avoid sending selectionHasChanged when it hasn't -- jb 4/03"
            (ipt = insertionPoint)  &&  [(ipt = selectionEnd) || [selectionEnd = (0@0)]]
              ifTrue: [ ^ self ].

            clearSelection.

            moveInsertionPointTo: ipt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: moving\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         gotoEnd = ( |
            | goto: contents last size @ contents size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: moving\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         gotoStart = ( |
            | goto: 0@0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         gridToPt: p = ( |
            | ((p x * fontWidth) + 2) @ (((p y - off) * line_height) + 2)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         inSelection: blk = ( |
            | 
            hasSelection ifTrue: [
              insertionPoint y > selectionEnd y ifTrue: [
                ^blk value: selectionEnd With: insertionPoint ].
              (insertionPoint y = selectionEnd y) && [
                insertionPoint x > selectionEnd x ifTrue: [
                  ^blk value: selectionEnd With: insertionPoint ]].
              blk value: insertionPoint With: selectionEnd ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         inView = ( |
            | inView: insertionPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         inView: pt = ( |
             offset.
            | 
            offset: pt y - off.
            (offset >= 0) && [ ( offset < linesInView ) && [ pt x < columnsInView ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         indexOfNextWordFrom: p = ( |
             line.
             seenWordCharacter <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            line: contents at: p y.
            p x to: line size pred By: 1 Do: [|:i. c|
                c:  line at: i.
                c isWordSeparator ifFalse: [seenWordCharacter: true].
                seenWordCharacter && [c isWordSeparator] ifTrue: [^ i].
            ].
            line size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         indexOfPreviousWordFrom: p = ( |
             line.
             range.
             seenWordCharacter <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            line: contents at: p y.
            p x to: 1 By: -1 Do: [|:i. c|
                c:  line at: i pred.
                c isWordSeparator ifFalse: [seenWordCharacter: true].
                seenWordCharacter && [c isWordSeparator] ifTrue: [^ i].
            ].
            0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         initText = ( |
            | setText: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         insert_char: char = ( |
             col <- 0.
             line <- ''.
             lineno <- 0.
            | 
            hasSelection ifTrue: [ cut_cmd: true ].
            lineno: insertionPoint y.
            line: contents at: lineno.
            col: insertionPoint x.
            contents at: lineno Put:
              ((line copyAtMost: col), char,  (line copyFrom: col)).
            insertionPoint: insertionPoint + (1@0).
            drawLine: lineno.
            resetAutoCompleter.
            textHasChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: keyboard input\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         isPartOfWord: c = ( |
            | 
            c isLetter || [ c isDigit] || [ c = '_' ] || [ c = ':' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         join_with_prev_line = ( |
             col.
             line.
             lineno.
             nc.
             subStr.
            | 
            lineno: insertionPoint y.
            line: contents at: lineno.
            col: insertionPoint x.
            lineno > 0 ifTrue: [| inCol <- 0. predLine. | 
                predLine:  contents at: lineno pred.
                inCol: predLine size.


                lineno pred upTo: contents size pred Do:[|:i|
                    contents at: i Put: (contents at: i succ)].

                contents at: lineno pred Put: (predLine, line).

                contents: contents copySize: (contents size pred).
                insertionPoint: inCol@lineno pred.
                textHasChanged.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: keyboard input\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         keyDown: e = ( |
            | 
            ( amIATypingFocusFor: e sourceHand )  ifFalse: [ ^ dropThroughMarker ].

            "successive kills append, but kill then anything else doesn't"
            shouldNextCtrlKAppend  ifTrue: [
              shouldNextCtrlKAppend: (e keystrokes firstIfAbsent: '?') asByte = 11 "^k"
            ].

            e sendMessageToHandleKeyboardEventTo: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         lastPositionOfLine: n = ( |
            | (contents at: n) size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         layoutInPlace = ( |
            | 
            setFontStruct.
            resend.layoutInPlace.
            scrollIntoView).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         layoutInRect: r = ( |
            | 
            resend.layoutInRect: r.
            scrollIntoView).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         leftDoubleClick: evt = ( |
             line.
            | 
            isSelecting: false.
            hasSelection ifTrue: [^self].

            selectionHasChanged.

            line:  contents at: insertionPoint y.

            (tryClosingMatch: line)  ifTrue: [^self].

            (tryOpeningMatch: line)  ifTrue: [^self].

            "If at beginning or end, select all"
               (insertionPoint = (0@0))
            || [   (insertionPoint y = contents lastKey)
                && (insertionPoint x = contents last lastKey succ)] ifTrue: [
                     ^selectAll
            ].

            "If at beginning or end of line, select line"
               (insertionPoint x = 0)
            || [insertionPoint x = line lastKey succ] ifTrue: [
                     ^selectLine
            ].

            selectWord).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
             destination.
            | 
            (evt sourceHand capabilitySet includes: capabilities editText)
              ifFalse: [ ^ self].
            ( amIATypingFocusFor: evt sourceHand )   ifFalse: [
              beTypingFocusFor: evt sourceHand.
              hasSelection ifTrue: [^ self].
            ].
            isSelecting: true.
            evt sourceHand subscribeUntilAllUp: self.
            destination:   ptToGrid: evt cursorPoint - globalPosition.
            evt shiftIsDown
                  ifFalse: [               goto: destination]
                     True: [extend_selection_to: destination].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: evt = ( |
            | 
            isSelecting: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         lineSelection: lineno = ( |
            | 
            inSelection: [|:a. :b| 
              lineno < a y ifTrue: [^0@0].
              lineno = a y ifTrue: [
                ^lineno = b y ifTrue: a x@b x False: a x@maxSmallInt 
              ].
              lineno < b y ifTrue: [^0@maxSmallInt ].
              lineno = b y ifTrue: [^0@b x]
            ].
            0@0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         line_height = ( |
            | fontHeight succ succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         linesInView = ( |
            | extent y /- line_height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         linesToDraw = ( |
            | 
            ["changed for" quartz].
            ( extent y /+ line_height) asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: slider IsPresentDo: [|:n| slider: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'ui2_textField'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
            | isSelecting ifFalse: [^ self].
            extend_selection_to:  ptToGrid: evt cursorPoint - globalPosition.
            selectionHasChanged.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         moveInsertionPointTo: ipt = ( |
            | 
            insertionPoint: ipt.
            inView ifFalse: [ editorMorph resizeAfterKeystroke ] True: [ c adjust ].
            selectionHasChanged.
            changed.
            resetAutoCompleter.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fComment: If insertionPoint not at end of line,
  returns position of next character on that line,
otherwise if insertionPoint not on last line,
  returns position of first character of next line,
otherwise returns insertionPoint.\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         nextCharPosition = ( |
            | 
            insertionPoint x = (lastPositionOfLine: insertionPoint y) ifTrue: [
                insertionPoint y = contents lastKey
                    ifTrue: [ insertionPoint ]
                     False: [ 0 @ insertionPoint y succ ]
            ] False: [ insertionPoint x succ @ insertionPoint y ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         nextWordPosition = ( |
             line.
             startingPoint.
            | 
            insertionPoint = (contents last size @ contents lastKey) ifTrue: [^ insertionPoint].
            line: contents at: insertionPoint y.
            startingPoint:
              insertionPoint x = line size
                ifFalse: [insertionPoint]
                   True: [0 @ insertionPoint y succ].
            (indexOfNextWordFrom: startingPoint) @ startingPoint y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: moving\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         next_line = ( |
            | goto: insertionPoint x@insertionPoint y succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         open_line = ( |
             curr.
            | 
            curr: insertionPoint.
            split_line.
            goto: curr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         openingDelimiters = '({[\'\"'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection commands\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         paste_cmd = ( |
            | 
            hasSelection ifTrue: [ cut_cmd: true ].
            (ui2_textBuffer contentsForWorld: world) asString do: [|:c|
              (c = '\n') || [c = '\r'] ifTrue: [ split_line ] False: [ insert_char: c ]
            ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fComment: If insertionPoint not at beginning of line,
  returns position of previous character on that line,
otherwise if insertionPoint not on first line,
  returns position of last character of previous line,
otherwise returns insertionPoint.\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         previousCharPosition = ( |
            | 
            insertionPoint x > 0 ifFalse: [
              insertionPoint y > 0 ifFalse: [ insertionPoint ]
                True: [ (lastPositionOfLine: insertionPoint y pred) @
                  insertionPoint y pred ]
            ] True: [ insertionPoint - (1 @ 0) ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         previousWordPosition = ( |
             startingPoint.
            | 
            insertionPoint = (0 @ 0) ifTrue: [^ insertionPoint].
            startingPoint:
              insertionPoint x = 0
                ifFalse: [insertionPoint]
                   True: [(lastPositionOfLine: insertionPoint y pred) @ insertionPoint y pred].
            (indexOfPreviousWordFrom: startingPoint) @ startingPoint y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fCategory: moving\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         previous_line = ( |
            | goto: insertionPoint x@insertionPoint y pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: grid transformations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         ptToGrid: p = ( |
            | 
            ["floor added for " quartz].
            (((p x - 2) / fontWidth) @ (((p y - 2)/ line_height) + off)) floor asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         readFile: fileName = ( |
             file.
             lines.
            | 
            lines: list copyRemoveAll.
            file: os_file copy openForReading: fileName IfFail: [
              contents: 'Unable to open file: ', fileName.
              changed.
              ^self ].
            [ lines add: file readLine ] untilTrue: [ file atEOF ].
            file close.
            contents: lines asVector.
            changed.
            textHasChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         replaceCurrentWordWith: s = ( |
             start.
            | 
            start:  currentWordStart.
            contents at:  insertionPoint y
                    Put:  currentLine replaceFrom: start UpTo: currentWordEnd With: s.
            goto: (start + s size) @ insertionPoint y.
            textHasChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeToText = ( |
            | 
            editorMorph resizeToText).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         resizeToTextPolicy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui2_textField' -> 'resizeToTextPolicy' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui2_textField resizeToTextPolicy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> 'resizeToTextPolicy' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: InitializeToExpression: ((1000)@(30))\x7fVisibility: public'
        
         maxSizeInCharacters <- (1000)@(30).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> 'resizeToTextPolicy' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: InitializeToExpression: ((16)@(2))\x7fVisibility: public'
        
         minSizeInCharacters <- (16)@(2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> 'resizeToTextPolicy' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui2_textField' -> 'resizeToTextPolicy' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui2_textField resizeToTextPolicy parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> 'resizeToTextPolicy' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: larsText InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> 'resizeToTextPolicy' -> () From: ( | {
         'Comment: Show this much white space around text, up to the max.\x7fModuleInfo: Module: larsText InitialContents: InitializeToExpression: (2@0)\x7fVisibility: public'
        
         slackSizeInCharacters <- 2@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         rightMouseDown: evt = ( |
            | 
            mouseDown: evt IfNotForMe: [|:r| ^ r].
            resend.rightMouseDown: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection\x7fComment: Takes a scalar value from
0 to length of the string.
-- Ungar, 1/1/95\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         scalarSelectionStart: s End: e = ( |
            | 
            selectionStart: (convertScalarToPoint: s)
                       End:  convertScalarToPoint: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         scroll: value = ( |
             lineToScroll <- 0.
            | 
            "called when using the scrollbar, value in [0.0, 1.0]"
            lineToScroll: contents size - linesInView.
            lineToScroll > 0 ifTrue: [| new_off <- 0 |
              "compute first line to display"
              new_off: ((1.0 - value) * lineToScroll) asInteger.
              off = new_off ifFalse: [ off: new_off. changed ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         scrollIntoView = ( |
            | scrollIntoView: insertionPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         scrollIntoView: pt = ( |
             offset.
            | 
            case
             if: [ linesInView >= contents size     ] Then: [ off: 0 ]
             If: [ offset: pt y - off.  offset < 0  ] Then: [ off: off + offset max: 0 ]
             If: [ offset >= linesInView            ] Then: [ off: off + (offset - linesInView) succ
                                                                   min: contents size - linesInView ].
            changeSliderValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         seek_cmd = ( |
             searchString.
             startOffset <- 0.
             textToSearch.
            | 
            "find text in copy buffer from/in selection"
            searchString:  ui2_textBuffer contentsForWorld: world.
            searchString isEmpty ifTrue: [^ self].

            "If have goal selected, search for next one"
            textInSelection = searchString ifTrue: [
              inSelection: [|:s. :e| goto: e].
            ].

            "If no selection, search from insertion point"
            startOffset: convertPointToScalar: insertionPoint.
            textToSearch: contentsString copyFrom: startOffset.

            "If selection, search selection only"
            inSelection: [|:start. :end|
              startOffset: convertPointToScalar: start.
              textToSearch: textInSelection.
            ].

            "Do a simple, stupid search"
            textToSearch size do: [|:i|
              (searchString isPrefixOf: textToSearch copyFrom: i)
                ifTrue: [
                  scalarSelectionStart: startOffset + i
                                   End: startOffset + (i + searchString size  min:  textToSearch size).
                  ^ selectionHasChanged
              ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         selectAll = ( |
            | 
            selectionStart: 0@0
                       End: contents last lastKey succ@contents lastKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         selectLine = ( |
             line.
            | 
            line: contents at: insertionPoint y.
            selectionStart: 0@insertionPoint y
                       End: 
              (insertionPoint y < contents lastKey
                 ifTrue: [0@insertionPoint y succ]
                  False: [line lastKey succ@insertionPoint y])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         selectWord = ( |
             begin.
             end.
             line.
            | 
            line:  contents at: insertionPoint y.

            end: insertionPoint x.
            [(end < line size) && [isPartOfWord: line at: end]
            ] whileTrue: [ end: end succ ].

            begin: insertionPoint x.
            [ (begin > 0) && [isPartOfWord: line at: begin pred]
            ] whileTrue: [ begin: begin pred ].

            begin != end ifTrue: [
              selectionStart: begin@insertionPoint y
                         End:   end@insertionPoint y
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection\x7fComment: Return pixels in selected area.\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionArea = ( |
            | selectionAreaInCharacters * fontWidth * fontHeight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionAreaInCharacters = ( |
            | 
            inSelection: [|:a. :b|
              ^ ((b y - a y) * (baseBounds width / fontWidth))
              + (b x - a x)
            ].
            0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         selectionHasChanged = ( |
            | 
            isInWorld ifTrue: [ editorMorph selectionHasChanged ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionLines = ( |
            | inSelection: [|:a. :b| a y@b y]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionStart: start End: end = ( |
             p1.
             p2.
            | 
            p1: textGrid: start.
            p2: textGrid: end.
            preferences highlightParseError && [ p1 != p2 ] ifTrue: [
                   ( insertionPoint = p1 )
              && [ ( selectionEnd = p2 )
              && [ hasSelection ]] ifFalse:  [ "optimized updates"
                insertionPoint: p1.
                selectionEnd:   p2.
                hasSelection: true.
                changed.
              ].
              scrollIntoView: start.
            ] False: [ goto: start ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         setFontStruct = ( |
            | 
            fontStruct ifNotNil: [^ self].
            isInWorld  ifFalse:  [^ self].
            fontStruct: world anyOpenWindowCanvas structForFontSpec: fontSpec.
            fontHeight: fontStruct maxCharHeight.
            fontWidth: fontStruct textWidth: 'm'   "assume fixed-width font").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         setText: text = ( |
            | 
            contents: (textLines copyLines: text) lines asVector.
            textHasChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         sizeForResizeToText = ( |
            | 
            sizeForResizeToTextWithPolicy: resizeToTextPolicy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         sizeForResizeToTextWithPolicy: p = ( |
             innerMarginInPixels = (4)@(4).
             scrollBarWidthInPixels = 10.
             sizeInCharacters.
             sizeInPixels.
             x.
             y.
            | 
            "Assumes text field uses a mono-spaced font."

            sizeInCharacters:
             ( sizeOfContentsInCharacters + p slackSizeInCharacters
                 max:  p minSizeInCharacters
             )   min:  p maxSizeInCharacters.

            sizeInPixels: sizeInCharacters * (fontWidth @ line_height).

            sizeInPixels + innerMarginInPixels + (scrollBarWidthInPixels @ 0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         sizeOfContentsInCharacters = ( |
             heightInCharacters.
             widthInCharacters <- 0.
            | 

            contents do: [|:line| widthInCharacters: widthInCharacters max: line size].
            heightInCharacters: contents size.

            widthInCharacters @ heightInCharacters).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         split_line = ( |
             col.
             line.
             lineno.
             nc.
             subStr.
            | 
            nc: contents copySize: (contents size succ).
            lineno: insertionPoint y.
            line: contents at: lineno.
            col: insertionPoint x.
            contents size pred downTo: lineno Do: [|:i|
                nc at: i succ Put: nc at: i ].
            subStr:  (line copyFrom: col).
            nc at: lineno Put: (line copyAtMost: col).
            nc at: lineno succ Put: subStr.
            contents: nc.
            insertionPoint: 0@(insertionPoint y + 1).
            scrollIntoView.
            changed.
            textHasChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: grid transformations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         textGrid: pt = ( |
             col <- 0.
             line.
             lineno <- 0.
            | 
            0 = contents size ifTrue: [ ^0@0 ].
            lineno: pt y  max: 0.
            lineno >= contents size ifTrue: [ lineno: contents size pred ].
            line: contents at: lineno.
            col: pt x max: 0.
            col > line size ifTrue: [ col: line size ].
            col@lineno).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         textHasChanged = ( |
            | 
            isInWorld ifTrue: [ editorMorph textHasChanged ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         textInSelection = ( |
             str <- ''.
            | 
            inSelection: [| :a. :b |
              a y = b y ifTrue: [
                str: (contents at: a y).
                ^str copyFrom: a x UpTo: b x min: str size.
              ].
              str:
                (contents at: a y) size <= a x
                  ifTrue: ''
                  False: [ (contents at: a y) copyFrom: a x ].
              str: str, '\n'.
              a y succ upTo: b y Do: [|:i|
                str: str, (contents at: i), '\n' ].
              ^str, ((contents at: b y) copyAtMost: b x).
            ].
            '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         transpose_chars = ( |
             col.
             line.
            | 
            line:  contents at: insertionPoint y.
             col:  insertionPoint x.
            col > 1
              ifTrue: [| tmp |
                                         tmp: line at: col - 2.
                       line at: col - 2  Put: line at: col pred.
                       line at: col pred Put: tmp.
                       drawLine: insertionPoint y.
                       textHasChanged]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fComment: If after opening delimiter test for closing match.
Return true/false if matched/unmatched.\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         tryClosingMatch: line = ( |
             found <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            insertionPoint x > line firstKey ifTrue: [| ch. match |
              ch:  line at: 0 max: insertionPoint x pred.
              openingDelimiters
               findFirst: [|:c| c = ch]
               IfPresent: [|:c. :i|
                           match:  closingDelimiters at: i.
                           match = ch ifTrue: [ch: ''].
                           found: trySelect: match Match: ch Step: 1]
            ].
            found).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fComment: If before closing delimiter test for opening match.
Return true/false if matched/unmatched.\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         tryOpeningMatch: line = ( |
             found <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            insertionPoint x <= line lastKey ifTrue: [| ch. match |
              ch:  line at: insertionPoint x.
              closingDelimiters
               findFirst: [|:c| c = ch]
               IfPresent: [|:c. :i|
                           match:  openingDelimiters at: i.
                           match = ch ifTrue: [ch: ''].
                           found:  trySelect: match Match: ch Step: -1]
            ].
            found).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: private'
        
         trySelect: ch Match: m Step: step = ( |
             line.
             n.
             x.
             y.
            | 
            "step should be 1 or -1"
            x: insertionPoint x.
            y: insertionPoint y.
            line: contents at: y.
            n: 0.  "used to step over inner parens"
            [| px. py |
              px: x.  py: y.
              step = -1 ifTrue: [x: x pred].
              [step=1 ifTrue: [x <= line lastKey] False: [x >= line firstKey]] whileFalse: [
                y: y + step.
                py: y.
                (step=1 ifTrue: [y <= contents lastKey] False: [y >= contents firstKey]) ifFalse: [^false].
                line: contents at: y.
                x: step=1 ifTrue: [line firstKey] False: [px: line lastKey succ. line lastKey].
              ].
              (line at: x) = ch ifTrue: [
                n = 0 ifTrue: [ "found a match"
                  step=1 ifTrue: [
                    selectionStart: insertionPoint End: x@y
                  ] False: [
                    selectionStart: px@py End: insertionPoint
                  ].
                  ^true
                ].
                n: n pred.
              ].
              (line at: x) = m ifTrue: [n: n succ].
              step = 1 ifTrue: [x: x succ].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         wheelMovedInY: evt = ( |
            | 
            slider isNil || [amIATypingFocus not] ifTrue: [^ dropThroughMarker].
            slider wheelMovedBy: evt wheelDelta.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         words = ( |
            | 
            contents gather: [|:line| line asWords]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: reopening the world\x7fModuleInfo: Module: larsText InitialContents: FollowSlot\x7fVisibility: public'
        
         worldHasReopened = ( |
            | 
            "must get new font sizes
            and re-layout"
            layoutChanged).
        } | ) 



 '-- Side effects'

 globals modules larsText postFileIn
