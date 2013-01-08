 '$Revision: 20.3 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
         '


 '-- Module body'

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: examples InitialContents: FollowSlot'
        
         examples = bootstrap stub -> 'globals' -> 'modules' -> 'examples' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'examples' -> () _AddSlots: ( |
             {} = 'Comment: the prototype module object, I am created by init.self.\x7fModuleInfo: Creator: globals modules examples.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'examples' -> () _AddSlots: ( | {
         'ModuleInfo: Module: examples InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'examples' -> () _AddSlots: ( | {
         'ModuleInfo: Module: examples InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui3D'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'examples' -> () _AddSlots: ( | {
         'ModuleInfo: Module: examples InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'examples' -> () _AddSlots: ( | {
         'ModuleInfo: Module: examples InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 20.3 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'examples' -> () _AddSlots: ( | {
         'ModuleInfo: Module: examples InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: examples InitialContents: FollowSlot'
        
         examples = bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'examples' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals windowing xgl examples.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'examples' -> () _AddSlots: ( | {
         'ModuleInfo: Module: examples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'examples' -> 'parent' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals windowing xgl examples parent.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'examples' -> 'parent' -> () _AddSlots: ( | {
         'ModuleInfo: Module: examples InitialContents: FollowSlot'
        
         lightTest: sysState = ( | 
             buf.
             ctx3d.
             facetList.
             inqInfo.
             lights.
             lightSwitches.
             objDesc.
             origin.
             ptList.
             sWin.
             viewTrans.
             winRas.
             xglWin.
            | 

             "set up an XGL window"
             sWin:    (simpleWindow copy) openOnScreen: 0 WithName: 'Simple XGL Test' AndSize: 500@500.
             xglWin:  (xgl xWindow new) set_X_display: sWin display X_screen: sWin display screen number X_window: sWin xWindow.
             objDesc: ((xgl objDesc new) win_ras_type: xgl windowType winX) win_ras_desc: xglWin.
             inqInfo: sysState inquireHardware: objDesc.

             winRas:  sysState createXglObject: xgl objType winRas 
                                    ObjectDesc: objDesc 
                                 WithAttribute: xgl attribute devColorType 
                                     AttrValue: xgl colorType colorRgb
                                          Zero: 0.
             winRas setAttribute: xgl attribute winRasBuffersRequested AttrValue: inqInfo maximum_buffer Zero: 0.
             winRas setAttribute: xgl attribute winRasBufDisplay       AttrValue: 0                      Zero: 0.
             winRas setAttribute: xgl attribute winRasBufDraw          AttrValue: 1                      Zero: 0.

             ctx3d:   sysState createXglObject: xgl objType ctx3d
                                    ObjectDesc: xgl objDesc nilObjDesc
                                 WithAttribute: xgl attribute ctxDevice
                                     AttrValue: winRas
                                          Zero: 0.
             ctx3d setAttribute: xgl attribute ctxVdcOrientation AttrValue: xgl vdcOrientation yUpZToward    Zero: 0.
             ctx3d setAttribute: xgl attribute ctx3dHlhsrMode    AttrValue: xgl hlhsrMode hlhsrZBuffer  Zero: 0.
             ctx3d setAttribute: xgl attribute ctxNewFrameAction
                      AttrValue: xgl ctxNewFrameAction ctxNewFrameHlhsrAction || xgl ctxNewFrameAction ctxNewFrameClear
                           Zero: 0.

             "set up view transform"
             origin: ((xgl pt new) pt_type: xgl ptType ptF3d) pt_f3d: (xgl ptF3d new) set_X: -6 Y: -8 Z: -7.5.
             viewTrans: sysState createXglObject: xgl objType trans
                                      ObjectDesc: xgl objDesc nilObjDesc
                                            Zero: 0.
             viewTrans transformTranslate: origin Update: xgl transUpdate transReplace.
             viewTrans transformRotate: pi negate / 2 
                                  Axis: xgl axis axisX 
                                Update: xgl transUpdate transPostconcat.
             viewTrans transformRotate: (origin pt_f3d x / origin pt_f3d y) arcTan + pi 
                                  Axis: xgl axis axisY 
                                Update: xgl transUpdate transPostconcat.
             viewTrans transformRotate: (origin pt_f3d z negate / ((origin pt_f3d x square + origin pt_f3d y square) squareRoot)) arcTan
                                  Axis: xgl axis axisX 
                                Update: xgl transUpdate transPostconcat.
             ctx3d setAttribute: xgl attribute ctxViewTrans AttrValue: viewTrans Zero: 0.

             ctx3d setAttribute: xgl attribute ctxVdcMap AttrValue: xgl vdcMap vdcMapAspect Zero: 0.
             ctx3d setAttribute: xgl attribute ctxVdcWindow
                      AttrValue: ((xgl boundsD3d new) set_Xmax: 2 Xmin: -2 Ymax: 2 Ymin: -2 Zmax: -10.5 Zmin: -14.5)
                           Zero: 0.

             "set up context lighting info"
             ctx3d setAttribute: xgl attribute ctx3dSurfFaceCull            AttrValue: xgl surfCullMode cullBack Zero: 0.
             ctx3d setAttribute: xgl attribute ctxSurfFrontColor            
                      AttrValue: ((xgl color new) rgb: (xgl colorRgb new) set_B: 0.8 G: 0.8 R: 0.8)    Zero: 0.
             ctx3d setAttribute: xgl attribute ctx3dSurfFrontIllumination   AttrValue: xgl surfIllumination illumPerFacet Zero: 0.
             ctx3d setAttribute: xgl attribute ctx3dSurfFrontAmbient        AttrValue: 0.3                       Zero: 0.
             ctx3d setAttribute: xgl attribute ctx3dSurfFrontDiffuse        AttrValue: 0.7                       Zero: 0.
             ctx3d setAttribute: xgl attribute ctx3dSurfFrontSpecular       AttrValue: 0.3                       Zero: 0.
             ctx3d setAttribute: xgl attribute ctx3dSurfFrontSpecularPower  AttrValue: 5                         Zero: 0.
             ctx3d setAttribute: xgl attribute ctx3dSurfFrontSpecularColor  
                      AttrValue: ((xgl color new) rgb: (xgl colorRgb new) set_B: 0.8 G: 0.8 R: 0.8)    Zero: 0.
             ctx3d setAttribute: xgl attribute ctx3dSurfFrontLightComponent
                      AttrValue: xgl lightEnableComponent lightEnableCompAmbient ||
                                 xgl lightEnableComponent lightEnableCompDiffuse ||
                                 xgl lightEnableComponent lightEnableCompSpecular                                Zero: 0.

             "set up lights"
             lights:        xgl genericObject newAsVector: 3.
             lightSwitches: xgl intVecProxy   new: 3.
             ctx3d setAttribute: xgl attribute ctx3dLightNum      AttrValue: 3 Zero: 0.
             ctx3d getAttribute: xgl attribute ctx3dLights        AttrValue: lights.
             ctx3d getAttribute: xgl attribute ctx3dLightSwitches AttrValue: lightSwitches.

             (lights at: 0) setAttribute: xgl attribute lightType  AttrValue: xgl lightType lightAmbient Zero: 0.
             (lights at: 0) setAttribute: xgl attribute lightColor 
                               AttrValue: ((xgl color new) rgb: (xgl colorRgb new) set_B: 0.95 G: 0.95 R: 0.95) 
                                    Zero: 0.

             (lights at: 1) setAttribute: xgl attribute lightType  AttrValue: xgl lightType lightDirectional Zero: 0.
             (lights at: 1) setAttribute: xgl attribute lightColor 
                               AttrValue: ((xgl color new) rgb: (xgl colorRgb new) set_B: 0.95 G: 0 R: 0) 
                                    Zero: 0.
             (lights at: 1) setAttribute: xgl attribute lightDirection
                               AttrValue: ((xgl ptF3d new) set_X: -1.5 Y: 1 Z: 0.4)      Zero: 0.

             (lights at: 2) setAttribute: xgl attribute lightType  AttrValue: xgl lightType lightPositional  Zero: 0.
             (lights at: 2) setAttribute: xgl attribute lightColor 
                               AttrValue: ((xgl color new) rgb: (xgl colorRgb new) set_B: 0 G: 0 R: 0.95) 
                                    Zero: 0.
             (lights at: 2) setAttribute: xgl attribute lightPosition 
                               AttrValue: ((xgl ptF3d new) set_X: -5 Y: 3 Z: 1)          Zero: 0.

            " (lights at: 3) setAttribute: xgl attribute lightType  AttrValue: xgl lightType lightSpot        Zero: 0.
             (lights at: 3) setAttribute: xgl attribute lightColor 
                               AttrValue: ((xgl color new) rgb: (xgl colorRgb new) set_B: 0 G: 0.95 R: 0) 
                                    Zero: 0.
             (lights at: 3) setAttribute: xgl attribute lightPosition 
                               AttrValue: ((xgl ptF3d new) set_X:  1 Y:  15 Z:  2)       Zero: 0.
             (lights at: 3) setAttribute: xgl attribute lightDirection
                               AttrValue: ((xgl ptF3d new) set_X: -1 Y: -15 Z: -2)       Zero: 0.
             (lights at: 3) setAttribute: xgl attribute lightSpotAngle    AttrValue: pi / 20       Zero: 0.
             (lights at: 3) setAttribute: xgl attribute lightSpotExponent AttrValue: 4             Zero: 0."

             ptList: (((xgl ptList new) pt_type: xgl ptType ptF3d) 
                                        num_pts: 4)
                                        pts_f3d: xgl ptF3d new: 4.
             ptList pts_f3d at: 0 Put: (xgl ptF3d new) set_X:  1 Y:  1 Z:  1.
             ptList pts_f3d at: 1 Put: (xgl ptF3d new) set_X:  1 Y:  0 Z: -1.
             ptList pts_f3d at: 2 Put: (xgl ptF3d new) set_X: -1 Y:  0 Z:  1.
             ptList pts_f3d at: 3 Put: (xgl ptF3d new) set_X: -1 Y:  1 Z: -1.

             facetList: (((xgl facetList new) facet_type: xgl facetType facetColor) 
                                              num_facets: 2) 
                                     facets_color_facets: xgl colorFacet new: 2.
             facetList facets_color_facets at: 0 Put: (xgl colorFacet new) color_rgb: (xgl colorRgb new) set_B: 1   G: 0 R: 0.
             facetList facets_color_facets at: 1 Put: (xgl colorFacet new) color_rgb: (xgl colorRgb new) set_B: 0.8 G: 0 R: 0.

             "do something interesting with all the stuff we've created"
             buf: 1.
             100 do: [
               ctx3d ctxNewFrame.

               ctx3d triangleList: facetList Points: ptList Flags: xgl tlistFlags tlistFlagTriStrip. 

               winRas setAttribute: xgl attribute winRasBufDisplay AttrValue: buf Zero: 0.
               buf: (buf + 1) % 2.
               winRas setAttribute: xgl attribute winRasBufDraw    AttrValue: buf Zero: 0
             ].

             "cleanup"
             ctx3d delete kill.
             facetList delete kill.
             inqInfo delete kill.
             (lights deleteVector: 3) kill.
             lightSwitches delete kill.
             objDesc delete kill.
             origin delete kill.
             ptList delete kill.
             viewTrans delete kill.
             winRas delete kill.
             xglWin delete kill.
             sWin close.
             self).
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'examples' -> 'parent' -> () _AddSlots: ( | {
         'ModuleInfo: Module: examples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'system' -> 'roots' -> 'oddball' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'examples' -> 'parent' -> () _AddSlots: ( | {
         'ModuleInfo: Module: examples InitialContents: FollowSlot'
        
         simpleTest: sysState = ( | 
             bkColor.
             buf.
             ctx3d.
             facetList.
             inqInfo.
             objDesc.
             ptList.
             sWin.
             winRas.
             xglWin.
            | 

            sWin:    (simpleWindow copy) openOnScreen: 0 WithName: 'Simple XGL Test' AndSize: 500@500.
            xglWin:  (xgl xWindow new) set_X_display: sWin display X_screen: sWin display screen number X_window: sWin xWindow.
            objDesc: ((xgl objDesc new) win_ras_type: xgl windowType winX) win_ras_desc: xglWin.
            inqInfo: sysState inquireHardware: objDesc.

            winRas:  sysState createXglObject: xgl objType winRas 
                                   ObjectDesc: objDesc 
                                WithAttribute: xgl attribute devColorType 
                                    AttrValue: xgl colorType colorRgb
                                         Zero: 0.
            winRas setAttribute: xgl attribute winRasBuffersRequested AttrValue: inqInfo maximum_buffer Zero: 0.
            winRas setAttribute: xgl attribute winRasBufDisplay       AttrValue: 0                      Zero: 0.
            winRas setAttribute: xgl attribute winRasBufDraw          AttrValue: 1                      Zero: 0.

            ctx3d:   sysState createXglObject: xgl objType ctx3d
                                   ObjectDesc: xgl objDesc nilObjDesc
                                WithAttribute: xgl attribute ctxDevice
                                    AttrValue: winRas
                                         Zero: 0.
            ctx3d setAttribute: xgl attribute ctxVdcOrientation AttrValue: xgl vdcOrientation yUpZToward    Zero: 0.
            ctx3d setAttribute: xgl attribute ctx3dHlhsrMode    AttrValue: xgl hlhsrMode hlhsrZBuffer  Zero: 0.
            ctx3d setAttribute: xgl attribute ctxNewFrameAction
                     AttrValue: xgl ctxNewFrameAction ctxNewFrameHlhsrAction || xgl ctxNewFrameAction ctxNewFrameClear
                          Zero: 0.

            ptList: (((xgl ptList new) pt_type: xgl ptType ptF3d) num_pts: 4) pts_f3d: xgl ptF3d new: 4.
            ptList pts_f3d at: 0 Put: (xgl ptF3d new) set_X: 100 Y: 100 Z: 0.
            ptList pts_f3d at: 1 Put: (xgl ptF3d new) set_X: 300 Y: 100 Z: 0.
            ptList pts_f3d at: 2 Put: (xgl ptF3d new) set_X: 100 Y: 300 Z: 0.
            ptList pts_f3d at: 3 Put: (xgl ptF3d new) set_X: 300 Y: 300 Z: 0.

            facetList: (((xgl facetList new) facet_type: xgl facetType facetColor) num_facets: 1) facets_color_facets: xgl colorFacet new: 1.
            facetList facets_color_facets at: 0 Put: (xgl colorFacet new) color_rgb: (xgl colorRgb new) set_B: 1 G: 0 R: 1.

            buf:      1.
            bkColor:  (xgl colorRgb new) set_B: 1 G: 0 R: 0.
            0 to: 2 By: 0.01 Do: [| :i. |
              bkColor b: i.
              ctx3d setAttribute: xgl attribute ctxBackgroundColor AttrValue: bkColor Zero: 0.

              ctx3d ctxNewFrame.
              ctx3d triangleList: facetList Points: ptList Flags: xgl tlistFlags tlistFlagTriRestart. 

              winRas setAttribute: xgl attribute winRasBufDisplay AttrValue: buf Zero: 0.
              buf: (buf + 1) % 2.
              winRas setAttribute: xgl attribute winRasBufDraw    AttrValue: buf Zero: 0
            ].

            bkColor delete kill.
            ctx3d delete kill.
            facetList delete kill.
            inqInfo delete kill.
            objDesc delete kill.
            ptList delete kill.
            winRas delete kill.
            xglWin delete kill.
            sWin close.
            self).
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'examples' -> 'parent' -> () _AddSlots: ( | {
         'ModuleInfo: Module: examples InitialContents: FollowSlot'
        
         transformTest: sysState = ( | 
             buf.
             ctx3d.
             facetList.
             inqInfo.
             objDesc.
             objTrans.
             origin.
             ptList.
             sWin.
             viewTrans.
             winRas.
             xglWin.
            | 

            sWin:    (simpleWindow copy) openOnScreen: 0 WithName: 'Simple XGL Test' AndSize: 500@500.
            xglWin:  (xgl xWindow new) set_X_display: sWin display X_screen: sWin display screen number X_window: sWin xWindow.
            objDesc: ((xgl objDesc new) win_ras_type: xgl windowType winX) win_ras_desc: xglWin.
            inqInfo: sysState inquireHardware: objDesc.

            winRas:  sysState createXglObject: xgl objType winRas 
                                   ObjectDesc: objDesc 
                                WithAttribute: xgl attribute devColorType 
                                    AttrValue: xgl colorType colorRgb
                                         Zero: 0.
            winRas setAttribute: xgl attribute winRasBuffersRequested AttrValue: inqInfo maximum_buffer Zero: 0.
            winRas setAttribute: xgl attribute winRasBufDisplay       AttrValue: 0                      Zero: 0.
            winRas setAttribute: xgl attribute winRasBufDraw          AttrValue: 1                      Zero: 0.

            ctx3d:   sysState createXglObject: xgl objType ctx3d
                                   ObjectDesc: xgl objDesc nilObjDesc
                                WithAttribute: xgl attribute ctxDevice
                                    AttrValue: winRas
                                         Zero: 0.
            ctx3d setAttribute: xgl attribute ctxVdcOrientation AttrValue: xgl vdcOrientation yUpZToward    Zero: 0.
            ctx3d setAttribute: xgl attribute ctx3dHlhsrMode    AttrValue: xgl hlhsrMode hlhsrZBuffer  Zero: 0.
            ctx3d setAttribute: xgl attribute ctxNewFrameAction
                     AttrValue: xgl ctxNewFrameAction ctxNewFrameHlhsrAction || xgl ctxNewFrameAction ctxNewFrameClear 
                          Zero: 0.

            origin: ((xgl pt new) pt_type: xgl ptType ptF3d) pt_f3d: (xgl ptF3d new) set_X: -6 Y: -8 Z: -7.5.
            viewTrans: sysState createXglObject: xgl objType trans
                                     ObjectDesc: xgl objDesc nilObjDesc
                                           Zero: 0.
            viewTrans transformTranslate: origin Update: xgl transUpdate transReplace.
            viewTrans transformRotate: pi negate / 2 
                                 Axis: xgl axis axisX 
                               Update: xgl transUpdate transPostconcat.
            viewTrans transformRotate:  (origin pt_f3d x / origin pt_f3d y) arcTan + 3.14159 
                                 Axis: xgl axis axisY 
                               Update: xgl transUpdate transPostconcat.
            viewTrans transformRotate: (origin pt_f3d z negate / ((origin pt_f3d x square + origin pt_f3d y square) squareRoot)) arcTan
                                 Axis: xgl axis axisX 
                               Update: xgl transUpdate transPostconcat.
            ctx3d setAttribute: xgl attribute ctxViewTrans AttrValue: viewTrans Zero: 0.

            ctx3d setAttribute: xgl attribute ctxVdcMap AttrValue: xgl vdcMap vdcMapAspect Zero: 0.
            ctx3d setAttribute: xgl attribute ctxVdcWindow
                     AttrValue: ((xgl boundsD3d new) set_Xmax: 2 Xmin: -2 Ymax: 2 Ymin: -2 Zmax: -10.5 Zmin: -14.5)
                          Zero: 0.

            ptList: (((xgl ptList new) pt_type: xgl ptType ptF3d) 
                                       num_pts: 4)
                                       pts_f3d: xgl ptF3d new: 4.
            ptList pts_f3d at: 0 Put: (xgl ptF3d new) set_X:  1 Y:  1 Z:  1.
            ptList pts_f3d at: 1 Put: (xgl ptF3d new) set_X:  1 Y:  0 Z: -1.
            ptList pts_f3d at: 2 Put: (xgl ptF3d new) set_X: -1 Y:  0 Z:  1.
            ptList pts_f3d at: 3 Put: (xgl ptF3d new) set_X: -1 Y:  1 Z: -1.

            facetList: (((xgl facetList new) facet_type: xgl facetType facetColor) 
                                             num_facets: 2) 
                                             facets_color_facets: xgl colorFacet new: 2.
            facetList facets_color_facets at: 0 Put: (xgl colorFacet new) color_rgb: (xgl colorRgb new) set_B: 1   G: 0 R: 0.
            facetList facets_color_facets at: 1 Put: (xgl colorFacet new) color_rgb: (xgl colorRgb new) set_B: 0.8 G: 0 R: 0.

            objTrans: sysState createXglObject: xgl objType trans
                                    ObjectDesc: xgl objDesc nilObjDesc
                                          Zero: 0.
            objTrans transformRotate: 0.01 Axis: xgl axis axisY Update: xgl transUpdate transReplace.

            buf: 1.
            500 do: [
              ctx3d ctxNewFrame.

              objTrans transformPointList: ptList Dest: ptList pts_f3d.
              ctx3d triangleList: facetList Points: ptList Flags: xgl tlistFlags tlistFlagTriStrip. 

              winRas setAttribute: xgl attribute winRasBufDisplay AttrValue: buf Zero: 0.
              buf: (buf + 1) % 2.
              winRas setAttribute: xgl attribute winRasBufDraw    AttrValue: buf Zero: 0
            ].

            ctx3d delete kill.
            facetList delete kill.
            inqInfo delete kill.
            objDesc delete kill.
            objTrans delete kill.
            origin delete kill.
            ptList delete kill.
            viewTrans delete kill.
            winRas delete kill.
            xglWin delete kill.
            sWin close.
            self).
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'examples' -> () _AddSlots: ( | {
         'ModuleInfo: Module: examples InitialContents: InitializeToExpression: (xgl systemState)'
        
         sysState <- bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'systemState' -> ().
        } | ) 



 '-- Side effects'

 globals modules examples postFileIn
