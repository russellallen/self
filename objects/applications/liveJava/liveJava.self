 '$Revision: 1.2 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: liveJava InitialContents: FollowSlot\x7fVisibility: public'
        
         liveJava = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( |
             {} = 'Comment: This is an unfinished project that I (David Ungar) worked on
in the Fall of 2005.
The goal was to translate Self into Java and vice-versa, so that we could
demo \"live Java.\"

Here is what is not done:
- translating Java back to Self
- preserving comments
- perfecting the javaPrecedence slots and the pretty printer
- turning ifTrue:False: into :?
- adding value sends to nonblock arguments to ifTrue:...
  (see senders of todo).

This object contains some utilities:
javaASTFor:
selfASTFor:

Also, to test things try:
- selfParser tester testAll
- javaParser tester testAll

and finally

use the background menu item to get a \"Self to Java tester\"
and middle-button on it to \"Test all\".

-- November 30, 2005, David Ungar\x7fModuleInfo: Creator: globals liveJava.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'Category: tools\x7fCategory: testing\x7fCategory: new stuff\x7fModuleInfo: Module: liveJava InitialContents: InitializeToExpression: (nil)'
        
         all.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'Category: tools\x7fCategory: making ASTs\x7fModuleInfo: Module: liveJava InitialContents: FollowSlot\x7fVisibility: public'
        
         javaAST = ( |
            | 
            javaASTFor: '{ Object a; return a_b(c); }').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'Category: tools\x7fCategory: making ASTs\x7fModuleInfo: Module: liveJava InitialContents: FollowSlot\x7fVisibility: public'
        
         javaASTFor: s = ( |
            | 
            javaParser blockParser copyParseSource: s IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'ModuleInfo: Module: liveJava InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'Category: tools\x7fCategory: making ASTs\x7fModuleInfo: Module: liveJava InitialContents: FollowSlot\x7fVisibility: public'
        
         selfAST = ( |
            | selfASTFor: '( (3 + 4) * 5 )').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'Category: tools\x7fCategory: making ASTs\x7fModuleInfo: Module: liveJava InitialContents: FollowSlot\x7fVisibility: public'
        
         selfASTFor: s = ( |
            | 
            selfParser objectOrMethodParser copyParseSource: s IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: liveJava InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'Category: tools\x7fCategory: testing\x7fModuleInfo: Module: liveJava InitialContents: InitializeToExpression: (0)'
        
         testCount <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'Category: tools\x7fCategory: testing\x7fCategory: new stuff\x7fModuleInfo: Module: liveJava InitialContents: FollowSlot'
        
         testLJ1 = ( |
            | 
            testCount: 0.
            all do: [|:m|
              m do: [|:s|
               liveJava selfSlotToJavaConverter copyAndConvert: s.
               testCount: testCount succ
            ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'Category: tools\x7fCategory: testing\x7fModuleInfo: Module: liveJava InitialContents: FollowSlot\x7fVisibility: public'
        
         testParsers = ( |
            | 
            selfParser parserTester testAll.
            javaParser parserTester testAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'Category: tools\x7fCategory: testing\x7fCategory: new stuff\x7fModuleInfo: Module: liveJava InitialContents: FollowSlot'
        
         tryLJ1 = ( |
            | 
            liveJava selfSlotToJavaConverter copyAndConvert: (|a = (17)|) _Mirror first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: liveJava InitialContents: FollowSlot'
        
         liveJava = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'liveJava' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'liveJava' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules liveJava.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJava' -> () From: ( | {
         'ModuleInfo: Module: liveJava InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/liveJava'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJava' -> () From: ( | {
         'ModuleInfo: Module: liveJava InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJava' -> () From: ( | {
         'ModuleInfo: Module: liveJava InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJava' -> () From: ( | {
         'ModuleInfo: Module: liveJava InitialContents: FollowSlot'
        
         postFileIn = ( |
             o.
            | 
            resend.postFileIn.
            desktop isOpen ifFalse: [^ self].
            o: desktop w outlinerForMirror: reflect: liveJava.
            desktop add: o.
            desktop w moveToFront: o.
            o addCommentEditor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJava' -> () From: ( | {
         'ModuleInfo: Module: liveJava InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJava' -> () From: ( | {
         'ModuleInfo: Module: liveJava InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'parseKit
selfParser
javaParser
liveJavaMiniparsers
javaToSelf
selfToJava
liveJavaParseKit
liveJavaMorphs
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'parseKit' From: 'applications/parseKit'
 bootstrap read: 'selfParser' From: 'applications/selfParser'
 bootstrap read: 'javaParser' From: 'applications/klein/javaParser'
 bootstrap read: 'liveJavaMiniparsers' From: 'applications/liveJava'
 bootstrap read: 'javaToSelf' From: 'applications/liveJava'
 bootstrap read: 'selfToJava' From: 'applications/liveJava'
 bootstrap read: 'liveJavaParseKit' From: 'applications/liveJava'
 bootstrap read: 'liveJavaMorphs' From: 'applications/liveJava'



 '-- Side effects'

 globals modules liveJava postFileIn
