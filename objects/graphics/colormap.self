 'Sun-$Revision: 30.11 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         cachedColormap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'cachedColormap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals cachedColormap.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'cachedColormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: private'
        
         dummyColor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'cachedColormap' -> 'dummyColor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals cachedColormap dummyColor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'cachedColormap' -> 'dummyColor' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot'
        
         delete = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'cachedColormap' -> 'dummyColor' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot'
        
         isLive = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         cachedColormap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'cachedColormap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits cachedColormap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'cachedColormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'cachedColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'cachedColormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: InitializeToExpression: ( nil )'
        
         platformColors <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         colormap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'colormap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals colormap.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         colormap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits colormap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'colormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( | {
         'Category: destroying\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: private'
        
         nullXCM = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'colormap' -> 'nullXCM' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits colormap nullXCM.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: private'
        
         xcm <- bootstrap stub -> 'traits' -> 'colormap' -> 'nullXCM' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot'
        
         colormap = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'colormap' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'colormap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules colormap.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot'
        
         myComment <- 'The cached version of the colormap is a vector of xColor objects;
             send convertForWindow: to get a usable colormap for a specific X window.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         postFileIn = ( |
            | 
            cachedColormap invalidate.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         newPlatformColorForPixel: i = ( |
            | 
            xlib xColor new allComponents pixel: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         platformColormap = ( |
            | xlib colormap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedColormap' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         at: i = ( |
             col.
             xc.
            | 
            xc: platformColors at: i.
            col: ((rgbColor copy red: xc red   >> 8)
                               green: xc green >> 8)
                                blue: xc blue  >> 8.
            col).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedColormap' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         at: i Put: color = ( |
             c.
            | 
            c: platformColors at: i.
            c red:   color red   round asInteger << 8.
            c green: color green round asInteger << 8.
            c blue:  color blue  round asInteger << 8.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         convertForWindow: win = ( | {
                 'ModuleInfo: Module: colormap InitialContents: FollowSlot'
                
                 cm.
                } 
            | 
            cm: colormap copyOn: win.
            cm colorsFromCache: self.
            cm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedColormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             cm.
            | 
            cm: resend.copy platformColors: 
                platformColors copy.
            cm platformColors size do: [ | :i |
                cm platformColors at: i
                          Put: ui1GraphicsGlobals newPlatformColorForPixel: i ].
            cm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedColormap' -> () From: ( | {
         'Category: destroying\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            platformColors do: [ | :c | c isLive ifTrue: [c delete] ].
            invalidate.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedColormap' -> () From: ( | {
         'Category: destroying\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         invalidate = ( |
            | 
            platformColors: nullPlatformColorVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedColormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: private'
        
         nullPlatformColorVector = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: traits cachedColormap nullPlatformColorVector.
'.
                    | ) ) _Clone: 256 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x _At: 3  Put: ().
             x _At: 4  Put: ().
             x _At: 5  Put: ().
             x _At: 6  Put: ().
             x _At: 7  Put: ().
             x _At: 8  Put: ().
             x _At: 9  Put: ().
             x _At: 10  Put: ().
             x _At: 11  Put: ().
             x _At: 12  Put: ().
             x _At: 13  Put: ().
             x _At: 14  Put: ().
             x _At: 15  Put: ().
             x _At: 16  Put: ().
             x _At: 17  Put: ().
             x _At: 18  Put: ().
             x _At: 19  Put: ().
             x _At: 20  Put: ().
             x _At: 21  Put: ().
             x _At: 22  Put: ().
             x _At: 23  Put: ().
             x _At: 24  Put: ().
             x _At: 25  Put: ().
             x _At: 26  Put: ().
             x _At: 27  Put: ().
             x _At: 28  Put: ().
             x _At: 29  Put: ().
             x _At: 30  Put: ().
             x _At: 31  Put: ().
             x _At: 32  Put: ().
             x _At: 33  Put: ().
             x _At: 34  Put: ().
             x _At: 35  Put: ().
             x _At: 36  Put: ().
             x _At: 37  Put: ().
             x _At: 38  Put: ().
             x _At: 39  Put: ().
             x _At: 40  Put: ().
             x _At: 41  Put: ().
             x _At: 42  Put: ().
             x _At: 43  Put: ().
             x _At: 44  Put: ().
             x _At: 45  Put: ().
             x _At: 46  Put: ().
             x _At: 47  Put: ().
             x _At: 48  Put: ().
             x _At: 49  Put: ().
             x _At: 50  Put: ().
             x _At: 51  Put: ().
             x _At: 52  Put: ().
             x _At: 53  Put: ().
             x _At: 54  Put: ().
             x _At: 55  Put: ().
             x _At: 56  Put: ().
             x _At: 57  Put: ().
             x _At: 58  Put: ().
             x _At: 59  Put: ().
             x _At: 60  Put: ().
             x _At: 61  Put: ().
             x _At: 62  Put: ().
             x _At: 63  Put: ().
             x _At: 64  Put: ().
             x _At: 65  Put: ().
             x _At: 66  Put: ().
             x _At: 67  Put: ().
             x _At: 68  Put: ().
             x _At: 69  Put: ().
             x _At: 70  Put: ().
             x _At: 71  Put: ().
             x _At: 72  Put: ().
             x _At: 73  Put: ().
             x _At: 74  Put: ().
             x _At: 75  Put: ().
             x _At: 76  Put: ().
             x _At: 77  Put: ().
             x _At: 78  Put: ().
             x _At: 79  Put: ().
             x _At: 80  Put: ().
             x _At: 81  Put: ().
             x _At: 82  Put: ().
             x _At: 83  Put: ().
             x _At: 84  Put: ().
             x _At: 85  Put: ().
             x _At: 86  Put: ().
             x _At: 87  Put: ().
             x _At: 88  Put: ().
             x _At: 89  Put: ().
             x _At: 90  Put: ().
             x _At: 91  Put: ().
             x _At: 92  Put: ().
             x _At: 93  Put: ().
             x _At: 94  Put: ().
             x _At: 95  Put: ().
             x _At: 96  Put: ().
             x _At: 97  Put: ().
             x _At: 98  Put: ().
             x _At: 99  Put: ().
             x _At: 100  Put: ().
             x _At: 101  Put: ().
             x _At: 102  Put: ().
             x _At: 103  Put: ().
             x _At: 104  Put: ().
             x _At: 105  Put: ().
             x _At: 106  Put: ().
             x _At: 107  Put: ().
             x _At: 108  Put: ().
             x _At: 109  Put: ().
             x _At: 110  Put: ().
             x _At: 111  Put: ().
             x _At: 112  Put: ().
             x _At: 113  Put: ().
             x _At: 114  Put: ().
             x _At: 115  Put: ().
             x _At: 116  Put: ().
             x _At: 117  Put: ().
             x _At: 118  Put: ().
             x _At: 119  Put: ().
             x _At: 120  Put: ().
             x _At: 121  Put: ().
             x _At: 122  Put: ().
             x _At: 123  Put: ().
             x _At: 124  Put: ().
             x _At: 125  Put: ().
             x _At: 126  Put: ().
             x _At: 127  Put: ().
             x _At: 128  Put: ().
             x _At: 129  Put: ().
             x _At: 130  Put: ().
             x _At: 131  Put: ().
             x _At: 132  Put: ().
             x _At: 133  Put: ().
             x _At: 134  Put: ().
             x _At: 135  Put: ().
             x _At: 136  Put: ().
             x _At: 137  Put: ().
             x _At: 138  Put: ().
             x _At: 139  Put: ().
             x _At: 140  Put: ().
             x _At: 141  Put: ().
             x _At: 142  Put: ().
             x _At: 143  Put: ().
             x _At: 144  Put: ().
             x _At: 145  Put: ().
             x _At: 146  Put: ().
             x _At: 147  Put: ().
             x _At: 148  Put: ().
             x _At: 149  Put: ().
             x _At: 150  Put: ().
             x _At: 151  Put: ().
             x _At: 152  Put: ().
             x _At: 153  Put: ().
             x _At: 154  Put: ().
             x _At: 155  Put: ().
             x _At: 156  Put: ().
             x _At: 157  Put: ().
             x _At: 158  Put: ().
             x _At: 159  Put: ().
             x _At: 160  Put: ().
             x _At: 161  Put: ().
             x _At: 162  Put: ().
             x _At: 163  Put: ().
             x _At: 164  Put: ().
             x _At: 165  Put: ().
             x _At: 166  Put: ().
             x _At: 167  Put: ().
             x _At: 168  Put: ().
             x _At: 169  Put: ().
             x _At: 170  Put: ().
             x _At: 171  Put: ().
             x _At: 172  Put: ().
             x _At: 173  Put: ().
             x _At: 174  Put: ().
             x _At: 175  Put: ().
             x _At: 176  Put: ().
             x _At: 177  Put: ().
             x _At: 178  Put: ().
             x _At: 179  Put: ().
             x _At: 180  Put: ().
             x _At: 181  Put: ().
             x _At: 182  Put: ().
             x _At: 183  Put: ().
             x _At: 184  Put: ().
             x _At: 185  Put: ().
             x _At: 186  Put: ().
             x _At: 187  Put: ().
             x _At: 188  Put: ().
             x _At: 189  Put: ().
             x _At: 190  Put: ().
             x _At: 191  Put: ().
             x _At: 192  Put: ().
             x _At: 193  Put: ().
             x _At: 194  Put: ().
             x _At: 195  Put: ().
             x _At: 196  Put: ().
             x _At: 197  Put: ().
             x _At: 198  Put: ().
             x _At: 199  Put: ().
             x _At: 200  Put: ().
             x _At: 201  Put: ().
             x _At: 202  Put: ().
             x _At: 203  Put: ().
             x _At: 204  Put: ().
             x _At: 205  Put: ().
             x _At: 206  Put: ().
             x _At: 207  Put: ().
             x _At: 208  Put: ().
             x _At: 209  Put: ().
             x _At: 210  Put: ().
             x _At: 211  Put: ().
             x _At: 212  Put: ().
             x _At: 213  Put: ().
             x _At: 214  Put: ().
             x _At: 215  Put: ().
             x _At: 216  Put: ().
             x _At: 217  Put: ().
             x _At: 218  Put: ().
             x _At: 219  Put: ().
             x _At: 220  Put: ().
             x _At: 221  Put: ().
             x _At: 222  Put: ().
             x _At: 223  Put: ().
             x _At: 224  Put: ().
             x _At: 225  Put: ().
             x _At: 226  Put: ().
             x _At: 227  Put: ().
             x _At: 228  Put: ().
             x _At: 229  Put: ().
             x _At: 230  Put: ().
             x _At: 231  Put: ().
             x _At: 232  Put: ().
             x _At: 233  Put: ().
             x _At: 234  Put: ().
             x _At: 235  Put: ().
             x _At: 236  Put: ().
             x _At: 237  Put: ().
             x _At: 238  Put: ().
             x _At: 239  Put: ().
             x _At: 240  Put: ().
             x _At: 241  Put: ().
             x _At: 242  Put: ().
             x _At: 243  Put: ().
             x _At: 244  Put: ().
             x _At: 245  Put: ().
             x _At: 246  Put: ().
             x _At: 247  Put: ().
             x _At: 248  Put: ().
             x _At: 249  Put: ().
             x _At: 250  Put: ().
             x _At: 251  Put: ().
             x _At: 252  Put: ().
             x _At: 253  Put: ().
             x _At: 254  Put: ().
             x _At: 255  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 205 Put: (
     bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> () From: ( |
         {} = 'ModuleInfo: Creator: traits cachedColormap nullPlatformColorVector 205.
'.
        | ) )

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 0 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 1 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 10 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 100 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 101 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 102 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 103 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 104 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 105 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 106 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 107 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 108 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 109 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 11 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 110 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 111 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 112 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 113 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 114 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 115 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 116 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 117 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 118 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 119 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 12 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 120 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 121 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 122 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 123 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 124 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 125 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 126 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 127 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 128 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 129 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 13 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 130 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 131 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 132 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 133 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 134 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 135 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 136 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 137 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 138 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 139 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 14 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 140 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 141 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 142 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 143 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 144 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 145 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 146 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 147 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 148 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 149 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 15 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 150 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 151 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 152 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 153 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 154 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 155 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 156 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 157 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 158 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 159 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 16 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 160 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 161 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 162 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 163 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 164 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 165 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 166 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 167 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 168 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 169 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 17 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 170 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 171 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 172 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 173 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 174 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 175 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 176 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 177 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 178 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 179 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 18 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 180 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 181 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 182 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 183 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 184 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 185 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 186 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 187 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 188 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 189 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 19 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 190 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 191 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 192 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 193 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 194 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 195 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 196 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 197 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 198 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 199 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 2 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 20 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 200 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 201 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 202 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 203 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 204 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot'
        
         delete = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot'
        
         isLive = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 206 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 207 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 208 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 209 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 21 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 210 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 211 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 212 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 213 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 214 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 215 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 216 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 217 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 218 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 219 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 22 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 220 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 221 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 222 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 223 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 224 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 225 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 226 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 227 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 228 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 229 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 23 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 230 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 231 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 232 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 233 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 234 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 235 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 236 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 237 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 238 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 239 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 24 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 240 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 241 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 242 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 243 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 244 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 245 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 246 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 247 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 248 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 249 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 25 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 250 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 251 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 252 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 253 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 254 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 255 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 26 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 27 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 28 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 29 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 3 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 30 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 31 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 32 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 33 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 34 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 35 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 36 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 37 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 38 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 39 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 4 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 40 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 41 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 42 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 43 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 44 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 45 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 46 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 47 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 48 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 49 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 5 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 50 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 51 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 52 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 53 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 54 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 55 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 56 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 57 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 58 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 59 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 6 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 60 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 61 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 62 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 63 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 64 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 65 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 66 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 67 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 68 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 69 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 7 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 70 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 71 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 72 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 73 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 74 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 75 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 76 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 77 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 78 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 79 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 8 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 80 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 81 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 82 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 83 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 84 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 85 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 86 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 87 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 88 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 89 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 9 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 90 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 91 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 92 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 93 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 94 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 95 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 96 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 97 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 98 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> () _At: 99 Put: (
     ((bootstrap stub -> 'traits' -> 'cachedColormap') \/-> 'nullPlatformColorVector') -> 205 -> ())

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedColormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         allocColor: xc = ( |
            | 
            xcm allocColor: xc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         at: i = ( | {
                 'ModuleInfo: Module: colormap InitialContents: FollowSlot'
                
                 col.
                }  {
                 'ModuleInfo: Module: colormap InitialContents: FollowSlot'
                
                 xc.
                } 
            | 
            xc: xlib xColor new allComponents.
            xc pixel: i.
            xcm queryOne: xc.
            col: ((rgbColor copy red: xc red   >> 8)
                               green: xc green >> 8)
                                blue: xc blue  >> 8.
            xc delete.
            col).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         at: i Put: color = ( | {
                 'ModuleInfo: Module: colormap InitialContents: FollowSlot'
                
                 xc.
                } 
            | 
            xc:  xlib xColor new allComponents.
            xc pixel: i.
            xc red:   color red   round asInteger << 8.
            xc green: color green round asInteger << 8.
            xc blue:  color blue  round asInteger << 8.
            xcm storeOne: xc.
            xc delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         colorsFromCache: cache = ( |
            | 
            xcm store: cache platformColors.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOn: win = ( |
            | 
            clone xcm: ui1GraphicsGlobals platformColormap createFor: win platformWindow Depth: 8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( | {
         'Category: destroying\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            xcm delete.
            invalidate.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         install = ( |
            | xcm install).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         installAndFixMultiprocessorColormapBugIfPreferencesSaySo = ( |
            | 
            preferences fixMultiprocessorColormapBugButSlowDownRemoteUI
                ifTrue: [ installImmediately ]
                 False: [ install ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         installImmediately = ( |
            | xcm installAndSync).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( | {
         'Category: destroying\x7fModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: public'
        
         invalidate = ( |
            | xcm: nullXCM).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> 'nullXCM' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot'
        
         delete = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: colormap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 



 '-- Side effects'

 globals modules colormap postFileIn
