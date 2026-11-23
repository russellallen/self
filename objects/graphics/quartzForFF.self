 '$Revision: 30.1 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot'
        
         quartzForFF = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'quartzForFF' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'quartzForFF' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules quartzForFF.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzForFF' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzForFF' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzForFF' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzForFF' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzForFF' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.1 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzForFF' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'quartzFont
quartzFontFamily
'.
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fComment: Substitute for X11 lucidasans (ui1 boxFont). Indexed and direct both use Verdana (screen face). Direct draws ui1 text with AA off so Bold is not heavy. Helvetica Neue Light+AA was fuzzy vs old ui1. -- grok 08/26/26\x7fModuleInfo: Module: quartzForFF InitialContents: InitializeToExpression: (\'Verdana\')\x7fVisibility: public'
        
         lucidaSansFamily <- 'Verdana'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fComment: Appended to lucidaSansFamily for empty/roman style (undeclared slots). Empty means use the family name alone (Verdana). -- grok 08/26/26\x7fModuleInfo: Module: quartzForFF InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         lucidaSansRomanSuffix <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fComment: Appended to lucidaSansFamily for style bold (public slots). Verdana Bold, same as indexed. -- grok 08/26/26\x7fModuleInfo: Module: quartzForFF InitialContents: InitializeToExpression: (\'Bold\')\x7fVisibility: public'
        
         lucidaSansBoldSuffix <- 'Bold'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fModuleInfo: Module: quartzForFF InitialContents: FollowSlot\x7fVisibility: private'
        
         atsFontOrFontFamily = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz atsFontOrFontFamily.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         id <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz atsFontOrFontFamily parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot\x7fVisibility: public'
        
         copyID: id = ( |
            | copy id: id).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot\x7fVisibility: public'
        
         doAll: blk = ( |
            | 
            iteratorPrototype do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot\x7fVisibility: public'
        
         findFromName: n = ( |
             id.
            | 
            "heuristic"
            id: findIDFromName: n.
            id = 0  ifFalse: [^ copyID: id].
            doAll: [|:f. fn|
              fn: f name.
              (n isPrefixOf: fn)  &&  (n isSuffixOf: fn)
                ifTrue: [^ f]
            ].
            doAll: [|:f. fn|
              fn: f name.
              (n isPrefixOf: fn) ifTrue: [^ f]
            ].
            warning: 'could not find font: ', n.
            ^ findFromName: 'Times New Roman').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot\x7fVisibility: public'
        
         findFromName: n IfFail: fb = ( |
            | 
            copyID: (findIDFromName: n IfFail: [|:e| ^ fb value: e])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot'
        
         kATSOptionFlagsDefault = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | 
            (getNameID: id IfFail: '???') asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot'
        
         printAll = ( |
            | doAll: [|:f| f name printLine]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot\x7fVisibility: private'
        
         quartzNameForFontSpec: fs = ( | nm |
            nm: fs name.
            "X11 monospace font names dont exist on macOS; CTFontCreateWithName would silently substitute a PROPORTIONAL font, and the fixed-width text editor (caret/layout assume one cell width per char) then drifts -- e.g. the caret lands a half-char behind. Map the known X monospace families to a real macOS monospace so every glyph has the same advance. -- claude & dmu 5/26"
            ((nm = 'lucidasanstypewriter') || [nm = 'lucidatypewriter']
                                           || [nm = 'fixed'] || [nm = 'screen'] || [nm = 'monospace'])
              ifTrue: [^ 'Menlo', (fs style isEmpty ifTrue: '' False: [' ', fs style capitalize])].
            ((nm = 'lucidasans') || [nm = 'lucida'] || [nm = 'lucidabright'])
              ifTrue: [
                fs style isEmpty ifTrue: [
                  quartz lucidaSansRomanSuffix isEmpty
                    ifTrue: [^ quartz lucidaSansFamily]
                     False: [^ quartz lucidaSansFamily, ' ', quartz lucidaSansRomanSuffix]
                ].
                (fs style = 'bold') ifTrue: [
                    ^ quartz lucidaSansFamily, ' ', quartz lucidaSansBoldSuffix
                ].
                ^ quartz lucidaSansFamily, ' ', fs style capitalize
              ].
            (nm first isDigit "e.g. 6x13"
                    ifTrue: 'Courier' False: [nm capitalize]),
            (fs style isEmpty ifTrue: '' False: [' ', fs style capitalize])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontOrFontFamily' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartzForFF InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | name).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'quartzFont' From: 'graphics'
 bootstrap read: 'quartzFontFamily' From: 'graphics'



 '-- Side effects'

 globals modules quartzForFF postFileIn
