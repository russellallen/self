 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: public'
        
         font = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'font' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals font.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         descender <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: private'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: public'
        
         font = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'font' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits font.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'font' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         size <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         xfont <- bootstrap stub -> 'globals' -> 'xlib' -> 'font' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: private'
        
         xfs <- bootstrap stub -> 'globals' -> 'xlib' -> 'xFontStruct' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: font InitialContents: FollowSlot'
        
         font = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'font' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'font' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules font.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: font InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: font InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'font' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n On: win = ( |
            | 
            copyName: n On: win IfFail: [ | :e |
                ^ error: 'could not load font ', n,
                  ' -- use xlsfonts in a shell to list available X fonts' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'font' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n On: win IfFail: fb = ( |
            | 
            copy installName: n On: win IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'font' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | xfs delete. xfont delete. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'font' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | size y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'font' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: public'
        
         heightOfString: str = ( | {
                 'ModuleInfo: Module: font InitialContents: FollowSlot'
                
                 h <- 0.
                } 
            | 
            str do: [ | :c. newline = '\n'. |
                newline = c ifTrue: [ h: h succ. ]. ].
            h succ * height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'font' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: private'
        
         installName: n On: win IfFail: fb = ( |
            | 
            name: n.
            xfs: win loadFont: n IfFail: [ | :e | ^ fb value: e ].
            xfont: xfs fid.
            size: xfs maxCharWidth @ (xfs ascent + xfs descent).
            descender: xfs descent.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'font' -> () From: ( | {
         'Category: sizing\x7fComment: same as (widthOfString: str) @ (heightOfString: str),
	 but iterates only once\x7fModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: public'
        
         sizeOfString: str = ( | {
                 'ModuleInfo: Module: font InitialContents: FollowSlot'
                
                 f <- 0.
                }  {
                 'ModuleInfo: Module: font InitialContents: FollowSlot'
                
                 h <- 0.
                }  {
                 'ModuleInfo: Module: font InitialContents: FollowSlot'
                
                 w <- 0.
                } 
            | 
            str do: [ | :c. :i. newline = '\n'. |
                newline = c ifTrue: [
                    w: w max: xfs textWidth: str copyFrom: f UpTo: i.
                    f: i succ.
                    h: h succ. ]. ].
            w: w max: xfs textWidth: str copyFrom: f.
            w @ (h succ * height)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'font' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'font' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | size x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'font' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: font InitialContents: FollowSlot\x7fVisibility: public'
        
         widthOfString: str = ( | {
                 'ModuleInfo: Module: font InitialContents: FollowSlot'
                
                 f <- 0.
                }  {
                 'ModuleInfo: Module: font InitialContents: FollowSlot'
                
                 w <- 0.
                } 
            | 
            str do: [ | :c. :i. newline = '\n'. |
                newline = c ifTrue: [
                    w: w max: xfs textWidth: str copyFrom: f UpTo: i.
                    f: i succ. ]. ].
            w max: xfs textWidth: str copyFrom: f).
        } | ) 



 '-- Side effects'

 globals modules font postFileIn
