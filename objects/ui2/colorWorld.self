 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         argRowMorph = bootstrap define: bootstrap stub -> 'globals' -> 'argRowMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals rowMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'argRowMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals argRowMorph.

CopyDowns:
globals rowMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'argRowMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         argCount <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         argRowMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'argRowMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits argRowMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'argRowMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'argRowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'argRowMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingMorph: m Event: evt = ( |
            | 
            addMorph: m.
            argCount = morphCount ifTrue: [ doAction ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'argRowMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
            | 'action!' printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'argRowMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'argRowMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'argRowMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'rowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'argRowMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         hueRangeMorph = bootstrap define: bootstrap stub -> 'globals' -> 'hueRangeMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals argRowMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'hueRangeMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals hueRangeMorph.

CopyDowns:
globals argRowMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hueRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         outputRow <- bootstrap stub -> 'globals' -> 'rowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         hueRangeMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'hueRangeMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits hueRangeMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hueRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'hueRangeMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hueRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         range <- 120.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hueRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         stepSize <- 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hueRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         copyInitialize = ( |
             baseColor.
             col.
             newGuy.
             r.
            | 
            baseColor: (paint named: 'gray') copyBrightness: 0.8.
            newGuy: copy.
            newGuy color: baseColor copyBrightness: 0.9.
            newGuy centerJustify.
            newGuy outputRow: (rowMorph copy color: baseColor).
            col: columnMorph copy color: baseColor.
            col addMorph: (labelMorph copy label: morphTypeName) fontSpec: labelMorph fontSpec copySize: 14.
            col addMorph: newGuy.
            col addMorph: newGuy outputRow.
            r: frameMorph copy addMorph: col.
            r resizeRect: (0@0) # (500@150).
            newGuy addMorph: (makePatchH: 0 S: 0.7 V: 0.7).
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hueRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
             h.
             hues.
             s.
             v.
            | 
            morphCount > 0 ifTrue: [
                h: firstMorph color hue asInteger.
                s: firstMorph color saturation.
                v: firstMorph color brightness.
                outputRow removeAllMorphs.
                hues: list copyRemoveAll.
                (h - range half) to: (h + range half) By: stepSize Do: [| :i |
                    hues add: (makePatchH: i S: s V: v).
                ].
                outputRow addAllMorphs: hues.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hueRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         makePatchH: h S: s V: v = ( |
            | 
            morph copy beFlexible color:
                (paint copyHue: h Saturation: s Brightness: v)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hueRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'hueRangeMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hueRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'argRowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         brightnessRangeMorph = bootstrap define: bootstrap stub -> 'globals' -> 'brightnessRangeMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals hueRangeMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'brightnessRangeMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals brightnessRangeMorph.

CopyDowns:
globals hueRangeMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         brightnessRangeMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'brightnessRangeMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits brightnessRangeMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'brightnessRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'brightnessRangeMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'brightnessRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         steps <- 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         colorPatchMorph = bootstrap define: bootstrap stub -> 'globals' -> 'colorPatchMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals columnMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'colorPatchMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals colorPatchMorph.

CopyDowns:
globals columnMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorPatchMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         mode <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         colorPatchMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'colorPatchMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits colorPatchMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorPatchMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'colorPatchMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         colorPickerMorph = bootstrap define: bootstrap stub -> 'globals' -> 'colorPickerMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'colorPickerMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals colorPickerMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorPickerMorph' -> () From: ( | {
         'Comment: dummy value\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         lastBrightness <- -1000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorPickerMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         menu <- bootstrap stub -> 'globals' -> 'selectionInListMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         colorPickerMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'colorPickerMorph' -> () From: ( |
             {} = 'Comment: A widget for changing morph colors.\x7fModuleInfo: Creator: traits colorPickerMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorPickerMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'colorPickerMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         constantLuminanceMorph = bootstrap define: bootstrap stub -> 'globals' -> 'constantLuminanceMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals columnMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'constantLuminanceMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals constantLuminanceMorph.

CopyDowns:
globals columnMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         constantLuminanceMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'constantLuminanceMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits constantLuminanceMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'constantLuminanceMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'constantLuminanceMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'constantLuminanceMorph' -> () From: ( | {
         'Comment: luminance (the \'Y\' in YIQ color model)\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         y <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         fixedBrightnessInterpolatorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'fixedBrightnessInterpolatorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'argCount' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals hueRangeMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fixedBrightnessInterpolatorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fixedBrightnessInterpolatorMorph.

CopyDowns:
globals hueRangeMorph. copyRemoveAllMorphs 
SlotsToOmit: argCount parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fixedBrightnessInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         argCount <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         fixedBrightnessInterpolatorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fixedBrightnessInterpolatorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fixedBrightnessInterpolatorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fixedBrightnessInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'fixedBrightnessInterpolatorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fixedBrightnessInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         steps <- 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         fixedSaturationInterpolatorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'fixedSaturationInterpolatorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'argCount' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals hueRangeMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fixedSaturationInterpolatorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fixedSaturationInterpolatorMorph.

CopyDowns:
globals hueRangeMorph. copyRemoveAllMorphs 
SlotsToOmit: argCount parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fixedSaturationInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         argCount <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         fixedSaturationInterpolatorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fixedSaturationInterpolatorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fixedSaturationInterpolatorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fixedSaturationInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'fixedSaturationInterpolatorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fixedSaturationInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         steps <- 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot'
        
         colorWorld = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'colorWorld' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'colorWorld' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules colorWorld.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colorWorld' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colorWorld' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colorWorld' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot'
        
         myComment <- 'Exploring the world of color...'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colorWorld' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            colorPatchMorph                    beRigid resizeRect: (0@0) # (66@46).
            argRowMorph                        beRigid resizeRect: (0@0) # (72@52).
            hueRangeMorph                      beRigid resizeRect: (0@0) # (72@52).
            saturationRangeMorph               beRigid resizeRect: (0@0) # (72@52).
            brightnessRangeMorph               beRigid resizeRect: (0@0) # (72@52).
            fixedSaturationInterpolatorMorph   beRigid resizeRect: (0@0) # (72@52).
            fixedBrightnessInterpolatorMorph   beRigid resizeRect: (0@0) # (72@52).
            rgbInterpolatorMorph               beRigid resizeRect: (0@0) # (72@52).
            paletteMorph                       beRigid resizeRect: (0@0) # (72@52)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colorWorld' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colorWorld' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         paletteMorph = bootstrap define: bootstrap stub -> 'globals' -> 'paletteMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals hueRangeMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'paletteMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals paletteMorph.

CopyDowns:
globals hueRangeMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paletteMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         brightnessSteps <- 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         paletteMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'paletteMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits paletteMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paletteMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'paletteMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paletteMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         saturationSteps <- 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         rgbInterpolatorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'rgbInterpolatorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'argCount' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals hueRangeMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'rgbInterpolatorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals rgbInterpolatorMorph.

CopyDowns:
globals hueRangeMorph. copyRemoveAllMorphs 
SlotsToOmit: argCount parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rgbInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         argCount <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         rgbInterpolatorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'rgbInterpolatorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits rgbInterpolatorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rgbInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'rgbInterpolatorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rgbInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         steps <- 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         saturationRangeMorph = bootstrap define: bootstrap stub -> 'globals' -> 'saturationRangeMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals hueRangeMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'saturationRangeMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals saturationRangeMorph.

CopyDowns:
globals hueRangeMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: ColorChanger\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         saturationRangeMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'saturationRangeMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits saturationRangeMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'saturationRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'saturationRangeMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'saturationRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         steps <- 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'brightnessRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
             h.
             hues.
             s.
             v.
            | 
            morphCount > 0 ifTrue: [
                h: firstMorph color hue.
                s: firstMorph color saturation.
                v: firstMorph color brightness.
                outputRow removeAllMorphs.
                hues: list copyRemoveAll.
                steps do: [| :i |
                    hues add: (makePatchH: h S: s V: (i asFloat / steps pred)).
                ].
                outputRow addAllMorphs: hues.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'brightnessRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'brightnessRangeMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'brightnessRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'hueRangeMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorPatchMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         cycleToNextMode = ( |
             fs.
            | 
            fs: labelMorph fontSpec copySize: 12.
            mode: mode succ % modeCount.
            removeAllMorphs.
            modeHSV = mode ifTrue: [
                addMorph: ((labelMorph copy fontSpec: fs) label:
                    'h: ', color hue printString).
                addMorph: ((labelMorph copy fontSpec: fs) label: 
                    's: ', color saturation printString).
                addMorph: ((labelMorph copy fontSpec: fs) label: 
                    'v: ', color brightness printString).
            ].
            modeRGB = mode ifTrue: [
                addMorph: ((labelMorph copy fontSpec: fs) label: 
                    'r: ', color red printString).
                addMorph: ((labelMorph copy fontSpec: fs) label: 
                    'g: ', color blue printString).
                addMorph: ((labelMorph copy fontSpec: fs) label:
                    'b: ', color green printString).
            ].
            morphsDo: [| :m |
                color brightness <= 0.8 ifTrue: [
                    m color: (paint named: 'white').
                ].
            ].
            leftJustify.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorPatchMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            evt isShiftDownForLeftShiftHack ifTrue: [
                cycleToNextMode.
            ] False: [
                resend.leftMouseDown: evt.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorPatchMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         modeCount = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorPatchMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         modeHSV = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorPatchMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         modeNone = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorPatchMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: private'
        
         modeRGB = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorPatchMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'colorPatchMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorPatchMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'columnMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorPickerMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         copyInitialize = ( |
             colorNames.
             menu.
             new.
             row.
             slider.
            | 
            new: copy.

            colorNames: list copyRemoveAll.
            paintNames do: [| :v. :key | colorNames addLast: key ].
            colorNames: colorNames asVector sort.

            slider: sliderMorph copy resizeRect: (0@0) # (10@30).
            slider color: (color copyBrighterBy: 0.2).
            slider maxValue: 1.0.
            slider minValue: 0.0.
            slider target: new.
            slider selector: 'setColor:'.

            menu: selectionInListMorph copy beFlexible.
            menu color: color.
            menu items: colorNames.
            new menu: menu.

            row: rowMorph copy.
            row color: color.
            row borderWidth: 8.
            row addMorph: menu.
            row addMorph: slider.

            new addMorph: row.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorPickerMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'colorPickerMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorPickerMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorPickerMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         setColor: brightness = ( |
            | 
            brightness = lastBrightness ifTrue: [ ^self ].
            menu selection isNotNil && [owner isNotNil] ifTrue: [
                | newColor. delta |
                newColor:
                    (paint named: menu selection) copyBrightness: brightness.
                owner color: newColor.
                owner changed.
                lastBrightness: delta.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'constantLuminanceMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'constantLuminanceMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'constantLuminanceMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'columnMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'constantLuminanceMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         setY: newY = ( |
            | 
            newY = y ifTrue: [ ^self ].
            y: newY.
            removeAllMorphs.
            addMorph: (labelMorph copy label: 'Y = ', y printString).
            0 to: 10 Do: [| :i. red. row |
                red: i asFloat / 10.0.
                row: rowMorph copy borderWidth: 0.
                0 to: 10 Do: [| :j. blue. green. m |
                    blue: j asFloat / 10.0.
                    green: (y - ((0.30 * red) + (0.11 * blue))) / 0.59.
                    (green > 1.0) || (green < 0.0)
                        ifTrue: [ m: morph copy beFlexible color: (paint named: 'black') ]
                         False: [ m: morph copy beFlexible color: 
                                       (paint copyRed: red Green: green Blue: blue) ].
                    row addMorph: m.
                ].
                addMorph: row.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fixedBrightnessInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
             h1.
             h2.
             hues.
             s1.
             s2.
             v1.
             v2.
            | 
            morphCount = 2 ifTrue: [
                h1: firstMorph color hue.
                s1: firstMorph color saturation.
                v1: firstMorph color brightness.
                h2: lastMorph color hue.
                s2: lastMorph color saturation.
                v2: lastMorph color brightness.
                outputRow removeAllMorphs.
                hues: list copyRemoveAll.
                steps do: [| :i. h. s |
                    h: h1 interpolate: (i asFloat / steps pred) From: h2.
                    s: s1 interpolate: (i asFloat / steps pred) From: s2.
                    hues add: (makePatchH: h S: s V: v1).
                ].
                outputRow addAllMorphs: hues.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fixedBrightnessInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'fixedBrightnessInterpolatorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fixedBrightnessInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'hueRangeMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fixedSaturationInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
             h1.
             h2.
             hues.
             s1.
             s2.
             v1.
             v2.
            | 
            morphCount = 2 ifTrue: [
                h1: firstMorph color hue.
                s1: firstMorph color saturation.
                v1: firstMorph color brightness.
                h2: lastMorph color hue.
                s2: lastMorph color saturation.
                v2: lastMorph color brightness.
                outputRow removeAllMorphs.
                hues: list copyRemoveAll.
                steps do: [| :i. h. v |
                    h: h1 interpolate: (i asFloat / steps pred) From: h2.
                    v: v1 interpolate: (i asFloat / steps pred) From: v2.
                    hues add: (makePatchH: h S: s1 V: v).
                ].
                outputRow addAllMorphs: hues.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fixedSaturationInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'fixedSaturationInterpolatorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fixedSaturationInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'hueRangeMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paletteMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
             columns.
             h.
            | 
            morphCount > 0 ifTrue: [
                h: firstMorph color hue.
                columns: list copyRemoveAll.
                brightnessSteps do: [| :v. pList |
                    pList: list copyRemoveAll.
                    saturationSteps do: [| :s |
                        pList add: (makePatchH: h
                            S: (s asFloat / saturationSteps pred)
                            V: (v asFloat / brightnessSteps pred)).
                    ].
                    columns add:
                        ((columnMorph copy borderWidth: 0) addAllMorphs: pList).
                ].
                outputRow removeAllMorphs.
                outputRow addAllMorphs: columns.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paletteMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'paletteMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paletteMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'hueRangeMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
             b1.
             b2.
             g1.
             g2.
             hues.
             r1.
             r2.
            | 
            morphCount = 2 ifTrue: [
                r1: firstMorph color red.
                g1: firstMorph color green.
                b1: firstMorph color blue.
                r2: lastMorph color red.
                g2: lastMorph color green.
                b2: lastMorph color blue.
                outputRow removeAllMorphs.
                hues: list copyRemoveAll.
                steps do: [| :i. r. g. b |
                    r: r1 interpolate: (i asFloat / steps pred) From: r2.
                    g: g1 interpolate: (i asFloat / steps pred) From: g2.
                    b: b1 interpolate: (i asFloat / steps pred) From: b2.
                    hues add: (makePatchR: r G: g B: b).
                ].
                outputRow addAllMorphs: hues.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         makePatchR: r G: g B: b = ( |
            | 
            morph copy beFlexible color:
                (paint copyRed: r Green: g Blue: b)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'rgbInterpolatorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbInterpolatorMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'hueRangeMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'saturationRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
             h.
             hues.
             s.
             v.
            | 
            morphCount > 0 ifTrue: [
                h: firstMorph color hue.
                s: firstMorph color saturation.
                v: firstMorph color brightness.
                outputRow removeAllMorphs.
                hues: list copyRemoveAll.
                steps do: [| :i |
                    hues add: (makePatchH: h S: (i asFloat / steps pred) V: v).
                ].
                outputRow addAllMorphs: hues.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'saturationRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'saturationRangeMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'saturationRangeMorph' -> () From: ( | {
         'ModuleInfo: Module: colorWorld InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'hueRangeMorph' -> ().
        } | ) 



 '-- Side effects'

 globals modules colorWorld postFileIn
