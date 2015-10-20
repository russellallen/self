 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
        
         xBitmapMaker = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'xBitmapMaker' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'xBitmapMaker' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules xBitmapMaker.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
        
         myComment <- 'Creates an X pixmap from an X bitmap file created with the
               X bitmap editor, \'bitmap\'.\"

            \"
            The format of X standard bitmap files is as follows:

            #define foo_width 10
            #define foo_height 4
            #define foo_x_hot 1
            #define foo_y_hot 1
            static char foo_bits[] = {
               0xff, 0x03, 0x25, 0x02, 0x25, 0x02, 0xff, 0x03};

            which describes the following bitmap:

               XXXXXXXXXX
               X.X..X...X
               X.X..X...X
               XXXXXXXXXX

            The two hotspot #define\'s are optional.
            This file is created by the X program \'bitmap\'.
            \"

            \"
            This program relies on:
                defines are written \'#define\' and begin the line;
                width is defined before height;
                bits are declared after width and height are defined;
                bits are defined in 2-byte hex chunks, each beginning with \'0x\';
                and that there isn\'t anything else in the file between these things
                  like other declarations using braces.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
        
         xBitmapMaker = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xBitmapMaker' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xBitmapMaker.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         data <- bootstrap stub -> 'globals' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         file.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         height <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
        
         xBitmapMaker = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xBitmapMaker.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xBitmapMaker' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         width <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         closeFile = ( |
            | file close).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         createBitmapForSameScreenAs: win = ( |
            | 
            xlib pixmap createBitmapForSameScreenAs: win
                                           FromData: data
                                               Size: width @ height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         getHeight = ( |
            | height: getIntegerDefineWithSuffix: '_height').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         getIntegerDefineWithSuffix: suffix = ( |
            | 
            [ skipThroughNextDefine.
              match: getNextWord WithSuffix: suffix ] whileFalse.
            getNextWord asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         getNextHexOrEnd: exit = ( | {
                 'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
                
                 buf.
                }  {
                 'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            buf: mutableString copySize: 2.
            skipToNextHexOrEnd: exit.
            (file readInto: buf Count: 2) != 2
              ifTrue: [ error: 'File read error' ].
            (buf at: 0), (buf at: 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         getNextNonWhitespace = ( | {
                 'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            [ c: file readOneChar ] untilFalse: [ whitespace includes: c ].
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         getNextWord = ( | {
                 'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
                
                 c.
                }  {
                 'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
                
                 w <- ''.
                } 
            | 
            c: getNextNonWhitespace.
            [ w: w, c.
              c: file readOneChar. ] untilTrue: [ whitespace includes: c ].
            w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         getWidth = ( |
            | width:  getIntegerDefineWithSuffix: '_width').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         match: word WithSuffix: suffix = ( | {
                 'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
                
                 start.
                } 
            | 
            start: word size - suffix size.
            start < 0 ifTrue: [ ^ false ].
            (word copyFrom: start) = suffix).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         openFile: filename = ( |
            | 
            file: os_file openForReading: filename).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         parseBitmapFile: filename = ( | {
                 'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
                
                 bytesAcross.
                }  {
                 'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
                
                 i <- 0.
                } 
            | 
            openFile: filename.
            getWidth.
            getHeight.
            bytesAcross: width /+ 8.
            data: byteVector copySize: bytesAcross * height.
            skipToNextArray.
            [ | :exit. hex. |
              hex: getNextHexOrEnd: exit.
              data at: i Put: hex hexAsInteger.
              i: i succ.
            ] loopExit.
            closeFile.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         skipThroughNextDefine = ( |
            | 
            [ getNextWord = '#define' ] whileFalse: [ skipToNextLine ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         skipToNextArray = ( | {
                 'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            [ c: file readOneChar ] untilTrue: [ c = '{' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         skipToNextHexOrEnd: exit = ( | {
                 'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            [ c: file readOneChar.
              c = '}' ifTrue: [ exit value ].
            ] untilTrue: [ c = 'x' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         skipToNextLine = ( | {
                 'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            [ c: file readOneChar ] untilTrue: [ c = '\n' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xBitmapMaker' -> () From: ( | {
         'ModuleInfo: Module: xBitmapMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         whitespace = ' 	

'.
        } | ) 



 '-- Side effects'

 globals modules xBitmapMaker postFileIn
