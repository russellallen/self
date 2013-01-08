 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot'
        
         uiButton = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'uiButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'uiButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules uiButton.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot'
        
         myComment <- 'client implements:
                 cursor
                 absoluteContainsPoint:
             client optionally (but usually) implements:
                 [left,middle,right]ButtonPendingAccept:
                 [left,middle,right]ButtonPendingReject:
                 [left,middle,right]ButtonAccept
                 [left,middle,right]ButtonReject
             for buttonCluster, client also implements:
                 cluster'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins userInterface leftButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonAccept = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonDown = ( |
            | 
               trackUntil: [ cursor leftButtonUp ]
            PendingAccept: [ | :change | leftButtonPendingAccept: change ]
            PendingReject: [ | :change | leftButtonPendingReject: change ]
                   Accept: [ leftButtonAccept ]
                   Reject: [ leftButtonReject ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingAccept: change = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingReject: change = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonReject = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         uiButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'uiButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits uiButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonCluster = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButtonCluster' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins userInterface leftButtonCluster.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonAccept = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonDown = ( |
            | 
            trackClusterUntil: [ cursor leftButtonUp ]
                PendingAccept: [ | :b. :change. | b leftButtonPendingAccept: change ]
                PendingReject: [ | :b. :change. | b leftButtonPendingReject: change ]
                       Accept: [ | :b | b leftButtonAccept ]
                       Reject: [ | :b | b leftButtonReject ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingAccept: change = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingReject: change = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonReject = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         uiButtonCluster = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'uiButtonCluster' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits uiButtonCluster.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiButtonCluster' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins userInterface middleButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButtonAccept = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonDown = ( |
            | 
               trackUntil: [ cursor middleButtonUp ]
            PendingAccept: [ | :change | middleButtonPendingAccept: change ]
            PendingReject: [ | :change | middleButtonPendingReject: change ]
                   Accept: [ middleButtonAccept ]
                   Reject: [ middleButtonReject ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButtonPendingAccept: change = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButtonPendingReject: change = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButtonReject = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonCluster = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButtonCluster' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins userInterface middleButtonCluster.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButtonAccept = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonDown = ( |
            | 
            trackClusterUntil: [ cursor middleButtonUp ]
                PendingAccept: [ | :b. :change. | b middleButtonPendingAccept: change ]
                PendingReject: [ | :b. :change. | b middleButtonPendingReject: change ]
                       Accept: [ | :b | b middleButtonAccept ]
                       Reject: [ | :b | b middleButtonReject ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButtonPendingAccept: change = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButtonPendingReject: change = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButtonReject = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiButtonCluster' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins userInterface rightButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonAccept = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonDown = ( |
            | 
               trackUntil: [ cursor rightButtonUp ]
            PendingAccept: [ | :change | rightButtonPendingAccept: change ]
            PendingReject: [ | :change | rightButtonPendingReject: change ]
                   Accept: [ rightButtonAccept ]
                   Reject: [ rightButtonReject ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonPendingAccept: change = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonPendingReject: change = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonReject = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonCluster = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButtonCluster' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins userInterface rightButtonCluster.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiButtonCluster' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonAccept = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonDown = ( |
            | 
            trackClusterUntil: [ cursor rightButtonUp ]
                PendingAccept: [ | :b. :change. | b rightButtonPendingAccept: change ]
                PendingReject: [ | :b. :change. | b rightButtonPendingReject: change ]
                       Accept: [ | :b | b rightButtonAccept ]
                       Reject: [ | :b | b rightButtonReject ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonPendingAccept: change = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonPendingReject: change = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonReject = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiButton' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         trackUntil: untilCondition PendingAccept: pendingAccept PendingReject: pendingReject Accept: accept Reject: reject = ( | {
                 'ModuleInfo: Module: uiButton InitialContents: FollowSlot'
                
                 within <- bootstrap stub -> 'globals' -> 'false' -> ().
                } 
            | 
            cursor until: untilCondition Do: [ | :loc |
                (absoluteContainsPoint: loc)
                  ifTrue: [ pendingAccept value: within not. within: true.  ]
                   False: [ pendingReject value: within.     within: false. ] ].
            (absoluteContainsPoint: cursor location) ifTrue: accept False: reject.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot'
        
         memberContaining: loc IfFound: found IfNone: none = ( |
            | 
            cluster do: [ | :m |
                (m absoluteContainsPoint: loc) ifTrue: [ ^ found value: m ] ].
            none value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiButtonCluster' -> () From: ( | {
         'ModuleInfo: Module: uiButton InitialContents: FollowSlot\x7fVisibility: private'
        
         trackClusterUntil: untilCondition PendingAccept: pendingAccept PendingReject: pendingReject Accept: accept Reject: reject = ( | {
                 'ModuleInfo: Module: uiButton InitialContents: FollowSlot'
                
                 current.
                }  {
                 'ModuleInfo: Module: uiButton InitialContents: FollowSlot'
                
                 within <- bootstrap stub -> 'globals' -> 'false' -> ().
                } 
            | 
            current: self.
            cursor until: untilCondition Do: [ | :loc |
                (current absoluteContainsPoint: loc)
                  ifTrue: [ pendingAccept value: current With: within not.
                            within: true.  ]
                   False: [ pendingReject value: current With: within.
                            within: false.
                            memberContaining: loc
                                     IfFound: [ | :b | current: b ]
                                      IfNone: [].
                          ].
            ].
            (current absoluteContainsPoint: cursor location)
                ifTrue: [ accept value: current ]
                 False: [ reject value: current ].
            self).
        } | ) 



 '-- Side effects'

 globals modules uiButton postFileIn
