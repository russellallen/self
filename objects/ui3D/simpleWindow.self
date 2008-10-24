 '$Revision: 20.1 $'
 '
Copyright 1992, 1993, 1994 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
         '


 '-- Module body'

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot'
        
         simpleWindow = bootstrap stub -> 'globals' -> 'modules' -> 'simpleWindow' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'simpleWindow' -> () _AddSlots: ( |
             {} = 'Comment: the prototype module object, I am created by init.self.\x7fModuleInfo: Creator: globals modules simpleWindow.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui3D'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 20.1 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot'
        
         simpleWindow = bootstrap stub -> 'globals' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals windowing simpleWindow.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: InitializeToExpression: (xlib colormap deadCopy)'
        
         cmap <- xlib colormap deadCopy.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: InitializeToExpression: (1)'
        
         depth <- 1.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: InitializeToExpression: (xlib display deadCopy)'
        
         display <- xlib display deadCopy.
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot'
        
         simpleWindow = bootstrap stub -> 'traits' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: traits windowing simpleWindow.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'simpleWindow' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: InitializeToExpression: (xlib visual deadCopy)'
        
         visual <- xlib visual deadCopy.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: InitializeToExpression: (xlib window deadCopy)'
        
         xWindow <- xlib window deadCopy.
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
             {} = 'ModuleInfo: Creator: traits windowing simpleWindow close.
'.
            
            | 
            cmap delete.
            xWindow delete.
            display close.
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot\x7fVisibility: public'
        
         open = ( |
             {} = 'ModuleInfo: Creator: traits windowing simpleWindow open.
'.
            
            | openOnScreen: 0 WithName: 'Simple Window' Size: 500@500 AndPosition: 0@0).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot\x7fVisibility: public'
        
         openOnScreen: scrNumber WithName: name AndSize: size = ( |
             {} = 'ModuleInfo: Creator: traits windowing simpleWindow openOnScreen:WithName:AndSize:.
'.
            
            | 
            openOnScreen: scrNumber WithName: name Size: size AndPosition: 0@0).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot\x7fVisibility: public'
        
         openOnScreen: scrNumber WithName: name Size: size AndPosition: pos = ( |
             {} = 'ModuleInfo: Creator: traits windowing simpleWindow openOnScreen:WithName:Size:AndPosition:.
'.
            
             black.
             white.
             winAttrs.
            | 
            winAttrs: xlib xSetWindowAttributes new.

            display: xlib display open: (':0.', (scrNumber printString)).
            display isTrueColor ifTrue: [
              visual: display trueColorVisual.
              depth:  24.

              cmap: xlib colormap createFor: display screen rootWindow WithVisual: visual AllocateColors: false.
              winAttrs colormap: cmap.

              black: ((((xlib xColor new) red:  0) green:  0) blue:  0) allComponents.
              cmap allocColor: black. 
              white: ((((xlib xColor new) red: -1) green: -1) blue: -1) allComponents.
              cmap allocColor: white.
              winAttrs borderPixel: black pixel.
            ]
            False: [
              visual: display screen defaultVisualOfScreen.
              depth:  display screen defaultDepthOfScreen.

              cmap: xlib colormap createFor: display screen rootWindow.
              black: (xlib xColor new) pixel: display screen blackPixel.
              white: (xlib xColor new) pixel: display screen whitePixel.
            ].

            winAttrs backgroundPixel: white pixel.
            winAttrs eventMask: xlib events keyPressMask     || 
                                xlib events buttonPressMask  || 
                                xlib events buttonMotionMask || 
                                xlib events exposureMask     || 
                                xlib events resizeRedirectMask.

            xWindow: xlib window createOnDisplay: display At: pos WithSize: size Depth: depth Visual: visual Attributes: winAttrs.
            xWindow name: name.
            (xWindow map) raise.
            display synchronize: true.

            black delete.
            white delete.
            winAttrs delete.

            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot\x7fVisibility: public'
        
         openWithName: name = ( |
             {} = 'ModuleInfo: Creator: traits windowing simpleWindow openWithName:.
'.
            
            | 
            openOnScreen: 0 WithName: name Size: 500@500 AndPosition: 0@0).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'simpleWindow' -> () _AddSlots: ( | {
         'ModuleInfo: Module: simpleWindow InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'system' -> 'roots' -> 'clonable' -> ().
        } | ) 



 '-- Side effects'

 globals modules simpleWindow postFileIn
