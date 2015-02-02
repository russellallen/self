 '$Revision: 30.4 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Keyboard\x7fModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: public'
        
         keyCapCombo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCapCombo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCapCombo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> () From: ( | {
         'ModuleInfo: Module: keyCapCombos InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         event.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> () From: ( | {
         'ModuleInfo: Module: keyCapCombos InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         modifierKeyCaps.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> () From: ( | {
         'ModuleInfo: Module: keyCapCombos InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         nonmodifierKeyCap.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> () From: ( | {
         'ModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCapCombo' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCapCombo parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: public'
        
         = o = ( |
            | 
                (nonmodifierKeyCap = o nonmodifierKeyCap       )
            && [(controlIsDown     = o controlIsDown)
            && [(   metaIsDown     = o    metaIsDown)
            && [( optionIsDown     = o  optionIsDown)
            && [(  shiftIsDown     = op  shiftIsDown)]]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> 'parent' -> () From: ( | {
         'Category: modifier keys\x7fModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: public'
        
         altIsDown = ( |
            | 
            modifierKeyCaps includes: keyCaps oddballs alt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> 'parent' -> () From: ( | {
         'Category: handling\x7fModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: public'
        
         beHandledBy: h IfCannot: b = ( |
            | 
            "This could certainly be done by dispatching through the modifier keyCap objects,
             but I'm wondering whether we'll want to have more complex logic here in the
             future. What if there are multiple modifiers down?

             In the future (and probably pretty soon, even), I'm expecting that we'll want
             to move to a completely different scheme (probably involving looking up
             command objects in a table or something), and all of this will be moot. -- Adam, 2/04"

            includesModifierOtherThanShift not ifTrue: [^  h handlePressWithNoModifiers: self IfCannot: b].
               metaIsDown                      ifTrue: [^  h handlePressWithMetaDown:    self IfCannot: b].
            controlIsDown                      ifTrue: [^  h handlePressWithControlDown: self IfCannot: b].
            commandIsDown                      ifTrue: [^  h handlePressWithCommandDown: self IfCannot: b].
             optionIsDown                      ifTrue: [^  h handlePressWithOptionDown:  self IfCannot: b].
                altIsDown                      ifTrue: [^  h handlePressWithAltDown:     self IfCannot: b].
            b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> 'parent' -> () From: ( | {
         'Category: modifier keys\x7fModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: public'
        
         commandIsDown = ( |
            | 
            modifierKeyCaps includes: keyCaps oddballs command).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> 'parent' -> () From: ( | {
         'Category: modifier keys\x7fModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: public'
        
         controlIsDown = ( |
            | 
            modifierKeyCaps includes: keyCaps oddballs control).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
                 nonmodifierKeyCap hash
            ^^ ( controlIsDown asInteger << 17)
            ^^ (    metaIsDown asInteger << 18)
            ^^ (  optionIsDown asInteger << 19)
            ^^ (   shiftIsDown asInteger << 20)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> 'parent' -> () From: ( | {
         'Category: modifier keys\x7fModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: public'
        
         includesModifierOtherThanShift = ( |
            | 
            (modifierKeyCaps copyFilteredBy: [|:k| keyCaps oddballs shift != k]) isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> 'parent' -> () From: ( | {
         'Category: modifier keys\x7fModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: public'
        
         metaIsDown = ( |
            | 
            modifierKeyCaps includes: keyCaps oddballs meta).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> 'parent' -> () From: ( | {
         'Category: modifier keys\x7fModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: public'
        
         optionIsDown = ( |
            | 
            modifierKeyCaps includes: keyCaps oddballs option).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCapCombo' -> 'parent' -> () From: ( | {
         'Category: modifier keys\x7fModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: public'
        
         shiftIsDown = ( |
            | 
            modifierKeyCaps includes: keyCaps oddballs shift).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: keyCapCombos InitialContents: FollowSlot'
        
         keyCapCombos = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'keyCapCombos' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'keyCapCombos' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules keyCapCombos.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'keyCapCombos' -> () From: ( | {
         'ModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'keyCapCombos' -> () From: ( | {
         'ModuleInfo: Module: keyCapCombos InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'keyCapCombos' -> () From: ( | {
         'ModuleInfo: Module: keyCapCombos InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'keyCapCombos' -> () From: ( | {
         'ModuleInfo: Module: keyCapCombos InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'keyCapCombos' -> () From: ( | {
         'ModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.4 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'keyCapCombos' -> () From: ( | {
         'ModuleInfo: Module: keyCapCombos InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules keyCapCombos postFileIn
