 '$Revision: 30.14 $'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: InitializeToExpression: (users owner)'
        
         userInfo <- bootstrap stub -> 'globals' -> 'users' -> 'owner' -> ().
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
            worldMorph addBackgroundMenuContributor: userProfile.
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
         'ModuleInfo: Module: userProfile InitialContents: InitializeToExpression: (handMorph)'
        
         hand <- bootstrap stub -> 'globals' -> 'handMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userProfile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: userProfile InitialContents: FollowSlot'
        
         contributeToBackgroundMenu: m = ( |
            | 
            m addButton: ( ((ui2Button copy scriptBlock: [target attachOpenWindowForUserDialog: event]) 
                                                 label: 'Give user access...' ) isAsynchronous: true)
                ToGroup: 'users'.
            m addButton: ( ((ui2Button copy scriptBlock: [target attachCloseWindowForUserDialog: event]) 
                                                 label: 'Remove user access...' ) isAsynchronous: true)
                ToGroup: 'users'.
            m addButton: ( (ui2Button copy scriptBlock: [event sourceHand attach: event sourceHand world outlinerForMirror: reflect: users]) 
                                                 label: 'Users' )
                ToGroup: 'users'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: userProfile InitialContents: FollowSlot'
        
         attachCloseWindowForUserDialog: evt = ( |
             availableHands.
             availableUsers.
             chosenHand.
            | 
            hands size = 1 ifTrue: [
               userQuery report: 'Only the owner is connected'.
               ^ self].
            availableHands: (hands asSequence copyFilteredBy: [|:h| h userInfo name != users owner name]).
            availableUsers: availableHands copyMappedBy: [|:h| h userInfo name].
            chosenHand: userQuery
             askMultipleChoice: 'Which user?'
             Choices: availableUsers
             Results:  availableHands.
            safelyDoIfWorld: [ closeFromHand: chosenHand].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: menu operations\x7fComment: The user chooses from a list of predefined usersProfiles in the team.
I then look for a X display on the local machine which doesn\'t already have a
Self window in this world open on it, and open a new Self window for that userProfile
on that display.\x7fModuleInfo: Module: userProfile InitialContents: FollowSlot'
        
         attachOpenWindowForUserDialog: evt = ( |
             availableDisplays.
             chosenDisplay.
             chosenUser.
             freeDisplays.
             usedDisplays.
            | 
            users team isEmpty ifTrue: [
               userQuery report: 'You have not defined any users'.
               ^ self].
            chosenUser: userQuery
             askMultipleChoice: 'Which user?'
             Choices: (users team copyMappedBy: [|:u| u name]) asVector
             Results: users team asVector.
            availableDisplays: (os outputOfCommand: 'ls /tmp/.X11-unix/' Delay: 100 IfFail: [
               (userQuery askYesNo: 'Could not get list of available displays. Retry?')
                  ifTrue: [^ attachOpenWindowForUserDialog: evt]
                   False: [^ self]]).
            availableDisplays: (availableDisplays shrinkwrapped splitOn: '\n') mapBy: [|:d| ':', (d slice: 1 @ infinity)].
            usedDisplays: hands copyMappedBy: [|:h| h winCanvasForHand display name].
            freeDisplays: availableDisplays difference: usedDisplays.
            freeDisplays isEmpty ifTrue: [userQuery report: 'There are no free displays.'. ^ self].
            chosenDisplay: freeDisplays first.
            "chosenDisplay: userQuery askString: 'Which display?\n(Is probably an X display eg :1 ... :5)'."
            addWindowOnDisplay: chosenDisplay Bounds: (0@0)##(3000@3000) User: chosenUser Limited: false.
            userQuery report: chosenUser name, ' may now connect on display ', chosenDisplay.
            self).
        } | ) 



 '-- Side effects'

 globals modules userProfile postFileIn
