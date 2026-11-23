 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1Colormap InitialContents: FollowSlot'

         ui1Colormap = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Colormap' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Colormap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1Colormap.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Colormap' -> () From: ( | {
         'ModuleInfo: Module: ui1Colormap InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Colormap' -> () From: ( | {
         'ModuleInfo: Module: ui1Colormap InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Colormap' -> () From: ( | {
         'ModuleInfo: Module: ui1Colormap InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: slots David Ungar added to self64\'s colormap module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Colormap' -> () From: ( | {
         'ModuleInfo: Module: ui1Colormap InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Colormap' -> () From: ( | {
         'ModuleInfo: Module: ui1Colormap InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: ui1Colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         convertForWindow: win PlatformColormap: platformColormap = ( |
             cm.
            | 
            cm: colormap copyOn: win PlatformColormap: platformColormap.
            cm colorsFromCache: self.
            cm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: ui1Colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         copyGraphicsGlobals = ( |
             cm.
            | 
            cm: resend.copy platformColors: 
                platformColors copy.
            cm platformColors size do: [ | :i |
                cm platformColors at: i
                          Put: xlib xColor new allComponents pixel: i ].
            cm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: ui1Colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOn: win PlatformColormap: platformColormap = ( |
            | 
            clone xcm: platformColormap createFor: win platformWindow Depth: 8).
        } | ) 



 '-- Side effects'

 globals modules ui1Colormap postFileIn
