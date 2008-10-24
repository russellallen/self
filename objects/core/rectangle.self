 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
        
         rectangle = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'rectangle' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'rectangle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules rectangle.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'rectangle' -> () From: ( | {
         'ModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'rectangle' -> () From: ( | {
         'ModuleInfo: Module: rectangle InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'rectangle' -> () From: ( | {
         'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'rectangle' -> () From: ( | {
         'ModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'rectangle' -> () From: ( | {
         'ModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         rectangle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'rectangle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals rectangle.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rectangle' -> () From: ( | {
         'ModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         corner <- (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rectangle' -> () From: ( | {
         'ModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         origin <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         rectangle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( |
             {} = 'Comment: A rectangle is defined by two points making up opposing corners.
      Make that a PAIR of points--incredibly useful-dmu\x7fModuleInfo: Creator: traits rectangle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rectangle' -> () From: ( | {
         'ModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'rectangle' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rectangle' -> () From: ( | {
         'ModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'rectangle' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         = r = ( |
            | r equalsRectangle: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         area = ( |
            | width * height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         bottom = ( |
            | corner y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         bottom: n = ( |
            | copy corner: right @ n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         bottomCenter = ( |
            | (left mean: right) @ bottom).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         bottomLeft = ( |
            | left @ bottom).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         bottomLeft: pt = ( |
            | copy from: topRight   To: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         bottomRight = ( |
            | corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         bottomRight: pt = ( |
            | copy corner: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         center = ( |
            | (left mean: right) @ (top mean: bottom)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         center: pt = ( |
            | 
            center: pt Size: size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         center: c Size: s = ( | {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 or.
                } 
            | 
            or: c - (s / 2).
            from: or To: or + s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: pairNess\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         copyX: newX Y: newY = ( |
            | (copy origin: newX) corner: newY).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fComment: return a list of rectangles composing the region <receiver - rect>
	  the returned rectangles do not overlap rect. These methods may
	  go better somewhere else, but I don\'t know where yet--dmu 2/91\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         deltaList: rect = ( | {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            c: list copyRemoveAll.
            (intersects: rect) ifFalse: [ ^ c add: self ].
            top < rect top ifTrue: [
                c add: topLeft # (right @ rect top predecessor) ].
            left < rect left ifTrue: [ 
                c add: bottomLeft
                     # (rect left predecessor @ (top max: rect top)) ].
            right > rect right ifTrue: [ 
                c add: (rect right successor @ (top max: rect top))
                      # bottomRight ].
            bottom > rect bottom ifTrue: [ 
                c add: ((left max: rect left) @ rect bottom successor)
                        # ((right min: rect right) @ bottom) ].
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         encloses: rect = ( |
            | 
            (left   < rect left ) && [
            (right  > rect right) && [
            (top    < rect top  ) && [
             bottom > rect bottom ]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosesOrEquals: rect = ( |
            | 
            (left   <= rect left ) && [
            (right  >= rect right) && [
            (top    <= rect top  ) && [
             bottom >= rect bottom ]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsRectangle: r = ( |
            | (origin = r origin) && [corner = r corner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: composing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         extend: n = ( |
            | indent: n negate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         from: pt1 To: pt2 = ( | {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: copy.
            r origin:  pt1 min: pt2.
            r corner:  pt1 max: pt2.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | bottom - top).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         includes: pt = ( |
            | 
                (pt x  >=  left )
            && [(pt x  <=  right)
            && [(pt y  >=  top  )
            && [ pt y  <=  bottom ]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: composing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         indent: n = ( |
            | 
              ((origin x + n) @ (origin y + n))
            # ((corner x - n) @ (corner y - n))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: composing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         intersect: rect = ( | {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 b.
                }  {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 l.
                }  {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 r.
                }  {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            l:   left max: rect left.
            r:  right min: rect right.
            t:    top max: rect top.
            b: bottom min: rect bottom.
            (l >= r) || [t >= b] ifTrue: [ ^ (0@0) # (-1 @ -1) ].
            (l @ t) # (r @ b)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         intersects: rect = ( |
            | 
            ((left max: rect left) <= (right  min: rect right )) &&
            [(top  max: rect top ) <= (bottom min: rect bottom)]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         isImmutableForFilingOut = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         isNorthOf: x = ( |
            | (x top  - top ) > 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         isWestOf: x = ( |
            | (x left - left) > 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         left = ( |
            | origin x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         left: n = ( |
            | copy origin: n @ top).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         leftCenter = ( |
            | left  @ (top mean: bottom)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'ModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'pair' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         pointClosestToPoint: p = ( | {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 x.
                }  {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 y.
                } 
            | 
            x: left    >  p x ifTrue: [ left   ] False: [
               right   <= p x ifTrue: [ right  ] False: [ p x ]].
            y: top     >  p y ifTrue: [ top    ] False: [
               bottom  <= p y ifTrue: [ bottom ] False: [ p y ]].
            x @ y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         pointClosestToRectangle: r = ( | {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 x.
                }  {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 y.
                } 
            | 
            x: left    >  r right ifTrue: [ left   ] False: [
               right   <= r left  ifTrue: [ right  ] False: [ 
                   (left max: r left) mean: (right min: r right) ]].
            y: top     >  r bottom ifTrue: [ top    ] False: [
               bottom  <= r top    ifTrue: [ bottom ] False: [ 
                   (top max: r top) mean: (bottom min: r bottom) ]].
            x @ y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fComment: Translate me if need be
so I will not stick out from enclosingRect.
If hopeless, center me.
-- Ungar, 6/19/95\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         restrictTo: enclosingRect = ( |
             x.
             y.
            | 
            x: case
              if: [ width >= enclosingRect width ]  Then: [ enclosingRect center x - width half ]
              If: [ left  <  enclosingRect left  ]  Then: [ enclosingRect left ]
              If: [ right >  enclosingRect right ]  Then: [ enclosingRect right - width ]
              Else: [ left ].

            y: case
              if: [ height >= enclosingRect height ]  Then: [ enclosingRect center y - height half ]
              If: [ top    <  enclosingRect top    ]  Then: [ enclosingRect top ]
              If: [ bottom >  enclosingRect bottom ]  Then: [ enclosingRect bottom - height ]
              Else: [ top ].

            translateTo: x @ y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         right = ( |
            | corner x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         right: n = ( |
            | copy corner: n @ bottom).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         rightCenter = ( |
            | right @ (top mean: bottom)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         separator = ' # '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         shrinkBottom: n = ( |
            | origin # (corner subtractY: n)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         shrinkBottomRight: p = ( |
            | origin # (corner - p)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         shrinkLeft: n = ( |
            | (origin addX: n) # corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         shrinkRight: n = ( |
            | origin # (corner subtractX: n)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         shrinkTop: n = ( |
            | (origin addY: n) # corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         shrinkTopLeft: p = ( |
            | (origin + p) # corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | width @ height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         skippedAreaEastwardsTo: x = ( |
             pts.
            | 
             "
                 self is west of x, so go east to fill
             "
            (  isNorthOf: x   ) ifTrue: [skippedAreaSEwardsTo: x] False: [
            (x isNorthOf: self) ifTrue: [skippedAreaNEwardsTo: x] False: [
               pts: vector copySize: 4.
               pts at: 0 Put:   topLeft.
               pts at: 1 Put:   bottomLeft.
               pts at: 2 Put: x bottomLeft.
               pts at: 3 Put: x topLeft.
               pts
            ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fComment: return a polygon in between two rectangles for inserting
	  motion blur. There are lots of +1 hacks to get around GX polygons \x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         skippedAreaNEwardsTo: x = ( | {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 pts.
                } 
            | 
            pts: vector copySize: 6.
            pts at: 0 Put:   topLeft.
            pts at: 1 Put:   bottomLeft.
            pts at: 2 Put:   bottomRight.
            pts at: 3 Put: x bottomRight + (0 @ 1).
            pts at: 4 Put: x bottomLeft  + (0 @ 1).
            pts at: 5 Put: x topLeft     + (0 @ 0).
            pts).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         skippedAreaNWwardsTo: x = ( | {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 pts.
                } 
            | 
            pts: vector copySize: 6.
            pts at: 0 Put:   topRight.
            pts at: 1 Put:   bottomRight.
            pts at: 2 Put:   bottomLeft.
            pts at: 3 Put: x bottomLeft  + (0 @ 1).
            pts at: 4 Put: x bottomRight + (1 @ 1).
            pts at: 5 Put: x topRight    + (1 @ 0).
            pts).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         skippedAreaNorthwardsTo: x = ( | {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 pts.
                } 
            | 
            pts: vector copySize: 4.
            pts at: 0 Put:   bottomLeft.
            pts at: 1 Put:   bottomRight.
            pts at: 2 Put: x bottomRight + (0 @ 1).
            pts at: 3 Put: x bottomLeft  + (0 @ 1).
            pts).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         skippedAreaSEwardsTo: x = ( | {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 pts.
                } 
            | 
            pts: vector copySize: 6.
            pts at: 0 Put:   bottomLeft.
            pts at: 1 Put:   topLeft.
            pts at: 2 Put:   topRight.
            pts at: 3 Put: x topRight.
            pts at: 4 Put: x topLeft.
            pts at: 5 Put: x bottomLeft.
            pts).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         skippedAreaSWwardsTo: x = ( | {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 pts.
                } 
            | 
            pts: vector copySize: 6.
            pts at: 0 Put:   bottomRight.
            pts at: 1 Put:   topRight.
            pts at: 2 Put:   topLeft.
            pts at: 3 Put: x topLeft     + (1 @ 0).
            pts at: 4 Put: x topRight    + (1 @ 0).
            pts at: 5 Put: x bottomRight + (1 @ 0).
            pts).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         skippedAreaSouthwardsTo: x = ( | {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 pts.
                } 
            | 
            pts: vector copySize: 4.
            pts at: 0 Put:   topLeft.
            pts at: 1 Put:   topRight.
            pts at: 2 Put: x topRight.
            pts at: 3 Put: x topLeft.
            pts).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         skippedAreaTo: x = ( |
            | "must not include x (new box)"
            (  isWestOf:  x   )  ifTrue: [ skippedAreaEastwardsTo:  x ] False: [
            (x isWestOf:  self)  ifTrue: [ skippedAreaWestwardsTo:  x ] False: [
            (  isNorthOf: x   )  ifTrue: [ skippedAreaSouthwardsTo: x ] False: [
            (x isNorthOf: self)  ifTrue: [ skippedAreaNorthwardsTo: x ] False: [
                vector]]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: ui\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         skippedAreaWestwardsTo: x = ( | {
                 'ModuleInfo: Module: rectangle InitialContents: FollowSlot'
                
                 pts.
                } 
            | 
             "
                 self is west of x, so go east to fill
             "
            (  isNorthOf: x   ) ifTrue: [skippedAreaSWwardsTo: x] False: [
            (x isNorthOf: self) ifTrue: [skippedAreaNWwardsTo: x] False: [
               pts: vector copySize: 4.
               pts at: 0 Put:   topRight.
               pts at: 1 Put:   bottomRight.
               pts at: 2 Put: x bottomRight + (1 @ 0).
               pts at: 3 Put: x topRight    + (1 @ 0).
               pts
            ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringWorks = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         stretchBottom: n = ( |
            | origin # (corner addY: n)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         stretchBottomRight: p = ( |
            | origin # (corner + p)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         stretchLeft: n = ( |
            | (origin subtractX: n) # corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         stretchRight: n = ( |
            | origin # (corner addX: n)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         stretchTop: n = ( |
            | (origin subtractY: n) # corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         stretchTopLeft: p = ( |
            | (origin - p) # corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         top = ( |
            | origin y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         top: n = ( |
            | copy origin: left @ n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         topCenter = ( |
            | (left mean: right) @ top).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         topLeft = ( |
            | origin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         topLeft: pt = ( |
            | copy origin: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         topRight = ( |
            | right @ top).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         topRight: pt = ( |
            | copy from: bottomLeft To: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: translating\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         translateBy: offset = ( |
            | 
            copy from: origin + offset To: corner + offset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: translating\x7fComment: move origin of rectangle to pt\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         translateTo: pt = ( |
            | copy from: pt To: pt + size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: composing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         union: rect = ( |
            | 
            (origin min: rect origin) # (corner max: rect corner)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | right  - left).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: pairNess\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         x = ( |
            | origin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: pairNess\x7fModuleInfo: Module: rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         y = ( |
            | corner).
        } | ) 



 '-- Side effects'

 globals modules rectangle postFileIn
