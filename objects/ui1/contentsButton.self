 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'contentsButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals contentsButton.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         arrow <- bootstrap stub -> 'globals' -> 'nullArrow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         cluster <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         contents <- bootstrap stub -> 'globals' -> 'slotContentsCpt' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         location <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         unpressed = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'contentsButton' -> 'unpressed' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits contentsButton unpressed.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'contentsButton' -> 'unpressed' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot'
        
         contentsButton = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'contentsButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'contentsButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules contentsButton.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'userInterface' -> 'sproutable' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins userInterface sproutable.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'sproutable' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowTo: cpt IsParent: isParent = ( | {
                 'ModuleInfo: Module: contentsButton InitialContents: FollowSlot'
                
                 w.
                } 
            | 
            w: isParent ifTrue: [ boxSizing parentArrowWidth ]
                         False: [ boxSizing dataArrowWidth   ].
            uiArrow copy from: self To: cpt Width: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'sproutable' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         flyIn <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'sproutable' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout: mirr BeginningAt: pt IsParent: isParent Constrain: cb1 To: cb2 = ( |
            | 
                    world findBody: mirr
                           IfFound: [ | :b. arr. w. |
                                      b raise.
                                      world display.
                                      w: isParent ifTrue: [ boxSizing parentArrowWidth ]
                                                   False: [ boxSizing dataArrowWidth   ].
                                      arr: animator createSproutingArrowFrom: self
                                                                          To: b
                                                                       Width: w.
                                      animator sproutWiggleArrow: arr Init: true.
                                      arr ]
                            IfNone: [ | b. arr. t. narr. |
                                  flyIn ifFalse: [
                                      b: world sproutBodyFor: mirr
                                                  Constrain: cb1
                                                         To: cb2.
                                      b animator sproutBody: b
                                                  FromPoint: pt
                                                   HasArrow: true
                                                    FromCpt: self
                                                   IsParent: isParent.
                                      arr: arrowTo: b IsParent: isParent.
                                      b animator displayAndFadeOutAcetate.
                                  ] True: [ | w. toloc. oldbound. |
                                      b: world makeBodyFor: mirr
                                                  Constrain: cb1
                                                         To: cb2.
                                      oldbound: b absoluteBound.
                                      toloc: b location.
                                      b location: b randomHome.
                                      world reclipArrows: oldbound.
                                      arr: b animator arcWiggleNoAntBody: b
                                                 To: toloc
                                                 SproutingArrowFrom: self
                                                 IsParent: isParent.

            "
                                      b: world summonBodyFor: mirr
                                                   Constrain: cb1
                                                          To: cb2.
                                      w: isParent ifTrue: [ boxSizing parentArrowWidth ]
                                                   False: [ boxSizing dataArrowWidth   ].
                                      arr: uiArrow copy createFrom: self
                                                                To: b
                                                             Width: w
                                                               All: world bodies.
                                      animator sproutWiggleArrow: arr Init: true.
            "                      ].
                                      arr ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'sproutable' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         unsprout: arr = ( |
            | unsprout).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits contentsButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteLocationForArrowtail: arr = ( |
            | absoluteCenter + (1@1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteLocationForMovingArrowtail: arrow = ( |
            | 
            absoluteLocationForArrowtail: arrow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         animatedDrawOutlined = ( |
            | 
            world prepareToDrawOnAcetate.
                 drawOn: world windowBitmap
            TranslateBy: absoluteLocation
                NWColor: uiColors arrow
                SEColor: uiColors arrow.
            world prepareToDrawOnAll.
            world syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         animatedDrawPressed = ( |
            | 
            world prepareToDrawOnAcetate.
            drawPressedOn: world windowBitmap TranslateBy: absoluteLocation.
            world prepareToDrawOnAll.
            world syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         animatedDrawUnpressed = ( |
            | 
            world prepareToDrawOnAcetate.
            drawUnpressedOn: world windowBitmap TranslateBy: absoluteLocation.
            world prepareToDrawOnAll.
            world syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot'
        
         changeContentsTo: c IfFail: fb = ( |
            | 
            container changeContentsTo: c IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: containing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot'
        
         componentsDo: block = ( |
            | nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: containing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot'
        
         container = ( |
            | contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         createOn: con = ( |
            | 
            contents: con.
            isSelfReference ifTrue: [ nopress ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         desprout = ( | {
                 'ModuleInfo: Module: contentsButton InitialContents: FollowSlot'
                
                 arr.
                } 
            | 
            arr: arrow.
            unpress.
            arrow: arrow removeFromLists.
            draw.
            world repairBodies: absoluteBound.
            arr animateDesprouting.
            eraseTail.
            world repairBodies: absoluteBound.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         drawInactive = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         drawOn: bm TranslateBy: trans NWColor: nw SEColor: se = ( |
            | 
            bm arcWithin: (bound translateBy: trans)
                    From: 0
                Spanning: 360
                   Color: se.
            bm arcWithin: (bound translateBy: trans)
                    From: 45
                Spanning: 200
                   Color: nw.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         drawPressed = ( |
            | 
            drawPressedOn: body graphic TranslateBy: offsetFromBody).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         drawPressedOn: bm TranslateBy: trans = ( |
            | 
                 drawOn: bm
            TranslateBy: trans
                NWColor: uiColors bodyDark
                SEColor: uiColors bodyLight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         drawTail = ( |
            | 
            body graphic fillCircleCenteredAt: center + (1@1) + offsetFromBody
                                      Diameter: tailDiameter
                                         Color: uiColors arrow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         drawUnpressed = ( |
            | 
            drawUnpressedOn: body graphic TranslateBy: offsetFromBody).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         drawUnpressedOn: bm TranslateBy: trans = ( |
            | 
                 drawOn: bm
            TranslateBy: trans
                NWColor: uiColors bodyLight
                SEColor: uiColors bodyDark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         eraseTail = ( |
            | 
            body graphic fillCircleCenteredAt: center + (1@1) + offsetFromBody
                                      Diameter: tailDiameter
                                         Color: uiColors body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         inactive = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'contentsButton' -> 'inactive' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits contentsButton inactive.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'inactive' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | drawInactive).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'inactive' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         isSprouted = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'inactive' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'contentsButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         isSelfReference = ( |
            | contents containsSelf).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         joinCluster: clust = ( |
            | 
            isSelfReference ifTrue: [ ^ self "don't join" ].
            clust add: self.
            cluster: clust.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         minSize = ( |
            | boxSizing contentsButtonSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: stateChanging\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         nopress = ( |
            | parent: inactive).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         placeAt: pt = ( |
            | location: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: stateChanging\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         press = ( |
            | parent: pressed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         pressed = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits contentsButton pressed.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | drawPressed. drawTail).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         isSprouted = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: leftMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButtonCluster' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: leftMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonAccept = ( |
            | resproutArrow. world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: leftMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonDown = ( |
            | 
            body raise.
            world display.
            leftButton.leftButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: leftMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingAccept: change = ( |
            | 
            change ifTrue: [ animatedDrawOutlined ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: leftMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingReject: change = ( |
            | 
            change ifTrue: [ animatedDrawPressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: leftMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonReject = ( |
            | drawPressed. world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'contentsButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: rightMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: rightMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonAccept = ( |
            | desprout. world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: rightMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonDown = ( |
            | 
            body raise.
            world display.
            rightButton.rightButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: rightMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonPendingAccept: change = ( |
            | 
            change ifTrue: [ animatedDrawUnpressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: rightMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonPendingReject: change = ( |
            | 
            change ifTrue: [ animatedDrawPressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'pressed' -> () From: ( | {
         'Category: rightMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonReject = ( |
            | drawPressed. world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         printStringID = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot'
        
         redrawArrow = ( |
            | 
            isSelfReference ifTrue: [ ^ self ].
            world findBody: contents contentsMirror
                  IfFound: [ | :b |
                             press.
                             draw.
                             arrow: arrowTo: b IsParent: contents isParent. ]
                   IfNone: [ unpress. draw. ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         resize: sz = ( |
            | size: sz).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         resproutArrow = ( |
            | 
            [
            world findBody: contents contentsMirror
                  IfFound: [ | :bod |
                             bod raise.
                             world display.
                             arrow animateSprouting. ]
                   IfNone: [ error: 'should not happen' ]
            ].
            unsprout.
            [sprout].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout = ( |
            | 
            press.
            draw.
            repair.
            sproutToRight.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         sproutAbove = ( | {
                 'ModuleInfo: Module: contentsButton InitialContents: FollowSlot'
                
                 space = 20.
                } 
            | 
            sproutAndConstrain: [ | :b |
                                  b absoluteBound bottomCenter + (0 @ space) ]
                            To: body absoluteBound topCenter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         sproutAndConstrain: b1 To: b2 = ( | {
                 'ModuleInfo: Module: contentsButton InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            c: contents contentsMirror.
            arrow: sprout: c
              BeginningAt: absoluteCenter
                 IsParent: contents isParent
                Constrain: b1 
                       To: b2 .
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         sproutToRight = ( | {
                 'ModuleInfo: Module: contentsButton InitialContents: FollowSlot'
                
                 space = 20.
                } 
            | 
            sproutAndConstrain: [ | :b |
                                  b absoluteBound left @
                                  b sproutCursorPosition y ]
                            To: (body absoluteBound right + space) @
                                absoluteBound center y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         sprouting* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'sproutable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         tailDiameter = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: stateChanging\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         unpress = ( |
            | parent: unpressed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'unpressed' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | drawUnpressed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'unpressed' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         isSprouted = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'unpressed' -> () From: ( | {
         'Category: leftMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButtonCluster' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'unpressed' -> () From: ( | {
         'Category: leftMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonAccept = ( |
            | sprout. world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'unpressed' -> () From: ( | {
         'Category: leftMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonDown = ( |
            | 
            body raise.
            world display.
            leftButton.leftButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'unpressed' -> () From: ( | {
         'Category: leftMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingAccept: change = ( |
            | 
            change ifTrue: [ animatedDrawPressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'unpressed' -> () From: ( | {
         'Category: leftMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingReject: change = ( |
            | 
            change ifTrue: [ animatedDrawUnpressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'unpressed' -> () From: ( | {
         'Category: leftMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonReject = ( |
            | drawUnpressed. world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'unpressed' -> () From: ( | {
         'ModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'contentsButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'unpressed' -> () From: ( | {
         'Category: rightMousing\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> 'unpressed' -> () From: ( | {
         'Category: rightMousing\x7fComment: catch the right mouse, but ignore it\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonDown = ( |
            | 
            body raise.
            world display.
            rightButton.rightButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'contentsButton' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: contentsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         unsprout = ( |
            | 
            unpress.
            arrow: arrow removeFromLists.
            draw.
            eraseTail.
            world repairBodies: absoluteBound.
            self).
        } | ) 



 '-- Side effects'

 globals modules contentsButton postFileIn
