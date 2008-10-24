 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: uiColormap InitialContents: FollowSlot'
        
         uiColormap = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'uiColormap' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'uiColormap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules uiColormap.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiColormap' -> () From: ( | {
         'ModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiColormap' -> () From: ( | {
         'ModuleInfo: Module: uiColormap InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiColormap' -> () From: ( | {
         'ModuleInfo: Module: uiColormap InitialContents: FollowSlot'
        
         myComment <- '3 layers of colors.  8 colors total.
             6 colors that can be on the first or second layer.
             1 color (the \'background\') that can only be on the first layer.
             1 color on the third layer--this is software-double-buffered.
             organization of the 8 bits:  xX yyy zzz
             x   = one of the two bitplanes indicating the third layer.
             X   = the other (double-buffered) bitplane representing the third layer.
             yyy = the second layer.
             zzz = the first layer.
             111 in the first layer is the background color;
             000 in the second layer is transparent (so the first layer color shows thru).
             000 in first layer not used;
             00 000 000 is set to a color contrasting with text color;
             11 111 111 is set to text color for console.
             Also, this tries to cooperate with the spy under X, which uses XWhitePixel
               (usually 0) and XBlackPixel (usually 1).  It assumes that text color (or
               whatever is put in 8r001) will contrast with TextContrast (which is
               put in 8r000).  In the ui, this is the box front.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiColormap' -> () From: ( | {
         'ModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiColormap' -> () From: ( | {
         'ModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         uiColormap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiColormap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiColormap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColormap' -> () From: ( | {
         'ModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: private'
        
         cm* <- bootstrap stub -> 'globals' -> 'colormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColormap' -> () From: ( | {
         'ModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | parent.copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         uiColormap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits uiColormap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColormap' -> () From: ( | {
         'ModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: private'
        
         arrowColor: cme ForMap: arrowPlane = ( | {
                 'ModuleInfo: Module: uiColormap InitialContents: FollowSlot'
                
                 highBits.
                } 
            | 
            highBits: (top2BitsForMap: arrowPlane) ^^ 8r300.
            8r00 to: 8r77 Do: [ | :i |
                highBits = 8r300 ifTrue: [
                    at: 8r100 + i Put: cme color.
                    at: 8r200 + i Put: cme color.
                ] False: [
                    at: highBits + i Put: cme color.
                ].
                at: 8r300 + i Put: cme color. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowPlane0MakeText: textCME TextBackground: textBackCME Background: backCME Arrow: arrowCME ColorA: aCME ColorB: bCME ColorC: cCME Transparent: transCME ArrowPlusTopPlanes: arrTopCME = ( |
            | 
                  make: 0 Text: textCME
                TextBackground: textBackCME
                    Background: backCME
                         Arrow: arrowCME
                        ColorA: aCME
                        ColorB: bCME
                        ColorC: cCME
                   Transparent: transCME
            ArrowPlusTopPlanes: arrTopCME).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowPlane1MakeText: textCME TextBackground: textBackCME Background: backCME Arrow: arrowCME ColorA: aCME ColorB: bCME ColorC: cCME Transparent: transCME ArrowPlusTopPlanes: arrTopCME = ( |
            | 
                  make: 1 Text: textCME
                TextBackground: textBackCME
                    Background: backCME
                         Arrow: arrowCME
                        ColorA: aCME
                        ColorB: bCME
                        ColorC: cCME
                   Transparent: transCME
            ArrowPlusTopPlanes: arrTopCME).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: private'
        
         backgroundColor: cme ForMap: arrowPlane = ( |
             colIndex.
            | 
            colIndex: transparentIndex + 8r007.
            cme index: colIndex.
            at: colIndex Put: cme color.
            at: (top2BitsForMap: arrowPlane) + colIndex Put: cme color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         bothArrowPlanesMakeText: textCME TextBackground: textBackCME Background: backCME Arrow: arrowCME ColorA: aCME ColorB: bCME ColorC: cCME Transparent: transCME ArrowPlusTopPlanes: arrTopCME = ( |
            | 
                  make: 2 Text: textCME
                TextBackground: textBackCME
                    Background: backCME
                         Arrow: arrowCME
                        ColorA: aCME
                        ColorB: bCME
                        ColorC: cCME
                   Transparent: transCME
            ArrowPlusTopPlanes: arrTopCME).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone cm: cm copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWithRep: c = ( |
            | clone cm: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         interpolate: p From: cm = ( | {
                 'ModuleInfo: Module: uiColormap InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: copy.
            size do: [|:i|
                r at: i  Put: (at: i) interpolate: p From: cm at: i.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: private'
        
         layer1Color: cme Number: n ForMap: arrowPlane = ( |
             colIndex.
            | 
            colIndex: transparentIndex + n.
            cme index: n || (n << 3).
            at: colIndex Put: cme color.
            at: (top2BitsForMap: arrowPlane) + colIndex Put: cme color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: private'
        
         layer2Color: cme Number: n ForMap: arrowPlane = ( | {
                 'ModuleInfo: Module: uiColormap InitialContents: FollowSlot'
                
                 highBits.
                }  {
                 'ModuleInfo: Module: uiColormap InitialContents: FollowSlot'
                
                 layer2.
                } 
            | 
            layer2: n << 3.
            highBits: top2BitsForMap: arrowPlane.
            8r0 to: 8r7 Do: [ | :i |
                at: layer2 + i Put: cme color.
                at: highBits + layer2 + i Put: cme color. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: private'
        
         make: whichArrowPlane Text: textCME TextBackground: textBackCME Background: backCME Arrow: arrowCME ColorA: aCME ColorB: bCME ColorC: cCME Transparent: transCME ArrowPlusTopPlanes: arrTopCME = ( | {
                 'ModuleInfo: Module: uiColormap InitialContents: InitializeToExpression: (vector copySize: 7)'
                
                 v = vector copySize: 7.
                } 
            | 
            v at: 1 Put: textCME.
            v at: 2 Put: aCME.
            v at: 3 Put: cCME.
            v at: 4 Put: arrowCME.
            v at: 5 Put: bCME.
            v at: 6 Put: textBackCME.

            1 to: 6 Do: [ | :i. c. |
                c: v at: i.
                layer1Color: c
                     Number: i
                     ForMap: whichArrowPlane.
                layer2Color: c
                     Number: i
                     ForMap: whichArrowPlane. ].

            transCME index: transparentIndex.
            (arrTopCME index: 8r300 || arrowCME index) color: arrowCME color.
            backgroundColor: backCME ForMap: whichArrowPlane.
            arrowColor: arrowCME ForMap: whichArrowPlane.
            spyBackgroundColor: textBackCME.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         makeNoAcetateFrom: cm Transparent: trans = ( |
            | 
            size do: [ | :i |
                at: i Put: cm at: trans index || (i && 8r007) ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'ModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         size = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: private'
        
         spyBackgroundColor: cme = ( |
            | at: 8r000 Put: cme color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot'
        
         storeStringIfFail: fb = ( |
            | 
            'uiColormap copy "Warning: state not preserved across fileOut"').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | uiColormap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: private'
        
         top2BitsForMap: arrowPlane = ( |
            | 
            0 = arrowPlane ifTrue: [ ^ 8r200 ].
            1 = arrowPlane ifTrue: [ ^ 8r100 ].
            8r000).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColormap InitialContents: FollowSlot\x7fVisibility: private'
        
         transparentIndex = 0.
        } | ) 



 '-- Side effects'

 globals modules uiColormap postFileIn
