 'Sun-$Revision: 30.12 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         isAnnotation = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: annotations\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         annotation = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'annotation' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals annotation.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         hashValue <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: annotations\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         annotation = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits annotation.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'annotation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot'
        
         annotation = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'annotation' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'annotation' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules annotation.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot'
        
         myComment <- '\'

            NOTES: msgs send to annotations: 

            obj annotation sent parse in mirror.self
            slot anno sent parse in slot.self, could be anno obj?
            fakeSlot sends parse: to slotAnno

            slot anno sent asString in slot.self
            slot anno sent printStringFor: in slot.self

            traits annotations cachedSlotAnnotation sent releaseObjects in systemOddballs.self

            issue: asString vs: storeString

            \''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.12 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         = a = ( |
            | 
            == a ifTrue: [^ true].
            fieldValues = a fieldValues).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Comment: just used for slot annotations for now\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         annotationSeparator = '\x7f'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
            | asStringFilterBy: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: prefixes\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         asStringFilterBy: filterBlock = ( | {
                 'ModuleInfo: Module: annotation InitialContents: FollowSlot'
                
                 r <- ''.
                } 
            | 
            "convert to string, checking each field with filterBlock"
            fields do: [|:f|
                (has: f) && [filterBlock value: f] ifTrue: [
                    r: (r isEmpty ifTrue: '' False: [r, annotationSeparator]),
                       (getPrefixedField: f).
                ]. 
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: filtering\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForCopyDownTest = ( |
            | copyWithoutFields: fieldsToIgnoreForCopyDownTest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: prefixes\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         copyForField: f SetTo: x = ( |
            | 
            'copyFor', f capitalize, ':' 
              sendTo: self 
                With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: filtering\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         copyWithoutFields: fieldsToOmit = ( |
            | 
            "copy me and omit field names in fieldsToOmit"
            == prototype ifTrue: [self] False: [
                | r |
                r: copy.
                fieldsToOmit do: [|:f|
                    r: r copyForField: f SetTo: prototype getField: f.
                ].
                r
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: filtering\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         filterForFilingOut = ( |
            | copyWithoutFields: fieldsToNotFileOut).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: prefixes\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         getField: f = ( |
            | "public for annotationButtonMixin" f sendTo: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: prefixes\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         getPrefixedField: f = ( |
             p.
             r.
            | 
            "get field, and prepend prefix"
            "If field is compound (has anno seps in it) add mult prefixes"
            p: prefixFor: f.
            p: p, ' '.
            r: collector copyFirst: p.
            (fieldsToParse includes: f) 
              ifTrue: [r: r & (getStringForParsedField: f)]
               False: [ | field |
                 field: getField: f.
                 field do: [|:c|
                   r: r & c.
                   "This handles things like category..."
                   c = annotationSeparator ifTrue: [r: r & p].
               ].
            ].
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: prefixes\x7fModuleInfo: Module: annotation InitialContents: FollowSlot'
        
         getStringForParsedField: f = ( |
            | 
            (getField: f) asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: prefixes\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         has: name = ( |
            | 
             "used in annotationButtonMixin"
            (name sendTo: prototype ) != (name sendTo: self)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            hashValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: prefixes\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         isAnnotation = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: prefixes\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         parse: aStringOrAnnotation = ( |
            | 
            parse: aStringOrAnnotation IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         parse: s Field: f SetUnparsedPart: upBlk IfFail: fb = ( |
             new <- ''.
             old <- ''.
             prefix <- ''.
             res.
             start <- 0.
             stop <- 0.
            | 
            prefix: prefixFor: f.
            "if s starts with prefix, skip blanks after prefix and
             parse subsequent part of string up to slotAnnoSep.
            return new ann obj, and use block to return yet-to-be-parsed part"

             (prefix isPrefixOf: s) ifFalse: [upBlk value: s. ^self].

             start: [|:e|
                 prefix size upTo: s size Do: [|:i|
                     ' ' = (s at: i) ifFalse: [e value: i].
                 ].
                 s size
             ] exitValue.

             stop: [|:e|
                 start upTo: s size Do: [|:i| 
                     annotationSeparator = (s at: i) ifTrue: [e value: i].
                 ].
                 s size
             ] exitValue.

             old: getField: f.
             new: s copyFrom: start UpTo: stop.
             res: copyForField: f SetTo:
                 case if:   (fieldsToParse includes: f) 
                      Then: [parseContentsOfField: f OldValue: old String: new IfFail: [|:e| ^ fb value: e]]
                      If:   [old isEmpty]               
                      Then: [new]
                      Else: [old, annotationSeparator, new].

             upBlk value:  stop = s size ifTrue: '' False: [s copyFrom: stop succ].
             res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: prefixes\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         parse: aStringOrAnnotation IfFail: fb = ( |
            | 
            "parse is the opposite of asString, & it handles already-parsed things"
            aStringOrAnnotation isAnnotation 
                ifTrue: [              aStringOrAnnotation ]
                 False: [ parseString: aStringOrAnnotation IfFail: fb]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         parseContentsOfField: f OldValue: old String: new IfFail: fb = ( |
            | 
            old parse: new IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         parseString: aString IfFail: fb = ( | {
                 'ModuleInfo: Module: annotation InitialContents: FollowSlot'
                
                 r.
                }  {
                 'ModuleInfo: Module: annotation InitialContents: FollowSlot'
                
                 unparsedPart <- ''.
                } 
            | 
            "return a slot annotation object for this string"
            unparsedPart: aString.
            r: copy.
            [ | :exit. s |
                s: unparsedPart size.

                fields do: [|:f|
                  r: r parse: unparsedPart   
                       Field: f 
                       SetUnparsedPart: [|:up| unparsedPart: up]
                       IfFail: [|:e| ^ fb value: e].
               ].
               unparsedPart isEmpty ifTrue: exit.

               s = unparsedPart size ifTrue: [
                    ^ fb value: 'Could not parse: ', unparsedPart
                ].
            ] loopExit.
            "simple optimization: return prototype if possible.
             Without this, fastTransporter files out forever cause
             annotations are always new objects and do not converge
             -- dmu 4/93"
            r = prototype ifTrue: [prototype] False: [r]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: prefixes\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         prefixFor: name = ( |
            | name capitalize, ':').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         setHash = ( |
            | 
            hashValue: 
              (fields copyMappedBy: [|:f| (getField: f) hash])
                reduceWith: [|:f1. :f2| f1 ^^ f2] IfSingleton: [|:f| f].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         statePrintString = ( |
            | asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            kindOfAnnotation, 
            'Annotation parse: ',  
            storeStringOfContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringNeeds = ( |
            | prototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'annotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringOfContents = ( |
            | asString canonicalize storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: annotations\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         objectAnnotation = bootstrap define: bootstrap stub -> 'globals' -> 'objectAnnotation' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'hashValue' From:
             bootstrap remove: 'parent' From:
             globals annotation copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'objectAnnotation' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals objectAnnotation.

CopyDowns:
globals annotation. copy 
SlotsToOmit: hashValue parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         hashValue <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: annotations\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         objectAnnotation = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits objectAnnotation.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'objectAnnotation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         protectedComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         protectedIsComplete <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         protectedModuleInfo <- bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'objectInfo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: annotations\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         slotAnnotation = bootstrap define: bootstrap stub -> 'globals' -> 'slotAnnotation' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'hashValue' From:
             bootstrap remove: 'parent' From:
             globals annotation copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotAnnotation' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotAnnotation.

CopyDowns:
globals annotation. copy 
SlotsToOmit: hashValue parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         hashValue <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: annotations\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         cachedSlotAnnotation = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits cachedSlotAnnotation.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         protectedCategory <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         protectedComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         protectedFile <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         protectedModuleInfo <- bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> 'slotInfo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         protectedVisibility <- bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: private'
        
         canonicalSlotAnnotations = set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         canonize = ( |
            | 
            "preserve hashes by making cached ones immutable"
                canonicalSlotAnnotations 
                  if: self IsPresentDo: [|:a| a] 
                           IfAbsentPut: [self] AndDo: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         canonizeAll = ( |
            | 
            "called before GC, canonize all slot annotations"
            browse all do: [|:m. new | 
              new: m.
              m do: [|:s| 
                new: (
                  (new at: s name) copyHolderForAnnotation: s annotation IfFail: [s]
                ) holder.
              ].
              m frozenDefine: new IfFail: [].
            ].  
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: accessing protected slots\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         categories = ( |
            | 
            convertCategoryStringToList: category).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: accessing protected slots\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         category = ( |
            | protectedCategory).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: accessing protected slots\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         comment = ( |
            | protectedComment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: category lists and strings\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         convertCategoryListToString: c = ( |
             r <- ''.
            | 
            "for adding new categories, be carefull about vector with empty string"
            c    doFirst: [|:e| r: e isEmpty ifTrue: [annotationSeparator] False: [e]]
              MiddleLast: [|:e| r: r, annotationSeparator, e].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: category lists and strings\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         convertCategoryStringToList: cat = ( |
             index.
             l.
            | 
            index: 0.
            l: list copyRemoveAll.
            cat isEmpty ifTrue: [ ^ l ].
            cat do: [|:c. :position |
              annotationSeparator = c ifTrue: [
                l add: cat copyFrom: index UpTo: position.
                index: position succ.
            ]].
            l add: cat copyFrom: index UpTo: cat size.
            l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: changing protected slots\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForCategories: c = ( |
            | 
            copyForCategory: convertCategoryListToString: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: changing protected slots\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForCategory: x = ( |
            | 
            (copy protectedCategory: (x value: category) canonicalize) setHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: changing protected slots\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForComment: x = ( |
            | (copy protectedComment:    x value: comment) setHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: changing protected slots\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForFile: x = ( |
            | (copy protectedFile:       x value: file) setHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: changing protected slots\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForModuleInfo: x = ( |
            | 
            (copy protectedModuleInfo: x value: moduleInfo) setHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: changing protected slots\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForVisibility: v = ( |
            | (copy protectedVisibility: v value: visibility) setHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: accessing protected slots\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         file = ( |
            | protectedFile).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: category lists and strings\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         isCategoryString: s1 PrefixOf: s2 = ( |
            | 
            "optimizes outliners"
            s1 isEmpty ifTrue: [^ true].
            (s1 isPrefixOf: s2) ifFalse: [^ false].
            (s2 at: s1 size IfAbsent: [^ true])  =  annotationSeparator).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: accessing protected slots\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleInfo = ( |
            | protectedModuleInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: annotations\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         slotAnnotation = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotAnnotation' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotAnnotation.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotAnnotation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         parse: aStringOrSlotAnnotation = ( |
            | 
            (resend.parse: aStringOrSlotAnnotation) canonize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         parseCache = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         parseString: s IfFail: fb = ( |
            | "see if string is in parse cache"
            [
            " cannot use following because resend of parseString side-effects
              parseCache -- dmu"

              parseCache if: s
                  IsPresentDo: [|:a| a] "yes, return parsed anno"
                  IfAbsentPut: [resend.parseString: s       
                                            IfFail: [|:e| ^ fb value: e]
                ] AndDo:       [|:a| a] "return new anno".
            ].
            parseCache if: s
                IsPresentDo: [|:a| a] "yes, return parsed anno"
                 IfAbsentDo: [| a | 
                    a: resend.parseString: s IfFail: [|:e| ^ fb value: e].
                    parseCache at: s Put: a.
                    a ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         releaseObjects = ( |
            | 
            parseCache removeAll. 
            canonicalSlotAnnotations removeAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cachedSlotAnnotation' -> () From: ( | {
         'Category: accessing protected slots\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         visibility = ( |
            | protectedVisibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'Category: accessing fields\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         comment = ( |
            | protectedComment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'Category: compatibility for parsing\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForComment: blk = ( |
            | 
            (copy protectedComment: blk value: comment) setHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'Category: compatibility for parsing\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForIsComplete: blk = ( |
            | 
            (copy protectedIsComplete: blk value: isComplete) setHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'Category: compatibility for parsing\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForModuleInfo: blk = ( |
            | 
            (copy protectedModuleInfo: blk value: moduleInfo) setHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'Comment: Optimization: comparing annotations is slow because of
all the performs. Make sure to keep this is sync with
fields. -- Adam & Alex, 5/04\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         fieldValues = ( |
            | 
            (comment & moduleInfo & isComplete) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'Comment: fields must be in order of comparison significance

Make sure to keep this is sync with fieldValues. -- Adam & Alex, 5/04\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         fields = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: traits objectAnnotation fields.
'.
                    | ) ) _Clone: 3 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'traits' -> 'objectAnnotation') \/-> 'fields') -> () _At: 0 Put: (
     'comment')

 ((bootstrap stub -> 'traits' -> 'objectAnnotation') \/-> 'fields') -> () _At: 1 Put: (
     'moduleInfo')

 ((bootstrap stub -> 'traits' -> 'objectAnnotation') \/-> 'fields') -> () _At: 2 Put: (
     'isComplete')

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         fieldsToIgnoreForCopyDownTest = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: traits objectAnnotation fieldsToIgnoreForCopyDownTest.
'.
                    | ) ) _Clone: 2 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'traits' -> 'objectAnnotation') \/-> 'fieldsToIgnoreForCopyDownTest') -> () _At: 0 Put: (
     'moduleInfo')

 ((bootstrap stub -> 'traits' -> 'objectAnnotation') \/-> 'fieldsToIgnoreForCopyDownTest') -> () _At: 1 Put: (
     'isComplete')

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         fieldsToNotFileOut = ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         fieldsToParse = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: traits objectAnnotation fieldsToParse.
'.
                    | ) ) _Clone: 2 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'traits' -> 'objectAnnotation') \/-> 'fieldsToParse') -> () _At: 0 Put: (
     'moduleInfo')

 ((bootstrap stub -> 'traits' -> 'objectAnnotation') \/-> 'fieldsToParse') -> () _At: 1 Put: (
     'isComplete')

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'Category: parsing & unparsing isComplete\x7fModuleInfo: Module: annotation InitialContents: FollowSlot'
        
         getStringForParsedField: f = ( |
            | 
            f = 'isComplete'
              ifFalse: [resend.getStringForParsedField: f]
                 True: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'Category: accessing fields\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         isComplete = ( |
            | protectedIsComplete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         kindOfAnnotation = 'object'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'Category: accessing fields\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleInfo = ( |
            | protectedModuleInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'annotation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'Category: parsing & unparsing isComplete\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         parseContentsOfField: f OldValue: old String: new IfFail: fb = ( |
            | 
            f = 'isComplete' 
              ifTrue: [ true]
               False: [ resend.parseContentsOfField: f OldValue: old String: new IfFail: fb]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | objectAnnotation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         setModuleInfoBy: blk = ( |
            | 
            protectedModuleInfo: blk value: moduleInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotAnnotation' -> () From: ( | {
         'Comment: Optimization: comparing annotations is slow because of
all the performs. Make sure to keep this is sync with
fields. -- Adam & Alex, 5/04\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         fieldValues = ( |
            | 
            (category & comment & file & moduleInfo & visibility) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotAnnotation' -> () From: ( | {
         'Comment: fields must be in order of comparison significance

Make sure to keep this is sync with fieldValues. -- Adam & Alex, 5/04\x7fModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         fields = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: traits slotAnnotation fields.
'.
                    | ) ) _Clone: 5 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x _At: 3  Put: ().
             x _At: 4  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'traits' -> 'slotAnnotation') \/-> 'fields') -> () _At: 0 Put: (
     'category')

 ((bootstrap stub -> 'traits' -> 'slotAnnotation') \/-> 'fields') -> () _At: 1 Put: (
     'comment')

 ((bootstrap stub -> 'traits' -> 'slotAnnotation') \/-> 'fields') -> () _At: 2 Put: (
     'file')

 ((bootstrap stub -> 'traits' -> 'slotAnnotation') \/-> 'fields') -> () _At: 3 Put: (
     'moduleInfo')

 ((bootstrap stub -> 'traits' -> 'slotAnnotation') \/-> 'fields') -> () _At: 4 Put: (
     'visibility')

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         fieldsToIgnoreForCopyDownTest = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: traits slotAnnotation fieldsToIgnoreForCopyDownTest.
'.
                    | ) ) _Clone: 2 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'traits' -> 'slotAnnotation') \/-> 'fieldsToIgnoreForCopyDownTest') -> () _At: 0 Put: (
     'file')

 ((bootstrap stub -> 'traits' -> 'slotAnnotation') \/-> 'fieldsToIgnoreForCopyDownTest') -> () _At: 1 Put: (
     'moduleInfo')

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         fieldsToNotFileOut = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: traits slotAnnotation fieldsToNotFileOut.
'.
                    | ) ) _Clone: 1 Filler: 0| 
             x _At: 0  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'traits' -> 'slotAnnotation') \/-> 'fieldsToNotFileOut') -> () _At: 0 Put: (
     'file')

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         fieldsToParse = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: traits slotAnnotation fieldsToParse.
'.
                    | ) ) _Clone: 2 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'traits' -> 'slotAnnotation') \/-> 'fieldsToParse') -> () _At: 0 Put: (
     'moduleInfo')

 ((bootstrap stub -> 'traits' -> 'slotAnnotation') \/-> 'fieldsToParse') -> () _At: 1 Put: (
     'visibility')

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         kindOfAnnotation = 'slot'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'annotation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringFor: str = ( |
            | 
            == slotAnnotation ifTrue: [str] False: [
              '{ ', storeStringOfContents, '\n',
                 ((textLines copyLines: str) indent: 2) asString,
              '\n}'
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotAnnotation' -> () From: ( | {
         'ModuleInfo: Module: annotation InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | slotAnnotation).
        } | ) 



 '-- Side effects'

 globals modules annotation postFileIn
