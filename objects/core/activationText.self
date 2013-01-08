 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: public'
        
         activationText = bootstrap define: bootstrap stub -> 'globals' -> 'activationText' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selectionText copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'activationText' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals activationText.

CopyDowns:
globals selectionText. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: InitializeToExpression: (mirrors methodActivation)\x7fVisibility: private'
        
         activation <- bootstrap stub -> 'globals' -> 'mirrors' -> 'methodActivation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: public'
        
         indentation <- 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: public'
        
         pad <- ' '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: public'
        
         activationText = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits activationText.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'activationText' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: public'
        
         pos <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: public'
        
         tabWidth <- 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: public'
        
         width <- 80.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         activationText = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'activationText' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'activationText' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules activationText.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         add: str = ( |
            | 
            lines isEmpty ifTrue: [ lines add: str ]
                           False: [ lines last: lines last, str].
            pos: pos + str size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         addLine = ( |
            | lines add: ''. pos: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         addWithSelection: string Line: lineNo = ( |
             offsetLineNo.
            | 
            offsetLineNo: lines size pred + lineNo.
            string do: [ | :c. :i |
              '\n' = c    ifTrue: [ addLine ] False: [ add: c ].
            ].
            selection start: 0 @ offsetLineNo.
            selection end:   (lines at: offsetLineNo) size @ offsetLineNo.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         addWithSelection: string Start: start End: end = ( | {
                 'ModuleInfo: Module: activationText InitialContents: FollowSlot'
                
                 line <- ''.
                }  {
                 'ModuleInfo: Module: activationText InitialContents: FollowSlot'
                
                 startLine <- 0.
                } 
            | 
            startLine: lines size.
            string do: [ | :c. :i |
                i      = start ifTrue: [ selection start: pos@(lines size- 1)].
                '\n'   = c     ifTrue: [ addLine ] False: [ add: c ].
                i succ = end   ifTrue: [ selection end:   pos@(lines size- 1)]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'Category: tokens\x7fModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         afterSelector = ( |
            | equal, pad, leftParen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'Category: tokens\x7fModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         arrow = '<-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'Category: tokens\x7fModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         bar = '|'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'Category: tokens\x7fModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         colon = ':'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForActivation: activation = ( |
            | 
            copyForActivation: activation Width: width).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForActivation: activation Width: width = ( | {
                 'ModuleInfo: Module: activationText InitialContents: FollowSlot'
                
                 new <- bootstrap stub -> 'globals' -> 'activationText' -> ().
                } 
            | 
            new: clone.
            new lines: new lines copyRemoveAll.
            new selection: new selection copy.
            new selection start: 0@0.
            new selection end:   0@0.
            new activation: activation.
            new width: width.
            new formatActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: public'
        
         do: blk AtSelectionStart: startBlk AtSelectionEnd: endBlk = ( | {
                 'ModuleInfo: Module: activationText InitialContents: FollowSlot'
                
                 lineNo <- 0.
                } 
            | 

             hasSelection ifTrue: [
                 lines do: [|:line|
                    line do:[| :c. :i |
                        (selection start y = lineNo)
                    && [ selection start x = i      ] ifTrue: [ startBlk value: c ].
                    blk value: c.
                        (selection end   y = lineNo)
                    && [ selection end   x = i succ ] ifTrue: [ endBlk   value: c ]].
                    lineNo = lines size ifFalse: [ blk value: '\n' ].
                    lineNo: lineNo succ.]
            ] False: [
             lines do: [|:line|
                line do:[| :c. :i | blk value: c].
                lineNo = lines size ifFalse: [ blk value: '\n' ].
                lineNo: lineNo succ.]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'Category: tokens\x7fModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         dot = '.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'Category: tokens\x7fModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         equal = '='.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         formatActivation = ( |
            | 
            formatReceiver. add: pad.
            formatSelector.
            formatSlots.
            formatSource.
            add: rightParen.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         formatArgument: slot = ( |
            | 
            slot key, ' ', (slot contents safeNameSize: 0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         formatArguments = ( | {
                 'ModuleInfo: Module: activationText InitialContents: FollowSlot'
                
                 values <- bootstrap stub -> 'globals' -> 'list' -> ().
                } 
            | 
            values: values copyRemoveAll.
            activation do: [|:slot|
                slot isArgument ifTrue: [ values add: formatArgument: slot]].
            values).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         formatReceiver = ( |
            | 
            add: activation receiver safeNameAndIDSize: 20).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         formatSelector = ( | {
                 'ModuleInfo: Module: activationText InitialContents: FollowSlot'
                
                 arguments <- bootstrap stub -> 'globals' -> 'list' -> ().
                }  {
                 'ModuleInfo: Module: activationText InitialContents: FollowSlot'
                
                 keywords <- bootstrap stub -> 'globals' -> 'list' -> ().
                } 
            | 
            (reflect: activation selector) isReflecteeString ifFalse: [
                ^add: activation selector printString, afterSelector].
            keywords:  activation selector asSelector keywords.
            arguments: formatArguments.
            arguments isEmpty
               ifTrue: [ add: activation selector, pad, afterSelector]
                False: [| selWidth <- 0 |
                   keywords  do: [|:str| selWidth: selWidth + str size].
                   arguments do: [|:str| selWidth: selWidth + str size].
                   selWidth: selWidth + (keywords size * 2 * pad size) +
                             afterSelector size.
                   restOnLine >= selWidth ifTrue: [
                         keywords with: arguments Do: [ | :keyword. :argument |
                             add: keyword, pad, argument, pad ].
                          add: afterSelector
                       ] False: [| keyW <- 0. isFirst <- true |
                         "Align colons of keywords vertical"
                         keywords doFirst: [| :keyword |
                             keyW:  keyW max: keyword size + pos
                         ] MiddleLast: [| :keyword |
                             keyW:  keyW max: keyword size
                         ] IfEmpty: [].
                         keywords with: arguments Do: [| :keyword. :argument |
                             isFirst ifTrue: [ isFirst: false ]
                                      False: [ addLine ].
                             add: (keyword padOnLeft: (keyW - pos)),pad,argument].
                             add: pad, afterSelector]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         formatSlot: slot = ( |
            | 
            slot key, pad,
            (slot isAssignable ifTrue: arrow False: equal), pad,
            (slot contents safeNameSize: 0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         formatSlots = ( | {
                 'ModuleInfo: Module: activationText InitialContents: FollowSlot'
                
                 slots <- bootstrap stub -> 'globals' -> 'list' -> ().
                } 
            | 
            slots: slots copyRemoveAll.
            activation do: [|:slot|
                   slot isArgument not
                 && [ slot value isReflecteeAssignment not ]
                 ifTrue: [ slots add: formatSlot: slot]].
            slots isEmpty ifFalse: [
                | isLineBroken <- false. localIndent <- 0. slotsWidth <- 0 |
                slots do: [|:str|  slotsWidth: slotsWidth + str size ].
                slotsWidth: slotsWidth + 
                            ((slots size) * ( pad size + dot size )) +
                            bar size double + pad size.
                restOnLine > slotsWidth ifFalse: [
                    addLine. add: '' padOnLeft: indentation ].
                add: bar, pad.
                localIndent: pos.
                slots do:[| :str |
                   restOnLine > str size
                       ifTrue: [ add: str,dot,pad ]
                        False: [ addLine. add: '' padOnLeft: localIndent.
                                 add: str,dot,pad. isLineBroken: true]].
                add: bar.
                isLineBroken ifTrue: [ addLine ] False: [ add: pad ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         formatSource = ( |
             csp.
             mt.
            | 

            mt: selfMethodTextWithPositionConversion copyForMethod: activation.
            mt height > 1  ifTrue: [  mt indentation: indentation.  mt asCode].

            mt isDisassembled  ifTrue: [ | p. lineNo |
              p: activation position.
              lineNo: mt convertBCIToLine: p.
              addWithSelection: mt asString Line: lineNo.
            ] 
            False: [ | csp |
              csp: mt convertPosition: activation sourcePosition
                        FormatBlock: [|:t|
                          t height > 1  ifTrue: [ t indentation: indentation. t asCode].
              ].
              addWithSelection: mt asString  Start: csp x  End: csp y.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: public'
        
         hasSelection = ( |
            | selection start != selection end).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         indentPosition: string = ( | {
                 'ModuleInfo: Module: activationText InitialContents: FollowSlot'
                
                 whiteSpace = ' '.
                } 
            | 
            string findFirst: [ | :v | (whiteSpace includes: v) not ]
                          IfPresent: [ | :v. :i. | i ]
                           IfAbsent: [ string size ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'Category: tokens\x7fModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         leftParen = '('.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'Category: tokens\x7fModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         pad = ' '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'selectionText' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         positionTableFor: source IfFail: fb = ( |
            | 
             source parseObjectIntoPositionTableIfFail: [|:e|
                ('badTypeError' isPrefixOf: e) ifTrue: [
                    ^ error: e. "a real error"
                ].
                "If The parser fails to parse the string, assume
                 the source is VM-generated, e.g. an error method"
                ^ fb value.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'ModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         restOnLine = ( |
            | width - pos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'Category: tokens\x7fModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         rightParen = ')'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'Comment: This method should probably be modified to disassble when
needed, but since it is not used, and is uncommented,
it is not clear what it should do. -- dmu 10/12/96\x7fModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         sourceText = ( |
             lines.
            | 
            lines: selfMethodText copyForMethod: activation.
            lines height <= 1 ifTrue: [^ activation source ].
            (
                lines indentation: indentation
            ) asCode asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'Category: printing\x7fComment: no asActivationText\x7fModuleInfo: Module: activationText InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringWorks = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activationText' -> () From: ( | {
         'Category: tokens\x7fModuleInfo: Module: activationText InitialContents: FollowSlot'
        
         tilde = '~'.
        } | ) 



 '-- Side effects'

 globals modules activationText postFileIn
