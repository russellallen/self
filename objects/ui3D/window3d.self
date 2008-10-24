 '$Revision: 20.1 $'
 '
Copyright 1992, 1993, 1994 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
         '


 '-- Module body'

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot'
        
         window3d = bootstrap stub -> 'globals' -> 'modules' -> 'window3d' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'window3d' -> () _AddSlots: ( |
             {} = 'Comment: the prototype module object, I am created by init.self.\x7fModuleInfo: Creator: globals modules window3d.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui3D'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 20.1 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot'
        
         window3d = bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals windowing xgl window3d.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: InitializeToExpression: (xgl genericObject)'
        
         ctx3d <- bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'genericObject' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: InitializeToExpression: (xgl inquire)'
        
         hardwareInfo <- bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'inquire' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: InitializeToExpression: (xgl objDesc)'
        
         objDesc <- bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'objDesc' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: InitializeToExpression: (xgl genericObject)'
        
         raster <- bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'genericObject' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: InitializeToExpression: (simpleWindow)'
        
         xWin <- bootstrap stub -> 'globals' -> 'windowing' -> 'simpleWindow' -> ().
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot'
        
         window3d = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: traits windowing xgl window3d.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( | 
            | 
            ctx3d delete kill.
            hardwareInfo delete kill.
            objDesc delete kill.
            raster delete kill.
            xWin close.
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: InitializeToExpression: (traits xgl doubleBuffering)'
        
         doubleBuffer* <- bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'doubleBuffering' -> ().
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot'
        
         dropThroughMarker = bootstrap stub -> 'traits' -> 'ui2' -> 'morph' -> 'dropThroughMarker' -> ().
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot'
        
         handPos = ( |
             {} = 'ModuleInfo: Creator: traits windowing xgl window3d handPos.
'.
            
            | 
            "(((desktop w hands first position - 500) / 200) asFloat) @ 0"
            desktop w hands first position @ 0).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot\x7fVisibility: public'
        
         newFrame = ( |
             {} = 'ModuleInfo: Creator: traits windowing xgl window3d newFrame.
'.
            
            | 
            ctx3d ctxNewFrame.
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot\x7fVisibility: public'
        
         open = ( | 
             sysState.
            | 
            sysState: xgl initIfNotYetInitialized.

            xWin:     (simpleWindow copy) openOnScreen: 0 
                                              WithName: 'Simple XGL Test' 
                                               AndSize: 1000@900.
            objDesc:  ((xgl objDesc new) win_ras_type: xgl windowType winX) 
                                         win_ras_desc: (((xgl xWindow new) x_display: xWin display)
                                                                            x_screen: xWin display screen number)
                                                                            x_window: xWin xWindow.
            raster:   sysState createXglObject: xgl objType winRas 
                                    ObjectDesc: objDesc 
                                 WithAttribute: xgl attribute devColorType 
                                     AttrValue: xgl colorType colorRgb
                                          Zero: 0.
            ctx3d:    sysState createXglObject: xgl objType ctx3d
                                    ObjectDesc: xgl objDesc nilObjDesc
                                 WithAttribute: xgl attribute ctxDevice
                                     AttrValue: raster
                                          Zero: 0.
            "ctx3d setAttribute: xgl attribute ctxVdcOrientation
                     AttrValue: xgl vdcOrientation yUpZToward
                          Zero: 0."
            ctx3d setAttribute: xgl attribute ctx3dHlhsrMode
                     AttrValue: xgl hlhsrMode hlhsrZBuffer
                          Zero: 0.
            ctx3d setAttribute: xgl attribute ctxNewFrameAction
                     AttrValue: xgl ctxNewFrameAction ctxNewFrameHlhsrAction ||
                                xgl ctxNewFrameAction ctxNewFrameClear
                          Zero: 0.

            "ctx3d setAttribute: xgl attribute ctxVdcMap
                     AttrValue: xgl vdcMap vdcMapAspect
                          Zero: 0.
            ctx3d setAttribute: xgl attribute ctxVdcWindow
                     AttrValue: ((xgl boundsD3d new) set_Xmax: 2 Xmin: -2 Ymax: 2 Ymin: -2 Zmax: -10.5 Zmin: -14.5)
                          Zero: 0.
            ctx3d setAttribute: traits xgl attribute ctxViewTrans
                     AttrValue: (setViewFrom: -6@-8@-7.5 Up: 0@1@0 At: 0@0@0)
                          Zero: 0."

            hardwareInfo: sysState inquireHardware: objDesc.
            doubleBuffer: traits xgl doubleBuffering copy initialize.
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'system' -> 'roots' -> 'clonable' -> ().
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'window3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: window3d InitialContents: FollowSlot\x7fVisibility: public'
        
         setViewFrom: from Up: up At: at = ( | 
             sysState.
             viewTrans.
            | 

            sysState:  initIfNotYetInitialized.
            viewTrans: sysState createXglObject: xgl objType trans
                                     ObjectDesc: xgl objDesc nilObjDesc
                                           Zero: 0.
            viewTrans transformTranslate: from asPointProxy Update: xgl transUpdate transReplace.
            viewTrans transformRotate: pi / 2 
                                 Axis: xgl axis axisX 
                               Update: xgl transUpdate transPostconcat.
            viewTrans transformRotate: (from x / from y) arcTan + pi
                                 Axis: xgl axis axisY 
                               Update: xgl transUpdate transPostconcat.
            viewTrans transformRotate: (from z negate / ((from x square + from y square) squareRoot)) arcTan
                                 Axis: xgl axis axisX 
                               Update: xgl transUpdate transPostconcat.
            viewTrans).
        } | ) 



 '-- Side effects'

 globals modules window3d postFileIn
