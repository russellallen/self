 '$Revision: 30.7 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Preferences (obsolete)\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         browseOutlinerPreferences = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'browseOutlinerPreferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals browseOutlinerPreferences.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         color <- paint copyRed: 0.878788 Green: 0.878788  Blue: 0.913001.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Preferences (obsolete)\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinerPreferences = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( |
             {} = 'Comment: Most of these only apply to non-pluggable outliners,
so don\'t be suprised if changing them makes to difference
to how the desktop looks. - rca Aug13\x7fModuleInfo: Creator: globals outlinerPreferences.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Preferences (obsolete)\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         categoryOutlinerPreferences = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'categoryOutlinerPreferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals categoryOutlinerPreferences.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | globals fontSpec copyName: 'verdana' Size: mediumFontSize Style: 'italic').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Preferences (obsolete)\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownSlotOutlinerPreferences = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals copyDownSlotOutlinerPreferences.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: InitializeToExpression: (paint copyRed: 0.86999 Green: 0.820137 Blue: 0.820137)'
        
         color <- paint copyRed: 0.86999 Green: 0.820137 Blue: 0.820137.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | resend.fontSpec copySize: largeFontSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         privateSlotStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> 'privateSlotStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals copyDownSlotOutlinerPreferences privateSlotStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> 'privateSlotStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | resend.fontSpec copyName: 'verdana' Style: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> 'privateSlotStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         publicSlotStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> 'publicSlotStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals copyDownSlotOutlinerPreferences publicSlotStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> 'publicSlotStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | resend.fontSpec copyName: 'verdana' Style: 'bold').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> 'publicSlotStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         undeclaredSlotStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> 'undeclaredSlotStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals copyDownSlotOutlinerPreferences undeclaredSlotStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> 'undeclaredSlotStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | 
            resend.fontSpec copyName: 'verdana' Size: mediumFontSize Style: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> 'undeclaredSlotStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'copyDownSlotOutlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Preferences (obsolete)\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         debuggerPreferences = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'debuggerPreferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals debuggerPreferences.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debuggerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         buttonStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'debuggerPreferences' -> 'buttonStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals debuggerPreferences buttonStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debuggerPreferences' -> 'buttonStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | resend.fontSpec copyName: 'verdana'  Style: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debuggerPreferences' -> 'buttonStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'debuggerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debuggerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: InitializeToExpression: (paint copyRed: 0.820137 Green: 0.86999 Blue: 0.820137)'
        
         color <- paint copyRed: 0.820137 Green: 0.86999 Blue: 0.820137.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debuggerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debuggerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         xDisplay = ( |
            | resend.preferences xDisplay).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Preferences (obsolete)\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleOutlinerPreferences = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleOutlinerPreferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleOutlinerPreferences.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: InitializeToExpression: (paint copyRed: 0.86999 Green: 0.820137 Blue: 0.820137)'
        
         color <- paint copyRed: 0.86999 Green: 0.820137 Blue: 0.820137.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         outlinerPreferences = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerPreferences' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerPreferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules outlinerPreferences.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Preferences (obsolete)\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         objectOutlinerPreferences = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'objectOutlinerPreferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals objectOutlinerPreferences.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | globals fontSpec copyName: 'verdana' Size: largeFontSize Style: 'bold').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         acceptButtonStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'acceptButtonStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals outlinerPreferences acceptButtonStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'acceptButtonStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         color <- paint copyRed: 0.518084 Green: 0.699902  Blue: 0.518084.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'acceptButtonStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         annotationInfoStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'annotationInfoStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals outlinerPreferences annotationInfoStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'annotationInfoStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | resend.fontSpec copySize: mediumFontSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'annotationInfoStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         cancelButtonStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'cancelButtonStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals outlinerPreferences cancelButtonStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'cancelButtonStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         color <- paint copyRed: 0.699902 Green: 0.40958  Blue: 0.518084.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'cancelButtonStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         color <- paint named: 'blue'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         commentButtonStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'commentButtonStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals outlinerPreferences commentButtonStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'commentButtonStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         commentButtonText = '\"...\"'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'commentButtonStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'verdana' Size: 8 Style: 'bold') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals outlinerPreferences commentButtonStyle fontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'commentButtonStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         commentStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'commentStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals outlinerPreferences commentStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'commentStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | 
            globals fontSpec copyName: 'verdana' Size: smallFontSize Style: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'commentStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         expandWhenSprouted <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'Comment: Flush cached menus and buttons after changing their
