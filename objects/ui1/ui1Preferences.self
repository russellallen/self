 '$Revision:$'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1Preferences InitialContents: FollowSlot'
        
         ui1Preferences = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Preferences' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Preferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1Preferences.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Preferences' -> () From: ( | {
         'ModuleInfo: Module: ui1Preferences InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Preferences' -> () From: ( | {
         'ModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Preferences' -> () From: ( | {
         'ModuleInfo: Module: ui1Preferences InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Preferences' -> () From: ( | {
         'ModuleInfo: Module: ui1Preferences InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Preferences' -> () From: ( | {
         'ModuleInfo: Module: ui1Preferences InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Preferences' -> () From: ( | {
         'ModuleInfo: Module: ui1Preferences InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, allow arrowheads to be grabbed, moved, and dropped
	      on other objects.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         allowArrowGrabbing <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If mergeAssignmentSlots is true, then append the following
	      string to the end of each data slot name to indicate the
	      presence of the assignment slot.\x7fModuleInfo: Module: ui1Preferences InitialContents: FollowSlot\x7fVisibility: public'
        
         assignmentSlotIndicator: dataSlotName = ( |
            | '  :').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, paint motion blur for arrows.
	      Experimental--dmu 2/91\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         blurArrows <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, paint motion blur for boxes.
	      Experimental--dmu 2/91\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         blurBodies <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Names of X fonts used in the ui.  Use \"xlsfonts\" in a
	      shell to see which fonts are available.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (\'lucidasans\')\x7fVisibility: public'
        
         boxFont <- 'lucidasans'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Names of X fonts used in the ui.  Use \"xlsfonts\" in a
	      shell to see which fonts are available.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (12)\x7fVisibility: public'
        
         boxFontSize <- 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: nil means use a size 2 less than boxFontSize\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         buttonFontSize.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, raises the ui window when left-click on
	      background and lowers ui window when shift-right-click on
	      background.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         clickRaiseLowerUI <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Names of X fonts used in the ui.  Use \"xlsfonts\" in a
	      shell to see which fonts are available.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (\'lucidasanstypewriter\')\x7fVisibility: public'
        
         codeFont <- 'lucidasanstypewriter'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, slot contents are shown in the same bold or italic
	      font as the slot name; otherwise, roman is always used\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         contentsInSpecialFont <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Max # of slots to show by default when creating a box\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (5)\x7fVisibility: public'
        
         defaultSlotCountThreshold <- 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Names of X fonts used in the ui.  Use \"xlsfonts\" in a
	      shell to see which fonts are available.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (\'lucidasanstypewriter\')\x7fVisibility: public'
        
         editorFont <- 'lucidasanstypewriter'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Size of code font in the ui.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (12)\x7fVisibility: public'
        
         editorFontSize <- 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Allow for user to define the position and size of the UI
	      window - ljb\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (((100)@(100)) # ((500)@(400)))\x7fVisibility: public'
        
         initialWindowRect <- ((100)@(100)) # ((500)@(400)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: if true, text editor isearch ignores case\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         isearchIgnoreCase <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, shows assignment slots combined with the
	      corresponding data slot, rather than as a separate slot.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         mergeAssignmentSlots <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: How long a notifier waits around before it auto-dismisses.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (10)\x7fVisibility: public'
        
         notifierWaitTime <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         showChangedModules <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, always show an asterisk for a parent slot, regardless of font style.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         showParentStar <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Affects speed of animation.
	      Lower numbers = faster animation.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (10)\x7fVisibility: public'
        
         uiAnimationDelay <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Name of the file to look for containing ui color
	      preferences. If the file is not found, built-in default
	      colors are used.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (\'ui.colors\')\x7fVisibility: public'
        
         uiColorFile <- 'ui.colors'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: if true, ui takes over whole GX+ screen.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         uiFullScreen <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: Name of the file to look for containing the X bitmap
	      specification used for the ui icon.  If the file is not
	      found, the default icon provided by the window manager is used.\x7fModuleInfo: Module: ui1Preferences InitialContents: FollowSlot\x7fVisibility: public'
        
         uiIconFile <- 'ui.icon'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fComment: If true, private slots in boxPrivateFont, public slots in
	      boxPublicFont, unmarked slots in boxFont.\x7fModuleInfo: Module: ui1Preferences InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         useFontStyles <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 



 '-- Side effects'

 globals modules ui1Preferences postFileIn
