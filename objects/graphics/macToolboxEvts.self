 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fComment: In MacOS, all events from the primitive layer
are created as a clone of this object.\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         eventRecord = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'eventRecord' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'eventRecord' -> () From: ( |
             {} = 'Comment: MacOS specific representation of events.
Only used to create events that can be used in a 
platform independent manner (ui2Event). \x7fModuleInfo: Creator: globals macToolbox eventRecord.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Concrete Events\x7fComment: Used for nrecognized events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macAnyEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macAnyEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macAnyEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'eventRecord' -> () From: ( | {
         'Comment: This parent is assigned according to
the actual value of \'what\' for the 
underlying MacOS event.  That will
provide the proxy with metods that 
are suitable for the given event
type.\x7fModuleInfo: Module: macToolboxEvts InitialContents: InitializeToExpression: (traits macToolbox macAnyEvent)\x7fVisibility: public'
        
         parent* <- bootstrap stub -> 'traits' -> 'macToolbox' -> 'macAnyEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot'
        
         macToolboxEvts = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'macToolboxEvts' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'macToolboxEvts' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules macToolboxEvts.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macToolboxEvts' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macToolboxEvts' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macToolboxEvts' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macToolboxEvts' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macToolboxEvts' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macToolboxEvts' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Concrete Events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macActivateEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macActivateEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macActivateEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macActivateEvent' -> () From: ( | {
         'Category: masks\x7fComment: Bit mask that selects the bit 
in the \'modifiers\' of this 
event which tells whether it
is an activate (bit on) or a 
deactivate (bit off) event.\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         activeFlag = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Abstract Events\x7fComment: Factors out properties shared by all MacOS events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macActivateEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macActivateEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromActivate: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macActivateEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'activateEvent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macAnyEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macAnyEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'otherEvent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Concrete Events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macAutoKeyEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macAutoKeyEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macAutoKeyEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Abstract Events\x7fComment: Factors out common material for keyboard related events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macKeyEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macKeyEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macAutoKeyEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macAutoKeyEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromAutoKey: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macAutoKeyEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'autoKeyEvent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Concrete Events\x7fComment: actually, we forge these\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macCloseEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macCloseEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macCloseEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macCloseEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macCloseEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromClose: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macCloseEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'windowDelete'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Concrete Events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macDiskEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macDiskEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macDiskEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macDiskEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macDiskEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromDiskEvent: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macDiskEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'diskEvent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         activateEvt = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         activeFlag = ( |
            | 1 << activeFlagBit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: state bits\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         activeFlagBit = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         alphaLock = ( |
            | 1 << alphaLockBit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: state bits\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         alphaLockBit = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         anyButtonMask = 7936.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         autoKey = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         btnState = ( |
            | 1 << btnStateBit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: state bits\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         btnStateBit = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         button1Mask = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         button2Mask = 512.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         button3Mask = 1024.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         button4Mask = 2048.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         button5Mask = 4096.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         cmdKey = ( |
            | 
            1 << cmdKeyBit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: state bits\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         cmdKeyBit = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         controlKey = ( |
            | 1 << controlKeyBit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: state bits\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         controlKeyBit = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         controlMask = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: create & destroy\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAsCloseEvent = ( |
            | 
            deadCopy parent: traits macToolbox macCloseEvent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: create & destroy\x7fComment: NB: this method should have had another
name since the primitive which performs
the C-level delete operation should have
had the name \'delete\' (that primitive is
called \'basicDelete\'); however, since 
\'xEvent\' uses this naming scheme we stick
to it, for compatibility.\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            basicDeleteIfFail: ["may be forged event"]. kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         diskEvt = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: iterate\x7fComment: Iterate \'blk\' over all the event types supported.
Each time \'blk\' is invoked on a pair: 
the event object and its type (an integer).\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         eventTypesDo: blk = ( |
             ee.
            | 
            ee: traits macToolbox.
            blk value: ee macActivateEvent  With: activateEvt.
            blk value: ee macAutoKeyEvent   With: autoKey.
            blk value: ee macDiskEvent      With: diskEvt.
            blk value: ee macHighLevelEvent With: kHighLevelEvent.
            blk value: ee macKeyDownEvent   With: keyDown.
            blk value: ee macKeyUpEvent     With: keyUp.
            blk value: ee macMouseDownEvent With: mouseDown.
            blk value: ee macMouseUpEvent   With: mouseUp.
            blk value: ee macNullEvent      With: nullEvent.
            blk value: ee macOSEvent        With: osEvt.
            blk value: ee macUpdateEvent    With: updateEvt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: characteristics\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         hasInputStateInfo = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: characteristics\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         hasLocationInfo = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: create & destroy\x7fComment: Used to initialize \'whatMap\';
should only be called in postFileIn
of the module macEvents\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         initWhatMap = ( |
             map.
            | 
            map: (vector copySize: (maxWhatValue + 1)
                      FillingWith: traits macToolbox macAnyEvent).
            eventTypesDo: [| :traitForWhatValue. :whatValue | 
                map at: whatValue Put: traitForWhatValue IfAbsent: 
                    [|:e| ^error: 'maxWhatValue must be wrong', e]].
            whatMap: map).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: characteristics\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         isMotionEvent = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kHighLevelEvent = 23.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         keyDown = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         keyUp = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         lockMask = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: types\x7fComment: This is used for the creation of whatMap; it 
must be greater than or equal to the greatest
of the values returned by the other slots in
this category, and not excessively large
(since whatMap is a vector with this length).\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         maxWhatValue = ( |
            | kHighLevelEvent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         mod1Mask = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         mod2Mask = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         mod3Mask = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         mod4Mask = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         mod5Mask = 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseDown = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseUp = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         nullEvent = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         optionKey = ( |
            | 1 << optionKeyBit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: state bits\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         optionKeyBit = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         osEvt = 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         rightControlKey = ( |
            | 1 << rightControlKeyBit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: state bits\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         rightControlKeyBit = 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         rightOptionKey = ( |
            | 1 << rightOptionKeyBit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: state bits\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         rightOptionKeyBit = 14.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         rightShiftKey = ( |
            | 1 << rightShiftKeyBit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: state bits\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         rightShiftKeyBit = 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: create & destroy\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         setParent = ( |
            | 
            parent: whatMap at: what).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         shiftKey = ( |
            | 1 << shiftKeyBit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: state bits\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         shiftKeyBit = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         shiftMask = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: characteristics\x7fComment: Returns the time of the event\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         time = ( |
             ticks_per_msec = 0.06.
            | 
            when asFloat /= ticks_per_msec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: characteristics\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'generic'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         updateEvt = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: create & destroy\x7fComment: A finite map that maps each value of the
\'what\' field in native MacOS events to 
a traits object whose methods fit that 
type of event.  Used in \'nextEvent\' and 
\'peekEvent\'.\x7fModuleInfo: Module: macToolboxEvts InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         whatMap <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = ( |
            | 
            'MacOS-macEvent-', typeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> () From: ( | {
         'Category: characteristics\x7fComment: Many events have an associated window. However, if an
event does not, we don\'t want \'evt window\' to return
the window object found in globals! So here we 
implement this method to always fail. Ole Agesen, July 1996.\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         windowIfFail: errBlk = ( |
            | errBlk value: 'I have no window').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Concrete Events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macHighLevelEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macHighLevelEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macHighLevelEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macHighLevelEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macHighLevelEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromHighLevelEvent: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macHighLevelEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'highLevelEvent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Abstract Events\x7fComment: Factors out common material for input events 
like mouse and key events.\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macInputEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macInputEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macInputEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macInputEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Concrete Events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macKeyDownEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyDownEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macKeyDownEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyDownEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyDownEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromKeyDown: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyDownEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'keyDownEvent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: lookup\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         charcode = ( |
            | message && 16rFF).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: characteristics\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         hasInputStateInfo = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeKbdModifierMasks = ( |
            | 
            "See the comment for kbdModifierMasks"
            halt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kBackspaceCharCode = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kBellCharCode = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kClearCharCode = 27.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kDeleteCharCode = 127.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kDownArrowCharCode = 31.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kEndCharCode = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kEnterCharCode = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kEscapeCharCode = 27.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kFormFeedCharCode = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kFunctionKeyCharCode = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kHelpCharCode = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kHomeCharCode = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kLeftArrowCharCode = 28.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kLineFeedCharCode = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kNonBreakingSpaceCharCode = 202.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kNullCharCode = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kPageDownCharCode = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kPageUpCharCode = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kReturnCharCode = 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kRightArrowCharCode = 29.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kTabCharCode = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kUpArrowCharCode = 30.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         kVerticalTabCharCode = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Comment: XXX: the Mac keyboard does not send any key
down events when Cmd/Option/Control/.. is 
pressed, so this (X based) approach will not work.
We have to find another way to achieve the 
same effect.  Question: what is the situation
exactly when this is used (i.e. when newState 
is called)?\x7fModuleInfo: Module: macToolboxEvts InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         kbdModifierMasks = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: lookup\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         keycode = ( |
            | message && 16rFF).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'Category: lookup\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupString = ( |
            | 
            charcode asCharacter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         newState = ( |
            | newStateFrom: state Changing: keycode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         newStateFrom: s Changing: kc = ( |
            | 
            s ^^ (kbdModifierMasks at: kc IfAbsent: 0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macInputEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Concrete Events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macKeyUpEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyUpEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macKeyUpEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyUpEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyUpEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromKeyUp: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macKeyUpEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'keyUpEvent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Concrete Events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macMouseDownEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseDownEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macMouseDownEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Abstract Events\x7fComment: Factors out common material for mouse related events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macMouseEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macMouseEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseDownEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseDownEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromMouseDown: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseDownEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'mouseDownEvent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         button1 = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         button2 = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         button3 = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         button4 = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         button5 = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonName = ( |
            | buttonName: button).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonName: b = ( |
            | 
            b = button1 ifTrue: [ ^ 'left' ].
            b = button2 ifTrue: [ ^ 'middle' ].
            b = button3 ifTrue: [ ^ 'right' ].
            error: 'unknown button').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> () From: ( | {
         'Category: characteristics\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         hasInputStateInfo = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> () From: ( | {
         'Category: characteristics\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         hasLocationInfo = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         newState = ( |
            | newStateFrom: state Changing: button).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         newStateFrom: s Changing: b = ( |
            | 
            b = button1 ifTrue: [ ^ s ^^ button1Mask ].
            b = button2 ifTrue: [ ^ s ^^ button2Mask ].
            b = button3 ifTrue: [ ^ s ^^ button3Mask ].
            error: 'unknown button').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macInputEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Concrete Events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macMouseUpEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseUpEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macMouseUpEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseUpEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseUpEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromMouseUp: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macMouseUpEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'mouseUpEvent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Concrete Events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macNullEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macNullEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macNullEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macNullEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macNullEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromNull: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macNullEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'nullEvent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Concrete Events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macOSEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macOSEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macOSEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macOSEvent' -> () From: ( | {
         'Category: characteristics\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         hasLocationInfo = ( |
            | isMouseMoved).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macOSEvent' -> () From: ( | {
         'Category: characteristics\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         isMotionEvent = ( |
            | isMouseMoved).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macOSEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macOSEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromOSEvent: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macOSEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'osEvent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: events\x7fCategory: Concrete Events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         macUpdateEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macUpdateEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox macUpdateEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macUpdateEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'macEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macUpdateEvent' -> () From: ( | {
         'Category: ui2 events\x7fModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromUpdate: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'macUpdateEvent' -> () From: ( | {
         'ModuleInfo: Module: macToolboxEvts InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'updateEvent'.
        } | ) 



 '-- Side effects'

 globals modules macToolboxEvts postFileIn