default font size or style.\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         flushMenuCaches = ( |
            | 
            morph basicSelfMenu:         ui2Menu buildBasicSelfMenu.
            morph basicMenuWhenSubmorph: ui2Menu buildBasicMenuWhenSubmorph.

            desktop worldsDo: [|:w| w backgroundMenu: nil].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: InitializeToExpression: (paint named: \'black\')'
        
         fontColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | largeFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         headerButtonFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'verdana' Size: 8 Style: 'bold') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals outlinerPreferences headerButtonFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         headerColor = ( |
            | paint copyRandom).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: InitializeToExpression: (14)'
        
         largeFontSize <- 14.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         largeFontSpec = ( |
            | 
            myFontSpec copySize: largeFontSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: InitializeToExpression: (12)'
        
         mediumFontSize <- 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         mediumFontSpec = ( |
            | 
            myFontSpec copySize: mediumFontSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         mergeAssignmentSlots <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: InitializeToExpression: (fontSpec copyName: \'verdana\' Size: 11 Style: \'\')'
        
         myFontSpec <- fontSpec copyName: 'verdana' Size: 11 Style: ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         setDemoFonts = ( |
            | 
            largeFontSize:  20.
            mediumFontSize: 18.
            smallFontSize:  16.
            tinyFontSize:   14.

            "Some big fixed fonts: 8x13, 8x13bold, 8x16, 9x15 9x15bold, 10x20, 12x24"
            ui2_textFiled fontSpec: globals fontSpec copyName: '10x20' Size: 20.

            flushMenuCaches.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         setGiantFonts = ( |
            | 
            largeFontSize:  28.
            mediumFontSize: 24.
            smallFontSize:  20.
            tinyFontSize:   18.

            "Some big fixed fonts: 8x13, 8x13bold, 8x16, 9x15 9x15bold, 10x20, 12x24"
            ui2_textField fontSpec: globals fontSpec copyName: '12x24' Size: 24.

            ui2Menu   defaultFontSpec: ui2Menu   defaultFontSpec copySize: 20.
            ui2Button defaultFontSpec: ui2Button defaultFontSpec copySize: 24.
            flushMenuCaches.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         setNormalFonts = ( |
            | 
            largeFontSize:  14.
            mediumFontSize: 12.
            smallFontSize:  10.
            tinyFontSize:    9.

            "Some small fixed fonts: 5x8, 6x9, 6x10, 6x12, 6x13, 6x13bold, 7x13, 7x13bold, 7x14"
            ui2_textField fontSpec: globals fontSpec copyName: '6x13' Size: 13.

            ui2Menu   defaultFontSpec: ui2Menu   defaultFontSpec copySize: 12.
            ui2Button defaultFontSpec: ui2Button defaultFontSpec copySize: 12.
            flushMenuCaches.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         showSlotContents <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'Comment: A style with much information surpressed, 
good for introducing language semantics, say.
--RBS\x7fModuleInfo: Module: outlinerPreferences InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         simpleOutliners <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: InitializeToExpression: (10)'
        
         smallFontSize <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         smallFontSpec = ( |
            | 
            myFontSpec copySize: smallFontSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: InitializeToExpression: (9)'
        
         tinyFontSize <- 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         tinyFontSpec = ( |
            | 
            myFontSpec copySize: tinyFontSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         outliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals preferences outliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         colorScheme = ( |
            | rawCurrentColorScheme).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         colorScheme: cs = ( |
            | 
            rawCurrentColorScheme: cs. 
            desktop worlds do: [|:w| w morphsDo: [|:m| 
              m isPluggableOutliner ifTrue: [m updateTheme]]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         colorSchemes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals preferences outliner colorSchemes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> () From: ( | {
         'Comment: Inherit your scheme from me\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         baseScheme = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals preferences outliner colorSchemes baseScheme.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         bodyColor = ( |
            | paint named: 'outlinerGray').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         borderColor = ( |
            | paint named: 'outlinerGray').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         copiedDownSlot = paint named: 'blue'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: body\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         copiedDownSlotBody = ( |
            | paint copyRed: 1 Green: 0.95 Blue: 0.95).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         float = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: tags\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         floatTag = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: titles\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         floatTitle = ( |
            | paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: body\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         generalLeafModel = ( |
            | bodyColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: border\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         generalLeafModelBorder = ( |
            | borderColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: body\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         generalModel = ( |
            | bodyColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: border\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         generalModelBorder = ( |
            | borderColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: menus\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         generalModelMenuColor = paint copyRed: 0.942326 Green: 0.904203  Blue: 0.815249.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: body\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         generalSliceModel = ( |
            | bodyColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: border\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         generalSliceModelBorder = ( |
            | borderColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         headerColorFor: obj = ( |
            | 
            ((reflect: obj) includesKey: 'mirror') ifTrue: [| m | 
                m: obj mirror.
                m isReflecteeFloat   ifTrue: [^ float].
                m isReflecteeInteger ifTrue: [^ integer].
                m isReflecteeString  ifTrue: [^ string].   
                m creatorPathIfPresent: [|:p| 
                    p first = 'traits' ifTrue: [^ traits].
                    p first = 'mixins' ifTrue: [^ mixins]]
                  IfAbsent: [ ^ unnamed ].
                ^ named]
               False: [ ^ unusual ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         integer = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: tags\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         integerTag = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: titles\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         integerTitle = ( |
            | paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         mixins = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: tags\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         mixinsTag = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: titles\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         mixinsTitle = ( |
            | paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: body\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         moduleHolderModel = ( |
            | bodyColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: border\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         moduleHolderModelBorder = ( |
            | borderColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: menus\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         moduleHolderModelMenuColor = paint copyRed: 0.942326 Green: 0.904203  Blue: 0.815249.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         named = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: tags\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         namedTag = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: titles\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         namedTitle = ( |
            | paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: body\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         normalSlotBody = ( |
            | bodyColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: body\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         selfCategoryModel = ( |
            | bodyColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: border\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         selfCategoryModelBorder = ( |
            | borderColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: body\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         selfObjectModel = ( |
            | bodyColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: border\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         selfObjectModelBorder = ( |
            | borderColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: body\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         selfProcessModel = ( |
            | bodyColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: border\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         selfProcessModelBorder = ( |
            | borderColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: border\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         selfSlotModelBorder = ( |
            | borderColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: titles\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         slotTitle = ( |
            | paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         string = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: tags\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         stringTag = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: titles\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         stringTitle = ( |
            | paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         tagColorFor: obj = ( |
            | 
            ((reflect: obj) includesKey: 'mirror') ifTrue: [| m |
                m: obj mirror.
                m isReflecteeFloat   ifTrue: [^ floatTag].
                m isReflecteeInteger ifTrue: [^ integerTag].
                m isReflecteeString  ifTrue: [^ stringTag].
                m creatorPathIfPresent: [|:p|
                    p first = 'traits' ifTrue: [^ traitsTag].
                    p first = 'mixins' ifTrue: [^ mixinsTag]]
                  IfAbsent: [ ^ unnamedTag ].
                ^ namedTag ]
               False: [ ^ unusualTag ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         titleColorFor: obj = ( |
            | 
            ((reflect: obj) includesKey: 'mirror') ifTrue: [| m | 
                m: obj mirror.
                m isReflecteeFloat   ifTrue: [^ floatTitle].
                m isReflecteeInteger ifTrue: [^ integerTitle].
                m isReflecteeString  ifTrue: [^ stringTitle].   
                m creatorPathIfPresent: [|:p| 
                    p first = 'traits' ifTrue: [^ traitsTitle].
                    p first = 'mixins' ifTrue: [^ mixinsTitle]]
                  IfAbsent: [ ^ unnamedTitle ].
                ^ namedTitle ]
               False: [ ^ unusualTitle ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         traits = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: tags\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         traitsTag = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: titles\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         traitsTitle = ( |
            | paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         unnamed = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: tags\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         unnamedTag = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: titles\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         unnamedTitle = ( |
            | paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         unusual = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: tags\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         unusualTag = paint named: 'outlinerGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> () From: ( | {
         'Category: titles\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         unusualTitle = ( |
            | paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         default46 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'default46' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals preferences outliner colorSchemes default46.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'default46' -> () From: ( | {
         'Category: body\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         copiedDownSlotBody = ( |
            | 
            paint copyRed: 0.8 Green: 0.8 Blue: 0.9).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'default46' -> () From: ( | {
         'Category: body\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         generalSliceModel = ( |
            | 
            unusual).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'default46' -> () From: ( | {
         'Category: tags\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         integerTag = paint named: 'azure'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'default46' -> () From: ( | {
         'Category: tags\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         mixinsTag = paint named: 'leaf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'default46' -> () From: ( | {
         'Category: body\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         moduleHolderModel = ( |
            | unusual).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'default46' -> () From: ( | {
         'Category: tags\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         namedTag = ( |
            | paint copyRed: 0.7 Green: 0.7 Blue: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'default46' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'default46' -> () From: ( | {
         'Category: tags\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         traitsTag = paint named: 'royal'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'default46' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         unusual = ( |
            | 
            paint copyRed: 0.6 Green: 0.8 Blue: 0.6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'default46' -> () From: ( | {
         'Category: tags\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         unusualTag = ( |
            | unusual).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         gray = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'gray' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals preferences outliner colorSchemes gray.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'gray' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         night = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals preferences outliner colorSchemes night.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         bodyColor = ( |
            | dark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         bold = ( |
            | paint copyRed: 0 Green: 1 Blue: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         borderColor = ( |
            | dull).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         copiedDownSlotBody = ( |
            | 
            paint copyRed: 0 Green: 0.4 Blue: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         dark = ( |
            | 
            paint copyRed: 0 Green: 0 Blue: 0.01).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         dull = ( |
            | 
            paint copyRed: 0 Green: 0.7 Blue: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         float = ( |
            | dark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: menus\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         generalModelMenuColor = paint copyRed: 0.942326 Green: 0.904203  Blue: 0.815249.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         integer = ( |
            | dark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         lit = ( |
            | 
            paint copyRed: 0 Green: 0.9 Blue: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         mixins = ( |
            | dark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: menus\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         moduleHolderModelMenuColor = paint copyRed: 0.942326 Green: 0.904203  Blue: 0.815249.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         named = ( |
            | dark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'baseScheme' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         string = ( |
            | dark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         tagColorFor: obj = ( |
            | 
            dark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         titleColorFor: obj = ( |
            | 
            lit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         traits = ( |
            | dark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         unnamed = ( |
            | dark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'night' -> () From: ( | {
         'Category: header\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         unusual = ( |
            | dark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: outlinerPreferences InitialContents: InitializeToExpression: (preferences outliner colorSchemes gray)'
        
         rawCurrentColorScheme <- bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> 'colorSchemes' -> 'gray' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Preferences (obsolete)\x7fModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot\x7fVisibility: public'
        
         slotOutlinerPreferences = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotOutlinerPreferences.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | resend.fontSpec copySize: largeFontSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         privateSlotStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> 'privateSlotStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotOutlinerPreferences privateSlotStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> 'privateSlotStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | resend.fontSpec copyName: 'verdana' Style: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> 'privateSlotStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         publicSlotStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> 'publicSlotStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotOutlinerPreferences publicSlotStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> 'publicSlotStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | resend.fontSpec copyName: 'verdana' Style: 'bold').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> 'publicSlotStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: InitializeToExpression: (true)'
        
         slotsBecomeObjectsWhenDropped <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         undeclaredSlotStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> 'undeclaredSlotStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotOutlinerPreferences undeclaredSlotStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> 'undeclaredSlotStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         fontSpec = ( |
            | 
            globals fontSpec copyName: 'verdana' Size: mediumFontSize Style: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> 'undeclaredSlotStyle' -> () From: ( | {
         'ModuleInfo: Module: outlinerPreferences InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> ().
        } | ) 



 '-- Side effects'

 globals modules outlinerPreferences postFileIn
