 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: _\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         equalsFontSpec: x = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         scalableFont = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'scalableFont' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'scalableFont' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules scalableFont.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scalableFont' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scalableFont' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scalableFont' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         myComment <- 'Font support, including convenient naming of scalable font families.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scalableFont' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scalableFont' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Fonts\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         fontDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals fontDictionary.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontDictionary' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         fontStructs <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontDictionary' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         idMap <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontDictionary' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         maxFontSize <- 200.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Fonts\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         xFontDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xFontDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xFontDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontDictionary' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'xFontDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Fonts\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         fontFamily = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals fontFamily.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         aNoteAboutMacXFonts = ( |
            | 
            "MacX, an X server for the Macintosh, does not support the
             following font families in its default configuration:
                 avantgarde
                 bembo
                 bookman
                 gill
                 helveticaNarrow
                 palatino
                 rockwell
                 zapfChancery
                 zapfDingbats
             If your Mac has any of these fonts, you can make them available
             by extending the MacX font alias file; see the MacX manual for
             how to do this."

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         avantgarde = '-*-avantgarde-book-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         avantgardeBold = '-*-avantgarde-demi-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         avantgardeBoldItalic = '-*-avantgarde-demi-o-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         avantgardeItalic = '-*-avantgarde-book-o-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         bembo = '-*-bembo-medium-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         bemboBold = '-*-bembo-bold-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         bemboBoldItalic = '-*-bembo-bold-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         bemboItalic = '-*-bembo-medium-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         bookman = '-*-bookman-light-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         bookmanBold = '-*-bookman-demi-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         bookmanBoldItalic = '-*-bookman-demi-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         bookmanItalic = '-*-bookman-light-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         courier = '-*-courier-medium-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         courierBold = '-*-courier-bold-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         courierBoldItalic = '-*-courier-bold-o-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         courierItalic = '-*-courier-medium-o-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         gill = '-*-gill sans-medium-r-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         gillBold = '-*-gill sans-bold-r-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         gillBoldItalic = '-*-gill sans-bold-i-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         gillItalic = '-*-gill sans-medium-i-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         helvetica = '-*-helvetica-medium-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         helveticaBold = '-*-helvetica-bold-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         helveticaBoldItalic = '-*-helvetica-bold-o-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         helveticaItalic = '-*-helvetica-medium-o-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         helveticaNarrow = '-*-helvetica-medium-r-narrow-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         helveticaNarrowBold = '-*-helvetica-bold-r-narrow-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         helveticaNarrowBoldItalic = '-*-helvetica-bold-o-narrow-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         helveticaNarrowItalic = '-*-helvetica-medium-o-narrow-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'Category: font substituion\x7fModuleInfo: Module: scalableFont InitialContents: InitializeToExpression: (time current)\x7fVisibility: private'
        
         lastKvetchTime <- time current.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         lucida = '-*-lucida-medium-r-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         lucidaBold = '-*-lucida-bold-r-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         lucidaBoldItalic = '-*-lucida-bold-i-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         lucidaBright = '-*-lucidabright-medium-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         lucidaBrightBold = '-*-lucidabright-demibold-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         lucidaBrightBoldItalic = '-*-lucidabright-demibold-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         lucidaBrightItalic = '-*-lucidabright-medium-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         lucidaItalic = '-*-lucida-medium-i-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         lucidaTypewriter = '-*-lucidatypewriter-medium-r-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         lucidaTypewriterBold = '-*-lucidatypewriter-bold-r-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         lucidaTypewriterBoldItalic = ( |
            | lucidaTypewriterBold).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         lucidaTypewriterItalic = ( |
            | lucidaTypewriter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         newCenturySchoolbook = '-*-new century schoolbook-medium-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         newCenturySchoolbookBold = '-*-new century schoolbook-bold-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         newCenturySchoolbookBoldItalic = '-*-new century schoolbook-bold-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         newCenturySchoolbookItalic = '-*-new century schoolbook-medium-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         palatino = '-*-palatino-medium-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         palatinoBold = '-*-palatino-bold-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         palatinoBoldItalic = '-*-palatino-bold-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         palatinoItalic = '-*-palatino-medium-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'Category: password pseudo-font\x7fComment: I am used for password fields--
I print out as asterisks.\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         password = '-*-password-medium-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'Category: password pseudo-font\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         passwordBold = ( |
            | password).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'Category: password pseudo-font\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         passwordBoldItalic = ( |
            | password).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'Category: password pseudo-font\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         passwordItalic = ( |
            | password).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         rockwell = '-*-rockwell-medium-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         rockwellBold = '-*-rockwell-bold-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         rockwellBoldItalic = '-*-rockwell-bold-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         rockwellItalic = '-*-rockwell-medium-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         symbol = '-*-symbol-medium-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         symbolBold = ( |
            | symbol).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         symbolBoldItalic = ( |
            | symbol).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         symbolItalic = ( |
            | symbol).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         times = '-*-times-medium-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         timesBold = '-*-times-bold-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         timesBoldItalic = '-*-times-bold-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         timesItalic = '-*-times-medium-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'Category: font substituion\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         undefinedSelector: sel Type: t Delegatee: d MethodHolder: mh Arguments: args = ( |
             now.
            | 
            args size = 0  ifFalse: [
              error: 'font messages have no arguments'
            ].
            "too much kvetching"
            now: time current.
            (now - lastKvetchTime ) > (1000 * 60 * 5)  ifTrue: [
              lastKvetchTime: now.
              ('unknown font: ', sel) printLine.
            ].
            times).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         urwAvantGarde = '-*-itc avant garde-medium-r-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         urwAvantGardeBold = '-*-itc avant garde-demi-r-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         urwAvantGardeBoldItalic = '-*-itc avant garde-demi-o-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         urwAvantGardeItalic = '-*-itc avant garde-medium-o-normal-sans-'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         zapfChancery = '-*-zapfchancery-medium-i-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         zapfChanceryBold = ( |
            | zapfChancery).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         zapfChanceryBoldItalic = ( |
            | zapfChancery).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         zapfChanceryItalic = ( |
            | zapfChancery).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         zapfDingbats = '-*-zapfdingbats-medium-r-normal--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         zapfDingbatsBold = ( |
            | zapfDingbats).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         zapfDingbatsBoldItalic = ( |
            | zapfDingbats).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         zapfDingbatsItalic = ( |
            | zapfDingbats).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Fonts\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         scalableFont = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'scalableFont' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals scalableFont.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'scalableFont' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         fontNames = ( |
             names.
            | 
            "Return a sorted list of known font family names."
            names: list copyRemoveAll.
            (reflect: x11Globals fontFamily) do: [| :slot. :name | names add: name ].
            names remove: 'parent'.
            names remove: 'aNoteAboutMacXFonts'.
            names asVector sort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'scalableFont' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontFamily' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Fonts\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         abstractFontDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractFontDictionary' -> () From: ( |
             {} = 'Comment: A fontDictionary keeps track of X font ID\'s and font stuctures
     for a given X display. Currently, it retains the font
     structures for every font size requested in a given font
     family. It would be more space efficient to retain only
     one font structure per family, since other sizes information
     can be computed by simple linear scaling.\x7fModuleInfo: Creator: traits abstractFontDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFontDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFontDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFontDictionary' -> () From: ( | {
         'Category: seemingly unused\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: private'
        
         deleteAll = ( |
            | 
            idMap do: [| :ids |
                ids do: [| :id |
                    notAllocated = id ifFalse: [ id delete ].
                 ].
            ].
            fontStructs do: [| :xfont | xfont delete ].
            idMap removeAll.
            fontStructs removeAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFontDictionary' -> () From: ( | {
         'Category: lookups\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         idForFontSpec: fSpec WindowCanvas: wc = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFontDictionary' -> () From: ( | {
         'Category: lookups\x7fCategory: constants (ugh)\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: private'
        
         notAllocated = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFontDictionary' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFontDictionary' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFontDictionary' -> () From: ( | {
         'Category: lookups\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         structForFontSpec: fSpec WindowCanvas: wc = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Fonts\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot'
        
         macFontDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macFontDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macFontDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macFontDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             new.
            | 
            new: clone.
            new fonts: fonts copy.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macFontDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
             new.
            | 
            new: clone.
            new fonts: fonts copyRemoveAll.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macFontDictionary' -> () From: ( | {
         'Category: lookups\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: private'
        
         idAndFontFor: fSpec WindowCanvas: wc = ( |
            | 
            fonts if: fSpec IsPresentDo: [|:v| v]
                            IfAbsentPut: [ macToolbox fontIDAndStruct 
                                               copyForFontSpec: fSpec Port: wc gc ]
                                  AndDo: [|:v| v]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macFontDictionary' -> () From: ( | {
         'Category: lookups\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         idForFontSpec: fSpec WindowCanvas: wc = ( |
            | 
            "on mac, one struct does both"
            idAndFontFor: fSpec WindowCanvas: wc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macFontDictionary' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractFontDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macFontDictionary' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            fonts size printString, ' entries').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macFontDictionary' -> () From: ( | {
         'Category: lookups\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         structForFontSpec: fSpec WindowCanvas: wc = ( |
            | 
            "on mac, one struct does both"
            idAndFontFor: fSpec WindowCanvas: wc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xFontDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             new.
            | 
            new: clone.
            new idMap: idMap copy.
            new fontStructs: fontStructs copy.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xFontDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
             new.
            | 
            new: clone.
            new idMap: idMap copyRemoveAll.
            new fontStructs: fontStructs copyRemoveAll.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xFontDictionary' -> () From: ( | {
         'Category: lookups\x7fCategory: helpers\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: private'
        
         fullNameFor: familyName Size: pts = ( |
             fontSize.
            | 
            ('-' = familyName last) ifFalse: [
                "Note: if the font name does not end in '-', then assume it is a
                 non-scalable font, so its family name is its full name."
                ^ familyName.
            ].
            fontSize: (pts max: 2) min: maxFontSize.
            familyName, fontSize printString, '-*-*-*-*-*-*-*').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xFontDictionary' -> () From: ( | {
         'Category: lookups\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         idForFontSpec: fSpec WindowCanvas: wc = ( |
             fName.
             fontID.
             fontSize.
             ids.
            | 
            "idMap is a dictionary mapping font family names to vectors of
             of size maxFontSize+1. For a given fontID vector v, (v at: i)
             contains either the font ID for point size i, or the special
             value 'notAllocated', which indicates that the given point size
             has not yet been allocated."

            fName: xFontNameOf: fSpec.
            ids: idMap at: fName
                IfAbsent: [| v |
                    v: vector copySize: maxFontSize succ FillingWith: notAllocated.
                    idMap at: fName Put: v.
                    v ].
            ('-' = fName last) ifTrue: [
                fontSize: (fSpec size max: 2) min: maxFontSize.
            ] False: [
                "Note: if the font name does not end in '-', then assume it is a
                 non-scalable font. Store its font id at index 0."
                fontSize: 0.
            ].
            fontID: ids at: fontSize.
            notAllocated = fontID ifTrue: [| fontStruct |
                fontStruct: (structForFontSpec: (fSpec copySize: fontSize) WindowCanvas: wc).
                fontID: fontStruct fid.
                ids at: fontSize Put: fontID.
            ].
            fontID).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xFontDictionary' -> () From: ( | {
         'ModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractFontDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xFontDictionary' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | idMap size printString, ' entries').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xFontDictionary' -> () From: ( | {
         'Category: lookups\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: public'
        
         structForFontSpec: fSpec WindowCanvas: wc = ( |
             xFontName.
            | 
            "Details: If a font with the given name cannot be found, we substitute
             times (non-bold, non-italic) for the font. Someday this over-simplistic
             font substitution policy should be improved. For now, it lets you keep
             running if on a non-Sun X server. It is assumed that the times font is
             ubiquitous. Nothing is done about size substitution. While many X
             servers support font scaling, if you happen to have one that doesn't
             and you ask for a size that it doesn't have, you are out of luck."

            xFontName: xFontNameOf: fSpec.
            fontStructs at: fSpec IfAbsent: [| fullName. fontStruct |
                fullName: (fullNameFor: xFontName Size: fSpec size).
                fontStruct: 
                    wc display loadFont: fullName 
                              IfFail: [| substituteName |
                                  substituteName: (fullNameFor: x11Globals scalableFont times Size: fSpec size).
                                  [
                                    ('Substituting font ', substituteName,
                                   ' for font ', fullName) printLine.
                                  ]. "too much kvetching"
                                  wc display loadFont: substituteName IfFail: [
                                      error: 'could not load substitute font: ', substituteName.
                                     ^nil
                              ].
                    ].
                fontStructs at: fSpec Put: fontStruct.
                fontStruct
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xFontDictionary' -> () From: ( | {
         'Category: lookups\x7fCategory: helpers\x7fModuleInfo: Module: scalableFont InitialContents: FollowSlot\x7fVisibility: private'
        
         xFontNameOf: aFontSpec = ( |
            | 
            aFontSpec name first isDigit 
                ifTrue: [aFontSpec name] "for 6x13"
                 False: [ (aFontSpec name,  aFontSpec style capitalize)
                              sendTo: x11Globals scalableFont]).
        } | ) 



 '-- Side effects'

 globals modules scalableFont postFileIn
