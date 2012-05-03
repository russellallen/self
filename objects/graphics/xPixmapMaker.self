 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         xPixmapMaker = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'xPixmapMaker' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'xPixmapMaker' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules xPixmapMaker.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         myComment <- 'Creates an X pixmap from an X pixmap file.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         xPixmapMaker = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xPixmapMaker' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xPixmapMaker.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         charsPerPixel <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         colorDict <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: InitializeToExpression: (vector copySize: 1 FillingWith: vector copy)'
        
         data <- vector copySize: 1 FillingWith: vector copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         file.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         height <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         nColors <- 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         xPixmapMaker = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xPixmapMaker' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xPixmapMaker.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'xPixmapMaker' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         width <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         convertColorString: cs = ( | {
                 'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            cs = 'black' ifTrue: [ ^ (0 & 0 & 0 ) asList ].
            cs = 'white' ifTrue: [ ^ (255 & 255 & 255 ) asList ].
            n: ( '16r' , cs copyWithoutFirst) eval.
            ( ((n >> 16) && 255) &  ((n >> 8) && 255) & (n && 255) ) asList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         getCharsPerPixel = ( |
            | 
            charsPerPixel: getIntegerDefineWithSuffix: '_chars_per_pixel').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         getNcolors = ( |
            | nColors: getIntegerDefineWithSuffix: '_ncolors').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         getNextDoubleQuotedString = ( | {
                 'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
                
                 c.
                }  {
                 'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
                
                 s <- ''.
                } 
            | 
            [ c: file readOneChar. c = '"' ] whileFalse: [ ].
            [ c: file readOneChar. c = '"' ] whileFalse: [ s: s, c ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         getNextDoubleQuotedString: n = ( | {
                 'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
                
                 c.
                }  {
                 'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            "get the first n characters from the next double quoted string"
            "and advance past the string"
            [ c: file readOneChar. c = '"' ] whileFalse: [ ].
            s: file readCount: n.
            [ c: file readOneChar. c = '"' ] whileFalse: [ ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         knownFormat = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'xBitmapMaker' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         parseColors = ( |
            | 
            colorDict: colorDict copyRemoveAll.
            nColors do: [ | :i. s. cs. |
                s: getNextDoubleQuotedString.
                cs: getNextDoubleQuotedString.
                colorDict at: s Put: cs. ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         parsePixelsIntoData = ( | {
                 'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
                
                 sw.
                } 
            | 
            data: data copySize: height.
            sw: width * charsPerPixel.
            height do: [ | :j. s. |
                s: getNextDoubleQuotedString: sw.
                data at: j Put: data copyRemoveAll copySize: width.
                j = height ifTrue: [ j printLine. (data at: j) printLine.].
                width do: [ | :i. n. pix. |
                    n: i * 2.
                    pix: s copyFrom: n UpTo: n + charsPerPixel.
                    (data at: j) at: i Put: pix.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         parsePixmapFile: filename = ( | {
                 'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
                
                 format.
                } 
            | 
            openFile: filename.
            format:  getIntegerDefineWithSuffix: '_format'.
            format != knownFormat ifTrue: [
                closeFile.
                error: 'unknown pixmap file format: ', format printString. ].
            getWidth.
            getHeight.
            getNcolors.
            getCharsPerPixel.
            skipToNextArray.
            parseColors.
            skipToNextArray.
            parsePixelsIntoData.
            closeFile.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
        
         pixmapForPaintManager: ptMgr SameScreenAs: xDrawable = ( | {
                 'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
                
                 colorSymToIndex.
                }  {
                 'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
                
                 im.
                }  {
                 'ModuleInfo: Module: xPixmapMaker InitialContents: FollowSlot'
                
                 pm.
                } 
            | 
            colorSymToIndex: dictionary copyRemoveAll.
            pm: xlib pixmap createForSameScreenAs: xDrawable
                                             Size: width @ height
                                            Depth: xDrawable depth.
            im: xDrawable display xGetImage: pm 
                            X: 0
                            Y: 0
                        Width: width
                       Height: height
                    PlaneMask: 16rffff
                       Format: xDrawable zPixmap.
            colorDict do: [ | :v . :k . colorList. index  | 
               colorList: convertColorString: v.
               index: ptMgr indexForColor: 
                              (paint copyRed: ((colorList at: 0) / 255.0 )
                                       Green: ((colorList at: 1) / 255.0 )
                                        Blue: ((colorList at: 2) / 255.0 )).
               colorList print. ' ' print. index printLine.
               colorSymToIndex at: k Put: index.
            ].
            height do: [ | :y | width do: [ | :x | 
                  im xPutPixelX: x 
                              Y: y 
                          Value: colorSymToIndex at: (data at: y) at: x.
             ]].
            pm display xPutImage: pm 
                              GC: pm display gc 
                           Image: im 
                            SrcX: 0 
                            SrcY: 0 
                           DestX: 0 
                           DestY: 0 
                           Width: pm size x
                          Height: pm size y.
            pm).
        } | ) 



 '-- Side effects'

 globals modules xPixmapMaker postFileIn
