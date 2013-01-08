 '$Revision: 30.14 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: userProfile InitialContents: FollowSlot'
        
         userProfile = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'userProfile' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals userProfile.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: InitializeToExpression: (userProfile)'
        
         userInfo <- bootstrap stub -> 'globals' -> 'userProfile' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot'
        
         userProfile = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'userProfile' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'userProfile' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules userProfile.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            transporter moduleDictionary resetFillingSemaphore.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: transporter moduleDictionary
                           Selector: 'resetFillingSemaphore'.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.14 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: InitializeToExpression: (\'self\' copyMutable)'
        
         displayHostName <- 'self' copyMutable.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: InitializeToExpression: (handMorph)'
        
         hand <- bootstrap stub -> 'globals' -> 'handMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: InitializeToExpression: (nil)'
        
         loginName.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals userProfile parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy preferences: preferences copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         displayHostNameGuess = ( |
            | 
            hand isInWorld ifTrue: [ | host. disp. |
              disp: (hand winCanvasForHand display serverName).
              ':' = disp first ifTrue: [worldHostName]
                                False: [(disp asTokensSeparatedByCharactersIn: ':') first].
            ] False: [
              nil.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'Category: platform-dependent\x7fModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         fingerTimeout = 5000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'Category: platform-dependent\x7fModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         guessPreferredName = ( |
            | 
            loginName: nil.
            preferredName: nil.
            (message copy receiver: self Selector: 'guessPreferredNameHoweverLongItTakes') fork.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'Category: platform-dependent\x7fModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         guessPreferredNameHoweverLongItTakes = ( |
             command.
             lines.
             n.
             r.
             response.
            | 
            n:  loginName ifNil: [loginNameGuessHoweverLongItTakes. loginName].
            displayHostName ifNil: [^ setPreferredName: n].
            command: 'finger -l ', n, '@', displayHostName.
            response: os outputOfCommand: command Delay: fingerTimeout IfFail: [^ setPreferredName: nil].
            lines: response asTokensSeparatedByCharactersIn: '\n'.
            (lines size <= 1) || [r: (lines at: 1) asTokensSeparatedByWhiteSpace. r size <= 6] ifTrue: [
                ^ setPreferredName: n.
            ].
            setPreferredName: (r at: 6) uncapitalizeAll capitalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'Comment: In a shared world, the display and world may
reside on different machines (nodes in unix terminology).
hostName will return the name of the machine at which you
sit (i.e., the display host).\x7fModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: public'
        
         hostName = ( |
            | displayHostName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'Category: platform-dependent\x7fModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         loginNameGuessHoweverLongItTakes = ( |
             c.
             command.
            | 
            command: 'finger -l @' , displayHostNameGuess.
            c: os outputOfCommand: command Delay: fingerTimeout IfFail: [ ^ loginName: nil].
            loginName: 
              c asTokensSeparatedByWhiteSpace at: 3 IfAbsent: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | 
            preferredName ifNil: [loginName ifNil: [displayHostName ifNil: unknownName]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: public'
        
         setNamesByGuess = ( |
            | 
             displayHostName: displayHostNameGuess.
            "Next line uses finger command, and we're mis-parsing the output - Adam & Alex April '04"
            "guessPreferredName").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'Category: platform-dependent\x7fModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         setPreferredName: n = ( |
            | 
            preferredName: n.
            hand setCachedNameWidth.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         unknownName = '??'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         worldHostName = ( |
            | 
            os nodename).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot'
        
         preferences <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'userProfile' -> 'preferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals userProfile preferences.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: InitializeToExpression: (globals fontSpec copyName: \'helvetica\' Size: 11 Style: \'bold\')'
        
         nameFontSpec <- globals fontSpec copyName: 'helvetica' Size: 11 Style: 'bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: InitializeToExpression: (true)'
        
         showNameToOthers <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: InitializeToExpression: (false)'
        
         showNameToSelf <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: InitializeToExpression: (nil)'
        
         preferredName.
        } | ) 



 '-- Side effects'

 globals modules userProfile postFileIn
