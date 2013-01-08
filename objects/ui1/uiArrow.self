 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
        
         uiArrow = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'uiArrow' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'uiArrow' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules uiArrow.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            uiArrow arrowheads: arrowheadCache copy makeLength: 15 Width: 10.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         nullArrow = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'nullArrow' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals nullArrow.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nullArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         animateDesprouting = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nullArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nullArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFromLists = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         uiArrow = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiArrow' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiArrow.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: private'
        
         allBodies <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: private'
        
         bounds <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         fromCpt <- bootstrap stub -> 'globals' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         head <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: private'
        
         lineWidth <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         oldHead <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         oldTail <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         uiArrow = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits uiArrow.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiArrow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         tail <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         toCpt <- bootstrap stub -> 'globals' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         trueHead <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         trueTail <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: animating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         animateDesprouting = ( |
            | 
            fromCpt animator desproutArrow: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: animating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         animateSprouting = ( |
            | 
            fromCpt animator sproutWiggleArrow: self Init: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: arrowheading\x7fComment: returns 3-long vector with arrowhead vertices\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowhead = ( | {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 ah.
                }  {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 v.
                } 
            | 
                        ah: arrowheads retrieveDx: head x - tail x Dy: head y - tail y.
            "d: head - headControlPoint.
            ah: arrowheads retrieveDx: d x Dy: d y."

                        v: vector copySize: 3.
                        v at: 0 Put: (ah at: 0) + head.
                        v at: 1 Put: (ah at: 1) + head.
                        v at: 2 Put: (ah at: 2) + head.
                        v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: arrowheading\x7fComment: arrowhead cache initialization moved to postFileIn -- dmu 4/93\x7fModuleInfo: Module: uiArrow InitialContents: InitializeToExpression: (arrowheadCache copyRemoveAll)\x7fVisibility: public'
        
         arrowheads <- arrowheadCache copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         blurOn: bm Pattern: pat Color: cme = ( |
             pts.
            | 
            preferences blurArrows ifTrue: [
                | leadFract = 0.3.  
                  lagFract  = 0.7. |
                pts:  vector copySize: 4.
                pts at: 0 Put: (head + ((head - oldHead) * leadFract)) asInteger.
                pts at: 1 Put: (head - ((head - oldHead) * lagFract))  asInteger.
                pts at: 2 Put: (tail - ((tail - oldTail) * lagFract))  asInteger.
                pts at: 3 Put: (tail + ((tail - oldTail) * leadFract)) asInteger.
                bm fillPolygon: pts Pattern: pat Color: cme.
            ].
            oldHead: head.
            oldTail: tail.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: clipping\x7fComment: thisBody is not included\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: private'
        
         bodies: bodies From: thisBody Do: block = ( | {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 seen <- bootstrap stub -> 'globals' -> 'false' -> ().
                } 
            | 
            bodies reverseDo: [ | :bod |
                seen ifTrue: [ block value: bod ].
                seen: seen || [bod = thisBody]. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: moveClipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         bodyObscuringTail: doBlock IfNone: noneBlock = ( |
            | 
            bodies: allBodies From: fromCpt body Do: [ | :bod |
                (bod absoluteBound includes: trueTail)
                  ifTrue: [ ^ doBlock value: bod ] ].
            noneBlock value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         bound = ( | {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 ah.
                }  {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 corner.
                }  {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 origin.
                } 
            | 
            ah: arrowhead.
            origin: tail min: head
                         min: (ah at: 0) min: (ah at: 1) min: (ah at: 2).
            corner: tail max: head
                         max: (ah at: 0) max: (ah at: 1) max: (ah at: 2).
            origin #! corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: moveClipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: private'
        
         bound: bnd IntersectsGroup: group = ( |
            | 
            group do: [ | :g | (bnd intersects: g) ifTrue: [ ^ true ] ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         clip: rect = ( |
            | clipHead: rect.  clipTail: rect).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: private'
        
         clip: end1 From: end2 Around: rect = ( | {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 b.
                }  {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 dx.
                }  {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 dy.
                }  {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 xhi.
                }  {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 xlo.
                }  {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 yhi.
                }  {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 ylo.
                } 
            | 
            dx: end1 x - end2 x.
            dy: end1 y - end2 y.
            xlo: rect left.
            xhi: rect right.
            ylo: rect top.
            yhi: rect bottom.

            "vertical line"
            dx = 0 ifTrue: [
                end2 y <= ylo ifTrue: [ ^ end2 x @ ylo ].
                end2 y >= yhi ifTrue: [ ^ end2 x @ yhi ].
                ^ end2 ].

            "horizontal line"
            dy = 0 ifTrue: [
                end2 x <= xlo ifTrue: [ ^ xlo @ end2 y ].
                end2 x >= xhi ifTrue: [ ^ xhi @ end2 y ].
                ^ end2 ].

            "find intersection of line & rectangle"
            b: end2 y - ((end2 x * dy) / dx).
            end2 x <= xlo ifTrue: [ | p | "check left edge"
                p: ((dy * xlo) / dx) + b.
                (p >= ylo) && [p <= yhi] ifTrue: [ ^ xlo @ p ]. ].
            end2 x >= xhi ifTrue: [ | p | "check right edge"
                p: ((dy * xhi) / dx) + b.
                (p >= ylo) && [p <= yhi] ifTrue: [ ^ xhi @ p ]. ].

            b: end2 x - ((end2 y * dx) / dy).
            end2 y <= ylo ifTrue: [ | p | "check top edge"
                p: ((dx * ylo) / dy) + b.
                (p >= xlo) && [p <= xhi] ifTrue: [ ^ p @ ylo ]. ].
            end2 y >= yhi ifTrue: [ | p | "check bottom edge"
                p: ((dx * yhi) / dy) + b.
                (p >= xlo) && [p <= xhi] ifTrue: [ ^ p @ yhi ]. ].

            "reaches here if end2 is inside rect"
            end2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         clipHead = ( |
            | 
            bodies: allBodies From: toCpt body Do: [ | :bod |
                isInvisible ifTrue: [ ^ self ].
                clipHead: bod absoluteBound. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         clipHead: rect = ( |
            | 
            (headIn: rect)
                ifTrue: [ head: clip: head From: tail Around: rect ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         clipTail = ( |
            | 
            bodies: allBodies From: fromCpt body Do: [ | :bod | 
                isInvisible ifTrue: [ ^ self ].
                clipTail: bod absoluteBound. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         clipTail: rect = ( |
            | 
            (tailIn: rect)
                ifTrue: [ tail: clip: tail From: head Around: rect ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: moveClipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         clipToBoundsOfFromCpt = ( |
            | bounds do: [ | :bnd | clipTail: bnd ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: moveClipping\x7fComment: must first set bounds by doing findBounds...\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         clipToBoundsOfToCpt = ( |
            | bounds do: [ | :bnd | clipHead: bnd ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fComment: use createFrom:To:Width:All: to create a temporary arrow
	 for example, animation uses this to animate an arrow\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         createFrom: from To: to Width: w All: all = ( |
            | 
            fromCpt: from.
            toCpt: to.
            allBodies: all.
            bounds: bounds copyRemoveAll.
            setBodyWidth: w.
            setEndpoints.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: arrowheading\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         direction = ( |
            | trueHead - trueTail).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot'
        
         drawControlPointsOn: bm Color: col = ( |
             hcp.
             s = 4.
             tcp.
            | 
            tcp: tailControlPoint.
            hcp: headControlPoint.
            bm line: (tcp subtractX: s) To: (tcp addX: s) Color: col.
            bm line: (tcp subtractY: s) To: (tcp addY: s) Color: col.
            bm line: (hcp subtractX: s) To: (hcp addX: s) Color: col.
            bm line: (hcp subtractY: s) To: (hcp addY: s) Color: col.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         drawOn: bm Color: cme = ( |
            | drawWithArrowheadOn: bm Color: cme).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         drawOn: bm Color: col Head: hblock = ( |
            | 
                        head = tail ifFalse: [ | dx. dy. d. |
                            bm line: tail To: head Width: lineWidth Color: col.

            "                bm bezier: tail Control: tailControlPoint Control: (headControlPoint) To: head Width: lineWidth Color: col.
            "
                            head = trueHead ifTrue: [ hblock value ].
            "drawControlPointsOn: bm Color: col."
                        ].
                        self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         drawWithArrowheadOn: bm Color: col = ( |
            | 
            drawOn: bm Color: col Head: [ | ah |
                ah: arrowhead.
                bm fillFullPolygon: ah Color: col. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         drawWithTargetheadOn: bm Color: col = ( |
            | 
            drawOn: bm Color: col Head: [ | rect |
                rect: rectangle copy center: head Size: 10@10.
                bm fillRectangle: rect Color: col. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: moveClipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot'
        
         findBoundsOf: endBod = ( |
            | 
            resetBounds.
            bodies: allBodies From: endBod Do: [ | :bod |
                (overlaps: bod absoluteBound
                 Original: endBod absoluteBound
                    Group: bounds)
                 ifTrue: [ bounds addLast: bod absoluteBound ] ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: moveClipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         findBoundsOfFromCpt = ( |
            | 
            findBoundsStartingAt: fromCpt body.
            bounds removeFirst).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: moveClipping\x7fComment: for full generality (both moving heads and tails), must expand these
	 findBounds methods. also allow for optimization (fixed head/or tail
	 specified by client).\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         findBoundsOfToCpt = ( |
            | findBoundsOf: toCpt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: moveClipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot'
        
         findBoundsStartingAt: endBod = ( | {
                 'ModuleInfo: Module: uiArrow InitialContents: FollowSlot'
                
                 seen <- bootstrap stub -> 'globals' -> 'false' -> ().
                } 
            | 
            resetBounds.
            allBodies reverseDo: [ | :bod |
                seen: seen || [bod = endBod].
                (seen && [overlaps: bod absoluteBound
                          Original: endBod absoluteBound
                             Group: bounds ])
                    ifTrue: [ bounds addLast: bod absoluteBound ] ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fComment: use from:To:Width: to create a regular arrow\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         from: from To: to Width: w = ( |
            | 
            createFrom: from To: to Width: w All: from world bodies.
            install.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: private'
        
         headControlPoint = ( |
             bottom.
             bx.
             by.
             left.
             mx.
             my.
             p.
             percent = 0.1.
             percentHeight.
             percentIn.
             percentWidth.
             right.
             t = 0.4.
             top.
             x.
             x1.
             x2.
             xp.
             y.
             y1.
             y2.
             yp.
            | 
            x1: tail x.
            y1: tail y.
            x2: head x.
            y2: head y.
            mx: x2 - x1.
            bx: x1.
            my: y2 - y1.
            by: y1.
            x: (mx * t) + bx.
            y: (my * t) + by.

            top: toCpt absoluteFrontFace top.
            left: toCpt absoluteFrontFace left.
            right: toCpt absoluteFrontFace right.
            bottom: toCpt absoluteFrontFace bottom.
            percentWidth: percent * toCpt absoluteFrontFace width.
            percentHeight: percent * toCpt absoluteFrontFace height.
            (left = head x) || [right = head x] ifTrue: [
                 ((bottom - percentHeight) > head y) &&
                 [head y > (percentHeight + top)] ifTrue: [ ^ x @ head y ].
                 p: (bottom - head y) min: (head y - top).
                 percentIn: 1 - (p /= percentHeight).
                 p = (bottom - head y) ifTrue: [ "closer to bottom"
                    yp: head y + (percentIn * (y - head y)) ]
                 False: [ "closer to top"
                    yp: head y - (percentIn * (head y - y)) ].
                 ^ x @ yp.
            ].
            (top = head y) || [bottom = head y] ifTrue: [
                 ((right - percentWidth) > head x) &&
                 [head x > (percentWidth + left)] ifTrue: [ ^ head x @ y ].
                 p: (right - head x) min: (head x - left).
                 percentIn: 1 - (p /= percentWidth).
                 p = (right - head x) ifTrue: [ "closer to right"
                    xp: head x + (percentIn * (x - head x)) ]
                 False: [ "closer to left"
                    xp: head x - (percentIn * (head x - x)) ].
                 ^ xp @ y.
            ].
            x @ y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         headIn: rect = ( |
            | rect includes: head).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         install = ( |
            | 
            clipHead.
            clipTail.
            fromCpt body  fromArrows add: self.
            toCpt   body  toArrows   add: self.
            fromCpt world arrows     add: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         installNoWorld = ( |
            | 
            "this is a hack and will be removed in the future"
             clipHead.
             clipTail.
             fromCpt body  fromArrows add: self.
             toCpt   body  toArrows   add: self.
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         isFromFakeSlot = ( |
            | fromCpt contents container isFakeSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         isInvisible = ( |
            | head = tail).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: moveClipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: private'
        
         overlaps: bnd Original: original Group: group = ( |
            | 
            (bnd intersects: original) || [bound: bnd IntersectsGroup: group]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'ModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         reclip: rect = ( |
            | 
            (headIn: rect) ifTrue: [ resetHead. clipHead. ].
            (tailIn: rect) ifTrue: [ resetTail. clipTail. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: deleting\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot'
        
         removeFromLists = ( |
            | 
            toCpt   body toArrows   remove: self IfAbsent: [].
            fromCpt body fromArrows remove: self IfAbsent: [].
            fromCpt world arrows    remove: self IfAbsent: [].
            toCpt   body animatingToArrows remove: self IfAbsent: [].
            fromCpt body animatingFromArrows remove: self IfAbsent: [].
            nullArrow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: moveClipping\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot'
        
         resetBounds = ( |
            | bounds: bounds copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         resetHead = ( |
            | head: trueHead).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         resetTail = ( |
            | tail: trueTail).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         setAndClipEndpoints = ( |
            | 
            setEndpoints.
            clipHead.
            clipTail.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         setBodyWidth: t = ( |
            | lineWidth: t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         setEndpoints = ( |
            | 
            setStandardTail.
            setStandardHead.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         setHead: h = ( |
            | oldHead: head.  trueHead: h.  head: h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         setStandardHead = ( |
            | 
            setHead: toCpt   absoluteLocationForArrowhead: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         setStandardTail = ( |
            | 
            setTail: fromCpt absoluteLocationForArrowtail: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         setTail: t = ( |
            | oldTail: tail.  trueTail: t.  tail: t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         setToCpt: tb = ( |
            | 
            toCpt: tb.
            setHead: toCpt absoluteLocationForArrowhead: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            trueTail printString, ', ', trueHead printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: private'
        
         tailControlPoint = ( |
             n = 300.
            | 
            tail addX: (((head x - tail x) absoluteValue +
                         (head y - tail y) absoluteValue) / 2) min: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot\x7fVisibility: public'
        
         tailIn: rect = ( |
            | rect includes: tail).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiArrow' -> () From: ( | {
         'Category: deleting\x7fModuleInfo: Module: uiArrow InitialContents: FollowSlot'
        
         unsprout = ( |
            | fromCpt unsprout: self).
        } | ) 



 '-- Side effects'

 globals modules uiArrow postFileIn
