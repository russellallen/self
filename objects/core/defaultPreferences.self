 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


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
         'ModuleInfo: Module: defaultPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
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
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, allow arrowheads to be grabbed, moved, and dropped
	      on other objects.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         allowArrowGrabbing <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If mergeAssignmentSlots is true, then append the following
	      string to the end of each data slot name to indicate the
	      presence of the assignment slot.\x7fModuleInfo: Module: defaultPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         assignmentSlotIndicator: dataSlotName = ( |
            | '  :').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, paint motion blur for arrows.
	      Experimental--dmu 2/91\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         blurArrows <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, paint motion blur for boxes.
	      Experimental--dmu 2/91\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         blurBodies <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Names of X fonts used in the ui.  Use \"xlsfonts\" in a
	      shell to see which fonts are available.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (\'lucidasans\')\x7fVisibility: public'
        
         boxFont <- 'lucidasans'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Names of X fonts used in the ui.  Use \"xlsfonts\" in a
	      shell to see which fonts are available.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (12)\x7fVisibility: public'
        
         boxFontSize <- 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: nil means use a size 2 less than boxFontSize\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         buttonFontSize.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, raises the ui window when left-click on
	      background and lowers ui window when shift-right-click on
	      background.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         clickRaiseLowerUI <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Names of X fonts used in the ui.  Use \"xlsfonts\" in a
	      shell to see which fonts are available.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (\'lucidasanstypewriter\')\x7fVisibility: public'
        
         codeFont <- 'lucidasanstypewriter'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, slot contents are shown in the same bold or italic
	      font as the slot name; otherwise, roman is always used\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         contentsInSpecialFont <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: defaultPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy filesToShow: filesToShow copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Max # of slots to show by default when creating a box\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (5)\x7fVisibility: public'
        
         defaultSlotCountThreshold <- 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Names of X fonts used in the ui.  Use \"xlsfonts\" in a
	      shell to see which fonts are available.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (\'Courier\')\x7fVisibility: public'
        
         editorFont <- 'Courier'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Size of code font in the ui.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (13)\x7fVisibility: public'
        
         editorFontSize <- 13.
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
         'Category: user interface preferences (mostly for ui1)\x7fComment: Allow for user to define the position and size of the UI
	      window - ljb\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (((100)@(100)) # ((500)@(400)))\x7fVisibility: public'
        
         initialWindowRect <- ((100)@(100)) # ((500)@(400)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: if true, text editor isearch ignores case\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         isearchIgnoreCase <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, shows assignment slots combined with the
	      corresponding data slot, rather than as a separate slot.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         mergeAssignmentSlots <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: debugging and programming preferences\x7fComment: If true, defaultBehavior will use beeps at warnings\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         noisy <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: How long a notifier waits around before it auto-dismisses.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (10)\x7fVisibility: public'
        
         notifierWaitTime <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: ui2\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         openCommentWhenMakePublic <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: defaultPreferences InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: debugging and programming preferences\x7fComment: If true, print stack on lookup error, primitive errors,
	      etc.; if false, only print the error message.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         printStackOnError <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         showChangedModules <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, always show an asterisk for a parent slot, regardless of font style.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         showParentStar <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Affects speed of animation.
	      Lower numbers = faster animation.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (10)\x7fVisibility: public'
        
         uiAnimationDelay <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Name of the file to look for containing ui color
	      preferences. If the file is not found, built-in default
	      colors are used.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (\'ui.colors\')\x7fVisibility: public'
        
         uiColorFile <- 'ui.colors'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: if true, ui takes over whole GX+ screen.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         uiFullScreen <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Name of the file to look for containing the X bitmap
	      specification used for the ui icon.  If the file is not
	      found, the default icon provided by the window manager is used.\x7fModuleInfo: Module: defaultPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         uiIconFile <- 'ui.icon'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         useAmpersandToBackground <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, private slots in boxPrivateFont, public slots in
	      boxPublicFont, unmarked slots in boxFont.\x7fModuleInfo: Module: defaultPreferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         useFontStyles <- bootstrap stub -> 'globals' -> 'true' -> ().
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
