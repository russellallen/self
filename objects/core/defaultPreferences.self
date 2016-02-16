 '30.10.0-prerelease1'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: defaultPreferences InitialContents: FollowSlot'
        
         defaultPreferences = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'defaultPreferences' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'defaultPreferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules defaultPreferences.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'defaultPreferences' -> () From: ( | {
         'ModuleInfo: Module: defaultPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'defaultPreferences' -> () From: ( | {
         'ModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'defaultPreferences' -> () From: ( | {
         'ModuleInfo: Module: defaultPreferences InitialContents: FollowSlot'
        
         myComment <- 'default user preferences'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'defaultPreferences' -> () From: ( | {
         'ModuleInfo: Module: defaultPreferences InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            'preferences.self' _RunScriptIfFail: nil.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'defaultPreferences' -> () From: ( | {
         'ModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (\'30.10.0-prerelease1\')\x7fVisibility: public'
        
         revision <- '30.10.0-prerelease1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'defaultPreferences' -> () From: ( | {
         'ModuleInfo: Module: defaultPreferences InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: defaultPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         preferences = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals preferences.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: defaultPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy filesToShow: filesToShow copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: debugging and programming preferences\x7fComment: If non-empty, filter debugging operations according
	      these files --dmu 12/16\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: public'
        
         filesToShow <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Multiprocessor machines currently can cause random colormaps to be installed (especially when moving objects).  If this preference is set to true, colormaps are installed immediately, meaning an X sync is performed, which seems to get around the problem.  However, this fix slows down remote ui performance.\x7fModuleInfo: Module: defaultPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         fixMultiprocessorColormapBugButSlowDownRemoteUI <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (true)'
        
         highlightParseError <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: debugging and programming preferences\x7fComment: If true, defaultBehavior will use beeps at warnings\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         noisy <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         openCommentWhenMakePublic <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: defaultPreferences InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'preferences' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals preferences parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: defaultPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: debugging and programming preferences\x7fComment: If true, print stack on lookup error, primitive errors,
	      etc.; if false, only print the error message.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         printStackOnError <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         useAmpersandToBackground <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Which screen to run on.  Note that the OpenWindows X server
	      seems to have a performance bug: if the display is opened with
	      the hostname prefix (e.g., hostname:0.0), the X performance is
	      bad, even if running locally.  So for best results, leave off the
	      hostname prefix when specifying the X display.

Except that, as of 12/07, it needs to be :0. -- dmu\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (\':0\')\x7fVisibility: public'
        
         xDisplay <- ':0'.
        } | ) 



 '-- Side effects'

 globals modules defaultPreferences postFileIn
