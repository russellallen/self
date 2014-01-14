 '$Revision: 20.1 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
         '


 '-- Module body'

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: doubleBuffering InitialContents: FollowSlot'
        
         doubleBuffering = bootstrap stub -> 'globals' -> 'modules' -> 'doubleBuffering' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'doubleBuffering' -> () _AddSlots: ( |
             {} = 'Comment: the prototype module object, I am created by init.self.\x7fModuleInfo: Creator: globals modules doubleBuffering.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'doubleBuffering' -> () _AddSlots: ( | {
         'ModuleInfo: Module: doubleBuffering InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'doubleBuffering' -> () _AddSlots: ( | {
         'ModuleInfo: Module: doubleBuffering InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui3D'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'doubleBuffering' -> () _AddSlots: ( | {
         'ModuleInfo: Module: doubleBuffering InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'doubleBuffering' -> () _AddSlots: ( | {
         'ModuleInfo: Module: doubleBuffering InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 20.1 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'doubleBuffering' -> () _AddSlots: ( | {
         'ModuleInfo: Module: doubleBuffering InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: doubleBuffering InitialContents: FollowSlot'
        
         doubleBuffering = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'doubleBuffering' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: traits windowing xgl doubleBuffering.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'doubleBuffering' -> () _AddSlots: ( | {
         'ModuleInfo: Module: doubleBuffering InitialContents: FollowSlot'
        
         currentDrawingBuffer <- 0.
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'doubleBuffering' -> () _AddSlots: ( | {
         'ModuleInfo: Module: doubleBuffering InitialContents: FollowSlot\x7fVisibility: public'
        
         flipBuffers = ( | 
            | 
            (numBuffers >= 2) ifTrue: [
               raster setAttribute: xgl attribute winRasBufDisplay
                         AttrValue: currentDrawingBuffer
                              Zero: 0.
               currentDrawingBuffer: (currentDrawingBuffer + 1) % numBuffers.
               raster setAttribute: xgl attribute winRasBufDraw
                         AttrValue: currentDrawingBuffer
                              Zero: 0.
            ].
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'doubleBuffering' -> () _AddSlots: ( | {
         'ModuleInfo: Module: doubleBuffering InitialContents: FollowSlot\x7fVisibility: public'
        
         initialize = ( | 
             buffersAllocated.
            | 

            buffersAllocated: byteVector copySize: 32 FillingWith: 0.
            raster setAttribute: xgl attribute winRasBuffersRequested
                      AttrValue: hardwareInfo maximum_buffer
                           Zero: 0.
            raster getAttribute: xgl attribute winRasBuffersAllocated
                      AttrValue: buffersAllocated.

            numBuffers: buffersAllocated cIntSize: 32 Signed: false At: 0.
            (numBuffers >= 2) ifTrue: [
               raster setAttribute: xgl attribute winRasBufDisplay
                         AttrValue: 0
                              Zero: 0.
               raster setAttribute: xgl attribute winRasBufDraw
                         AttrValue: 1
                              Zero: 0.
               currentDrawingBuffer: 1.
            ].
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'doubleBuffering' -> () _AddSlots: ( | {
         'ModuleInfo: Module: doubleBuffering InitialContents: FollowSlot'
        
         numBuffers <- 2.
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'doubleBuffering' -> () _AddSlots: ( | {
         'ModuleInfo: Module: doubleBuffering InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'system' -> 'roots' -> 'clonable' -> ().
        } | ) 



 '-- Side effects'

 globals modules doubleBuffering postFileIn
