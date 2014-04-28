 '
Written by Michael Huebner <Michael.Huebner@PrakInf.TU-Ilmenau.DE>.
Added to the contrib area by Mario Wolczko <Mario.Wolczko@eng.sun.com>.

See self-interest, Nov 95, for more details.

'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: scroll InitialContents: FollowSlot'
        
         scroll = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'scroll' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'scroll' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules scroll.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scroll' -> () From: ( | {
         'ModuleInfo: Module: scroll InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scroll' -> () From: ( | {
         'ModuleInfo: Module: scroll InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scroll' -> () From: ( | {
         'ModuleInfo: Module: scroll InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scroll' -> () From: ( | {
         'ModuleInfo: Module: scroll InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            transporter moduleDictionary resetFillingSemaphore.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: transporter moduleDictionary
                           Selector: 'resetFillingSemaphore'.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scroll' -> () From: ( | {
         'ModuleInfo: Module: scroll InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.1.1.1 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scroll' -> () From: ( | {
         'ModuleInfo: Module: scroll InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: scroll InitialContents: FollowSlot\x7fVisibility: public'
        
         scrollMorph = bootstrap define: bootstrap stub -> 'globals' -> 'scrollMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'scrollMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals scrollMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: scroll InitialContents: FollowSlot\x7fVisibility: public'
        
         scrollMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'scrollMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits scrollMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scrollMorph' -> () From: ( | {
         'ModuleInfo: Module: scroll InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'scrollMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scrollMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: scroll InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | scrollMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scrollMorph' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: scroll InitialContents: InitializeToExpression: (0)'
        
         x_off <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scrollMorph' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: scroll InitialContents: InitializeToExpression: (0)'
        
         y_off <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'scrollMorph' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: scroll InitialContents: FollowSlot'
        
         actualStart = ( |
            | x_off @ y_off).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'scrollMorph' -> () From: ( | {
         'Category: event dispatching\x7fModuleInfo: Module: scroll InitialContents: FollowSlot'
        
         allowSubmorphsToGetEvent: evt = ( |
            | globalBaseBounds includes: evt cursorPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'scrollMorph' -> () From: ( | {
         'Category: contents handling\x7fModuleInfo: Module: scroll InitialContents: FollowSlot'
        
         contents = ( |
            | 
            0 = morphCount
            ifTrue: [^morph].
              ^firstMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'scrollMorph' -> () From: ( | {
         'Category: event dispatching\x7fComment: Attempt to handle the given event. If the event is not
handled, return the special dropThroughMarker object.\x7fModuleInfo: Module: scroll InitialContents: FollowSlot\x7fVisibility: public'
        
         dispatchEvent: evt At: globalPt = ( |
            | 
            "Details: First, give submorphs a chance to handle the event.
             If no submorph handles the event, let the receiver try to
             handle it. If even this fails, return the dropThroughMarker."

            dropEvent: evt OnSubmorphsAt: globalPt - actualStart IfHandled: [ ^self ].
            dropEvent: evt OnBaseAt: globalPt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'scrollMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: scroll InitialContents: FollowSlot'
        
         drawOn: aCanvas = ( |
            | 
            baseDrawOn: aCanvas.
            0 = morphCount
              ifFalse: [aCanvas withClip: baseBounds Do:
                [|c| c: (aCanvas copyOffset: position + actualStart).
                morphsReverseDo: [| :m | m drawOn: c]]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'scrollMorph' -> () From: ( | {
         'Category: contents handling\x7fModuleInfo: Module: scroll InitialContents: FollowSlot'
        
         noStickOuts = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'scrollMorph' -> () From: ( | {
         'Category: contents handling\x7fModuleInfo: Module: scroll InitialContents: FollowSlot'
        
         noStickOuts: arg = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'scrollMorph' -> () From: ( | {
         'ModuleInfo: Module: scroll InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'scrollMorph' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: scroll InitialContents: FollowSlot'
        
         scrollY: value = ( |
             origExtent.
             clipExtent.
             spaceToScroll.
             new_y_off <- 0.
            | 
            "called when using the scrollbar, value in [0.0, 100.0]"
            origExtent: contents height.
            clipExtent: baseBounds height.
            spaceToScroll: origExtent - clipExtent.
            spaceToScroll > 0 ifTrue: [ 
              new_y_off: (((value/ 100) - 1) * spaceToScroll) asInteger].
            y_off = new_y_off ifFalse: [ y_off: new_y_off. changed ]).
        } | ) 



 '-- Side effects'

 globals modules scroll postFileIn

