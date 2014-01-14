 '$Revision: 30.6 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: specialPaintManager InitialContents: FollowSlot'
        
         specialPaintManager = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'specialPaintManager' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'specialPaintManager' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules specialPaintManager.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'specialPaintManager' -> () From: ( | {
         'ModuleInfo: Module: specialPaintManager InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'specialPaintManager' -> () From: ( | {
         'ModuleInfo: Module: specialPaintManager InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'specialPaintManager' -> () From: ( | {
         'ModuleInfo: Module: specialPaintManager InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'specialPaintManager' -> () From: ( | {
         'ModuleInfo: Module: specialPaintManager InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'specialPaintManager' -> () From: ( | {
         'ModuleInfo: Module: specialPaintManager InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'specialPaintManager' -> () From: ( | {
         'ModuleInfo: Module: specialPaintManager InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Paint\x7fModuleInfo: Module: specialPaintManager InitialContents: FollowSlot\x7fVisibility: public'
        
         unmappedPaintManager = bootstrap define: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'unmappedPaintManager' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractUnmappedPaintManager copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'unmappedPaintManager' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartzGlobals unmappedPaintManager.

CopyDowns:
globals abstractUnmappedPaintManager. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'unmappedPaintManager' -> () From: ( | {
         'ModuleInfo: Module: specialPaintManager InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'unmappedPaintManager' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartzGlobals unmappedPaintManager parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'unmappedPaintManager' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: specialPaintManager InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractUnmappedPaintManager' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Paint\x7fModuleInfo: Module: specialPaintManager InitialContents: FollowSlot\x7fVisibility: public'
        
         unmappedPaintManager = bootstrap define: bootstrap stub -> 'globals' -> 'x11Globals' -> 'unmappedPaintManager' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractUnmappedPaintManager copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'unmappedPaintManager' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals unmappedPaintManager.

CopyDowns:
globals abstractUnmappedPaintManager. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'unmappedPaintManager' -> () From: ( | {
         'ModuleInfo: Module: specialPaintManager InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         indexCache <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'unmappedPaintManager' -> () From: ( | {
         'ModuleInfo: Module: specialPaintManager InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'unmappedPaintManager' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals unmappedPaintManager parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'unmappedPaintManager' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: specialPaintManager InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy indexCache: indexCache copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'unmappedPaintManager' -> 'parent' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: specialPaintManager InitialContents: FollowSlot\x7fVisibility: public'
        
         indexForColor: c = ( |
            | 
            indexCache 
              if: c
              IsPresentDo: [|:i|  i]
              IfAbsentPut: [| defaultCMap. disp. p. r. xc |
                indexCache size > 10000 ifTrue: [
                  indexCache removeAll.
                  ^ indexForColor: c
                ].
                disp: clientWin display.
                defaultCMap: disp screen defaultColormapOfScreen.
                xc: xlib xColor new allComponents.
                xc red: c redForX.  xc green: c greenForX.  xc blue: c blueForX.
                r: disp xAllocColorInColormap: defaultCMap Color: xc IfFail: ['oops']. 
                p: xc pixel.
                xc delete.
                p
              ]
              AndDo: [|:i| i]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'unmappedPaintManager' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: specialPaintManager InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractUnmappedPaintManager' -> 'parent' -> ().
        } | ) 



 '-- Side effects'

 globals modules specialPaintManager postFileIn
