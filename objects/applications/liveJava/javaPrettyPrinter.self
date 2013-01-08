 '$Revision: 1.2 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'argument' -> 'parent' -> () From: ( | {
         'Category: semantics\x7fModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         prettyPrintJavaParent: pn Prev: prev Next: next Result: r = ( |
            | 
            prettyPrintJavaSubnodes: r.
            commaIfPresent: [r addSpace] IfAbsent: [r]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'argumentList' -> 'parent' -> () From: ( | {
         'Category: semantics\x7fModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         prettyPrintJavaParent: pn Prev: prev Next: next Result: r = ( |
             justArgs.
            | 
            justArgs: parseKit parseNodes node copy addAllSubnodes: arguments.
            r addToken: openParen.
            case
             if: [arguments isEmpty] Then: []
             If: [(arguments size = 1) && [arguments first tokenCount = 1]] 
             Then: [justArgs prettyPrintJavaSubnodes: r]
             Else: [
              r addSpace.
              justArgs prettyPrintJavaSubnodes: r.
              r addSpace
            ].
            r addToken: closeParen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'block' -> 'parent' -> () From: ( | {
         'Category: semantics\x7fModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         prettyPrintJavaParent: pn Prev: prev Next: next Result: r = ( |
             swc.
            | 
            r addToken: openCurly.
            swc: subtreeWithoutCurlies.
            swc subnodeCount < 2  ifTrue: [
              r addSpaces: 2.
              swc prettyPrintJavaSubnodes: r.
              r addSpaces: 2
            ]
            False: [
              r indent.
              r newLine.
              swc prettyPrintJavaSubnodes: r.
              r outdent.
              r newLine.
            ].
            r addToken: closeCurly).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'expressionStatement' -> 'parent' -> () From: ( | {
         'Category: java semantics\x7fModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         prettyPrintJavaParent: pn Prev: prev Next: next Result: r = ( |
            | 
            prettyPrintJavaSubnodes: r.
            next isNil ifFalse: [r newLine].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'infixExpression' -> 'parent' -> () From: ( | {
         'Category: semantics\x7fModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         prettyPrintJavaParent: pn Prev: prev Next: next Result: r = ( |
            | 
            expression1 prettyPrintJavaSubnodes: r.
            r addSpace.
            r addToken: operator.
            r addSpace.
            expression2 prettyPrintJavaSubnodes: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'returnStatement' -> 'parent' -> () From: ( | {
         'Category: semantics\x7fModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         prettyPrintJavaParent: pn Prev: prev Next: next Result: r = ( |
            | 
            r addToken: return.
            expressionIfPresent: [|:e|
              r addSpaces: 2.
              e prettyPrintJavaParent: self Prev: return Next: semicolon Result: r
            ]
            IfAbsent: [].
            r addToken: semicolon).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrinter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfSlotToJavaConverter parent prettyPrinter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: InitializeToExpression: (0)'
        
         indentLevel <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfSlotToJavaConverter parent prettyPrinter parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         addSpace = ( |
            | r: r & ' ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         addSpaces: n = ( |
            | 
            r: r & ('' copySize: n FillingWith: ' ')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         addToken: n = ( |
            | r: r & n source).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         indent = ( |
            | indentLevel: indentLevel succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: private'
        
         indentSize = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         newLine = ( |
            | 
            r: r & '\n' & ('' copySize: indentLevel * indentSize FillingWith: ' ')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         outdent = ( |
            | indentLevel: indentLevel pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         resultString = ( |
            | r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> 'prettyPrinter' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: InitializeToExpression: (\'\')'
        
         r <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot'
        
         javaPrettyPrinter = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'javaPrettyPrinter' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'javaPrettyPrinter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules javaPrettyPrinter.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaPrettyPrinter' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/liveJava'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaPrettyPrinter' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaPrettyPrinter' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaPrettyPrinter' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaPrettyPrinter' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaPrettyPrinter' -> () From: ( | {
         'ModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'lexer' -> 'tokens' -> 'token' -> 'parent' -> () From: ( | {
         'Category: java semantics\x7fModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         prettyPrintJavaParent: pn Prev: prev Next: next Result: r = ( |
            | 
            r addToken: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: java semantics\x7fModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         prettyPrintJavaParent: pn Prev: prev Next: next Result: r = ( |
            | 
            prettyPrintJavaSubnodes: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: java semantics\x7fModuleInfo: Module: javaPrettyPrinter InitialContents: FollowSlot\x7fVisibility: public'
        
         prettyPrintJavaSubnodes: aPrettyPrinter = ( |
            | 
            doSubnodesWithContext: [
              |:n. :parent. :prev. :next. :pp |
               n prettyPrintJavaParent: parent Prev: prev Next: next Result: pp
            ] InitialResult: aPrettyPrinter).
        } | ) 



 '-- Side effects'

 globals modules javaPrettyPrinter postFileIn
