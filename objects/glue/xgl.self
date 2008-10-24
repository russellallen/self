 'Sun-$Revision: 30.7 $'
 '
Copyright 1994-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
         '


 '-- Module body'

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot'
        
         xgl = bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals modules xgl.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- 'xgl is cool!'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'glue'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot'

         postFileIn = ( |
             {} = 'ModuleInfo: Creator: globals modules xgl postFileIn.
'.

            | 
            "TODO: make this handle multiple levels of objects and 
             make it set the creator path also"
            "xgl raw _Mirror do: [ | :s | 
               s contents do: [ | :s | 
                 s module isEmpty ifTrue: [ s module: 'xgl' ]
               ] 
            ].
            traits xgl raw _Mirror do: [ | :s | 
               s contents do: [ | :s | 
                 s module isEmpty ifTrue: [ s module: 'xgl' ] 
               ] 
            ]."
            self).
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- 'xgl_wrappers'.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot\x7fVisibility: public'
        
         xgl = bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals windowing xgl.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot'
        
         raw* = bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals windowing xgl raw.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot'
        
         constants* = bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals windowing xgl raw constants.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot\x7fVisibility: public'
        
         xgl = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: traits windowing xgl.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot'
        
         raw* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: traits windowing xgl raw.
'.
            | ) .
        } | ) 


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  systemState = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-systemState'.
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  systemState = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw systemState.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'systemState' -> ().
  |).
|).

bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  genericObject = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-genericObject'.
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  genericObject = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw genericObject.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'genericObject' -> ().
  |).
|).



bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  xWindow = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-xWindow'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  xWindow = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw xWindow.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'xWindow' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  accumDepth = (|
    accumDepth1x = 0.
    accumDepth2x = 1.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcAd3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-arcAd3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcAd3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw arcAd3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'arcAd3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcAf3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-arcAf3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcAf3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw arcAf3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'arcAf3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcD2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-arcD2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcD2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw arcD2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'arcD2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-arcD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw arcD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'arcD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcF2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-arcF2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcF2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw arcF2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'arcF2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-arcF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw arcF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'arcF3d' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  arcFillStyle = (|
    arcChord = 2.
    arcOpen = 0.
    arcSector = 1.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcI2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-arcI2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcI2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw arcI2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'arcI2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-arcList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  arcList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw arcList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'arcList' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  atextStyle = (|
    atextStyleLine = 1.
    atextStyleNormal = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  attribute = (|
    ctx3dAccumOpDest = 2632.
    ctx3dBlendDrawMode = 2631.
    ctx3dBlendFreezeZBuffer = 2630.
    ctx3dDepthCueColor = 2614.
    ctx3dDepthCueInterp = 2612.
    ctx3dDepthCueMode = 2613.
    ctx3dDepthCueRefPlanes = 2615.
    ctx3dDepthCueScaleFactors = 2616.
    ctx3dHlhsrData = 2627.
    ctx3dHlhsrMode = 2626.
    ctx3dJitterOffset = 2633.
    ctx3dLights = 2519.
    ctx3dLightNum = 2518.
    ctx3dLightSwitches = 2708.
    ctx3dLineColorInterp = 2646.
    ctx3dModelClipPlanes = 2610.
    ctx3dModelClipPlaneNum = 2609.
    ctx3dNormalTrans = 2517.
    ctx3dSurfBackAmbient = 2688.
    ctx3dSurfBackColor = 2678.
    ctx3dSurfBackColorSelector = 2682.
    ctx3dSurfBackDiffuse = 2690.
    ctx3dSurfBackDmap = 2523.
    ctx3dSurfBackDmapNum = 2522.
    ctx3dSurfBackDmapSwitches = 2704.
    ctx3dSurfBackFillStyle = 2679.
    ctx3dSurfBackFpat = 2681.
    ctx3dSurfBackFpatPosition = 2680.
    ctx3dSurfBackIllumination = 2686.
    ctx3dSurfBackLightComponent = 2700.
    ctx3dSurfBackSpecular = 2692.
    ctx3dSurfBackSpecularColor = 2694.
    ctx3dSurfBackSpecularPower = 2696.
    ctx3dSurfBackTransp = 2684.
    ctx3dSurfDcOffset = 2673.
    ctx3dSurfFaceCull = 2674.
    ctx3dSurfFaceDistinguish = 2675.
    ctx3dSurfFrontAmbient = 2687.
    ctx3dSurfFrontDiffuse = 2689.
    ctx3dSurfFrontDmap = 2521.
    ctx3dSurfFrontDmapNum = 2520.
    ctx3dSurfFrontDmapSwitches = 2703.
    ctx3dSurfFrontIllumination = 2685.
    ctx3dSurfFrontLightComponent = 2699.
    ctx3dSurfFrontSpecular = 2691.
    ctx3dSurfFrontSpecularColor = 2693.
    ctx3dSurfFrontSpecularPower = 2695.
    ctx3dSurfFrontTransp = 2683.
    ctx3dSurfGeomNormal = 2705.
    ctx3dSurfNormalFlip = 2676.
    ctx3dSurfSilhouetteEdgeFlag = 2677.
    ctx3dSurfTranspBlendEq = 2706.
    ctx3dSurfTranspMethod = 2707.
    ctx3dViewClipPlusWOnly = 2611.
    ctx3dZBufferCompMethod = 2628.
    ctx3dZBufferWriteMask = 2629.
    cmapAttr = 300.
    cmapColorCubeBsize = 313.
    cmapColorCubeGsize = 312.
    cmapColorCubeRsize = 311.
    cmapColorCubeSize = 310.
    cmapColorMapper = 303.
    cmapColorTable = 307.
    cmapColorTableSize = 305.
    cmapDitherMask = 315.
    cmapDitherMaskN = 314.
    cmapInverseColorMapper = 304.
    cmapMaxColorTableSize = 306.
    cmapName = 301.
    cmapRampList = 309.
    cmapRampNum = 308.
    ctxArcFillStyle = 2672.
    ctxAtextAlignHoriz = 2748.
    ctxAtextAlignVert = 2749.
    ctxAtextCharHeight = 2743.
    ctxAtextCharSlantAngle = 2745.
    ctxAtextCharUpVector = 2744.
    ctxAtextPath = 2747.
    ctxAtextStyle = 2746.
    ctxAttrEnv = 2500.
    ctxAttrGfx = 2600.
    ctxAttrGfxMax = 2850.
    ctxBackgroundColor = 2620.
    ctxClipPlanes = 2607.
    ctxDcViewport = 2606.
    ctxDeferralMode = 2502.
    ctxDevice = 2501.
    ctxEdgeAaBlendEq = 2661.
    ctxEdgeAaFilterShape = 2663.
    ctxEdgeAaFilterWidth = 2662.
    ctxEdgeAltColor = 2670.
    ctxEdgeCap = 2665.
    ctxEdgeColor = 2664.
    ctxEdgeJoin = 2666.
    ctxEdgeMiterLimit = 2667.
    ctxEdgePattern = 2669.
    ctxEdgeStyle = 2668.
    ctxEdgeWidthScaleFactor = 2671.
    ctxGeomDataIsVolatile = 2516.
    ctxGlobalModelTrans = 2602.
    ctxLineAaBlendEq = 2634.
    ctxLineAaFilterShape = 2636.
    ctxLineAaFilterWidth = 2635.
    ctxLineAltColor = 2643.
    ctxLineCap = 2638.
    ctxLineColor = 2637.
    ctxLineColorSelector = 2645.
    ctxLineJoin = 2639.
    ctxLineMiterLimit = 2640.
    ctxLinePattern = 2642.
    ctxLineStyle = 2641.
    ctxLineWidthScaleFactor = 2644.
    ctxLocalModelTrans = 2601.
    ctxMarker = 2718.
    ctxMarkerAaBlendEq = 2719.
    ctxMarkerAaFilterShape = 2721.
    ctxMarkerAaFilterWidth = 2720.
    ctxMarkerColor = 2722.
    ctxMarkerColorSelector = 2724.
    ctxMarkerScaleFactor = 2723.
    ctxMaxTessellation = 2648.
    ctxMcToDcTrans = 2507.
    ctxMinTessellation = 2647.
    ctxModelTrans = 2506.
    ctxModelTransStackSize = 2509.
    ctxNewFrameAction = 2625.
    ctxNurbsCurveApprox = 2649.
    ctxNurbsCurveApproxVal = 2650.
    ctxNurbsSurfApprox = 2709.
    ctxNurbsSurfApproxValU = 2710.
    ctxNurbsSurfApproxValV = 2711.
    ctxNurbsSurfIsoCurvePlacement = 2713.
    ctxNurbsSurfIsoCurveUNum = 2714.
    ctxNurbsSurfIsoCurveVNum = 2715.
    ctxNurbsSurfParamStyle = 2712.
    ctxPickAperture = 2513.
    ctxPickBufferSize = 2510.
    ctxPickEnable = 2511.
    ctxPickId1 = 2750.
    ctxPickId2 = 2751.
    ctxPickStyle = 2512.
    ctxPickSurfStyle = 2514.
    ctxPlaneMask = 2618.
    ctxRasterFillStyle = 2621.
    ctxRasterFpat = 2624.
    ctxRasterFpatPosition = 2623.
    ctxRasterStippleColor = 2622.
    ctxRendering = 2503.
    ctxRenderingOrder = 2505.
    ctxRenderBuffer = 2504.
    ctxRop = 2619.
    ctxSfont0 = 2725.
    ctxSfont1 = 2726.
    ctxSfont2 = 2727.
    ctxSfont3 = 2728.
    ctxStextAaBlendEq = 2729.
    ctxStextAaFilterShape = 2731.
    ctxStextAaFilterWidth = 2730.
    ctxStextAlignHoriz = 2739.
    ctxStextAlignVert = 2740.
    ctxStextCharEncoding = 2732.
    ctxStextCharExpansionFactor = 2735.
    ctxStextCharHeight = 2733.
    ctxStextCharSlantAngle = 2738.
    ctxStextCharSpacing = 2734.
    ctxStextCharUpVector = 2737.
    ctxStextColor = 2742.
    ctxStextPath = 2736.
    ctxStextPrecision = 2741.
    ctxSurfAaBlendEq = 2651.
    ctxSurfAaFilterShape = 2653.
    ctxSurfAaFilterWidth = 2652.
    ctxSurfEdgeFlag = 2660.
    ctxSurfFrontColor = 2654.
    ctxSurfFrontColorSelector = 2659.
    ctxSurfFrontFillStyle = 2655.
    ctxSurfFrontFpat = 2658.
    ctxSurfFrontFpatPosition = 2657.
    ctxSurfInteriorRule = 2656.
    ctxThreshold = 2617.
    ctxVdcMap = 2608.
    ctxVdcOrientation = 2508.
    ctxVdcWindow = 2605.
    ctxViewClipBounds = 2604.
    ctxViewModelDataType = 2515.
    ctxViewTrans = 2603.
    devAttr = 400.
    devColorMap = 410.
    devColorType = 409.
    devContexts = 402.
    devContextsNum = 401.
    devMaximumCoordinates = 403.
    devPickBufferSize = 407.
    devRealColorType = 411.
    dmapAttr = 1500.
    dmapTextureAttr = 1600.
    dmapTextureDescriptors = 1607.
    dmapTextureNumDescriptors = 1606.
    dmapTextureOrientationMatrix = 1605.
    dmapTextureParamType = 1601.
    dmapTextureUIndex = 1603.
    dmapTextureVIndex = 1604.
    gcacheAttr = 900.
    gcacheBypassModelClip = 903.
    gcacheDisplayPrimType = 905.
    gcacheDoPolygonDecomp = 908.
    gcacheFacetListList = 907.
    gcacheIsEmpty = 901.
    gcacheNurbsCurveMode = 911.
    gcacheNurbsSurfMode = 912.
    gcacheOrigPrimType = 904.
    gcachePolygonType = 910.
    gcachePtListList = 906.
    gcacheShowDecompEdges = 909.
    gcacheUseApplGeom = 902.
    lightAttenuation1 = 1405.
    lightAttenuation2 = 1406.
    lightAttr = 1400.
    lightColor = 1402.
    lightDirection = 1403.
    lightPosition = 1404.
    lightSpotAngle = 1407.
    lightSpotExponent = 1408.
    lightType = 1401.
    lpatAttr = 1200.
    lpatBalancedDash = 1207.
    lpatCoordSys = 1201.
    lpatData = 1204.
    lpatDataSize = 1203.
    lpatDataType = 1202.
    lpatOffset = 1205.
    lpatStyle = 1206.
    markerAttr = 1100.
    markerDescription = 1101.
    memRasAttr = 700.
    memRasImageBufferAddr = 701.
    memRasZBufferAddr = 702.
    mipmapTextureAttr = 1800.
    mipmapTextureDepth = 1803.
    mipmapTextureHeight = 1802.
    mipmapTextureLevels = 1804.
    mipmapTextureMemRasList = 1805.
    mipmapTextureWidth = 1801.
    objApplicationData = 102.
    objAttr = 100.
    objSysState = 103.
    objType = 101.
    rasAttr = 500.
    rasDepth = 501.
    rasHeight = 503.
    rasRectList = 505.
    rasRectNum = 504.
    rasSourceBuffer = 506.
    rasWidth = 502.
    sfontAttr = 1300.
    sfontComment = 1302.
    sfontDefaultCharacter = 1304.
    sfontIsMonoSpaced = 1303.
    sfontName = 1301.
    streamAttr = 800.
    streamAttr01 = 801.
    streamAttr02 = 802.
    streamAttr03 = 803.
    streamAttr04 = 804.
    streamAttr05 = 805.
    streamAttr06 = 806.
    streamAttr07 = 807.
    streamAttr08 = 808.
    streamAttr09 = 809.
    streamAttr10 = 810.
    streamAttr11 = 811.
    streamAttr12 = 812.
    streamAttr13 = 813.
    streamAttr14 = 814.
    streamAttr15 = 815.
    streamAttr16 = 816.
    streamAttr17 = 817.
    streamAttr18 = 818.
    streamAttr19 = 819.
    streamAttr20 = 820.
    streamAttr21 = 821.
    streamAttr22 = 822.
    streamAttr23 = 823.
    streamAttr24 = 824.
    streamAttr25 = 825.
    streamAttr26 = 826.
    streamAttr27 = 827.
    streamAttr28 = 828.
    streamAttr29 = 829.
    streamAttr30 = 830.
    streamAttr31 = 831.
    streamAttr32 = 832.
    streamAttr33 = 833.
    streamAttr34 = 834.
    streamAttr35 = 835.
    streamAttr36 = 836.
    streamAttr37 = 837.
    streamAttr38 = 838.
    streamAttr39 = 839.
    streamAttr40 = 840.
    streamAttr41 = 841.
    streamAttr42 = 842.
    streamAttr43 = 843.
    streamAttr44 = 844.
    streamAttr45 = 845.
    streamAttr46 = 846.
    streamAttr47 = 847.
    streamAttr48 = 848.
    streamAttr49 = 849.
    streamAttr50 = 850.
    streamAttr51 = 851.
    streamAttr52 = 852.
    streamAttr53 = 853.
    streamAttr54 = 854.
    streamAttr55 = 855.
    streamAttr56 = 856.
    streamAttr57 = 857.
    streamAttr58 = 858.
    streamAttr59 = 859.
    streamAttr60 = 860.
    streamAttr61 = 861.
    streamAttr62 = 862.
    streamAttr63 = 863.
    streamAttr64 = 864.
    streamAttr65 = 865.
    streamAttr66 = 866.
    streamAttr67 = 867.
    streamAttr68 = 868.
    streamAttr69 = 869.
    streamAttr70 = 870.
    streamAttr71 = 871.
    streamAttr72 = 872.
    streamAttr73 = 873.
    streamAttr74 = 874.
    streamAttr75 = 875.
    streamAttr76 = 876.
    streamAttr77 = 877.
    streamAttr78 = 878.
    streamAttr79 = 879.
    streamAttr80 = 880.
    streamAttr81 = 881.
    streamAttr82 = 882.
    streamAttr83 = 883.
    streamAttr84 = 884.
    streamAttr85 = 885.
    streamAttr86 = 886.
    streamAttr87 = 887.
    streamAttr88 = 888.
    streamAttr89 = 889.
    streamAttr90 = 890.
    streamAttr91 = 891.
    streamAttr92 = 892.
    streamAttr93 = 893.
    streamAttr94 = 894.
    streamAttr95 = 895.
    streamAttr96 = 896.
    streamAttr97 = 897.
    streamAttr98 = 898.
    streamAttr99 = 899.
    sysStAttr = 200.
    sysStErrorDetection = 201.
    sysStErrorInfo = 203.
    sysStErrorNotificationFunction = 202.
    sysStSfontDirectory = 206.
    sysStVersion = 205.
    tbdAttr = 1900.
    textureAttr = 1700.
    transAttr = 1000.
    transDataType = 1002.
    transDimension = 1001.
    unused = 0.
    winRasAttr = 600.
    winRasBackingStore = 609.
    winRasBuffersAllocated = 611.
    winRasBuffersRequested = 610.
    winRasBufDisplay = 613.
    winRasBufDraw = 612.
    winRasBufMinDelay = 614.
    winRasDescriptor = 602.
    winRasPixelMapping = 604.
    winRasPosition = 603.
    winRasStereoMode = 615.
    winRasType = 601.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  axis = (|
    axisX = 0.
    axisY = 1.
    axisZ = 2.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bbox = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-bbox'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bbox = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw bbox.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'bbox' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bboxD2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-bboxD2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bboxD2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw bboxD2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'bboxD2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bboxD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-bboxD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bboxD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw bboxD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'bboxD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bboxF2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-bboxF2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bboxF2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw bboxF2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'bboxF2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bboxF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-bboxF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bboxF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw bboxF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'bboxF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bboxI2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-bboxI2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bboxI2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw bboxI2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'bboxI2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bboxStatus = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-bboxStatus'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  bboxStatus = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw bboxStatus.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'bboxStatus' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  bboxType = (|
    bboxD2d = 4.
    bboxD3d = 5.
    bboxF2d = 1.
    bboxF3d = 2.
    bboxI2d = 0.
    bboxStatus = 3.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  blendDrawMode = (|
    blendDrawAll = 0.
    blendDrawBlended = 2.
    blendDrawNotBlended = 1.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  blendEq = (|
    blendAddToBg = 3.
    blendArbitraryBg = 1.
    blendConstBg = 2.
    blendNone = 0.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsD1d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-boundsD1d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsD1d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw boundsD1d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'boundsD1d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsD2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-boundsD2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsD2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw boundsD2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'boundsD2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-boundsD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw boundsD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'boundsD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsF1d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-boundsF1d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsF1d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw boundsF1d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'boundsF1d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsF2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-boundsF2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsF2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw boundsF2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'boundsF2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-boundsF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw boundsF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'boundsF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsI2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-boundsI2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  boundsI2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw boundsI2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'boundsI2d' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  bufferSel = (|
    bufferSelAccum = -4.
    bufferSelDisplay = -2.
    bufferSelDraw = -3.
    bufferSelNone = -1.
    bufferSelZ = -5.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  cacheDisplay = (|
    cacheAttrStateDifferent = 2.
    cacheDisplayOk = 1.
    cacheNotChecked = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  charEncoding = (|
    charIso = 1.
    charMby = 0.
    multiStr = 2.
    singleStr = 0.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleAd3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-circleAd3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleAd3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw circleAd3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'circleAd3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleAf3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-circleAf3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleAf3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw circleAf3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'circleAf3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleD2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-circleD2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleD2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw circleD2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'circleD2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-circleD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw circleD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'circleD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleF2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-circleF2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleF2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw circleF2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'circleF2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-circleF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw circleF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'circleF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleI2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-circleI2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleI2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw circleI2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'circleI2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-circleList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  circleList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw circleList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'circleList' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  clipPlanes = (|
    clipXmax = 2.
    clipXmin = 1.
    clipYmax = 8.
    clipYmin = 4.
    clipZmax = 32.
    clipZmin = 16.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  color = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-color'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  color = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw color.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'color' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorFacet = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-colorFacet'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorFacet = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw colorFacet.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'colorFacet' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorHomogeneous = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-colorHomogeneous'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorHomogeneous = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw colorHomogeneous.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'colorHomogeneous' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  colorHomogeneousType = (|
    colorRgbw = 0.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-colorList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw colorList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'colorList' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorNormalFacet = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-colorNormalFacet'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorNormalFacet = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw colorNormalFacet.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'colorNormalFacet' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorRgb = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-colorRgb'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorRgb = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw colorRgb.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'colorRgb' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorRgbw = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-colorRgbw'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorRgbw = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw colorRgbw.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'colorRgbw' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  colorType = (|
    colorGray = 1.
    colorIndex = 0.
    colorRgb = 2.
    colorZ = 3.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorTypeSupported = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-colorTypeSupported'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  colorTypeSupported = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw colorTypeSupported.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'colorTypeSupported' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  ctxNewFrameAction = (|
    ctxNewFrameClear = 2.
    ctxNewFrameHlhsrAction = 4.
    ctxNewFrameNone = 0.
    ctxNewFrameSwitchBuffer = 8.
    ctxNewFrameVretrace = 1.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  curveApprox = (|
    curveChordalDeviationDc = 7.
    curveChordalDeviationVdc = 6.
    curveChordalDeviationWc = 5.
    curveConstParamSubdivBetweenKnots = 1.
    curveMetricDc = 4.
    curveMetricVdc = 3.
    curveMetricWc = 2.
    curveRelativeDc = 10.
    curveRelativeVdc = 9.
    curveRelativeWc = 8.
    curveUnused = 0.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  curveColorSpline = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-curveColorSpline'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  curveColorSpline = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw curveColorSpline.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'curveColorSpline' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  dataType = (|
    dataDbl = 2.
    dataFlt = 1.
    dataInt = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  deferralMode = (|
    deferAsap = 1.
    deferAsti = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  depthCueMode = (|
    depthCueLinear = 1.
    depthCueOff = 0.
    depthCueScaled = 2.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ellAd3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ellAd3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ellAd3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ellAd3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ellAd3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ellAf3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ellAf3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ellAf3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ellAf3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ellAf3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ellD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ellD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ellD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ellD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ellD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ellF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ellF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ellF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ellF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ellF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ellList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ellList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ellList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ellList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ellList' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  errorCategory = (|
    errorArithmetic = 3.
    errorConfiguration = 1.
    errorResource = 2.
    errorSystem = 0.
    errorUser = 4.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  errorInfo = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-errorInfo'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  errorInfo = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw errorInfo.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'errorInfo' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  errorType = (|
    errorNonrecoverable = 1.
    errorRecoverable = 0.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  facet = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-facet'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  facet = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw facet.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'facet' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  facetFlags = (|
    facetFlagAllMasks = 127.
    facetFlagDataContig = 64.
    facetFlagDataContigMask = 64.
    facetFlagDataNotContig = 0.
    facetFlagFnConsistent = 16.
    facetFlagFnConsistentMask = 48.
    facetFlagFnNotConsistent = 0.
    facetFlagIsPlanar = 128.
    facetFlagShapeConvex = 8.
    facetFlagShapeMask = 12.
    facetFlagShapeNonconvex = 4.
    facetFlagShapeUnknown = 0.
    facetFlagShowIntEdges = 256.
    facetFlagSidesAre3 = 1.
    facetFlagSidesAre4 = 2.
    facetFlagSidesMask = 3.
    facetFlagSidesUnspecified = 0.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  facetList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-facetList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  facetList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw facetList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'facetList' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  facetListList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-facetListList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  facetListList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw facetListList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'facetListList' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  facetType = (|
    facetColor = 1.
    facetColorNormal = 3.
    facetNone = 0.
    facetNormal = 2.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  filterShape = (|
    filterGaussian = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  flushAction = (|
    flushBuffers = 2.
    flushGeomData = 1.
    flushSynchronize = 4.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  gcacheNurbsMode = (|
    gcacheNurbsCombined = 1.
    gcacheNurbsDynamic = 0.
    gcacheNurbsStatic = 2.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  geomNormal = (|
    geomNormalFirstPoints = 0.
    geomNormalLastPoints = 1.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  geomStatus = (|
    geomStatusFacingBack = 64.
    geomStatusFacingFront = 32.
    geomStatusModelAccept = 8.
    geomStatusModelReject = 16.
    geomStatusViewAccept = 1.
    geomStatusViewReject = 2.
    geomStatusViewSmall = 4.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  hlhsrMode = (|
    hlhsrNone = 0.
    hlhsrZBuffer = 1.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  inqSupportLevel = (|
    inqHardware = 2.
    inqNotSupported = 0.
    inqSoftware = 1.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  inquire = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-inquire'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  inquire = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw inquire.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'inquire' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  interiorRule = (|
    evenOdd = 1.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  irect = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-irect'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  irect = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw irect.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'irect' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  irectList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-irectList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  irectList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw irectList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'irectList' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  isoCurvePlacement = (|
    isoCurveBetweenKnots = 0.
    isoCurveBetweenLimits = 1.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  lightEnableComponent = (|
    lightEnableCompAmbient = 1.
    lightEnableCompDiffuse = 2.
    lightEnableCompSpecular = 4.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  lightType = (|
    lightAmbient = 0.
    lightDirectional = 1.
    lightPositional = 2.
    lightSpot = 3.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  lineCap = (|
    capButt = 0.
    capRound = 1.
    capSquare = 2.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  lineColorSel = (|
    lineColorContext = 0.
    lineColorVertex = 1.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  lineJoin = (|
    joinBevel = 2.
    joinDevice = 3.
    joinMiter = 0.
    joinRound = 1.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  lineStyle = (|
    lineAltPatterned = 2.
    linePatterned = 1.
    lineSolid = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  lpatBalDash = (|
    lpatBalDash0 = 0.
    lpatBalDash1 = 1.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  lpatCoordSys = (|
    lpatDc = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  lpatStyle = (|
    lpatBalancedSegment = 1.
    lpatFixedOffset = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  markerColorSel = (|
    markerColorContext = 0.
    markerColorPoint = 1.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  matrixD2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-matrixD2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  matrixD2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw matrixD2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'matrixD2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  matrixD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-matrixD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  matrixD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw matrixD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'matrixD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  matrixF2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-matrixF2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  matrixF2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw matrixF2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'matrixF2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  matrixF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-matrixF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  matrixF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw matrixF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'matrixF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  matrixI2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-matrixI2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  matrixI2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw matrixI2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'matrixI2d' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  modelTransRequest = (|
    mtrGlobalTrans = 8.
    mtrLocalTrans = 4.
    mtrNewLevel = 16.
    mtrPop = 2.
    mtrPush = 1.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  monoText = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-monoText'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  monoText = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw monoText.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'monoText' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  monoTextList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-monoTextList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  monoTextList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw monoTextList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'monoTextList' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  multiarcType = (|
    multiarcAd3d = 6.
    multiarcAf3d = 4.
    multiarcD2d = 2.
    multiarcD3d = 5.
    multiarcF2d = 1.
    multiarcF3d = 3.
    multiarcI2d = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  multicircleType = (|
    multicircleAd3d = 6.
    multicircleAf3d = 4.
    multicircleD2d = 2.
    multicircleD3d = 5.
    multicircleF2d = 1.
    multicircleF3d = 3.
    multicircleI2d = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  multiellType = (|
    multiellarcAd3d = 3.
    multiellarcAf3d = 1.
    multiellarcD3d = 2.
    multiellarcF3d = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  multirectType = (|
    multirectAd3d = 6.
    multirectAf3d = 4.
    multirectD2d = 2.
    multirectD3d = 5.
    multirectF2d = 1.
    multirectF3d = 3.
    multirectI2d = 0.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  normalFacet = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-normalFacet'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  normalFacet = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw normalFacet.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'normalFacet' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  nuBsplineCurve = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-nuBsplineCurve'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  nuBsplineCurve = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw nuBsplineCurve.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'nuBsplineCurve' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  nurbsCurve = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-nurbsCurve'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  nurbsCurve = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw nurbsCurve.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'nurbsCurve' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  nurbsSurf = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-nurbsSurf'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  nurbsSurf = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw nurbsSurf.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'nurbsSurf' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  nurbsSurfParamStyle = (|
    surfDeviceDependent = -1.
    surfIncrSilhouetteTess = 16.
    surfIsoCurves = 1.
    surfPlain = 0.
    surfShowTessellation = 8.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  nurbsSurfSimpleGeom = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-nurbsSurfSimpleGeom'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  nurbsSurfSimpleGeom = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw nurbsSurfSimpleGeom.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'nurbsSurfSimpleGeom' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  nurbsSurfType = (|
    surfConical = 3.
    surfCylindrical = 2.
    surfNurbs = 0.
    surfPlanar = 1.
    surfSpherical = 4.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  objDesc = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-objDesc'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  objDesc = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw objDesc.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'objDesc' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  objType = (|
    ctx2d = 1.
    ctx3d = 2.
    cmap = 6.
    dmapTexture = 15.
    gcache = 13.
    light = 8.
    lpat = 11.
    marker = 9.
    memRas = 3.
    mipmapTexture = 17.
    obj = 0.
    sfont = 10.
    stream = 5.
    sysState = 12.
    trans = 7.
    winRas = 4.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  pickInfo = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-pickInfo'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  pickInfo = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw pickInfo.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'pickInfo' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  pickStyle = (|
    pickFirstN = 1.
    pickLastN = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  pickSurfStyle = (|
    pickSurfAsFillStyle = 1.
    pickSurfAsSolid = 0.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  plane = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-plane'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  plane = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw plane.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'plane' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  planeList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-planeList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  planeList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw planeList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'planeList' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  polygonType = (|
    polygonComplex = 0.
    polygonNsi = 1.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  primitiveType = (|
    primAnnotationText = 15.
    primEllipticalArc = 7.
    primImage = 16.
    primMultiarc = 5.
    primMulticircle = 6.
    primMultimarker = 1.
    primMultipolyline = 2.
    primMultirectangle = 4.
    primMultiSimplePolygon = 8.
    primNone = 0.
    primNurbsCurve = 3.
    primNurbsSurface = 13.
    primPolygon = 9.
    primQuadrilateralMesh = 12.
    primStrokeText = 14.
    primTriangleList = 10.
    primTriangleStrip = 11.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  pt = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-pt'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  pt = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw pt.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'pt' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorD2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorD2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorD2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorD2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorD2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorDataF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorDataF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorDataF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorDataF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorDataF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorF2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorF2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorF2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorF2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorF2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorFlagD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorFlagD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorFlagD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorFlagD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorFlagD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorFlagDataF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorFlagDataF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorFlagDataF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorFlagDataF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorFlagDataF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorFlagF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorFlagF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorFlagF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorFlagF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorFlagF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorI2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorI2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorI2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorI2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorI2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorNormalD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorNormalD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorNormalD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorNormalD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorNormalD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorNormalDataF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorNormalDataF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorNormalDataF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorNormalDataF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorNormalDataF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorNormalF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorNormalF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorNormalF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorNormalF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorNormalF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorNormalFlagD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorNormalFlagD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorNormalFlagD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorNormalFlagD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorNormalFlagD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorNormalFlagDataF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorNormalFlagDataF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorNormalFlagDataF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorNormalFlagDataF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorNormalFlagDataF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorNormalFlagF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptColorNormalFlagF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptColorNormalFlagF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptColorNormalFlagF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptColorNormalFlagF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptD2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptD2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptD2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptD2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptD2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptD2h = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptD2h'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptD2h = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptD2h.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptD2h' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptD3h = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptD3h'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptD3h = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptD3h.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptD3h' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptDataF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptDataF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptDataF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptDataF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptDataF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptF2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptF2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptF2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptF2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptF2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptF2h = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptF2h'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptF2h = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptF2h.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptF2h' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptF3h = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptF3h'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptF3h = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptF3h.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptF3h' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptFlagD2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptFlagD2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptFlagD2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptFlagD2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptFlagD2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptFlagD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptFlagD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptFlagD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptFlagD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptFlagD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptFlagDataF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptFlagDataF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptFlagDataF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptFlagDataF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptFlagDataF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptFlagF2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptFlagF2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptFlagF2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptFlagF2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptFlagF2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptFlagF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptFlagF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptFlagF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptFlagF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptFlagF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptFlagI2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptFlagI2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptFlagI2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptFlagI2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptFlagI2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptI2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptI2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptI2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptI2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptI2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptI2h = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptI2h'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptI2h = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptI2h.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptI2h' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptList' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptListList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptListList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptListList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptListList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptListList' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptNormalD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptNormalD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptNormalD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptNormalD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptNormalD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptNormalDataF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptNormalDataF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptNormalDataF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptNormalDataF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptNormalDataF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptNormalF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptNormalF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptNormalF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptNormalF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptNormalF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptNormalFlagD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptNormalFlagD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptNormalFlagD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptNormalFlagD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptNormalFlagD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptNormalFlagDataF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptNormalFlagDataF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptNormalFlagDataF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptNormalFlagDataF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptNormalFlagDataF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptNormalFlagF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptNormalFlagF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptNormalFlagF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptNormalFlagF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptNormalFlagF3d' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  ptType = (|
    ptColorD2d = 46.
    ptColorD3d = 47.
    ptColorDataF3d = 1063.
    ptColorF2d = 38.
    ptColorF3d = 39.
    ptColorFlagD3d = 175.
    ptColorFlagDataF3d = 1191.
    ptColorFlagF3d = 167.
    ptColorI2d = 34.
    ptColorNormalD3d = 63.
    ptColorNormalDataF3d = 1079.
    ptColorNormalF3d = 55.
    ptColorNormalFlagD3d = 191.
    ptColorNormalFlagDataF3d = 1207.
    ptColorNormalFlagF3d = 183.
    ptD2d = 14.
    ptD2h = 270.
    ptD3d = 15.
    ptD3h = 271.
    ptDataF3d = 1031.
    ptF2d = 6.
    ptF2h = 262.
    ptF3d = 7.
    ptF3h = 263.
    ptFlagD2d = 142.
    ptFlagD3d = 143.
    ptFlagDataF3d = 1159.
    ptFlagF2d = 134.
    ptFlagF3d = 135.
    ptFlagI2d = 130.
    ptI2d = 2.
    ptI2h = 258.
    ptNormalD3d = 31.
    ptNormalDataF3d = 1047.
    ptNormalF3d = 23.
    ptNormalFlagD3d = 159.
    ptNormalFlagDataF3d = 1175.
    ptNormalFlagF3d = 151.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptTypeSupported = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-ptTypeSupported'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  ptTypeSupported = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw ptTypeSupported.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'ptTypeSupported' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  rasterFillStyle = (|
    rasFillCopy = 0.
    rasFillOpaqueStipple = 2.
    rasFillStipple = 1.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectAd3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-rectAd3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectAd3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw rectAd3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'rectAd3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectAf3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-rectAf3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectAf3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw rectAf3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'rectAf3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectD2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-rectD2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectD2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw rectD2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'rectD2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectD3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-rectD3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectD3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw rectD3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'rectD3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectF2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-rectF2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectF2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw rectF2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'rectF2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectF3d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-rectF3d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectF3d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw rectF3d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'rectF3d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectI2d = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-rectI2d'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectI2d = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw rectI2d.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'rectI2d' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-rectList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  rectList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw rectList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'rectList' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  renderComponent = (|
    renderCompDiffuseColor = 1.
    renderCompFinalColor = 3.
    renderCompReflectedColor = 2.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  renderComponentDesc = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-renderComponentDesc'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  renderComponentDesc = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw renderComponentDesc.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'renderComponentDesc' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  renderMode = (|
    renderAccumBuffer = 8.
    renderDisplayBuffer = 1.
    renderDrawBuffer = 2.
    renderNone = 0.
    renderZBuffer = 4.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  renderingOrder = (|
    renderingOrderAny = 2.
    renderingOrderGiven = 0.
    renderingOrderHlhsr = 1.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  ropMode = (|
    ropAnd = 8.
    ropAndInverted = 2.
    ropAndReverse = 4.
    ropClear = 0.
    ropClr = 0.
    ropCopy = 12.
    ropCopyInverted = 3.
    ropDst = 10.
    ropEquiv = 9.
    ropInvert = 5.
    ropNand = 7.
    ropNoop = 10.
    ropNor = 1.
    ropOr = 14.
    ropOrInverted = 11.
    ropOrReverse = 13.
    ropSet = 15.
    ropSrc = 12.
    ropXor = 6.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  segment = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-segment'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  segment = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw segment.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'segment' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  splineData = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-splineData'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  splineData = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw splineData.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'splineData' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  stereoMode = (|
    stereoLeft = 1.
    stereoNone = 0.
    stereoRight = 2.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  stextAlignHoriz = (|
    stextAlignHorizCenter = 1.
    stextAlignHorizLeft = 0.
    stextAlignHorizNormal = 3.
    stextAlignHorizRight = 2.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  stextAlignVert = (|
    stextAlignVertBase = 3.
    stextAlignVertBottom = 4.
    stextAlignVertCap = 1.
    stextAlignVertHalf = 2.
    stextAlignVertNormal = 5.
    stextAlignVertTop = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  stextPath = (|
    stextPathDown = 3.
    stextPathLeft = 1.
    stextPathRight = 0.
    stextPathUp = 2.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  stextPrecision = (|
    stextPrecisionStroke = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  surfApprox = (|
    surfConstParamSubdivBetweenKnots = 1.
    surfMetricDc = 4.
    surfMetricVdc = 3.
    surfMetricWc = 2.
    surfPlanarDeviationDc = 7.
    surfPlanarDeviationVdc = 6.
    surfPlanarDeviationWc = 5.
    surfRelativeDc = 10.
    surfRelativeVdc = 9.
    surfRelativeWc = 8.
    surfUnused = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  surfColorSel = (|
    surfColorContext = 0.
    surfColorFacet = 1.
    surfColorVertexIllumDep = 2.
    surfColorVertexIllumIndep = 3.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  surfColorSpline = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-surfColorSpline'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  surfColorSpline = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw surfColorSpline.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'surfColorSpline' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  surfCullMode = (|
    cullBack = 2.
    cullFront = 1.
    cullOff = 0.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  surfDataSpline = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-surfDataSpline'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  surfDataSpline = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw surfDataSpline.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'surfDataSpline' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  surfDataSplineList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-surfDataSplineList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  surfDataSplineList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw surfDataSplineList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'surfDataSplineList' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  surfFillStyle = (|
    surfFillEmpty = 5.
    surfFillHollow = 4.
    surfFillOpaqueStipple = 2.
    surfFillPattern = 3.
    surfFillSolid = 0.
    surfFillStipple = 1.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  surfIllumination = (|
    illumNone = 0.
    illumNoneInterpColor = 1.
    illumPerFacet = 2.
    illumPerVertex = 3.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  textureBlendRgb = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-textureBlendRgb'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  textureBlendRgb = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw textureBlendRgb.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'textureBlendRgb' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  textureBoundary = (|
    textureBoundaryClamp = 0.
    textureBoundaryTransparent = 2.
    textureBoundaryWrap = 1.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  textureColorCompInfo = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-textureColorCompInfo'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  textureColorCompInfo = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw textureColorCompInfo.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'textureColorCompInfo' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  textureDecalRgb = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-textureDecalRgb'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  textureDecalRgb = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw textureDecalRgb.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'textureDecalRgb' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  textureDesc = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-textureDesc'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  textureDesc = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw textureDesc.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'textureDesc' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  textureInterpInfo = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-textureInterpInfo'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  textureInterpInfo = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw textureInterpInfo.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'textureInterpInfo' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  textureInterpMethod = (|
    textureInterpBilinear = 1.
    textureInterpMipmapBilinear = 3.
    textureInterpMipmapPoint = 2.
    textureInterpMipmapTrilinear = 4.
    textureInterpPoint = 0.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  textureMipmapDesc = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-textureMipmapDesc'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  textureMipmapDesc = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw textureMipmapDesc.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'textureMipmapDesc' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  textureOp = (|
    textureOpBlend = 4.
    textureOpDecal = 3.
    textureOpModulate = 1.
    textureOpNone = 0.
    textureOpReplace = 2.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  textureParamType = (|
    textureParamExplicit = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  textureType = (|
    textureTypeMipmap = 0.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  threshold = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-threshold'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  threshold = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw threshold.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'threshold' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  tlistFlags = (|
    tlistFlagAllMasks = 63.
    tlistFlagEdgesOn = 4.
    tlistFlagFnConsistent = 16.
    tlistFlagFnConsistentMask = 48.
    tlistFlagFnNotConsistent = 0.
    tlistFlagIsPlanar = 8.
    tlistFlagTriMask = 3.
    tlistFlagTriRestart = 0.
    tlistFlagTriStar = 2.
    tlistFlagTriStrip = 1.
    tlistFlagUseVtxFlags = 3.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  transDimension = (|
    trans2d = 0.
    trans3d = 1.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  transGroup = (|
    transGroupAffine = 256.
    transGroupAnglePreserv = 128.
    transGroupIdentity = 1.
    transGroupLengthPreserv = 64.
    transGroupLimPerspective = 512.
    transGroupRotation = 8.
    transGroupScale = 4.
    transGroupShearScale = 32.
    transGroupTranslation = 2.
    transGroupWindow = 16.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  transIndex = (|
    transIndexAffine = 8.
    transIndexAnglePreserv = 7.
    transIndexIdentity = 0.
    transIndexLengthPreserv = 6.
    transIndexLimPerspective = 9.
    transIndexMax = 10.
    transIndexRotation = 3.
    transIndexScale = 2.
    transIndexShearScale = 5.
    transIndexTranslation = 1.
    transIndexWindow = 4.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  transMember = (|
    transMemberAffine = 256.
    transMemberAnglePreserv = 384.
    transMemberIdentity = 1023.
    transMemberLengthPreserv = 448.
    transMemberLimPerspective = 512.
    transMemberRotation = 456.
    transMemberScale = 820.
    transMemberShearScale = 800.
    transMemberTranslation = 978.
    transMemberWindow = 784.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  transUpdate = (|
    transPostconcat = 2.
    transPreconcat = 1.
    transReplace = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  transpMethod = (|
    transpBlended = 2.
    transpNone = 0.
    transpScreenDoor = 1.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  trimCurve = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-trimCurve'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  trimCurve = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw trimCurve.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'trimCurve' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  trimCurveApprox = (|
    trimCurveConstParamSubdivBetweenKnots = 0.
    trimCurveViewDependent = 1.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  trimLoop = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-trimLoop'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  trimLoop = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw trimLoop.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'trimLoop' -> ().
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  trimLoopList = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-trimLoopList'.
    new = ( new: 1 ).
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  trimLoopList = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw trimLoopList.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'trimLoopList' -> ().
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  vdcMap = (|
    vdcMapAll = 1.
    vdcMapAspect = 2.
    vdcMapDevice = 3.
    vdcMapOff = 0.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  vdcOrientation = (|
    yDownZAway = 0.
    yUpZToward = 1.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  windowType = (|
    winMask = 255.
    "winProtoMask = 4294967040."
    winX = 1.
    winXProtoDefault = 0.
    winXProtoDga = 1024.
    winXProtoPex = 512.
    winXProtoXlib = 256.
  |).
|).


bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|
  zCompMethod = (|
    zCompAlways = 7.
    zCompEqual = 2.
    zCompGreaterThan = 3.
    zCompGreaterThanOrEqual = 4.
    zCompLessThan = 0.
    zCompLessThanOrEqual = 1.
    zCompNever = 6.
    zCompNotEqual = 5.
  |).
|).


bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  streamInfo = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-streamInfo'.
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  streamInfo = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw streamInfo.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'streamInfo' -> ().
  |).
|).

bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  intVecProxy = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-intVecProxy'.
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  intVecProxy = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw intVecProxy.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'intVecProxy' -> ().
  |).
|).

bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  longVecProxy = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-longVecProxy'.
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  longVecProxy = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw longVecProxy.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'longVecProxy' -> ().
  |).
|).

bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  floatVecProxy = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-floatVecProxy'.
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  floatVecProxy = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw floatVecProxy.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'floatVecProxy' -> ().
  |).
|).

bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  doubleVecProxy = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-doubleVecProxy'.
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  doubleVecProxy = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw doubleVecProxy.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'doubleVecProxy' -> ().
  |).
|).

bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  unsignedCharVecProxy = (|
    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().
    whichProxy = 'xgl-unsignedCharVecProxy'.
  |).
|).

bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|
  unsignedCharVecProxy = (
    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|
    {} = 'ModuleInfo: Creator: globals windowing xgl raw unsignedCharVecProxy.

CopyDowns:
globals system foreign proxy. deadCopy
SlotsToOmit: parent.

'.

    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> 'unsignedCharVecProxy' -> ().
  |).
|).




 '-- Sub parts'
 
 bootstrap read: 'xgl_wrappers' From: 'glue'
 
 
 
 '-- Side effects'

 globals modules xgl postFileIn
