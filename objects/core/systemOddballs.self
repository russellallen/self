 'Sun-$Revision: 30.12 $'
 '
Copyright 1992-2009 AUTHORS, Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: memory management\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         memory = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'memory' -> () From: ( |
             {} = 'Comment: This object collects into one place an interface to the
various memory-related functions of the Virtual Machine.\x7fModuleInfo: Creator: globals memory.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: releasing resources\x7fComment: Add a message to be performed whenever a cleanup takes
place (quick or thorough).\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         addQuickCleanupMessage: msg = ( |
            | 
            quickCleanupMessages add: msg.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: coping with allocation failure\x7fComment: An allocation has failed; reclaim memory and if
necessary expand the heap.\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         allocationFailed = ( |
            | 
            lowSpaceHandler: 0 UserRequested: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: coping with allocation failure\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         allocationFailed: nOops = ( |
            | allocationFailed: nOops Bytes: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: coping with allocation failure\x7fComment: An allocation of nOops and nBytes has failed; reclaim
memory and expand the heap if necessary.\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         allocationFailed: nOops Bytes: nBytes = ( |
            | 
            lowSpaceHandler: nBytes + (nOops * 4) UserRequested: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: coping with allocation failure\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         allocationFailedBytes: nBytes = ( |
            | allocationFailed: 0 Bytes: nBytes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: invoking a collection\x7fComment: A GC is considered successful if it reclaims this fraction of the objects,
regardless of how long it takes.  Should be in the range 0..1.\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (0.667)\x7fVisibility: private'
        
         bigReclaimThreshold <- 0.667.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: releasing resources\x7fComment: Clean memory of unneeded objects; ask the user how
thorough to be.\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         cleanup = ( |
             w.
            | 
            w:
             userQuery
             askMultipleChoice: 'How would you like to clean up memory?'
             Choices: ('Quickly' & 'Fairly thoroughly' & 'Very thoroughly') asVector
             Results: (1 & 2 & 3) asVector.

            case if: [w = 1] Then: [quickCleanup]
                 If: [w = 2] Then: [thoroughCleanup: false]
                 If: [w = 3] Then: [thoroughCleanup: true]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         codeCache = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'memory' -> 'codeCache' -> () From: ( |
             {} = 'Comment: This is a proxy for the system\'s code cache.\x7fModuleInfo: Creator: globals memory codeCache.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'codeCache' -> () From: ( | {
         'Comment: force a compaction of the code cache\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         compact = ( |
            | _Compact).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'codeCache' -> () From: ( | {
         'Comment: return number of compilations since start\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         compilations = ( |
            | initialCompilations + recompilations).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'codeCache' -> () From: ( | {
         'Comment: flush all compiled code\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         flush = ( |
            | _Flush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'codeCache' -> () From: ( | {
         'Comment: return number of initial (NIC) compilations since start\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCompilations = ( |
            | _CompileCounts at: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'codeCache' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'codeCache' -> () From: ( | {
         'Comment: return number of recompilations since start\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         recompilations = ( |
            | _CompileCounts at: (_Compilers size - 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: invoking a collection\x7fComment: This actually invokes the mark-scan garbage collector;
it should be the only thing that does.\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         doGarbageCollect = ( |
            | 
            _GarbageCollect.
            _ZombieProcesses do: [|:p| p abortIfLive: 'doGarbageCollect' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: releasing resources\x7fComment: Empty all trash cans in all worlds.\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         emptyTrashCans = ( |
            | 
            desktop isOpen ifFalse: [^ self].
            desktop worlds do: [|:w|
                w morphsDo: [|:morph|
                    morph morphTypeName = trashCanMorph morphTypeName ifTrue: [
                        morph empty.
                    ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: expanding the heap\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         expandHeapBy: max MustExpand: mustExpand = ( |
             desired.
             exp.
            | 
            max = 0  ifTrue: [^ self].
            desired: max.
            verboseLowSpaceHandler ifTrue: [
             ('Low space handler: expanding heap by ', desired printString, ' bytes.') printLine.
            ].
            [
              exp:  _MemoryExpandHeap: desired.
              exp != 0 ifTrue: [^self].
              desired:  desired / 2.
              desired < minimumExpansionAmount ifTrue: [
                mustExpand ifTrue: ["haven't GCd" doGarbageCollect].
                userQuery report: 'Could not expand heap!'.
              ^ self
              ]
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: expanding the heap\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         expandHeapByAbout: desiredBytes MustExpand: mustExpand MemoryStateWas: memoryStateBeforeExpansion = ( |
             desired.
             expansionLimit.
             slop = 20480.
             thresholdDelta.
            | 
            desired:  desiredBytes + slop.

            thresholdDelta: reduceVMLowSpaceThresholdBy: desired.
            desired:  desired - thresholdDelta.

            expansionLimit: maxHeapExpansionThatLeavesEnoughSwapSpace.
            expansionLimit = 0  ifTrue: [
              userQuery report: 'Cannot expand heap: swap space almost gone!'.
              mustExpand ifTrue: ["haven't GCd" doGarbageCollect].
            ].
            desired: desired min: expansionLimit.
            desired: desired + minLowSpaceThresholdInVM.
            expandHeapBy: desired MustExpand: mustExpand.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: expanding the heap\x7fComment: When the low space handler expands this heap, it increases the size by this fraction
of the current size.  Should be positive.\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (0.5)\x7fVisibility: public'
        
         expansionRatio <- 0.5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: expanding the heap\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         forceHeapExpansionOf: desiredBytes TimeSinceLastGC: timeSinceLastGCMsec = ( |
            | 
            verboseLowSpaceHandler ifTrue: [
              ('expanding due to too much GC : ', lastGCDurationMsec printString, ' ms in ',
                timeSinceLastGCMsec printString, ' ms.') printLine
            ].
            expandHeapByAbout: desiredBytes 
                   MustExpand: true
               MemoryStateWas: memoryState copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: invoking a collection\x7fComment: If the fraction of the heap which is free falls below this amount, the low
space handler will attempt to expand the heap.  Should be in the range 0..1.\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (0.3)\x7fVisibility: public'
        
         freeSpaceExpansionFraction <- 0.3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: releasing resources\x7fComment: Perform a full garbage collection.\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         garbageCollect = ( |
            | 
            lowSpaceHandler: 0 UserRequested: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: invoking a collection\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         gcOrExpandToFreeUp: desiredBytes UserRequested: fromUser TimeBeforeGC: timeBeforeGC TimeSinceLastGC: timeSinceLastGCMsec = ( |
             defaultExpansion.
             ineffectiveGC.
             memoryStateAfterGC.
             memoryStateBeforeGC.
             needContiguousSpace.
             reclaimed.
             reclaimedALot.
             timeAfterGC.
            | 
            verboseLowSpaceHandler ifTrue: [ 'Low space handler: GC' printLine ].

            memoryStateBeforeGC:  memoryState copy.
            doGarbageCollect.
            timeAfterGC:         time current.
            timeOfLastGC:        timeAfterGC.
            lastGCDurationMsec:  timeAfterGC - timeBeforeGC  max: 1 "prevent div by 0 error".
            memoryStateAfterGC:  memoryState copy.
            needContiguousSpace: memoryStateAfterGC maxContiguousFree < (desiredBytes + vmReservedAmount).
            defaultExpansion:    (memoryStateAfterGC free /= memoryStateAfterGC capacity) < freeSpaceExpansionFraction.
            reclaimed:           memoryStateAfterGC free - memoryStateBeforeGC free.
            reclaimedALot:       (reclaimed /= memoryStateBeforeGC used) >= bigReclaimThreshold.
            ineffectiveGC:       reclaimedALot not && [(reclaimed /= lastGCDurationMsec) < minReclaimRate].

            verboseLowSpaceHandler ifTrue: [
              reportOnGCTimeSinceLast: timeSinceLastGCMsec
                  NeedContiguousSpace: needContiguousSpace
                         DesiredBytes: desiredBytes
                     DefaultExpansion: defaultExpansion
                        IneffectiveGC: ineffectiveGC
                            Reclaimed: reclaimed
                        ReclaimedALot: reclaimedALot.
            ].
            reclaimedALot ifTrue: [  setLowSpaceThresholdBackToDoEarlierGCs: memoryStateAfterGC ].

            fromUser not && [needContiguousSpace || defaultExpansion || ineffectiveGC]  ifTrue: [
              expandHeapByAbout: desiredBytes 
                     MustExpand: false
                 MemoryStateWas: memoryStateAfterGC
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: writing snapshots\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeSnapshotOptions = ( |
            | 
            snapshotOptions: snapshotOptionsPrototype initialize copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fComment: The time the last GC took (in ms)\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         lastGCDurationMsec <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fComment: Called by the scheduler when space is low, or indirectly
by the user to perform a garbage collection.\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         lowSpaceHandler: desiredBytes UserRequested: fromUser = ( |
             timeBeforeGC.
             timeSinceLastGCMsec.
            | 
            timeBeforeGC:         time current.
            timeSinceLastGCMsec:  timeBeforeGC - timeOfLastGC.

            "Force a heap expansion if too much time is being spent in GC (but ignore user-initiated GC)"
               fromUser not
            && [(lastGCDurationMsec /= (lastGCDurationMsec + timeSinceLastGCMsec)) >= maxGCWorkLoad] ifTrue: [
               forceHeapExpansionOf: desiredBytes
                      TimeSinceLastGC: timeSinceLastGCMsec.
            ]
            False: [
                gcOrExpandToFreeUp: desiredBytes
                     UserRequested: fromUser
                      TimeBeforeGC: timeBeforeGC
                   TimeSinceLastGC: timeSinceLastGCMsec.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: administering the VM low space threshold\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         lowSpaceThresholdInVM = ( |
            | _MemoryLowSpaceThreshold).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: administering the VM low space threshold\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         lowSpaceThresholdInVM: n IfFail: fb = ( |
            | 
            _MemoryLowSpaceThreshold: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fComment: The maximum acceptable fraction of time spent in GC.\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (0.3)\x7fVisibility: public'
        
         maxGCWorkLoad <- 0.3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: expanding the heap\x7fCategory: reserving enough swap space\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         maxHeapExpansionThatLeavesEnoughSwapSpace = ( |
             swapFree.
             swapReserve.
             swapSize.
             swapStats.
            | 
            swapStats: _MemorySwapSpaceIfFail: [^ 10 * 100000 * 1000].

            swapSize: (swapStats at: 0) * 1024.
            swapFree: (swapStats at: 1) * 1024.

            swapReserve: swapSize * reservedSwapFraction.
            swapReserve >= maxSmallInt asFloat "asInteger fails otherwise"
              ifTrue: [swapReserve: maxSmallInt].
            swapReserve: swapReserve asInteger max: reservedSwapSize.

            swapFree - swapReserve  max:  0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: administering the VM low space threshold\x7fComment: Don\'t set the low space threshold below this -- Mario, 1/27/95\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         minLowSpaceThresholdInVM = ( |
            | 
            vmReservedAmount + (1024 * 1024)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: object IDs\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         minNumObjectIDs = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: invoking a collection\x7fComment: The minimum acceptable rate of free-space reclamation in GC (bytes/ms).\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: ( 500 )\x7fVisibility: public'
        
         minReclaimRate =  500 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: expanding the heap\x7fComment: The minimum number of bytes to expand the heap by.
Probably not worth making smaller than the size of eden.\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (512000)\x7fVisibility: public'
        
         minimumExpansionAmount <- 512000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: object IDs\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         numObjectIDs = ( |
            | _NumObjectIDs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: object IDs\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         numObjectIDs: x = ( |
            | _NumObjectIDs: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: object IDs\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         numObjectIDs: x IfFail: errBlk = ( |
            | _NumObjectIDs: x IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: releasing resources\x7fComment: Discard dead processes and perform a garbage collection\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         quickCleanup = ( |
            | 
            quickCleanupMessages do: [|:m| m send].
            scavenge.
            garbageCollect).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: releasing resources\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (orderedSet copyRemoveAll)\x7fVisibility: private'
        
         quickCleanupMessages = orderedSet copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: administering the VM low space threshold\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         reduceVMLowSpaceThresholdBy: desired = ( |
             alreadyAllocated.
             newLowSpaceThreshold.
             oldLowSpaceThresh.
             reduction.
            | 
            "push back yellow line & return space gotten"
            oldLowSpaceThresh: lowSpaceThresholdInVM.
            alreadyAllocated:  oldLowSpaceThresh - minLowSpaceThresholdInVM.
            newLowSpaceThreshold: ((alreadyAllocated - desired) max: 0) + minLowSpaceThresholdInVM.
            lowSpaceThresholdInVM: newLowSpaceThreshold
                           IfFail:  [| :e | warning: 'unexpected error setting low space threshold: ', e].
            reduction: oldLowSpaceThresh - lowSpaceThresholdInVM.
            reduction).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: object IDs\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         releaseObjectIDs = ( | {
                 'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot'
                
                 n <- 0.
                } 
            | 
            n: numObjectIDs: minNumObjectIDs.
            minNumObjectIDs do: [|:i| i objectIDNumber].
            numObjectIDs: n.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: releasing resources\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         releaseObjects = ( |
            | 
            releaseObjectIDs.
            history   freeResults.
            ((reflect: self) lookupKey: 'desktop') isEmpty 
              ifFalse: [desktop releaseObjects].
            ((reflect: self) lookupKey: 'ui') isEmpty 
              ifFalse: [ui releaseObjects].
            traits cachedSlotAnnotation releaseObjects.
            scheduler releaseObjects.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: invoking a collection\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         reportOnGCTimeSinceLast: timeSinceLastGCMsec NeedContiguousSpace: needContiguousSpace DesiredBytes: desiredBytes DefaultExpansion: defaultExpansion IneffectiveGC: ineffectiveGC Reclaimed: reclaimed ReclaimedALot: reclaimedALot = ( |
            | 
            'time since last GC (ms) : ' print. timeSinceLastGCMsec printLine.
            'GC duration (ms) : ' print. lastGCDurationMsec printLine.
            needContiguousSpace ifTrue: [
              ('no contiguous segment of ', desiredBytes printString, ' bytes.') printLine.
            ].
            defaultExpansion ifTrue: [
              'free space below default threshold of ' print.
              freeSpaceExpansionFraction printLine.
            ].
            ineffectiveGC ifTrue: [
              ('GC reclaimed only ', reclaimed printString, ' bytes.') printLine.
            ].
            reclaimedALot ifTrue: [
              ('Reclaimed more than ', bigReclaimThreshold printString, ' of the heap.') printLine.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: expanding the heap\x7fCategory: reserving enough swap space\x7fComment: The fraction of swap space to reserve for other processes.\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (0.1)\x7fVisibility: public'
        
         reservedSwapFraction <- 0.1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: expanding the heap\x7fCategory: reserving enough swap space\x7fComment: The minimum amount of swap space to reserve for other processes.\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (4 * 1024 * 1024)\x7fVisibility: public'
        
         reservedSwapSize <- 4 * 1024 * 1024.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: releasing resources\x7fComment: Perform a scavenge of `new\' space.\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         scavenge = ( |
            | _Scavenge).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fCategory: administering the VM low space threshold\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         setLowSpaceThresholdBackToDoEarlierGCs: memoryStateAfterGC = ( |
            | 
            lowSpaceThresholdInVM:
                  (     (memoryStateAfterGC capacity - (memoryStateAfterGC used * 1.5)) asInteger
                  max: minLowSpaceThresholdInVM)
            IfFail: [| :e | warning: 'unexpected error setting low space threshold: ', e].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: writing snapshots\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         snapshotOptions <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: writing snapshots\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         snapshotOptionsPrototype = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals memory snapshotOptionsPrototype.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( | {
         'Comment: Ask user for my values, and change me.\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         askUser = ( |
            | 
            userQuery askViaTTY
             ifTrue: [ askUserViaTTY ]
              False: [ askUserViaUI2 ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         askUserViaTTY = ( |
            | 
            fileName: userQuery askString: 'Snapshot file name? '
                            DefaultAnswer: fileName.
            saveObjectCode: userQuery askMultipleChoice: 'Saving object code in snapshot is currently ',
                                                 (saveObjectCode ifTrue: 'en' False: 'dis'), 'abled.\n'
                                       Choices: ( 'Enable' & 'Disable' ) asVector
                                       Results: ( true & false ) asVector.
            useCompression userQuery askMultipleChoice: 'Snapshot compression is currently ',
                                                 (useCompression ifTrue: 'en' False: 'dis'), 'abled.\n'
                                       Choices: ( 'Enable' & 'Disable' ) asVector
                                       Results: ( true & false ) asVector.
            spaceSizes: spaceSizes copy askUserViaTTY.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot'
        
         askUserViaUI2 = ( |
             m.
             sema.
             w.
            | 
            m: snapshotOptionsMorph copy snapshotOptions: self.
            w: process this hand world.
            sema: recursiveSemaphore copy count: 0. "no sigs"
            m acceptSema: sema.
            w safelyDo: [
              w addMorph: m.
              m layoutChanged.
              m position: (m baseBounds center: process this birthEvent cursorPoint) origin.
              w moveToFront: m.
            ].
            sema wait.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         compressionFilters = ( |
            | 
            useCompression ifTrue: [ zcatCompressionFilters ] False: [ noCompressionFilters ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (\'Snapshot\')\x7fVisibility: public'
        
         fileName <- 'Snapshot'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            spaceSizes: spaceSizesPrototype copy setToVMDefaults).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot'
        
         noCompressionFilters = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'noCompressionFilters' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals memory snapshotOptionsPrototype noCompressionFilters.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         saveObjectCode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         spaceSizes <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         spaceSizesPrototype = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals memory snapshotOptionsPrototype spaceSizesPrototype.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         askUserForObjectHeapSizes = ( |
            | 
              eden_size: ( userQuery askString: 'Eden? '           DefaultAnswer: eden_size printString ) asInteger.
              surv_size: ( userQuery askString: 'Survivor space? ' DefaultAnswer: surv_size printString ) asInteger.
               old_size: ( userQuery askString: 'Old space? '      DefaultAnswer:  old_size printString ) asInteger.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot'
        
         askUserViaTTY = ( |
            | 
            scaleCodeSizesFor: (
              userQuery askString: 'Code cache size (code only) ? '
                         DefaultAnswer: code_size printString ) asInteger.
            ( userQuery askYesNo: 'Change object heap sizes y/[n] ? ' ) ifTrue: [
              askUserForObjectHeapSizes
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot'
        
         askUserViaUI2 = ( |
            | askUserViaTTY).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'Category: sizes\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (0)'
        
         code_size <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'Category: sizes\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (0)'
        
         debug_size <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'Category: sizes\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (0)'
        
         deps_size <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'Category: sizes\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (0)'
        
         eden_size <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         getVMDefaults = ( |
            | 
            _MemoryDefaultSpaceSizes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'Category: sizes\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (0)'
        
         old_size <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'Category: sizes\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (0)'
        
         pic_size <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'Comment: Given desired new value for code_size,
set all code cache sizes relative to current values.\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         scaleCodeSizesFor: newCodeSize = ( |
             r.
             vmd.
            | 
            vmd: getVMDefaults.
            r: newCodeSize /= vmd code_size.
            code_size: newCodeSize asInteger.
            debug_size: (r * vmd debug_size) asInteger.
            deps_size: (r * vmd deps_size) asInteger.
            pic_size: (r * vmd pic_size) asInteger.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'Comment: Sets my slots to the VM defaults.\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         setToVMDefaults = ( |
             vmd.
            | 

            vmd: getVMDefaults.
             eden_size: vmd  eden_size.
             surv_size: vmd  surv_size.
              old_size: vmd   old_size.
             code_size: vmd  code_size.
             deps_size: vmd  deps_size.
              pic_size: vmd   pic_size.
            debug_size: vmd debug_size.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'spaceSizesPrototype' -> () From: ( | {
         'Category: sizes\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (0)'
        
         surv_size <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         useCompression <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot'
        
         zcatCompressionFilters = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'zcatCompressionFilters' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals memory snapshotOptionsPrototype zcatCompressionFilters.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'zcatCompressionFilters' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot'
        
         compression_filter = 'gzip'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> 'snapshotOptionsPrototype' -> 'zcatCompressionFilters' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot'
        
         decompression_filter = 'zcat'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         testHeapExpansion = ( |
             a.
             b = 1000000.
            | 

            10 do: [a: (vector copySize: b) at: 0 Put: a].
            a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: releasing resources\x7fComment: Flush caches, discard dead processes and force a garbage collection.
Optionally discard code from the compiled code cache.
Warning: this releases as much memory as possible, but
may have a severe hit on performance.  Use with discretion!\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         thoroughCleanup: flushCodeOrNo = ( |
            | 
            userQuery
             showEverybody: 'Thoroughly cleaning up memory...'
             While: [
              emptyTrashCans.
              releaseObjects.
              thoroughCleanupMessages do: [|:m| m send].
              flushCodeOrNo ifTrue: [codeCache flush].
              quickCleanup
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: releasing resources\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (orderedSet copyRemoveAll)\x7fVisibility: private'
        
         thoroughCleanupMessages = orderedSet copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fComment: The time the last GC happened\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (time copy)\x7fVisibility: private'
        
         timeOfLastGC <- time copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fComment: Enable/disable console messages from low space handler.\x7fModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         verboseLowSpaceHandler = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: low space management\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         vmReservedAmount = ( |
            | _MemoryVMReservedAmount).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: writing snapshots\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         writeSnapshot = ( |
            | 
            writeSnapshotIfBackupFails: [|:e| warning: 'Could not backup old snapshot: ', e]
                       IfSnapshotFails: [|:e| ^error: 'Snapshot failed: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: writing snapshots\x7fComment: Write snapshot using snapshotOptions.
If file pre-exists, rename it to fileName.backup.
If the rename fails, call backupFailBlock; if this returns, proceed anyway.
If snapshot fails, call snapFailBlock.\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         writeSnapshotIfBackupFails: backupFailBlock IfSnapshotFails: snapFailBlock = ( |
             fileName.
             ms.
             saveCode.
             snapSpaceSizes.
             undoBlock.
            | 
            "Rename existing snapshot & remove backup"
            fileName: snapshotOptions fileName.
            undoBlock: 
              [os
                rename: fileName, '.backup' 
                    To: fileName
                IfFail: [|:e| warning: 'Could not undo rename of snapshot backup']].
            os
              rename: fileName 
                  To: fileName, '.backup' 
              IfFail: [|:e|
                'ENOENT' = e ifFalse: [backupFailBlock value: e].
                undoBlock: nil
              ].

            "Save code only if asked to and the first old space segment is the only
             non-empty one."
            ms: memoryState copy.
            saveCode:     snapshotOptions saveObjectCode
                       && [ms numNonEmptyOldSpaceSegments = 1]
                       && [((ms old first at: 0) + (ms old first at: 1)) > 0].

            "Calculate startup space sizes for the snapshot."
            snapSpaceSizes: snapshotOptions spaceSizes copy.
            snapSpaceSizes old_size: ms used + (minLowSpaceThresholdInVM * 2).

            scavenge. "bug work-around, eden size too small"

            _MemoryWriteSnapshot: fileName
                        Compress: snapshotOptions compressionFilters
                           Sizes: snapSpaceSizes
                        SaveCode: saveCode
                          IfFail: [|:e|
              undoBlock value.
              ^snapFailBlock value: e
            ].
            programmingLog writeSnapshot: fileName.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot'
        
         systemOddballs = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'systemOddballs' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'systemOddballs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules systemOddballs.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'systemOddballs' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'systemOddballs' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'systemOddballs' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'systemOddballs' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         postFileIn = ( |
            | 
            memory initializeSnapshotOptions.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'systemOddballs' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.12 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'systemOddballs' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: Virtual Machine interface\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         typeSizes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'typeSizes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals typeSizes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'typeSizes' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         bitSize: typeName = ( |
            | typeName _BitSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'typeSizes' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         bitsPerByte = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'typeSizes' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         byteSize: typeName = ( |
            | ( bitSize: typeName ) /+ bitsPerByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'typeSizes' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: Virtual Machine interface\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         vmSpy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'vmSpy' -> () From: ( |
             {} = 'Comment: This object gathers together operations to control
the Self Virtual Machine `spy\' facility.  
See the manual for the virtual machine for an explanation
of the spy.\x7fModuleInfo: Creator: globals vmSpy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'vmSpy' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         display = ( |
            | _SpyXDisplay).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'vmSpy' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         display: disp = ( |
            | 
            disp = display ifTrue: [ ^ self ].
            _SpyXDisplay: disp.
            isActive ifTrue: [ off. on. ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'vmSpy' -> () From: ( | {
         'Comment: empty string indicates the default font\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         font = ( |
            | _SpyFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'vmSpy' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         font: f = ( |
            | 
            f = font ifTrue: [ ^ self ].
            _SpyFont: f.
            isActive ifTrue: [ off. on. ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'vmSpy' -> () From: ( | {
         'Comment: give the height of the system monitor,
     in pixels; 0 if the monitor is not running\x7fModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | _SpyHeight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'vmSpy' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         isActive = ( |
            | _Spy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'vmSpy' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         off = ( |
            | _Spy: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'vmSpy' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: public'
        
         on = ( |
            | _Spy: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'vmSpy' -> () From: ( | {
         'ModuleInfo: Module: systemOddballs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 



 '-- Side effects'

 globals modules systemOddballs postFileIn
