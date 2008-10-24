 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'false' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         class = ( |
            | 
            smalltalkEmulator smalltalk false_s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         smalltalkSupport = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkSupport' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkSupport' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules smalltalkSupport.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkSupport' -> () From: ( | {
         'ModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkSupport' -> () From: ( | {
         'ModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/smalltalk'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkSupport' -> () From: ( | {
         'ModuleInfo: Module: smalltalkSupport InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkSupport' -> () From: ( | {
         'ModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            transporter moduleDictionary resetFillingSemaphore.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: transporter moduleDictionary
                           Selector: 'resetFillingSemaphore'.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkSupport' -> () From: ( | {
         'ModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkSupport' -> () From: ( | {
         'ModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'true' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         class = ( |
            | smalltalkEmulator smalltalk true_s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         value: a Value: b = ( |
            | value: a With: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         value: a Value: b Value: c = ( |
            | 
            value: a With: b With: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         value: a Value: b Value: c Value: d = ( |
            | 
            value: a With: b With: c With: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: private'
        
         valueSelectors = [ | x = vector copySize: 10 | 
             x at: 0  Put: ().
             x at: 1  Put: ().
             x at: 2  Put: ().
             x at: 3  Put: ().
             x at: 4  Put: ().
             x at: 5  Put: ().
             x at: 6  Put: ().
             x at: 7  Put: ().
             x at: 8  Put: ().
             x at: 9  Put: ().
             x] value.
        } | ) 

 bootstrap stub -> 'traits' -> 'block' -> 'valueSelectors' -> () at: 0 Put: (
     'value')

 bootstrap stub -> 'traits' -> 'block' -> 'valueSelectors' -> () at: 1 Put: (
     'value:')

 bootstrap stub -> 'traits' -> 'block' -> 'valueSelectors' -> () at: 2 Put: (
     'value:With:')

 bootstrap stub -> 'traits' -> 'block' -> 'valueSelectors' -> () at: 3 Put: (
     'value:With:With:')

 bootstrap stub -> 'traits' -> 'block' -> 'valueSelectors' -> () at: 4 Put: (
     'value:With:With:With:')

 bootstrap stub -> 'traits' -> 'block' -> 'valueSelectors' -> () at: 5 Put: (
     'value:With:With:With:With:')

 bootstrap stub -> 'traits' -> 'block' -> 'valueSelectors' -> () at: 6 Put: (
     'value:With:With:With:With:With:')

 bootstrap stub -> 'traits' -> 'block' -> 'valueSelectors' -> () at: 7 Put: (
     'value:With:With:With:With:With:With:')

 bootstrap stub -> 'traits' -> 'block' -> 'valueSelectors' -> () at: 8 Put: (
     'value:With:With:With:With:With:With:With:')

 bootstrap stub -> 'traits' -> 'block' -> 'valueSelectors' -> () at: 9 Put: (
     'value:With:With:With:With:With:With:With:With:')

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         valueWithArguments: a = ( |
             n.
             v.
             i.
            | 
            n: a size.
            v: vector copySize: n.
            i: 0.
            a do: [|:e| v at: i Put: e.  i: i succ].
            (valueSelectors at: n IfAbsent: [error: 'too many arguments'])
              sendTo: self WithArguments: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boolean' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         and: block = ( |
            | && block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boolean' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         ifFalse: falseBlock IfTrue: trueBlock = ( |
            | 
            ifTrue: trueBlock False: falseBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boolean' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         ifTrue: trueBlock IfFalse: falseBlock = ( |
            | ifTrue: trueBlock False: falseBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boolean' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         or: block = ( |
            | || block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         rounded = ( |
            | round).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         bitAnd: a = ( |
            | && a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         bitOr: a = ( |
            | || a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         bitShift: n = ( |
            | 
            n < 0 ifTrue: [+> (0 - n)] False: [<+ n]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         bitXor: a = ( |
            | ^^ a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         rounded = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         timesRepeat: block = ( |
            | do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableString' -> () From: ( | {
         'ModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         stringName = ( |
            | resend.storeStringIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         // a = ( |
            | 
            /- a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         \\ a = ( |
            | % a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         abs = ( |
            | absoluteValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         isNil = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         notNil = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         printOn: aStream = ( |
            | 
            printString asSmalltalkString do: [|:c| aStream nextPut: c]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         sqrt = ( |
            | squareRoot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         storeOn: s = ( |
            | printOn: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         to: n = ( |
            | smalltalkEmulator smalltalk global_dict interval_s from: self To: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         to: n By: step = ( |
            | 
            smalltalkEmulator smalltalk global_dict interval_s from: self To: n By: step).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         ~= a = ( |
            | != a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         ~~ a = ( |
            | (self == a) == false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         // a = ( |
            | 
            (0 <= self) && [0 <= a] ifTrue: [/ a] False: [resend.// a]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot'
        
         bitShift: n = ( |
            | 
            n < 0 ifTrue: [+> (0 - n)] False: [<+ n]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         asSelfString = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: Smalltalk support\x7fComment: This is slow!\x7fModuleInfo: Module: smalltalkSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         asSmalltalkString = ( |
            | 
            (smalltalkEmulator global: 'String') fromSelfString: self).
        } | ) 



 '-- Side effects'

 globals modules smalltalkSupport postFileIn
