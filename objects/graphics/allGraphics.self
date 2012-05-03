 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: allGraphics InitialContents: FollowSlot'
        
         allGraphics = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'allGraphics' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'allGraphics' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules allGraphics.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allGraphics' -> () From: ( | {
         'ModuleInfo: Module: allGraphics InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allGraphics' -> () From: ( | {
         'ModuleInfo: Module: allGraphics InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allGraphics' -> () From: ( | {
         'ModuleInfo: Module: allGraphics InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allGraphics' -> () From: ( | {
         'ModuleInfo: Module: allGraphics InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allGraphics' -> () From: ( | {
         'ModuleInfo: Module: allGraphics InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'drawable
xlib
bitmap
drawing
movingBitmap
bitmapShape
movingShape
font
colormap
color
pattern
eventWatcher
eventHandler
window
windoid
inBetweener
cursor
xBitmapMaker
xPixmapMaker
xIconMaker
spline
fontSpec
quartz
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'drawable' From: 'graphics'
 bootstrap read: 'xlib' From: 'graphics'
 bootstrap read: 'bitmap' From: 'graphics'
 bootstrap read: 'drawing' From: 'graphics'
 bootstrap read: 'movingBitmap' From: 'graphics'
 bootstrap read: 'bitmapShape' From: 'graphics'
 bootstrap read: 'movingShape' From: 'graphics'
 bootstrap read: 'font' From: 'graphics'
 bootstrap read: 'colormap' From: 'graphics'
 bootstrap read: 'color' From: 'graphics'
 bootstrap read: 'pattern' From: 'graphics'
 bootstrap read: 'eventWatcher' From: 'graphics'
 bootstrap read: 'eventHandler' From: 'graphics'
 bootstrap read: 'window' From: 'graphics'
 bootstrap read: 'windoid' From: 'graphics'
 bootstrap read: 'inBetweener' From: 'graphics'
 bootstrap read: 'cursor' From: 'graphics'
 bootstrap read: 'xBitmapMaker' From: 'graphics'
 bootstrap read: 'xPixmapMaker' From: 'graphics'
 bootstrap read: 'xIconMaker' From: 'graphics'
 bootstrap read: 'spline' From: 'graphics'
 bootstrap read: 'fontSpec' From: 'graphics'
 bootstrap read: 'quartz' From: 'graphics'



 '-- Side effects'

 globals modules allGraphics postFileIn
