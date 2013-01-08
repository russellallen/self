 '$Revision: 14.1 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
         '


 '-- Module body'



 '-- Set privacy, parenthood, assignability, and annotation of <<globals modules pixelGridMorph>>'


globals modules _AddSlots: ( | 
    {  'ModuleInfo: Module: pixelGridMorph Contents: FollowSlot(maintain identity)'
        
           pixelGridMorph = bootstrap stub -> 'globals' -> 'modules' -> 'pixelGridMorph' -> ().
    }
    | )

globals modules pixelGridMorph _AddSlots: (
     bootstrap remove: 'comment' From:
     bootstrap remove: 'directory' From:
     bootstrap remove: 'fileInTimeString' From:
     bootstrap remove: 'postFileIn' From:
     bootstrap remove: 'revision' From:
     bootstrap remove: 'status' From:
     bootstrap remove: 'subpartNames' From:
     globals modules init copy ) _AddSlots: ( |
     {} = 'ModuleInfo: Owned by: globals modules pixelGridMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision status subpartNames.

'.
    
    {  'ModuleInfo: Module: pixelGridMorph Contents: ConnectToExpression: (_CurrentTimeString)'
        
         ^ fileInTimeString <- _CurrentTimeString.
    }
    {  'ModuleInfo: Module: pixelGridMorph Contents: FollowSlot'
        
         ^ comment <- ''.
         ^ directory <- 'ui2/examples'.
         ^ revision <- '$Revision: 14.1 $'.
         ^ status <- 'new'.
         ^ subpartNames <- ''.
    }
    | )


 '-- Set privacy, parenthood, assignability, and annotation of <<traits ui2 pixelGridMorph>>'


traits ui2 _AddSlots: ( | 
    {  'Category: Applications\x7fCategory: PixelGrid\x7fModuleInfo: Module: pixelGridMorph Contents: FollowSlot'
        
         ^ pixelGridMorph = bootstrap stub -> 'traits' -> 'ui2' -> 'pixelGridMorph' -> ().
    }
    | )

