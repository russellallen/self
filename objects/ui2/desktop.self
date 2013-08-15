 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Desktop\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         desktop = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals desktop.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         add: m = ( |
            | 
            w safelyDo: [ w addMorph: m ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fComment: Called when a new world is created -- Mario, 2/4/95\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         addWorld: w = ( |
            | 
            worlds addLast: w.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: private'
        
         adjustVMParametersForBetterSpeed = ( |
             betterMaxPICSize = 25.
            | 

            "HACK inserted by Lars. 6/21 94"

            ( _MaxPICSizeIfFail: [^ self] ) >= betterMaxPICSize ifTrue: [^self].

            log info: 
               'Adjusting VM for better UI2 performance:', 
               '  _MaxPICSize: ', betterMaxPICSize printString.
            _MaxPICSize: betterMaxPICSize.

            "The code cache has to be flushed after changing the max PIC size."
            _Flush.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         clear = ( |
            | 
            "Remove all morphs from the world, then add the initial morphs"
            w stop.
            w removeAllMorphs.
            w addInitialMorphs.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Close the ui2 desktop.  This should not
be invoked from within ui2.\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            worldsDo: [|:w| w close].
            [isOpen not] assert.
            servers removeAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: starting and stopping\x7fComment: Start the worlds\' ui2 processes executing the display loop.\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         go = ( |
            | 
            worldsDo: [|:w| w go].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         inspect: obj = ( |
            | 
            add: w outlinerForMirror: reflect: obj.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Is there a world open? -- Mario, 2/4/95\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         isOpen = ( |
            | worlds isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         lm = ( |
            | 
            "Shortcut used to get a reference to the last morph dropped
             into the world. To use, just grab and drop a morph, then use
             lm to get get a reference to it. The morph must land on the
             world, not onto some other morph."

            w firstMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Open a ui2 window with some
useful objects in it, and some performance
tuning.
-- Randy, 2/9/95\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         open = ( |
            | openOnDisplay: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         openNewWorld = ( |
            | 
            worldMorph openNew).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         openNewWorldOnDisplay: dispName = ( |
            | 
            (worldMorph copyOpenOnDisplay: dispName) go).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         openNewWorldOnDisplay: dispName Bounds: b = ( |
            | 
            (worldMorph copyOpenOnDisplay: dispName Bounds: b) go).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Open a ui2 window with
some initial objects and some
performance tuning to the system.\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         openOnDisplay: dName = ( |
             w.
            | 
            isOpen ifTrue: [
              userQuery report: 'The desktop is already open!'.
              ^self
            ].

            adjustVMParametersForBetterSpeed.
            "reset the flag so that color problems are reported."

            w: worldMorph
                copyOpenOnDisplay: dName
                           Bounds: (100@100) ## (707@450).
            w addInitialMorphs.
            w go.
            '
              The ui2 desktop is now running. Type:
                "desktop stop"  to suspend it,
                "desktop go"    to resume it after stopping, and
                "desktop close" to close it.
            ' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'ModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: misc\x7fComment: Force a complete redraw.\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         redraw = ( |
            | 
            worldsDo: [|:w| w safelyDo: [ w changed ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         releaseObjects = ( |
            | servers removeAll. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         releaseUnusedReifiedObjects = ( |
            | 
            worldsDo: [|:w| w removeReifiedObjectsNotInWorld]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fComment: Called when a world is closed -- Mario, 2/4/95\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         removeWorld: w = ( |
            | worlds remove: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fComment: Set to true if the -headless commandline option is set.\x7fModuleInfo: Module: desktop InitialContents: InitializeToExpression: (false)'
        
         restartSuppressedFlag <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Reopen the ui2 window(s) after returning from a snapshot,
if it was open when the snapshot was made, unless the user has 
requested we not open by the \'-headless\' flag.\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         returnFromSnapshot = ( |
            | 
            restartSuppressedFlag ifTrue: [
              restartSuppressedFlag: false. "Reset for next time"
              ^ self].
            worlds isEmpty ifFalse: [
                "Reset the keyboard mappings for Linux"
                adjustVMParametersForBetterSpeed.
                "reset the flag so that color problems are reported."
                 worlds do: [|:w| w reopen].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fComment: A dictionary mapping connected X server names to morphs in transit
-- Mario, 4/13/95\x7fModuleInfo: Module: desktop InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: public'
        
         servers <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: private'
        
         setNameOfNewWorld: w = ( |
            | 
            worldCount: worldCount succ.
            w name: 'Self ', worldCount printString.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         showTrueColors = ( |
            | 
            worldsDo: [| :w | w showTrueColors ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: starting and stopping\x7fComment: Stop the world!\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         stop = ( |
            | 
            worldsDo: [|:w| w stop].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Sent from the snapshotAction module 
if the -headless flag is set on the command line at
start up.  Supresses the opening of the desktop only
for one time.\x7fModuleInfo: Module: desktop InitialContents: FollowSlot'
        
         suppressRestart = ( |
            | restartSuppressedFlag: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         updateOutliners: aBool = ( |
            | 
            worldsDo: [|:w| w updateOutliners: aBool].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fComment: The `current\' world.  This is an anachronism
and its use is deprecated. --Mario, 2/4/95\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         w = ( |
            | isOpen ifTrue: [worlds last] False: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         windowCanvasAndHandAt: pt Server: svrName IfPresent: pb IfAbsent: ab = ( |
            | 
            worlds do: [|:w|
              w windowCanvasAndHandAt: pt
                Server: svrName
                IfPresent: [|:wc. :h | 
                    ^ pb value: wc With: h
              ] IfAbsent: []
            ].
            ab value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: desktop InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         worldCount <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fComment: Return the world with the given name.\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         worldNamed: n = ( |
            | worldNamed: n IfAbsent: [error: 'no world with name ', n]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fComment: Return the world with the given name, otherwise evaluate fb.\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         worldNamed: name IfAbsent: fb = ( |
            | 
            worlds
              findFirst: [|:w| w name = name]
              IfPresent: [|:w| w]
               IfAbsent: [^fb value]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fComment: A list of all the open worlds -- Mario, 2/4/95\x7fModuleInfo: Module: desktop InitialContents: InitializeToExpression: (sequence copyRemoveAll)\x7fVisibility: public'
        
         worlds <- sequence copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: private'
        
         worldsDo: aBlock = ( |
            | 
            "Use a copy, to avoid problems if the block alters the list."
            worlds copy do: aBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: desktop InitialContents: FollowSlot'
        
         desktop = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'desktop' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'desktop' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules desktop.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'desktop' -> () From: ( | {
         'ModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'desktop' -> () From: ( | {
         'ModuleInfo: Module: desktop InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'desktop' -> () From: ( | {
         'ModuleInfo: Module: desktop InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'desktop' -> () From: ( | {
         'ModuleInfo: Module: desktop InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            [returnFromSnapshot. releaseUnusedRefiedObjects]. "browsing"
            snapshotAction addSchedulerInitialMessage:
              message copy receiver: desktop Selector: 'returnFromSnapshot'.
            memory addThoroughCleanupMessage:
              message copy receiver: desktop Selector: 'releaseUnusedReifiedObjects'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'desktop' -> () From: ( | {
         'ModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'desktop' -> () From: ( | {
         'ModuleInfo: Module: desktop InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: ui2\x7fModuleInfo: Module: desktop InitialContents: FollowSlot'
        
         desktop = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'preferences' -> 'desktop' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals preferences desktop.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'desktop' -> () From: ( | {
         'Comment: At the moment, all worlds are the same color.\x7fModuleInfo: Module: desktop InitialContents: FollowSlot'
        
         backgroundColor = ( |
            | backgroundColor: raw. raw).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'desktop' -> () From: ( | {
         'ModuleInfo: Module: desktop InitialContents: FollowSlot'
        
         backgroundColor: aPaint = ( |
            | desktop worldsDo: [|:w| w color: aPaint]. raw: aPaint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'desktop' -> () From: ( | {
         'Category: example colors\x7fModuleInfo: Module: desktop InitialContents: FollowSlot'
        
         gray44 = ( |
            | (paint named: 'gray') copyBrightness: 0.93).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'desktop' -> () From: ( | {
         'Category: example colors\x7fModuleInfo: Module: desktop InitialContents: FollowSlot'
        
         offWhite = ( |
            | 
            paint copyRed: 16rF6 / 16rFF asFloat 
                    Green: 16rF6 / 16rFF asFloat 
                     Blue: 16rF6 / 16rFF asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'desktop' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: desktop InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'desktop' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: desktop InitialContents: InitializeToExpression: (paint named: \'white\')'
        
         raw <- paint named: 'white'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'desktop' -> () From: ( | {
         'Category: example colors\x7fModuleInfo: Module: desktop InitialContents: FollowSlot'
        
         warmWhite = ( |
            | 
            paint copyRed: 16rFD asFloat / 16rFF asFloat 
                    Green: 16rFD asFloat / 16rFF asFloat 
                     Blue: 16rF0 asFloat / 16rFF asFloat).
        } | ) 



 '-- Side effects'

 globals modules desktop postFileIn
