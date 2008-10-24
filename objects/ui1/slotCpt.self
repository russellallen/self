 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         slotCpt = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'slotCpt' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'slotCpt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules slotCpt.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         slotCpt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotCpt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotCpt.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         body <- bootstrap stub -> 'globals' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         contents <- bootstrap stub -> 'globals' -> 'slotContentsCpt' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         first <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         isAssignable <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         isFakeSlot <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         last <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         location <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- bootstrap stub -> 'globals' -> 'slotNameCpt' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         slotCpt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotCpt.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotCpt' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotCpt' -> () From: ( | {
         'Comment: keep in order to do updating\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         slotAnno <- bootstrap stub -> 'globals' -> 'slotAnnotation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         slotInfo <- bootstrap stub -> 'globals' -> 'slots' -> 'plain' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         = sb = ( |
            | (name = sb name) && [contents = sb contents]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         assignmentName = ( |
            | 
            preferences mergeAssignmentSlots && [isAssignable] 
                ifTrue: [ basicName, ':' ]
                 False: [ error: 'not a merged assignment slot' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         assignmentSlotInfo = ( |
            | slotInfo holder at: assignmentName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         basicName = ( |
            | slotInfo key).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: changing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         changeContentsTo: newMir IfFail: fb = ( | {
                 'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
                
                 mir.
                } 
            | 
            mir: body objMirror.
            mir at: basicName PutContents: newMir
                IfFail: [ | :e |
                                    warning: 'Could not change contents of ',
                                          'this slot to the selected object: ',
                                          e.
                                    ^ fb value ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: containing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         componentsDo: block = ( |
            | 
            block value: name.
            block value: contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: containing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         container = ( |
            | body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         containsSelf = ( |
            | contents containsSelf).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsBound = ( |
            | contents bound translateBy: contents location).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsMinSize = ( |
            | contents minSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         contentsMirror = ( |
            | contents contentsMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         create: si On: bdy Fake: fake = ( |
            | 
            slotInfo: si.
            slotAnno: si annotation.
            body: bdy.
            "store the current state of isAssignable so that we
             can compare it to its new state when we check whether
             this slot needs to be updated"
            isAssignable: slotInfo isAssignable.
            name: name copy create: nameText On: self.
            contents: contents copy create: slotInfo value On: self.
            isFakeSlot: fake.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         desprout = ( |
            | contents desprout).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | 
            drawVSeparator.
            drawHSeparators.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBottomContentsLine = ( |
            | 
            drawBodyLightLine: (contentsBound bottomLeft addY: 1)
                           To: bound bottomRight addY: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBottomLine = ( |
            | drawBottomSlotNameLine. drawBottomContentsLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBottomSlotNameLine = ( |
            | 
            drawBodyEtchedLine: (bound bottomLeft addY: 1)
                            To: contentsBound bottomLeft addY: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         drawHSeparators = ( |
            | 
            componentsDo: [ | :b | b draw ].
            first ifTrue: [ drawTopLine ]
                   False: [ drawMiddleLine ].
            last  ifTrue: [ drawBottomLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         drawMiddleContentsLine = ( |
            | 
            drawBodyRaisedLine: contentsBound topLeft To: bound topRight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         drawMiddleLine = ( |
            | drawMiddleSlotNameLine. drawMiddleContentsLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         drawMiddleSlotNameLine = ( |
            | drawTopSlotNameLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         drawTopContentsLine = ( |
            | 
            drawBodyDarkLine: (contentsBound topLeft addY: 1)
                          To: bound topRight addY: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         drawTopLine = ( |
            | drawTopSlotNameLine. drawTopContentsLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         drawTopSlotNameLine = ( |
            | 
            drawBodyEtchedLine: bound topLeft To: contentsBound topLeft).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         drawVSeparator = ( | {
                 'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
                
                 bottom.
                }  {
                 'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
                
                 top.
                } 
            | 
            top: contentsBound topLeft addY: 2.
            bottom: contentsBound bottomLeft addY: (last ifTrue: 1 False: 2).
            isAssignable ifFalse: [ drawBodyDarkLine: top To: bottom ]
                            True: [ | c |
                                    c: (top mean: bottom)
                                       subtractX: boxSizing assignableIndent.
                                    drawBodyDarkLine:  top    To: c.
                                    drawBodyLightLine: bottom To: c.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         fullName = ( |
            | slotInfo fullName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: hiding\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         hide = ( |
             bigyaya = bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            bigyaya ifTrue: [animator hideSlot: self OfBody: body]
                    False: [world hideRegion: (bound translateTo: location)
                                     OfBody: body
                                    SlotCpt: self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         isAssignment = ( |
            | slotInfo isAssignment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         isMethod = ( |
            | slotInfo isMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         isParent = ( |
            | slotInfo isParent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         isPrivate = ( |
            | slotInfo visibility isPrivate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         isPublic = ( |
            | slotInfo visibility isPublic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         isSprouted = ( |
            | contents isSprouted).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         kbdCopy = ( |
            | myUI slotsInPasteBuffer: vector copyAddFirst: slotInfo. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         kbdCut = ( |
            | removeSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         longKey = ( |
            | 
            slotInfo argumentPrefix, slotName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         longerKey = ( |
            | 
            slotInfo argumentPrefix, slotName, slotInfo priorityPostfix).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         minSize = ( | {
                 'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
                
                 cs <- (1)@(1).
                }  {
                 'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
                
                 ns <- (1)@(1).
                } 
            | 
            ns: name minSize.
            cs: contents minSize.
            (ns x + cs x) @ (ns y max: cs y)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         mustRecreateForSlot: actualSlot = ( |
            | 
            "return true if must recreate"
                ( isAssignable != actualSlot isAssignable)
            || [( slotAnno     != actualSlot annotation)
            || [ contents mustRecreateForSlot: actualSlot]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         nameMinSize = ( |
            | name minSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         nameText = ( | {
                 'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: preferences useFontStyles
                 ifTrue: [ slotInfo longNakedKey ]
                  False: [ slotInfo longKey ].
            preferences showParentStar
                ifTrue: [ t: t, slotInfo parentPostfix ].
            preferences mergeAssignmentSlots && isAssignable ifTrue: [
                t: t, (preferences assignmentSlotIndicator: slotInfo name).
            ].
            t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfLines = ( |
            | name numberOfLines max: contents numberOfLines).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         placeAt: pt = ( |
            | 
            location: pt copy.
            name placeAt: 0@0.
            contents placeAt: name size maxPoint x @ 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringAssignable = ( |
            | 
            isAssignable ifTrue: [ longerKey, ' <- ', valueName ]
                          False: [ printString ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         printStringID = ( |
            | slotInfo printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         redrawArrow = ( |
            | contents redrawArrow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAssignmentSlot = ( | {
                 'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
                
                 h.
                } 
            | 
            h: assignmentSlotInfo holder.
            assignmentSlotInfo remove.
            myUI requestUpdate: h.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         removeSlot = ( |
            | 
            kbdCopy.
            slotInfo holder.
            slotInfo remove.
            world ripOutRegion: (bound translateTo: location) Of: body.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         resetFirstLast = ( |
            | first: false. last: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         resize: sz SeparatedAt: x = ( |
            | 
            size: sz.
            name resize: x @ height.
            contents resize: (width - x) @ height.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         setContentsButtonCluster: cluster = ( |
            | 
            contents setContentsButtonCluster: cluster).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         setSlotButtonCluster: cluster = ( |
            | 
            name setSlotButtonCluster: cluster).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'ModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         showContents = ( |
            | 
            cursor shiftKeyDown 
              ifTrue: [name button edit]
               False: [contents showContents]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         slotName = ( |
            | name asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         sprout = ( |
            | contents sprout).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot'
        
         unsprout = ( |
            | contents unsprout).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         valueName = ( |
            | slotInfo value name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotCpt' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: slotCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         visibility: v = ( |
            | slotInfo visiblity: v.
            body update.
            world display).
        } | ) 



 '-- Side effects'

 globals modules slotCpt postFileIn
