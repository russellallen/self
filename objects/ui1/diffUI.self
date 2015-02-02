 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: ui1 interface\x7fModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: private'
        
         openView = ( | {
                 'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
                
                 str1.
                }  {
                 'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
                
                 str2.
                }  {
                 'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
                
                 te.
                } 
            | 
            te: diffViewer copyOn: ui world
                             Size: (700@150)
                               Do: [|:e| e name: 'Diff'].
            coll1 doFirst: [| :fs | str1: fs string             ]
               MiddleLast: [| :ss | str1: str1 & '\n' & ss string].
            te methodView setText: str1 flatString.
            te methodView hiliteLines: noMatches.
            coll2 doFirst: [| :fs | str2: fs string             ]
               MiddleLast: [| :ss | str2: str2 & '\n' & ss string].
            te methodView2 setText: str2 flatString.
            te methodView2 hiliteLines: inverseNoMatches.
            ui world addBodyOnTop: te.
            te location: 100@100.
            te constrainFullBodyToWorld.
            te swoopDown.       
            lobby).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: windowing\x7fModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: public'
        
         diffTextField = bootstrap define: bootstrap stub -> 'globals' -> 'diffTextField' -> () ToBe: bootstrap addSlotsTo: (
             globals textField copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'diffTextField' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals diffTextField.

CopyDowns:
globals textField. copy

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'diffTextField' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: private'
        
         hiliteLines <- bootstrap stub -> 'globals' -> 'set' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'diffTextField' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: public'
        
         lineSelection: lineno = ( |
            | 
            (hiliteLines includes: lineno)
              ifTrue: 0@maxSmallInt
               False: 0@0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: windowing\x7fModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: public'
        
         diffViewer = bootstrap define: bootstrap stub -> 'globals' -> 'diffViewer' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'methodView' From:
             bootstrap remove: 'name' From:
             bootstrap remove: 'parent' From:
             globals textEditor copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'diffViewer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals diffViewer.

CopyDowns:
globals textEditor. copy 
SlotsToOmit: methodView name parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'diffViewer' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: private'
        
         methodSlider2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'diffViewer' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: public'
        
         methodView <- bootstrap stub -> 'globals' -> 'diffTextField' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'diffViewer' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: public'
        
         methodView2 <- bootstrap stub -> 'globals' -> 'diffTextField' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'diffViewer' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'Diff Viewer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: windowing\x7fModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: public'
        
         diffViewer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'diffViewer' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits diffViewer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'diffViewer' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'diffViewer' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
        
         diffUI = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'diffUI' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'diffUI' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules diffUI.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'diffUI' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'diffUI' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'diffUI' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
        
         myComment <- '\'This modules adds a simple UI (in UI1) for comparing files to the diff algorithm.\''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'diffUI' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'diffUI' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'diffViewer' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
        
         contextChange: con = ( |
            | 
            con = methodSlider  ifTrue: [ methodView  scroll: con get_value. ^self].
            con = methodSlider2 ifTrue: [ methodView2 scroll: con get_value ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'diffViewer' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: public'
        
         init = ( | {
                 'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
                
                 h = 100.
                }  {
                 'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
                
                 slW = 13.
                }  {
                 'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
                
                 tW = 300.
                } 
            | 
            offsetFromBody: 0@0.

            cancelButton: (button copySize: 58@16) name: 'Dismiss'.
            cancelButton  command: (| 
                p* = traits clonable.
                textEditor.
                doIt: context = (textEditor display. context body banish).
                doIt: context Shift: shift = ( doIt: context ).
            |) copy textEditor: self.
            addContext: cancelButton At: (140@140) + boxFaceOffset.

            methodSlider: (slider copySize: slW @ h) name: 'slider1'.
            addContext: methodSlider At: (2@2) + boxFaceOffset + 
                                       (topMargin @ sideMargin).
            methodSlider value: 0.

            methodView: (methodView copySize: tW @ h) name: 'text1'.
            addContext: methodView At: (2@2) + boxFaceOffset
                                       + ((slW + 2)@0)
                                       + (topMargin @ sideMargin).
            methodView init.

            methodView2: (methodView2 copySize: tW @ h) name: 'text2'.
            addContext: methodView2 At: (2@2) + boxFaceOffset
                                        + ((slW + 2 + tW + 2)@0)
                                        + (topMargin @ sideMargin).
            methodView2 init.

            methodSlider2: (slider copySize: slW @ h) name: 'slider2'.
            addContext: methodSlider2 At: (2@2) + boxFaceOffset
                                          + ((slW + 2 + tW + tW)@0)
                                          + (topMargin @ sideMargin).
            methodSlider2 value: 0.

            resizeHandle: resizeButton copySize: 10@10.
            addContext: resizeHandle At: 10@10.
            resize: size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'diffViewer' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
        
         leavingTopNotify = ( |
            | 
            methodView draw.
            methodView2 draw.
            display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'diffViewer' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'textApplication' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'diffViewer' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
        
         resize: ext Reallocate: reallocate = ( | {
                 'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
                
                 line.
                }  {
                 'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
                
                 w = 10.
                }  {
                 'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
                
                 y.
                } 
            | 
            resend.resize: ext Reallocate: reallocate.
            methodView c adjust.
            methodView2 c adjust.

            methodView resize: (faceSize x half - (2 * sideMargin) - 18)@
                               (faceSize y - topMargin - 26).

            methodSlider resize: 13@(faceSize y - topMargin - 26) succ.

            methodView2 resize: (faceSize x half - (2 * sideMargin) - 18)@
                               (faceSize y - topMargin - 26).
            methodView2 offset: ((faceSize x half + sideMargin)@(topMargin + 3)) + boxFaceOffset.

            methodSlider2 resize: 13@(faceSize y - topMargin - 26) succ.
            methodSlider2 offset: ((size x - 20 - sideMargin)@(topMargin + 3)) + boxFaceOffset.

            line: size y - 20.
            y: size x - 16.
            resizeHandle offset: y@(size y - 13).

            y: y - cancelButton extent x - w.
            cancelButton offset: y@line.

            draw.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'diffViewer' -> () From: ( | {
         'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
        
         resproutOn: wrld = ( | {
                 'ModuleInfo: Module: diffUI InitialContents: FollowSlot'
                
                 e.
                } 
            | 
            e: resproutCopyOn: wrld.
            e location: location.
            e methodView addLinedTextToEnd: methodView contents.
            e methodView goto: methodView insertionPoint.
            e methodView2 addLinedTextToEnd: methodView2 contents.
            e methodView2 goto: methodView2 insertionPoint.
            wrld addBodyOnTop: e.
            e swoopDown.
            e).
        } | ) 



 '-- Side effects'

 globals modules diffUI postFileIn
