 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot'
        
         oldStyleRectangle = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'oldStyleRectangle' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'oldStyleRectangle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules oldStyleRectangle.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'oldStyleRectangle' -> () From: ( | {
         'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'oldStyleRectangle' -> () From: ( | {
         'ModuleInfo: Module: oldStyleRectangle InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'oldStyleRectangle' -> () From: ( | {
         'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot'
        
         myComment <- 'oldStyleRectangles will be removed soon.\"
            \"They were introduced by Bay 4/93 to ease the
             transition to the new semantics for rectangles.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'oldStyleRectangle' -> () From: ( | {
         'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'oldStyleRectangle' -> () From: ( | {
         'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         oldStyleRectangle = bootstrap define: bootstrap stub -> 'globals' -> 'oldStyleRectangle' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'storeStringNeeds' From:
             globals rectangle copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldStyleRectangle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldStyleRectangle.

CopyDowns:
globals rectangle. copy 
SlotsToOmit: parent storeStringNeeds.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         oldStyleRectangle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldStyleRectangle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldStyleRectangle' -> () From: ( | {
         'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldStyleRectangle' -> () From: ( | {
         'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'oldStyleRectangle' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: ui\x7fComment: return a list of rectangles composing the region <receiver - rect>
	  the returned rectangles do not overlap rect. These methods may
	  go better somewhere else, but I don\'t know where yet--dmu 2/91\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         deltaList: rect = ( | {
                 'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            c: list copyRemoveAll.
            (intersects: rect) ifFalse: [ ^ c add: self ].
            top < rect top ifTrue: [
                c add: topLeft #! (right @ rect top predecessor) ].
            left < rect left ifTrue: [ 
                c add: bottomLeft
                     #! (rect left predecessor @ (top max: rect top)) ].
            right > rect right ifTrue: [ 
                c add: (rect right successor @ (top max: rect top))
                      #! bottomRight ].
            bottom > rect bottom ifTrue: [ 
                c add: ((left max: rect left) @ rect bottom successor)
                        #! ((right min: rect right) @ bottom) ].
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | (bottom - top ) successor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: composing\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         indent: n = ( |
            | 
              ((origin x + n) @ (origin y + n))
            #! ((corner x - n) @ (corner y - n))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: composing\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         intersect: rect = ( | {
                 'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot'
                
                 b.
                }  {
                 'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot'
                
                 l.
                }  {
                 'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot'
                
                 r.
                }  {
                 'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            l:   left max: rect left.
            r:  right min: rect right.
            t:    top max: rect top.
            b: bottom min: rect bottom.
            (l >= r) || [t >= b] ifTrue: [ ^ (0@0) #! (-1 @ -1) ].
            (l @ t) #! (r @ b)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'rectangle' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         separator = ' #! '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         shrinkBottom: n = ( |
            | origin #! (corner subtractY: n)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         shrinkLeft: n = ( |
            | (origin addX: n) #! corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         shrinkRight: n = ( |
            | origin #! (corner subtractX: n)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         shrinkTop: n = ( |
            | (origin addY: n) #! corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         squinch = ( |
            | (shrinkRight: 1) shrinkBottom: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'ModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | oldStyleRectangle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         stretchBottom: n = ( |
            | origin #! (corner addY: n)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         stretchLeft: n = ( |
            | (origin subtractX: n) #! corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         stretchRight: n = ( |
            | origin #! (corner addX: n)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         stretchTop: n = ( |
            | (origin subtractY: n) #! corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: translating\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         translateTo: pt = ( |
            | 
            copy from: pt To: pt + (width predecessor @ height predecessor)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: composing\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         union: rect = ( |
            | 
            (origin min: rect origin) #! (corner max: rect corner)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldStyleRectangle' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: oldStyleRectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | (right  - left) successor).
        } | ) 



 '-- Side effects'

 globals modules oldStyleRectangle postFileIn
