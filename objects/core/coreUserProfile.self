 ''
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
[ 
"prefileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         coreUserProfile = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'coreUserProfile' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'coreUserProfile' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules coreUserProfile.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreUserProfile' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreUserProfile' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreUserProfile' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreUserProfile' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreUserProfile' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: InitializeToExpression: (\'30.21.0\')\x7fVisibility: public'
        
         revision <- '30.21.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreUserProfile' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: user profiles\x7fModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         userProfile = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'userProfile' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals userProfile.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: InitializeToExpression: (\'self\' copyMutable)'
        
         displayHostName <- 'self' copyMutable.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: InitializeToExpression: (nil)'
        
         loginName.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals userProfile parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy preferences: preferences copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: private'
        
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
         'Category: platform-dependent\x7fModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         fingerTimeout = 5000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'Category: platform-dependent\x7fModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         guessPreferredName = ( |
            | 
            loginName: nil.
            preferredName: nil.
            (message copy receiver: self Selector: 'guessPreferredNameHoweverLongItTakes') fork.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'Category: platform-dependent\x7fModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: private'
        
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
         'Category: platform-dependent\x7fModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: private'
        
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
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | 
            preferredName ifNil: [loginName ifNil: [displayHostName ifNil: unknownName]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         name: n = ( |
            | 
            preferredName: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: public'
        
         setNamesByGuess = ( |
            | 
             displayHostName: displayHostNameGuess.
            "Next line uses finger command, and we're mis-parsing the output - Adam & Alex April '04"
            "guessPreferredName").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'Category: platform-dependent\x7fModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         setPreferredName: n = ( |
            | 
            preferredName: n.
            hand setCachedNameWidth.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         unknownName = '??'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         worldHostName = ( |
            | 
            os nodename).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         preferences <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'userProfile' -> 'preferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals userProfile preferences.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: InitializeToExpression: (true)'
        
         showNameToOthers <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: InitializeToExpression: (false)'
        
         showNameToSelf <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: InitializeToExpression: (nil)'
        
         preferredName.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         users = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'users' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals users.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'users' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         addUserNamed: n Password: p = ( |
            | team add: (userProfile copy name: n) password: p. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'users' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         owner = bootstrap define: bootstrap stub -> 'globals' -> 'users' -> 'owner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'hashedVNCPassword' From:
             bootstrap remove: 'loginName' From:
             bootstrap remove: 'parent' From:
             globals userProfile copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'users' -> 'owner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals users owner.

CopyDowns:
globals userProfile. copy 
SlotsToOmit: hashedVNCPassword loginName parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'users' -> 'owner' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: InitializeToExpression: (\'\\xc7\\x14m
\\b.\\x1e\\b\' copyMutable)'
        
         hashedVNCPassword <- '\xc7\x14m
\b.\x1e\b' copyMutable.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'users' -> 'owner' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: InitializeToExpression: (\'owner\')'
        
         loginName <- 'owner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'users' -> 'owner' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'users' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'users' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         team <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'users' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         userNamed: n = ( |
            | 
            userNamed: n IfAbsent: [error: 'Cannot find registered user: ', n]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'users' -> () From: ( | {
         'ModuleInfo: Module: coreUserProfile InitialContents: FollowSlot'
        
         userNamed: n IfAbsent: blk = ( |
            | 
            owner name = n ifTrue: [^ owner].
            team findFirst: [|:u| u name = n] IfPresent: [|:n| n] IfAbsent: blk).
        } | ) 



 '-- Side effects'

 globals modules coreUserProfile postFileIn
