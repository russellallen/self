 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         colormapExperiment = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'colormapExperiment' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals colormapExperiment.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapExperiment' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: InitializeToExpression: (vector copy)'
        
         colorValues <- vector copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapExperiment' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         init = ( |
             cMapIndex.
             w.
            | 
            xilColorMorph: columnMorph copyRemoveAllMorphs.
            xilColorMorph borderWidth: 0.
            cMapIndex: 54. 
            colorValues: 'ui2/XILColormap.self' runScript.
            0 to: 4 Do: [ | :row . rm |
              rm: rowMorph copyRemoveAllMorphs.
              rm borderWidth: 0.
              xilColorMorph addMorph: rm.
              row * 40 to: (row * 40) + 39 Do: [ | :index . v . p |
                v: colorValues at: index. 
                p: xilPaint copy.
                p rawRed:   (v at: 0). 
                p rawGreen: (v at: 1).
                p rawBlue:  (v at: 2).
                p xColormapIndex: cMapIndex.
                cMapIndex: cMapIndex + 1.
                rm addMorph: ((morph copy setWidth: 3 Height: 10) color: p).
              ].
            ].
            xilColorMorph globalPosition: 2@2.
            w: worldMorph copyOpenForXil.
            "w winCanvases do: [ | :wc | wc colorDict switchToPrivateColorMap]."
            w addMorph: xilColorMorph.
            w go.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapExperiment' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         initMorph = ( |
             cMapIndex.
             w.
            | 
            xilColorMorph: columnMorph copyRemoveAllMorphs.
            xilColorMorph borderWidth: 0.
            cMapIndex: 54. 
            colorValues: 'ui2/XILColormap.self' runScript.
            0 to: 4 Do: [ | :row . rm |
              rm: rowMorph copyRemoveAllMorphs.
              rm borderWidth: 0.
              xilColorMorph addMorph: rm.
              row * 40 to: (row * 40) + 39 Do: [ | :index . v . p |
                v: colorValues at: index. 
                p: xilPaint copy.
                p rawRed:   (v at: 0). 
                p rawGreen: (v at: 1).
                p rawBlue:  (v at: 2).
                p xColormapIndex: cMapIndex.
                cMapIndex: cMapIndex + 1.
                rm addMorph: ((morph copy setWidth: 3 Height: 10) color: p).
              ].
            ].
            xilColorMorph globalPosition: 2@2.
            xilColorMorph copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapExperiment' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapExperiment' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         rInit = ( |
             cMapIndex.
             w.
            | 
            xilColorMorph: columnMorph copyRemoveAllMorphs.
            xilColorMorph borderWidth: 0.
            cMapIndex: 54.
            colorValues: 'ui2/XILColormap.self' runScript.
            0 to: 4 Do: [ | :row . rm |
              rm: rowMorph copyRemoveAllMorphs.
              rm borderWidth: 0.
              xilColorMorph addMorph: rm.
              row * 40 to: (row * 40) + 39 Do: [ | :index . v . p . rIndex |
                rIndex: 199 - index.
                v: colorValues at: rIndex. 
                p: xilPaint copy.
                p rawRed:   (v at: 0). 
                p rawGreen: (v at: 1).
                p rawBlue:  (v at: 2).
                p xColormapIndex: cMapIndex.
                cMapIndex: cMapIndex + 1.
                rm addMorph: ((morph copy setWidth: 3 Height: 10) color: p).
              ].
            ].
            xilColorMorph globalPosition: 2@2.
            w: worldMorph copyOpen.
            w winCanvases do: [ | :wc | wc colorDict switchToPrivateColorMap].
            w addMorph: xilColorMorph.
            w go.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapExperiment' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         xColormapIndex <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapExperiment' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: InitializeToExpression: (rowMorph copyRemoveAllMorphs)'
        
         xilColorMorph <- rowMorph copyRemoveAllMorphs.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Open a ui2 window for XIL colormap with some
useful objects in it, and some performance
tuning.
-- Ron, 6/20/96\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         openForXil = ( |
            | openOnDisplay: '' Xil: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         openNewWorldForXil = ( |
            | (worldMorph copyOpenForXil) go).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         openNewWorldForXilOnDisplay: dispName = ( |
            | (worldMorph copyOpenOnDisplay: dispName Xil: true) go).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         openNewWorldForXilOnDisplay: dispName Bounds: b = ( |
            | (worldMorph copyOpenForXilOnDisplay: dispName Bounds: b) go).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         openOnDisplay: dName Xil: xil = ( |
             w.
            | 
            isOpen ifTrue: [
              userQuery report: 'The desktop is already open!'.
              ^self
            ].

            adjustVMParametersForBetterSpeed.
            "reset the flag so that color problems are reported."

            xil ifTrue: [
              w: worldMorph
                  copyOpenForXilOnDisplay: dName
                             Bounds: (100@100) ## (707@450).
            ] False: [
              w: worldMorph
                  copyOpenOnDisplay: dName
                             Bounds: (100@100) ## (707@450).
            ]
            w addInitialMorphs.
            w go.
            '
              The ui2 desktop is now running. Type:
                "desktop stop"  to suspend it,
                "desktop go"    to resume it after stopping, and
                "desktop close" to close it.
            ' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         colormapExperiment = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'colormapExperiment' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'colormapExperiment' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules colormapExperiment.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormapExperiment' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormapExperiment' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormapExperiment' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormapExperiment' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormapExperiment' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormapExperiment' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fModuleInfo: Module: colormapExperiment InitialContents: InitializeToExpression: (false)'
        
         useVideo <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'Category: user interface preferences (mostly for ui1)\x7fModuleInfo: Module: colormapExperiment InitialContents: InitializeToExpression: (false)'
        
         useXILColormap <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: colormapExperiment InitialContents: InitializeToExpression: (false)'
        
         xilWorld <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         xilPaint = bootstrap define: bootstrap stub -> 'globals' -> 'xilPaint' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'intRange' From:
             bootstrap remove: 'range' From:
             globals paint copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xilPaint' -> () From: ( |
             {} = 'Comment: About the representation of colors:

     Externally, the red, green, and blue components of a paint
     object are floats in the range [0.0..1.0]. Internally, they
     are represented as integers in the range [0..range asInteger]
     to allow fast hashing and equality tests.

     This representation could easily be replaced with one based
     on HSV. On a pseudo-color display, conversion to RGB need
     only be done when first allocating a colormap entry for the
     color. On a direct-color display, a dictionary would be used
     to map colors to RGB triples; the cost would be about the same
     as the current cost of mapping colors to color indices.

     For a general description of color representations for computer
     graphics, including the relationship between the RGB and HSV
     color models used here, see Chapter 17 of Foley and van Dam,
     Fundamentals of Interactive Computer Graphics, Addison-Wesley,
     1982.\x7fModuleInfo: Creator: globals xilPaint.

CopyDowns:
globals paint. copy 
SlotsToOmit: intRange range.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaint' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         intRange = 65535.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaint' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         isXILColor = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaint' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: InitializeToExpression: (65535.0)\x7fVisibility: private'
        
         range = 65535.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaint' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | 
            xilPaint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaint' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         xColormapIndex <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         xilPaintManager = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xilPaintManager' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xilPaintManager.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         clientXWin.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: InitializeToExpression: (nil)'
        
         colorToIndex.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         idToIndex.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xilPaintManager parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         anyAvailableIndex = ( |
             indecees.
            | 
            indecees: sequence copyRemoveAll.
             7 to: 53 Do: [ | :i | indecees add: i ].

            idToIndex do: [ | :index | 
              indecees remove: index IfAbsent: nil ].

            indecees at: 0 IfAbsent: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            xColormap = nil ifFalse: [
              xColormap delete.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         colorInUse: c = ( |
             qc.
             i.
            | 
            "Called by the client during color entry reclamation
             to indicate that the given color is in current use."

            qc: (possiblyQuantized: c).
            i: colorToIndex at: qc IfAbsent: [
                colorCollector add: qc.
                ^self.
            ].
            entryStatus at: i Put: 'used'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         computeIndexAndInstallXILColor: c = ( |
             requiredIndex.
             xc.
            | 
              requiredIndex: c xColormapIndex.
              colorToIndex at: c Put: requiredIndex.
                "And now an in-line replacement for storeColor:At:"
                  xc: xlib xColor new allComponents.
                  xc pixel: requiredIndex.
                  xc   red: c   rawRed.
                  xc green: c rawGreen.
                  xc  blue: c  rawBlue.
                  xColormap storeOne: xc.
                  xc delete.  
            idToIndex at: c id Put: requiredIndex.
            requiredIndex).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: private'
        
         computeIndexForColor: c = ( |
             cIndex.
            | 
            "Allocate an entry to be used for a new color and install the color
             at that colormap entry. Return the new index."
            c isXILColor ifTrue: [
              ^ computeIndexAndInstallXILColor: c.
            ].
            cIndex: colorToIndex at: c IfAbsent: [| newI |
              newI: anyAvailableIndex.
              newI = nil ifTrue: [ "uh - oh."
                "makeFreeColorEntries ?"
                c id = -1 ifTrue: [
                  c setIdToBestFit.
                ].
                newI: findBestFitForColor: c.
                newI = -1 ifTrue: [ "UH - OH"
                  'Colors Going Random!!' printLine.
                  newI: (random integer: 54).    "pick one at random"
                ] False: [
                  'Colors Using Best Fit!!' printLine.
                ].
                newI
              ] False: [
                 storeColor: c At: newI.
                 newI.
              ].
              colorToIndex at: c Put: newI.
              newI.
            ].
            idToIndex at: c id Put: cIndex.
            cIndex).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         copyCommonColorsFor: disp = ( |
             c.
             defaultCMap.
            | 
            "Copy the reserved colors ( 0 - 6 ) into my private colormap."

            defaultCMap: disp screen defaultColormapOfScreen.
            c: xlib xColor new allComponents.
            0 to: 6 Do: [| :i. p |
              c pixel: i.
              disp xQueryColorInColormap: defaultCMap Color: c.
              p: (paint
                  copyRed: c red   asFloat / 65535.0
                    Green: c green asFloat / 65535.0
                     Blue: c blue  asFloat / 65535.0).
                storeColor: p At: i.
            ].
            c delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForWindow: xWin Client: c = ( |
             new.
            | 
            new: copy.
            preferences useXILColormap: false.
            "new client: c."
            new clientXWin: xWin.
            new colorToIndex: dictionary copyRemoveAll.
            new idToIndex:   vector copySize: paint paintRegistryMaxID.
            "make the private colormap, reserve colors, and install it"
            new xColormap: (xlib colormap createFor: xWin).
            new xColormap window: xWin.
            new xColormap installAndSync.
            new copyCommonColorsFor: xWin display.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         ditherColor: c = ( |
             bestDistSqSoFar.
             bestPaintSoFar.
             bestPaintIndexSoFar.
            | 
            bestDistSqSoFar: 4.
            bestPaintIndexSoFar: -1.
            0 to: (colorToIndex myKeys size - 1) Do: [ | :i. xc |
            xc: colorToIndex myKeys at: i.
            xc = set emptyMarker ifFalse: [ | distSq |
                distSq: (c red - xc red)     square +
                        (c green - xc green) square +
                        (c blue - xc blue)   square.
                distSq < bestDistSqSoFar ifTrue: [
                  bestDistSqSoFar: distSq.
                  bestPaintSoFar: xc.
                  bestPaintIndexSoFar: i.
                ].
              ].
            ].
            bestPaintIndexSoFar).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         findBestFitForColor: c = ( |
            | 
            findHSVBestFitForColor: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         findHSVBestFitForColor: c = ( |
             bestDistSqSoFar.
             bestPaintSoFar.
            | 
            bestDistSqSoFar: infinity.
            bestPaintSoFar: nil.
            colorToIndex keys do: [ | :xc. distSq |
                distSq: (((c hue - xc hue) /= 360.0) * 2.0 ) square +
                        (c saturation - xc saturation)     square +
                        (c brightness - xc brightness)     square.
                distSq < bestDistSqSoFar ifTrue: [
                  bestDistSqSoFar: distSq.
                  bestPaintSoFar: xc.
                ].
            ].
            colorToIndex at: bestPaintSoFar IfAbsent: -1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         findRGBBestFitForColor: c = ( |
             bestDistSqSoFar.
             bestPaintSoFar.
            | 
            bestDistSqSoFar: 4.
            bestPaintSoFar: nil.
            colorToIndex keys do: [ | :xc. distSq |
                distSq: (c red - xc red)     square +
                        (c green - xc green) square +
                        (c blue - xc blue)   square.
                distSq < bestDistSqSoFar ifTrue: [
                  bestDistSqSoFar: distSq.
                  bestPaintSoFar: xc.
                ].
            ].
            colorToIndex at: bestPaintSoFar IfAbsent: -1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         indexForColor: c = ( |
             cIndex.
            | 
            "Optimization: try to use id to get color index from idToIndex cache."

            cIndex: (idToIndex at: c id).
            nil = cIndex ifTrue: [ cIndex: computeIndexForColor: c ].
            cIndex).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> 'parent' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: private'
        
         storeColor: p At: i = ( |
             c.
            | 
            "Store the color of the given paint at index i in my private colormap."

            c: xlib xColor new allComponents.
            c pixel: i.
            c   red: (p   red * 65535.0) asInteger.
            c green: (p green * 65535.0) asInteger.
            c  blue: (p  blue * 65535.0) asInteger.
            xColormap storeOne: c.
            c delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xilPaintManager' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         xColormap.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsPaint: c = ( |
            | 
            == c ifTrue: [ ^true ].  "optimization"
            (isXILColor = c isXILColor) &&
            [(rawRed   = c   rawRed) &&
            [(rawBlue  = c  rawBlue) &&
            [(rawGreen = c rawGreen)]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         isXILColor = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         setIdToBestFit = ( |
             bestDistSqSoFar.
             bestPaintSoFar.
            | 
            bestDistSqSoFar: 4.
            paintRegistry keys do: [ | :p. distSq |
              distSq: (red - p red)     square +
                      (green - p green) square +
                      (blue - p blue)   square.
              distSq < bestDistSqSoFar ifTrue: [
                bestDistSqSoFar: distSq.
                bestPaintSoFar: p.
              ].
            ].
            idHint: bestPaintSoFar id.
            paintRegistry at: self Put: idHint.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: private'
        
         computeIndexForColor: c = ( |
             cIndex.
             qc.
            | 
            "Allocate an entry to be used for a new color and install the color
             at that colormap entry. Return the new index."
            c isXILColor ifTrue: [ computeIndexForXILColor: c ].
            qc: (possiblyQuantized: c).
            cIndex: colorToIndex at: qc IfAbsent: [| newI |
                "Color is not in colorToIndex dictionary; allocate a new color entry for it."
                newI: allocateIndex.

                colorToIndex do: [| :i. :oldC |
                    "Remove the color currently using the given colormap entry."
                    newI = i ifTrue: [ colorToIndex removeKey: oldC IfAbsent: nil ].
                ].
                colorToIndex at: qc Put: newI.
                entryStatus at: newI Put: 'used'.
                storeColor: qc At: newI.
                newI ].
            idToIndex at: c id Put: cIndex.
            cIndex).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         computeIndexForXILColor: c = ( |
             requiredIndex.
             cIndex.
             xc.
            | 
              requiredIndex: c xColormapIndex.
              cIndex:  colorToIndex at: c IfAbsent: [
                "Avoid quantizing the color"
                colorToIndex do: [| :i. :oldC |
                    "Remove the color currently using the given colormap entry."
                    requiredIndex = i ifTrue: [ colorToIndex removeKey: oldC IfAbsent: nil ].
                ].
                colorToIndex at: c Put: requiredIndex.
                entryStatus at: requiredIndex Put: 'used'.
                "And now an in-line replacement for storeColor:At:"
                  xc: xlib xColor new allComponents.
                  xc pixel: requiredIndex.
                  xc   red: c   rawRed.
                  xc green: c rawGreen.
                  xc  blue: c  rawBlue.
                  xColormap storeOne: xc.
                  xc delete. 
                requiredIndex ].
            cIndex = requiredIndex ifFalse: [ error: 'Inconsistent color map entries.'].
            idToIndex at: c id Put: cIndex.
            cIndex).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpenForWorld: wld OnDisplay: displayName At: pt Width: w Height: h = ( |
            | 
            copy openForWorld: wld OnDisplay: displayName At: pt Width: w Height: h Xil: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpenForXilWorld: wld OnDisplay: displayName At: pt Width: w Height: h = ( |
            | 
            copy openForWorld: wld OnDisplay: displayName At: pt Width: w Height: h Xil: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         openForWorld: wld OnDisplay: displayName At: pt Width: w Height: h Xil: xil = ( |
             c.
            | 
            xDisplay isLive ifFalse: [
                xDisplay: openDisplayNamed: displayName.
            ].
            xDisplay screen depth < 8 ifTrue: [
                 xDisplay close. 
                 ^ error: 'Sorry, you must use a color/grayscale display.
            (Screen depths of ', 
                     xDisplay screen depth printString,
                     ' are not currently supported.)'].
            xWin: xlib window createOnDisplay: xDisplay At: pt Size: w@h.
            xWin name: wld name.
            xWin catchWMDelete.
            xWin eventMask: eventsToCatch.
            xWin selectInput.
            xWin map.
            size: w@h.
            gc: xlib graphicsContext createForSameScreenAs: xWin.
            gc graphics_exposures: false.
            fontMap: fontMap copyRemoveAll.
            xil ifTrue: [
              colorDict: xilPaintManager copyForWindow: xWin Client: wld.
            ] False: [
              colorDict: paintManager copyForWindow: xWin Client: wld.
            ].
            imageDict: imageDict copyRemoveAll.
            buildGrayMask.
            xDisplay flush.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot'
        
         addWindowOnDisplay: dispName Bounds: b Limited: isLimited = ( |
             bc.
             h.
             wc.
            | 
            xilWorld ifTrue: [
              wc: (windowCanvas copyOpenForXilWorld: self
                      OnDisplay: dispName
                             At: b origin
                          Width: b width
                         Height: b height).
            ] False: [
              wc: (windowCanvas copyOpenForWorld: self
                      OnDisplay: dispName
                             At: b origin
                          Width: b width
                         Height: b height).
            ].
            bc: (pixmapCanvas copyForSameScreenAs: wc
                        Width: b width
                       Height: b height).
            isLimited ifTrue: [wc xWin freezeSize: b size].
            h: handMorph copy removeAllSubscribers privateSetOwner: self.
            h color: randomColorForUser.
            h subscribeWindow:   self. 

            addMorph: (((screenEdge copy winCanvas: wc) color: h color) orientation: 'top').
            addMorph: (((screenEdge copy winCanvas: wc) color: h color) orientation: 'bottom').
            addMorph: (((screenEdge copy winCanvas: wc) color: h color) orientation: 'left').
            addMorph: (((screenEdge copy winCanvas: wc) color: h color) orientation: 'right').

            winCanvases: winCanvases copyAddLast: wc.
            bufCanvases: bufCanvases copyAddLast: bc.
            hands:       hands copyAddLast: h.
            isLimited ifTrue: [h capabilitySet: set copyRemoveAll].
            h setUserInfo.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpenForXil = ( |
            | 
            copyOpenForXilOnDisplay: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpenForXilOnDisplay: dispName = ( |
            | copyOpenOnDisplay: dispName Bounds: (100@100) ## (200@150) Xil: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpenForXilOnDisplay: dispName Bounds: b = ( |
            | copyOpenOnDisplay: dispName Bounds: b Xil: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpenOnDisplay: dispName Bounds: b = ( |
            | copyOpenOnDisplay: dispName Bounds: b Xil: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: colormapExperiment InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpenOnDisplay: dispName Bounds: b Xil: xil = ( |
             new.
            | 
            new: copyRemoveAllMorphs.
            desktop addWorld: new. "this sets the name"
            new winCanvases: vector.
            new bufCanvases: vector.
            new hands:       vector.
            new activities:  activities copyRemoveAll.
            new uiCritical:  uiCritical copyBinary.

            new uiProcess:   nil.
            new stepProcess: nil.
            new stepWatcher: nil.
            new stepTimeoutProcess: nil.

            new xilWorld: xil.

            new damageList:         damageList copyRemoveAll.
            new addWindowOnDisplay: dispName Bounds: b.
            new reifiedObjects:     reifiedObjects copyRemoveAll.
            new outlinerActivities: outlinerActivities copyRemoveAll.

            new backgroundMenu: nil.
            new).
        } | ) 



 '-- Side effects'

 globals modules colormapExperiment postFileIn