traits ui2 pixelGridMorph _AddSlots: ( |
     {} = 'ModuleInfo: Owned by: traits ui2 pixelGridMorph.
'.
    
    {  'ModuleInfo: Module: pixelGridMorph Contents: FollowSlot'
        
         ^ parent* = bootstrap stub -> 'traits' -> 'ui2' -> 'morph' -> ().
         ^ example = ( |
             {} = 'ModuleInfo: Owned by: traits ui2 pixelGridMorph example.
'.
            
               new.
            | 
            "Assume the desktop is open."

            new: copy pixelSize: 3.
            new initializeWidth: 100 Height: 100.
            desktop add: new.
            worldMorph desiredFrameTime: 0. "for maximum speed" new startGettingStepped.
            self).
        
         ^ initializePrototype = ( |
             {} = 'ModuleInfo: Owned by: traits ui2 pixelGridMorph initializePrototype.
'.
            
            | removeAllMorphs.
            fgColor: paint named: 'red'.
            color: paint named: 'lightGray'.
            pixelSize: 5.
            initializeWidth: 100 Height: 100.
            self).
        
         ^ initializeWidth: w Height: h = ( |
             {} = 'ModuleInfo: Owned by: traits ui2 pixelGridMorph initializeWidth:Height:.
'.
            
            | width: w.
            height: h.
            pixels: byteVector copySize: (w * h) FillingWith: 0. setWidth: w * pixelSize Height: h * pixelSize. self).
         ^ morphTypeName = 'pixelGridMorph'.
         ^ reportDamageAtRow: r Col: c = ( |
             {} = 'ModuleInfo: Owned by: traits ui2 pixelGridMorph reportDamageAtRow:Col:.
'.
            
               globalOrigin.
            | 
            globalOrigin: globalPosition + ((c * pixelSize)@(r * pixelSize)). world damaged: globalOrigin ## (pixelSize@pixelSize). self).
        
         ^ step = ( |
             {} = 'ModuleInfo: Owned by: traits ui2 pixelGridMorph step.
'.
            
            | "Toggle a random pixel."

            toggleRow: (random integer: height)
            Col: (random integer: width).
            self).
        
         ^ toggleRow: r Col: c = ( |
             {} = 'ModuleInfo: Owned by: traits ui2 pixelGridMorph toggleRow:Col:.
'.
            
               i.
            | 
            i: (r * width) + c.
            (0 = (pixels at: i))
            ifTrue: [ pixels at: i Put: 1 ]
            False: [ pixels at: i Put: 0 ].
            reportDamageAtRow: r Col: c.
            self).
        
         _ baseDrawOn: aCanvas = ( |
             {} = 'ModuleInfo: Owned by: traits ui2 pixelGridMorph baseDrawOn:.
'.
            
            | nil = aCanvas redrawBox
            ifTrue: [ drawAllOn: aCanvas ]
            False: [ drawIncrementallyOn: aCanvas ]. self).
        
         _ drawAllOn: aCanvas = ( |
             {} = 'ModuleInfo: Owned by: traits ui2 pixelGridMorph drawAllOn:.
'.
            
               c.
            | 
            "Redraw all the pixels."

            aCanvas fillRectangle: baseBounds Color: color. "draw background" c: (aCanvas copyOffset: position).
            "draw foreground pixels"
            height do: [| :row. rowOffset |
            rowOffset: row * width.
            width do: [| :col |
            0 = (pixels at: (rowOffset + col)) ifFalse: [| r | 
            r: ((col * pixelSize)@(row * pixelSize)) ## (pixelSize@pixelSize). c fillRectangle: r Color: fgColor.
            ].
            ].
            ].
            self).
        
         _ drawIncrementallyOn: aCanvas = ( |
             {} = 'ModuleInfo: Owned by: traits ui2 pixelGridMorph drawIncrementallyOn:.
'.
            
               b.
               box.
               c.
               l.
               localBox.
               r.
               t.
            | 
            "Redraw just the pixels in the damaged region." 

            box: aCanvas redrawBox. "the damaged region in global coordinates" localBox:
            (((box origin - globalPosition) max: (0@0)) # 
            ((box corner - globalPosition) min: baseBounds size)). c: (aCanvas copyOffset: position).
            c fillRectangle: localBox Color: color. "fill box with background color" 

            "find starting and ending rows and columns that span damaged area" l: (localBox left / pixelSize) max: 0.
            t: (localBox top / pixelSize) max: 0.
            r: ((localBox right + pixelSize pred) / pixelSize) min: width pred. b: ((localBox bottom + pixelSize pred) / pixelSize) min: height pred. 

            "redraw the damaged area"
            t to: b Do: [| :row. rowOffset |
            rowOffset: row * width.
            l to: r Do: [| :col |
            0 = (pixels at: (rowOffset + col)) ifFalse: [| r | 
            r: ((col * pixelSize)@(row * pixelSize)) ## (pixelSize@pixelSize). c fillRectangle: r Color: fgColor.
            ].
            ].
            ].
            self).
    }
    | )


 '-- Set privacy, parenthood, assignability, and annotation of <<globals ui2 pixelGridMorph>>'


globals ui2 _AddSlots: ( | 
    {  'Category: Applications\x7fCategory: PixelGridMorph\x7fModuleInfo: Module: pixelGridMorph Contents: FollowSlot'
        
         ^ pixelGridMorph = bootstrap stub -> 'globals' -> 'ui2' -> 'pixelGridMorph' -> ().
    }
    | )

globals ui2 pixelGridMorph _AddSlots: (
     bootstrap remove: 'cachedMinHeight' From:
     bootstrap remove: 'cachedMinWidth' From:
     bootstrap remove: 'noStickOuts' From:
     bootstrap remove: 'parent' From:
     bootstrap remove: 'rawBox' From:
     bootstrap remove: 'rawColor' From:
     bootstrap remove: 'rawFlags' From:
     bootstrap remove: 'rawMorphs' From:
     bootstrap remove: 'rawOwner' From:
     bootstrap remove: 'thisObjectPrints' From:
     morph copy ) _AddSlots: ( |
     {} = 'ModuleInfo: Owned by: globals ui2 pixelGridMorph.

CopyDowns:
globals ui2 morph. copy 
SlotsToOmit: cachedMinHeight cachedMinWidth noStickOuts parent rawBox rawColor rawFlags rawMorphs rawOwner thisObjectPrints.

'.
    
    {  'ModuleInfo: Module: pixelGridMorph Contents: ConnectToExpression: (paint named: \'red\')'
        
         ^ fgColor <- paint named: 'red'.
    }
    {  'ModuleInfo: Module: pixelGridMorph Contents: FollowSlot'
        
         ^ parent* = bootstrap stub -> 'traits' -> 'ui2' -> 'pixelGridMorph' -> ().
         ^ height <- 100.
         ^ pixelSize <- 5.
         ^ pixels <- byteVector _CloneBytes: 10000 Filler: 0.
         ^ width <- 100.
    }
    | )


 '-- Object annotation patches'

 globals ui2 pixelGridMorph pixels _Mirror _MirrorAnnotation: 'ModuleInfo: Owned by: globals ui2 pixelGridMorph pixels.
'




 '-- Side effects'

 globals modules pixelGridMorph postFileIn
