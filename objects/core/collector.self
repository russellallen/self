 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fCategory: collections\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         collector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'collector' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals collector.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: private'
        
         element <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: private'
        
         flatSizeCache.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: private'
        
         index <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: core\x7fCategory: collections\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         collector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'collector' -> () From: ( |
             {} = 'Comment: A collector accumulates a collection of collections to be
concatenated. The resulting structure can be later converted into
a normal collection. Examples:

    (1 & 2 & 3) asVector
    (1 & (65 asCharacter & 66 asCharacter) asString & 17) asList

The contents of a collector can also be flattened by concatenating
its elements (assumed to be collections) to produce a single, flat
collection. This allows an application to construct a large collection
from a number of smaller ones efficiently by deferring all concatenations
until the size of the final result is known. This reduces the cost of
building a collection by concatenating N shorter collections from O(N^2)
to O(N). Examples:

    (\'this\' & \' is\' & \' a\' & \' test\') flatString
    [| s <- \'\' | 1000 do: [| :i | s: s & i printString]. s flatString

Note: Collectors never contain collectors. If the argument to & is
a collector (discovered by double-dispatching, its elements are appended
to the receiver. Thus, 1 & (2 & 3) is the same as (1 & 2) & 3. That is,
& is associative.

Note: flatSizeCache caches the result of computing the size of the flattened
collection derived from this collector. This cached value is only a hint; it
can lie if some of the elements of the collector change size!
\x7fModuleInfo: Creator: traits collector.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'collector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: private'
        
         previous.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot'
        
         collector = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'collector' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'collector' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules collector.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         & el = ( |
            | el appendToCollector: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: collector InitialContents: FollowSlot'
        
         append: el = ( |
            | 
            ((collector clone element: el) index: index succ) previous: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         appendToCollector: c = ( |
             r.
             this.
             toAdd <- bootstrap stub -> 'globals' -> 'list' -> ().
            | 
            toAdd: toAdd copyRemoveAll.
            this: self.
            [this isNil] whileFalse: [
                toAdd addFirst: this element.
                this: this previous.
            ].
            r: c.
            toAdd do: [| :el | r: r append: el].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: conversions\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         asByteVector = ( |
            | byteVector    copyContaining: asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: conversions\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         asList = ( |
            | 
            prependIntoGrowable: list By: [|:r. :e| r addFirst: e element]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: conversions\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
            | mutableString copyContaining: asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: conversions\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         asVMByteVector = ( |
            | asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: conversions\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         asVector = ( | {
                 'ModuleInfo: Module: collector InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: vector copySize: index succ.
            reverseDo: [|:this|  r at: this index Put: this element].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: flattening\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: private'
        
         computeFlatSizeHint = ( |
             this.
             total <- 0.
            | 
            this: self.
            [this isNil] whileFalse: [
                this flatSizeCache 
                    ifNotNil: [ ^ total + this flatSizeCache ].
                total: total + this element size.
                this: this previous.
            ].
            total).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFirst: el = ( |
            | collector clone element: el).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: flattening\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         flatByteVector = ( |
            | 
            flattenIntoIndexable: byteVector    MapBy: [|:e| e asByte]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: flattening\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         flatList = ( |
            | 
            prependIntoGrowable: list By: [|:r. :e| r addAllFirst: e element]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: flattening\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         flatSet = ( |
            | 
            prependIntoGrowable: list By: [|:r. :e| r addAll:      e element]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: flattening\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         flatSizeHint = ( |
            | 
            flatSizeCache: computeFlatSizeHint.
            flatSizeCache).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: flattening\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         flatString = ( |
            | 
            flattenIntoIndexable: mutableString MapBy: [|:e| e asByte]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: flattening\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: public'
        
         flatVector = ( |
            | 
            flattenIntoIndexable: vector        MapBy: [|:e| e       ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: flattening\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: private'
        
         flattenIntoIndexable: proto MapBy: mapBlock = ( |
             start.
             v.
            | 
            start: realFlatSize.
            v: proto copySize: start.
            reverseDo: [|:this. c|
                c: this element.
                start: start - c size.

                "hack: worth 37% improvement on the following test:
                    a: collector copyFirst: 1 asVector.
                    10000 do: [ a: a & 1 asVector].
                    _Scavenge. [a flatVector] realTime"

                0 upTo: c size Do: [| :i |
                    v at: start + i Put: mapBlock value: c at: i.
                ].
            ].
            v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: private'
        
         prependIntoGrowable: proto By: prependBlock = ( | {
                 'ModuleInfo: Module: collector InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: proto copyRemoveAll.
            reverseDo: [|:e| prependBlock value: r With: e].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: flattening\x7fModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: private'
        
         realFlatSize = ( |
             this.
             total <- 0.
            | 
            this: self.
            [this isNil] whileFalse: [
                total: total + this element size.
                this: this previous.
            ].
            total).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: private'
        
         reverseDo: doBlock = ( |
             this.
            | 
            this: self.
            [this isNil] whileFalse: [
                doBlock value: this.
                this: this previous.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'ModuleInfo: Module: collector InitialContents: FollowSlot\x7fVisibility: private'
        
         statePrintString = ( |
            | index succ printString, ' elements').
        } | ) 



 '-- Side effects'

 globals modules collector postFileIn
