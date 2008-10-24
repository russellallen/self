 '$Revision: 30.1 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot'
        
         cgDirectDisplay = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'cgDirectDisplay' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'cgDirectDisplay' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules cgDirectDisplay.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cgDirectDisplay' -> () From: ( | {
         'ModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cgDirectDisplay' -> () From: ( | {
         'ModuleInfo: Module: cgDirectDisplay InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cgDirectDisplay' -> () From: ( | {
         'ModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cgDirectDisplay' -> () From: ( | {
         'ModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cgDirectDisplay' -> () From: ( | {
         'ModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.1 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cgDirectDisplay' -> () From: ( | {
         'ModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot\x7fVisibility: public'
        
         directDisplay = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'directDisplay' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'directDisplay' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz directDisplay.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot\x7fVisibility: public'
        
         directDisplay = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'directDisplay' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz directDisplay.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'directDisplay' -> () From: ( | {
         'ModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'directDisplay' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'directDisplay' -> () From: ( | {
         'Category: finding a display\x7fModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot\x7fVisibility: public'
        
         activeDisplaysDo: blk = ( |
             r.
            | 
            getActiveDisplayCount do: [|:i. d. |
              d: getActiveDisplayAt: i.
              r: blk value: d
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'directDisplay' -> () From: ( | {
         'Category: finding a display\x7fModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot\x7fVisibility: public'
        
         bestDisplayForBounds: bb = ( |
             best.
             g <- 0.
            | 
            activeDisplaysDo: [|:d|
              (d goodnessForBounds: bb) > g ifTrue: [
                g: d goodnessForBounds: bb.
                best: d
              ]
            ].
            best ifNil: [main] IfNotNil: [best]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'directDisplay' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot\x7fVisibility: public'
        
         bounds = ( |
            | 
            (getX @ getY) ## (getWidth @ getHeight)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'directDisplay' -> () From: ( | {
         'Category: finding a display\x7fModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot\x7fVisibility: public'
        
         goodnessForBounds: bb = ( |
             b.
            | 
            b: bounds.
            (b enclosesOrEquals: bb) ifTrue: [^ b area].
            (b intersects: bb) ifTrue: [^ (b intersect: bb) area].
            0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'directDisplay' -> () From: ( | {
         'ModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'directDisplay' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: cgDirectDisplay InitialContents: FollowSlot\x7fVisibility: public'
        
         pixelExtent = ( |
            | 
            pixelWidth @ pixelHeight).
        } | ) 



 '-- Side effects'

 globals modules cgDirectDisplay postFileIn
