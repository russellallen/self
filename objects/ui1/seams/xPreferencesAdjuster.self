 '$Revision:$'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot'
        
         xPreferencesAdjuster = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'xPreferencesAdjuster' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'xPreferencesAdjuster' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules xPreferencesAdjuster.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xPreferencesAdjuster' -> () From: ( | {
         'ModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1/seams'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xPreferencesAdjuster' -> () From: ( | {
         'ModuleInfo: Module: xPreferencesAdjuster InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xPreferencesAdjuster' -> () From: ( | {
         'ModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xPreferencesAdjuster' -> () From: ( | {
         'ModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xPreferencesAdjuster' -> () From: ( | {
         'ModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xPreferencesAdjuster' -> () From: ( | {
         'ModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot'
        
         xPreferencesAdjuster = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( |
             {} = 'Comment: To delete all prefs for testing: defaults delete org.xquartz.X11\x7fModuleInfo: Creator: globals xPreferencesAdjuster.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Comment: On macOS, the first time per session we are about to use the X11 backend,
make sure XQuartz is not eating Command-key shortcuts, so Self menu shortcuts (Cmd-M,
copy/paste) reach the UI instead of minimizing the window. Offer to fix the pref and
restart XQuartz. -- claude & dmu 6/2026\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: public'
        
         adjust = ( |
             did = bootstrap stub -> 'globals' -> 'true' -> ().
             didnt = bootstrap stub -> 'globals' -> 'false' -> ().
             pref.
            | 
            canAdjust ifFalse: [^ didnt].
            areAllOK ifTrue: [^ did].

            (userQuery askYesNo: prompt) ifFalse: [
               warning printLine.
               ^ didnt
            ].
            setAll.
            restartXQuartz.
            did).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         areAllOK = ( |
            | 
            preferenceSlots do: [|:s| (isOK: s) ifFalse: [^ false]].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         assertAllOK = ( |
            | 
            preferenceSlots do: [|:s| [isOK: s] assert]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: adjusting\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         canAdjust = ( |
            | 
            (host osName == 'macOSX')
            && [snapshotAction commandLine excludes: '-headless']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: adjusting\x7fComment: for testing\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         deleteAllPreferences = ( |
            | 
            os command: 'defaults delete org.xquartz.X11').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: setting\x7fCategory: converting\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         flagForSetting: valueMirror = ( |
            | 
            valueMirror isReflecteeInteger ifTrue: [^'int'].
            valueMirror reflectee apply: [|:x| (x = true) || [x = false] ifTrue: [^'bool']. ].
            error: 'unknown type').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: getting\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         getPreference: prefName = ( |
            | 
            valueForGetting: getPreferenceString: prefName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: getting\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         getPreferenceString: prefName = ( |
            | 
            [getPreferenceString: 'enable_key_equivalents'].
            ('defaults read org.xquartz.X11 ', prefName)
            |> [|:v| os outputOfCommand: v Delay: 200 IfFail: [|:e| error: e]]
            |> [|:s| s shrinkwrapped]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         isOK: prefSlot = ( |
            | 
            prefSlot contents reflectee = (getPreference: prefSlot name)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'ModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: preference info\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         preferenceSlots = ( |
            | reflect: prefsAndStringValues).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: preference info\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         prefsAndStringValues = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> 'prefsAndStringValues' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xPreferencesAdjuster prefsAndStringValues.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> 'prefsAndStringValues' -> () From: ( | {
         'Comment: Setting depth to 8 for ui1.\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot'
        
         depth = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> 'prefsAndStringValues' -> () From: ( | {
         'ModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot'
        
         enable_fake_buttons = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> 'prefsAndStringValues' -> () From: ( | {
         'ModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot'
        
         enable_key_equivalents = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> 'prefsAndStringValues' -> () From: ( | {
         'Comment: Disabling X11 authorization for desktop sharing.\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot'
        
         no_auth = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> 'prefsAndStringValues' -> () From: ( | {
         'ModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot'
        
         sync_pasteboard = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> 'prefsAndStringValues' -> () From: ( | {
         'ModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot'
        
         wm_click_through = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: adjusting\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         prompt = ( |
             effects.
            | 
            effects: (
              (preferenceSlots asVector mapBy: [|:s| s comment])
               filterBy: [|:s| s != ''] Into: list copyRemoveAll
            )
              reduceWith: [|:a. :b| a, '\n', b].
            'Will change XQuartz preferences for Self:\n',
            effects, '\n',
            'OK to do it and to restart XQuartz now?').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: adjusting\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         restartXQuartz = ( |
            | 
            'Restarting XQuartz...' printLine.
            os command: 'osascript -e \'tell application "XQuartz" to quit\'' IfFail: [ 'Could not quit XQuartz' printLine. ^ false ].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: setting\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         set: prefSlot = ( |
            | 
            setPreferenceNamed: prefSlot name ToReflecteeOf: prefSlot contents.
            [prefSlot contents reflectee = (getPreference: prefSlot name)] assert).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: setting\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         setAll = ( |
            | 
            preferenceSlots do: [|:s| set: s]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: setting\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         setPreferenceNamed: prefName ToReflecteeOf: valueMirror = ( |
            | 
            'defaults write org.xquartz.X11 ', prefName, ' -', (flagForSetting: valueMirror), ' ', (stringForSetting: valueMirror)
            apply: [|:a| os command: a IfFail: [|:e| 'Could not write XQuartz preference.' printLine. ^ false]].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: setting\x7fCategory: converting\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         stringForSetting: valueMirror = ( |
            | 
            valueMirror isReflecteeInteger ifTrue: [^valueMirror reflectee printString].
            valueMirror reflectee apply: [|:x|
              x = true  ifTrue: [^ 'true'].
              x = false ifTrue: [^ 'false'].
            ].
            error: 'unknown type').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'ModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: public'
        
         testByResettingAndSetting = ( |
            | 
            deleteAllPreferences.
            [areAllOK not] assert.
            setAll.
            assertAllOK).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: getting\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         valueForGetting: s = ( |
            | 
            s = '0' ifTrue: [^ false].
            s = '1' ifTrue: [^ true].
            s = '' ifTrue: [^ nil].
            s asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPreferencesAdjuster' -> () From: ( | {
         'Category: adjusting\x7fModuleInfo: Module: xPreferencesAdjuster InitialContents: FollowSlot\x7fVisibility: private'
        
         warning = bootstrap setObjectAnnotationOf: ( 'Leaving XQuartz preferences alone; Self IDE will not work under X11. See \"Running the UI under X11 (XQuartz) on macOS\" in readme.md. -- claude & dmu 6/2026' copyMutable) From: ( |
             {} = 'ModuleInfo: Creator: globals xPreferencesAdjuster warning.

CopyDowns:
globals byteVector. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 



 '-- Side effects'

 globals modules xPreferencesAdjuster postFileIn
