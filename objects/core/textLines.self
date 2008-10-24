 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: textLines InitialContents: FollowSlot'
        
         textLines = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'textLines' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'textLines' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules textLines.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'textLines' -> () From: ( | {
         'ModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'textLines' -> () From: ( | {
         'ModuleInfo: Module: textLines InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'textLines' -> () From: ( | {
         'ModuleInfo: Module: textLines InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'textLines' -> () From: ( | {
         'ModuleInfo: Module: textLines InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            textLines lines add: ''.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'textLines' -> () From: ( | {
         'ModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'textLines' -> () From: ( | {
         'ModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: characters\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         textLines = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'textLines' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals textLines.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textLines' -> () From: ( | {
         'ModuleInfo: Module: textLines InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: public'
        
         lines <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         textLines = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits textLines.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textLines' -> () From: ( | {
         'ModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'textLines' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         asTextLines = ( |
            | textLines copyLines: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         = p = ( |
            | (numberOfLines = p numberOfLines) && [lines = p lines]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: coercing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         asCollector = ( |
             s.
            | 
            lines doFirst:    [| :l | s: '' & l ]
                  MiddleLast: [| :l | s: s  &  newline & l ]
                  IfEmpty:    [ s: collector copyFirst: '' ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: coercing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
             i <- 0.
             n <- 0.
             str <- ''.
            | 
            n: totalSize.
            str: ('' copySize: n).
            do: [|:line|
                line bytesDo: [|:b|
                    str at: i PutByte: b.
                    i: 1 + i.
                ].
                i != n ifTrue: [ "There is no newline after last line."
                    str at: i Put: newline.
                    i: 1 + i.
                ].
            ].
            str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: coercing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         asTextLines = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: private'
        
         convertToLines: str = ( |
             f <- 0.
             r.
            | 
            r: list copyRemoveAll.
            str do: [|:c. :i. |
              (newline = c) || [cr = c]  ifTrue: [
                r addLast: str copyFrom: f UpTo: i.
                f: i succ.
              ].
            ].
            r addLast: str copyFrom: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: copying\x7fComment: returns a copy of the textLines; does not clear out lines\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone lines: lines copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         copyLines: str = ( |
            | (clone lines: convertToLines: str) nullIfEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'ModuleInfo: Module: textLines InitialContents: FollowSlot'
        
         cr = '\x0d'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: modifying\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         detabify = ( |
            | lines mapBy: [ | :l | l detabified ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         do: block = ( |
            | lines do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         firstChar = ( |
            | firstLine first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         firstChar: c = ( |
            | firstLine first: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         firstLine = ( |
            | lines first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         firstLine: l = ( |
            | lines first: l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | lines size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: modifying\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         indent: n = ( | {
                 'ModuleInfo: Module: textLines InitialContents: FollowSlot'
                
                 pad = ' '.
                }  {
                 'ModuleInfo: Module: textLines InitialContents: FollowSlot'
                
                 padding <- ''.
                } 
            | 
            padding: mutableString copySize: n FillingWith: pad.
            lines mapBy: [ | :line |
                line isEmpty ifTrue: '' False: [padding, line] ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: private'
        
         isEmpty = ( |
            | lines isEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         lastChar: c = ( |
            | lastLine  last: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         lastLine = ( |
            | lines last).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         lastLine: l = ( |
            | lines last: l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: modifying\x7fComment: shrinkwraps left side only\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         leftShrinkwrap = ( |
             excess <- 536870911.
            | 
            lines isEmpty ifTrue: [^self].
            lines asVector do: [|:line. :i.|
                (shrinkLine: i) && [line isAllWhiteSpace not] ifTrue: [
                    excess: excess min: line leadingSpaces.
                 ].
            ].

            " 0 = excess ifTrue: [ ^ self ]. 
             cannot do this optimization, need to empty white lines -- dmu"

            savedExcess: excess.

            leftShrinkwrap: excess.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: modifying\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: private'
        
         leftShrinkwrap: excess = ( |
            | 
            lines: (
              lines asVector mapBy: [ | :line. :i |
                line isAllWhiteSpace ifTrue:  ''      False: [ 
                (shrinkLine: i)      ifFalse: [line]  True:  [
                     line copyFrom: excess.
                ]].
              ] 
            ) asList.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         lineSizeAt: ln = ( |
            | (lines at: ln) size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         mapBy: block = ( |
            | lines mapBy: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'ModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: private'
        
         newline = '
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: modifying\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: private'
        
         nullIfEmpty = ( |
            | isEmpty ifTrue: [ lines add: '' ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfLines = ( |
            | height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'ModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: printing\x7fComment: \'print\' prints the text (without any extra quotes);
	  \'printString\' returns the text with single quotes around it.
	   See the related comment in string.self.\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         print = ( |
            | asString print).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: modifying\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: private'
        
         savedExcess: e = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: modifying\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: private'
        
         shrinkLine: i = ( |
            | true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | asString printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            storeStringWorks ifFalse: [^ resend.storeStringIfFail: fb].
            (asMirror at: 'parent') contents = (textLines asMirror at: 'parent') contents
              ifFalse: [^ fb value: 'only works for copies of textLines'].
            asString canonicalize storeString, ' asTextLines').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | textLines).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringWorks = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: sizing\x7fComment: What the size of the corresponding string would be.\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         totalSize = ( |
             s <- 0.
            | 
            do: [|:line| s: 1 + s + line size].
            s - 1 max: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: modifying\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         truncateWithEllipsisAfterLine: n = ( | {
                 'ModuleInfo: Module: textLines InitialContents: FollowSlot'
                
                 ellipsis = '...'.
                } 
            | 
            n >= numberOfLines ifTrue: [ ^ self ].
            n - numberOfLines do: [ lines removeLast ].
            lastLine: lastLine, '...'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
             w <- 0.
            | 
            lines do: [|:line| w: (w max: line size)].
            w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: modifying\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         wrapLinesAt: n = ( |
             wLines.
            | 
            wLines: list copyRemoveAll.
            lines do: [ | :line. t. leftover. |
                t: line size / n.
                t do: [ | :i |
                    wLines addLast: line copyFrom: i * n UpTo: i succ * n ].
                leftover: line copyFrom: t * n UpTo: line size.
                leftover isEmpty ifFalse: [ wLines addLast: leftover ]. ].
            lines: wLines).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: modifying\x7fModuleInfo: Module: textLines InitialContents: FollowSlot\x7fVisibility: public'
        
         wrapLinesAtBlanksNear: n = ( |
             l.
             slop <- 10.
             wLines.
            | 
            wLines: list copyRemoveAll.
            l: lines asList.
            [ l isEmpty ] whileFalse: [ | line |
              line: l removeFirst.
              line size <= (n + slop half)  ifTrue: [ wLines addLast: line ]  False: [
                | splitAt |
                splitAt: [|:exit|
                  (line size pred min: n + (slop half)) 
                   downTo:  n - slop half
                   Do: [|:i|
                    (line at: i) isAllWhiteSpace ifTrue: [ exit value: i ]
                  ].
                  n
                 ] exitValue.
                 wLines addLast: line copySize: splitAt.
                 (line at: splitAt) = ' ' ifTrue: [ splitAt: splitAt succ. ].
                 l addFirst: line copyFrom: splitAt.
              ].
            ].
            lines: wLines).
        } | ) 



 '-- Side effects'

 globals modules textLines postFileIn
