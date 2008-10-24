 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: allUI InitialContents: FollowSlot'
        
         allUI = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'allUI' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'allUI' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules allUI.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI' -> () From: ( | {
         'ModuleInfo: Module: allUI InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI' -> () From: ( | {
         'ModuleInfo: Module: allUI InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI' -> () From: ( | {
         'ModuleInfo: Module: allUI InitialContents: FollowSlot'
        
         myComment <- 'Read in all objects in the ui.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI' -> () From: ( | {
         'ModuleInfo: Module: allUI InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI' -> () From: ( | {
         'ModuleInfo: Module: allUI InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- '
	 enumResult

	 slab

	 uiColormap

	 uiColorPalette

	 boxSize
	 boxBitmap
	 uiNester
	 uiWorld
	 boxBlueprint
	 uiBody
	 objBodyRegions
	 objectBody
	 slotCpt
	 uiButton
	 contentsButton
	 slotNameCpt
	 slotContentsCpt

	 menu
	 menuItem
	 hierarchicalMenu

	 menuButton
	 hiddenSlotsButton
	 objectButton
	 slotButton
	 sendButton

	 objBodyTypes

	 animator
	 ui

	 arrowheadCache
	 uiArrow

	 textEditor

	 uiNotifier
	 transcript

	 toggleBody
	 togglers

	 diffUI
	 uiDemo
	 '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: allUI InitialContents: InitializeToExpression: (x11Globals)\x7fVisibility: public'
        
         ui1GraphicsGlobals <- bootstrap stub -> 'globals' -> 'x11Globals' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> () From: ( | {
         'ModuleInfo: Module: allUI InitialContents: FollowSlot\x7fVisibility: public'
        
         userInterface = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'userInterface' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins userInterface.
'.
            | ) .
        } | ) 



 '-- Sub parts'

 bootstrap read: 'enumResult' From: 'ui1'
 bootstrap read: 'slab' From: 'ui1'
 bootstrap read: 'uiColormap' From: 'ui1'
 bootstrap read: 'uiColorPalette' From: 'ui1'
 bootstrap read: 'boxSize' From: 'ui1'
 bootstrap read: 'boxBitmap' From: 'ui1'
 bootstrap read: 'uiNester' From: 'ui1'
 bootstrap read: 'uiWorld' From: 'ui1'
 bootstrap read: 'boxBlueprint' From: 'ui1'
 bootstrap read: 'uiBody' From: 'ui1'
 bootstrap read: 'objBodyRegions' From: 'ui1'
 bootstrap read: 'objectBody' From: 'ui1'
 bootstrap read: 'slotCpt' From: 'ui1'
 bootstrap read: 'uiButton' From: 'ui1'
 bootstrap read: 'contentsButton' From: 'ui1'
 bootstrap read: 'slotNameCpt' From: 'ui1'
 bootstrap read: 'slotContentsCpt' From: 'ui1'
 bootstrap read: 'menu' From: 'ui1'
 bootstrap read: 'menuItem' From: 'ui1'
 bootstrap read: 'hierarchicalMenu' From: 'ui1'
 bootstrap read: 'menuButton' From: 'ui1'
 bootstrap read: 'hiddenSlotsButton' From: 'ui1'
 bootstrap read: 'objectButton' From: 'ui1'
 bootstrap read: 'slotButton' From: 'ui1'
 bootstrap read: 'sendButton' From: 'ui1'
 bootstrap read: 'objBodyTypes' From: 'ui1'
 bootstrap read: 'animator' From: 'ui1'
 bootstrap read: 'ui' From: 'ui1'
 bootstrap read: 'arrowheadCache' From: 'ui1'
 bootstrap read: 'uiArrow' From: 'ui1'
 bootstrap read: 'textEditor' From: 'ui1'
 bootstrap read: 'uiNotifier' From: 'ui1'
 bootstrap read: 'transcript' From: 'ui1'
 bootstrap read: 'toggleBody' From: 'ui1'
 bootstrap read: 'togglers' From: 'ui1'
 bootstrap read: 'diffUI' From: 'ui1'
 bootstrap read: 'uiDemo' From: 'ui1'



 '-- Side effects'

 globals modules allUI postFileIn
