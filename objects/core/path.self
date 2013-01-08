 'Sun-$Revision: 30.11 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot'
        
         path = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'path' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'path' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules path.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot'
        
         myComment <- 'traits <system> path\"
            \"<globals system> path\"
            \"Reprentation of a path from the lobby to a well-known object.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: slots\x7fModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         path = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'path' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals path.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: private'
        
         contents <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         path = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'path' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits path.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'path' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | path).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'Comment: Concatenates two paths\x7fModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         , aPath = ( |
             new.
            | 
            new: clone.
            new delobbify:
              contents copySize: contents size + aPath contents size.
            aPath contents do: [|:e. :index|
              new contents at: contents size + index Put: e].
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
            | "the opposite of parse" fullName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'path'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone contents: contents copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWith: s = ( | {
                 'ModuleInfo: Module: path InitialContents: FollowSlot'
                
                 new.
                } 
            | 
            new: clone.
            new contents: contents copySize: 1.
            new contents at: 0 Put: s.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWith: s0 With: s1 = ( |
             c. {
                 'ModuleInfo: Module: path InitialContents: FollowSlot'
                
                 new.
                } 
            | 
            new: clone.
            c: contents copySize: 2.
            c at: 0 Put: s0.
            c at: 1 Put: s1.
            new delobbify: c.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWith: s0 With: s1 With: s2 = ( |
             c. {
                 'ModuleInfo: Module: path InitialContents: FollowSlot'
                
                 new.
                } 
            | 
            new: clone.
            c: contents copySize: 3.
            c at: 0 Put: s0.
            c at: 1 Put: s1.
            c at: 2 Put: s2.
            new delobbify: c.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWithAll: names = ( |
            | clone delobbify: names asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWithoutLast = ( |
            | clone contents: contents copyWithoutLast).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: private'
        
         delobbify: c = ( |
            | 
            (c size > 1 ) && [c first = 'lobby'] ifTrue: [
              delobbify: c copyWithoutFirst
            ] False: [contents: c]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         do: b = ( |
            | contents do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         extendedBy: name = ( | {
                 'ModuleInfo: Module: path InitialContents: FollowSlot'
                
                 new.
                } 
            | 
            new: clone.
            new delobbify:
                (contents
                    copySize: contents size + 1
                    FillingWith: name).
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         fullName = ( | {
                 'ModuleInfo: Module: path InitialContents: FollowSlot'
                
                 n <- ''.
                } 
            | 
            contents do: [
                | :slotName |
                n: n, ' ', slotName.
            ].
            n copyWithoutFirst).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrefixOf: p = ( |
            | contents isPrefixOf: p contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         isTargetCreatedHere = ( |
            | = targetMirror creatorPath).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'Comment: first is inherited, but not last\x7fModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         last = ( |
            | contents last).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'collection' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         parse: s = ( | {
                 'ModuleInfo: Module: path InitialContents: FollowSlot'
                
                 i <- 0.
                }  {
                 'ModuleInfo: Module: path InitialContents: FollowSlot'
                
                 names.
                } 
            | 
            "s is list of names, separated by white space"
            "empty s returns self"
             s isEmpty ifTrue: [^self].
             names: list copyRemoveAll.    
             [|:exit. n |
                 [(s at: i) isAllWhiteSpace] whileTrue: [
                     i: i succ. 
                     i < s size ifFalse: exit
                 ].
                 n: collector copyFirst: s at: i.
                 i: i succ.
                 [(i < s size) && [(s at: i) isAllWhiteSpace not]]
                   whileTrue:  [n: n & (s at: i).  i: i succ].
                 names addLast: n flatString.
                 i < s size  ifFalse: exit.
             ] loopExit.
             copyWithAll: names).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         parseFromShortName: s = ( |
            | 
            parseFromShortName: s IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         parseFromShortName: s IfFail: failBlk = ( |
             mirr <- bootstrap stub -> 'globals' -> 'mirrors' -> 'slots' -> ().
             totalPath <- bootstrap stub -> 'globals' -> 'path' -> ().
            | 
            mirr: (reflect: lobby).
            s asTokensSeparatedByWhiteSpace do: [|:sel|
             totalPath: totalPath,
               pathToKey: sel From: mirr Prefix: totalPath IfFail: failBlk.
             mirr: totalPath targetMirrorIfAbsent: failBlk].
            totalPath).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: private'
        
         pathToKey: sel From: mirr Prefix: prefix IfFail: failBlk = ( |
            | 
            mirr pathToExtendedKey: sel Multiple: [|:paths. t|
              "If the is several paths to the same target; select one"
              paths doFirst: [|:e| t: (prefix, e) targetSlot]
                 MiddleLast: [|:n| t = (prefix, n) targetSlot ifFalse: failBlk].
              paths first.
            ] None: [ failBlk value: 'not understood' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'Comment: Revised so that if a parent has a slot with same
name as a child, the parent slot name is not
elided. -- dmu 4/02\x7fModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         shortName = ( |
             lastNamedMirror.
             n <- ''.
             omittedParentNames <- ''.
            | 

            lastNamedMirror: reflect: lobby.
            slotsDo: [| :slot. :i |

              slot isParent && [i != size pred]   ifTrue: [
                omittedParentNames: omittedParentNames, ' ', slot key
              ]
              False: [
                |r|
                r: lastNamedMirror lookupKey: slot key.
                (r size = 1)  &&  [r first contents = slot contents]
                  ifFalse: [n: n, omittedParentNames].
                 n: n, ' ', slot key.
                 lastNamedMirror: slot contents.
                 omittedParentNames: ''.
              ].
            ] IfAbsent: [^ 'bad path'].

            n isEmpty ifTrue: n False: [n copyWithoutFirst]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | contents size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsDo: b = ( |
            | slotsDo: b IfAbsent: [error: 'bad path: ', fullName]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsDo: b IfAbsent: failB = ( |
            | 
            slotsDo: b IfAbsent: failB StartingFrom: lobby asMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsDo: b IfAbsent: failB StartingFrom: m = ( |
             mir.
             slot.
            | 
            "Optimized 5/18 by Lars" 
            mir: m.
            contents do: [|:n. :i. |
                slot: mir slotAt: n IfAbsent: [^ failB value].
                b value: slot With: i.
                mir: slot contents.
            ].
            slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | fullName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         targetMirror = ( |
            | 
            targetMirrorIfAbsent: 
              [error: 'could not find target path: ', fullName]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         targetMirrorIfAbsent: failB = ( |
            | 
            "returns a mirror on the target object or evaluates the failBlock
             if the path is out of date"
             (targetSlotIfAbsent: [^ failB value]) value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         targetMirrorOrNil = ( |
            | targetMirrorIfAbsent: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         targetObject = ( |
            | targetMirror reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         targetObjectIfAbsent: failB = ( |
            | 
            ( targetMirrorIfAbsent: [|:e| ^ failB value: e]) reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         targetSlot = ( |
            | 
            targetSlotIfAbsent: 
                [error: 'could not find target of path: ', fullName]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         targetSlotIfAbsent: failB = ( |
            | 
            "returns the slot containing the target object or runs the fail block
             if the path is out of date"
             slotsDo: [] IfAbsent: [^ failB value]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         targetSlotOrNil = ( |
            | targetSlotIfAbsent: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'path' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         with: c Do: b = ( |
            | contents with: c Do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: slots\x7fModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: public'
        
         nullPath = bootstrap define: bootstrap stub -> 'globals' -> 'nullPath' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'contents' From:
             globals path copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'nullPath' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals nullPath.

CopyDowns:
globals path. copy 
SlotsToOmit: contents.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nullPath' -> () From: ( | {
         'ModuleInfo: Module: path InitialContents: FollowSlot\x7fVisibility: private'
        
         contents <- [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals nullPath contents.
'.
                    | ) ) _Clone: 1 Filler: 0| 
             x _At: 0  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'nullPath') \/-> 'contents') -> () _At: 0 Put: (
     'NullPath')



 '-- Side effects'

 globals modules path postFileIn
