 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         objBodyRegions = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyRegions' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyRegions' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules objBodyRegions.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         objBodyRegions = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'objBodyRegions' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals objBodyRegions.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         bodyLeftSpaces <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         bodyLefts <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         bodyRightSpaces <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         bodyRights <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: InitializeToExpression: (nil)'
        
         footerCenter.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: InitializeToExpression: (nil)'
        
         footerLeft.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: InitializeToExpression: (nil)'
        
         footerRight.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: InitializeToExpression: (nil)'
        
         headerCenter.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: InitializeToExpression: (nil)'
        
         headerLeft.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: InitializeToExpression: (nil)'
        
         headerRight.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: InitializeToExpression: (nil)'
        
         location.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         objBodyRegions = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits objBodyRegions.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'objBodyRegions' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         ac = ( |
            | ui uiColors arrow" ones").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         bound = ( |
            | 
            location ##! (footerRight bottomRight - headerLeft topLeft)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         copy = ( |
            | 
            (((resend.copy bodyLefts: bodyLefts copy)
                           bodyLeftSpaces: bodyLeftSpaces copy)
                           bodyRights: bodyRights copy)
                           bodyRightSpaces: bodyRightSpaces copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: InitializeToExpression: (false)'
        
         debug <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         drawBody: bod To: bm = ( |
            | drawBody: bod To: bm At: location).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         drawBody: bod To: bm At: pt = ( |
             p.
            | 
                            bod graphic copy: headerLeft To: bm At: pt.
                            p: pt addX: headerLeft width.
                            bod graphic copy: headerCenter To: bm At: p.
                            p: p addX: headerCenter width.
                            bod graphic copy: headerRight To: bm At: p.
                            p: pt addY: headerLeft height.
                            drawSlices: bodyLefts Body: bod To: bm At: p.
            "these preds are random hacks to try to get the middle widths to be smaller"
                            p: p addX: bodyLefts first width pred pred.
                            drawSlices: bodyLeftSpaces Body: bod To: bm At: p.
                            p: p addX: bodyLeftSpaces first width pred pred.
                            drawSlices: bodyRights Body: bod To: bm At: p.
                            p: p addX: bodyRights first width pred pred.
                            drawSlices: bodyRightSpaces Body: bod To: bm At: p.
                            p: pt addY: headerLeft height +
                                    (bodyLefts reduceWith: [ | :e1. :e2. | e1 height + e2 height ]
                                              IfSingleton: [ | :e | e height ]
                                              IfEmpty: 0).
                            bod graphic copy: footerLeft To: bm At: p.
                            p: p addX: footerLeft width.
                            bod graphic copy: footerCenter To: bm At: p.
                            p: p addX: footerCenter width.
                            bod graphic copy: footerRight To: bm At: p.
                    debug ifTrue: [ xdrawBody: bod To: bm At: pt. ].
                    (pt #! (p + footerRight size))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         drawSlices: bodyRegions Body: bod To: bm At: pt = ( |
             p.
            | 
            p: pt.
            bodyRegions do: [ | :br |
                bod graphic copy: br To: bm At: p.
                p: p addY: br height.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         scoop: bodyRegions From: y1 To: y2 = ( |
             newRegions.
            | 
            newRegions: list copyRemoveAll.
            "assumption: the scooped area lies entirely within one region"
            bodyRegions do: [ | :br |
                (br top < y1) && [(y1 <= br bottom) &&
                [(br top < y2) && [y2 <= br bottom]]] ifTrue: [
                    newRegions add: br topLeft #! (br right @ y1).
                    newRegions add: (br left @ y2 succ) #! br bottomRight.
                ] False: [
                    newRegions add: br.
                ].
            ].
            newRegions).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         scoopFrom: y1 To: y2 = ( |
            | 
            "assumption: y1 < y2"
            bodyLefts: scoop: bodyLefts From: y1 To: y2.
            bodyLeftSpaces: scoop: bodyLeftSpaces From: y1 To: y2.
            bodyRights: scoop: bodyRights From: y1 To: y2.
            bodyRightSpaces: scoop: bodyRightSpaces From: y1 To: y2.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         slice: bodyRegions At: y = ( |
             newRegions.
            | 
            newRegions: list copyRemoveAll.
            bodyRegions do: [ | :br |
                (br top < y) && [y <= br bottom] ifTrue: [
                    newRegions add: br topLeft #! (br right @ y).
                    newRegions add: (br left @ y succ) #! br bottomRight.
                ] False: [
                    newRegions add: br.
                ].
            ].
            newRegions).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         sliceAt: y = ( |
            | 
            bodyLefts: slice: bodyLefts At: y.
            bodyLeftSpaces: slice: bodyLeftSpaces At: y.
            bodyRights: slice: bodyRights At: y.
            bodyRightSpaces: slice: bodyRightSpaces At: y.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         stepTweener: tweener Do: block = ( |
             bc.
             bl.
             bls.
             br.
             brs.
             newList.
             tbl.
             tbls.
             tbr.
             tbrs.
             tc.
            | 
                    tweener headerLeft step.
                    headerLeft: headerLeft bottomRight:
                        headerLeft bottomLeft addX: tweener headerLeft value.
                    tweener headerRight step.
                    headerRight: headerRight bottomLeft:
                        (headerRight bottomRight subtractX: tweener headerRight value).
                    newList: list copyRemoveAll.
            "        bodyLefts with: tweener bodyLefts DoFirst: [ | :bl. :tbl. |"
            bl: bodyLefts first.
            tbl: tweener bodyLefts first.
                        tbl step.
                        newList add: bl bottomRight: bl topLeft + tbl value.
            "       ] Middle: [ | :bl. :tbl. |
                        tbl step.
                        uh oh.
                    ] Last: [ | :bl. :tbl. |
            "
            bl: bodyLefts last.
            tbl: tweener bodyLefts last.
                        tbl step.
                        newList add: bl topRight: (bl bottomLeft x + tbl value x) @
                                     (bl bottomLeft y - tbl value y).
            "       ] IfEmpty: []."
                    bodyLefts: newList.
                    newList: list copyRemoveAll.
            "        bodyLeftSpaces with: tweener bodyLeftSpaces DoFirst: [ | :bls. :tbls. |"
            bls: bodyLeftSpaces first.
            tbls: tweener bodyLeftSpaces first.
                        tbls step.
                        newList add: bls bottomLeft: (bls topRight x - tbls value x) @
                                        (bls topRight y + tbls value y).
            "       ] Middle: [ | :bls. :tbls. |
                        tbls step.
                        uh oh.
                    ] Last: [ | :bls. :tbls. |
            "
            bls: bodyLeftSpaces last.
            tbls: tweener bodyLeftSpaces last.
                        tbls step.
                        newList add: bls topLeft: bls bottomRight - tbls value.
            "       ] IfEmpty: []."
                    bodyLeftSpaces: newList.
                    newList: list copyRemoveAll.
            "        bodyRights with: tweener bodyRights DoFirst: [ | :br. :tbr. |"
            br: bodyRights first.
            tbr: tweener bodyRights first.
                        tbr step.
                        newList add: br bottomRight: br topLeft + tbr value.
            "        ] Middle: [ | :br. :tbr. |
                        tbr step.
                        uh oh.
                    ] Last: [ | :br. :tbr. |
            "
            br: bodyRights last.
            tbr: tweener bodyRights last.
                        tbr step.
                        newList add: br topRight: (br bottomLeft x + tbr value x) @
                                     (br bottomLeft y - tbr value y).
            "        ] IfEmpty: []."
                    bodyRights: newList.
                    newList: list copyRemoveAll.
            "        bodyRightSpaces with: tweener bodyRightSpaces DoFirst: [ | :brs. :tbrs. |"
            brs: bodyRightSpaces first.
            tbrs: tweener bodyRightSpaces first.
                        tbrs step.
                        newList add: brs bottomLeft: (brs topRight x - tbrs value x) @
                                        (brs topRight y + tbrs value y).
            "        ] Middle: [ | :brs. :tbrs. |
                        tbrs step.
                        uh oh.
                    ] Last: [ | :brs. :tbrs. |
            "
            brs: bodyRightSpaces last.
            tbrs: tweener bodyRightSpaces last.
                        tbrs step.
                        newList add: brs topLeft: brs bottomRight - tbrs value.
            "        ] IfEmpty: []."
                    bodyRightSpaces: newList.
                    tweener footerLeft step.
                    footerLeft: footerLeft bottomRight:
                        footerLeft bottomLeft addX: tweener footerLeft value.
                    tweener footerCenter step.
                    tc: footerCenter topCenter.
                    bc: footerCenter bottomCenter.
                    footerCenter: footerCenter topLeft:
                        tc subtractX: tweener footerCenter value / 2.
                    footerCenter bottomRight:
                        bc addX: tweener footerCenter value / 2.
                    tweener footerRight step.
                    footerRight: footerRight bottomLeft:
                        footerRight bottomRight subtractX: tweener footerRight value.

                    tweener location step.
                    location: tweener location value.

                    block value: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         tweenFrom: fromreg Do: block = ( |
             morphingRegions.
             steps = 8.
             tweener.
            | 
            tweener: fromreg tweenerTo: self Steps: steps.
            morphingRegions: copy.
            steps do: [ morphingRegions stepTweener: tweener Do: block ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         tweenTo: toreg Do: block = ( |
             morphingRegions.
             steps = 8.
             tweener.
            | 
            tweener: tweenerTo: toreg Steps: steps.
            morphingRegions: copy.
            steps do: [ morphingRegions stepTweener: tweener Do: block ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         tweenerTo: toreg Steps: steps = ( |
             tweenProto = bootstrap stub -> 'globals' -> 'peakingInBetweener' -> ().
             tweener.
            | 
            tweener: objBodyRegions copy.
            tweener headerLeft: tweenProto copyFrom: headerLeft width
                                                 To: toreg headerLeft width
                                              Steps: steps.
            "treat headerCenter as fixed, so ignore it"
            tweener headerRight: tweenProto copyFrom: headerRight width
                                                  To: toreg headerRight width
                                               Steps: steps.
            bodyLefts with: toreg bodyLefts Do: [ | :bls. :tbls. |
                tweener bodyLefts add:
                    tweenProto copyFrom: bls size To: tbls size Steps: steps. ].
            bodyLeftSpaces with: toreg bodyLeftSpaces Do: [ | :bls. :tbls. |
                tweener bodyLeftSpaces add:
                    tweenProto copyFrom: bls size To: tbls size Steps: steps. ].
            bodyRights with: toreg bodyRights Do: [ | :br. :tbr. |
                tweener bodyRights add:
                    tweenProto copyFrom: br size To: tbr size Steps: steps. ].
            bodyRightSpaces with: toreg bodyRightSpaces Do: [ | :brs. :tbrs. |
                tweener bodyRightSpaces add:
                    tweenProto copyFrom: brs size To: tbrs size Steps: steps. ].
            tweener footerLeft: tweenProto copyFrom: footerLeft width
                                                 To: toreg footerLeft width
                                              Steps: steps.
            tweener footerCenter: tweenProto copyFrom: footerCenter width
                                                 To: toreg footerCenter width
                                              Steps: steps.
            tweener footerRight: tweenProto copyFrom: footerRight width
                                                  To: toreg footerRight width
                                               Steps: steps.

            tweener location: tweenProto copyFrom: location
                                               To: toreg location
                                            Steps: steps.
            tweener).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         xdrawBody: bod To: bm At: pt = ( |
             p.
            | 
            bm rectangle: (headerLeft translateTo: pt) Color: ac.
            xhalt.
                    p: pt addX: headerLeft width.
            bm rectangle: (headerCenter translateTo: p) Color: ac.
            xhalt.
                    p: p addX: headerCenter width.
            bm rectangle: (headerRight translateTo: p) Color: ac.
            xhalt.
                    p: pt addY: headerLeft height.
                    xdrawSlices: bodyLefts Body: bod To: bm At: p.
                    p: p addX: bodyLefts first width.
                    xdrawSlices: bodyLeftSpaces Body: bod To: bm At: p.
                    p: p addX: bodyLeftSpaces first width.
                    xdrawSlices: bodyRights Body: bod To: bm At: p.
                    p: p addX: bodyRights first width.
                    xdrawSlices: bodyRightSpaces Body: bod To: bm At: p.
                    p: pt addY: headerLeft height +
                            (bodyLefts reduceWith: [ | :e1. :e2. | e1 height + e2 height ]
                                      IfSingleton: [ | :e | e height ]
                                      IfEmpty: 0).
            bm rectangle: (footerLeft translateTo: p) Color: ac.
            xhalt.
                    p: p addX: footerLeft width.
            bm rectangle: (footerCenter translateTo: p) Color: ac.
            xhalt.
                    p: p addX: footerCenter width.
            bm rectangle: (footerRight translateTo: p) Color: ac.
            xhalt.
            "ui window flush.
            halt.
            "       self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         xdrawSlices: bodyRegions Body: bod To: bm At: pt = ( |
             p.
            | 
                    p: pt.
                    bodyRegions do: [ | :br |
            bm rectangle: (br translateTo: p) Color: ac.
            xhalt.
                        p: p addY: br height.
                    ].
                    self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objBodyRegions' -> () From: ( | {
         'ModuleInfo: Module: objBodyRegions InitialContents: FollowSlot'
        
         xhalt = ( |
            | "ui window flush. halt. " self).
        } | ) 



 '-- Side effects'

 globals modules objBodyRegions postFileIn
