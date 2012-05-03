 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sending InitialContents: FollowSlot'
        
         sending = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sending' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sending' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sending.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sending' -> () From: ( | {
         'ModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sending' -> () From: ( | {
         'ModuleInfo: Module: sending InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sending' -> () From: ( | {
         'ModuleInfo: Module: sending InitialContents: FollowSlot'
        
         myComment <- 'Behavior for strings to act as messages sent to some receiver.  These 
             methods are in the form of delegation so they will work even if the
             receiver of the message to be sent doesn\'t inherit this object.\"

            \"Perform primitive needs to be changed to take the method holder.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sending' -> () From: ( | {
         'ModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sending' -> () From: ( | {
         'ModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sending = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sending' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sending.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: resending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         howToPerformUndirectedResends = ( |
            | 
            "The _PerformResend: primitives do a resend starting from
             the holder of the method that the primitive is called
             from (just like how an ordinary resend starts from the
             holder of the method that the resend is in). If you
             wish to perform an undirected resend, you can use one
             of the following primitives directly in the method
             that you wish to resend from:"

            [ _PerformResend: aSelector ].
            [ _PerformResend: aSelector With: a1 ].
            [ _PerformResend: aSelector With: a1 With: a2 ].
            [ _PerformResend: aSelector With: a1 With: a2 With: a3 ].
            [ _PerformResend: aSelector With: a1 With: a2 With: a3 With: a4 ].
            [ _PerformResend: aSelector With: a1 With: a2 With: a3 With: a4 With: a5 ].
            [ _PerformResend: aSelector With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 ].
            [ _PerformResend: aSelector With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7 ].
            [ _PerformResend: aSelector With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7 With: a8 ].
            [ _PerformResend: aSelector With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7 With: a8 With: a9 ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver = ( |
            | receiver _Perform: canonicalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending and delegating\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver DelegatingTo: delegatee = ( |
            | 
            receiver _Perform: canonicalize DelegatingTo: delegatee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending and delegating\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver DelegatingTo: delegatee With: a1 = ( |
            | 
            receiver _Perform: canonicalize DelegatingTo: delegatee With: a1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending and delegating\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver DelegatingTo: delegatee With: a1 With: a2 = ( |
            | 
            receiver _Perform: canonicalize DelegatingTo: delegatee
                With: a1 With: a2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending and delegating\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver DelegatingTo: delegatee With: a1 With: a2 With: a3 = ( |
            | 
            receiver _Perform: canonicalize DelegatingTo: delegatee
                With: a1 With: a2 With: a3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending and delegating\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver DelegatingTo: delegatee With: a1 With: a2 With: a3 With: a4 = ( |
            | 
            receiver _Perform: canonicalize DelegatingTo: delegatee
                With: a1 With: a2 With: a3 With: a4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending and delegating\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver DelegatingTo: delegatee With: a1 With: a2 With: a3 With: a4 With: a5 = ( |
            | 
            receiver _Perform: canonicalize DelegatingTo: delegatee
                With: a1 With: a2 With: a3 With: a4 With: a5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending and delegating\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver DelegatingTo: delegatee With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 = ( |
            | 
            receiver _Perform: canonicalize DelegatingTo: delegatee
                With: a1 With: a2 With: a3 With: a4 With: a5 With: a6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending and delegating\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver DelegatingTo: delegatee With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7 = ( |
            | 
            receiver _Perform: canonicalize DelegatingTo: delegatee
                With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending and delegating\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver DelegatingTo: delegatee With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7 With: a8 = ( |
            | 
            receiver _Perform: canonicalize DelegatingTo: delegatee
                With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7
                With: a8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending and delegating\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver DelegatingTo: delegatee With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7 With: a8 With: a9 = ( |
            | 
            receiver _Perform: canonicalize DelegatingTo: delegatee
                With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7
                With: a8 With: a9).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending and delegating\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver DelegatingTo: delegatee WithArguments: a = ( |
            | 
            0 = a size ifTrue: [ ^ sendTo: receiver 
              DelegatingTo: delegatee ].
            1 = a size ifTrue: [ ^ sendTo: receiver 
              DelegatingTo: delegatee
              With: a at: 0 ].
            2 = a size ifTrue: [ ^ sendTo: receiver 
              DelegatingTo: delegatee
              With: (a at: 0) With: (a at: 1) ].
            3 = a size ifTrue: [ ^ sendTo: receiver 
              DelegatingTo: delegatee
              With: (a at: 0) With: (a at: 1) With: (a at: 2) ].
            4 = a size ifTrue: [ ^ sendTo: receiver 
              DelegatingTo: delegatee
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3) ].
            5 = a size ifTrue: [ ^ sendTo: receiver 
              DelegatingTo: delegatee
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3)
              With: (a at: 4) ].
            6 = a size ifTrue: [ ^ sendTo: receiver 
              DelegatingTo: delegatee
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3)
              With: (a at: 4) With: (a at: 5) ].
            7 = a size ifTrue: [ ^ sendTo: receiver 
              DelegatingTo: delegatee
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3)
              With: (a at: 4) With: (a at: 5) With: (a at: 6) ].
            8 = a size ifTrue: [ ^ sendTo: receiver 
              DelegatingTo: delegatee
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3)
              With: (a at: 4) With: (a at: 5) With: (a at: 6) With: (a at: 7) ].
            9 = a size ifTrue: [ ^ sendTo: receiver 
              DelegatingTo: delegatee
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3)
              With: (a at: 4) With: (a at: 5) With: (a at: 6) With: (a at: 7)
              With: (a at: 8) ].
            error: 'need more cases').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver With: a1 = ( |
            | 
            receiver _Perform: canonicalize With: a1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver With: a1 With: a2 = ( |
            | 
            receiver _Perform: canonicalize With: a1 With: a2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver With: a1 With: a2 With: a3 = ( |
            | 
            receiver _Perform: canonicalize With: a1 With: a2 With: a3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver With: a1 With: a2 With: a3 With: a4 = ( |
            | 
            receiver _Perform: canonicalize With: a1 With: a2 With: a3 With: a4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver With: a1 With: a2 With: a3 With: a4 With: a5 = ( |
            | 
            receiver _Perform: canonicalize 
                With: a1 With: a2 With: a3 With: a4 With: a5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 = ( |
            | 
            receiver _Perform: canonicalize
                With: a1 With: a2 With: a3 With: a4 With: a5 With: a6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7 = ( |
            | 
            receiver _Perform: canonicalize
                With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7 With: a8 = ( |
            | 
            receiver _Perform: canonicalize
                With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7
                With: a8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7 With: a8 With: a9 = ( |
            | 
            receiver _Perform: canonicalize
                With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7
                With: a8 With: a9).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7 With: a8 With: a9 With: a10 = ( |
            | 
            receiver _Perform: canonicalize
                With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7
                With: a8 With: a9 With: a10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7 With: a8 With: a9 With: a10 With: a11 = ( |
            | 
            receiver _Perform: canonicalize
                With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7
                With: a8 With: a9 With: a10 With: a11).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7 With: a8 With: a9 With: a10 With: a11 With: a12 = ( |
            | 
            receiver _Perform: canonicalize
                With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7
                With: a8 With: a9 With: a10 With: a11 With: a12).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7 With: a8 With: a9 With: a10 With: a11 With: a12 With: a13 = ( |
            | 
            receiver _Perform: canonicalize
                With: a1 With: a2 With: a3 With: a4 With: a5 With: a6 With: a7
                With: a8 With: a9 With: a10 With: a11 With: a12
                With: a13).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sending' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sending InitialContents: FollowSlot\x7fVisibility: public'
        
         sendTo: receiver WithArguments: a = ( |
            | 
            0 = a size ifTrue: [ ^ sendTo: receiver ].
            1 = a size ifTrue: [ ^ sendTo: receiver 
              With: a at: 0 ].
            2 = a size ifTrue: [ ^ sendTo: receiver 
              With: (a at: 0) With: (a at: 1) ].
            3 = a size ifTrue: [ ^ sendTo: receiver 
              With: (a at: 0) With: (a at: 1) With: (a at: 2) ].
            4 = a size ifTrue: [ ^ sendTo: receiver 
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3) ].
            5 = a size ifTrue: [ ^ sendTo: receiver 
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3)
              With: (a at: 4) ].
            6 = a size ifTrue: [ ^ sendTo: receiver 
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3)
              With: (a at: 4) With: (a at: 5) ].
            7 = a size ifTrue: [ ^ sendTo: receiver 
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3)
              With: (a at: 4) With: (a at: 5) With: (a at: 6) ].
            8 = a size ifTrue: [ ^ sendTo: receiver 
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3)
              With: (a at: 4) With: (a at: 5) With: (a at: 6) With: (a at: 7) ].
            9 = a size ifTrue: [ ^ sendTo: receiver 
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3)
              With: (a at: 4) With: (a at: 5) With: (a at: 6) With: (a at: 7)
              With: (a at: 8) ].
            10 = a size ifTrue: [ ^ sendTo: receiver 
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3)
              With: (a at: 4) With: (a at: 5) With: (a at: 6) With: (a at: 7)
              With: (a at: 8) With: (a at: 9) ].
            11 = a size ifTrue: [ ^ sendTo: receiver 
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3)
              With: (a at: 4) With: (a at: 5) With: (a at: 6) With: (a at: 7)
              With: (a at: 8) With: (a at: 9) With: (a at: 10)].
            12 = a size ifTrue: [ ^ sendTo: receiver 
              With: (a at: 0) With: (a at: 1) With: (a at: 2) With: (a at: 3)
              With: (a at: 4) With: (a at: 5) With: (a at: 6) With: (a at: 7)
              With: (a at: 8) With: (a at: 9) With: (a at: 10) With: (a at: 11) ].
            error: 'need more cases').
        } | ) 



 '-- Side effects'

 globals modules sending postFileIn
