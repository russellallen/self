 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         uiWorld = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'uiWorld' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'uiWorld' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules uiWorld.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         uiWorld = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'uiWorld' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 uiWorld.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         arrows <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         bodies <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         bodiesToUpdate <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         graphic <- bootstrap stub -> 'globals' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         myUI <- bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         offScreen <- bootstrap stub -> 'globals' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         uiWorld = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 uiWorld.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         absoluteLocation = (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         accelerateBody: bod To: dest = ( |
            | 
            bod animator accelerateBody: bod To: dest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         addBodyOnBottom: bod = ( |
            | 
            bodies addLast: bod.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         addBodyOnTop: bod = ( |
            | 
            notifyTopObject.
            bodies addFirst: bod.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         addEditor = ( | {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 me.
                } 
            | 
            me: ui1 textEditor copyOn: self.
            addBodyOnTop: me.
            me location: cursor location.
            me constrainFullBodyToWorld.
            me swoopDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         addNewCodeObject = ( |
             startPos.
            | 
            startPos: cursor location.
            cursor while: [cursor leftButtonDown] Do: [ "nothing" ].
            cursor location != startPos ifTrue: [ 
                myUI addMirror: 'self' parseObjectBody.
                ^true.
            ].
            ^false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         addNewObject = ( |
             startPos.
            | 
            startPos: cursor location.
            cursor while: [cursor leftButtonDown] Do: [ "nothing" ].
            cursor location != startPos ifTrue: [ 
                myUI add: (). 
                ^true.
            ].
            ^false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fComment: alters body in place (does not raise body to top)\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         alterBody: bod By: alterBlock = ( | {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 changedBound <- bootstrap stub -> 'globals' -> 'rectangle' -> ().
                }  {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 oldBound <- bootstrap stub -> 'globals' -> 'rectangle' -> ().
                } 
            | 
            fillInBackground: bod absoluteBound.
            oldBound: bod absoluteBound.
            alterBlock value.
            bod setArrows.
            "need to union bounds for shrinkage--dmu"
            changedBound: oldBound union: bod absoluteBound.
            "must recalculate arrow clipping in changed region"
            reclipArrows: changedBound.
            "bod gets displayed during the repair"
            repairBodies: changedBound.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         arcBody: bod To: dest = ( |
            | 
            bod animator arcAnticipateBody: bod To: dest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         arcWiggleBody: bod To: dest = ( |
            | 
            bod animator arcWiggleBody: bod To: dest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         banishAllBodies = ( | {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 l.
                } 
            | 
            l: bodies copy.
            l do: [ | :bod |
                bodiesToUpdate remove: bod IfAbsent: nil.
                bod banish.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         banishBody: bod = ( | {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 dest.
                }  {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 x.
                }  {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 y.
                } 
            | 
                        "arc off screen"
                        dest: "bod offscreenHome." banishLocation.
            "            arcBody: bod To: dest."
            bod animator desproutArrowsArcAnticipateBody: bod To: dest.
                        true ifTrue: [ ^ self ].

                        "fade out"
                        dissolveBody: bod.
                        true ifTrue: [ ^ self ].

                        "drop straight off screen"
                        y: size y + 200.
                        accelerateBody: bod To: bod location x @ y.
                        true ifTrue: [ ^ self ].

                        "no animation"
                        deleteBody: bod.
                        display.
                        true ifTrue: [ ^ self ].

                        self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         banishLocation = ( | {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 x.
                }  {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 y.
                } 
            | 
            x: world width - 200.
            y: world height + 20.
            x @ y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         bodyAt: loc IfFound: found IfNone: none = ( |
            | 
            bodies do: [ | :b |
              (b containsPoint: loc translateBy: b absoluteLocation negate )
                ifTrue: [ ^ found value: b ] ].
            none value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: sprouting\x7fComment: 
           the constraint argument must be a positive or negative delta
	    w.r.t. the bod\'s location--dmu\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         bodyFor: mir CreateBy: cb Constrain: a To: b IfNew: nb = ( |
            | 
            findBody: mir IfFound: [ | :bod. p1. p2.  |
                p1: bod location.
                bod solveLocationConstrain: a To: b.
                bod constrainFullBodyToWorld.
                p2: bod location.
                bod location: p1.
                bod summonTo: p2.
                bod
             ]  IfNone:  [ | bod |
                bod: cb value.
                addBodyOnTop: bod.
                bod solveLocationConstrain: a To: b.
                bod constrainFullBodyToWorld.
                nb value: bod.
                "clip arrows _after_ doing new block"
                clipArrows: bod absoluteBound.
                bod
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: colorChanging\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         changeColors = ( |
            | 
            myUI graphics 
             changeColorsFor: uiColors 
              OffScreen: offScreen
              Cursor: cursor 
              Animator: myUI ranimator
              UpdateNow: [display].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: screenOperations\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         clipArrows: bnd = ( |
            | arrows do: [ | :a | a clip:   bnd ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         componentsDo: block = ( |
            | bodies do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         containsPoint: pt = ( |
            | boundContainsPoint: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         createForUI: aui = ( |
            | 
            myUI: aui.
            [xxxxxxx].
            bodies:         bodies         copyRemoveAll.
            bodiesToUpdate: bodiesToUpdate copyRemoveAll.
            arrows: arrows copyRemoveAll.
            setGraphicAndOffScreen.
            drawBackground.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         decelerateBody: bod To: dest = ( |
            | 
            bod animator decelerateBody: bod To: dest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: screenOperations\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         delete = ( |
            | 
            bodies do: [ | :bod | bod delete ].
            graphic release. 
            offScreen release).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteBody: bod = ( |
            | 
            eraseBody: bod.
            bod deleteArrows.
            reclipArrows: bod absoluteBound.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: screenOperations\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         display = ( |
            | 
            myUI graphics present: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         displayAndFadeOutAcetate = ( |
            | 
            prepareToDrawOnBackground.
            display.
            fadeOutAcetate.
            world eraseAcetate.
            makeAcetateVisible.
            world prepareToDrawOnAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: screenOperations\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         displayNoArrows = ( |
            | 
            graphic copyTo: windowBitmap.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: screenOperations\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         displayNoUpdate = ( |
            | 
            graphic copyTo: offScreen.
            drawArrowsPlusTopPlanes: offScreen.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         dissolveBody: bod = ( |
            | 
            deleteBody: bod.
            animator dissolve: bod.
            display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | 
            drawBackground. redrawAllBodies).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         draw3dExtension: botLeft To: botRight = ( | {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 side.
                }  {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 top.
                } 
            | 
            top: vector copySize: 4.
            top at: 0 Put: botLeft.
            top at: 1 Put: botLeft + (8 @ -5).
            top at: 2 Put: botRight subtractY: 5.
            top at: 3 Put: botRight subtractX: 5.
            windowBitmap fillPolygon: top Color: uiColors bodyLight.
            side: vector copySize: 3.
            side at: 0 Put: botRight subtractX: 5.
            side at: 1 Put: botRight subtractY: 5.
            side at: 2 Put: botRight.
            windowBitmap fillPolygon: side Color: uiColors bodyDark.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: screenOperations\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         drawArrows: bm = ( |
            | drawArrows: bm Color: uiColors arrow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: layers\x7fComment: Bitmap eraseAcetate copies from during 32-bit animation. -- grok 08/26/26\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         acetateStatic = ( |
            | 
            acetateRestoreFromGraphic ifTrue: [ graphic ] False: [ offScreen ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: layers\x7fComment: Direct acetate restore uses graphic while a body is off the stationary scene (prepareForAnimation / grabArrow); otherwise offScreen (last present:). On traits so a live file-in sees it. -- grok 08/26/26\x7fModuleInfo: Module: uiWorld InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         acetateRestoreFromGraphic <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: layers\x7fComment: Bound during Direct layer-text fade so drawBodyText uses the interpolated color. Nil otherwise. -- grok 08/26/26\x7fModuleInfo: Module: uiWorld InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         fadeTextColor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: layers\x7fComment: X11 ones-on-bitplane vs direct arrow paint. -- grok 08/26/26\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowAnimColor = ( |
            | myUI graphics arrowAnimColorFrom: uiColors).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: screenOperations\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         drawArrows: bm Color: col = ( |
            | 
            arrows do: [ | :a | a drawOn: bm Color: col ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: screenOperations\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         drawArrowsPlusTopPlanes: bm = ( |
            | 
            drawArrows: bm Color: uiColors arrowPlusTopPlanes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBackground = ( |
            | 
            [xxxxxxx].
            graphic fillRectangle: size rect Color: uiColors background).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         ensureFrontmost = ( |
            | myUI ensureFrontmost).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         entirelyOffScreen: bod = ( |
            | 
            (bod absoluteBound intersects: myUI size rect) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseAcetate = ( |
            | eraseAcetate: windowBitmap size rect).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseAcetate: rect = ( |
            | 
            myUI graphics eraseAcetate: rect Colors: uiColors.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseArrow0 = ( |
            | eraseArrow0: windowBitmap size rect).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseArrow0: rect = ( |
            | 
            myUI graphics eraseArrow0: rect Transparent: uiColors transparent.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseArrow1 = ( |
            | eraseArrow1: windowBitmap size rect).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseArrow1: rect = ( |
            | 
            myUI graphics eraseArrow1: rect Transparent: uiColors transparent.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseArrowLayers = ( |
            | eraseArrow0. eraseArrow1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         eraseBody: bod = ( | {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 bnd.
                } 
            | 
            removeBody: bod.
            repairBodies: bod absoluteBound.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         exists: mirr = ( |
            | findBody: mirr IfFound: true IfNone: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         fadeAddBody: bod = ( |
            | 
            animator fadeIn: bod.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         fadeIn: bod = ( |
            | 
            myUI graphics prepareToDrawOnInvisibleAcetate.
            syncGraphics.
            eraseAcetate.
            syncGraphics.

            bod displayThru.
            syncGraphics.

            fadeInAcetate.
            prepareToDrawOnAll.
            bod display.
            display.
            syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         fadeInAcetate = ( |
            | 
            myUI graphics fadeInAcetate.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         fadeOutAcetate = ( |
            | 
            myUI graphics fadeOutAcetate.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         fillInBackground: rect = ( |
            | 
            graphic fillRectangle: rect Color: uiColors background).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: arrowGrabbing\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         findArrow = ( | {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 rect.
                }  {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 sz = (25)@(25).
                } 
            | 
            rect: rectangle copy center: cursor location Size: sz.
            arrows do: [ | :arr |
                (rect includes: arr head) ifTrue: [ ^arr ].
            ].
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         findBody: mirr IfFound: fb IfNone: nb = ( |
            | 
            bodies findFirst: [ | :b | b representsObject: mirr ]
                    IfPresent: fb IfAbsent: nb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fComment: experimental--does not respect arrows\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         floatBodyDownward: bod = ( |
             cop.
            | 
            cop: bodies copy.
            cop removeFirst.
            cop do: [ | :b |
                eraseAcetate.
                syncGraphics.
                myUI graphics prepareForAnimationWithArrows.
                syncGraphics.
                from: bod ReverseDo: [ | :b |
                    b displayThru.
                ].
                syncGraphics.
                layerBody: bod After: b.
                prepareToDrawOnBackground.
                repairBodies: bod absoluteBound.
                syncGraphics.
                displayNoArrows.
                syncGraphics.
                animator dissolve.
                syncGraphics.
            ].

            eraseAcetate.
            syncGraphics.
            prepareToDrawOnAll.
            repairBodies: bod absoluteBound.
            display.
            syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         floatBodyToBottom: bod = ( |
            | 
            removeBody: bod.
            addBodyOnBottom: bod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         floatBodyToTop: bod = ( |
            | 
            removeBody: bod.
            addBodyOnTop: bod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: screenOperations\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         flushGraphics = ( |
            | window flush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         from: bod ReverseDo: block = ( | {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 seen <- bootstrap stub -> 'globals' -> 'false' -> ().
                } 
            | 
            bodies reverseDo: [ | :b |
                bod = b ifTrue: [ seen: true ].
                seen ifTrue: [ block value: b ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: arrowGrabbing\x7fComment: Direct restores from graphic while the grabbed arrow is off the list. -- grok 08/26/26\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         grabArrow: arr = ( |
             body.
             flip <- bootstrap stub -> 'globals' -> 'true' -> ().
             mir.
             toCpt.
            | 
            arr isFromFakeSlot ifTrue: [
                ^ warning:
                    'The ui currently does not permit redirecting arrows ',
                    'to change contents of "fake" slots'.
            ].

            body: arr fromCpt body.

            "set up for moving"
            saveStatic.
            arrows remove: arr.
            drawArrows: graphic.
            acetateRestoreFromGraphic: true.
            graphic copyTo: windowBitmap.

            arr findBoundsOfFromCpt.
            myUI graphics moveArrowHeadUsing: [moveHeadOfArrow: arr To: arr head].

            "move the arrow"
            cursor while: [cursor anyButtonDown] Do: [ | :nextLocation |
                moveArrows: [ moveHeadOfArrow: arr To: nextLocation ]
                      Flip: flip.
                flip: flip not.
            ].

            "clean up after moving"
            myUI graphics prepareToCopyAllLayers.
            acetateRestoreFromGraphic: false.
            reinstateStatic.
            arrows add: arr.

            toCpt: bodyAt: cursor location IfFound: [|:b| b     ]
                                           IfNone:  [
                arr setAndClipEndpoints.
              ^ self
            ].

            "don't allow the arrow to be dropped on the box it came from"
            body = toCpt ifTrue: [ arr setAndClipEndpoints. ^ self ].

            "must not let arrow fall on an object which isn't a Self object"
            toCpt representsObject ifFalse: [ arr setAndClipEndpoints. ^ self ].

            arr fromCpt = arr fromCpt body ifTrue: [ | k |
                k: arr fromCpt nameOfHiddenSlotWithArrow: arr.
                arr fromCpt changeContentsOfHiddenSlot: k
                                                    To: toCpt objMirror
                                            IfFail: [ arr setAndClipEndpoints ].
            ] False: [
                arr fromCpt changeContentsTo: toCpt objMirror IfFail: [
                    arr setAndClipEndpoints ].
            ].
            body update.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         hideRegion: origrect OfBody: bod SlotCpt: sb = ( |
            | 
            animator hideRegion: origrect OfBody: bod SlotCpt: sb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         incrementalLowerBody: bod = ( |
            | 
            [ bodies last != bod ] whileTrue: [
                floatBodyDownward: bod.
                repairBodies: bod absoluteBound.
                display.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         isEmpty = ( |
            | bodies isEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         isTop: box = ( |
            | box = bodies first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdAgain = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdCopy = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdCut = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdDown = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdF1 = ( |
            | 
            myUI addMirror: (reflect: self) At: cursor location.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdF10 = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdF11 = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdF12 = ( |
            | updateBodiesUntil: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdF2 = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdF3 = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdF4 = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdF5 = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdF6 = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdF7 = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdF8 = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdF9 = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdFind = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdLeft = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdPaste = ( |
            | 
            myUI add: (
              (
                reflect: () _Clone) addSlots: myUI slotsInPasteBuffer
              ) reflectee.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdProps = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdRight = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdStop = ( |
            | myUI quit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdUndo = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         kbdUp = ( |
            | keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         keyNullResponse = ( |
            | '\a' print).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: keying nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         keyString: str = ( |
            | 
            str = '' ifTrue: [ ^ self ].  "cheap trick to ignore modifiers"
            keyNullResponse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         layerBody: bod After: targ = ( |
            | 
            removeBody: bod.
            error: 'this method is currently unsupported--',
                   'lists do not permit interior insertion'.
            bodies add: bod After: targ IfFail: [ addBodyOnBottom: bod ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         leftButtonDown = ( | {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 mainThing = bootstrap stub -> 'lobby' -> ().
                } 
            | 
             isEmpty || [cursor shiftKeyDown] ifTrue: [
                 ( summonBodyFor: (reflect: mainThing)
                       Constrain: [|:b| b sproutCursorPosition] 
                             To: cursor location
                 ) move.
             ] False: [
                preferences allowArrowGrabbing ifTrue: [
                  scanArrows ifTrue: [ display ]
                              False: [ preferences clickRaiseLowerUI
                                         ifTrue: [ myUI raise. ].
                                     ]
                ] False: [
                    preferences clickRaiseLowerUI ifTrue: [ myUI raise ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: buttoning nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonUp = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         lowerBody: bod = ( |
            | 
            floatBodyToBottom: bod.
            repairBodies: bod absoluteBound.
            clipArrows: bod absoluteBound.
            bod restoreArrowEnds.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fComment: experimental; does not respect arrows\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         lowerFadeInBody: bod = ( |
            | 
            floatBodyToBottom: bod.
            repairBodies: bod absoluteBound.
            clipArrows: bod absoluteBound.
            bod restoreArrowEnds.
            "arrow clipping here is insufficient--need to clip to front objects"
            animator dissolve: bod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         makeAcetateVisible = ( |
            | 
            myUI graphics makeAcetateVisible.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: sprouting\x7fComment: 
           the constraint argument must be a positive or negative delta
	    w.r.t. the bod\'s location--dmu\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         makeBodyFor: mir Constrain: a To: b = ( |
            | 
               bodyFor: mir
             CreateBy: [ (ui1 objectBody protoFor: mir) copy create: mir On: self ]
            Constrain: a To: b
                IfNew: []).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         middleButtonDown = ( |
            | 
            cursor shiftKeyDown ifTrue: [ ^ changeColors ].
            cursor metaKeyDown ifTrue: [ ^ addEditor ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: buttoning nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonUp = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyMoving\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         moveArrows: doBlock Flip: flip = ( |
            | 
            myUI graphics moveArrows: doBlock Flip: flip.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyMoving\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         moveBody: bod Doing: block = ( |
            | 
            movePrologue: bod.
            moveLoop: bod Offset: 0@0 Doing: block.
            moveEpilogue: bod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyMoving\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         moveBody: bod Offset: offset Doing: block = ( |
            | 
            movePrologue: bod.
            moveLoop: bod Offset: offset Doing: block.
            moveEpilogue: bod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         moveBody: bod To: dest = ( |
            | 
            bod animator moveBody: bod To: dest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyMoving\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         moveEpilogue: bod = ( |
            | recoverFromAnimation: bod IncludeArrows: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: arrowGrabbing\x7fComment: Color is ones on X11 (bitplane+colormap), arrow on direct. -- grok 08/26/26\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         moveHeadOfArrow: arr To: loc = ( |
            | 
            arr setHead: loc.
            arr setTail: arr fromCpt absoluteLocationForMovingArrowtail: arr.
            arr clipToBoundsOfFromCpt.
            arr blurOn: windowBitmap
               Pattern: uiPatterns blurArrow
                 Color: arrowAnimColor.
            arr drawWithTargetheadOn: windowBitmap Color: arrowAnimColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyMoving\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         moveLoop: bod Offset: offset Doing: block = ( |
             blurRect <- ((-1)@(-1)) # ((-1)@(-1)).
             flip <- bootstrap stub -> 'globals' -> 'true' -> ().
             newRect.
             oldRect.
             winRect.
            | 
            oldRect: bod absoluteBound.
            newRect: oldRect.

            winRect: windowBitmap size rect.

            block value: [ | :nextLocation. newPoint. |
                newPoint: nextLocation - offset.
                bod location: newPoint.
                newRect: oldRect translateTo: newPoint.



                moveArrows: [
                    bod setAndDrawArrowsOn: windowBitmap. 
                    prepareToDrawOnAcetate.
                    bod graphic copy: bod bound To: windowBitmap At: newPoint.

                    preferences blurBodies ifTrue: [ | blur <- vector |
                        (blurRect deltaList: newRect) do: [ | :rect | 
                            eraseAcetate: rect ].

                        blur: oldRect skippedAreaTo: newRect.
                        windowBitmap fillPolygon: blur
                                         Pattern: uiPatterns blurBody
                                           Color: uiColors body.
                        blurRect: oldRect union: newRect.
                    ] False: [
                        (oldRect deltaList: newRect) do: [ | :rect | 
                            eraseAcetate: rect ].
                    ].
                ] Flip: flip.
                flip: flip not.
                oldRect: newRect.
            ].
            (blurRect deltaList: newRect) do: [ | :rect | 
                eraseAcetate: rect ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyMoving\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         movePrologue: bod = ( |
            | prepareForAnimation: bod IncludeArrows: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         notifyTopObject = ( |
            | 
            isEmpty ifFalse: [ bodies first leavingTopNotify ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         numberOfBodies = ( |
            | bodies size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyMoving\x7fComment: Direct then restores from graphic (body off the stationary scene, remaining arrows drawn). -- grok 08/26/26\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         prepareForAnimation: bod IncludeArrows: withArr = ( |
            | 
                        notifyTopObject.
                        eraseBody: bod.
                        saveStatic.

                        withArr ifTrue: [
                            bod arrowsDo: [ | :a | arrows remove: a ].
                            reclipArrows: bod absoluteBound.
                            drawArrows: graphic.
                            bod findBoundsForArrows.
                            myUI graphics prepareToDrawArrows.
                            bod setAndDrawArrowsOn: windowBitmap.
                            myUI graphics prepareForAnimationWithArrows.
                        ] False: [
                            reclipArrows: bod absoluteBound.
                            drawArrows: graphic ].

                        acetateRestoreFromGraphic: true.

                        prepareToDrawOnAcetate.
                        eraseAcetate.
                        bod displayThru.

                        prepareToDrawOnBackground.
                        graphic copyTo: windowBitmap.

            prepareToDrawOnAll.
                        self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnAcetate = ( |
            | 
            myUI graphics prepareToDrawOnAcetate.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnAll = ( |
            | 
            myUI graphics prepareToDrawOnAll: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnAllButArrow0 = ( |
            | 
            myUI graphics prepareToDrawOnAllButArrow0: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnArrow0 = ( |
            | 
            myUI graphics prepareToDrawOnArrow0: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnArrow0InstallingBoth = ( |
            | 
            myUI graphics prepareToDrawOnArrow0InstallingBoth: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnArrow1 = ( |
            | 
            myUI graphics prepareToDrawOnArrow1: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: planes\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnBackground = ( |
            | 
            myUI graphics prepareToDrawOnBackground.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         raiseBody: bod = ( |
             fadeRaise = bootstrap stub -> 'globals' -> 'true' -> ().
            | 
            (isTop: bod) ifTrue: [
                "still want bod to be alerted so it can fix its graphics"
                ^ notifyTopObject. ].
            fadeRaise ifTrue: [
                raiseFadeInBody: bod.
            ] False: [
                floatBodyToTop: bod.
                bod display.
                clipArrows: bod absoluteBound.
                bod restoreArrowEnds.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         raiseFadeInBody: bod = ( |
            | 
            (isTop: bod) ifTrue: [ ^ self ].
            floatBodyToTop: bod.
            clipArrows: bod absoluteBound.
            bod restoreArrowEnds.
            fadeIn: bod.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: screenOperations\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         reclipArrows: bnd = ( |
            | arrows do: [ | :a | a reclip: bnd ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyMoving\x7fComment: Clears acetateRestoreFromGraphic so later sprout acetate restore uses offScreen again. -- grok 08/26/26\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         recoverFromAnimation: bod IncludeArrows: withArr = ( |
            | 
            prepareToDrawOnAll.
            acetateRestoreFromGraphic: false.
            reinstateStatic.
            addBodyOnTop: bod.
            bod display.
            reclipArrows: bod absoluteBound.
            withArr ifTrue: [
                bod arrowsDo: [ | :a | arrows add: a ].
            ].
            (entirelyOffScreen: bod) ifTrue: [ bod delete ].
            "ensure that moving bod is drawn onto stationary layer"
            display.   
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         redrawAllBodies = ( |
            | 
            bodies reverseDo: [ | :b |
                (entirelyOffScreen: b) ifTrue: [ b delete ]
                                        False: [ b display ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyMoving\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         reinstateStatic = ( |
            | offScreen copyTo: graphic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         removeBody: bod = ( |
            | 
            bodies         remove: bod.
            bodiesToUpdate remove: bod IfAbsent: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         repairBodies: bnd = ( |
            | 
            fillInBackground: bnd.
            bodies reverseDo: [ | :b | b repair: bnd ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         repairBodies: bnd StartingAt: startBody = ( | {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 seen <- bootstrap stub -> 'globals' -> 'false' -> ().
                } 
            | 
            bodies reverseDo: [ | :b |
                seen: seen || [b = startBody].
                seen ifTrue: [b repair: bnd] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         rightButtonDown = ( |
            | 
            preferences clickRaiseLowerUI && [cursor shiftKeyDown]
                ifTrue: [ myUI lower ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: buttoning nullResponse\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonUp = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         ripOutRegion: origrect Of: bod = ( |
            | 
            animator ripOutRegion: origrect Of: bod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyMoving\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         saveStatic = ( |
            | graphic copyTo: offScreen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: arrowGrabbing\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         scanArrows = ( |
             body.
            | 
            findArrow ifNotNil: [|:arr|
                body: arr fromCpt body.
                grabArrow: arr.  
                ^true. 
            ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: creating\x7fComment: Phase 1.5 increment 2: the two offscreens are created via the selected graphics backend factory (myUI graphics makeOffscreenFor:Size:) instead of bitmap copyFor:Size: directly. For the quartz (indexed) backend the factory IS bitmap copyFor:Size:, so behaviour is unchanged; the newQuartz backend will return RGBA offscreens.\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         setGraphicAndOffScreen = ( |
            | 
            graphic:   myUI graphics makeOffscreenFor: window Size: window size.
            offScreen: myUI graphics makeOffscreenFor: window Size: window size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         size = ( |
            | graphic size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyMoving\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         slideOutRegion: origrect OfBody: bod Changing: changeBlock Setup: setupBlock AfterSlide: afterSlideBlock = ( |
             arect.
             blurRect <- ((0)@(0)) # ((1)@(1)).
             leftB.
             leftLoc.
             oldRect.
             rect.
             sliver.
             steps = 8.
            | 

            rect: (0 @ origrect top) # ((bod size x pred @ origrect bottom) + (1@1)).
            arect: rect translateBy: bod absoluteLocation.
            prepareForAnimation: bod IncludeArrows: false.
            bod displayThru.
            graphic copy: arect To: windowBitmap At: arect topLeft.
            draw3dExtension: (arect bottomLeft addY: 1)
                         To: (arect bottomRight addY: 1).
            myUI graphics prepareToCopyAllLayers.
            sliver: bitmap copyFor: window Size: rect size.
            bod graphic copy: rect To: sliver.

            changeBlock value.

            myUI graphics prepareToMoveBlock.
            leftLoc: arect topLeft subtractX: arect size x + 10.
            leftB: (peakingInBetweener
                    copyFrom: arect topLeft To: leftLoc Steps: steps)
                    delay: animator delay.

            setupBlock value: leftLoc.
            oldRect: animator animateSliver: sliver
                                       With: leftB
                                 StartingAt: arect topLeft.
            afterSlideBlock value: oldRect With: sliver.
            recoverFromAnimation: bod IncludeArrows: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: sprouting\x7fComment: 
           the constraint argument must be a positive or negative delta
	    w.r.t. the bod\'s location--dmu\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutBodyFor: mir Blueprint: bp Constrain: a To: b = ( |
            | 
               bodyFor: mir
             CreateBy: [ (ui1 objectBody protoFor: mir) copy create: mir On: self
                                                           WithBlueprint: bp ]
            Constrain: a To: b
                IfNew: [|:b| b display]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: sprouting\x7fComment: 
           the constraint argument must be a positive or negative delta
	    w.r.t. the bod\'s location--dmu\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutBodyFor: mir Constrain: a To: b = ( |
            | 
               bodyFor: mir
             CreateBy: [ (ui1 objectBody protoFor: mir) copy create: mir On: self ]
            Constrain: a To: b
                IfNew: [|:b| b display]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: sprouting\x7fComment: Set by find-slot while the Slot to find editor is still up; sproutToRight places the found body here (editor right + gap). Cleared when the search finishes. -- grok 08/26/26\x7fModuleInfo: Module: uiWorld InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         findSlotSproutDest.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutBound = ( |
            | size rect indent: 20).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: sprouting\x7fComment: 
           the constraint argument must be a positive or negative delta
	    w.r.t. the bod\'s location--dmu\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutTypeInFor: bod = ( |
            | sproutTypeInFor: bod Contents: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: sprouting\x7fComment: 
           the constraint argument must be a positive or negative delta
	    w.r.t. the bod\'s location--dmu\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutTypeInFor: bod Contents: contents = ( | {
                 'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
                
                 te.
                } 
            | 
            te: ui1 evalEditor copyOn: self
                             Size: (bod size x @ 80)
                         Receiver: bod objMirror.
            te methodView addTextToEnd: contents.
            addBodyOnTop: te.
            te location: bod location + (0 @ bod size y).
            te constrainFullBodyToWorld.
            te).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         statePrintString = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: sprouting\x7fComment: 
           the constraint argument must be a positive or negative delta
	    w.r.t. the bod\'s location--dmu\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         summonBodyFor: mir Blueprint: bp Constrain: a To: b = ( |
            | 
               bodyFor: mir
             CreateBy: [ (ui1 objectBody protoFor: mir) copy create: mir On: self
                                                           WithBlueprint: bp ]
            Constrain: a To: b
                IfNew: [|:b| b swoopDown]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: sprouting\x7fComment: 
           the constraint argument must be a positive or negative delta
	    w.r.t. the bod\'s location--dmu\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         summonBodyFor: mir Constrain: a To: b = ( |
            | 
               bodyFor: mir
             CreateBy: [ (ui1 objectBody protoFor: mir) copy create: mir On: self ]
            Constrain: a To: b
                IfNew: [|:b| b swoopDown]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: sprouting\x7fComment: 
           the constraint argument must be a positive or negative delta
	    w.r.t. the bod\'s location--dmu\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         summonBodyFor: mir Messages: m Constrain: a To: b = ( |
            | 
               bodyFor: mir
             CreateBy: [ (ui1 objectBody protoFor: mir) copy create: mir On: self
                                                           WithMessages: m ]
            Constrain: a To: b
                IfNew: [|:b| b swoopDown]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: screenOperations\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         syncGraphics = ( |
            | window sync).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         teleportBody: bod To: dest = ( |
            | 
            world eraseBody: bod.
            reclipArrows: bod absoluteBound.
            bod location: dest.
            world addBodyOnTop: bod.
            bod setArrows.
            reclipArrows: bod absoluteBound.
            (entirelyOffScreen: bod) ifTrue: [ bod delete ]
                                      False: [ bod display ].
            display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         topObject = ( |
            | bodies first objMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: screenOperations\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         update = ( |
            | offScreen copyTo: windowBitmap. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: screenOperations\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         update: rect = ( |
            | 
            offScreen copy: rect To: windowBitmap At: rect origin.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement updating\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         updateAllBodies = ( |
            | updateBodiesUntil: [ false ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement updating\x7fComment: recomputes and redraws all or some bodies (in roughly round-robin)
	     and stops if untilBlock return true, or of it has done approx all
	     blocks -- dmu\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         updateBodiesUntil: untilBlock = ( |
             changeRects.
             n <- 0.
            | 
            notifyTopObject.
            changeRects: set copyRemoveAll.
            [|:exit.  bod.  oldBound <- rectangle. |
                n  >=  bodies size   ifTrue: exit.
                bodiesToUpdate isEmpty ifTrue: [bodiesToUpdate: bodies copy].
                bod: bodiesToUpdate removeFirst.
                oldBound: bod absoluteBound.
                (bod updateUntil: untilBlock) ifTrue: [
                    changeRects add: bod absoluteBound.
                    fillInBackground: oldBound.
                    changeRects add: oldBound.
                ].
                untilBlock value ifTrue: [
                    "give someone else a chance"
                    bodiesToUpdate addLast: bod.
                    exit value.
                ].
                n: n succ.
            ] loopExit.
            changeRects isEmpty ifTrue: [^self].

            bodies reverseDo: [|:bod|
                changeRects findFirst: [|:rect| 
                    bod absoluteBound intersects: rect
                ] IfPresent: [|:rect|
                    bod display.
                    bod setArrows.
                    changeRects add: bod absoluteBound.
                ] IfAbsent: nil.
            ].
            changeRects do: [ | :rect | reclipArrows: rect ].
            display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement updating\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         updateBody: bod = ( |
            | 
            notifyTopObject. "hack for text editing"
            alterBody: bod By: [ bod updateUntil: false ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: bodyManagement\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         wiggleBody: bod Direction: dir = ( |
            | 
            raiseBody: bod.
            animator wiggleBody: bod Direction: dir.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'ModuleInfo: Module: uiWorld InitialContents: FollowSlot'
        
         windowBitmap = ( |
            | window bitmap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         windowChanged = ( |
            | 
            graphic setNoClipMask.
            graphic resize: window size PlatformPixmap: myUI graphics platformPixmap.
            offScreen resize: window size PlatformPixmap: myUI graphics platformPixmap.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiWorld' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: uiWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         world = ( |
            | self).
        } | ) 



 '-- Side effects'

 globals modules uiWorld postFileIn
