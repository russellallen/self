 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot'
        
         selfParserTester = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfParserTester' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfParserTester' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfParserTester.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParserTester' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParserTester' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/selfParser'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParserTester' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParserTester' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParserTester' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParserTester' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: public'
        
         tester = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit tester copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser tester.

CopyDowns:
globals parseKit tester. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser tester parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> 'parent' -> () From: ( | {
         'Category: comments\x7fModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         commentPrefix = '\"'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> 'parent' -> () From: ( | {
         'Category: comments\x7fModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         commentSuffix = '\"'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> 'parent' -> () From: ( | {
         'Category: comments\x7fModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         commentify: cmtSrc = ( |
             r <- ''.
            | 
            cmtSrc do: [|:c|
              ('"\\' includes: c) ifTrue: [r: r, '\\'].
              r: r, c
            ].
            resend.commentify: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: public'
        
         nameSpace* = bootstrap stub -> 'globals' -> 'selfParser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'tester' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot'
        
         showFile: fileName = ( |
             o.
             tree.
            | 
            tree: fileSyntaxTester parse: fileName asFileContents IfFail: [|:e|
              ^  error: e reason
            ].
            o: parseNodeOuterOutliner copyNode: tree.
            process this birthEvent sourceHand attach: o.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> 'parent' -> () From: ( | {
         'Category: files\x7fModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         testDirectory = 'applications/selfParser'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> 'parent' -> () From: ( | {
         'Category: files\x7fModuleInfo: Module: selfParserTester InitialContents: FollowSlot'
        
         testFileSuffix = '.self'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         theParser = ( |
            | 
            error: 'use either fileSyntaxTester or stringSyntaxTester').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> 'parent' -> () From: ( | {
         'Category: comments\x7fModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         uncommentify: wholeComment = ( |
             foundBackSl <- bootstrap stub -> 'globals' -> 'false' -> ().
             r <- ''.
            | 
            (resend.uncommentify: wholeComment) do: [|:c|
              foundBackSl not && [c == '\\']
               ifTrue: [ foundBackSl: true ]
                False: [ foundBackSl: false.  r: r, c ]
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> () From: ( | {
         'Category: top-level testing\x7fModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: public'
        
         testAll = ( |
            | 
            nameSpace lexer    testTokens.
              fileSyntaxTester testAll.
            stringSyntaxTester testAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> () From: ( | {
         'Category: top-level testing\x7fModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: public'
        
         testifyAll = ( |
            | 
              fileSyntaxTester testifyAll.
            stringSyntaxTester testifyAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: public'
        
         fileSyntaxTester = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileSyntaxTester' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'testAll' From:
             bootstrap remove: 'testifyAll' From:
             globals selfParser tester copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileSyntaxTester' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser fileSyntaxTester.

CopyDowns:
globals selfParser tester. copy 
SlotsToOmit: parent testAll testifyAll.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileSyntaxTester' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileSyntaxTester' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser fileSyntaxTester parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileSyntaxTester' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileSyntaxTester' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: public'
        
         parseAllModules = ( |
            | 
            transporter moduleDictionary do: [|:m. :n|
              n printLine.
              parseModule: m.
            ].
            'done' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileSyntaxTester' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: public'
        
         parseModule: aModule = ( |
            | 
             parse: aModule fileName asFileContents
            IfFail: [|:e| error: e printString].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileSyntaxTester' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: public'
        
         tests = ( |
            | 
            (tests:  2 Named: 'acceptFileSyntax'),
            (tests:  4 Named: 'block'),
            (tests:  4 Named: 'comment'),
            (tests:  3 Named: 'dot'),
            (tests: 20 Named: 'expr'),
            (tests:  2 Named: 'fancy'),
            (tests: 28 Named: 'object'),
            (tests:  5 Named: 'return'),
            (tests: 12 Named: 'slotList'),
            ('emptyFileSyntax' & 'integer') asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileSyntaxTester' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         theParser = ( |
            | 
            fileParser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: public'
        
         stringSyntaxTester = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringSyntaxTester' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'testAll' From:
             bootstrap remove: 'testifyAll' From:
             globals selfParser tester copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringSyntaxTester' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser stringSyntaxTester.

CopyDowns:
globals selfParser tester. copy 
SlotsToOmit: parent testAll testifyAll.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringSyntaxTester' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringSyntaxTester' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser stringSyntaxTester parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringSyntaxTester' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'tester' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringSyntaxTester' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot'
        
         tests = ( |
            | 
            (tests: 2 Named: 'acceptStringSyntax'),
            vector copyAddLast: 'emptyStringSyntax').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringSyntaxTester' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfParserTester InitialContents: FollowSlot\x7fVisibility: private'
        
         theParser = ( |
            | 
            stringParser).
        } | ) 



 '-- Side effects'

 globals modules selfParserTester postFileIn
