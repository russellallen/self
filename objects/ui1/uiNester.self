 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         uiNester = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'uiNester' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'uiNester' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules uiNester.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiNester' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiNester' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiNester' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiNester' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiNester' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         uiNester = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiNester' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiNester.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNester' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: public'
        
         components <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNester' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         container <- 'prototype uiNester has no container'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNester' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         containsPoint: pt = ( |
            | boundContainsPoint: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNester' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         location = (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         uiNester = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( |
             {} = 'Comment: traits nester is an abstract traits object.  There are three kinds of
     nesters--the world, bodies in that world, and components of bodies.\x7fModuleInfo: Creator: traits uiNester.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNester' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNester' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         size = (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteBound = ( |
            | bound translateBy: absoluteLocation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         absoluteBoundContainsPoint: pt = ( |
            | absoluteBound includes: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: locating\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteCenter = ( |
            | absoluteBound center).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteContainsPoint: pt = ( |
            | absoluteBoundContainsPoint: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: locating\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteLocation = ( |
            | location + container absoluteLocation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: meta\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         addUIImplementor = ( |
            | 
            myUI addMirror: (reflect: self) At: absoluteBound topRight.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: sharedObjects\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         animator = ( |
            | myUI animator).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: containing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         body = ( |
            | container body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         bound = ( |
            | size rect).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         boundContainsPoint: pt = ( |
            | bound includes: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: sharedObjects\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         boxSizing = ( |
            | myUI boxSizing).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: locating\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         center = ( |
            | bound center).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: finding\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         componentContaining: pt = ( |
            | 
            componentsDo: [ | :box. nPt. |
                nPt: pt - box location.
                (box containsPoint: nPt)
                    ifTrue: [ ^ box componentContaining: nPt ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         containsPoint: pt = ( |
            | boundContainsPoint: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: sharedObjects\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor = ( |
            | myUI cursor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         descendentResponsibilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'uiNester' -> 'descendentResponsibilities' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits uiNester descendentResponsibilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> 'descendentResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         componentsDo: block = ( |
            | 'Iterate through subcomponents.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> 'descendentResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         container = ( |
            | 'Return the nester containing this object.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> 'descendentResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         location = ( |
            | 'Return position of this nester in its container.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> 'descendentResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | 'Return the bounding dimensions of this nester.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBodyDarkLine: a To: b = ( |
            | 
            drawBodyLine: a To: b Color: uiColors bodyDark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBodyEtchedLine: a To: b = ( |
            | 
            drawBodyDarkLine: a To: b.
            a x = b x
                ifFalse: [ drawBodyLightLine: (a addY: 1) To: (b addY: 1) ]
                   True: [ drawBodyLightLine: (a addX: 1) To: (b addX: 1) ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBodyEtchedRectangle: rect = ( |
            | 
            drawBodyEtchedLine: rect topLeft To: rect topRight subtractX: 2.
            drawBodyEtchedLine: (rect topLeft addY: 1)
                            To: rect bottomLeft subtractY: 2.
            drawBodyEtchedLine: (rect bottomLeft subtractY: 1)
                            To: rect bottomRight subtractY: 1.
            drawBodyEtchedLine: (rect topRight subtractX: 1)
                            To: rect bottomRight - (1@1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBodyFilledRectangle: rect Color: c = ( |
            | 
            body graphic fillRectangle: (rect translateBy: offsetFromBody)
                                 Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBodyLightLine: a To: b = ( |
            | 
            drawBodyLine: a To: b Color: uiColors bodyLight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBodyLine: a To: b Color: c = ( |
            | 
            body graphic line: offsetFromBody + a
                           To: offsetFromBody + b
                        Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBodyRaisedLine: a To: b = ( |
            | 
            drawBodyLightLine: a To: b.
            a x = b x
                ifFalse: [ drawBodyDarkLine: (a addY: 1) To: (b addY: 1) ]
                   True: [ drawBodyDarkLine: (a addX: 1) To: (b addX: 1) ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBodyRaisedRectangle: rect = ( |
            | 
            drawBodyLightLine: rect topLeft To: rect topRight.
            drawBodyLightLine: rect topLeft To: rect bottomLeft.
            drawBodyDarkLine: rect topRight To: rect bottomRight.
            drawBodyDarkLine: rect bottomLeft To: rect bottomRight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBodyRectangle: rect Color: c = ( |
            | 
            body graphic rectangle: (rect translateBy: offsetFromBody)
                             Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBodySunkenRectangle: rect = ( |
            | 
            drawBodyDarkLine: rect topLeft To: rect topRight.
            drawBodyDarkLine: rect topLeft To: rect bottomLeft.
            drawBodyLightLine: rect topRight To: rect bottomRight.
            drawBodyLightLine: rect bottomLeft To: rect bottomRight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBodyText: text At: pt Font: f = ( |
            | 
            body graphic textLines: text asTextLines
                                At: offsetFromBody + pt
                              Font: f
                             Color: textColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | size y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdAgain = ( |
            | container kbdAgain).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdCopy = ( |
            | container kbdCopy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdCut = ( |
            | container kbdCut).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdDown = ( |
            | container kbdDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdF1 = ( |
            | addUIImplementor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdF10 = ( |
            | container kbdF10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdF11 = ( |
            | container kbdF11).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdF12 = ( |
            | container kbdF12).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdF2 = ( |
            | container kbdF2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdF3 = ( |
            | container kbdF3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdF4 = ( |
            | container kbdF4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdF5 = ( |
            | container kbdF5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdF6 = ( |
            | container kbdF6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdF7 = ( |
            | container kbdF7).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdF8 = ( |
            | container kbdF8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdF9 = ( |
            | container kbdF9).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdFind = ( |
            | container kbdFind).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdLeft = ( |
            | container kbdLeft).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdPaste = ( |
            | container kbdPaste).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdProps = ( |
            | container kbdProps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdRight = ( |
            | container kbdRight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdStop = ( |
            | container kbdStop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdUndo = ( |
            | container kbdUndo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying kbdResponse\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot'
        
         kbdUp = ( |
            | container kbdUp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         keyPress: keycode String: str = ( |
            | 
            keycode = 8   ifTrue: [ ^ kbdStop  ].
            keycode = 10  ifTrue: [ ^ kbdAgain ].
            keycode = 32  ifTrue: [ ^ kbdProps ].
            keycode = 33  ifTrue: [ ^ kbdUndo  ].
            keycode = 58  ifTrue: [ ^ kbdCopy  ].       
            keycode = 80  ifTrue: [ ^ kbdPaste ].
            keycode = 102 ifTrue: [ ^ kbdFind  ].
            keycode = 104 ifTrue: [ ^ kbdCut   ].

            keycode = 12  ifTrue: [ ^ kbdF1    ].
            keycode = 13  ifTrue: [ ^ kbdF2    ].
            keycode = 15  ifTrue: [ ^ kbdF3    ].
            keycode = 17  ifTrue: [ ^ kbdF4    ].
            keycode = 19  ifTrue: [ ^ kbdF5    ].
            keycode = 21  ifTrue: [ ^ kbdF6    ].
            keycode = 23  ifTrue: [ ^ kbdF7    ].
            keycode = 24  ifTrue: [ ^ kbdF8    ].
            keycode = 25  ifTrue: [ ^ kbdF9    ].
            keycode = 14  ifTrue: [ ^ kbdF10   ].
            keycode = 16  ifTrue: [ ^ kbdF11   ].
            keycode = 18  ifTrue: [ ^ kbdF12   ].

            keycode = 100 ifTrue: [ ^ kbdRight ].
            keycode = 98  ifTrue: [ ^ kbdLeft  ].
            keycode = 76  ifTrue: [ ^ kbdUp    ].
            keycode = 120 ifTrue: [ ^ kbdDown  ].

            "if not one of the known function keys, use the string"
            keyString: str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: keying\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         keyString: str = ( |
            | container keyString: str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonDown = ( |
            | container leftButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonUp = ( |
            | container leftButtonUp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonDown = ( |
            | container middleButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonUp = ( |
            | container middleButtonUp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: sharedObjects\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         myUI = ( |
            | container myUI).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: locating\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         offsetFromBody = ( |
            | location + container offsetFromBody).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'ModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: private'
        
         printStringID = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: repairing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         repair = ( |
            | 
            world repairBodies: absoluteBound StartingAt: body.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonDown = ( |
            | container rightButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonUp = ( |
            | container rightButtonUp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( | {
                 'ModuleInfo: Module: uiNester InitialContents: FollowSlot'
                
                 id <- ''.
                } 
            | 
            printStringID != '' ifTrue: [ id: '[', printStringID, ']' ].
            id, ' on ', container printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         textColor = ( |
            | uiColors text).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: sharedObjects\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         uiColors = ( |
            | myUI uiColors).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: sharedObjects\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         uiPatterns = ( |
            | myUI uiPatterns).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | size x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: sharedObjects\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         window = ( |
            | myUI window).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNester' -> () From: ( | {
         'Category: containing\x7fModuleInfo: Module: uiNester InitialContents: FollowSlot\x7fVisibility: public'
        
         world = ( |
            | container world).
        } | ) 



 '-- Side effects'

 globals modules uiNester postFileIn
