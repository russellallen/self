 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         case = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'case' -> () From: ( |
             {} = 'Comment: This object is used to implement multi-way
branches, aka case statements.  See the `case
statements\' and `testing\' categories for examples.\x7fModuleInfo: Creator: globals case.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: other case construction\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: private'
        
         argumentsFor: n WithElse: elseFlag = ( |
             r.
            | 
            r: '| '. 
            n do: [|:i|
                r: r & (':t', i printString, '. :b', i printString, '. ').
            ].
            elseFlag ifTrue: [r: r & ':default '].
            r: r & '|'.
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: other case construction\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: private'
        
         bodyLine: n = ( | {
                 'ModuleInfo: Module: caseStatement InitialContents: FollowSlot'
                
                 nString.
                } 
            | 
            nString: n printString.
            '\n       t', nString, ' value ifTrue: [ ^b', nString, ' value ].').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: other case construction\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: private'
        
         buildCase: condCount WithElse: elseFlag = ( |
             s <- ''.
            | 
            condCount < 1 ifTrue: [
                error: 'cannot build case for less than one condition'.
            ].
            s: (selectorFor: condCount WithElse: elseFlag) & ' = ( ' &
               (argumentsFor: condCount WithElse: elseFlag).
            condCount do: [| :i | s: s & (bodyLine: i) ].
            elseFlag
                ifTrue: [ s: s & '\n       default value).' ]
                 False: [ s: s & '\n       nil).'           ].
            s: s & '\n'.
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: other case construction\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         constructCasesFor: n = ( |
            | constructCasesFrom: n UpTo: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: other case construction\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         constructCasesFrom: m UpTo: n = ( |
            | 
            "Add slots to my otherCases parent. These slots implement
             'if:Then:If:Then:...' and 'if:Then:If:Then:...Else:'
             protocol for m up to n cases."
            m to: n Do: [| :i |
                (hasCasesFor: i) ifFalse: [| str <- ''. mir |
                    str: ('( | ' & (buildCase: i WithElse: false) & (buildCase: i WithElse: true) & '| )') flatString.
                    mir: (reflect: str eval).
                    mir do: [|:s| s category: 'caseStatements'.  s module: '<generated>'].
                    (reflect: otherCases) addSlots: mir.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: other case construction\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         constructCasesUpTo: n = ( |
            | 
            constructCasesFrom: 1 UpTo: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: other case construction\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         hasCasesFor: n = ( |
            | 
            (reflect: otherCases) includesKey: (selectorFor: n WithElse: false)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: case statements\x7fComment: Additional cases are dynamically generated and added to
     the otherCases parent of this object when this module is read in.\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         if: t0 Then: b0 = ( |
            | 
            t0 value ifTrue: [ ^b0 value ].
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: case statements\x7fComment: Additional cases are dynamically generated and added to
     the otherCases parent of this object when this module is read in.\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         if: t0 Then: b0 Else: default = ( |
            | 
            t0 value ifTrue: [ ^b0 value ].
            default value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: case statements\x7fComment: Additional cases are dynamically generated and added to
     the otherCases parent of this object when this module is read in.\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         if: t0 Then: b0 If: t1 Then: b1 = ( |
            | 
            t0 value ifTrue: [ ^b0 value ].
            t1 value ifTrue: [ ^b1 value ].
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: case statements\x7fComment: Additional cases are dynamically generated and added to
     the otherCases parent of this object when this module is read in.\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         if: t0 Then: b0 If: t1 Then: b1 Else: default = ( |
            | 
            t0 value ifTrue: [ ^b0 value ].
            t1 value ifTrue: [ ^b1 value ].
            default value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: case statements\x7fComment: Additional cases are dynamically generated and added to
     the otherCases parent of this object when this module is read in.\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         if: t0 Then: b0 If: t1 Then: b1 If: t2 Then: b2 = ( |
            | 
            t0 value ifTrue: [ ^b0 value ].
            t1 value ifTrue: [ ^b1 value ].
            t2 value ifTrue: [ ^b2 value ].
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: case statements\x7fComment: Additional cases are dynamically generated and added to
     the otherCases parent of this object when this module is read in.\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         if: t0 Then: b0 If: t1 Then: b1 If: t2 Then: b2 Else: default = ( |
            | 
            t0 value ifTrue: [ ^b0 value ].
            t1 value ifTrue: [ ^b1 value ].
            t2 value ifTrue: [ ^b2 value ].
            default value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: case statements\x7fComment: Additional cases are dynamically generated and added to
     the otherCases parent of this object when this module is read in.\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         if: t0 Then: b0 If: t1 Then: b1 If: t2 Then: b2 If: t3 Then: b3 = ( |
            | 
            t0 value ifTrue: [ ^b0 value ].
            t1 value ifTrue: [ ^b1 value ].
            t2 value ifTrue: [ ^b2 value ].
            t3 value ifTrue: [ ^b3 value ].
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: case statements\x7fComment: Additional cases are dynamically generated and added to
     the otherCases parent of this object when this module is read in.\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         if: t0 Then: b0 If: t1 Then: b1 If: t2 Then: b2 If: t3 Then: b3 Else: default = ( |
            | 
            t0 value ifTrue: [ ^b0 value ].
            t1 value ifTrue: [ ^b1 value ].
            t2 value ifTrue: [ ^b2 value ].
            t3 value ifTrue: [ ^b3 value ].
            default value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'ModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         otherCases* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'case' -> 'otherCases' -> () From: ( |
             {} = 'Comment: This object contains case methods generated by
the case object. Although needed at file-in time
to run initialization code in susequent modules, they cannot be
generated at file-in time because the mirror code is not all there yet.
So, we bootstrap by generated the cases in a working snapshot,
filing them out, and using that file at file-in time.
-- dmu & ole a\x7fModuleInfo: Creator: globals case otherCases.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'ModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: private'
        
         reportImplError = ( |
            | 
            error: 'case statement implementation error').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: other case construction\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: private'
        
         selectorFor: i WithElse: elseFlag = ( |
             sel <- ''.
            | 
            sel: sel & 'if:Then:'.
            i - 1 do: [sel: sel & 'If:Then:'].
            elseFlag ifTrue: [sel: sel & 'Else:'].
            sel flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | 
            (test1: 0) = 0   ifFalse: [ reportImplError ].
            (test1: 1) = 1   ifFalse: [ reportImplError ].
            (test1: 2) = 4   ifFalse: [ reportImplError ].
            (test1: 3) = 7   ifFalse: [ reportImplError ].

            (test2: 0) = 0   ifFalse: [ reportImplError ].
            (test2: 1) = 1   ifFalse: [ reportImplError ].
            (test2: 2) = 4   ifFalse: [ reportImplError ].
            (test2: 3)      ifNotNil: [ reportImplError ].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: private'
        
         test1: n = ( | {
                 'ModuleInfo: Module: caseStatement InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            "Test case statement with an else clause."
            case if: [ n = 0 ] Then: 0
                 If: [ n = 1 ] Then: 1
                 If: [ n = 2 ] Then: [ n * n ]
                 If: [ n < 0 ] Then: [ error: 'n is less than zero' ]
                 Else: 7).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'case' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: private'
        
         test2: n = ( |
            | 
            "Test case statement without an else clause."
            case if: [ n = 0 ] Then: 0
                 If: [ n = 1 ] Then: 1
                 If: [ n = 2 ] Then: [ n * n ]
                 If: [ n < 0 ] Then: [ error: 'n is less than zero' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: caseStatement InitialContents: FollowSlot'
        
         caseStatement = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'caseStatement' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'caseStatement' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules caseStatement.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'caseStatement' -> () From: ( | {
         'ModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'caseStatement' -> () From: ( | {
         'ModuleInfo: Module: caseStatement InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'caseStatement' -> () From: ( | {
         'ModuleInfo: Module: caseStatement InitialContents: FollowSlot'
        
         myComment <- 'Provides simple case statement support.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'caseStatement' -> () From: ( | {
         'ModuleInfo: Module: caseStatement InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            0 case constructCasesUpTo: 30.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'caseStatement' -> () From: ( | {
         'ModuleInfo: Module: caseStatement InitialContents: InitializeToExpression: (\'Sun-$Revision: 30.9 $\')\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'caseStatement' -> () From: ( | {
         'ModuleInfo: Module: caseStatement InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'generatedCases
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'generatedCases' From: 'core'



 '-- Side effects'

 globals modules caseStatement postFileIn
