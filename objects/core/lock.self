 '$Revision: 30.8 $'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         lock = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'lock' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals lock.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'lock' -> () From: ( | {
         'Comment: If lock is held by a process, the process
is stored in this slot. When lock is not
held, this field contains nil.\x7fModuleInfo: Module: lock InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         holderProcess.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'lock' -> () From: ( | {
         'Comment: How many more locks than unlocks the holding
process has performed.\x7fModuleInfo: Module: lock InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         lockCount <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         lock = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'lock' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits lock.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'lock' -> () From: ( | {
         'ModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'lock' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'lock' -> () From: ( | {
         'ModuleInfo: Module: lock InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         sema.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: lock InitialContents: FollowSlot'
        
         lock = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'lock' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'lock' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules lock.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'lock' -> () From: ( | {
         'ModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'lock' -> () From: ( | {
         'ModuleInfo: Module: lock InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'lock' -> () From: ( | {
         'ModuleInfo: Module: lock InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'lock' -> () From: ( | {
         'ModuleInfo: Module: lock InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'lock' -> () From: ( | {
         'ModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'lock' -> () From: ( | {
         'ModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: blk = ( |
            | 
            debug ifTrue: [blk assert].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: private'
        
         assertLockHeld = ( |
            | 
            assert: [0 < lockCount].
            assert: [isHeldByThisProcess]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: unlocking\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: private'
        
         basicUnlock = ( |
            | 
            basicUnlockUsing: [sema signal].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: unlocking\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: private'
        
         basicUnlockUsing: blk = ( |
            | 
            assertLockHeld.
            lockCount: 0.
            holderProcess: nil.
            blk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: copying and (re)initializing \x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy init).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: debugging\x7fComment: Whether to test assertions (for debugging).\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         debug = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: unlocking\x7fComment: Perform just enough unlock operations to release
this lock. Return how many unlocks where performed.\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         forceUnlock = ( |
             lc <- 0.
            | 
            lc: lockCount.
            basicUnlock.
            assert: [holderProcess isNil && [sema isAvailable]].
            lc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: structured operations\x7fCategory: forceUnlock\x7fComment: Like \'forUnlockForWaitOn:TimeOut:\' but without timeout.\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         forceUnlockForWaitOn: waitSema = ( |
            | 
            forceUnlockForWaitOn: waitSema TimeOut: waitSema noTimeOut).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: structured operations\x7fCategory: forceUnlock\x7fComment: Atomically unlock (in the sense of \'forceUnlock\') and then
wait on the semaphore \'waitSema\' with timeout \'ms\'. Once this
wait operation completes, reacquire the lock. Return result
of wait operation.\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         forceUnlockForWaitOn: waitSema TimeOut: ms = ( |
             lc <- 0.
             res.
            | 
            assertLockHeld.
            lc: lockCount.
            res: (basicUnlockUsing: [sema signalAndThenWaitOn: waitSema TimeOut: ms]).
            lock: lc.    "Relock before returning."
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: copying and (re)initializing \x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: private'
        
         init = ( |
            | 
            sema: semaphore copyBinary.
            holderProcess: nil.
            lockCount: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: testing\x7fComment: Return true iff lock is not held
or is held by this process.\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         isAvailable = ( |
            | 
            holderProcess isNil || [isHeldByThisProcess]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: testing\x7fComment: Do internal consistency check on lock. Return true
iff all is well (aborting processes that hold the 
lock may put in inconsistent state). The lock can
be made consisten again by reinitializing it.\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         isConsistent = ( |
            | isFree = sema isAvailable).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: testing\x7fComment: Return true iff lock is currerntly not held by
any process.\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         isFree = ( |
            | 
            holderProcess isNil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: testing\x7fComment: Return true iff the executing process holds this lock.\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         isHeldByThisProcess = ( |
            | process this = holderProcess).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: locking\x7fComment: Acquire the lock (fast operation if current
process already holds lock).\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         lock = ( |
            | 
            isHeldByThisProcess ifFalse: [
                sema wait.
                holderProcess: process this.
            ].
            lockCount: 1 + lockCount).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: locking\x7fComment: Perform \'n\' lock opeations (no-op if \'n = 0\').\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         lock: n = ( |
            | 
            0 < n ifTrue: [
                lock.
                lockCount: (n - 1) + lockCount.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: locking\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         lockMe: me = ( |
            | lock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: locking\x7fModuleInfo: Module: lock InitialContents: FollowSlot'
        
         lockTimeOut: ms IfTimedOut: tblk = ( |
            | 
            isHeldByThisProcess ifFalse: [
                (sema waitTimeOut: ms) ifTrue: [^ tblk value].
                holderProcess: process this.
            ].
            lockCount: 1 + lockCount).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'ModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: structured operations\x7fCategory: protect\x7fComment: While holding the lock, evaluate \'blk\'.
Return result of \'blk\'.\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         protect: blk = ( |
            | 
            "For efficiency, it is worth avoiding the 'onReturn:'
             when possible (i.e., all but the first time the lock
             is claimed)."
            isHeldByThisProcess ifTrue: blk
                                 False: [lock. blk onReturn: [unlock]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: structured operations\x7fCategory: protect\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         protect: blk Me: me = ( |
            | protect: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: structured operations\x7fCategory: protect\x7fModuleInfo: Module: lock InitialContents: FollowSlot'
        
         protect: blk TimeOut: ms IfTimedOut: tblk = ( |
            | 
            "For efficiency, it is worth avoiding the 'onReturn:'
             when possible (i.e., all but the first time the lock
             is claimed)."
            isHeldByThisProcess ifTrue: blk
                                 False: [
                    lockTimeOut: ms IfTimedOut: [^ tblk value]. 
                    blk onReturn: [unlock]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: structured operations\x7fCategory: protectNoNLR\x7fComment: Like \'protect:\' but blk is not allowed to do a non-local
return through this activation (nor is any block invoked
by \'blk\' allowed to do so)!\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         protectNoNLR: blk = ( |
            | 
            isHeldByThisProcess ifTrue: blk
                                 False: [|res|
                lock.
                res: blk value.
                unlock.
                res.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: structured operations\x7fCategory: protectNoNLR\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         protectNoNLR: blk Me: me = ( |
            | 
            protectNoNLR: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: structured operations\x7fCategory: protectSafeNLR\x7fComment: Like \'protectNoNLR:\' but NLR is allowed if \'blk\'
first invokes its argument block (which will unlock).\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         protectSafeNLR: blk = ( |
            | 
            isHeldByThisProcess ifTrue: [blk value: []]
                                 False: [|res|
                lock.
                res: (blk value: [unlock]).
                unlock.
                res.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: structured operations\x7fCategory: protectSafeNLR\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         protectSafeNLR: blk Me: me = ( |
            | protectSafeNLR: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: copying and (re)initializing \x7fComment: Reinitialize lock to force it into
consistent and free state (see category \'testing\').
Careful: this operation should only be performed when
it is known that no processes are accessing the lock.\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         reinitialize = ( |
            | 
            init).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: transporting\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            'lock copy').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: transporting\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | lock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: unlocking\x7fComment: Release the lock. Only call after lock was acquired. \x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         unlock = ( |
            | 
            assertLockHeld.
            1 = lockCount ifTrue: [basicUnlock]
                           False: [lockCount: -1 + lockCount].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: unlocking\x7fComment: Perform \'n\' unlocks. \x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         unlock: n = ( |
            | 
            assertLockHeld.
            assert: [0 > n. "negative unlock count not  allowed"].
            lockCount compare: n IfLess: [error: 'too many unlocks']
                                  Equal: [basicUnlock]
                                Greater: [lockCount: lockCount - n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lock' -> () From: ( | {
         'Category: unlocking\x7fModuleInfo: Module: lock InitialContents: FollowSlot\x7fVisibility: public'
        
         unlockMe: me = ( |
            | unlock).
        } | ) 



 '-- Side effects'

 globals modules lock postFileIn
