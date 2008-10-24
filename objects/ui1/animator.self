 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         dummyAnimator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'dummyAnimator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals dummyAnimator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         dummyAnimator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits dummyAnimator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dummyAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'dummyAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dummyAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         uiColors <- bootstrap stub -> 'globals' -> 'uiColorPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dummyAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         uiPatterns <- bootstrap stub -> 'globals' -> 'uiPatternPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dummyAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         world <- bootstrap stub -> 'globals' -> 'uiWorld' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot'
        
         animator = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'animator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'animator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules animator.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'animator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'animator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'animator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'animator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'animator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         realAnimator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals realAnimator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         acetateFadeOutMaps <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         acetateFadeOutMapsFast <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot'
        
         anticipationMagnitude <- 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         cachedAcetateFadeOutMaps <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         cachedAcetateFadeOutMapsFast <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         delay <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot'
        
         noAnticipation <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot'
        
         noFollowThrough <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot'
        
         noSlowInOut <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         realAnimator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits realAnimator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'realAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot'
        
         straightLines <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         uiColors <- bootstrap stub -> 'globals' -> 'uiColorPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         uiPatterns <- bootstrap stub -> 'globals' -> 'uiPatternPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot'
        
         wiggleMagnitude <- 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         world <- bootstrap stub -> 'globals' -> 'uiWorld' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         accelerateBody: bod To: dest = ( |
            | 
            moveBody: bod To: dest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: wiggling\x7fModuleInfo: Module: animator InitialContents: FollowSlot'
        
         arcAnticipateBody: bod To: pt = ( |
            | moveBody: bod To: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: wiggling\x7fModuleInfo: Module: animator InitialContents: FollowSlot'
        
         arcWiggleBody: bod To: pt = ( |
            | moveBody: bod To: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         convertColormaps = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         createCachedColormapsUI: ui = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: wiggling\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         createSproutingArrowFrom: f To: t Width: w = ( |
            | 
            uiArrow copy from: f To: t Width: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         decelerateBody: bod To: dest = ( |
            | 
            moveBody: bod To: dest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         delay: x = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteCachedColormaps = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteColormaps = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: arrowSprouting\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         desproutArrow: a = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         desproutArrowsArcAnticipateBody: bod To: dest = ( |
            | 
            moveBody: bod To: dest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         displayAndFadeOutAcetate = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: slidingRegion\x7fModuleInfo: Module: animator InitialContents: FollowSlot'
        
         hideRegion: origrect OfBody: bod SlotCpt: sb = ( |
            | 
            bod hide: sb.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: morphing\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         hideSlot: sb OfBody: bod = ( |
            | 
            bod hide: sb.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         invalidateAllColormaps = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         makeAndConvertColormapsFor: x = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         moveBody: bod To: dest = ( |
            | 
            world teleportBody: bod To: dest.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: slidingRegion\x7fModuleInfo: Module: animator InitialContents: FollowSlot'
        
         ripOutRegion: origrect Of: bod = ( |
            | 
            "assumes bod is an objectBody!"
            world myUI requestUpdate: bod objMirror.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: arrowSprouting\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutArrow: a = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutBody: nb FromPoint: pt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutBody: nb FromPoint: pt HasArrow: hasArrow FromCpt: cpt IsParent: isParent = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: wiggling\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutWiggleArrow: arr Init: init = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: wiggling\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         wiggleBody: bod Direction: dir = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dummyAnimator' -> () From: ( | {
         'Category: morphing\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         zoomSlab: s To: e = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         accelerateBody: bod To: dest = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 antiB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dir.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dropB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dropB_proto <- bootstrap stub -> 'globals' -> 'acceleratingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 steps = 8.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 x.
                } 
            | 
            noAnticipation ifTrue: [ moveBody: bod To: dest ].
            noSlowInOut ifTrue: [ dropB_proto: linearInBetweener ].

            dir: dest - bod location.
            dir = (0@0) ifTrue: [ ^ self ].
            x: bod location - (dir normalize * anticipationMagnitude).
            antiB: (linearInBetweener copyFrom: bod location To: x Steps: 1) delay: delay.
            dropB: (dropB_proto copyFrom: x To: dest Steps: steps) delay: delay.
            moveBody: bod InBetweeners: (antiB & dropB) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: slidingRegion\x7fModuleInfo: Module: animator InitialContents: FollowSlot'
        
         animateSliver: sliver With: tweener StartingAt: pt = ( |
             blurRect <- ((-1)@(-1)) #! ((0)@(0)).
             newRect.
             oldRect.
            | 
            oldRect: pt ##! sliver size.
            tweener do: [ | :pt. blur. |
              newRect: oldRect translateTo: pt.
              sliver copyTo: world windowBitmap At: pt.
              preferences blurBodies ifTrue: [
                  (blurRect deltaList: newRect) do: [ | :r |
                      world eraseAcetate: r ].
                  blur: oldRect skippedAreaTo: newRect.
                  world windowBitmap fillPolygon: blur
                                         Pattern: uiPatterns blurBody
                                           Color: uiColors body.
                  blurRect: oldRect union: newRect.
              ] False: [
                  (oldRect deltaList: newRect) do: [ | :r |
                      world eraseAcetate: r ].
              ].
              world syncGraphics.
              oldRect: newRect. ].
            (blurRect deltaList: newRect) do: [ | :r |
              world eraseAcetate: r ].
            world syncGraphics.
            newRect).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         anticipateBody: bod To: dest = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 antiB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dir.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inB_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 steps = 8.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 x.
                } 
            | 
            noAnticipation ifTrue: [ moveBody: bod To: dest ].
            noSlowInOut ifTrue: [ inB_proto: linearInBetweener ].

            dir: dest - bod location.
            dir = (0@0) ifTrue: [ ^ self ].
            x: bod location - (dir normalize * anticipationMagnitude).
            antiB: (linearInBetweener copyFrom: bod location To: x Steps: 1) delay: delay.
            inB: (inB_proto copyFrom: x To: dest Steps: steps.) delay: delay.
            moveBody: bod InBetweeners: (antiB & inB) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         arcAnticipateBody: bod To: dest = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 antiB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 bubB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dir.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 save.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 steps = 8.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 x.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 xB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 yB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 yB_proto <- bootstrap stub -> 'globals' -> 'acceleratingInBetweener' -> ().
                } 
            | 
            straightLines ifTrue: [ ^ accelerateBody: bod To: dest ].
            noAnticipation ifTrue: [ ^ arcBody: bod To: dest ].
            noSlowInOut ifTrue: [ yB_proto: linearInBetweener ].

            xB: (peakingInBetweener copyFrom: bod location x
                                         To: dest x
                                      Steps: steps).
            yB: (yB_proto copyFrom: bod location y
                                              To: dest y
                                           Steps: steps).
            inB: jointInBetweener copy.
            inB xib: xB.
            inB yib: yB.

            bubB: list copyRemoveAll.
            inB do: [ | :p | bubB addLast: p ].

            inB xib delay: delay.
            inB yib delay: delay.

            inB xib reset: steps.
            inB yib reset: steps.

            save: bubB removeFirst.
            dir: bubB first - bod location.

            dir = (0@0) ifTrue: [ ^ self ].
            x: bod location - (dir normalize * anticipationMagnitude).
            antiB: (linearInBetweener copyFrom: bod location To: x Steps: 1)
                   delay: delay.

            moveBody: bod InBetweeners: (antiB & inB) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         arcBody: bod To: dest = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 steps = 8.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 xB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 yB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 yB_proto <- bootstrap stub -> 'globals' -> 'acceleratingInBetweener' -> ().
                } 
            | 
            straightLines ifTrue: [ ^ moveBody: bod To: dest ].
            noSlowInOut ifTrue: [ yB_proto: linearInBetweener ].

            xB: (peakingInBetweener copyFrom: bod location x
                                         To: dest x
                                      Steps: steps) delay: delay.
            yB: (yB_proto copyFrom: bod location y
                                              To: dest y
                                           Steps: steps) delay: delay.
            inB: jointInBetweener copy.
            inB xib: xB.
            inB yib: yB.

            moveBody: bod InBetweeners: vector copySize: 1 FillingWith: inB).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         arcWiggleBody: bod To: dest = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 antiB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 bubB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 d.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dir.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dp.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dropB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dropB_proto <- bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 save.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 steps = 8.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 vantiB_proto <- bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 wigB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 x.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 xB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 xB_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 yB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 yB_proto <- bootstrap stub -> 'globals' -> 'acceleratingInBetweener' -> ().
                } 
            | 
            straightLines ifTrue: [ ^ moveAntWiggleBody: bod To: dest ].
            noAnticipation ifTrue: [ ^ arcWiggleNoAntBody: bod To: dest ].
            noFollowThrough ifTrue: [ ^ arcAnticipateBody: bod To: dest ].
            noSlowInOut ifTrue: [
                xB_proto: linearInBetweener.
                dropB_proto: linearInBetweener.
                vantiB_proto: linearInBetweener.
            ].

            xB: (xB_proto copyFrom: bod location x
                                         To: dest x
                                      Steps: steps).
            yB: (yB_proto copyFrom: bod location y
                                              To: dest y
                                           Steps: steps).
            inB: jointInBetweener copy.
            inB xib: xB.
            inB yib: yB.

            bubB: list copyRemoveAll.
            inB do: [ | :p | bubB addLast: p ].

            inB xib delay: delay.
            inB yib delay: delay.

            inB xib reset: steps.
            inB yib reset: steps.

            save: bubB removeFirst.
            dir: bubB first - bod location.
            dir = (0@0) ifTrue: [ ^ self ].
            x: bod location - (dir normalize * anticipationMagnitude).
            antiB: (linearInBetweener copyFrom: bod location To: x Steps: 1)
                   delay: delay.

            dp:  bubB removeLast.
            dir: dest - bubB last.

            d: (dir normalize * wiggleMagnitude) asInteger.

            dropB: (dropB_proto copyFrom: dest
                                                 To: dest + d
                                              Steps: 1) delay: delay.
            wigB: collector copyFirst: dropB.
            [ d != (0@0) ] whileTrue: [ | dn. vantiB. |
                dn: d negate / 2.
                vantiB: (vantiB_proto copyFrom: dest + d
                                                     To: dest + dn
                                                  Steps: 1) delay: delay.
                wigB: wigB & vantiB.
                d: dn.
            ].
            wigB: wigB asList.


            moveBody: bod InBetweeners: ((wigB addFirst: inB) addFirst: antiB)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         arcWiggleNoAntBody: bod To: dest = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 bubB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 d.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dir.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dropB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dropB_proto <- bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 save.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 steps = 8.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 vantiB_proto <- bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 wigB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 x.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 xB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 xB_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 yB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 yB_proto <- bootstrap stub -> 'globals' -> 'acceleratingInBetweener' -> ().
                } 
            | 
            straightLines ifTrue: [ ^ moveWiggleBody: bod To: dest ].
            noFollowThrough ifTrue: [ ^ arcBody: bod To: dest ].
            noSlowInOut ifTrue: [
                xB_proto: linearInBetweener.
                dropB_proto: linearInBetweener.
                vantiB_proto: linearInBetweener.
            ].

            xB: (xB_proto copyFrom: bod location x
                                         To: dest x
                                      Steps: steps).
            yB: (yB_proto copyFrom: bod location y
                                              To: dest y
                                           Steps: steps).
            inB: jointInBetweener copy.
            inB xib: xB.
            inB yib: yB.

            dir: dest - bod location.

            d: (dir normalize * wiggleMagnitude) asInteger.

            dropB: (dropB_proto copyFrom: dest
                                                 To: dest + d
                                              Steps: 1) delay: delay.
            wigB: collector copyFirst: dropB.
            [ d != (0@0) ] whileTrue: [ | dn. vantiB. |
                dn: d negate / 2.
                vantiB: (vantiB_proto copyFrom: dest + d
                                                     To: dest + dn
                                                  Steps: 1) delay: delay.
                wigB: wigB & vantiB.
                d: dn.
            ].
            wigB: wigB asList.

            moveBody: bod InBetweeners: (wigB addFirst: inB)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         arcWiggleNoAntBody: bod To: dest SproutingArrowFrom: cpt IsParent: isParent = ( |
             bubB.
             d.
             dir.
             dropB.
             dropB_proto <- bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> ().
             inB.
             narr.
             save.
             slb.
             steps = 8.
             t.
             tweener.
             vantiB_proto <- bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> ().
             wigB.
             x.
             xB.
             xB_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
             yB.
             yB_proto <- bootstrap stub -> 'globals' -> 'acceleratingInBetweener' -> ().
            | 

            "FACTOR OUT THE SPROUTING ARROW STUFF SO THAT THEY CAN BE APPLIED TO THESE"
                        straightLines ifTrue: [ ^ moveWiggleBody: bod To: dest ].
                        noFollowThrough ifTrue: [ ^ arcBody: bod To: dest ].




                        noSlowInOut ifTrue: [
                            xB_proto: linearInBetweener.
                            dropB_proto: linearInBetweener.
                            vantiB_proto: linearInBetweener.
                        ].

                        xB: (xB_proto copyFrom: bod location x
                                                     To: dest x
                                                  Steps: steps).
                        yB: (yB_proto copyFrom: bod location y
                                                          To: dest y
                                                       Steps: steps).
                        inB: jointInBetweener copy.
                        inB xib: xB.
                        inB yib: yB.

                        dir: dest - bod location.

                        d: (dir normalize * wiggleMagnitude) asInteger.

                        dropB: (dropB_proto copyFrom: dest
                                                             To: dest + d
                                                          Steps: 1) delay: delay.
                        wigB: collector copyFirst: dropB.
                        [ d != (0@0) ] whileTrue: [ | dn. vantiB. |
                            dn: d negate / 2.
                            vantiB: (vantiB_proto copyFrom: dest + d
                                                                 To: dest + dn
                                                              Steps: 1) delay: delay.
                            wigB: wigB & vantiB.
                            d: dn.
                        ].
                        wigB: wigB asList.


                            t: isParent ifTrue: [ world boxSizing parentArrowWidth ]
                                         False: [ world boxSizing dataArrowWidth   ].

                        slb: slab copyFromRect: dest ##! bod size.
                        narr: uiArrow copy from: cpt To: bod Width: t.
                        bod animateToArrowsSetup.
                        narr setToCpt: slb.
                        tweener: xB_proto copyFrom: narr tail To: narr head Steps: steps.

                        narr setHead: narr tail.
                        world moveBody: bod Doing: [ | :worldMoveBlock | 
                            inB do: [ | :pt. hd. |  
                                    hd: tweener step value.
                                    narr setHead: hd.
                                    worldMoveBlock value: pt. 
                                    world syncGraphics. 
                            ].
                            narr setToCpt: bod.
                            bod animateToArrowsTakedown.
                            wigB do: [ | :ib |
                                ib do: [ | :pt |
                                    worldMoveBlock value: pt. 
                                    world syncGraphics. 
                                ].
                            ].
                        ].
                        narr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         convertColormaps = ( |
            | 
            acetateFadeOutMaps do: [ | :cm. :i. |
                cm colorsFromCache: cachedAcetateFadeOutMaps at: i ].
            acetateFadeOutMapsFast do: [ | :cm. :i. |
                cm colorsFromCache: cachedAcetateFadeOutMapsFast at: i ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         createCachedColormapsUI: ui = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 ncm.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 ocm.
                } 
            | 
            ocm: ui cachedColormap0.
            ncm: ui cachedColormapNoAcetate.
            cachedAcetateFadeOutMaps: createMapSeriesFrom: ocm
                                                       To: ncm
                                                    Steps: dissolveSteps.
            cachedAcetateFadeOutMapsFast: createMapSeriesFrom: ocm
                                                           To: ncm
                                                       Steps: fastDissolveSteps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         createMapSeriesFrom: f To: t Steps: s = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 fastF.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 fastT.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 ib.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 r.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 scale = 1000000.
                } 
            | 
            'creating colormap series . . . ' print.
            r: vector copySize: s succ. "one extra for endpoint"
            ib: peakingInBetweener copyFrom: 0 To: scale Steps: s.
            fastF: vector copySize: 256.
            fastT: vector copySize: 256.
            256 do: [|:i| fastF at: i Put: (f at: i) "asHSB" asRGB].
            256 do: [|:i| fastT at: i Put: (t at: i) "asHSB" asRGB].

            r size do: [| :i. v. cm. |
                v: fastF interpolate: ib value /= scale From: fastT.
                cm: f copyWithRep: cachedColormap copy.
                256 do: [|:i| cm at: i Put: (v at: i) asRGB].
                r at: i Put: cm.
                ib step.
                '. ' print.
            ].
            'done.' printLine.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: wiggling\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         createSproutingArrowFrom: f To: t Width: w = ( |
            | 
            uiArrow copy createFrom: f To: t Width: w All: world bodies).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         decelerateBody: bod To: dest = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inBs.
                } 
            | 
            inBs: inBetweenersForDecelerateWiggleBody: bod
                                             Start: bod location
                                               End: dest
                                         Direction: dest - bod location.
            moveBody: bod InBetweeners: inBs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteCachedColormaps = ( |
            | 
            cachedAcetateFadeOutMaps do: [ | :cm | cm delete ].
            cachedAcetateFadeOutMapsFast do: [ | :cm | cm delete ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteColormaps = ( |
            | 
            acetateFadeOutMaps do: [ | :cm | cm delete ].
            acetateFadeOutMapsFast do: [ | :cm | cm delete ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: arrowSprouting\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         desproutArrow: a = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 pib_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
                } 
            | 
            noSlowInOut ifTrue: [ pib_proto: linearInBetweener ].

            world prepareToDrawOnAllButArrow0.
            world display.
            world prepareToDrawOnArrow0.
            ((pib_proto copyFrom: a head To: a tail Steps: 8)
               delay: delay) do: [ | :pt |
                world eraseArrow0.
                ((a copy setHead: pt) setTail: a tail)
                  drawOn: world windowBitmap Color: uiColors ones.
                world syncGraphics.
             ].
            world eraseArrow0.
            world prepareToDrawOnAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         desproutArrowsArcAnticipateBody: bod To: dest = ( |
             antiB.
             bubB.
             dir.
             fromTweeners.
             inB.
             pib_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
             save.
             steps = 8.
             toTweeners.
             x.
             xB.
             yB.
             yB_proto <- bootstrap stub -> 'globals' -> 'acceleratingInBetweener' -> ().
            | 
                        straightLines ifTrue: [ ^ accelerateBody: bod To: dest ].
                        noAnticipation ifTrue: [ ^ arcBody: bod To: dest ].
                        noSlowInOut ifTrue: [ yB_proto: linearInBetweener ].

                        xB: (peakingInBetweener copyFrom: bod location x
                                                     To: dest x
                                                  Steps: steps).
                        yB: (yB_proto copyFrom: bod location y
                                                          To: dest y
                                                       Steps: steps).
                        inB: jointInBetweener copy.
                        inB xib: xB.
                        inB yib: yB.

                        bubB: list copyRemoveAll.
                        inB do: [ | :p | bubB addLast: p ].

                        inB xib delay: delay.
                        inB yib delay: delay.

                        inB xib reset: steps.
                        inB yib reset: steps.

                        save: bubB removeFirst.
                        dir: bubB first - bod location.

                        dir = (0@0) ifTrue: [ ^ self ].
                        x: bod location - (dir normalize * anticipationMagnitude).
                        antiB: (linearInBetweener copyFrom: bod location To: x Steps: 1)
                               delay: delay.

                        bod animateFromArrowsSetup.
                        bod animateToArrowsSetup.
                        noSlowInOut ifTrue: [ pib_proto: linearInBetweener ].
                        fromTweeners: list copyRemoveAll.
                        toTweeners: list copyRemoveAll.
                        bod animatingFromArrows do: [ | :a |
                            fromTweeners add: movingLinearInBetweener copyFrom: a head To: a tail Steps: 8 ].
                        bod animatingToArrows do: [ | :a |
                            toTweeners add: pib_proto copyFrom: a head To: a tail Steps: 8 ].

                        world moveBody: bod Doing: [ | :worldMoveBlock | 
                          (antiB & inB) asVector do: [ | :ib |
                              ib do: [ | :pt |  
                                    bod animatingToArrows with: toTweeners Do: [ | :arr. :tw |
                                        tw isFinished ifFalse: [ | hd |
                                             hd: tw step value.
                                             arr setHead: hd.
                                        ] True: [
            "                               arr removeFromLists."
                                        ].
                                    ].
                                    bod animatingFromArrows with: fromTweeners Do: [ | :arr. :tw |
                                        tw isFinished ifFalse: [ | hd |
                                             tw to: arr tail.
                                             hd: tw step value.
                                             arr setHead: hd.
                                        ] True: [
                                            arr removeFromLists.
                                        ].
                                    ].
                                    worldMoveBlock value: pt. 
                                    world syncGraphics. 
                              ].
                          ].
                        ].
                        self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         displayAndFadeOutAcetate = ( |
            | 
            world prepareToDrawOnBackground.
            world display.
            acetateFadeOutMaps do: [|:m|
                m installImmediately.
                times delay: peakingInBetweener delay.
            ].
            world eraseAcetate.
            acetateFadeOutMaps first installImmediately.
            world prepareToDrawOnAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         dissolve = ( |
            | 
            acetateFadeOutMapsFast do: [|:m|
                m installImmediately.
                times delay: delay.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         dissolve: bod = ( |
            | 
            world prepareToDrawOnAcetate.
            bod displayThru.
            world prepareToDrawOnBackground.
            world display.
            acetateFadeOutMaps do: [|:m|
                m installImmediately.
                times delay: delay.
            ].
            world eraseAcetate.
            acetateFadeOutMaps first installImmediately.
            world prepareToDrawOnAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         dissolveSteps = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         fadeIn: bod = ( |
            | 
            acetateFadeOutMaps last installImmediately.
            world syncGraphics.
            world eraseAcetate.
            world syncGraphics.

            bod displayThru.
            world syncGraphics.


            acetateFadeOutMaps reverseDo: [ | :m |
                m installImmediately.
                times delay: delay.
            ].
            world prepareToDrawOnAll.
            bod display.
            world display.
            world syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         fastDissolveSteps = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: slidingRegion\x7fModuleInfo: Module: animator InitialContents: FollowSlot'
        
         hideRegion: origrect OfBody: bod SlotCpt: sb = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 downB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 endSlab.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 pib_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
                } 
            | 
            noSlowInOut ifTrue: [ pib_proto: linearInBetweener ].

            world slideOutRegion: origrect
                    OfBody: bod
                  Changing: [ endSlab: slab copyFromPoint:
                                         bod hsButton absoluteBound leftCenter.
                              bod hide: sb. ]
                     Setup: [ | :leftLoc. offLoc. steps = 8. |
                              offLoc: leftLoc x @
                                      (bod absoluteLocation y + bod size y).
                              downB: (pib_proto
                                     copyFrom: leftLoc
                                           To: offLoc
                                        Steps: steps) delay: delay. ]
                AfterSlide: [ | :prevRect. :sliver. rect. startSlab. |
                              rect: animateSliver: sliver
                                             With: downB
                                       StartingAt: prevRect topLeft.
                              startSlab: slab copyFromRect: rect.
                              zoomSlab: startSlab To: endSlab. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: morphing\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         hideSlot: sb OfBody: bod = ( |
             gr.
             oldRegions.
             oldWidth.
             oldbod.
             y1.
             y2.
             yc.
            | 
                                    oldRegions: bod regions copy.
                                    oldRegions location: bod location.
                                    "y1 and y2 must be INSIDE the bodyregions, thus the succ & pred"
                                    y1: sb location y succ.
                                    y2: y1 + sb size y pred.
                                    yc: (y1 + y2) / 2.
                                    oldWidth: bod bound width.
                                    gr: boxBitmap copyFor: world myUI window Size: bod graphic size.
                                    bod graphic copyTo: gr.
                                    oldbod: objectBody clone graphic: gr.
                                    oldbod size: bod size.
                                    oldbod location: bod location.
                                    world prepareForAnimation: bod IncludeArrows: false.
                                    bod hide: sb.
                                    bod bound width = oldWidth ifTrue: [
                                        winkOut: oldbod From: y1 To: y2.
                                    ] False: [ | oldBound. newRegions. |
                                        oldRegions sliceAt: yc.
                                        bod regions location: bod location.
                                        newRegions: bod regions copy.
                                        newRegions sliceAt: y1.
                                        oldBound: oldRegions bound.
                                        world prepareToDrawOnAcetate.
                                        oldRegions tweenTo: newRegions Do: [ | :reg. newBound. |
            objBodyRegions debug ifTrue: [ halt. ].
                                          newBound: reg drawBody: oldbod To: world windowBitmap.
                                          (oldBound deltaList: newBound) do: [ | :rect |
                                            world eraseAcetate: rect ].
                                          oldBound: newBound.

                                          world syncGraphics.
                                          oldBound: reg bound.
                                        ].
                                    ].
                                    world recoverFromAnimation: bod IncludeArrows: false.
                                    self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: wiggling\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         inBetweenersForDecelerateWiggleBody: bod Start: start End: end Direction: dir = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 antiB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 antiB_proto <- bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 d.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dropB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dropB_proto <- bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inBs.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 x.
                } 
            | 
            noSlowInOut ifTrue: [
                dropB_proto: linearInBetweener.
                antiB_proto: linearInBetweener.
            ].

            d: dir = (0@0) ifTrue: 0@0
                            False: [ (dir normalize * wiggleMagnitude) asInteger ].
            x: bod location - d.
            antiB: linearInBetweener copyFrom: bod location To: x Steps: 1.
            dropB: (dropB_proto copyFrom: start
                                                 To: end + d
                                              Steps: 4) delay: delay.
            inBs: antiB & dropB.
            [ d != (0@0) ] whileTrue: [ | dn |
                dn: d negate / 2.
                antiB: (antiB_proto copyFrom: end + d
                                                     To: end + dn
                                                  Steps: 1) delay: delay.
                inBs: inBs & antiB.
                d: dn.
            ].
            inBs asList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         invalidateAllColormaps = ( |
            | 
            cachedAcetateFadeOutMaps do: [ | :cm | cm invalidate ].
            acetateFadeOutMaps do: [ | :cm | cm invalidate ].
            cachedAcetateFadeOutMapsFast do: [ | :cm | cm invalidate ].
            acetateFadeOutMapsFast do: [ | :cm | cm invalidate ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         makeAndConvertColormapsFor: win = ( |
            | 
            acetateFadeOutMaps: cachedAcetateFadeOutMaps copy.
            cachedAcetateFadeOutMaps do: [ | :cm. :i. |
                acetateFadeOutMaps at: i Put: uiColormap copyWithRep:
                                              cm convertForWindow: win ].
            acetateFadeOutMapsFast: cachedAcetateFadeOutMapsFast copy.
            cachedAcetateFadeOutMapsFast do: [ | :cm. :i. |
                acetateFadeOutMapsFast at: i Put: uiColormap copyWithRep:
                                              cm convertForWindow: win ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         moveAntWiggleBody: bod To: dest = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 antiB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 bubB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 d.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dir.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dp.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dropB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dropB_proto <- bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inB_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 save.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 steps = 8.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 vantiB_proto <- bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 wigB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 x.
                } 
            | 
            noAnticipation ifTrue: [ ^ moveWiggleBody: bod To: dest ].
            noFollowThrough ifTrue: [ ^ anticipateBody: bod To: dest ].
            noSlowInOut ifTrue: [
                inB_proto: linearInBetweener.
                dropB_proto: linearInBetweener.
                vantiB_proto: linearInBetweener.
            ].

            inB: (inB_proto copyFrom: bod location
                                         To: dest
                                      Steps: steps) delay: delay.

            bubB: list copyRemoveAll.
            inB do: [ | :p | bubB addLast: p ].

            inB reset: steps.

            save: bubB removeFirst.
            dir: bubB first - bod location.
            dir = (0@0) ifTrue: [ ^ self ].
            x: bod location - (dir normalize * anticipationMagnitude).
            antiB: (linearInBetweener copyFrom: bod location To: x Steps: 1)
                   delay: delay.

            dp:  bubB removeLast.
            dir: dest - bubB last.

            d: (dir normalize * wiggleMagnitude) asInteger.

            dropB: (dropB_proto copyFrom: dest
                                                 To: dest + d
                                              Steps: 1) delay: delay.
            wigB: collector copyFirst: dropB.
            [ d != (0@0) ] whileTrue: [ | dn. vantiB. |
                dn: d negate / 2.
                vantiB: (vantiB_proto copyFrom: dest + d
                                                     To: dest + dn
                                                  Steps: 1) delay: delay.
                wigB: wigB & vantiB.
                d: dn.
            ].
            wigB: wigB asList.


            moveBody: bod InBetweeners: ((wigB addFirst: inB) addFirst: antiB)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         moveBody: bod InBetweeners: inBs = ( |
            | 
            world moveBody: bod Doing: [ | :worldMoveBlock | 
              inBs do: [ | :inB |
                  inB do: [ | :pt |  
                        worldMoveBlock value: pt. 
                        world syncGraphics. 
                  ].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         moveBody: bod To: dest = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inB_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 steps = 8.
                } 
            | 
            noSlowInOut ifTrue: [ inB_proto: linearInBetweener ].
                 inB: ((inB_proto
                        copyFrom: bod location To: dest Steps: steps)
                         delay: delay).
             moveBody: bod InBetweeners: vector copyAddFirst: inB).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: cursorMoving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         moveCursor: c To: pt = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 pib_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
                } 
            | 
            noSlowInOut ifTrue: [ pib_proto: linearInBetweener ].

            (pib_proto copyFrom: c location To: pt Steps: 8) delayed
             do: [|:pt| c moveTo: pt].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         moveWiggleBody: bod To: dest = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 d.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dir.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dropB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 dropB_proto <- bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inB_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 steps = 8.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 vantiB_proto <- bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 wigB.
                } 
            | 
            noFollowThrough ifTrue: [ ^ arcBody: bod To: dest ].
            noSlowInOut ifTrue: [
                inB_proto: linearInBetweener.
                dropB_proto: linearInBetweener.
                vantiB_proto: linearInBetweener.
            ].

            inB: (inB_proto copyFrom: bod location
                                         To: dest
                                      Steps: steps) delay: delay.

            dir: dest - bod location.

            d: (dir normalize * wiggleMagnitude) asInteger.

            dropB: (dropB_proto copyFrom: dest
                                                 To: dest + d
                                              Steps: 1) delay: delay.
            wigB: collector copyFirst: dropB.
            [ d != (0@0) ] whileTrue: [ | dn. vantiB. |
                dn: d negate / 2.
                vantiB: (vantiB_proto copyFrom: dest + d
                                                     To: dest + dn
                                                  Steps: 1) delay: delay.
                wigB: wigB & vantiB.
                d: dn.
            ].
            wigB: wigB asList.


            moveBody: bod InBetweeners: (wigB addFirst: inB)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'ModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: slidingRegion\x7fModuleInfo: Module: animator InitialContents: FollowSlot'
        
         ripOutRegion: origrect Of: bod = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 acc_proto <- bootstrap stub -> 'globals' -> 'acceleratingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 downB.
                } 
            | 
            noSlowInOut ifTrue: [ acc_proto: linearInBetweener ].

            world slideOutRegion: origrect
                    OfBody: bod
                  Changing: [ world alterBody: bod
                                           By: [ bod updateUntil: false ] ]
                     Setup: [ | :leftLoc. offLoc. steps = 8. |
                              offLoc: leftLoc x @ (world window size y + 20).
                              downB: (acc_proto
                                      copyFrom: leftLoc
                                            To: offLoc
                                         Steps: steps) delay: delay. ]
                AfterSlide: [ | :prevRect. :sliver. oldRect. newRect.
                                blurRect <- ((-1)@(-1)) #! ((0)@(0)). |
                              animateSliver: sliver
                                       With: downB
                                 StartingAt: prevRect topLeft. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: morphing\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         showSlotOfBody: bod CuttingBlock: cutter = ( |
             gr.
             oldRegions.
             oldWidth.
             oldbod.
             yoldnew.
            | 
                        oldRegions: bod regions copy.
                        oldRegions location: bod location.
                        oldWidth: bod bound width.
                        gr: boxBitmap copyFor: world myUI window Size: bod graphic size.
                        bod graphic copyTo: gr.
                        oldbod: objectBody clone graphic: gr.
                        oldbod size: bod size.
                        oldbod location: bod location.
                        world prepareForAnimation: bod IncludeArrows: false.
            "           bod showSlot: sb."
                        world alterBody: bod By: [ bod recreateCentered ].
                        yoldnew: cutter value.
                        "bod bound width = oldWidth" false ifTrue: [
                            winkIn: oldbod From: y1 To: y2.
                        ] False: [ | oldBound. newRegions. |
                            oldRegions sliceAt: yoldnew x.
                            bod regions location: bod location.
                            newRegions: bod regions copy.
                            newRegions sliceAt: yoldnew y.
                            oldBound: oldRegions bound.
                            world prepareToDrawOnAcetate.
                            newRegions tweenFrom: oldRegions Do: [ | :reg. newBound. |
            objBodyRegions debug ifTrue: [ halt. ].
                              newBound: reg drawBody: bod To: world windowBitmap.
                              (oldBound deltaList: newBound) do: [ | :rect |
                                world eraseAcetate: rect ].
                              oldBound: newBound.

                              world syncGraphics.
                              oldBound: reg bound.
                            ].
                        ].
                        world recoverFromAnimation: bod IncludeArrows: false.
                        self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: arrowSprouting\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutArrow: a = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 pib_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
                } 
            | 
            noSlowInOut ifTrue: [ pib_proto: linearInBetweener ].

            world prepareToDrawOnArrow0.
            ((pib_proto copyFrom: a tail To: a head Steps: 8)
               delay: delay) do: [ | :pt |
                world eraseArrow0.
                ((a copy setHead: pt) setTail: a tail)
                  drawOn: world windowBitmap Color: uiColors ones.
                world syncGraphics. ].
            world prepareToDrawOnBackground.
            a drawOn: world windowBitmap Color: uiColors arrow.
            world eraseArrow0.
            world prepareToDrawOnAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutBody: nb FromPoint: pt = ( |
            | 
            sproutBody: nb FromPoint: pt HasArrow: false
               FromCpt: nil IsParent: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutBody: nb FromPoint: pt HasArrow: hasArrow FromCpt: cpt IsParent: isParent = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 arrowBound <- bootstrap stub -> 'globals' -> 'rectangle' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 mustClear <- bootstrap stub -> 'globals' -> 'false' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 narr.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 ns <- bootstrap stub -> 'globals' -> 'slab' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 os <- bootstrap stub -> 'globals' -> 'slab' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 pib_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 prevSlab.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 sproutSteps = 8.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            noSlowInOut ifTrue: [ pib_proto: linearInBetweener ].

            ns: nb asSlab.
            os: slab copyFromPoint: pt.
            mustClear: (ns encloses: os) not.
            world eraseAcetate.
            prevSlab: os.
            hasArrow ifTrue: [
                arrowBound: prevSlab bound.
                t: isParent ifTrue: [ world boxSizing parentArrowWidth ]
                             False: [ world boxSizing dataArrowWidth   ].
                narr: uiArrow copy createFrom: cpt To: nb Width: t All: vector.
            ].
            world eraseArrowLayers.
            world prepareToDrawOnAcetate.
            (
                (pib_proto copyFrom: os To: ns Steps: sproutSteps)
                  delay: delay
            )
             do: [ | :newSlab |
                 mustClear ifTrue: [
                   world eraseAcetate:
                       hasArrow ifTrue: [ prevSlab bound union: arrowBound ]
                                 False: [ prevSlab bound ] ].
                 prevSlab: newSlab.
                 newSlab drawOn: world windowBitmap UIColors: uiColors.
                 hasArrow ifTrue: [
                     narr setToCpt: newSlab.
                     narr drawOn: world windowBitmap Color: uiColors arrow.
                     arrowBound: narr bound.
                 ].
                 world syncGraphics.
             ].
             world prepareToDrawOnAll.
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: wiggling\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutWiggleArrow: arr Init: init = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 bod.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inB.
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 pib_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
                } 
            | 
            noSlowInOut ifTrue: [ pib_proto: linearInBetweener ].
            bod: arr toCpt.
            inB: inBetweenersForDecelerateWiggleBody: bod
                                             Start: bod location
                                               End: bod location
                                         Direction: arr trueTail - arr trueHead.
            world movePrologue: arr toCpt.
            world prepareToDrawOnArrow0InstallingBoth.
            (
                (pib_proto copyFrom: arr tail To: arr head Steps: 8)
                delay: delay
            ) do: [ | :pt |
                world eraseArrow0.
                ((arr copy setHead: pt) setTail: arr tail)
                  drawOn: world windowBitmap Color: uiColors ones.
                world syncGraphics. ].
            init ifTrue: [ arr installNoWorld ].
            noFollowThrough ifFalse: [
                world moveLoop: bod Offset: 0@0 Doing: [ | :worldMoveBlock | 
                  inB do: [ | :doB |
                      doB do: [ | :pt |  
                            worldMoveBlock value: pt. world syncGraphics. 
                      ].
                  ].
                ].
            ].
            world moveEpilogue: bod.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: wiggling\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         wiggleBody: bod Direction: dir = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 inBs.
                } 
            | 
            noFollowThrough ifTrue: [ ^ self ].
            inBs: inBetweenersForDecelerateWiggleBody: bod
                                             Start: bod location
                                               End: bod location
                                         Direction: dir.
            moveBody: bod InBetweeners: inBs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: morphing\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         winkOut: bod From: y1 To: y2 = ( |
             b1.
             b2.
             b2size.
             d.
             l1.
             l2.
             prevBound.
             steps = 8.
             tweenProto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
             tweener.
            | 
                        noSlowInOut ifTrue: [ tweenProto: linearInBetweener ].

                        d: (y2  - y1) / 2.

                        tweener: tweenProto copyFrom: 0 To: d Steps: steps.

                        b1: bod bound topLeft #! (bod bound right @ y1).
                        b2: (bod bound left @ y2) #! bod bound bottomRight.
                        b2size: b2 size.

                        l1: bod location.
                        l2: bod location addY: y2.

                        world prepareToDrawOnAcetate.
                        prevBound: bod absoluteBound.
                        tweener do: [ | :n. p1. p2. botRt. |
                            p1: l1 addY: n.
                            p2: l2 subtractY: n.
                            world eraseAcetate:
                                prevBound topLeft #! (prevBound right @ p1 y).
                            "the 8 below is baseTopFaceHeight + baseDepthSkew,
                             to ensure that the bottom corner is erased"
                            botRt: p2 + b2size + (1@1).
                            world eraseAcetate:
                                (prevBound left @ (botRt y - 8)) #! prevBound bottomRight.
                            bod graphic copy: b1 To: world windowBitmap At: p1.
                            bod graphic copy: b2 To: world windowBitmap At: p2.
                            world syncGraphics.
                            prevBound: p1 #! botRt.
                        ].
            "in case y2 - y1 is odd, you need to have one more nudge."
            "alternatively, maybe determine y2 - y1 based on the different sizes
             of the old and new object"
                        bod location: prevBound topLeft.
                        world prepareToDrawOnAll.
                        self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'realAnimator' -> () From: ( | {
         'Category: morphing\x7fModuleInfo: Module: animator InitialContents: FollowSlot\x7fVisibility: public'
        
         zoomSlab: startSlab To: endSlab = ( | {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 pib_proto <- bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
                }  {
                 'ModuleInfo: Module: animator InitialContents: FollowSlot'
                
                 prevSlab <- bootstrap stub -> 'globals' -> 'slab' -> ().
                } 
            | 
            noSlowInOut ifTrue: [ pib_proto: linearInBetweener ].

            world prepareToDrawOnAcetate.
            prevSlab: startSlab.
            (
                (pib_proto copyFrom: startSlab To: endSlab Steps: 8)
                  delay: delay
            ) do: [ | :newSlab | 
                world eraseAcetate: (prevSlab bound extend: 6).
                newSlab drawOn: world windowBitmap UIColors: uiColors.
                world syncGraphics.
                prevSlab: newSlab.
            ].
            world prepareToDrawOnAll.
            self).
        } | ) 



 '-- Side effects'

 globals modules animator postFileIn
