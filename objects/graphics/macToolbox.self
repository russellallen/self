 '$Revision: 30.13 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fComment: Macintosh toolbox prototypes\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         macToolbox = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: cursors\x7fComment: animated cursor\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         aCur = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'aCur' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'aCur' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox aCur.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: cursors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         aCur = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'aCur' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox aCur.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'aCur' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'aCur' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: bitmaps\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         bitMap = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'bitMap' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'bitMap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox bitMap.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: bitmaps\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         bitMap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'bitMap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox bitMap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'bitMap' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'bitMap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: bitmaps\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         bits16 = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'bits16' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'bits16' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox bits16.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: bitmaps\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         bits16 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'bits16' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox bits16.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'bits16' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'bits16' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: cursors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         cCrsr = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'cCrsr' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'cCrsr' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox cCrsr.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: cursors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         cCrsr = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'cCrsr' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox cCrsr.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'cCrsr' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'cCrsr' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         colorSpec = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'colorSpec' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'colorSpec' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox colorSpec.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         colorSpec = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'colorSpec' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox colorSpec.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'colorSpec' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'colorSpec' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         colorTable = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'colorTable' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'colorTable' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox colorTable.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         colorTable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'colorTable' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox colorTable.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'colorTable' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'colorTable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'colorTable' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         window.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: pictures\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         commentSpec = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'commentSpec' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'commentSpec' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox commentSpec.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: pictures\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         commentSpec = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'commentSpec' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox commentSpec.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'commentSpec' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'commentSpec' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: cursors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'cursor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'cursor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox cursor.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: cursors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'cursor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox cursor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'cursor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         drawable = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'drawable' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractDrawable deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'drawable' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox drawable.

CopyDowns:
globals abstractDrawable. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         drawable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox drawable.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fMetricRec = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fMetricRec' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fMetricRec' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox fMetricRec.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fMetricRec = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fMetricRec' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox fMetricRec.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fMetricRec' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'fMetricRec' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: fonts\x7fComment: I take the place of both the X font ID object
(used to draw)
and the X font struct object (used to measure text).\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fontIDAndStruct = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox fontIDAndStruct.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'Category: font measurements\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (0)'
        
         ascent <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'Category: font measurements\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (0)'
        
         descent <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'Category: mac values\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (0)'
        
         face <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'Category: mac values\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (0)'
        
         id <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'Category: font measurements\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (0)'
        
         leading <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'Category: mac values\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (0)'
        
         mode <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: fonts\x7fComment: I take the place of both the X font ID object
