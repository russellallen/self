 'Sun-$Revision: 30.13 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: allUI2 InitialContents: FollowSlot'
        
         allUI2 = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'allUI2' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             bootstrap remove: 'subpartNames:' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'allUI2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules allUI2.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames subpartNames:.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI2' -> () From: ( | {
         'ModuleInfo: Module: allUI2 InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI2' -> () From: ( | {
         'ModuleInfo: Module: allUI2 InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI2' -> () From: ( | {
         'ModuleInfo: Module: allUI2 InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI2' -> () From: ( | {
         'ModuleInfo: Module: allUI2 InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.13 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI2' -> () From: ( | {
         'ModuleInfo: Module: allUI2 InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'sunRasterFile
paint
scalableFont
canvas
ui2Event
ui2ResultReporter
morphSaving
morph
activity
morphLib
handMorph
layoutMorphs
frameMorphs
simpleFrameMorph
arrowMorphs
ui2Button
ui2Menu
pointerMorph
worldMorph
pixmapMorphs
widgetMorphs
propertySheets
metaMorph
editorMorphs
userQueryMorph
buttonMorphs
colorWorld
trashCanMorph
carpetMorph
desktop
morphFinder
radarView
ui2test
coreSampler
idealGas
demoUtilities
factoryMorph
snapshotOptionsMorph
macEvents
xEvents
operandSelectors
keyCaps
keyCapCombos
absAppMorph
testMorphs
qUI2Events
tempPaints
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: allUI2 InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'ui2' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins ui2.
'.
            | ) .
        } | ) 



 '-- Sub parts'

 bootstrap read: 'sunRasterFile' From: 'ui2'
 bootstrap read: 'paint' From: 'ui2'
 bootstrap read: 'scalableFont' From: 'ui2'
 bootstrap read: 'canvas' From: 'ui2'
 bootstrap read: 'ui2Event' From: 'ui2'
 bootstrap read: 'ui2ResultReporter' From: 'ui2'
 bootstrap read: 'morphSaving' From: 'ui2'
 bootstrap read: 'morph' From: 'ui2'
 bootstrap read: 'activity' From: 'ui2'
 bootstrap read: 'morphLib' From: 'ui2'
 bootstrap read: 'handMorph' From: 'ui2'
 bootstrap read: 'layoutMorphs' From: 'ui2'
 bootstrap read: 'frameMorphs' From: 'ui2'
 bootstrap read: 'simpleFrameMorph' From: 'ui2'
 bootstrap read: 'arrowMorphs' From: 'ui2'
 bootstrap read: 'ui2Button' From: 'ui2'
 bootstrap read: 'ui2Menu' From: 'ui2'
 bootstrap read: 'pointerMorph' From: 'ui2'
 bootstrap read: 'worldMorph' From: 'ui2'
 bootstrap read: 'pixmapMorphs' From: 'ui2'
 bootstrap read: 'widgetMorphs' From: 'ui2'
 bootstrap read: 'propertySheets' From: 'ui2'
 bootstrap read: 'metaMorph' From: 'ui2'
 bootstrap read: 'editorMorphs' From: 'ui2'
 bootstrap read: 'userQueryMorph' From: 'ui2'
 bootstrap read: 'buttonMorphs' From: 'ui2'
 bootstrap read: 'colorWorld' From: 'ui2'
 bootstrap read: 'trashCanMorph' From: 'ui2'
 bootstrap read: 'carpetMorph' From: 'ui2'
 bootstrap read: 'desktop' From: 'ui2'
 bootstrap read: 'morphFinder' From: 'ui2'
 bootstrap read: 'radarView' From: 'ui2'
 bootstrap read: 'ui2test' From: 'ui2'
 bootstrap read: 'coreSampler' From: 'ui2'
 bootstrap read: 'idealGas' From: 'ui2'
 bootstrap read: 'demoUtilities' From: 'ui2'
 bootstrap read: 'factoryMorph' From: 'ui2'
 bootstrap read: 'snapshotOptionsMorph' From: 'ui2'
 bootstrap read: 'macEvents' From: 'ui2'
 bootstrap read: 'xEvents' From: 'ui2'
 bootstrap read: 'operandSelectors' From: 'ui2'
 bootstrap read: 'keyCaps' From: 'ui2'
 bootstrap read: 'keyCapCombos' From: 'ui2'
 bootstrap read: 'absAppMorph' From: 'ui2'
 bootstrap read: 'testMorphs' From: 'ui2'
 bootstrap read: 'qUI2Events' From: 'ui2'
 bootstrap read: 'tempPaints' From: 'ui2'



 '-- Side effects'

 globals modules allUI2 postFileIn
