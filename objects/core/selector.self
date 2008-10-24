 'Sun-$Revision: 30.12 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot'
        
         selector = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selector' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selector' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selector.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot'
        
         myComment <- 'Part of the prototype user interface.\"
            \"Objects that represent Self selectors.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.12 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         selector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selector' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selector.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         selector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'selector' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits selector.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'selector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: private'
        
         str <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'Comment: The characters allowed in binary send selectors.\x7fModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         binaryOperatorChars = '!@#$%^&*-+=\\~<,>/?|;'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         copyStr: s = ( |
            | resend.copy initStr: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'Category: perform\x7fComment: If this selector is not a call to one of the _Perform primitives,
evaluate the Else block. Otherwise, evaluate the block that
corresponds to the kind of _Perform this is (either _Perform:,
_PerformResend:, or _Perform:DelegatingTo:). -- Adam, 5/05\x7fModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         ifNormalPerform: nBlock IfResendPerform: uBlock IfDelegatedPerform: dBlock Else: eBlock = ( |
             argKwds.
             block.
             kwds.
            | 
            kwds: keywords asVector.
            kwds last = 'IfFail:' ifTrue: [kwds: kwds copyWithoutLast].
            kwds first = '_Perform:' ifTrue: [
              (kwds at: 1 IfAbsent: ['']) = 'DelegatingTo:'
                 ifTrue: [((kwds copyFrom: 2) allSatisfy: [|:k| k = 'With:']) ifTrue: [^ dBlock value]]
                  False: [((kwds copyFrom: 1) allSatisfy: [|:k| k = 'With:']) ifTrue: [^ nBlock value]].
            ] False: [
              kwds first = '_PerformResend:'
                 ifTrue: [((kwds copyFrom: 1) allSatisfy: [|:k| k = 'With:']) ifTrue: [^ uBlock value]].
            ].
            eBlock value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'Comment: Classify selector as unary, binary or keyword.
If the selector is illegal (e.g., \'ab:+::\'), the result is undefined.
Using this three-way branch can be more efficient than sequentially 
testing isUnary, isBinary, isKeyword.\x7fModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         ifUnary: unBlk Binary: binBlk Keyword: keyBlk = ( |
             ch.
            | 
            str isEmpty               ifTrue: [^  unBlk value].
            separator = str last      ifTrue: [^ keyBlk value].
            ch: str first.
            ch isLetter || ['_' = ch] ifTrue: [^ unBlk value].
            str = mirrors method topLevelExprName  ifTrue: [^ unBlk value].
            binBlk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: private'
        
         initStr: s = ( |
             m.
            | 
            m: reflect: s.
            str:
              m isReflecteeByteVector || [m isReflecteeString]
                 ifTrue: [s]  False: 'selectorWasNotAString').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         intersperse: args = ( |
             r <- ''.
            | 
            (numberOfArguments = args size) ifFalse:
               [^ str, ' intersperse: needs ', numberOfArguments printString, ' instead of: ', args size printString].
            keywords with: args Do: [ | :kw. :arg. | r: r, kw, ' ', arg, ' ' ].
            '' = r ifTrue: [ ^ str ] False: [ r: r copyWithoutLast ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'Category: perform\x7fModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         isAPerform = ( |
            | 
            ('_Perform' isPrefixOf: str) ifFalse: [^ false]. "optimization"

            ifNormalPerform:    true
            IfResendPerform:    true
            IfDelegatedPerform: true
            Else:               false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         isBinary = ( |
            | 
            ifUnary: false Binary: true Keyword: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         isKeyword = ( |
            | 
            ifUnary: false Binary: false Keyword: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         isUnary = ( |
            | 
            ifUnary: true Binary: false Keyword: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         keywords = ( |
             r <- bootstrap stub -> 'globals' -> 'list' -> ().
            | 
            r: list copyRemoveAll.
            keywordsDo: [|:keyw| r addLast: keyw].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordsDo: blk = ( |
             i <- 0.
             j <- 0.
             lim <- 0.
            | 
            lim: str size.
            [j < lim] whileTrue: [
                [(i < lim) && [separator != (str at: i)]] whileTrue: [
                    i: 1 + i.
                ].
                i < lim ifTrue: [i: 1 + i].
                blk value: (str copyFrom: j UpTo: i).
                j: i.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfArguments = ( |
            | 
            ifUnary: 0
             Binary: 1
            Keyword: [str occurrencesOf: separator]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selector' -> () From: ( | {
         'Comment: The character which designates keyword sends.\x7fModuleInfo: Module: selector InitialContents: FollowSlot\x7fVisibility: public'
        
         separator = ':'.
        } | ) 



 '-- Side effects'

 globals modules selector postFileIn
