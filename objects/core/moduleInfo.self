 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
        
         moduleInfo = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'moduleInfo' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'moduleInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules moduleInfo.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
        
         myComment <- 'no comment'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleInfo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleInfo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDown = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> () From: ( |
             {} = 'Comment: holds info about one copy-down\x7fModuleInfo: Creator: globals transporter moduleInfo copyDown.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: InitializeToExpression: ( () _Mirror )\x7fVisibility: private'
        
         immutableParentMirror <-  () _Mirror .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: InitializeToExpression: (\'copy\')\x7fVisibility: private'
        
         immutableSelector <- 'copy'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         immutableSlotsToOmit <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleInfo copyDown parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         = a = ( |
            | 
            == a ifTrue: [^ true].
            parentMirror   = a parentMirror    ifFalse: [ ^ false].
            selector       = a selector        ifFalse: [ ^ false].
            slotsToOmit    = a slotsToOmit     ifFalse: [ ^ false].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'Category: parsing whole thing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
            | 
            trimLastBlank:
              asString_parentMirror,
              asString_selector,
              asString_slotsToOmit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'Category: parsing copy down info\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_parentMirror = ( |
            | 
            (asString_path: parentMirror creatorPath), ' ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'Category: parsing copy down info\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_selector = ( |
            | 
            asString_non_blank: selector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'Category: parsing copy down info\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_slotsToOmit = ( |
            | 
            slotsToOmit isEmpty ifTrue: '' 
             False: [
              slotsToOmitPrefix, 
              (
                trimLastBlank:
                  asString_vectorContaining: 
                    (slotsToOmit copyMappedBy: [|:n| asString_non_blank: n])
                   Terminator: ''
              ),
              '.']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copiedParentMirror = ( |
            | 
            copiedParentMirrorIfFail: [|:e| 
              error: 'could not copy copy-down parent: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copiedParentMirrorIfFail: fb = ( |
             copyPM.
             m.
            | 
            "return mirror of copied parent"
            m: parentMirror.
            selector first = '_'  ifTrue: [
              selector = '_Clone'
                ifTrue: [copyPM: m cloneReflectee]
                 False: [
                   ^ fb value: 'If copy down selector is primitive, must be _Clone'.
                 ].
            ] False: [| ks |
              ks: m lookupKey: selector.
              ks isEmpty ifTrue: [
                ^ fb value: 'parent does not understand selector: ', selector.
              ].
              ks size > 1 ifTrue: [
                ^ fb value: 'selector: ', selector, ' is ambiguous'.
              ].
              copyPM:  (reflect:  selector sendTo: m reflectee)
            ].
            "remove comment from copy"
            copyPM comment: ''.
            copyPM).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForParentMirror: mir = ( |
            | copy immutableParentMirror: mir).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForSelector: sel = ( |
            | 
            sel isEmpty ifTrue: [
              error: 'copyDown objects should always have non-empty selectors'.
            ].
            copy immutableSelector: sel asString canonicalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         copyForSlotsToOmit: blk = ( |
             pm.
             sto.
            | 
            "private, send slotsToOmit: to a mirror instead"
            sto: blk value: slotsToOmit.
            copy immutableSlotsToOmit: sto asVector sort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         extensionalSlotsToOmitFor: childMir = ( |
             cpm.
            | 
            "try to guess what slots to omit"
            cpm:
              copiedParentMirrorIfFail: [|:e|
                warning: 'Could not copy parent; ', e.
                reflect: ().
              ].
            ( cpm asList 
               copyFilteredBy: [|:s| s isAssignment not] )
               copyFilteredBy: [|:s. |
                 (
                      (   childMir includesKey: s name )
                   && [   s couldBeACopiedDownCopyOf:  childMir at: s name ]
                 ) not ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
               parentMirror  hash
            ^^ selector      hash
            ^^ slotsToOmit   hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractInfo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'abstractInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter moduleInfo abstractInfo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'abstractInfo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         parentMirror = ( |
            | immutableParentMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'Category: parsing whole thing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
        
         parse: ss IfFail: fb IfFound: ok = ( | {
                 'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
                
                 r.
                }  {
                 'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
                
                 s <- ''.
                } 
            | 
            r: self.
            s: ss.

            r parse_parentMirror: s IfFail: [^ fb value] IfFound: [|:ss. :rr| s: ss.  r: rr].
            r parse_selector:     s IfFail: [^ fb value] IfFound: [|:ss. :rr| s: ss.  r: rr].
            r parse_slotsToOmit:  s IfFail: [^ fb value] IfFound: [|:ss. :rr| s: ss.  r: rr].

            ok value: s With: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'Category: parsing copy down info\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_parentMirror: s IfFail: fb IfFound: ok = ( |
            | 
            s first = '\n' ifTrue: [^ fb value].
            parse_path: s IfFail: fb IfFound: [|:s. :p|
              ok value: s copyWithoutFirst 
                  With: copyForParentMirror: p targetMirrorIfAbsent: [^fb value]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'Category: parsing copy down info\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_selector: s IfFail: fb IfFound: ok = ( |
            | 
            s do: [|:c. :i|
              case if:  c = ' '  
                   Then: [^ ok value: (s copyFrom: i succ) 
                              With: copyForSelector: s copySize: i]
                   If: [c = '\n']
                   Then: [^ ok value: (s copyFrom: i) 
                              With: copyForSelector: s copySize: i].
            ].
            ok value: '' With: copyForSelector: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'Category: parsing copy down info\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_slotsToOmit: s IfFail: fb IfFound: ok = ( |
            | 
            parse_prefix: slotsToOmitPrefix In: s 
             IfFail: [ok value: s With: self] 
             IfFound: [
              | :s. slots. start. end |
              slots: list copyRemoveAll.
              start: 0.
              end: 0.
              [ | :noMoreSlots. c |
                end: end succ.
                c: s at: end IfAbsent: ' '.
                (c = ' ') || [c = '.']  ifTrue: [
                  slots addLast: (s copyFrom: start UpTo: end) canonicalize.
                  c = ' ' ifFalse: noMoreSlots.
                  start: end succ.
                ].
              ] loopExit.
              ok value: (s copyFrom: s size min: end succ)
                  With: copyForSlotsToOmit: slots]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | transporter moduleInfo copyDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         selector = ( |
            | immutableSelector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsToOmit = ( |
            | immutableSlotsToOmit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> () From: ( | {
         'Category: parsing copy down info\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         slotsToOmitPrefix = '
SlotsToOmit: '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         followSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleInfo followSlot.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToFollow = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleInfo followSlot parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         = c = ( |
            | == c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_contents = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         clone = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | identityHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleInfo followSlot parent parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         = con = ( |
            | 
            == con ifTrue: [^ true].
            prefix             = con prefix             ifFalse: [^ false].
            asString_contents  = con asString_contents  ifFalse: [^ false].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
            | prefix, asString_contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         isInitializeToExpression = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         parse: s IfFail: fb IfFound: ok = ( |
            | 
            parse_prefix: prefix In: s IfFail: fb
                 IfFound: [|:s| parse_contents: s IfFail: fb IfFound: ok]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         parsing = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins transporter moduleInfo parsing.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parsing* = bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_contents: s IfFail: fb IfFound: ok = ( |
            | 
            ok value: s With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         prefix = 'FollowSlot'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeToExpression = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleInfo initializeToExpression.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
        
         expression = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleInfo initializeToExpression parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_contents = ( |
            | asString_expression: expressionMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'Category: mutation\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForExpression: s = ( |
            | 
            copyForExpressionMethod:  s parseObjectBody).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'Category: mutation\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForExpressionMethod: m = ( |
            | ((reflect: self) copyAt: 'expression' PutContents: m) reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         expressionMethod = ( |
            | ((reflect: self) at: 'expression') contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         expressionSource = ( |
            | expressionMethod source).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'Category: evaluating\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
        
         expressionValue = ( |
            | 
            (reflect: lobby) evaluate: expressionMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'Category: evaluating\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
        
         expressionValueMirror = ( |
            | reflect: expressionValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | expressionMethod hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         isContentsSameAs: x = ( |
            | 
                 expressionSource  
            =  x expressionSource).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         isInitializeToExpression = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToFollow = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         statefullContents = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'statefullContents' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter moduleInfo statefullContents.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'statefullContents' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_contents: s IfFail: fb IfFound: ok = ( |
            | 
            parse_expression: s IfFail: fb IfFound: [|:s. :meth|
                ok value: s With: copyForExpressionMethod: meth]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'initializeToExpression' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         prefix = 'InitializeToExpression: '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         objectInfo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleInfo objectInfo.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         hashValue <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         immutableCopyDowns <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         immutableCreatorSlotHint <- bootstrap stub -> 'globals' -> 'slots' -> 'plain' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleInfo objectInfo parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         = a = ( |
            | 
            == a ifTrue: [^ true].
                 ( creatorSlotHint name   = a creatorSlotHint name)
            && [ ( creatorSlotHint holder = a creatorSlotHint holder)
            && [ ( copyDowns              = a copyDowns) ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: parsing whole thing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
            | 
            trimLastBlank:
              asString_creatorSlotHint, 
              asString_copyDowns).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: parsing copy down info\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_copyDowns = ( |
            | 
            copyDowns isEmpty ifTrue: '' False: [
              copyDownsPrefix, 
                asString_vectorContaining: 
                  ( copyDowns copyMappedBy: [|:cd| cd asString, '\n'] )
                Terminator: '\n'
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: parsing creator\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_creatorSlotHint = ( |
            | 
            creatorSlotHint = prototype creatorSlotHint ifTrue: '' False: [
                creatorPrefix, (asString_path: creatorPathHint), '\n']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: access\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDowns = ( |
            | immutableCopyDowns).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: parsing copy down info\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         copyDownsPrefix = '
CopyDowns:
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: mutation\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForCopyDowns: blk = ( |
            | 
            (copy immutableCopyDowns: 
              (blk value: copyDowns) asVector copy) setHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: mutation\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForCreatorSlotHint: aSlot = ( |
            | (copy immutableCreatorSlotHint: aSlot copy) setHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: access\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         creatorPathHint = ( |
            | 
            creatorSlotHint holder creatorPathIfPresent: [|:p|
              p extendedBy: creatorSlotHint key
            ] IfAbsent: nullPath).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: parsing creator\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         creatorPrefix = 'Creator: '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: access\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         creatorSlotHint = ( |
            | immutableCreatorSlotHint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | hashValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'abstractInfo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: parsing whole thing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
        
         parse: ss IfFail: fb IfFound: ok = ( |
             r.
             s <- ''.
            | 
            r: self.
            s: ss.

            "each elem is optional"

            r parse_creatorSlotHint:   s  IfFail: []  IfFound: [|:ss. :rr| s: ss.  r: rr].
            r parse_copyDowns:         s  IfFail: []  IfFound: [|:ss. :rr| s: ss.  r: rr].

            ok value: s With: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: parsing copy down info\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_copyDowns: s IfFail: fb IfFound: ok = ( |
            | 
            parse_prefix: copyDownsPrefix In: s
              IfFail: [ok value: s With: self]
              IfFound: [|:s|
                parse_vector: s By: [|:s. :fb. :ok. moduleInfo = transporter moduleInfo |
                  moduleInfo copyDown
                    parse: s IfFail: fb IfFound: [|:s. :cd | 
                      ok value: s copyWithoutFirst With: cd ]
                ] Terminator: '\n'
                IfFail: fb
                IfFound: [|:s. :cds|
                  ok value: s With: copyForCopyDowns: cds]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: parsing creator\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_creatorSlotHint: s IfFail: fb IfFound: ok = ( |
            | 
              parse_prefix: creatorPrefix In: s IfFail: fb  IfFound: [|:s.     |
                parse_path:                   s IfFail: fb  IfFound: [|:s. :p. |
                  ok value: s copyWithoutFirst 
                      With: copyForCreatorSlotHint: p targetSlotIfAbsent: [
                                                       prototype creatorSlotHint].
            ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Comment: so verify can parse into a clean one\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | transporter moduleInfo objectInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         setHash = ( |
             s.
            | 
             s: creatorSlotHint.
             s exists ifFalse: [ ^ hashValue: 0 ].
            hashValue: s name hash  ^^  s contents hash  ^^  copyDowns hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         slotInfo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleInfo slotInfo.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         hashValue <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         immutableInitialContents <- bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         immutableModule <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         slotInfo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter moduleInfo slotInfo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleInfo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins transporter moduleInfo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing booleans\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_boolean: b = ( |
            | b ifTrue: 'true' False: 'false').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing expressions\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_expression: methMir = ( |
            | '(', methMir source, ')', ' ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing simple things\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_non_blank: nb = ( |
            | nb, ' ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing paths\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_path: p = ( |
            | p fullName, pathTerminator).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing paths\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_paths: paths = ( | {
                 'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            asString_vectorContaining: 
                ((paths copyAddLast: path) 
                 copyMappedBy: [|:p| (asString_path: p), '\n'])
              Terminator: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing vectors\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_vectorContaining: strings Terminator: term = ( |
             c.
            | 
            c: ''.
            strings do: [|:s| c: c & s].
            (c & term) flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing all of it\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
        
         parse: s = ( |
            | 
            parse: s IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing all of it\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
        
         parse: s IfFail: fb = ( |
            | 
              parse: s 
             IfFail: [fb value: 'could not parse: module info', s]
            IfFound: [|:ss. :r| 
                 ss isEmpty ifFalse: [
                    ^ fb value: 'could not parse entire module info,',
                              ' entire string is: ', s,
                              ' unparsable part is: ', ss.
                 ].
                 r]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing booleans\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
        
         parse_boolean: s IfFail: fb IfFound: ok = ( |
            | 
            parse_prefix: 'true' In: s IfFail: []
                 IfFound: [|:s| ^ ok value: s With: true ].

            parse_prefix: 'false' In: s  IfFail: []
                 IfFound: [|:s| ^ ok value: s With: false ].

            fb value: 'could not find "true" or "false"').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing expressions\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_expression: s IfFail: fb IfFound: ok = ( |
             errorIndex <- 0.
             hackIfLineIsOffByOne <- 0.
             line <- 0.
             obj.
             objs.
             ss.
             syntaxError.
            | 

            "s starts with a self expression (followed by expression terminator).
             If cannot parse it, invoke fb.
             Otherwise, peel it off, and invoke ok with 
             rest of string to parse and expressioned copy of me"

            s first = '(' ifFalse: [^ fb value: 'expressions must start with a left parenthesis'].
            ss: s copyWithoutFirst.
            [|:exit|
              ss parseObjectBodyIfFail: [|:eo| syntaxError: eo. exit value].
              ^ fb value: 'parse of expression should have failed at terminator'.
            ] exit.

            "looking for the close parenthesis"

            line: 0.
            errorIndex:  
              syntaxError start x
            + (
                ss findFirst: [|:c. :i|
                    line = syntaxError start y
                      ifTrue:  true "1st char on desired line"
                       False:  [
                           c = '\n'  ifTrue: [
                               line: line succ.  
                               hackIfLineIsOffByOne: i succ succ. "workaround for weird parser bug"
                           ].  
                           false
                       ].
                ] IfPresent: [|:c. :i| i]
                  IfAbsent:  [
                    (line + 1) = syntaxError start y
                        ifTrue: hackIfLineIsOffByOne
                         False: [error: 'could not find error line']]
               ).

            (ss at: errorIndex) = ')'  ifFalse: [
              error: 'could not parse expression:\n\t', ss,
                     '\n\t errorIndex = ', errorIndex printString.
            ].
            objs: ss copySize: errorIndex.
            ss:   ss copyFrom: errorIndex succ.

            ss isEmpty ifFalse: [
              [ss first = ' '] assert.
              ss: ss copyFrom: ' ' size.
            ].

            obj: objs parseObjectBodyIfFail: [|:eo| error: 'parse failed'].

            ok value: ss  With: obj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing simple things\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_non_blank: s IfFail: fb IfFound: ok = ( |
            | 
            s findFirst: [|:c| c = ' ']
              IfPresent: [|:c. :i| 
                  ok value: (s copyFrom: i succ) With:  s copySize: i]
              IfAbsent: [ok value: '' With: s]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing paths\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_path: s IfFail: fb IfFound: ok = ( |
            | 

            s findFirst: [|:c| c = pathTerminator]
              IfPresent: [|:c. :i. ss. j. p. |  
                  "paths must be non empty, else return proto path"
                  "xxx ugly; clean this up"
                  j: i + pathTerminator size.
                  ss:  s copyFrom: j.
                  p:  path parse: s copySize: i.
                  [ (p contents size > 1) && [p contents first = 'lobby'] ] whileTrue: [
                    warning: 'parsed path: ', p fullName,       
                             ' starts with redundant and confusing "lobby"\n',
                             'I will remove it, but you should find this annotation in the source and fix it'.
                    p: path copyWithAll: p contents copyWithoutFirst.
                  ].
                  ok value:  ss  With:  p.
            ] IfAbsent: [ fb value: 'missing path terminator (', pathTerminator, ')' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing paths\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_paths: s IfFail: fb IfFound: ok = ( |
             foundMT <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
             "multiple paths are teminated by the empty path"
              parse_vector: s By: [ | :s. :fb. :ok. |
                foundMT ifTrue: fb  False: [
                  parse_path: s IfFail: fb IfFound: [| :s. :p |
                    path = p ifTrue: [ foundMT: true]. 
                    ok value: s copyWithoutFirst With: p.
                  ].
                ].
            ] Terminator: ''
              IfFail: fb 
              IfFound: [|:s. :paths.  | ok value: s With: paths copyWithoutLast]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_prefix: pre In: s IfFail: fb IfFound: ok = ( |
            | 
            (pre isPrefixOf: s) ifFalse: fb True: [
                ok value: (s copyFrom: pre size)]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing vectors\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_vector: s By: elemBlock Terminator: term IfFail: fb IfFound: ok = ( |
             r.
             ss.
            | 
            r: list copyRemoveAll.
            ss: s.
            [|:exit|
              elemBlock value: ss With: exit With: [|:s. :elem|
                ss: s.
                r addLast: elem.
              ].
            ] loopExit.
            parse_prefix: term
                      In: ss
                  IfFail: [^ fb value] 
                 IfFound: [|:s| ss: s].
            ok value: ss With: r asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'Category: parsing paths\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         pathTerminator = '.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         trimLastBlank: s = ( |
            | 
            s isEmpty || [s last != ' '] ifTrue: s False: [s copyWithoutLast]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         verify = ( |
            | 
            [ = (prototype parse: asString)] assert.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleInfo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter moduleInfo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'abstractInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'abstractInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parsing* = bootstrap stub -> 'mixins' -> 'transporter' -> 'moduleInfo' -> 'parsing' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'abstractInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDown = bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'copyDown' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         initialContents = bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         objectInfo = bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         = a = ( |
            | 
            == a ifTrue: [^ true].
            module            = a module            ifFalse: [^ false].
            initialContents   = a initialContents   ifFalse: [^ false].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
            | 
            trimLastBlank:
              asString_module, 
              asString_initialContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: parsing contents\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_initialContents = ( |
            | initialContentsPrefix, initialContents asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: parsing module\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         asString_module = ( |
            | module isEmpty ifTrue: '' False: [modulePrefix, asString_non_blank: module]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: mutating\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForInitialContents: c = ( |
            | (copy immutableInitialContents: c) setHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: mutating\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForModule: m = ( |
            | 
            (copy immutableModule: m canonicalize) setHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            hashValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         initialContents = ( |
            | immutableInitialContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: parsing contents\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         initialContentsPrefix = 'InitialContents: '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: parsing contents\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         initialContentsPrototypesDo: blk = ( | {
                 'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot'
                
                 nameSpace = bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> ().
                } 
            | 

            blk value:  nameSpace initializeToExpression.
            blk value:  nameSpace followSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         module = ( |
            | immutableModule).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: parsing module\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         modulePrefix = 'Module: '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'abstractInfo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         parse: ss IfFail: fb IfFound: ok = ( |
             r.
             s <- ''.
            | 
            r: self.
            s: ss.

            r parse_module:           s  IfFail: []  IfFound: [|:ss. :rr|  s: ss.  r: rr].
            r parse_initialContents:  s  IfFail: []  IfFound: [|:ss. :rr|  s: ss.  r: rr].

            ok value: s With: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: parsing contents\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_initialContents: s IfFail: fb IfFound: ok = ( |
            | 
            parse_prefix: initialContentsPrefix In: s IfFail: fb  IfFound: [|:s|
                initialContentsPrototypesDo: [|:cp|
                    cp parse: s  IfFail: []  IfFound: [|:s. :r|
                        ^ ok value: s With: copyForInitialContents: r
                    ].
                ].
                error: 'should have found a valid initial contents in: ', s
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: parsing module\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parse_module: s IfFail: fb IfFound: ok = ( |
            | 

            "parse module string, if parse fails, return result of evaling fb,
             on success, return result of evaluating ok
             with arg1 = unparsed part and arg2 = new info object. -- dmu"

            parse_prefix: modulePrefix In: s IfFail: fb IfFound: [|:s|
                parse_non_blank: s IfFail: fb IfFound: [|:s. :nb|
                    ok value:  s With:  copyForModule: nb]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Comment: so verify can parse into a clean one\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | transporter moduleInfo slotInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         setHash = ( |
            | 
            hashValue: module           hash 
                    ^^ initialContents  hash.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'statefullContents' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         = c = ( |
            | 
            ( == c ) || [ (prefix = c prefix) && [isContentsSameAs: c] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'statefullContents' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | prefix hash ^^ contents hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> 'statefullContents' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'moduleInfo' -> () From: ( | {
         'ModuleInfo: Module: moduleInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         statelessContents = bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'followSlot' -> 'parent' -> ().
        } | ) 



 '-- Side effects'

 globals modules moduleInfo postFileIn
