 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         boxBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'boxBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals boxBody.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         animatingFromArrows <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         animatingToArrows <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         components <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         fromArrows <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         graphLevel <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         graphic <- bootstrap stub -> 'globals' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         boxBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits boxBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'boxBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         size <- (400)@(200).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         toArrows <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         world <- bootstrap stub -> 'globals' -> 'uiWorld' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         uiBody = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'uiBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'uiBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules uiBody.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         uiBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiBody.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         animatingFromArrows <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         animatingToArrows <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         components <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         fromArrows <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: InitializeToExpression: (0)'
        
         graphLevel <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         graphic <- bootstrap stub -> 'globals' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         location <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         uiBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits uiBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         size <- (400)@(200).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         toArrows <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         world <- bootstrap stub -> 'globals' -> 'uiWorld' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         asSlab = ( |
            | graphic asSlab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         boxDepthSize = ( |
            | boxSizing baseSideFaceWidth @ boxSizing baseTopFaceHeight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         boxFaceOffset = ( |
            | 0 @ boxSizing baseTopFaceHeight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOn: wrld = ( | {
                 'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
                
                 w.
                } 
            | 
            w: copy.
            w world: wrld.
            w initGraphic. "need to have world set before graphic can be init'ed"
            w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         display = ( |
            | graphic displayNoSaveUnder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         displayThru = ( |
            | graphic displayOn: world windowBitmap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         draw = ( |
            | 
            graphic draw.
            componentsDo: [ | :cpt | cpt draw ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         faceSize = ( |
            | size - boxDepthSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         inRegion: pt = ( |
            | 
            boundContainsPoint ifTrue: [ graphic contains: pt ] False: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         location = ( |
            | graphic location).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         location: pt = ( |
            | graphic location: pt. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         redraw: bnd = ( |
            | 
            graphic displayNoSaveUnder:
                (absoluteBound intersect: bnd) translateBy: location negate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         resizeGraphic = ( |
            | resizeGraphicReallocate: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         resizeGraphicReallocate: reallocate = ( |
            | 
            reallocate ifTrue: [
                graphic release.
                graphic: boxBitmap copyFor: window Size: size. ].
            graphic createSize: size
                         Depth: boxSizing baseSideFaceWidth @
                                boxSizing baseTopFaceHeight
                          Skew: boxSizing baseDepthSkew
                        Offset: offsetFromBody
                      UIColors: uiColors.
            graphic background: world graphic.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: arrowing endpoints\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteLocationForArrowhead: arrow = ( |
            | 
            absoluteBound pointClosestToPoint: arrow tail).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: arrowing endpoints\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteLocationForArrowtail: arrow = ( |
            | 
            absoluteBound center).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: arrowing managing\x7fComment: must do \'findBoundsForArrows\' first
	     (this assumes arrows have bounds set)\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         animateFromArrowsSetup = ( |
            | 
            animatingFromArrows: fromArrows copy.
            fromArrows removeAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: arrowing managing\x7fComment: must do \'findBoundsForArrows\' first
	     (this assumes arrows have bounds set)\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         animateToArrowsSetup = ( |
            | 
            animatingToArrows: toArrows copy.
            toArrows removeAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: arrowing managing\x7fComment: must do \'findBoundsForArrows\' first
	     (this assumes arrows have bounds set)\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         animateToArrowsTakedown = ( |
            | 
            toArrows: animatingToArrows copy.
            animatingToArrows removeAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: arrowing managing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowsDo: block = ( |
            | 
            fromArrows do: block.
            toArrows do: block.
            animatingFromArrows do: block.
            animatingToArrows do: block.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: deleting\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         banish = ( |
            | 
            world banishBody: self.
            release.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         body = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         clean = ( |
            | 
            components: components copyRemoveAll.
            fromArrows: fromArrows copyRemoveAll.
            toArrows: toArrows copyRemoveAll.
            animatingFromArrows: animatingFromArrows copyRemoveAll.
            animatingToArrows: animatingToArrows copyRemoveAll.
            graphic: globals bitmap.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         componentsDo: block = ( |
            | components do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: placing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         constrainFullBodyToWorld = ( |
            | 
            location: location restrictTo:
                        world sproutBound shrinkBottomRight:
                          size min: world size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: placing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         constrainPartialBodyToWorld = ( |
            | 
            (world entirelyOffScreen: self) ifTrue: [
                location: location restrictTo: world sproutBound ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         container = ( |
            | world).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         containsPoint: pt = ( |
            | boundContainsPoint: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy clean).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: deleting\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            world deleteBody: self.
            release.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: arrowing managing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteArrows = ( |
            | arrowsDo: [ | :a | a unsprout ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         display = ( |
            | graphic copyTo: container graphic At: location).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: deleting\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         dissolve = ( |
            | 
            world dissolveBody: self.
            release.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | 
            graphic fillRectangle: bound Color: uiColors body.
            graphic rectangle: (size - (1@1)) rect Color: uiColors bodyDark.
            componentsDo: [ | :comp | comp draw ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         fadeInstead = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: arrowing managing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         findBoundsForArrows = ( |
            | 
            fromArrows do: [ | :a | a findBoundsOfToCpt ].
            toArrows   do: [ | :a | a findBoundsOfFromCpt ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         followCursorWhile: whileBlock = ( |
            | 
            world moveBody: self
                    Offset: cursor location - location
                     Doing: [ | :doB | cursor while: whileBlock Do: doB ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         initGraphic = ( |
            | resizeGraphic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         leavingTopNotify = ( |
            | 
            "sent when it is losing its position as topmost object"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: pressing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonDown = ( |
            | followCursorWhile: [ cursor leftButtonDown ].
            world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         lowerFadeIn = ( |
            | 
            "world floatBodyDownward: self."
            "lists don't support interior insertion, so can't use
             floatBodyDownward"
            world lowerFadeInBody: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: pressing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonDown = ( |
            | 
            cursor shiftKeyDown ifTrue: [ resend.middleButtonDown ].
            cursor metaKeyDown ifTrue: [ raiseFadeIn ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         move = ( |
            | followCursorWhile: [ cursor leftButtonDown ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         moveTo: pt = ( |
            | world moveBody: self To: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         offscreenHome = ( |
            | randomHome).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         offsetFromBody = (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         onTop = ( |
            | = world bodies first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'ModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         raise = ( |
            | world raiseBody: self.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         raiseFadeIn = ( |
            | world raiseFadeInBody: self.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot'
        
         randomHome = ( | {
                 'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
                
                 x.
                }  {
                 'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
                
                 y.
                } 
            | 
            x: random integer: world width.
            y: height negate.
            x @ y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         redraw: bnd = ( | {
                 'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
                
                 rect.
                } 
            | 
            rect: (absoluteBound intersect: bnd) translateBy: location negate.
            graphic copy: rect
                      To: world graphic
                      At: rect topLeft + location).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: deleting\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         release = ( |
            | graphic release.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         repair: bnd = ( |
            | 
            (absoluteBound intersects: bnd) ifTrue: [ redraw: bnd ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         representsObject = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         representsObject: mir = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: changing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         resize: sz = ( |
            | resize: sz Reallocate: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: changing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         resize: sz Reallocate: reallocate = ( |
            | 
            size: sz.
            resizeGraphicReallocate: reallocate.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: changing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         resizeGraphic = ( |
            | 
            graphic release.
            graphic: bitmap copyFor: window Size: size.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         resproutOn: wrld = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: arrowing managing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         restoreArrowEnds = ( |
            | 
            toArrows   do: [ | :a | a resetHead. a clipTail. ].
            fromArrows do: [ | :a | a resetTail. a clipHead. ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: pressing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonDown = ( |
            | cursor metaKeyDown ifTrue: [ lowerFadeIn ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: arrowing managing\x7fComment: see caveat for setArrowsAnd:\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         setAndDrawArrowsOn: bm = ( |
            | 
            setArrowsAnd: [ | :a. |
                a blurOn: bm
                 Pattern: uiPatterns blurArrow
                   Color: uiColors ones.
                a drawOn: bm Color: uiColors ones. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: arrowing managing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         setArrows = ( |
            | 
            findBoundsForArrows.
            setArrowsAnd: [ self ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: arrowing managing\x7fComment: must do \'findBoundsForArrows\' first
	     (this assumes arrows have bounds set)\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: private'
        
         setArrowsAnd: block = ( |
            | 
            fromArrows do: [ | :a. | a setEndpoints.
                                     a clipToBoundsOfToCpt.
                                     a clipHead: absoluteBound.
                                     block value: a.
            ].
            toArrows   do: [ | :a. | a setEndpoints. 
                                     a clipToBoundsOfFromCpt.
                                     a clipTail: absoluteBound.
                                     block value: a.
            ].
            animatingFromArrows do: [ | :a | a setStandardTail.
                                             a clipToBoundsOfToCpt.
                                             a clipHead: absoluteBound.
                                             block value: a.
            ].
            animatingToArrows do: [ | :a | a setStandardTail.
                                           a clipToBoundsOfFromCpt.
                                           a clipTail: absoluteBound.
                                           block value: a.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: placing\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         solveLocationConstrain: a To: b = ( | {
                 'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
                
                 delta <- (0)@(0).
                }  {
                 'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
                
                 finalDelta <- (0)@(0).
                }  {
                 'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
                
                 newDelta <- (0)@(0).
                }  {
                 'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
                
                 ok = ((-1)@(-1)) #! ((1)@(1)).
                } 
            | 
            "try adding to location to see which way to go"

            delta: (a value: self) - (b value: self).
            location: location + delta.

            newDelta: (a value: self) - (b value: self).
            (ok includes: newDelta)  ifTrue: [ ^ self ].

            location: location - newDelta.

            finalDelta: (a value: self) - (b value: self).
            (ok includes: finalDelta) ifTrue: [ ^ self ].
            error: 'bad constraint: ', finalDelta printString,
                   ' should be in ', ok printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         summonTo: p = ( |
            | 
            world arcWiggleBody: self To: p.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         swoopDown = ( | {
                 'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
                
                 f.
                }  {
                 'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
                
                 p <- (0)@(0).
                }  {
                 'ModuleInfo: Module: uiBody InitialContents: FollowSlot'
                
                 respectHome = bootstrap stub -> 'globals' -> 'false' -> ().
                } 
            | 
            fadeInstead ifTrue: [ world fadeAddBody: self ] False: [
                p: location. 
               f: respectHome ifTrue: [ offscreenHome ] False: [ randomHome ].
                location: f.
                summonTo: p.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: arrowing endpoints\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         unsprout: arr = ( |
            | arr removeFromLists).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         update = ( |
            | world updateBody: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: updating\x7fComment: only call this from the uiWorld
	 returns bool indicating whether an update happened\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         updateUntil: untilBlock = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         wiggle = ( |
            | wiggle: 0@1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiBody' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: uiBody InitialContents: FollowSlot\x7fVisibility: public'
        
         wiggle: dir = ( |
            | world wiggleBody: self Direction: dir. self).
        } | ) 



 '-- Side effects'

 globals modules uiBody postFileIn
