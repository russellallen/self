 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: public'
        
         hierarchicalMenu = bootstrap define: bootstrap stub -> 'globals' -> 'hierarchicalMenu' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals menu copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'hierarchicalMenu' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals hierarchicalMenu.

CopyDowns:
globals menu. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hierarchicalMenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: public'
        
         autosort <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: public'
        
         hierarchicalMenu = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits hierarchicalMenu.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hierarchicalMenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hierarchicalMenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         saveunder <- bootstrap stub -> 'globals' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
        
         hierarchicalMenu = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'hierarchicalMenu' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'hierarchicalMenu' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules hierarchicalMenu.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hierarchicalMenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hierarchicalMenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hierarchicalMenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hierarchicalMenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hierarchicalMenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         addSubmenuSize: itsz = ( | {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: itsz addX: submenuIndicatorGap + submenuIndicatorSize x.
            s x @ (s y max: submenuIndicatorSize y)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: animating\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         demote = ( |
            | "put the menu onto the background plane"
            saveunder: bitmap copyFor: world window Size: bound size.
            world prepareToDrawOnAll.
            world windowBitmap copy: bound To: saveunder At: 0@0.
            world prepareToDrawOnBackground.
            drawHighlighting: currentItemNumber.
            drawPressedSubmenuIndicator: currentItemNumber.
            world eraseAcetate.
            world syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         drawDarkLine: a To: b = ( |
            | 
            drawLine: a To: b Color: uiColors bodyDark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         drawDarkPartOfEtchedLine: a To: b = ( |
            | drawDarkLine: a To: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         drawEtchedTriangle: a To: b To: c = ( |
            | 
            drawLightPartOfEtchedLine: a To: b.
            drawLightPartOfEtchedLine: b To: c.
            drawLightPartOfEtchedLine: a To: c.
            drawDarkPartOfEtchedLine: a To: b.
            drawDarkPartOfEtchedLine: b To: c.
            drawDarkPartOfEtchedLine: a To: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         drawFeaturesOfItem: i Color: c = ( |
            | 
            resend.drawFeaturesOfItem: i Color: c.
            (items at: i) hasSubmenu ifTrue: [ drawSubmenuIndicator: i ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         drawLightLine: a To: b = ( |
            | 
            drawLine: a To: b Color: uiColors bodyLight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         drawLightPartOfEtchedLine: a To: b = ( |
            | 
            drawLightLine: a + (1@1) To: b + (1@1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         drawLine: a To: b Color: c = ( |
            | windowBitmap line: a To: b Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         drawPressedSubmenuIndicator: i = ( | {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 p1.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 p2.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 p3.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 r.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 v.
                } 
            | 
            r: submenuIndicatorBound: i.
            p1: r topLeft.
            p2: r bottomLeft.
            p3: r topRight mean: r bottomRight.
            v: vector copySize: 3.
            v at: 0 Put: p1.
            v at: 1 Put: p2.
            v at: 2 Put: p3.
            windowBitmap fillPolygon: v Color: uiColors body.
            drawDarkLine: p1 To: p2.
            drawDarkLine: p1 To: p3.
            drawLightLine: p2 To: p3.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         drawSubmenuIndicator: i = ( | {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 p1.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 p2.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 p3.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: submenuIndicatorBound: i.
            p1: r topLeft.
            p2: r bottomLeft.
            p3: r topRight mean: r bottomRight.
            drawEtchedTriangle: p1 To: p2 To: p3.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: items\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         itemName: it = ( |
            | it name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         itemSize: it = ( | {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 itsz.
                } 
            | 
            itsz: (itemFont: it) sizeOfString: it name.
            it hasSubmenu ifTrue: [ itsz: addSubmenuSize: itsz ].
            itsz).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: items\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: public'
        
         items: aCol = ( |
            | 
            truncatedItems: truncatedItems copySize: aCol size.
            aCol asVector mapBy: [ | :item. s. newline = '\n' |
                s: item name.
                s findFirst: [ | :c | newline = c ]
                  IfPresent: [ | :v. :k. | item name: s copySize: k ]
                   IfAbsent: [ item name: s ]
            ] Into: truncatedItems.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         outsideSubmenu: p = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'menu' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: animating\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         promote = ( |
            | "put the menu back onto the acetate plane"
            world prepareToDrawOnBackground.
            saveunder copyTo: world windowBitmap At: bound origin.
            world prepareToDrawOnAcetate.
            drawHighlighting: currentItemNumber.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         selectAfterSetup: selBlock IfNone: noneBlock = ( | {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 currentMenu.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 menus.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 p.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 results.
                } 
            | 
            menus: list copyRemoveAll. "stack"
            results: list copyRemoveAll.
            currentMenu: self.

            cursor while: [ cursor anyButtonDown ] Do: [
                p: cursor location.
                (currentMenu outsideSubmenu: p) ifTrue: [
                    "exit submenu"
                    currentMenu takedown.
                    currentMenu: menus removeFirst. "pop"
                    results removeLast.
                    currentMenu promote. ].
                currentMenu feedbackAt: p.
                (currentMenu triggerSubmenu: p) ifTrue: [
                    "enter submenu"
                    results addLast: currentMenu currentSelection.
                    currentMenu demote.
                    menus addFirst: currentMenu. "push:"
                    currentMenu: currentMenu submenuAt: p.
                    currentMenu setup. ].
            ].

            p: cursor location.
            currentMenu takedown.
            menus do: [ | :m | m promote. m takedown. ].
            world prepareToDrawOnAll.

            currentMenu
                selectAt: p
              IfSelected: [ | :n |
                            selBlock value:
                            results add: currentMenu items at: n ]
                  IfNone: noneBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            'hierarchicalMenu copy autosort: ', autosort storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | hierarchicalMenu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         submenuAt: p = ( | {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 its.
                } 
            | 
            its: autosort ifTrue: [ currentSelection submenuItems
                                    asVector sort ]
                           False: [ currentSelection submenuItems ].
            submenu copy createFromBound: submenuIndicatorBound
                                   Items: its
                                   World: world).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         submenuIndicatorActiveBound = ( |
            | 
            submenuIndicatorBound stretchLeft: submenuIndicatorGap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         submenuIndicatorBound = ( |
            | submenuIndicatorBound: currentItemNumber).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         submenuIndicatorBound: i = ( |
            | 
            (submenuIndicatorLocation: i) ##! submenuIndicatorSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         submenuIndicatorGap = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         submenuIndicatorLocation: i = ( | {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 item.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 t.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 x.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 y.
                } 
            | 
            item: items at: i.
            t: textLocationOfItem: i.
            x: (t x + columnExtent x) - submenuIndicatorSize x.
            y: t y + ((((itemFont: item) heightOfString: item name) -
                       submenuIndicatorSize y) / 2).
            x @ y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         submenuIndicatorSize = (8)@(10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         triggerSubmenu: p = ( |
            | 
            noCurrentSelection ifTrue: [ ^ false ].
            currentSelection hasSubmenu
                ifTrue: [ submenuIndicatorActiveBound includes: p ]
                 False: [ false ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: public'
        
         submenu = bootstrap define: bootstrap stub -> 'globals' -> 'submenu' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals hierarchicalMenu copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'submenu' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals submenu.

CopyDowns:
globals hierarchicalMenu. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: public'
        
         submenu = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'submenu' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits submenu.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'submenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'submenu' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'submenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         outsideSubmenu: p = ( |
            | p x < bound left).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'submenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hierarchicalMenu' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'submenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         placeBodyInDesiredLocation = ( | {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 x.
                }  {
                 'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot'
                
                 y.
                } 
            | 
            x: sourceBound left + (body front width half - sourceBound width).
            y: sourceBound center y.
            body: body translateBy: (x @ y) - body front center).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'submenu' -> () From: ( | {
         'ModuleInfo: Module: hierarchicalMenu InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | submenu).
        } | ) 



 '-- Side effects'

 globals modules hierarchicalMenu postFileIn
