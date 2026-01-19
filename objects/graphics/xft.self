 '30.21.0'
 '
Copyright 1992-2026 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot'
        
         xft = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'xft' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'xft' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules xft.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xft' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xft' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xft' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot'
        
         myComment <- 'Client-side font rendering for X11'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xft' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xft' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: InitializeToExpression: (\'30.21.0\')\x7fVisibility: public'
        
         revision <- '30.21.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xft' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'xft_wrappers
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: public'
        
         xGlyphInfo = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xGlyphInfo' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xGlyphInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xGlyphInfo.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: public'
        
         xGlyphInfo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xGlyphInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xGlyphInfo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xGlyphInfo' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xGlyphInfo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: public'
        
         xRenderColor = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xRenderColor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xRenderColor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xRenderColor.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: public'
        
         xRenderColor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xRenderColor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xRenderColor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xRenderColor' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xRenderColor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: public'
        
         xftColor = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xftColor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xftColor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xftColor.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: public'
        
         xftColor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xftColor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xftColor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xftColor' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xftColor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: public'
        
         xftDraw = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xftDraw' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xftDraw' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xftDraw.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: public'
        
         xftDraw = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xftDraw' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xftDraw.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xftDraw' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xftDraw' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: public'
        
         xftFont = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xftFont' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xftFont' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xftFont.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: public'
        
         xftFont = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xftFont' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xftFont.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xftFont' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xftFont' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xGlyphInfo' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xRenderColor' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xftColor' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xftDraw' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xftFont' -> () From: ( | {
         'ModuleInfo: Module: xft InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 



 '-- Sub parts'

 bootstrap read: 'xft_wrappers' From: 'glue'



 '-- Side effects'

 globals modules xft postFileIn
