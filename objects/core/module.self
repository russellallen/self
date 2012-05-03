 'Sun-$Revision: 30.19 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         < m = ( |
            | 
            nameOrNone < m nameOrNone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         = m = ( |
            | 
            == m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         absolutePath = ( |
            | bootstrap selfObjectsWorkingDir, '/', partialPath).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: nesting modules\x7fComment: Add a submodule (if it is not already there). 
It becomes the last submodule. \x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         addSubpart: submodule = ( |
            | 
            (subparts includes: submodule) ifFalse: [
                subparts: subparts asList copy addLast: submodule
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: nesting modules\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         allSubparts = ( |
             r.
            | 
            r: list copyRemoveAll.
            postorderDo: [|:m| r add: m].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         alwaysRefill = ( |
            | 
            transporter moduleDictionary alwaysRefill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         annotate = ( |
            | 
            transporter annotator annotateModule: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         annotatedPaths = ( |
            | 
            "return paths annotated for transport"
            [annotate. isCurrent] whileFalse.
            paths).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: conversion\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         asModule = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: conversion\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
            | name "for checkPresenceOfModule").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: file times\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         beAsNewAsFile = ( |
            | 
            fileInTime: fileModificationTime).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: dirtyness\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         beClean = ( |
            | removedSlotPaths removeAll.
            addedOrChangedSlots removeAll.
            transporter moduleDictionary updateDirtyModules.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: currency\x7fComment: Use VM timestamp to avoid useless refilling xxx duplicated\x7fModuleInfo: Module: module InitialContents: FollowSlot'
        
         beCurrent = ( |
            | 
            savedTimestamp:  mirrors mirror freezingTimestamp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: dirtyness\x7fComment: mark me as needing to be filed out\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         beDirty = ( |
             m.
             n <- 'fisk'.
            | 
            m: asMirror.
            "fool module system into thinking module is changed"
            [m includesKey: n] whileTrue: [n: n, '_and_more_fisk_'].
            m at: n PutContents: m.
            ((m at: n) module: name) remove.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: file times\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         beNewerThanFile = ( |
            | 
            fileInTimeString: _CurrentTimeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: currency\x7fComment: Use VM timestamp to avoid useless refilling xxx duplicated\x7fModuleInfo: Module: module InitialContents: FollowSlot'
        
         beObsolete = ( |
            | savedTimestamp:  deliberatelyObsolete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: currency\x7fComment: Use VM timestamp to avoid useless refilling xxx duplicated\x7fModuleInfo: Module: module InitialContents: FollowSlot'
        
         bringUpToDate = ( |
            | 
            savedTimestamp = deliberatelyObsolete ifFalse: [beCurrent].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         cachedPaths = ( |
            | mapSlotsToPaths: cachedSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: reading and writing files\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         canBeFiledOut = ( |
            | 
            (
               ( name = 'init'   )
            || [ name = 'selfrc' ]
            ) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: renaming\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         changeNameTo: newName IfFail: fb = ( |
             changedToExistingModule.
             newModule.
            | 

            changedToExistingModule: transporter moduleDictionary includesKey: newName.

            changedToExistingModule ifFalse: [
              transporter moduleDictionary add: newName.
              newModule: transporter moduleDictionary at: newName.
              newModule comment: comment.
              newModule directory: directory.
              newModule fileInTimeString: fileInTimeString.
              newModule subparts: subparts.
            ]
            True: [
              (userQueryMorph askYesNo: 'Module ', newName, ' already exists.\n',
                                        'Merge my slots and subparts into it?'
                                 Event: process this birthEvent)
                ifFalse: [^ fb value: newName, ' already exists'].
              newModule: transporter moduleDictionary at: newName.
              newModule comment: newModule comment, '\n', comment.
              newModule subparts: newModule subparts, subparts.
            ].
            interestingSlots  do: [|:s| s module: newName].
            changedToExistingModule ifFalse: [
              newModule swapOwnersWith: self
            ].
            newModule).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         checkModuleMembershipInvariants = ( |
            | cachedSlots do: [|:s| [isWorthCaching: s] assert.].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: time stamps on files\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         checkTimeStampsIfFail: fb = ( |
            | 
            fileInTime < fileModificationTime ifTrue: [
              ^ fb value: 'Module "', name, '" has a newer source file'.
            ].
            fileInTime < tmpFileModificationTime ifTrue: [
              ^ fb value: 'Module "', name, '" has a newer temporary file;
                        it seems that another process is currently filing it out'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         chunk: s Eating: eats = ( |
             chunk.
             chunks.
             i <- 0.
            | 
            "fundamental parse routine. Given a string s of tokens delimited by
                 the characters in eats, return a list of strings, one string for
                 each token"
            chunks: list copyRemoveAll.
            [
                [eats includes:   s at: i IfAbsent: [^chunks]  ]
                    whileTrue: [i: i succ].
                chunk: s at: i.
                i: i succ.
                [eats includes:   s at: i IfAbsent: [^ chunks addLast: chunk] ]
                    whileFalse: [chunk: chunk, (s at: i).  i: i succ].
                chunks addLast: chunk.
                i: i succ.
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         comment = ( |
            | myComment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         comment: c = ( |
            | 
            "canonicalize so it files out properly --dmu 4/1"
            myComment: c asString canonicalize.
            beDirty "need to file me out").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            (( resend.copy
               cachedSlots: cachedSlots copy)
               addedOrChangedSlots: addedOrChangedSlots copy)
               removedSlotPaths:    removedSlotPaths    copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: currency\x7fComment: Use VM timestamp to avoid useless refilling xxx duplicated\x7fModuleInfo: Module: module InitialContents: FollowSlot'
        
         deliberatelyObsolete = -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         empty = ( |
            | 
            cachedSlots: cachedSlots copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: reading and writing files\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         fileIn = ( |
             a.
            | 
            isClean ifTrue: [
              bootstrap read: name From: directory.
              initCachedSlots.
             ^ self.
            ].

            " 
              There is a bit of sublety here.
              If the module is dirty reading it will restore
              removed slots, but will not remove added slots
              (because the transporter uses _AddSlots in files
               to allow more than one file to contribute slots
               to the same object).

              So, preserve addedOrChangedSlots in module.
            "
            (userQuery askYesNo: 
              printString,
              ' has unsaved changes;',
              ' reading it in will restore removed slots',
              ' but will not remove added slots.\n',
              'Proceed?') ifFalse: [^self].
            a: addedOrChangedSlots.
            bootstrap read: name From: directory.
            initCachedSlots.
            addedOrChangedSlots: a.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: time stamps on files\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         fileInTime = ( |
            | time copyFromString: fileInTimeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: time stamps on files\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         fileInTime: t = ( |
            | fileInTimeString: t printString canonicalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: time stamps on files\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         fileModificationTime = ( |
            | 
            fileModificationTimeOf: fileName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: time stamps on files\x7fModuleInfo: Module: module InitialContents: FollowSlot'
        
         fileModificationTimeOf: name = ( |
             s.
             t.
            | 
            s: os stat: name IfFail: [^time origin].
            t: s mtime.
            s kill.
            t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         fileName = ( |
            | absolutePath, name, '.self').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: reading and writing files\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         fileOut = ( |
            | 
            transporter fileOut fileOutModule: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: currency\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         filedMeIn = ( |
            | transporter moduleDictionary filedIn: name. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: nesting modules\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         hasSubparts = ( |
            | 
            subpartNames isEmpty ifTrue: [^ false].
            subparts isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | identityHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fComment: Return the holders of my slots.\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         holders = ( |
             s.
            | 
            s: set copyRemoveAll.
            slots do: [|:ss| s add: ss holder].
            s asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         initCachedSlots = ( |
            | 
            cachedSlots: sequence copyRemoveAll.

            "hack:
            because of bootstrapping, this must
            be initialized to empty vector instead
            of empty set, so listify if needed"
            "else do not empty, to maintain dirty info
             in the face of cache filling"

            addedOrChangedSlots asMirror isReflecteeVector ifTrue: [ 
              addedOrChangedSlots: set copyRemoveAll.
              removedSlotPaths:    set copyRemoveAll.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         initialize = ( |
            | 
            myComment: ''.
            directory: ''.
            "Concatenate the strings so keep RCS from
            replacing it with the revision number for
            this very file!"
            revision: ('$', 'Revision:$') canonicalize.
            subparts: vector.
            asMirror addSlots: reflect: postFileInProto.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         interestingHolders = ( |
             s.
            | 
            s: set copyRemoveAll.
            interestingSlots do: [|:ss| s add: ss holder].
            s asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         interestingSlots = ( |
            | 
            slotsFilteredBy: [|:s|
                  (s contents !=  asMirror)
              &&  [s holder   !=  asMirror]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: dirtyness\x7fComment: answer true if this module contains no unsaved changes\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         isClean = ( |
            | 
                 addedOrChangedSlots isEmpty
            && [ removedSlotPaths    isEmpty ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: currency\x7fComment: Use VM timestamp to avoid useless refilling xxx duplicated\x7fModuleInfo: Module: module InitialContents: FollowSlot'
        
         isCurrent = ( |
            | 
            savedTimestamp = mirrors mirror freezingTimestamp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: dirtyness\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         isDirty = ( |
            | 
            isClean not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: currency\x7fComment: Use VM timestamp to avoid useless refilling xxx duplicated\x7fModuleInfo: Module: module InitialContents: FollowSlot'
        
         isObsolete = ( |
            | isCurrent not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         isWorthCaching: s = ( |
            | 
            transporter moduleDictionary isWorthCaching: s ForModuleName: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fComment: Each slot in slots (a set) must have a holder for which a creatorPath exists
Otherwise, the returned set will include nullPath.\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         mapSlotsToPaths: slots = ( |
            | 
            slots copyMappedBy: [|:s. | 
              s holder creatorPathIfPresent: [|:p| p extendedBy: s name]
                                   IfAbsent: [ error: 'No creator path for holder of slot "', s name, '"\nin object: ',
                                                       s holder name, ', module: ', name]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | 
            nameIfAbsent: [error: 'module object: ', objectID, ' has no name ']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         nameIfAbsent: failBlock = ( |
            | 
            (reflect: self) creatorSlotIfPresent: [|:s| s name ] IfAbsent: [
              "Fallback strategy; enumerate all slots in 'modules'"
              (reflect: modules) findFirst: [|:s| s contents = (reflect: self)]
                                 IfPresent: [|:s| s name]
                                 IfAbsent:  failBlock
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         nameOrNone = ( |
            | 
            nameIfAbsent: 'noName').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         oldFileName = ( |
            | absolutePath, name, '.OLD').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: nesting modules\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         owner = ( |
            | ownerIfPresent: [|:o| o] IfAbsent: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: nesting modules\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         ownerIfPresent: pb = ( |
            | 
            ownerIfPresent: pb IfAbsent: []).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: nesting modules\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         ownerIfPresent: pb IfAbsent: ab = ( |
            | 
            transporter moduleDictionary do: [
              |:m|
              (m subparts includes: self)
                ifTrue: [^ pb value: m]
            ].
            ab value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'orderedClonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         parseLines: s = ( |
            | 
            "Given a string containing one or more lines,
             return a list of strings, one string for each line, eating newlines
             "
            chunk: s Eating: '\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         parseLinesOfWords: s = ( |
            | 
            "Given a string containing one or more lines, each line containing
                 one or more words, return a list containing one list per non-empy line,
                 each of which contains one string per word.
                 "
            (
               (chunk: s Eating: '\n') mapBy: [|:line| parseWordsWithinLines: line]
            ) filterBy: [|:line| line isEmpty not] 
                    Into: list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         parseWordsAcrossLines: s = ( |
            | 
            " higher-level parser. Given a string s of non-blank tokens,
              delimited by white or newlines,
              return list of strings, one per token.
              Any newlines are eaten.
             "
            chunk: s Eating: ' \t\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         parseWordsWithinLines: s = ( |
            | 
            " higher-level parser. Given a string s of non-blank tokens,
              return list of strings, one per token.
              Any newlines are treated as individual tokens.
             "
            chunk: s Eating: ' \t').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         partialPath = ( |
            | 
            directory isEmpty ifTrue: '' False: [ directory, '/' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         paths = ( |
            | mapSlotsToPaths: slots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: resent to\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         postFileIn = ( |
            | 
            scheduler isRunning ifTrue: [filedMeIn].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         postFileInProto = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> 'postFileInProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules init parent postFileInProto.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> 'postFileInProto' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: nesting modules\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         postorderDo: blk = ( |
            | 
            "walk subparts in post-order"
            subparts do: [|:m| m postorderDo: blk].
            blk value: self With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: nesting modules\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         preorderDo: blk = ( |
            | 
            "walk subparts in pre-order"
            blk value: self With: self.
            subparts do: [|:m| m preorderDo: blk].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: time stamps on files\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         printTimeStamps = ( |
            | 
            ('Module: "', name, '".') printLine.
            ('  fileIn time:      ', fileInTime  printString, '.') printLine.
            ('  source file time: ', fileModificationTime printString, '.') printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         refill = ( |
            | 
            isCurrent ifFalse: [ alwaysRefill ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         refillAndProtectDo: blk = ( |
            | 
            transporter moduleDictionary fillingSemaphore protect: [
              refill.
              blk value]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: releasing memory\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         releaseObsoleteAddedOrChangedSlots = ( |
             r.
            | 
            refillAndProtectDo: [
              r: addedOrChangedSlots copyRemoveAll.
              addedOrChangedSlots do: [|:s| 
                (isWorthCaching: s) ifTrue: [
                  r add: s
                ].
              ].
            ].
            addedOrChangedSlots: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: releasing memory\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         releaseObsoleteCachedSlots = ( |
            | 
            "most modules have all good slots"
            "cannot remove bad slots cause hash will have changed, so add back in goodies"
            "optimize by only doing for dirty modules"
            isClean ifTrue: [^ self].
            refillAndProtectDo: [|r|
              r: cachedSlots filterBy: [|:s| isWorthCaching: s] Into: set copyRemoveAll.
              cachedSlots size = r size  ifFalse: [cachedSlots: r asList].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: releasing memory\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         releaseUnusedMemory = ( |
            | 
            releaseObsoleteCachedSlots.
            releaseObsoleteAddedOrChangedSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: nesting modules\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAllSubparts = ( |
            | 
            subparts: vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: nesting modules\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         removeSubpart: aModule = ( |
            | 
            subparts: subparts asList remove: aModule).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         slots = ( |
             r.
            | 
            r: slotsFilteredBy: true.
            cachedSlots: r asSequence.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: caching slots\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsFilteredBy: filterBlock = ( |
             r.
            | 
            "each slot is guaranteed to be traceable: its holder must have
             a valid creator"
            refillAndProtectDo: [
              r: set copyRemoveAll.
              r desiredMinCapacity: cachedSlots size.
              cachedSlots do: [|:s| (filterBlock value: s) && [isWorthCaching: s] ifTrue: [r add: s]].
              r
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: reporting\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsInMeAndAllSubparts = ( |
            | 
            allSubparts gather: [|:m| m slots] Into: list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: reporting\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceLineCount = ( |
             r <- 0.
            | 
            slots do: [|:s|
              r: r succ.
              s contents isReflecteeMethod ifTrue: [
                r: r + s contents source  asTextLines height
              ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: reporting\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceLineCountInMeAndAllSubparts = ( |
             r <- 0.
            | 
            preorderDo: [|:m| r: r + m sourceLineCount].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: nesting modules\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         subparts = ( |
             r.
            | 
            subpartNames isEmpty ifTrue: [^ vector].
            r: (parseWordsAcrossLines: subpartNames) copyMappedBy: [|:n| 
              transporter moduleDictionary at: n].
            r isEmpty ifFalse: [^ r].
            subparts: vector.
            vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: nesting modules\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         subparts: mods = ( |
             r <- ''.
            | 
            mods do: [|:mod| r: r & mod name & '\n'].
            subpartNames: r flatString canonicalize.
            transporter moduleDictionary moduleNestingChanged.
            transporter moduleDictionary adder 
              collectSlot: (asMirror at: 'subpartNames') 
                 InModule: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: nesting modules\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         swapOwnersWith: mod2 = ( |
             i1.
             i2.
             mod1.
             o1.
             o2.
             s1.
             s2.
            | 
            "perserve order in subpart list"
            mod1: self.
            mod1 ownerIfPresent: [|:o| o1: o.  s1: o1 subparts copyMappedBy: [|:m| mod1 = m ifTrue: [mod2] False: [m] ]].
            mod2 ownerIfPresent: [|:o| o2: o.  s2: o2 subparts copyMappedBy: [|:m| mod2 = m ifTrue: [mod1] False: [m] ]].
            o1 ifNotNil: [o1 subparts: s1].
            o2 ifNotNil: [o2 subparts: s2].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: time stamps on files\x7fModuleInfo: Module: module InitialContents: FollowSlot'
        
         tmpFileModificationTime = ( |
            | 
            fileModificationTimeOf: tmpFileName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         tmpFileName = ( |
            | absolutePath, name, '.TMP').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: FollowSlot'
        
         module = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'module' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'module' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules module.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'module' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'module' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'module' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: FollowSlot'
        
         myComment <- 'for annotations'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'module' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            transporter moduleDictionary resetFillingSemaphore.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: transporter moduleDictionary
                           Selector: 'resetFillingSemaphore'.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: transporter moduleDictionary
                           Selector: 'resetLock'.

            memory addThoroughCleanupMessage:
              message copy receiver: transporter moduleDictionary
                           Selector: 'releaseUnusedMemory'.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'module' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.19 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'module' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter moduleDictionary.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: comparing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | == x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: adding\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         add: moduleName = ( |
             mirror.
             slot.
            | 
            "get new module, cannot copy modules init,
             because it does not have the right copy-down
             annotations"

            moduleName size > moduleNameLengthLimit
              ifTrue: [error: '``', moduleName, '\'\' is ', 
                              (moduleName size - moduleNameLengthLimit) printString,
                              ' character(s) too long'].

            moduleName isUncapitalized ifFalse: [
              error: '``', moduleName, '\'\' does not start with a lowercase letter'
            ].

            mirror: reflect: modules module copy initialize.

            "set up module names of new modules slots
             BEFORE installing it to avoid spurious detection
             of additions to modules module"
            mirror do: [|:slot| slot module: moduleName].

            " put new module in name space"
            at: moduleName Put: mirror reflectee.

            " set its creator"
            mirror creatorSlot:  holderMirror at: moduleName.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: incremental changes\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         addDirtyModules: moreDirtyOnes = ( |
            | 
            dirtyModules: (dirtyModules asSet addAll: moreDirtyOnes copyFilteredBy: [|:mod| mod isDirty]) asVector sort.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: fast accessing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         addKey: k Value: newV = ( |
             s.
            | 
            holderMirror at: k PutContents: reflect: newV.
            s: holderMirror at: k.
            s module: k.
            s initialContents: transporter moduleInfo followSlot.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: user queries\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         addModuleNamed: newName = ( |
             m.
             superMod.
             superName.
            | 
            (includesKey: newName) ifTrue: [^ self].
            add: newName.
            m: at: newName.
            superName: getAModuleNameQuestion: 'Add ', newName, ' as submodule of which module?\n',
                                               '(Leave empty for none.)'
                                      Default: ''
                                     IfCancel: ''.
            superName isEmpty ifFalse: [ 
              superMod: at: superName.
              superMod subparts: superMod subparts asList addLast: m. 
            ].
            m directory: userQuery askString: 'In which directory should ', newName, '.self reside?'
                               DefaultAnswer: superName isEmpty 
                                                ifTrue: 'applications'
                                                 False: [ superMod directory ].

            " hack for 4.0 alpha: a mutable string in the directory slot causes problems.
              First, the transporter demands a creator, since mutable strings are mutable.
              Second, the transporter warns about copy-downs in assignable slots;
               I cannot remember why I thought this was not a spurious warning, but do not
               want to remove it 3 days before the release. -- dmu 2/10/95 "
            m directory: m directory canonicalize. 

            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: filling\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         alwaysRefill = ( |
            | 
            fillingSemaphore protect: [
              cachedOrphans          removeAll.
              cachedCopyDownChildren removeAll.
              cachedTopLevelModules: set copyRemoveAll.
              collectSlots.
              "([collectSlots] time /~ 1000) printLine."
              beCurrent.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: annotating\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         annotateAll = ( |
            | transporter annotator annotateAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: currency\x7fComment: Use VM timestamp to avoid useless refilling\x7fModuleInfo: Module: module InitialContents: FollowSlot'
        
         beCurrent = ( |
            | do: [|:m| m beCurrent].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: file times\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         beNewerThanFiles = ( |
            | 
            do: [|:m| m beNewerThanFile].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: currency\x7fComment: Use VM timestamp to avoid useless refilling\x7fModuleInfo: Module: module InitialContents: FollowSlot'
        
         beObsolete = ( |
            | do: [|:m| m beObsolete].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: currency\x7fComment: Use VM timestamp to avoid useless refilling xxx duplicated\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         bringUpToDate = ( |
            | do: [|:m| m bringUpToDate].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: state\x7fComment: dictionary mapping mirrors of copyDownParents to sets of mirrors of their copyDownChildren\x7fModuleInfo: Module: module InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         cachedCopyDownChildren = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: orphans\x7fComment: set of slots that have no modules\x7fModuleInfo: Module: module InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: private'
        
         cachedOrphans = set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: module InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         cachedTopLevelModules <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: sizing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         capacity = ( |
            | infinity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: filling\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         collectOrphan: s = ( |
            | cachedOrphans add: s.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: filling\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         collectSlot: s = ( |
             modNam.
            | 
            "examine anno of slot s and add it to appropiate module"
            modNam: s module.
            modNam isEmpty ifTrue: [^ collectOrphan: s.].
            collectSlot: s InModule: at: modNam).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: filling\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         collectSlot: s InModule: mod = ( |
            | mod cachedSlots addLast: s. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: filling\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         collectSlot: s MirrorsToVisit: toVisit AlreadyQueued: already = ( |
             c.
            | 
            c: s contents.
            c isReflecteeAssignment ifTrue: [^ self].
            s copyDownInfoIfPresent: [^ self] IfAbsent: [].
            (isModuleNameUntransportable: s module) ifTrue: [^ self].

            collectSlot: s.

            c isReflecteeMethod                ifTrue:  [^ self].
            c areReflecteesSlotsMutable        ifFalse: [^ self].
            s isContentsFiledOut               ifFalse: [^ self].
            c storeStringOfReflecteeIfPresent: [^ self] IfAbsent: [].
            c parseAnnotations.                "an optimization"
            c creatorSlotHint = s              ifFalse: [^ self].


            " add c's copy-down parents to
              the cachedCopyDowns dictionary mapping copy-down parents
              to lists of copied-down children"

            c copyDowns isEmpty ifFalse: ["perf hack"
              c copyDowns do: [|:cd|
                (
                  cachedCopyDownChildren 
                    if: cd parentMirror 
                    IsPresentDo: [|:s| s ]
                    IfAbsentPut: [set copyRemoveAll]
                    AndDo: [|:s| s ]
                ) add: c.
              ].
            ].
            already 
              if: c 
              IsPresentDo: [] 
              IfAbsentPut: [ c ] 
              AndDo:       [ toVisit add: c. ].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: filling\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         collectSlots = ( |
            | do: [|:mod| mod initCachedSlots. ].
            collectSlotsFrom: (reflect: lobby) at: 'lobby'.
            warnAnonSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: filling\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         collectSlotsFrom: startSlot = ( |
            | 
            fillingSemaphore protect: [ unsafeCollectSlotsFrom: startSlot ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: printing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'moduleDictionary'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: copy downs\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         copiesOfSlot: aSlot = ( |
             n.
             name.
             r.
            | 
            r: list copyRemoveAll.
            n: list copyRemoveAll add: aSlot holder.
            name: aSlot name.
            [| nn |
              nn: list copyRemoveAll.
              n do: [|:p|
                (copyDownChildrenOf: p) do: [|:m. s|
                  (m includesKey: name) && [s: m at: name. s isCopiedDown] ifTrue: [
                    nn add: m.
                    r  add: s.
                  ].
                ].
              ].
              n: nn.
              n isEmpty ifTrue: [^ r].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: copying\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | error: 'cannot copy moduleDictionary').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: copy downs\x7fComment: private, cause may contain false positives,
as a result of incremental changes\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         copyDownChildren = ( |
            | 
            refillAndProtectDo: [ cachedCopyDownChildren ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: copy downs\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownChildrenOf: aMirror = ( |
             s.
            | 
            s: copyDownChildren at: aMirror IfAbsent: vector.
            s do: [|:chld|
                chld copyDowns findFirst: [|:cd| cd parentMirror = aMirror]
                               IfPresent: true
                                IfAbsent: [ s remove: chld ].
            ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: copy downs\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownDescendantsOf: aMirror = ( |
            | 
            copyDownDescendantsOf: aMirror Into: set copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: copy downs\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         copyDownDescendantsOf: aMirror Into: aCollection = ( |
             c.
            | 
            c: copyDownChildrenOf: aMirror.
            c do: [|:m|
              aCollection add: m.
              copyDownDescendantsOf: m Into: aCollection.
            ].
            aCollection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: copying\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | error: 'cannot copy moduleDictionary').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: sizing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         desiredMinCapacity: s = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: module InitialContents: InitializeToExpression: (vector)\x7fVisibility: publicReadPrivateWrite'
        
         dirtyModules <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: currency\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         filedIn: name = ( |
             m.
            | 
              "just filed in module, make others current"
              "assumes that filing me in did not add or take away another's slot"
              "use -1 timestamp to cleverly avoid making submodules current"
            " comment this out--now that files go through bootstrap prims
              should not need to do anything special -- dmu "

              m: at: name IfAbsent: [^self].
              [ do: [|:mod| mod bringUpToDate. ]. "This part may not be needed" ].
            " Whoops! Cannot comment this all out, since the module slots list
              is lost when filing in."
              m beObsolete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: synchronization\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         fillingSemaphore = ( |
            | sema).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: synchronization\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         fillingSemaphore: s = ( |
            | sema: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: user queries\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         getAModuleNameQuestion: q Default: d IfCancel: cancelBlock = ( |
             newName.
            | 
            d isEmpty ifFalse: [newName: d ]  True: [
              newName: userQuery askString: q DefaultAnswer: d.
              newName: newName shrinkwrapped.
            ].
            [ | r |
              case if: [ newName isEmpty ]  Then: [
                r: userQuery askMultipleChoice: 'What!?'
                                       Choices: ('No module' & 'Try again' & 'Cancel') asVector
                                       Results: ('none' & 'retry' & 'cancel') asVector.
              ] If: [ includesKey: newName ]  Then: [ ^ newName ]
              Else: [
                r: userQuery askMultipleChoice: 'Module "', newName, '" does not exist.'
                                      Choices: ( 'Create it!' & 'Try again' & 'Cancel') asVector
                                      Results: ( 'create' & 'retry' & 'cancel' ) asVector.
              ].
              case if: [ r = 'none'   ] Then: [ ^ '' ]
                   If: [ r = 'retry'  ] Then: []
                   If: [ r = 'create' ] Then: [ addModuleNamed: newName. ^ newName ]
                   Else: [^ cancelBlock value].
              newName: userQuery askString: q DefaultAnswer: d.
              newName: newName shrinkwrapped.
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: implementation\x7fModuleInfo: Module: module InitialContents: InitializeToExpression: (modules _Mirror)\x7fVisibility: private'
        
         holderMirror = modules _Mirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: fast accessing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentDo: presentActionBlock IfAbsentDo: absentActionBlock = ( |
            | 
            presentActionBlock value:
              (holderMirror at: k IfFail: [^ absentActionBlock value: k]) 
                contents reflectee
             With: k).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: fast accessing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentDo: presentActionBlock IfAbsentPut: newValueBlock AndDo: absentActionBlock = ( |
            | 
            " if collection contains k invoke presentActionBlock with 
              value at k and key.
              If k is absent, add result of evaluating newValueBlock on k,
              at key k (for dicts) and invoke absentActionBlock with new value and key.
            "
            presentActionBlock value:
              (holderMirror at: k IfFail: [| x |
                x: newValueBlock value: k.
                addKey: k Value: x.
              ^ absentActionBlock value: x With: k.
               ]) contents reflectee
             With: k).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: fast accessing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentPut: replacementValueBlock AndDo: presentActionBlock IfAbsentDo: absentActionBlock = ( |
            | 
            " if collection contains k, invoke replacementValueBlock with args 
              old value and key,
              and replace contents at k with result of replacementValueBlock.
              Then invoke presentActionBlock with args new value and key.
              If k is absent, invoke absentActionBlock with k.
            "
            (includesKey: k)  ifTrue: [| newV |
                newV: replacementValueBlock value: (keyAtOrValueAt: k) With: k.
                addKey: k Value: newV.
                presentActionBlock value: newV With: k.
            ]
            False: [
                absentActionBlock value: k
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: fast accessing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentPut: replacementValueBlock AndDo: presentActionBlock IfAbsentPut: newValueBlock AndDo: absentActionBlock = ( |
            | 
            " if collection contains k, 
              invoke replacementValueBlock with args old value and key
              and replace contents at k with result of replacementValueBlock.
              Then invoke presentActionBlock with args new valud and key.
              If k is absent, add result of evaluating newValueBlock at key k 
             (for dicts) and invoke absentActionBlock with new value and key.
            "
            (includesKey: k)  ifTrue: [| newV |
                newV: replacementValueBlock value: (keyAtOrValueAt: k) With: k.
                addKey: k Value: newV.
                presentActionBlock value: newV With: k.
            ]
            False: [ | newV |
                newV: newValueBlock value.
                addKey: k Value: newV.
                absentActionBlock value: newV With: k
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: accessing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         includesKey: k = ( |
            | 
            holderMirror includesKey: k).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: currency\x7fComment: Use VM timestamp to avoid useless refilling\x7fModuleInfo: Module: module InitialContents: FollowSlot'
        
         isCurrent = ( |
            | 
            noneSatisfy: [|:mod| mod isObsolete]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: module name conventions\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         isModuleNameUntransportable: name = ( |
            | 
            "by convention, a slot with a module name starting with a non-letter
             is exempt from transport"
            "an empty name is an orphan"

            (name at: 0 IfAbsent: [^ false]) isLetter not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: filling\x7fComment: answer true iff aSlot is worth remembering as being part of module moduleName

A slower test than what is used during cache refilling, but the final screen
before giving out slots from the cache.\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         isWorthCaching: aSlot ForModuleName: moduleName = ( |
            | 
                   aSlot exists
            && [   aSlot isFiledOut
            && [ ( aSlot module  =  moduleName)
            && [ ( aSlot holder filedOutCreatorPathIfPresent:    true  IfAbsent: false )
            && [ ( aSlot holder storeStringOfReflecteeIfPresent: false IfAbsent: true ) ] ] ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: fast accessing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         keyAtOrValueAt: k = ( |
            | (holderMirror at: k) contents reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: accessing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         keys = ( |
            | holderMirror names).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: incremental changes\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         maintainingCurrencyDo: aBlock = ( |
            | " evaluate block without affecting currency"
              mirrors slots freezeProgrammingTimestampDo: aBlock
            " older, slower alternate:
               beObsoleteOrCurrent.
              aBlock onReturn: [bringUpToDate]").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: adding\x7fComment: after adding .TMP to the name, a 20-char
name fails on MacOS -- dmu 3/01\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleNameLengthLimit = 19.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: user queries\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleNestingChanged = ( |
            | 
            cachedTopLevelModules: vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: orphans\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         orphans = ( |
            | 
            refillAndProtectDo: [ |co|
              "have to do it this way because
               if slot became invalid, its hash changed"
              co: cachedOrphans copy. 
              cachedOrphans removeAll.
              co do: [|:s| 
                ( isWorthCaching: s ForModuleName: '' )
                    ifTrue: [cachedOrphans add: s].
              ].
              cachedOrphans
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: orphans\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         orphansFor: name = ( |
            | 
             name isEmpty ifTrue: [^ orphans].
            orphans copyFilteredBy: [|:s. |
              s holder filedOutCreatorSlotIfPresent: [|:creator. m |
                s holder 
                  storeStringOfReflecteeIfPresent: false
                  IfAbsent: [
                    m: creator module.
                    m isEmpty || [m = name]
                  ].
              ] IfAbsent: true.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: parents\x7fModuleInfo: Module: module InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: filing out\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: orphans\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         putEasyOrphansInModules = ( |
             os.
            | 
            os: orphans copy.
            os do: [|:s|
              s module isEmpty ifTrue: [|mods|
                mods: s holder mapBy: [|:s| s isCopiedDown ifTrue: '' False: [s module]] 
                                Into: set copyRemoveAll.
                mods remove: '' IfAbsent: [].
                case if: [mods size = 1] Then: [
                  s module: mods first
                ] If: [mods isEmpty] Then: [
                  s holder creatorSlotIfPresent: [|:cs| s module: cs module]
                                      IfAbsent: [].
                ].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: filling\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         refill = ( |
            | 
            isCurrent ifTrue: [^self].
            userQuery showEverybody: 'Refilling module cache'
                              While: [ alwaysRefill ].
            "userQuery showEverybody: (size printString, ' modules') 
                    ForSecs: 1."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: filling\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         refillAndProtectDo: blk = ( |
            | 
            "ensure I am full and protect against
             me filling while being accessed"
            fillingSemaphore protect: [
              refill.
              blk value.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: releasing memory\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         releaseUnusedMemory = ( |
            | 
            do: [|:aModule| aModule releaseUnusedMemory].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: removing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirstIfAbsent: absentBlk = ( |
            | 
            holderMirror isEmpty ifTrue: [^ absentBlk value].
            holderMirror first remove.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: removing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         removeKey: k IfAbsent: b = ( |
            | 
            holderMirror removeSlot: k IfFail: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: filling\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         resetFillingSemaphore = ( |
            | 
            "added to snapshotAction schedulerStartingMessages in
             modules module postFileIn"
            fillingSemaphore: recursiveSemaphore copyBinary).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: parents\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         safety* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'safeMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: synchronization\x7fComment: The dictionary accessors are obtained through the safety mixin,
which expects to find a semaphore named sema.\x7fModuleInfo: Module: module InitialContents: InitializeToExpression: (recursiveSemaphore copyBinary)\x7fVisibility: private'
        
         sema <- recursiveSemaphore copyBinary.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: filling\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         silentRefill = ( |
            | 
            isCurrent ifTrue: [^self].
            alwaysRefill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: sizing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | holderMirror size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: user queries\x7fComment: One module (e.g. \'all2.self\') was filed in
initially and contained the other modules.
(Except for application modules filed in later.)\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         theMainModule = ( |
            | 
            findFirst: [|:m|
                m subparts includes: modules init
              ] IfPresent: [|:m| m]
                IfAbsent: [error: '??']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: user queries\x7fComment: return set of modules that are not contained on any others\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         topLevelModules = ( |
             tops.
            | 
            cachedTopLevelModules isEmpty ifFalse: [
              ^ cachedTopLevelModules
            ].
            tops: asSet.
            do: [|:m|
              m subparts do: [|:sm| tops remove: sm IfAbsent: []]
            ].
            cachedTopLevelModules: tops.
            tops).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: filling\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafeCollectSlotsFrom: startSlot = ( |
             alreadyQueued.
             mirsToVisit.
            | 
            "visit all objects easily reachable from lobby, collecting 
            slot membership from annos"

            mirsToVisit:  list copyRemoveAll.

            alreadyQueued: set  copyRemoveAll.
            alreadyQueued desiredMinCapacity: 3000. "performance hack"

                collectSlot: startSlot
             MirrorsToVisit: mirsToVisit
              AlreadyQueued: alreadyQueued. 

            [mirsToVisit isEmpty] whileFalse: [ | e |
              e: mirsToVisit removeFirst.
              e do: [|:s|
                     collectSlot: s
                  MirrorsToVisit: mirsToVisit
                   AlreadyQueued: alreadyQueued. 
              ].
              e indexedSlotsDo: [|:s|
                     collectSlot: s
                  MirrorsToVisit: mirsToVisit
                   AlreadyQueued: alreadyQueued.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: iterating\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_do: b = ( |
            | 
            holderMirror do: [|:s|
              b value: s contents reflectee With: s name].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: removing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_removeAll = ( |
            | holderMirror removeAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: incremental changes\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         updateDirtyModules = ( |
             r.
            | 
            r: list copyRemoveAll.
            do: [|:mod| mod isDirty ifTrue: [r add: mod]].
            dirtyModules: r asVector sort.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: dictionary behavior\x7fCategory: accessing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         values = ( |
            | 
            holderMirror asVector copyMappedBy: [|:s| s contents reflectee]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: module system behavior\x7fCategory: orphans\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: private'
        
         warnAnonSlots = ( |
             n.
             ss.
            | 
            cachedOrphans isEmpty ifTrue: [^ self].
            userQuery reportAndContinue:
              'Warning: ', cachedOrphans size printString, ' ',
                     (cachedOrphans size = 1 ifTrue: 'slot exists'
                                              False: 'slots exist'),
                     ' without belonging to any module.\n',
                     'To examine these slots,\n1. Select "Changed Modules" from the middle-button background menu,\n',
                     '2. Select "Expatriate Slots" from the middle-button menu on the "Changed Modules" object.'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'moduleDictionary' -> () From: ( | {
         'Category: browsing\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         wellKnownSlotsDo: blk = ( |
            | 
            orphans do: blk.
            do: [|:mod| mod slots do: blk].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: module InitialContents: FollowSlot\x7fVisibility: public'
        
         asModule = ( |
            | transporter moduleDictionary at: self).
        } | ) 



 '-- Side effects'

 globals modules module postFileIn
