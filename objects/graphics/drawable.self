 '$Revision: 30.1 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: drawable InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractDrawable = bootstrap define: bootstrap stub -> 'globals' -> 'abstractDrawable' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractDrawable' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractDrawable.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: drawable InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractDrawable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractDrawable' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractDrawable.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractDrawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractDrawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot'
        
         drawable = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'drawable' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'drawable' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules drawable.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.1 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDrawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot\x7fVisibility: public'
        
         drawArcWithin: rect From: startAngle Spanning: spanAngle Width: w GC: gc = ( |
            | 
            gc lineWidth: w.
            drawArcWithin: rect
                     From: startAngle
                 Spanning: spanAngle
                       GC: gc.
            gc lineWidth: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDrawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot\x7fVisibility: public'
        
         drawDashedLine: pt1 To: pt2 DashSize: d Offset: o GC: gc = ( |
            | 
            gc dashes: (byteVector copySize: 1 FillingWith: d) Offset: o.
            drawLine: pt1 To: pt2 GC: gc.
            gc lineWidth: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDrawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot\x7fVisibility: public'
        
         drawDashedLine: pt1 To: pt2 Width: w DashSize: d Offset: o GC: gc = ( |
            | 
            gc dashedLineWidth: w.
            gc drawDashedLine: pt1 To: pt2 DashSize: d Offset: o GC: gc.
            gc lineWidth: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDrawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLine: pt1 To: pt2 Width: w GC: gc = ( |
            | 
            gc lineWidth: w.
            drawLine: pt1 To: pt2 GC: gc.
            gc lineWidth: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDrawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLines: ptlist Width: w GC: gc = ( |
            | 
            gc lineWidth: w.
            drawLines: ptlist GC: gc.
            gc lineWidth: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDrawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot\x7fVisibility: public'
        
         drawRectangle: rect Width: w GC: gc = ( |
            | 
            gc lineWidth: w.
            drawRectangle: (adjustRectangle: rect Width: w) GC: gc.
            gc lineWidth: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDrawable' -> () From: ( | {
         'ModuleInfo: Module: drawable InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 



 '-- Side effects'

 globals modules drawable postFileIn
