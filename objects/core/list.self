 'Sun-$Revision: 30.11 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: ordered\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: private'
        
         link = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'link' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals link.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'link' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: private'
        
         next <- bootstrap stub -> 'globals' -> 'link' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: ordered\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         link = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'link' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits link.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'link' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'link' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'link' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: private'
        
         prev <- bootstrap stub -> 'globals' -> 'link' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'link' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         value <- 'no value'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: ordered\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         list = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'list' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals list.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: ordered\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         list = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'list' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits list.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'list' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'list' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            list).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'list' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: private'
        
         rep <- bootstrap stub -> 'globals' -> 'link' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'list' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         size <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot'
        
         list = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'list' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'list' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules list.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'list' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'list' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'list' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot'
        
         myComment <- 'Circular, doubly-linked list.\"
            \"and Link nodes of the list.\"
            \"None of the link code trucks in value slots; it trucks only in prev and next\'s.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'list' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            link removeAll "initialization, not needed w/ fileOut".
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'list' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'list' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'sortedList
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         addNextLink: lnk = ( |
            | 
            lnk next: next.
            next prev: lnk.
            lnk prev: self.
            next: lnk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         addPrevLink: lnk = ( |
            | 
            lnk prev: prev.
            prev next: lnk.
            lnk next: self.
            prev: lnk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         doLinks: b = ( | {
                 'ModuleInfo: Module: list InitialContents: FollowSlot'
                
                 head.
                }  {
                 'ModuleInfo: Module: list InitialContents: FollowSlot'
                
                 lnk.
                } 
            | 
            head: next prev.
            lnk: next.
            [head == lnk] whileFalse: [ | saveNextToPermitRemoving |
                saveNextToPermitRemoving: lnk next.
                b value: lnk.
                lnk: saveNextToPermitRemoving.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: iteratingWithEnds\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         doLinksFirst: f Middle: m Last: lst IfEmpty: mt = ( | {
                 'ModuleInfo: Module: list InitialContents: FollowSlot'
                
                 head.
                }  {
                 'ModuleInfo: Module: list InitialContents: FollowSlot'
                
                 lnk.
                } 
            | 
            isEmpty ifTrue: [^mt value].
            head: next prev.
            lnk: next.
            f value: lnk.
            lnk: lnk next.
            head == lnk ifTrue: [^self].
            [lnk = prev] whileFalse: [m value: lnk.  lnk: lnk next].
            lst value: prev.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         findFirstLink: b IfPresent: found IfAbsent: fail = ( | {
                 'ModuleInfo: Module: list InitialContents: FollowSlot'
                
                 i <- 0.
                } 
            | 
            doLinks: [|:lnk|
                (b value: lnk) ifTrue: [^found value: lnk With: i].
                i: i succ.
            ].
            fail value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         firstLink = ( |
            | 
            isEmpty ifTrue: [error: 'first is absent'].
            next).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         isEmpty = ( |
            | == next).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         lastLink = ( |
            | 
            isEmpty ifTrue: [error: 'last is absent'].
            prev).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         remove = ( |
            | 
            isEmpty ifTrue: [^error: 'cannot remove from an empty list'].
            prev next: next.
            next prev: prev.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAll = ( |
            | next: self.  prev: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirstLink = ( |
            | next remove).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         removeLastLink = ( |
            | prev remove).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         reverseDoLinks: b = ( | {
                 'ModuleInfo: Module: list InitialContents: FollowSlot'
                
                 head.
                }  {
                 'ModuleInfo: Module: list InitialContents: FollowSlot'
                
                 lnk.
                } 
            | 
            head: next prev.
            lnk: prev.
            [head == lnk] whileFalse: [ | savePrevToPermitRemoving |
                savePrevToPermitRemoving: lnk prev.
                b value: lnk.
                lnk: savePrevToPermitRemoving.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         withLinks: x Do: b = ( | {
                 'ModuleInfo: Module: list InitialContents: FollowSlot'
                
                 head.
                }  {
                 'ModuleInfo: Module: list InitialContents: FollowSlot'
                
                 lnk.
                } 
            | 
            head: next prev.
            lnk: next.
            x do: [|:v. :k.  saveNextToPermitRemoving. |
                head == lnk ifTrue: [^self].
                saveNextToPermitRemoving: lnk next.
                b value: lnk With: v With: lnk With: k.
                lnk: saveNextToPermitRemoving.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'link' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         withLinks: x ReverseDo: b = ( | {
                 'ModuleInfo: Module: list InitialContents: FollowSlot'
                
                 head.
                }  {
                 'ModuleInfo: Module: list InitialContents: FollowSlot'
                
                 lnk.
                } 
            | 
            head: next prev.
            lnk: prev.
            x reverseDo: [|:v. :k.  savePrevToPermitRemoving.  |
                head == lnk ifTrue: [^self].
                savePrevToPermitRemoving: lnk prev.
                b value: lnk With: v With: lnk With: k.
                lnk: savePrevToPermitRemoving.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         add: elem = ( |
            | addLast: elem).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         add: v WithKey: k = ( |
            | add: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         addAll: c = ( |
            | 
            c do: [ | :v | add: v ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         addAllFirst: c = ( |
            | c reverseDo: [ | :v | addFirst: v ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         addFirst: elem = ( |
            | 
            size: size + 1.
            rep addNextLink: link copy value: elem.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         addLast: elem = ( |
            | 
            size: size + 1.
            rep addPrevLink: link copy value: elem.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: coercing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         asList = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         at: i IfAbsent: b = ( | {
                 'ModuleInfo: Module: list InitialContents: FollowSlot'
                
                 count <- 0.
                } 
            | 
            do: [ | :v |
                count = i ifTrue: [ ^ v ].
                count: count succ.
            ].
            b value: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'list'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( | {
                 'ModuleInfo: Module: list InitialContents: FollowSlot'
                
                 new.
                } 
            | 
            new: copyRemoveAll.
            do: [|:v| new addLast: v].
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | (clone rep: rep copy) removeAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         do: block = ( |
            | 
            rep doLinks: [|:lnk| block value: lnk value With: lnk value].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: iterating\x7fComment: Dave thinks the reason for implementing both \'do:\' and
           \'doFirst:Middle:Last:IfEmpty:\' here may be efficiency.\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         doFirst: f Middle: m Last: lst IfEmpty: mt = ( |
            | 
            rep doLinksFirst:  [|:ln| f value: ln value With: ln value]
                   Middle: [|:ln| m value: ln value With: ln value]
                   Last:   [|:ln| lst value: ln value With: ln value]
                   IfEmpty: mt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         filterBy: filterBlock = ( |
            | 
            rep doLinks: [ |:lnk|
                (filterBlock value: lnk value) ifFalse: [
                    lnk remove.
                    size: size pred.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         first = ( |
            | rep firstLink value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         first: v = ( |
            | rep firstLink value: v.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: private'
        
         firstLinkFor: elem IfPresent: presentBlock IfAbsent: absentBlock = ( |
            | 
            firstLinkSatisfying: [|:lnk| elem = lnk value]
                      IfPresent: presentBlock
                       IfAbsent: absentBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: private'
        
         firstLinkSatisfying: conditionBlock IfPresent: presentBlock IfAbsent: absentBlock = ( |
            | 
            rep doLinks: [ | :lnk | 
                (conditionBlock value: lnk) ifTrue: [ ^ presentBlock value: lnk ].
            ].
            absentBlock value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | first hash ^^ last hash ^^ size hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: inserting\x7fComment: Inserts the specified element after the first
element in the list satisfying the condition
block (or calls the IfAbsent: block if no such
element is found). -- Adam, 5/06\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         insert: x AfterElementSatisfying: blk IfAbsent: aBlk = ( |
            | 
            firstLinkSatisfying: [|:lnk| blk value: lnk value]
                      IfPresent: [|:lnk| size: size + 1.
                                         lnk addNextLink: link copy value: x.
                                         self]
                       IfAbsent: aBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: inserting\x7fComment: Inserts the specified element before the first
element in the list satisfying the condition
block (or calls the IfAbsent: block if no such
element is found). -- Adam, 5/06\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         insert: x BeforeElementSatisfying: blk IfAbsent: aBlk = ( |
            | 
            firstLinkSatisfying: [|:lnk| blk value: lnk value]
                      IfPresent: [|:lnk| size: size + 1.
                                         lnk addPrevLink: link copy value: x.
                                         self]
                       IfAbsent: aBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: inserting\x7fComment: Inserts the specified elements after the first
element in the list satisfying the condition
block (or calls the IfAbsent: block if no such
element is found). -- Adam, 5/06\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         insertAll: c AfterElementSatisfying: blk IfAbsent: aBlk = ( |
            | 
            firstLinkSatisfying: [|:lnk| blk value: lnk value]
                      IfPresent: [|:lnk. newLink. linkToInsertAt|
                                  size: size + c size.
                                  linkToInsertAt: lnk.
                                  c do: [|:x| newLink: link copy value: x.
                                              linkToInsertAt addNextLink: newLink.
                                              linkToInsertAt: newLink].
                                  self]
                       IfAbsent: aBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: inserting\x7fComment: Inserts the specified elements before the first
element in the list satisfying the condition
block (or calls the IfAbsent: block if no such
element is found). -- Adam, 5/06\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         insertAll: c BeforeElementSatisfying: blk IfAbsent: aBlk = ( |
            | 
            firstLinkSatisfying: [|:lnk| blk value: lnk value]
                      IfPresent: [|:lnk| size: size + c size.
                                         c do: [|:x| lnk addPrevLink: link copy value: x].
                                         self]
                       IfAbsent: aBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         isEmpty = ( |
            | rep isEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         isOrdered = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         last = ( |
            | rep lastLink  value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         last: v = ( |
            | rep  lastLink value: v.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         mapBy: eb = ( |
            | 
            rep doLinks: [|:lnk| lnk value: (eb value: lnk value)].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'ModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'collection' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: elem IfAbsent: block = ( |
            | 
            firstLinkFor: elem
               IfPresent: [|:lnk| lnk remove.
                                  ^ size: size pred]
                IfAbsent: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAll = ( |
            | size: 0. rep removeAll. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirst = ( |
            | size: size - 1. rep removeFirstLink value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirstIfAbsent: ab = ( |
            | 
            isEmpty ifTrue: ab False: [removeFirst]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         removeLast = ( |
            | size: size - 1. rep removeLastLink  value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         removeLastIfAbsent: ab = ( |
            | 
            isEmpty ifTrue: ab False: [removeLast]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         reverseDo: block = ( |
            | 
            rep reverseDoLinks: [|:lnk| block value: lnk value With: lnk value].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         with: x Do: b = ( |
            | 
            rep withLinks: x Do: [|:v1. :v2. :k1. :k2|
                b value: v1 value With: v2 With: k1 value With: k2].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'list' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: list InitialContents: FollowSlot\x7fVisibility: public'
        
         with: x ReverseDo: b = ( |
            | 
            rep withLinks: x ReverseDo: [|:v1. :v2. :k1. :k2|
                b value: v1 value With: v2 With: k1 value With: k2].
            self).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'sortedList' From: 'core'



 '-- Side effects'

 globals modules list postFileIn
