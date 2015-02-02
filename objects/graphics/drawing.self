 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot'
        
         drawing = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'drawing' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'drawing' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules drawing.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         drawing = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits drawing.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         arcWithin: rect From: startAngle Spanning: spanAngle Color: cme = ( |
            | 
            image gc foreground8Bit: cme.
            image drawArcWithin: rect
                           From: startAngle
                       Spanning: spanAngle
                             GC: image gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         bSpline: controlpts Width: width Color: cme = ( |
            | 
            bSpline computeSegments: controlpts
                ForEachGroupDo: [ | :segpts |
                                  lines: segpts Width: width Color: cme ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         bezier: p1 Control: c1 Control: c2 To: p2 Width: width Color: cme = ( | {
                 'ModuleInfo: Module: drawing InitialContents: FollowSlot'
                
                 segs.
                } 
            | 
            segs: bezier computeSegments: p1 To: c1 To: c2 To: p2.
            lines: segs Width: width Color: cme.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         catmullRomSpline: controlpts Width: width Color: cme = ( |
            | 
            catmullRomSpline computeSegments: controlpts
                ForEachGroupDo: [ | :segpts |
                                  lines: segpts Width: width Color: cme ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         circleCenteredAt: ctr Diameter: d Color: cme = ( | {
                 'ModuleInfo: Module: drawing InitialContents: FollowSlot'
                
                 r1.
                }  {
                 'ModuleInfo: Module: drawing InitialContents: FollowSlot'
                
                 r2.
                } 
            | 
            r1: d /+ 2.
            r2: d /- 2.
            arcWithin: (ctr - (r1@r1)) #! (ctr + (r2@r2))
                 From: 0
             Spanning: 360
                Color: cme).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         dashedLine: pt1 To: pt2 Width: width DashSize: n Offset: os Color: cme = ( |
            | 
            image gc dashedLineWidth: width.
            image gc dashes: (byteVector copySize: 1 FillingWith: n) Offset: os.
            line: pt1 To: pt2 Color: cme.
            image gc lineWidth: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         fillArcWithin: rect From: startAngle Spanning: spanAngle Color: cme = ( |
            | 
            image gc foreground8Bit: cme.
            image fillArcWithin: rect
                           From: startAngle
                       Spanning: spanAngle
                             GC: image gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         fillArcWithin: rect From: startAngle Spanning: spanAngle Pattern: pattern Color: cme = ( |
            | 
            pattern isNull ifTrue: [
                ^ fillArcWithin: rect From: startAnmgle
                  Spanning: spanAngle Color: cme ].
            image gc fillStippled.
            image gc stipple: pattern image.
            fillArcWithin: rect From: startAngle Spanning: spanAngle Color: cme.
            image gc fillSolid.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         fillArcWithin: rect From: startAngle Spanning: spanAngle Pattern: pattern Color: cme Background: bgcme = ( |
            | 
            pattern isNull ifTrue: [
                ^ fillArcWithin: rect From: startAnmgle
                  Spanning: spanAngle Color: cme ].
            image gc fillOpaqueStippled.
            image gc stipple: pattern image.
            image gc background8Bit: bgcme.
            fillArcWithin: rect From: startAngle Spanning: spanAngle Color: cme.
            image gc fillSolid.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         fillCircleCenteredAt: ctr Diameter: d Color: cme = ( | {
                 'ModuleInfo: Module: drawing InitialContents: FollowSlot'
                
                 r1.
                }  {
                 'ModuleInfo: Module: drawing InitialContents: FollowSlot'
                
                 r2.
                } 
            | 
            r1: d /+ 2.
            r2: d /- 2.
            fillArcWithin: (ctr - (r1@r1)) #! (ctr + (r2@r2))
                     From: 0
                 Spanning: 360
                    Color: cme).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         fillCircleCenteredAt: ctr Diameter: d Pattern: pattern Color: cme = ( |
            | 
            pattern isNull ifTrue: [
                ^ fillCircle centeredAt: ctr Diameter: d Color: cme ].
            image gc fillStippled.
            image gc stipple: pattern image.
            fillCircleCenteredAt: ctr Diameter: d Color: cme.
            image gc fillSolid.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         fillCircleCenteredAt: ctr Diameter: d Pattern: pattern Color: cme Background: bgcme = ( |
            | 
            pattern isNull ifTrue: [
                ^ fillCircle centeredAt: ctr Diameter: d Color: cme ].
            image gc fillOpaqueStippled.
            image gc stipple: pattern image.
            image gc background8Bit: bgcme.
            fillCircleCenteredAt: ctr Diameter: d Color: cme.
            image gc fillSolid.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'Comment: makes up for fillPolygon doing polygon tiling\x7fModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         fillFullPolygon: pointList Color: c = ( |
            | 
            fillPolygon: pointList Color: c.
            polygon: pointList Color: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygon: pointList Color: cme = ( |
            | 
            image gc foreground8Bit: cme.
            image fillPolygon: pointList GC: image gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygon: pointList Pattern: pattern Color: cme = ( |
            | 
            pattern isNull ifTrue: [ ^ fillPolygon: pointList Color: cme ].
            image gc fillStippled.
            image gc stipple: pattern image.
            fillPolygon: pointList Color: cme.
            image gc fillSolid.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygon: pointList Pattern: pattern Color: cme Background: bgcme = ( |
            | 
            pattern isNull ifTrue: [ ^ fillPolygon: pointList Color: cme ].
            image gc fillOpaqueStippled.
            image gc stipple: pattern image.
            image gc background8Bit: bgcme.
            fillPolygon: pointList Color: cme.
            image gc fillSolid.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRectangle: rect Color: cme = ( |
            | 
            image gc foreground8Bit: cme.
            image fillRectangle: rect GC: image gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRectangle: rect Pattern: pattern Color: cme = ( |
            | 
            pattern isNull ifTrue: [ ^ fillRectangle: rect Color: cme ].
            image gc fillStippled.
            image gc stipple: pattern image.
            fillRectangle: rect Color: cme.
            image gc fillSolid.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRectangle: rect Pattern: pattern Color: cme Background: bgcme = ( |
            | 
            pattern isNull ifTrue: [ ^ fillRectangle: rect Color: cme ].
            image gc fillOpaqueStippled.
            image gc stipple: pattern image.
            image gc background8Bit: bgcme.
            fillRectangle: rect Color: cme.
            image gc fillSolid.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         line: pt1 To: pt2 Color: cme = ( |
            | 
            image gc foreground8Bit: cme.
            image drawLine: pt1 To: pt2 GC: image gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         line: pt1 To: pt2 Width: width Color: cme = ( |
            | 
            image gc lineWidth: width.
            line: pt1 To: pt2 Color: cme.
            image gc lineWidth: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         lines: pointList Width: width Color: cme = ( |
            | 
            image gc foreground8Bit: cme.
            image gc lineWidth: width.
            image drawLines: pointList GC: image gc.
            image gc lineWidth: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         point: pt Color: cme = ( |
            | 
            image gc foreground8Bit: cme.
            image drawPoint: pt GC: image gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         polygon: pointList Color: cme = ( |
            | 
            polygon: pointList Width: 1 Color: cme).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         polygon: pointList Width: width Color: cme = ( |
            | 
            lines: (pointList copyAddLast: pointList first)
            Width: width
            Color: cme).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         rectangle: rect Color: cme = ( |
            | 
            image gc foreground8Bit: cme.
            image drawRectangle: rect GC: image gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         rectangle: rect Width: width Color: cme = ( |
            | 
            image gc lineWidth: width.
            rectangle: rect Color: cme.
            image gc lineWidth: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         text: string At: pt Font: font Color: cme = ( |
             y.
            | 
            y: pt y + (font height - font descender).
            image gc foreground8Bit: cme.
            image gc font: font xfont.
            image drawString: string At: pt x @ y GC: image gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         textLines: txt At: pt Font: font Color: cme = ( |
             y.
            | 
            y: pt y + (font height - font descender).
            image gc foreground8Bit: cme.
            image gc font: font xfont.
            txt lines do: [ | :aLine |
                image drawString: aLine At: pt x @ y GC: image gc.
                y: y + font height ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         xorFillPolygon: pointList Color: c = ( |
            | 
            image gc function: image gc gxXor.
            fillPolygon: pointList Color: c.
            image gc function: image gc gxCopy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         xorLine: pt1 To: pt2 Width: width Color: cme = ( |
            | 
            image gc function: image gc gxXor.
            image gc lineWidth: width.
            line: pt1 To: pt2 Color: cme.
            image gc lineWidth: 0.
            image gc function: image gc gxCopy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         xorPolygon: pointList Color: cme = ( |
            | 
            image gc function: image gc gxXor.
            pointList doFirstMiddle: [ | :p. :i |
                line: p To: (pointList at: i successor) Color: cme
            ] Last: [ | :p |
                line: p To: (pointList at: 0) Color: cme
            ] IfEmpty: nil.
            image gc function: image gc gxCopy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'drawing' -> () From: ( | {
         'ModuleInfo: Module: drawing InitialContents: FollowSlot\x7fVisibility: public'
        
         xorRect: rect Width: width Color: cme = ( |
            | 
            image gc function: image gc gxXor.
            image gc lineWidth: width.
            rectangle: rect Color: cme.
            image gc lineWidth: 0.
            image gc function: image gc gxCopy.
            self).
        } | ) 



 '-- Side effects'

 globals modules drawing postFileIn
