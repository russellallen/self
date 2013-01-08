 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         bSpline = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'bSpline' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals bSpline.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bSpline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         computeConversionMatrix = ( | {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            "here is the conversion matrix in human-readable form"
            m: ((1 & 0 & 0 & 0) asVector &
                (4 & 4 & 2 & 1) asVector &
                (1 & 2 & 4 & 4) asVector &
                (0 & 0 & 0 & 1) asVector) asVector.
            oneSixthMatrix: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bSpline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: InitializeToExpression: (vector copyRemoveAll)\x7fVisibility: private'
        
         conversionMatrix = vector copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         spline = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'spline' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits spline.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bSpline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'spline' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         bezier = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'bezier' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals bezier.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         bezierRenderer: p1 To: p2 To: p3 To: p4 = ( | {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 mid2334pt.
                }  {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 mid23pt.
                }  {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 mid34pt.
                }  {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 n1.
                }  {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 n2.
                }  {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 n3.
                }  {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 n4.
                }  {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 segpts.
                }  {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 segpts2.
                } 
            | 
            "Renders the bezier curve defined by the 4 control points
             using adaptive recursive subdivision.  Returns endpoints
             of the resulting line segments.
             Args must all be floating point."
            segpts: list copyRemoveAll.
            segpts add: p1.
            (isStraightEnough: p1 To: p2 To: p3 To: p4)
                ifTrue: [ ^ segpts add: p4 ].
            n1: p1.
            n2: midpoint: p1 And: p2.
            mid23pt: midpoint: p2 And: p3.
            n3: midpoint: n2 And: mid23pt.
            mid34pt: midpoint: p3 And: p4.
            mid2334pt: midpoint: mid23pt And: mid34pt.
            n4: midpoint: n3 And: mid2334pt.
            segpts: bezierRenderer: n1 To: n2 To: n3 To: n4.
            n1: n4.
            n2: mid2334pt.
            n3: mid34pt.
            n4: p4.
            segpts2: bezierRenderer: n1 To: n2 To: n3 To: n4.
            segpts2 removeFirst.
            "addAll could be optimized to just link up two lists"
            segpts addAll: segpts2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: public'
        
         computeSegments: controlpts ForEachGroupDo: block = ( | {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            n: controlpts size.
            n < 4 ifTrue: [ error: 'not enough control points' ].
            (n - 1) / 3 do: [ | :i. j. segpts. |
                j: 3 * i.
                segpts: computeSegments: (controlpts at: j)
                                     To: (controlpts at: j + 1)
                                     To: (controlpts at: j + 2)
                                     To: (controlpts at: j + 3).
                block value: segpts.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: public'
        
         computeSegments: p1 To: p2 To: p3 To: p4 = ( |
            | 
            bezierRenderer: p1 asFloat
                        To: p2 asFloat
                        To: p3 asFloat
                        To: p4 asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: public'
        
         demo = ( |
             w.
            | 
            w: window copy.
            w handler: demoHandler copy.
            w handler window: w.
            w handler spline: self.
            w handler start.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         demoHandler = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals bezier demoHandler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot'
        
         addControlPoint: p = ( |
            | 
            controlpts add: p.
            redraw.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         buttonPress: event = ( |
            | 
            case
              if: event buttonName = 'left' Then: [
                addControlPoint: event x @ event y ]
              If: event buttonName = 'middle' Then: [
                middleDown: true.
                choosePoint: event x @ event y ]
              If: event buttonName = 'right' Then: [ clearAllPoints ].
            event delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         buttonRelease: event = ( |
            | 
            event buttonName = 'middle' ifTrue: [ middleDown: false ].
            event delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot'
        
         choosePoint: p = ( | {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 leastDist <- 0.
                } 
            | 
            movingPoint: controlpts at: 0.
            leastDist: distance: p To: movingPoint.
            controlpts do: [ | :cp. d. |
                d: distance: p To: cp.
                d < leastDist ifTrue: [
                    leastDist: d.
                    movingPoint: cp. ]. ].
            dragTo: p.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot'
        
         clearAllPoints = ( |
            | 
            controlpts: list copyRemoveAll.
            window platformWindow clear.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'Category: dataSlots\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         cme.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'Category: dataSlots\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         controlpts.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot'
        
         distance: p1 To: p2 = ( | {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 pd.
                } 
            | 
            pd: p1 - p2.
            (pd x square + pd y square) squareRoot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot'
        
         dragTo: p = ( |
            | 
            movingPoint: p.
            redraw.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot'
        
         drawControlPoint: p = ( | {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 s = 4.
                } 
            | 
            drawLine: (p subtractX: s) To: (p addX: s).
            drawLine: (p subtractY: s) To: (p addY: s).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot'
        
         drawCurve = ( |
            | 
            spline computeSegments: controlpts
               ForEachGroupDo: [ | :segpts |
                 window bitmap lines: segpts Width: 1 Color: cme ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot'
        
         drawLine: p1 To: p2 = ( |
            | window bitmap line: p1 To: p2 Color: cme).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         expose: event = ( |
            | 
            event count = 0 ifTrue: [ redraw ].
            event delete.            
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'Category: dataSlots\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         middleDown <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         motionNotify: event = ( |
            | 
            window eventsPending > 0 ifTrue: [ ^ event delete ].
            middleDown ifTrue: [ dragTo: event x @ event y ].
            event delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'Category: dataSlots\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         movingPoint.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot'
        
         redraw = ( |
            | 
            window platformWindow clear.
            controlpts do: [ | :cp | drawControlPoint: cp ].
            controlpts size >= 4 ifTrue: [ drawCurve ].
            window flush.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'Category: dataSlots\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         spline.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot'
        
         start = ( |
            | 
            window name: spline printString, ' demo   ', 
                '[ Left = add  |  Middle = move  |  Right = clear all ]'.
            window size: 600 @ 450.
            window open.
            cme: colormapEntry copy index: window screen blackPixel.
            clearAllPoints.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'Category: dataSlots\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         window.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         isStraightEnough: p1 To: p2 To: p3 To: p4 = ( | {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 epsilon = 1.0.
                }  {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 secondDeriv.
                }  {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 sum.
                } 
            | 
            "returns true if the sum of the 2nd derivatives at the ends of the
             bezier 'house' is under some threshold (epsilon)"
            secondDeriv: (p3 - p2) - (p2 - p1).
            sum: secondDeriv x absoluteValue + secondDeriv y absoluteValue.
            secondDeriv: (p4 - p3) - (p3 - p2).
            sum: sum + secondDeriv x absoluteValue + secondDeriv y absoluteValue.
            sum < epsilon).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         midpoint: point1 And: point2 = ( |
            | (point1 + point2) / 2.0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: spline InitialContents: FollowSlot'
        
         catmullRomSpline = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'catmullRomSpline' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals catmullRomSpline.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'catmullRomSpline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         computeConversionMatrix = ( | {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            "here is the conversion matrix in human-readable form"
            m: (( 0 & -1 &  0 &  0) asVector &
                ( 6 &  6 &  1 &  0) asVector &
                ( 0 &  1 &  6 &  6) asVector &
                ( 0 &  0 & -1 &  0) asVector) asVector.
            oneSixthMatrix: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'catmullRomSpline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: InitializeToExpression: (vector copyRemoveAll)\x7fVisibility: private'
        
         conversionMatrix = vector copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'catmullRomSpline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'spline' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot'
        
         spline = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'spline' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'spline' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules spline.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'spline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'spline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'spline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'spline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
                     bSpline  initializeConversionMatrix.
            catmullRomSpline  initializeConversionMatrix.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'spline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'spline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'spline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: public'
        
         computeSegments: controlpts ForEachGroupDo: block = ( | {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 bezierpts.
                }  {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            n: controlpts size.
            n < 4 ifTrue: [ error: 'not enough control points' ].
            bezierpts: convertToBezier: controlpts asVector.
            n - 3 do: [ | :i. j. segpts. |
                j: 4 * i.
                segpts: bezierRenderer: (bezierpts at: j)
                                    To: (bezierpts at: j + 1)
                                    To: (bezierpts at: j + 2)
                                    To: (bezierpts at: j + 3).
                block value: segpts.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'spline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         convertToBezier: splinepts = ( | {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 bezierpts.
                }  {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 tempVector.
                } 
            | 
            "Converts the spline defined by the n control points in
             splinepts into a bezier curve defined by 4(n-3) points,
             using the conversion matrix m."
            bezierpts: list copyRemoveAll.
            tempVector: vector copySize: 4.
            (splinepts size - 3) do: [ | :i. resVector. |
                4 do: [ | :j | tempVector at: j Put: splinepts at: i + j ].
                resVector: transformVector: tempVector WithMatrix: conversionMatrix.
                4 do: [ | :j | bezierpts add: resVector at: j ].
            ].
            bezierpts asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'spline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: public'
        
         convertToSegments: controlpts = ( | {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 allSegs.
                } 
            | 
            allSegs: list copyRemoveAll.
            computeSegments: controlpts
             ForEachGroupDo: [ | :segpts | allSegs addAll: segpts ].
            allSegs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'spline' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeConversionMatrix = ( | {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            m: reflect: computeConversionMatrix.
            (reflect: self) define: 
            (reflect: self) copyAt: 'conversionMatrix' PutContents: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'spline' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         oneSixthMatrix: m = ( |
            | 
            4 do: [ | :i |
                4 do: [ | :j |
                    (m at: i) at: j Put: (1.0 / 6) * ((m at: i) at: j) ] ].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'spline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'bezier' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'spline' -> () From: ( | {
         'ModuleInfo: Module: spline InitialContents: FollowSlot\x7fVisibility: private'
        
         transformVector: v WithMatrix: m = ( | {
                 'ModuleInfo: Module: spline InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: vector copySize: 4.
            4 do: [ | :i |
              r at: i Put: 0 @ 0.
              4 do: [ | :j |
                r at: i Put: (r at: i) + ((v at: j) * ((m at: j) at: i)).
              ].
            ].
            r).
        } | ) 



 '-- Side effects'

 globals modules spline postFileIn
