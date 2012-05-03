 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         debugTests = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'debugTests' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'debugTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules debugTests.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debugTests' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debugTests' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debugTests' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         myComment <- 'tests the debugging functionality\"

               \"This would normally go into traits and globals, but I don\'t want
                to clutter them with testing stuff'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debugTests' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debugTests' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: debugging and debugging info\x7fModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         debugging = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests debugging.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         experimentProto = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests debugging experimentProto.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         args.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests debugging experimentProto parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         checkDead: act = ( |
            | 
            act isLive ifTrue: [ error: 'activation is live' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         checkLive: act = ( |
            | 
            act isLive ifFalse: [ error: 'activation is dead' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         continue = ( |
            | sema signal. times delay: 1000).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         copySelector: sel Arguments: args Surviving: surv = ( | {
                 'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
                
                 e.
                } 
            | 
            e: clone.
            e sema: semaphore copyBinary.
            e rcvr: tests debugging.
            e sel: sel.
            e args: vector copySize: args size + 1.
            e args fillFrom: args.
            e args at: args size Put: e sema.
            e surviving: surv.
            e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         getStack = ( |
            | 
            stkDepth: proc stackDepth.
            stk: vector copySize: stkDepth.
            stkDepth > 0 ifTrue: [
                stk at: 0 Put: (proc at: 0).
                1 upTo: stkDepth Do: [| :i. new |
                    new: proc at: i.
                    stk at: i Put: new.
                    checkLive: new.
                    ((stk at: i-1) sender = new) ifFalse: [ error: 'sender' ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         init = ( |
            | 
            proc: process copySend: message copy receiver: rcvr
                                                 Selector: sel
                                                Arguments: args.
            sema: semaphore copyBinary wait).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         printStack = ( |
            | 
            stk do: [| :act. :i |
                ('#', i printString, ': ') print.
                act isLive ifTrue: [
                    act selector print.
                    (' @ ', act position printString) printLine. 
                ] False: [
                    '<dead activation mirror>' printLine. ]. ]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         start = ( |
            | 
            init.
            proc resume.
            times delay: 1000.
            getStack).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         test1 = ( |
            | 
            getStack. printStack.
            continue.
            stkDepth - surviving do: [| :i | checkDead: (stk at: i) ].
            stkDepth - surviving upTo: stkDepth Do: [| :i |
                checkLive: (stk at: i) ].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         proc.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         rcvr.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         sel.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         sema.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         stk.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         stkDepth.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         surviving.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         experimentTraits = bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         experiments* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experiments' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests debugging experiments.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experiments' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         debuggee: s = ( | {
                 'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
                
                 constant = 1.
                }  {
                 'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
                
                 local.
                } 
            | 
            local: 'local'.
            [ (s wait) ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experiments' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         myFactorial: n With: s = ( |
            | 
            n = 0 ifTrue: [ [ s wait ] loop ]
                  False:  [ myFactorial: n-1 With: s ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: debugging and debugging info\x7fModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         e1 <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'e1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests e1.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e1' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: InitializeToExpression: (vector copyAddLast: semaphore copyCount: 0 Capacity: 1)'
        
         args <- vector copyAddLast: semaphore copyCount: 0 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e1' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e1' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         proc.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e1' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         rcvr <- bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e1' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         sel <- 'debuggee:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e1' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: InitializeToExpression: (semaphore copyCount: 0 Capacity: 1)'
        
         sema <- semaphore copyCount: 0 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e1' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         stk.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e1' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         stkDepth.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e1' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         surviving <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: debugging and debugging info\x7fModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         e2 <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'e2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests e2.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e2' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: InitializeToExpression: ((vector copyAddLast: 3) copyAddLast: semaphore copyCount: 0 Capacity: 1)'
        
         args <- (vector copyAddLast: 3) copyAddLast: semaphore copyCount: 0 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e2' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> 'experimentProto' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e2' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         proc.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e2' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         rcvr <- bootstrap stub -> 'globals' -> 'tests' -> 'debugging' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e2' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         sel <- 'myFactorial:With:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e2' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: InitializeToExpression: (semaphore copyCount: 0 Capacity: 1)'
        
         sema <- semaphore copyCount: 0 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e2' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         stk.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e2' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         stkDepth.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'e2' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         surviving <- 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: debugging and debugging info\x7fModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         killTwiceTestObj = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'killTwiceTestObj' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests killTwiceTestObj.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'killTwiceTestObj' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         a = ( |
            | b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'killTwiceTestObj' -> () From: ( | {
         'ModuleInfo: Module: debugTests InitialContents: FollowSlot'
        
         b = ( |
            | c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: debugging and debugging info\x7fModuleInfo: Module: debugTests InitialContents: FollowSlot\x7fVisibility: public'
        
         positionTableTest = ( |
            | 
            "Test the primitive _ParseObjectIntoPositionTable"

            "tokens"
            [| body_str = '-1. 23.456. \'string\'. []. (). (7890). self. _Prim' |
               compare: body_str At: 0 With: '-1'.        "integer"
               compare: body_str At: 1 With: '.'.         "pop"
               compare: body_str At: 2 With: '23.456'.    "float"       
               compare: body_str At: 3 With: '.'.         "pop"
               compare: body_str At: 4 With: '\'string\''."string"
               compare: body_str At: 5 With: '.'.         "pop"
               compare: body_str At: 6 With: '[]'.        "block"
               compare: body_str At: 7 With: '.'.         "pop"
               compare: body_str At: 8 With: '()'.        "object"
               compare: body_str At: 9 With: '.'.         "pop"
               compare: body_str At: 10 With: '7890'.     "sub-expression"
               compare: body_str At: 11 With: '.'.        "pop"
               compare: body_str At: 12 With: 'self'.     "self"
               compare: body_str At: 13 With: '.'.        "pop"
               compare: body_str At: 14 With: '_Prim'.    "primitive"
               compare: body_str Size: 15
            ] value.

            "unary sends"
            [| body_str = 'unary unary. 1234 unary. resend.unary. parent.unary' |
               compare: body_str At: 0 With: 'unary'.         "self"
               compare: body_str At: 1 With: 'unary unary'.   "repeated sends"
               compare: body_str At: 2 With: '.'. 
               compare: body_str At: 3 With: '1234'.
               compare: body_str At: 4 With: '1234 unary'.    "delegate"
               compare: body_str At: 5 With: '.'. 
               compare: body_str At: 6 With: 'resend.unary'.  "undirected resend"
               compare: body_str At: 7 With: 'resend.unary'.  "implicit self send"
               compare: body_str At: 8 With: '.'. 
               compare: body_str At: 9 With: 'parent.unary'.  "delegatee"
               compare: body_str At: 10 With: 'parent.unary'. "implicit self send"
               compare: body_str Size: 11
            ] value.

            "binary sends"
            [| body_str = '- 1234 - 5678. 9012 + 3456. resend.+ 7890. parent.+ 38' |
               compare: body_str At: 0 With: '1234'.
               compare: body_str At: 1 With: '- 1234'.        "arg count"
               compare: body_str At: 2 With: '- 1234'.        "self"
               compare: body_str At: 3 With: '5678'.
               compare: body_str At: 4 With: '- 1234 - 5678'. "arg count"
               compare: body_str At: 5 With: '- 1234 - 5678'. "repeated sends"
               compare: body_str At: 6 With: '.'. 
               compare: body_str At: 7 With: '9012'.
               compare: body_str At: 8 With: '3456'.
               compare: body_str At: 9 With: '9012 + 3456'.   
               compare: body_str At: 10 With: '9012 + 3456'.   
               compare: body_str At: 11 With: '.'. 
               compare: body_str At: 12 With: '7890'.
               compare: body_str At: 13 With: 'resend.+ 7890'. "undirected resend"
               compare: body_str At: 14 With: 'resend.+ 7890'. "arg count"
               compare: body_str At: 15 With: 'resend.+ 7890'. "implicit self send"
               compare: body_str At: 16 With: '.'. 
               compare: body_str At: 17 With: '38'.
               compare: body_str At: 18 With: 'parent.+ 38'.  "delegatee"
               compare: body_str At: 19 With: 'parent.+ 38'.  "arg count"
               compare: body_str At: 20 With: 'parent.+ 38'.  "implicit self send"
               compare: body_str Size: 21
            ] value.

            "keyword sends"
            [| body_str = 'a: c B: d. e a: f B: g. resend.a: h B: i. parent.a: h B: i' |
               compare: body_str At: 0 With: 'c'.
               compare: body_str At: 1 With: 'd'.
               compare: body_str At: 2 With: 'a: c B: d'.     "arg count"
               compare: body_str At: 3 With: 'a: c B: d'.     "self"
               compare: body_str At: 4 With: '.'.
               compare: body_str At: 5 With: 'e'.
               compare: body_str At: 6 With: 'f'.
               compare: body_str At: 7 With: 'g'.
               compare: body_str At: 8 With: 'e a: f B: g'.
               compare: body_str At: 9 With: 'e a: f B: g'.
               compare: body_str At: 10 With: '.'.
               compare: body_str At: 11 With: 'h'.
               compare: body_str At: 12 With: 'i'.
               compare: body_str At: 13 With: 'resend.a: h B: i'."undirected resend"
               compare: body_str At: 14 With: 'resend.a: h B: i'."arg count"
               compare: body_str At: 15 With: 'resend.a: h B: i'."implicit self send"
               compare: body_str At: 16 With: '.'.
               compare: body_str At: 17 With: 'h'.
               compare: body_str At: 18 With: 'i'.
               compare: body_str At: 19 With: 'parent.a: h B: i'."delegatee"
               compare: body_str At: 20 With: 'parent.a: h B: i'."arg count"
               compare: body_str At: 21 With: 'parent.a: h B: i'."implicit self send"
               compare: body_str Size: 22.
            ] value.

            "bodylist"
            [  compare: '12'     At: 0 With: '12'.    "one expression"
               compare: '56. 78' At: 2 With: '78'.    "two expressions"
               compare: 'unary.' At: 0 With: 'unary'. "optional period"
               compare: '^5678'  At: 1 With: '^5678'. "return expression"
            ] value).
        } | ) 



 '-- Side effects'

 globals modules debugTests postFileIn
