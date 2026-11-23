 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1Morph InitialContents: FollowSlot'

         ui1Morph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Morph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Morph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1Morph.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Morph' -> () From: ( | {
         'ModuleInfo: Module: ui1Morph InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Morph' -> () From: ( | {
         'ModuleInfo: Module: ui1Morph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Morph' -> () From: ( | {
         'ModuleInfo: Module: ui1Morph InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: slots David Ungar added to self64\'s morph module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Morph' -> () From: ( | {
         'ModuleInfo: Module: ui1Morph InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Morph' -> () From: ( | {
         'ModuleInfo: Module: ui1Morph InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: damage management\x7fModuleInfo: Module: ui1Morph InitialContents: FollowSlot\x7fVisibility: public'
        
         xxxOldChanged = ( |
             bnds.
             deltaP.
             pX <- 0.
             pY <- 0.
             w.
            | 
            "Report that the area occupied by this morph should be redrawn."
            "Details: This method is an optimized version of:
                w: world.
                w isWorldMorph ifTrue: [
                    w damaged: globalBounds.
                ].
            This optimization traverses the chain to the world only once.
            Does nothing if the morph is not in the world."

            w: owner ifNil: [ ^self ].
            [w isWorldMorph] whileFalse: [| wPos |
                wPos: w position.
                pX: pX + wPos x.
                pY: pY + wPos y.
                w: w owner ifNil: [ ^self ].
            ].
            bnds: bounds.
            deltaP: pX @ pY.
            w damaged:
                (rectangle copyX: deltaP + bnds origin
                               Y: deltaP + bnds corner + shadowOffset "xxx").
            self).
        } | ) 



 '-- Side effects'

 globals modules ui1Morph postFileIn
