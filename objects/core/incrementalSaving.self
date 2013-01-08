 '$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot'
        
         incrementalSaving = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'incrementalSaving' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'incrementalSaving' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules incrementalSaving.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'incrementalSaving' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'incrementalSaving' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'incrementalSaving' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'incrementalSaving' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'incrementalSaving' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: incremental changes\x7fModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: public'
        
         adder = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleDictionary adder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: InitializeToExpression: (false)\x7fVisibility: publicReadPrivateWrite'
        
         areOrphansChanged <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: publicReadPrivateWrite'
        
         changedModules <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: private'
        
         collectOrphan: s = ( |
            | areOrphansChanged: true.
            resend.collectOrphan: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: private'
        
         collectSlot: s InModule: mod = ( |
            | 
            changedModules add: mod.
            mod addedOrChangedSlots add: s.
            resend.collectSlot: s InModule: mod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleDictionary adder parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> 'parent' -> () From: ( | {
         'Comment: non-recursive collect
An optimization--called when I know it is just this slot.\x7fModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: public'
        
         collectModuleOfSlot: s = ( |
             m.
            | 
            m: s module.
            (includesKey: m) ifFalse: [^ self].
            addDirtyModules: 
             ( copy  collectSlot: s InModule: at: m ) changedModules).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> 'parent' -> () From: ( | {
         'Comment: called from defineAndSave:

Sent to transporter moduleDictionary adder if s has been added or changed,
sent to transporter moduleDictionary remover if s is about to be removed.

This message incrementally updates the module dictionary (cached of changed modules,
and slot module membership).\x7fModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: public'
        
         collectModulesAffectedBySlot: s = ( |
            | 
            copy collectSlotsFrom: s isAssignment ifFalse: [s] True: [s correspondingDataSlot]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: private'
        
         collectSlotsFrom: aSlot = ( |
            | 
            resend.collectSlotsFrom: aSlot.
            addDirtyModules: changedModules).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone changedModules: changedModules copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: incremental changes\x7fModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: public'
        
         remover = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'remover' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleDictionary remover.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'remover' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: InitializeToExpression: (false)\x7fVisibility: publicReadPrivateWrite'
        
         areOrphansChanged <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'remover' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: publicReadPrivateWrite'
        
         changedModules <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'remover' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: private'
        
         collectOrphan: s = ( |
            | areOrphansChanged: true.
            cachedOrphans remove: s IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'remover' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: private'
        
         collectSlot: s InModule: mod = ( |
            | 
            changedModules add: mod.
            mod removedSlotPaths add: s holder creatorPath extendedBy: s name.
            mod cachedSlots remove: s IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'remover' -> () From: ( | {
         'ModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: incremental changes\x7fModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: public'
        
         compareSlotsTo: newMir Removed: removedNames Changed: changedNames Added: addedNames = ( |
             nSize <- 0.
             oSize <- 0.
            | 
            addedNames addAll: newMir names.
            " compute delta"
            keys asVector sortedDo: [|:n. | 
              "sort ensures data slots precede assignment slots"
              [|:exit|
                addedNames remove: n  IfAbsent: [removedNames add: n.  exit value].
                ((at: n) couldBeACopyOf: newMir at: n)  ifFalse: [ changedNames add: n].
              ] exit.
            ].

            "must also handle indexable slots, now, too"

            oSize:        isReflecteeVector ifFalse: 0 True: [       reflecteeSize].
            nSize: newMir isReflecteeVector ifFalse: 0 True: [newMir reflecteeSize].

            case 
             if: [oSize < nSize] Then: [  oSize upTo: nSize Do: [ |:i|   addedNames add: i storeString ] ]
             If: [oSize > nSize] Then: [  nSize upTo: oSize Do: [ |:i| removedNames add: i storeString ] ].
            0 upTo: (oSize min: nSize) Do: [|:i|                       changedNames add: i storeString ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: incremental changes\x7fModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: public'
        
         defineAndSave: oldMir = ( |
            | defineAndSave: oldMir IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: incremental changes\x7fModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: public'
        
         defineAndSave: newMir IfFail: fb = ( |
             added.
             adder = bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'adder' -> ().
             changed.
             changedOnlyAnno.
             newSlots.
             removed.
             remover = bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> 'remover' -> ().
            | 

            isReflecteeMethod ifTrue: [
              frozenDefine: newMir IfFail: [|:e| ^ fb value: e].
              "since we don't keep creator info for methods, have
               to do this the hard way."
              wellKnownReferencesOfReflectee do: [|:s|
                remover collectModulesAffectedBySlot: s.
                adder   collectModulesAffectedBySlot: s.
              ].
            ].

            "Here is a quick test to see if the object is even going to be filed out.
             If it is not, can skip comparing individual slots etc.
             In order to be filed out the object must be 'created' in a slot
             that is actually filed out; hence the creatorSlot test.
             However, this can change if its annotation changes, so we must
             guard this optimization with the annotation test.
            "
            newMir annotation  =  annotation  ifTrue: [
              creatorSlotIfPresent: [] IfAbsent: [
                ^ frozenDefine: newMir IfFail: fb.
              ].
            ].

                  ( type = newMir type )  
            &&  [ ( type = 'slots' ) "could change non-slot info like code"
            &&  [   annotation = newMir annotation ]]  ifFalse: [
              creatorSlotIfPresent: [|:s| remover collectModulesAffectedBySlot: s] 
                          IfAbsent: [].
              frozenDefine: newMir IfFail: [|:e| ^ fb value: e].
              creatorSlotIfPresent: [|:s| adder collectModulesAffectedBySlot: s] 
                          IfAbsent: [].
            ^ self.
            ].

            added:   set copyRemoveAll.
            changed: set copyRemoveAll.
            removed: set copyRemoveAll.

            newSlots: list copyRemoveAll.

            compareSlotsTo: newMir Removed: removed Changed: changed Added: added.

            changedOnlyAnno: list copyRemoveAll.
            changed copy do: [|:n. so. sn. |
              so: at: n.
              sn: newMir at: n.
              so contents = sn contents  ifTrue: [
                "optimized! contents same so no need to recurse in remover/adder"
                changedOnlyAnno add: n.
                changed remove: n.
              ].
            ].

            "collect modules affected by removal"

            removed         do: [|:n |  remover collectModulesAffectedBySlot:  at: n ].
            changed         do: [|:n |  remover collectModulesAffectedBySlot:  at: n ].
            changedOnlyAnno do: [|:n |  remover collectModuleOfSlot:           at: n].

            frozenDefine: newMir IfFail: [|:e|  
                removed         do: [|:n |  adder collectModulesAffectedBySlot:  at: n ].
                changed         do: [|:n |  adder collectModulesAffectedBySlot:  at: n ].
                changedOnlyAnno do: [|:n |  adder collectModuleOfSlot:           at: n ].
              ^ fb value: e.
            ].
            added           do: [|:n |  adder collectModulesAffectedBySlot:  at: n ].
            changed         do: [|:n |  adder collectModulesAffectedBySlot:  at: n ].
            changedOnlyAnno do: [|:n |  adder collectModuleOfSlot:           at: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming timestamp\x7fModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: public'
        
         freezingTimestamp = ( |
            | programmingTimestamp - freezeDelta).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming timestamp\x7fModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: public'
        
         programmingTimestamp: i = ( |
            | 
            programmingTimestamp: i IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming timestamp\x7fModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: public'
        
         programmingTimestamp: i IfFail: fb = ( |
            | i _SetProgrammingTimestampIfFail: [|:e| ^ fb value: e].  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: incremental changes\x7fModuleInfo: Module: incrementalSaving InitialContents: FollowSlot\x7fVisibility: private'
        
         wellKnownReferencesOfReflectee = ( |
            | 
            browseWellKnown referencesOfReflectee: self).
        } | ) 



 '-- Side effects'

 globals modules incrementalSaving postFileIn
