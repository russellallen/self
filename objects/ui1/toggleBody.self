 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         toggleBody = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'toggleBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'toggleBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules toggleBody.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'toggleBody' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'toggleBody' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'toggleBody' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'toggleBody' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'toggleBody' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         toggleBody = bootstrap define: bootstrap stub -> 'globals' -> 'toggleBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals boxBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'toggleBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals toggleBody.

CopyDowns:
globals boxBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         toggleBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'toggleBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits toggleBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toggleBody' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'toggleBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         toggleButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'toggleButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals toggleButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toggleBody' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         tog <- bootstrap stub -> 'globals' -> 'toggleButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         container <- bootstrap stub -> 'globals' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         isOn <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         location <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         offMessage.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         offString <- 'off'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         onMessage.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         onString <- 'on'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         toggleButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits toggleButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'toggleButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         size <- (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleBody' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         clean = ( |
            | resend.clean tog: tog copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleBody' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         componentsDo: block = ( |
            | block value: tog).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleBody' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         createOn: wrld OnString: onstr OffString: offstr OnMessage: onmsg OffMessage: offmsg InitiallyOn: initialOn = ( | {
                 'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: copyOn: wrld.
            t tog: toggleButton copy createOn: t OnString: onstr OffString: offstr
                                        OnMessage: onmsg OffMessage: offmsg
                                        InitiallyOn: initialOn.
            t resize.
            t draw.
            t world addBodyOnTop: t.
            "now just set location and send swoopDown"
            t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleBody' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'boxBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleBody' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         resize = ( | {
                 'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
                
                 margin = 5.
                }  {
                 'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
                
                 sz.
                } 
            | 
            sz: tog minSize + boxDepthSize + (margin @ margin) +
                (margin pred @ margin pred).
            tog location: boxFaceOffset + (margin @ margin pred).
            tog size: tog minSize.
            resize: sz).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot\x7fVisibility: public'
        
         animatedDrawPressed = ( |
            | 
            world prepareToDrawOnAcetate.
            animatedErase.
            world windowBitmap rectangle: (absoluteBound topLeft + (1@1)) #!
                                          (absoluteBound bottomRight - (2@2))
                                   Color: uiColors body.
            world windowBitmap line: absoluteBound topLeft
                                 To: absoluteBound topRight
                              Color: uiColors bodyDark.
            world windowBitmap line: absoluteBound topLeft
                                 To: absoluteBound bottomLeft
                              Color: uiColors bodyDark.
            world windowBitmap line: absoluteBound topRight
                                 To: absoluteBound bottomRight
                              Color: uiColors bodyLight.
            world windowBitmap line: absoluteBound bottomLeft
                                 To: absoluteBound bottomRight
                              Color: uiColors bodyLight.
            world windowBitmap text: toggleString
                                 At: toggleStringPosition + absoluteLocation
                               Font: faceFont
                              Color: uiColors text.
            world prepareToDrawOnAll.
            world syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot\x7fVisibility: public'
        
         animatedDrawUnpressed = ( |
            | 
            world prepareToDrawOnAcetate.
            animatedErase.
            world windowBitmap rectangle: (absoluteBound topLeft + (1@1)) #!
                                          (absoluteBound bottomRight - (2@2))
                                   Color: uiColors body.
            world windowBitmap rectangle: (absoluteBound topLeft + (1@1)) #!
                                          (absoluteBound bottomRight - (1@1))
                                   Color: uiColors bodyLight.
            world windowBitmap rectangle: absoluteBound topLeft #!
                                          (absoluteBound bottomRight - (2@2))
                                   Color: uiColors bodyDark.
            world windowBitmap text: currentString
                                 At: currentStringPosition + absoluteLocation
                               Font: faceFont
                              Color: uiColors text.
            world prepareToDrawOnAll.
            world syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         animatedErase = ( |
            | 
            world windowBitmap fillRectangle: absoluteBound
                                       Color: uiColors body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         componentsDo: block = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         createOn: bod OnString: onstr OffString: offstr OnMessage: onmsg OffMessage: offmsg InitiallyOn: initialOn = ( |
            | 
            container: bod.
            onString: onstr.
            offString: offstr.
            onMessage: onmsg.
            offMessage: offmsg.
            isOn: initialOn.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         currentString = ( |
            | isOn ifTrue: [ onString ] False: [ offString ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         currentStringPosition = ( |
            | stringPosition: currentString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | 
            erase.
            drawBodyEtchedRectangle: bound.
            drawCurrentStringCentered).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         drawCurrentStringCentered = ( |
            | 
            drawBodyText: currentString
                      At: currentStringPosition
                    Font: faceFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         erase = ( |
            | drawBodyFilledRectangle: bound Color: uiColors body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         faceFont = ( |
            | boxSizing menuFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: mousing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         leftButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: mousing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         leftButtonAccept = ( |
            | toggle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: mousing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         leftButtonDown = ( |
            | 
            body raise.
            world display.
            leftButton.leftButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: mousing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         leftButtonPendingAccept: change = ( |
            | 
            change ifTrue: [ animatedDrawPressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: mousing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         leftButtonPendingReject: change = ( |
            | 
            change ifTrue: [ animatedDrawUnpressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: mousing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         leftButtonReject = ( |
            | draw. world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         minSize = ( | {
                 'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
                
                 margin = 7.
                }  {
                 'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
                
                 offStrSz.
                }  {
                 'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
                
                 onStrSz.
                }  {
                 'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
                
                 strSz.
                } 
            | 
            onStrSz: faceFont sizeOfString: onString.
            offStrSz: faceFont sizeOfString: offString.
            strSz: onStrSz max: offStrSz.
            strSz + (margin @ margin) + (margin @ margin)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: mousing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         rightButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: mousing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         rightButtonAccept = ( |
            | body banish).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: mousing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         rightButtonDown = ( |
            | 
            body raise.
            world display.
            rightButton.rightButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: mousing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         rightButtonPendingAccept: change = ( |
            | 
            change ifTrue: [ animatedDrawPressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: mousing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         rightButtonPendingReject: change = ( |
            | 
            change ifTrue: [ animatedDrawUnpressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: mousing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         rightButtonReject = ( |
            | draw. world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         stringPosition: str = ( | {
                 'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
                
                 sz.
                } 
            | 
            sz: faceFont sizeOfString: str.
            (size - sz) / 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'ModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         toggle = ( |
            | 
            isOn: isOn not.
            isOn ifTrue: [ onMessage send ] False: [ offMessage send ].
            draw.
            repair.
            world syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         toggleString = ( |
            | isOn ifTrue: [ offString ] False: [ onString ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toggleButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: toggleBody InitialContents: FollowSlot'
        
         toggleStringPosition = ( |
            | stringPosition: toggleString).
        } | ) 



 '-- Side effects'

 globals modules toggleBody postFileIn
