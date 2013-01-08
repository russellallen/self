 'Sun-$Revision: 30.11 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         colormapEntry = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'colormapEntry' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals colormapEntry.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         rgbColor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'rgbColor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals rgbColor.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapEntry' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         color <- bootstrap stub -> 'globals' -> 'rgbColor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapEntry' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         index <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         colormapEntry = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits colormapEntry.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapEntry' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'colormapEntry' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapEntry' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            '((colormapEntry copy red: ', red   storeString,
                             ') green: ', green storeString,
                              ') blue: ', blue  storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapEntry' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'colormapEntry' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         colormapIndexEntry = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'colormapIndexEntry' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals colormapIndexEntry.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapIndexEntry' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         color <- bootstrap stub -> 'globals' -> 'rgbColor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapIndexEntry' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         index <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapIndexEntry' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'colormapEntry' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapIndexEntry' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            'colormapIndexEntry copy index: ', index  printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormapIndexEntry' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'colormapIndexEntry' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         hsbColor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'hsbColor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals hsbColor.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hsbColor' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         brightness <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hsbColor' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         hue <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         hsbColor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'hsbColor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits hsbColor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hsbColor' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hsbColor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hsbColor' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         saturation <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hsbColor' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: color InitialContents: FollowSlot'
        
         storeStringIfFail: fb = ( |
            | 
            '((hsbColor copy hue: ', hue storeString, ') ',
                         ' saturation: ', saturation storeString, ') ',
                         ' brightness: ', brightness storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hsbColor' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: color InitialContents: FollowSlot'
        
         storeStringNeeds = ( |
            | hsbColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot'
        
         color = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'color' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'color' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules color.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'color' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'color' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'color' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'color' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'color' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'colorRange'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rgbColor' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         blue <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rgbColor' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         green <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         rgbColor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'rgbColor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits rgbColor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rgbColor' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'rgbColor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rgbColor' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         red <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rgbColor' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: color InitialContents: FollowSlot'
        
         storeStringIfFail: fb = ( |
            | 
            '((rgbColor copy red: ', red storeString, ') ',
                         ' green: ', green storeString, ') ',
                         ' blue: ', blue storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rgbColor' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: color InitialContents: FollowSlot'
        
         storeStringNeeds = ( |
            | rgbColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         color = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'color' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits color.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | x equalsColor: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: colorSpace\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         asPoint: spaceSize InSaturationSpace: sat = ( | {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 x.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 xx.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 y.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 yy.
                } 
            | 
            x: ((hue - hsbRange min hue) /= hsbRange range hue).
            y: sat ifTrue: [ (saturation - hsbRange min saturation) /=
                             hsbRange range saturation ]
                    False: [ (brightness - hsbRange min brightness) /=
                             hsbRange range brightness ].
            xx: (x * spaceSize x) asInteger.
            yy: (spaceSize y - (y * spaceSize y)) asInteger.
            xx @ yy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsColor: x = ( |
            | 
            (red = x red)  &&  [(green = x green)  &&  [blue = x blue]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: colorSpace\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         fromPoint: p SpaceSize: spaceSize InSaturationSpace: sat = ( | {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 pp.
                } 
            | 
            pp: (p x @ (spaceSize y - p y)) restrictTo: spaceSize rect.
            hue: ((pp x /= spaceSize x) * hsbRange range hue) +
                 hsbRange min hue.
            sat ifTrue: [ saturation: ((pp y /= spaceSize y) *
                                       hsbRange range saturation) +
                                      hsbRange min saturation ]
                 False: [ brightness: ((pp y /= spaceSize y) *
                                       hsbRange range brightness) +
                                      hsbRange min brightness ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | red hash ^^ green hash ^^ blue hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: altering\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         increaseBrightnessBy: x = ( |
            | 
            brightness:  (brightness + x  min: hsbRange max brightness) max: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: altering\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         increaseHueBy: x = ( |
            | 
            hue: hue + x.
            [ hue < 0    ] whileTrue: [ hue: hue + 360 ].
            [ hue >= 360 ] whileTrue: [ hue: hue - 360 ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: altering\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         increaseSaturationBy: x = ( |
            | 
            saturation:  (saturation + x  min: hsbRange max saturation) max: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: interpolating\x7fComment: answer a color p of the way to c\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         interpolate: p From: c = ( |
            | interpolateRGB: p From: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: interpolating\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         interpolateHSB: p From: c = ( |
            | 
            ((hsbColor copy hue: hue        interpolate: p From: c hue)
                     saturation: saturation interpolate: p From: c saturation)
                     brightness: brightness interpolate: p From: c brightness).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: interpolating\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         interpolateRGB: p From: c = ( |
            | 
            ((rgbColor copy red:   red   interpolate: p From: c red)
                            blue:  blue  interpolate: p From: c blue)
                            green: green interpolate: p From: c green).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         isImmutableForFilingOut = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         macBlue = ( |
            | [todo ui1 dmu experimental]. blue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         macGreen = ( |
            | [todo ui1 dmu experimental]. green).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         macRed = ( |
            | [todo ui1 dmu experimental]. red).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'color' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            red printString, ', ', green printString, ', ',
               blue printString, '; ', hue printString, ', ',
               saturation printString, ', ', brightness printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | x equalsColormapEntry: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: colorElementAccessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         blue = ( |
            | color blue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: colorElementAccessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         blue: b = ( |
            | color blue: b. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: colorElementAccessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         brightness = ( |
            | color brightness).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: colorElementAccessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         brightness: b = ( |
            | color brightness: b. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy color: color copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsColormapEntry: x = ( |
            | (index = x index) && [color = x color]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: colorElementAccessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         green = ( |
            | color green).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: colorElementAccessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         green: g = ( |
            | color green: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | index hash ^^ color hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: colorElementAccessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         hue = ( |
            | color hue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: colorElementAccessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         hue: h = ( |
            | color hue: h. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: colorElementAccessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         red = ( |
            | color red).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: colorElementAccessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         red: r = ( |
            | color red: r. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: colorElementAccessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         saturation = ( |
            | color saturation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: colorElementAccessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         saturation: s = ( |
            | color saturation: s. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormapEntry' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | color printString, ' at: ', index printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hsbColor' -> () From: ( | {
         'Category: converting\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         asHSB = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hsbColor' -> () From: ( | {
         'Category: converting\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         asRGB = ( | {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 f.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 h.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 p.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 q.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 result.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 s.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 t.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 v.
                } 
            | 
            result: rgbColor copy.
            0 = saturation ifTrue: [
                result red:   brightness.
                result green: brightness.
                result blue:  brightness.
                ^ result ].

            h: 360 = hue ifTrue: [0.0] False: [hue asFloat].
            h: h / 60.
            i: h truncate asInteger.
            f: h - i.
            s: saturation /= 255.
            v: brightness /= 255.
            p: (1 - s) * v.
            q: v * (1 - (s * f)).
            t: v * (1 - (s * (1 - f))).

            v: (v * 255) asInteger.
            q: (q * 255) asInteger.
            p: (p * 255) asInteger.
            t: (t * 255) asInteger.

            0 = i ifTrue: [^((result red: v) green: t) blue: p].
            1 = i ifTrue: [^((result red: q) green: v) blue: p].
            2 = i ifTrue: [^((result red: p) green: v) blue: t].
            3 = i ifTrue: [^((result red: p) green: q) blue: v].
            4 = i ifTrue: [^((result red: t) green: p) blue: v].
            5 = i ifTrue: [^((result red: v) green: p) blue: q].
            error: 'bad i ', i printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hsbColor' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         blue = ( |
            | asRGB blue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hsbColor' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: color InitialContents: FollowSlot'
        
         from: c = ( |
            | 
            hue: c hue. saturation: c saturation. brightness: c brightness).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hsbColor' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         green = ( |
            | asRGB green).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hsbColor' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'color' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hsbColor' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         red = ( |
            | asRGB red).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hsbColor' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: color InitialContents: FollowSlot'
        
         storeStringIfFail: fb = ( |
            | 
            '((hsbColor copy hue: ', hue storeString, ') ',
                         ' saturation: ', saturation storeString, ') ',
                         ' brightness: ', brightness storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hsbColor' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: color InitialContents: FollowSlot'
        
         storeStringNeeds = ( |
            | hsbColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbColor' -> () From: ( | {
         'Category: converting\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         asHSB = ( | {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 h <- 0.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 max.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 min.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 range.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 result.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 s.
                }  {
                 'ModuleInfo: Module: color InitialContents: FollowSlot'
                
                 v.
                } 
            | 
            max: red max: green max: blue.
            min: red min: green min: blue.
            range: (max - min) asFloat.
            v: max.
            s: 0 = max ifTrue: 0 False: [range / max].
            0 = s ifFalse: [ | rc. gc. bc|
                rc: (max - red) / range.
                bc: (max - blue) / range.
                gc: (max - green) / range.

                red = max ifTrue:  [h: bc - gc]     False: [
                green = max ifTrue:  [h: (2 + rc) - bc] False: [
                blue = max ifTrue:  [h: (4 + gc) - rc]]].

                h: h * 60.
                0 > h ifTrue: [h: 360 + h].
            ].
            result: hsbColor copy.
            result hue: h asInteger.
            result saturation: (s * 255) asInteger.
            result brightness: max.
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbColor' -> () From: ( | {
         'Category: converting\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         asRGB = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbColor' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         brightness = ( |
            | asHSB brightness).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbColor' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         brightness: b = ( |
            | from: (asHSB brightness: b) asRGB).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbColor' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: color InitialContents: FollowSlot'
        
         from: c = ( |
            | red: c red. green: c green. blue: c blue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbColor' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         hue = ( |
            | asHSB hue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbColor' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         hue: h = ( |
            | from: (asHSB hue: h) asRGB).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbColor' -> () From: ( | {
         'ModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'color' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbColor' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         saturation = ( |
            | asHSB saturation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbColor' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: color InitialContents: FollowSlot\x7fVisibility: public'
        
         saturation: s = ( |
            | from: (asHSB saturation: s) asRGB).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbColor' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: color InitialContents: FollowSlot'
        
         storeStringIfFail: fb = ( |
            | 
            '((rgbColor copy red: ', red storeString, ') ',
                         ' green: ', green storeString, ') ',
                         ' blue: ', blue storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rgbColor' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: color InitialContents: FollowSlot'
        
         storeStringNeeds = ( |
            | rgbColor).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'colorRange' From: 'graphics'



 '-- Side effects'

 globals modules color postFileIn