(used to draw)
and the X font struct object (used to measure text).\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fontIDAndStruct = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox fontIDAndStruct.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: graphics context\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         grafPtr = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafPtr' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafPtr' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox grafPtr.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'Category: needed for textWidth:\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (macToolbox grafPtr)'
        
         port <- bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafPtr' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'Category: mac values\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (10)'
        
         size <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'Category: font measurements\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (0)'
        
         widMax <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fontInfo = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontInfo' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox fontInfo.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fontInfo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox fontInfo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontInfo' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontInfo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fontSpec = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontSpec' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontSpec' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox fontSpec.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fontSpec = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontSpec' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox fontSpec.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fontSpec' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontSpec' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: oddballs\x7fComment: Font manager methods.\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fonts = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fonts' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox fonts.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fonts' -> () From: ( | {
         'Category: better interface\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         isOutlineFontForNumerator: n Denominator: d = ( |
            | 
            isOutline_NumerH: n x NumerV: n y DenomH: d x DenomV: d y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fonts' -> () From: ( | {
         'Category: better interface\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         isOutlineFontForNumerator: n Denominator: d IfFail: fb = ( |
            | 
            isOutline_NumerH: n x NumerV: n y DenomH: d x DenomV: d y IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'fonts' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: screens\x7fComment: GDevice\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         gDevice = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'gDevice' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'gDevice' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox gDevice.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: screens\x7fComment: Actually GDevice\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         gDevice = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox gDevice.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         drawImageExtent: xtnt Depth: d Pixels: pixelData Colors: colors = ( |
             blues.
             greens.
             reds.
             s.
            | 
            s: colors size.
            reds: vector copySize: s.  greens: vector copySize: s.  blues: vector copySize: s.
            colors do: [|:c. :i| reds at: i Put: c macRed.  greens at: i Put: c macGreen.  blues at: i Put: c macBlue].
            settingPortDo: [
              drawImageWidth: xtnt x  Height: xtnt y  Depth: d
                      Pixels: pixelData
                        Reds: reds  Greens: greens  Blues: blues
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Comment: nil for offscreen, GDevice for onscreen.
Needed because traits canvas asks me to do things
that need the gdevice on mac. -- dmu 7/99\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (macToolbox gDevice)\x7fVisibility: private'
        
         gDevice <- bootstrap stub -> 'globals' -> 'macToolbox' -> 'gDevice' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         maskBitmapOrNil.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (0@0)\x7fVisibility: private'
        
         maskOffset <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         maskPixmapOrNil.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         maskRectOrNil.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: graphics context\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         grafPtr = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox grafPtr.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: graphics context\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         grafVars = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafVars' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafVars' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox grafVars.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: graphics context\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         grafVars = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafVars' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox grafVars.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafVars' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafVars' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         modes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox modes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         addMax = 37.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         addMin = 39.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         addOver = 34.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         addPin = 33.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         blend = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         grayishTextOr = 49.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         mask = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         notSrcBic = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         notSrcCopy = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         notSrcOr = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         notSrcXor = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         srcBic = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         srcCopy = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         srcOr = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         srcXor = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         subOver = 38.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         subPin = 35.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'modes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         transparent = 36.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: fonts\x7fComment: holds result of OutlineMetrics function\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         outlineFontMetrics = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'outlineFontMetrics' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox outlineFontMetrics.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'outlineFontMetrics' -> () From: ( | {
         'Category: set by outlineMetrics primitive\x7fComment: advance width measurments for each glyph\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         awArray <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'outlineFontMetrics' -> () From: ( | {
         'Category: set by outlineMetrics primitive\x7fComment: Advance bounding box measurments for each glyph.
(A vector of <left,top,right,bottom> tuples)\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         boundsArray <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'outlineFontMetrics' -> () From: ( | {
         'Category: set by outlineMetrics primitive\x7fComment: advance left side bearing measurments for each glyph\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         lsbArray <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         outlineFontMetrics = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'outlineFontMetrics' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox outlineFontMetrics.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'outlineFontMetrics' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'outlineFontMetrics' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'outlineFontMetrics' -> () From: ( | {
         'Category: set by outlineMetrics primitive\x7fComment: maximum y-value for the text\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (-1)\x7fVisibility: private'
        
         yMax <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'outlineFontMetrics' -> () From: ( | {
         'Category: set by outlineMetrics primitive\x7fComment: minimum y-value for the text\x7fModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (-1)\x7fVisibility: private'
        
         yMin <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: bitmaps\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         pattern = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'pattern' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'pattern' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox pattern.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: bitmaps\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         pattern = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pattern' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox pattern.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'pattern' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'pattern' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: strokes\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         penModes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox penModes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         adMax = 37.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         adMin = 39.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         addMax = 37.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         addOver = 34.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         addPin = 33.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         blend = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         ditherCopy = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         grayishTextOr = 49.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         hilite = 50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         hilitetransfermode = 50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         notPatBic = 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         notPatCopy = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         notPatOr = 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         notPatXor = 14.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         notSrcBic = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         notSrcCopy = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         notSrcOr = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         notSrcXor = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         patAnd = ( |
            | notSrcBic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         patBic = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         patCopy = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         patOr = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         patXor = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         srcBic = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         srcCopy = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         srcOr = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         srcXor = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         subOver = 38.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         subPin = 35.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penModes' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         transparent = 36.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: strokes\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         penState = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penState' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penState' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox penState.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: strokes\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         penState = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'penState' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox penState.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'penState' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'penState' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: pictures\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         pictInfo = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'pictInfo' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'pictInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox pictInfo.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: pictures\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         pictInfo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pictInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox pictInfo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'pictInfo' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'pictInfo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: pictures\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         picture = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'picture' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'picture' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox picture.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: bitmaps\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         picture = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'picture' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox picture.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'picture' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'picture' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: arcs\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         adjustRectangle: r Width: borderWidth = ( |
            | 
            r origin # (r corner + borderWidth)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: polygons\x7fComment: Maybe this one is better?\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         alternateDrawLines: ptlist GC: gc = ( |
            | 
            gc settingPortDo: [
              ptlist doFirst: [|:p| gc hidePen. lineToX: p x Y: p y.  gc showPen ]
                  MiddleLast: [|:p|             lineToX: p x Y: p y              ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         copyArea: rect To: dest At: pt GC: gcArg = ( |
             f.
             mr.
             r.
             t.
            | 
            f: rect asMacRect.
            t: (pt ## rect size) asMacRect.
            mr: dest gc isMasked ifTrue: [ macToolbox rect copyOrigin: pt - dest gc maskOffset
                                                                 Size: rect size ]
                                  False: [ macToolbox rect nullRect ].

            r: copyDeepMaskSrcBits:      gc  bitMapForCopyBits
                          MaskBits: dest gc  maskBitMap
                           DstPort: dest gc  Device: dest gc gDevice
                           SrcRect: f
                          MaskRect: mr
                           DstRect: t
                              Mode: macToolbox modes srcCopy
                        MaskRegion: macToolbox region nullMacToolboxRegion.
            f kill.
            t kill.
            dest gc isMasked ifTrue: [ mr kill ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         delete = ( |
            | [todo ui1 dmu experimental]. kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: arcs\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         drawArcWithin: rect From: startAngle Spanning: spanAngle GC: gc = ( |
            | 
            gc settingPortDo: [
              frameArcLeft: rect left
                       Top: rect top
                     Right: rect right
                    Bottom: rect bottom
                StartAngle: (mapUI2Angle: startAngle)
                  ArcAngle:  mapUI2SpanAngle: spanAngle
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: rectangles\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLine: pt1 To: pt2 GC: gc = ( |
            | 
            gc settingPortDo: [
              gc hidePen.
              lineToX: pt1 x Y: pt1 y.
              gc showPen.
              lineToX: pt2 x Y: pt2 y.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: polygons\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLines: ptlist GC: gc = ( |
            | 
            gc settingPortDo: [
              | poly |
              ptlist doFirst: [|:p| gc hidePen. lineToX: p x Y: p y.  gc showPen.  poly: macToolbox polygon openPoly ]
                  MiddleLast: [|:p|             lineToX: p x Y: p y           ].
              poly closePoly.
              poly framePoly.
              poly kill.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: misc.\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         drawPoint: pt GC: gc = ( |
            | 
            gc settingPortDo: [setCPixelX: pt x Y: pt y]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: rectangles\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         drawRectangle: rect GC: gc = ( |
            | 
            gc settingPortDo: [
              frameRectLeft: rect left Top: rect top Right: rect right Bottom: rect bottom
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: misc.\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         drawString: str At: pt GC: gc = ( |
            | 
            gc settingPortDo: [
              gc hidePen.
              lineToX: pt x Y: pt y.
              gc showPen.
              drawText: str.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: arcs\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fillArcWithin: rect From: startAngle Spanning: spanAngle GC: gc = ( |
            | 
            gc settingPortDo: [
              paintArcLeft: rect left
                       Top: rect top
                     Right: rect right
                    Bottom: rect bottom
                StartAngle: (mapUI2Angle: startAngle)
                  ArcAngle:  mapUI2SpanAngle: spanAngle
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: polygons\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygon: ptlist GC: gc = ( |
            | 
            gc settingPortDo: [
              | poly |
              ptlist doFirst: [|:p| gc hidePen. lineToX: p x Y: p y.  gc showPen.  poly: macToolbox polygon openPoly ]
                  MiddleLast: [|:p|             lineToX: p x Y: p y           ].
              poly closePoly.
              poly paintPoly.
              poly kill.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: polygons\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygonIntegerXs: xs Ys: ys GC: gc = ( |
            | 
            gc settingPortDo: [
              | poly. xv. yv |
              xv: xs asVector.  yv: ys asVector. "probably are vectors already"
              gc hidePen. 
              lineToX: xv first  Y:  yv first. 
              gc showPen.
              poly: macToolbox polygon openPoly.
              1 upTo: xv size Do: [|:i| lineToX: (xv at: i)  Y:  (yv at: i)
                                         IfFail: [|:e| ('overflow' isPrefixOf: e) 
                                                  ifTrue: [warning: 'fillPolygonIntegerXs:Ys:GC: overflow error'.
                                                           poly closePoly. poly kill.
                                                           ^ self ]
                                                   False: [error: e] ].
              ].
              poly closePoly.
              poly paintPoly.
              poly kill.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: rectangles\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRectangle: rect GC: gc = ( |
            | 
            gc settingPortDo: [
              paintRectLeft: rect left     Top: rect top 
                      Right: rect right Bottom: rect bottom
                     IfFail: [|:e| ('overflowError' isPrefixOf: e)
                              ifTrue: [warning: 'fillRectangle:GC: overflowed']
                               False: [error: e]
                             ]                          
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: arcs\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         mapUI2Angle: a = ( |
            | 
            "degrees ccw from right -> degrees cw from top"
            90 - a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: arcs\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         mapUI2SpanAngle: a = ( |
            | a negate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractDrawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fCategory: misc.\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         withAntialiasing: bool Do: blk = ( |
            | blk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: bitmaps\x7fComment: used like an off-screen window\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         pixMap = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'pixMap' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals macToolbox drawable deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'pixMap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox pixMap.

CopyDowns:
globals macToolbox drawable. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'pixMap' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (macToolbox grafPtr)'
        
         gWorld <- bootstrap stub -> 'globals' -> 'macToolbox' -> 'grafPtr' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: bitmaps\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         pixMap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pixMap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox pixMap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'pixMap' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'pixMap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: bitmaps\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         pixPat = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'pixPat' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'pixPat' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox pixPat.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: bitmaps\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         pixPat = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pixPat' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox pixPat.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'pixPat' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'pixPat' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: windows\x7fComment: The VM defines a class that encapsulates useful Mac Window behavior.\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         platformWindow = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'platformWindow' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'platformWindow' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox platformWindow.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: windows\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         platformWindow = bootstrap define: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () ToBe: bootstrap addSlotsTo: (
             globals macToolbox drawable deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox platformWindow.

CopyDowns:
globals macToolbox drawable. deadCopy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: tuples\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         point = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'point' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'point' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox point.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: tuples\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         point = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'point' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox point.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: tuples\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         polygon = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'polygon' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'polygon' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox polygon.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: tuples\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         polygon = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'polygon' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox polygon.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'polygon' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'polygon' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: oddballs\x7fComment: access to QDGlobals\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         qdGlobals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox qdGlobals.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         black = ( |
            | (nil = cachedBlack) || [cachedBlack isLive not]
              ifTrue: [ cachedBlack: macToolbox pattern new.  blackInto: cachedBlack. ].
            cachedBlack).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         cachedBlack <- bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> 'cachedBlack' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> 'cachedBlack' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox qdGlobals cachedBlack.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> 'cachedBlack' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'pattern' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         cachedDarkGray.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         cachedGray <- bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> 'cachedGray' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> 'cachedGray' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox qdGlobals cachedGray.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> 'cachedGray' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'pattern' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         cachedLightGray <- bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> 'cachedLightGray' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> 'cachedLightGray' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox qdGlobals cachedLightGray.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> 'cachedLightGray' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'pattern' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         cachedWhite.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         darkGray = ( |
            | (nil = cachedDarkGray) || [cachedDarkGray isLive not]
              ifTrue: [ cachedDarkGray: macToolbox pattern new.  darkGrayInto: cachedDarkGray. ].
            cachedDarkGray).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         gray = ( |
            | (nil = cachedGray) || [cachedGray isLive not]
              ifTrue: [ cachedGray: macToolbox pattern new.  grayInto: cachedGray. ].
            cachedGray).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         lightGray = ( |
            | (nil = cachedLightGray) || [cachedLightGray isLive not]
              ifTrue: [ cachedLightGray: macToolbox pattern new.  lightGrayInto: cachedLightGray. ].
            cachedLightGray).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'qdGlobals' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         white = ( |
            | (nil = cachedWhite) || [cachedWhite isLive not]
              ifTrue: [ cachedWhite: macToolbox pattern new.  whiteInto: cachedWhite. ].
            cachedWhite).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: tuples\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         rect = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'rect' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'rect' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox rect.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: tuples\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         rect = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'rect' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox rect.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'rect' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'rect' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: tuples\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         region = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'region' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'region' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox region.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: tuples\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         region = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'region' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox region.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'region' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'region' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         rgbColor = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'rgbColor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'rgbColor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox rgbColor.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         rgbColor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'rgbColor' -> () From: ( |
             {} = 'Comment: The mac primitives take 16-bit unsigned numbers\x7fModuleInfo: Creator: traits macToolbox rgbColor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'rgbColor' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'rgbColor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: windows\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         windowPtr = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'windowPtr' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'windowPtr' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox windowPtr.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( | {
         'Category: windows\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         windowPtr = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'windowPtr' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox windowPtr.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'windowPtr' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'windowPtr' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'gray' -> 'image' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'pattern' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         macToolbox = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'macToolbox' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'macToolbox' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules macToolbox.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macToolbox' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macToolbox' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macToolbox' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macToolbox' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macToolbox' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.13 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macToolbox' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'macToolboxEvts
macToolbox_wrappers'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nullImage' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'pattern' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         macToolbox = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'aCur' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'bitMap' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'bits16' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'cCrsr' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'colorSpec' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | basicDeleteIfFail: []. kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'colorSpec' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'colorTable' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         createFor: win = ( |
            | 
            createFor: win Depth: win depth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'colorTable' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         createFor: win Depth: d = ( |
            | 
            [todo ui1 dmu experimental].
            (new: 1 << d) window: win).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'colorTable' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | disposeCTableIfFail: []. kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'colorTable' -> () From: ( | {
         'Category: installing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         installAndSync = ( |
            | [todo ui1 dmu experimental]. install).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'colorTable' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'colorTable' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         store: colorSpecVec = ( |
            | 
            setFromColorSpecVector: colorSpecVec IfFail: [[todo ui1 dmu experimental]. ^ self].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'commentSpec' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fMetricRec' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFor: aFontIDAndStruct = ( |
            | 
            aFontIDAndStruct selectAndDo: [new fontMetrics]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fMetricRec' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         kill = ( |
            | delete. resend.kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fMetricRec' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForFontSpec: aFontSpec Port: aCGrafPort = ( |
             r.
            | 
            r: copy.
            r id: macToolbox fonts fmGetFontFamilyFromName: aFontSpec name  IfFail: [
                aFontSpec name first isDigit "e.g. 6x13" 
                    ifTrue: [ ^ copyForFontSpec: (aFontSpec copyName: 'courier') Port: aCGrafPort ].
                warning: 'could not get font id for font: ', aFontSpec name. 
                0 "system font"
            ].
            r size: aFontSpec size.
            r face: styles macStyleFrom: aFontSpec.
            r mode: macToolbox modes srcOr.
            r port: aCGrafPort.
            r initializeFontMeasurements.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | [todo ui1 dmu experimental]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         descender = ( |
            | [todo ui1 dmu experimental.]. descent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | [todo ui1 dmu experimental]. maxCharHeight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         heightOfString: s = ( |
            | [todo ui1 dmu experimental]. maxCharHeight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeFontMeasurements = ( |
             fm.
            | 
            fm: macToolbox fMetricRec copyFor: self.
            "UI2 seems to want integers, sigh"
             ascent: fm  ascent ceil asSmallInteger.
            descent: fm descent ceil asSmallInteger.
            leading: fm leading ceil asSmallInteger.
             widMax: fm  widMax ceil asSmallInteger.
            fm kill. "fm was allocated on C heap"
            "don't think we need width table (yet)"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         maxCharHeight = ( |
            | 
            ascent + descent + leading).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         selectAndDo: aBlock = ( |
            | 
            port withFont: self Do: aBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         sizeOfString: aString = ( |
            | [todo ui1 dmu experimental]. (textWidth: aString) @ maxCharHeight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'Comment: Mac font style constants\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         styles = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox fontIDAndStruct styles.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( | {
         'Category: raw mac styles\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         bold = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( | {
         'Category: styles in font spec\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         boldItalic = ( |
            | bold || italic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( | {
         'Category: raw mac styles\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         condense = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( | {
         'Category: raw mac styles\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         extend = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( | {
         'Category: raw mac styles\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         italic = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         macStyleFrom: aFontSpec = ( |
             s.
            | 
            s: aFontSpec style.
            s = ''  ifTrue: [^ normal ].
            s sendTo: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( | {
         'Category: raw mac styles\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         normal = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( | {
         'Category: raw mac styles\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         outline = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( | {
         'Category: styles in font spec\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         plain = ( |
            | normal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( | {
         'Category: raw mac styles\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         shadow = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( | {
         'Category: styles in font spec\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         undefinedSelector: sel Type: t Delegatee: d MethodHolder: mh Arguments: args = ( |
            | 
            warning: 'undefined style: ', sel.
            normal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> 'styles' -> () From: ( | {
         'Category: raw mac styles\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         underline = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         textWidth: aString = ( |
            | 
            selectAndDo: [
              "mac limit is 255"
              aString size <= 255 ifTrue: [
                macToolbox fonts stringWidth: aString
              ]
              False: [| r <- 0. i <- 0|
                [ | :exit. n |
                  n: aString size - i min: 255.
                  n <= 0 ifTrue: exit.
                  r: r + (macToolbox fonts stringWidth: 
                    aString copyFrom: i UpTo: i + n).
                  i: i + n.
                ] loopExit.
                r
              ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | [xxx]. widMax).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         widthOfString: s = ( |
            | [todo ui1 dmu experimental]. textWidth: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         xfont = ( |
            | [todo ui1 dmu experimental]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontInfo' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'fontSpec' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: constants\x7fCategory: gdTypes\x7fComment: colors mapped with a color lookup table\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         clutType = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         defaultColormapOfScreen = ( |
            | gdPMap pmTable).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         depth = ( |
            | gdPMap pixelSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: constants\x7fCategory: gdTypes\x7fComment: direct RGB colors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         directType = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: accessing screens\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         ensureBoundsOnScreen: bounds = ( |
            | 
            "hack because need GetDeviceList, GetMainDevice, GetNextDevice"
            ((0@0) ## (700@700) includes: bounds origin)
              ifTrue: [ bounds ]
               False: [ bounds translateTo: 30@30 ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: constants\x7fCategory: gdFlags (selected)\x7fComment: If this bit is 1, device must be used in 32-bit mode\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         ext32Device = ( |
            | 1 << 8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: mapping newlines for Mac paste buffer\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fetchFromClipboard = ( |
            | 
            fetchFromClipboardIfFail: 
             [|:e| ^error: 'fetchFromClipboard failed: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: mapping newlines for Mac paste buffer\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fetchFromClipboardIfFail: fb = ( |
            | 
            mapFromMac: unmappedFetchFromClipboardIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: constants\x7fCategory: gdTypes\x7fComment: color lookup table cannot be changed\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         fixedType = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         flush = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: constants\x7fCategory: gdFlags (selected)\x7fComment: bit 0 is 0 for b/w, 1 for color\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         gdDevType = ( |
            | 1 << 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: constants\x7fCategory: gdFlags (selected)\x7fComment: This bit indicates device is the main screen\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         mainScreen = ( |
            | 1 << 11).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: mapping newlines for Mac paste buffer\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         mapFromMac: str = ( |
            | 
            str asString copyMutable copyMappedBy: [|:c|
              c = '\r' ifTrue: '\n' False: c]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: mapping newlines for Mac paste buffer\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         mapToMac: str = ( |
            | 
            str copyMutable copyMappedBy: [|:c| 
              c = '\n' ifTrue: '\r' False: c
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: portable accessing\x7fComment: For X, is display name.
For Carbon, use empty string so OS X
works (e.g. open factory).\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         name = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         screen = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: constants\x7fCategory: gdFlags (selected)\x7fComment: Bit set iff is a screen\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         screenDevice = ( |
            | 1 << 13).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         serverName = 'this Mac'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: mapping newlines for Mac paste buffer\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         storeToClipboard: t0 = ( |
            | 
            storeToClipboard: t0 IfFail: 
             [|:e| ^error: 'storeToClipboard: failed: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'gDevice' -> () From: ( | {
         'Category: mapping newlines for Mac paste buffer\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         storeToClipboard: t0 IfFail: fb = ( |
            | 
            unmappedStoreToClipboard: (mapToMac: t0) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         background8Bit: cme = ( |
            | 
            [todo ui1 dmu experimental].
            settingPortDo: [bacground: cme color]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         background: aColor = ( |
            | 
            settingPordDo: [
              rgbBackColorRed: aColor macRed
                        Green: aColor macGreen
                         Blue: aColor macBlue
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: pen settings\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         dashedLineWidth: w = ( |
            | lineWidth: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: pen settings\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         dashes: dashByteVec Offset: os = ( |
            | 
            [qqq].
            unimplemented).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: stippling\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fillSolid = ( |
            | 
            settingPortDo: [
              penPat: macToolbox qdGlobals black.
              penMode: macToolbox penModes patCopy.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: stippling\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         fillStippled = ( |
            | 
            settingPortDo: [
              penMode: macToolbox penModes patOr
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         font: aFontIDAndStruct = ( |
            | 
            settingPortDo: [
              selectFont: aFontIDAndStruct.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         foreground8Bit: cme = ( |
            | 
            [todo ui1 dmu experimental].
            settingPortDo: [ foreground:  cme color ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         foreground: aColor = ( |
            | 
            settingPortDo: [
              rgbForeColorRed: aColor macRed
                        Green: aColor macGreen
                         Blue: aColor macBlue
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: modes\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         function: x = ( |
            | [todo ui1 dmu experimental]. penMode: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: coordinate transformations\x7fComment: Transform the given coordinates (x,y)
from being relative to the global 
(screen) coordinate system into being 
relative to the local (window) one.
\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         globalToLocal: pt = ( |
            | 
            globalToLocalX: pt x Y: pt y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: coordinate transformations\x7fComment: Transform the given coordinates (x,y)
from being relative to the global 
(screen) coordinate system into being 
relative to the local (window) one.
\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         globalToLocalX: x Y: y = ( |
             macPt.
             r.
            | 
            macPt: macToolbox point copyX: x Y: y.
            settingPortDo: [ macPt globalToLocal ].
            r: macPt h  @  macPt v.
            macPt kill.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: modes\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         gxAnd = ( |
            | 
             [todo ui1 dmu experimental].
            "pass to penMode:, see fillStippled"
            macToolbox penModes patAnd).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: modes\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         gxCopy = ( |
            | 
            [xxx]. macToolbox penModes srcCopy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: modes\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         gxOr = ( |
            | [xxx]. macToolbox penModes patOr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: masking\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         isMasked = ( |
            | nil != maskBitmapOrNil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         isOffScreen = ( |
            | [todo ui1 dmu experimental]. gDevice gdPMapIfFail: [^ true]. false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: pen settings\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         lineWidth = ( |
             p.
            | 
            p: pnSize.
            p h mean: p v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: pen settings\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         lineWidth: value = ( |
             v.
            | 
            "X uses 0 for hairline, I think"
            v: value max: 1.
            settingPortDo: [
              penWidth: v Height: v
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: coordinate transformations\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         localToGlobal: pt = ( |
            | localToGlobalX: pt x Y: pt y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: coordinate transformations\x7fComment: Transform the given coordinates (x,y)
from being relative to the global 
(screen) coordinate system into being 
relative to the local (window) one.
\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         localToGlobalX: x Y: y = ( |
             macPt.
             r.
            | 
            macPt: macToolbox point copyX: x Y: y.
            settingPortDo: [ macPt localToGlobal ].
            r: macPt h  @  macPt v.
            macPt kill.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: masking\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         maskBitMap = ( |
            | 
            isMasked
              ifTrue: [ maskBitmapOrNil ]
               False: [ macToolbox bitMap nullBitMap ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: masking\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         maskPixMap = ( |
            | 
            isMasked
              ifTrue: [ maskPixmapOrNil ]
               False: [ macToolbox pixMap nullPixMap ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: masking\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         portRect = ( |
             r.
             rr.
            | 
            r: macToolbox rect new.
            portRectInto: r.
            rr: r asRectangle.
            r delete.
            rr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         selectFont: aFontIDAndStruct = ( |
            | 
            "gc must already be selected port"
            textFont:  aFontIDAndStruct id.
            textFace:  aFontIDAndStruct face.
            textMode:  aFontIDAndStruct mode.
            textSize:  aFontIDAndStruct size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: masking\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         setClipMask: aPixMap Origin: pt = ( |
            | 
            maskBitmapOrNil: aPixMap gWorld bitMapForCopyBits.
            maskOffset: pt.
            maskRectOrNil:  macToolbox rect copyOrigin: pt
                                                  Size: aPixMap gc portRect size.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         setClipRectangle: rect = ( |
            | 
            settingPortDo: [
              clipRectLeft: rect left      Top: rect top 
                     Right: rect right  Bottom: rect bottom.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: masking\x7fComment: This routine is also used to unset the clip rectangle.\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         setNoClipMask = ( |
             shortMax = (32767)@(32767).
            | 
            "decrease portRect to avoid overwriting scroll bars"
            setClipRectangle: (0 @ 0) # shortMax.
            maskBitmapOrNil: nil.
            nil = maskRectOrNil ifFalse: [ 
                maskRectOrNil kill.
                maskRectOrNil: nil.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         settingPortDo: aBlock = ( |
             d.
             p.
             r.
            | 
            scheduler blockSignals: [
              p: getGWorldPort.
              d: getGWorldDevice.
              setGWorld: gDevice.
              r: aBlock value.
              p setGWorld: d.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: stippling\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         stipple: aPattern = ( |
            | 
            settingPortDo: [ penPat: aPattern ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         withClip: r Do: blk = ( |
            | 
            setClipRectangle: r.
            blk onReturn: [setNoClipMask]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafPtr' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         withFont: aFontIDAndStruct Do: b = ( |
            | 
            settingPortDo: [
              selectFont: aFontIDAndStruct.
              b value
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'grafVars' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'outlineFontMetrics' -> () From: ( | {
         'Category: getting metrics\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForText: aString Numerator: nPoint Denominator: dPoint = ( |
            | 
            copy outlineMetricsForText: aString NumerH: nPoint x NumerV: nPoint y
                                                DenomH: dPoint x DenomV: dPoint y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'outlineFontMetrics' -> () From: ( | {
         'Category: getting metrics\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForText: aString Numerator: nPoint Denominator: dPoint IfFail: fb = ( |
            | 
            copy outlineMetricsForText: aString NumerH: nPoint x NumerV: nPoint y
                                                DenomH: dPoint x DenomV: dPoint y
                                                IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'outlineFontMetrics' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pattern' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pattern' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         pixMap = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'penState' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pictInfo' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'picture' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pixMap' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         createForSameScreenAs: aPlatformWindow Size: aPoint Depth: d = ( |
             aScreen.
             dIfDifferent.
             gw.
             r.
            | 
            aScreen: aPlatformWindow screen.
            dIfDifferent: d = aScreen depth ifTrue: 0 "do not create a screen record" False: [d].
            gw:  macToolbox grafPtr newGWorldDepth: dIfDifferent
                                          BoundsLeft: 0 Top: 0 Right: aPoint x Bottom: aPoint y
                                              CTable: macToolbox colorTable nullColorTable
                                            AGDevice: aScreen
                                               Flags: 0.
            gw gDevice: macToolbox gDevice nullGDevice. "need null device for setGWorld"
            "get pixmap from new world, and set its world pointer"
            gw portPixMap gWorld: gw).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pixMap' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         depth = ( |
            | [todo ui1 dmu experimental]. pixelSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pixMap' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         gc = ( |
            | 
            gWorld).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pixMap' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         kill = ( |
            | gc disposeGWorldIfFail: []. resend.kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pixMap' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'drawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pixMap' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | 
            [todo ui1 dmu experimental].
            (boundsIfFail: [^ 0 @ 0]) size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'pixPat' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         catchEvents = ( |
            | 
            quartz event catchEventsForPlatformWindow: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            basicCloseIfFail: [].
            kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         depth = ( |
            | 
            screen depth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         display = ( |
            | 
            "when window is closed, display flush gets sent"
            screenIfFail: [fauxDisplay]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         fauxDisplay = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> 'fauxDisplay' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macToolbox platformWindow fauxDisplay.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> 'fauxDisplay' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         flush = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> 'fauxDisplay' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         name = 'faux'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> 'fauxDisplay' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> 'fauxDisplay' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         serverName = 'faux'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         gc = ( |
            | 
            grafPtr gDevice: screen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         gcIfFail: fb = ( |
            | 
            (grafPtrIfFail: [|:e| ^ fb value: e])
               gDevice: screenIfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         globalToLocal: pt = ( |
            | 
            (gcIfFail: [^0@0]) globalToLocal: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         grafPtr = ( |
            | 
            grafPtrIfFail: [|:e| error: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         grafPtrIfFail: fb = ( |
            | 
            (macWindowIfFail: [|:e| ^ fb value: e])
              portIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         openDisplay: displayName BoundingBox: bbox WindowName: wn = ( |
             r.
            | 
            r: openDisplay: displayName
                      Left: bbox left
                       Top: bbox top
                     Width: bbox width
                    Height: bbox height
                  MinWidth: 16
                  MaxWidth: -1
                 MinHeight: 16
                 MaxHeight: -1
                WindowName: wn
                  IconName: wn
                  FontName: 'times'
                  FontSize: 10.
            gc setNoClipMask.
            catchEvents.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: window size & position based on outer frame pos & size\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         outerSize = ( |
            | 
            (width + insetLeft + insetRight)
            @
            (height + insetTop + insetBottom)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: window size & position based on outer frame pos & size\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         outerSize: pt = ( |
             b.
             pos.
             t.
            | 
            pos: position.
            setLeft: pos x
                Top: pos y
              Width: pt x 
             Height: pt y.
            gc setNoClipMask. "clip contents region"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: window size & position based on outer frame pos & size\x7fComment: The outer position\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         position = ( |
            | 
            (gcIfFail: [^ 0@0]) localToGlobal: (insetLeft@insetTop) negate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: window size & position based on outer frame pos & size\x7fComment: Sets the outer position\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         position: pt = ( |
             s.
            | 
            s: outerSize.
            setLeft: pt x
                Top: pt y
              Width: s x
             Height: s y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: window size & position based on outer frame pos & size\x7fComment: Returns the inner size\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         size = ( |
            | 
            width @ height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: window size & position based on outer frame pos & size\x7fComment: Sets the inner size, oy!\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         size: pt = ( |
            | 
            outerSize: pt + 
              ( (insetLeft + insetRight) @ (insetTop + insetBottom) )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: portable accessing\x7fComment: XXXX Added by EE 8/5/99
because traits worldMorph windowEvent
sends wc xWin ungrabPointer with a 
copy of this object as the xWin\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         ungrabPointer = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         unmappedPaintManager = ( |
            | 
            macToolboxGlobals unmappedPaintManager).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> () From: ( | {
         'Category: cursorOps\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         warpPointerTo: pt = ( |
             g.
            | 
            g: gc localToGlobalX: pt x Y: pt y.
            warpPointerToX: g x Y: g y.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         copyX: x Y: y = ( |
            | (new h: x) v: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         kill = ( |
            | delete. resend.kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'polygon' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         kill = ( |
            | killPoly. resend.kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'polygon' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'rect' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         asMacRect = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'rect' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         asRectangle = ( |
            | (left @ top) # (right @ bottom)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'rect' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOrigin: o Corner: c = ( |
            | 
            (((clone new left: o x)
                          top: o y)
                        right: c x)
                       bottom: c y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'rect' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOrigin: o Size: s = ( |
            | 
            (((clone new left: o x)
                          top: o y)
                        right: o x + s x)
                       bottom: o y + s y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'rect' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         kill = ( |
            | delete. resend.kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'rect' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'rect' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | 
            resend.printString,
            ( isLive ifTrue: [
              ' <', left printString,
              ' ', top printString, ' ', right printString, ' ',
              bottom printString, '>'
            ] False: '')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'rect' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | (right - left) @ (bottom - top)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'region' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         kill = ( |
            | disposeRgn. resend.kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'region' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'rgbColor' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         kill = ( |
            | delete. resend.kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'rgbColor' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'windowPtr' -> () From: ( | {
         'Category: packaging primitives\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         getWindowBounds: which = ( |
            | 
            getWindowBounds: which IfFail: [|:e| error: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'windowPtr' -> () From: ( | {
         'Category: packaging primitives\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         getWindowBounds: which IfFail: fb = ( |
             r.
             rr.
            | 
            r: macToolbox rect new.
            getWindowBounds: which Into: r IfFail: [|:e|
              r kill.
              ^ fb value: e
            ].
            rr: r asRectangle.
            r kill.
            rr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macToolbox' -> 'windowPtr' -> () From: ( | {
         'ModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fCategory: Macintosh\x7fComment: This and its friends assume that intRange is 1023.\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         macBlue = ( |
            | 
            "succ/pred ensures that 1023 maps to 16rffff"
            (rawBlue succ << 6) pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fCategory: Macintosh\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         macGreen = ( |
            | 
            "succ/pred ensures that 1023 maps to 16rffff"
            (rawGreen succ << 6) pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fCategory: Macintosh\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot'
        
         macRed = ( |
            | 
            "succ/pred ensures that 1023 maps to 16rffff"
            (rawRed succ << 6) pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: converting\x7fModuleInfo: Module: macToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         asMacRect = ( |
            | macToolbox rect copyOrigin: origin Corner: corner).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'macToolboxEvts' From: 'graphics'
 bootstrap read: 'macToolbox_wrappers' From: 'glue'



 '-- Side effects'

 globals modules macToolbox postFileIn
