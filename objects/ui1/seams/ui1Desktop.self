 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1Desktop InitialContents: FollowSlot'

         ui1Desktop = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Desktop' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Desktop' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1Desktop.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Desktop' -> () From: ( | {
         'ModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Desktop' -> () From: ( | {
         'ModuleInfo: Module: ui1Desktop InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Desktop' -> () From: ( | {
         'ModuleInfo: Module: ui1Desktop InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: slots David Ungar added to self64\'s desktop module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Desktop' -> () From: ( | {
         'ModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Desktop' -> () From: ( | {
         'ModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: True if some world already has a window on this display. Quartz is the token \'quartz\'; X is the name passed to open (reincarnationDisplayName). -- grok 08/29/26\x7fModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         isOpenOnDisplay: dName = ( |
             n.
            | 
            n: canonicalDisplayName: dName.
            worldsDo: [ | :w |
                w winCanvases do: [ | :wc |
                    (canonicalDisplayName: wc reincarnationDisplayName) = n ifTrue: [^ true]
                ]
            ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Map a display argument onto the name stored on window canvases. -- grok 08/29/26\x7fModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: private'
        
         canonicalDisplayName: dName = ( |
            | 
            ((dName = 'quartz') || [dName isEmpty && [host osName == 'macOSX']])
              ifTrue: ['quartz'] False: dName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Open an additional world, forcing the native Quartz backend. -- claude & dmu
5/2026\x7fModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         openNewWorldOnQuartz = ( |
            | openNewWorldOnDisplay: 'quartz').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Open an additional world under X11 on xDisplayName (Self starts XQuartz if
needed). -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         openNewWorldOnX11 = ( |
            | openNewWorldOnDisplay: xDisplayName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Quartz world. Already open on Quartz: report. Open on another display: add a world. Error on non-macOS. -- grok 08/29/26\x7fModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         openOnQuartz = ( |
            | 
            host osName == 'macOSX' ifFalse: [
                error: 'Quartz is only available on macOS'
            ].
            openOnDisplay: 'quartz').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: X11 world on xDisplayName. Already open on that display: report. Open on another display: add a world. Self starts XQuartz if needed. Does not fall back to Quartz. -- grok 08/29/26\x7fModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         openOnX11 = ( |
            | openOnDisplay: xDisplayName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: First desktop open of this process: a morph inviting ui open. -- grok 08/29/26\x7fModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: private'
        
         dismissUI1Invitation = ( |
            | 
            ui1InvitationMorph ifNotNil: [
                ui1InvitationMorph delete.
                ui1InvitationMorph: nil
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Build the first-open invitation morph. Helvetica, same as outliners. -- grok 08/29/26\x7fModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: private'
        
         makeUI1InvitationMorph = ( |
             c.
             col.
             dismissB.
             f.
             fs.
             openB.
             row.
            | 
            c: (paint named: 'gray') copyBrightness: 0.85.
            fs: globals fontSpec copyName: 'helvetica' Size: 12.
            col: columnMorph copy beShrinkWrap color: c.
            col borderWidth: 8.
            col addMorphLast:
                labelMorph copyLabel: 'The original Self UI (ui1) now runs natively on Quartz.'
                           FontSpec: fs
                              Color: paint named: 'black'.
            col addMorphLast:
                labelMorph copyLabel: 'It was the first IDE to use cartoon animation.'
                           FontSpec: fs
                              Color: paint named: 'black'.
            col addMorphLast: spacerMorph copyV: 8 Color: c.

            openB: (ui2Button copy target: self)
                label: 'Open ui1' FontSpec: fs FontColor: paint named: 'black'.
            openB color: c.
            openB isAsynchronous: true.
            openB scriptBlock: [target openUI1FromInvitation].

            dismissB: (ui2Button copy target: self)
                label: 'Dismiss' FontSpec: fs FontColor: paint named: 'black'.
            dismissB color: c.
            dismissB scriptBlock: [target dismissUI1Invitation].

            row: rowMorph copy beShrinkWrap color: c.
            row borderWidth: 0.
            row addMorphLast: openB.
            row addMorphLast: spacerMorph copyH: 12 Color: c.
            row addMorphLast: dismissB.
            col addMorphLast: row.

            f: frameMorph copy color: c.
            f beShrinkWrap borderWidth: 3.
            f frameStyle: f insetBezelStyle.
            f addMorph: col.
            f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Once per process, after addInitialMorphs. Tests set suppressUI1Invitation. -- grok 08/29/26\x7fModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: private'
        
         offerUI1InvitationIfAppropriate = ( |
            | 
            suppressUI1Invitation ifTrue: [^ self].
            ui1InvitationShown ifTrue: [^ self].
            (snapshotAction commandLine includes: '-headless') ifTrue: [^ self].
            ((reflect: globals) includesKey: 'ui1') ifFalse: [^ self].
            ui1InvitationShown: true.
            ui1InvitationMorph: makeUI1InvitationMorph.
            ui1InvitationMorph position: 50@180.
            w addMorph: ui1InvitationMorph.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Invitation button: open ui1 without closing ui2. -- grok 08/29/26\x7fModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: private'
        
         openUI1FromInvitation = ( |
            | 
            dismissUI1Invitation.
            ui open.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: The X display to open by default: the live $DISPLAY, or \':0\' if unset or empty. -- claude & grok & dmu 5/26, 8/26\x7fModuleInfo: Module: ui1Desktop InitialContents: FollowSlot\x7fVisibility: public'
        
         xDisplayName = ( |
             n.
            | 
            n: os environmentAt: 'DISPLAY' IfFail: ':0'.
            n isEmpty ifTrue: [':0'] False: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: state\x7fComment: True once the X11-unavailable (see readme) notice has been shown this session.
-- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Desktop InitialContents: InitializeToExpression: (false)'
        
         xFallbackNoticeShown <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: The live invitation morph, or nil. -- grok 08/29/26\x7fModuleInfo: Module: ui1Desktop InitialContents: InitializeToExpression: (nil)'
        
         ui1InvitationMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: True after the invitation has been offered this process. -- grok 08/29/26\x7fModuleInfo: Module: ui1Desktop InitialContents: InitializeToExpression: (false)'
        
         ui1InvitationShown <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'desktop' -> () From: ( | {
         'Category: opening and closing\x7fComment: Tests set this so desktop open does not drop the ui1 invitation morph. -- grok 08/29/26\x7fModuleInfo: Module: ui1Desktop InitialContents: InitializeToExpression: (false)'
        
         suppressUI1Invitation <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 



 '-- Side effects'

 globals modules ui1Desktop postFileIn
