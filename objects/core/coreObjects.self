 '30.13.0'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: coreObjects InitialContents: FollowSlot'
        
         coreObjects = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'coreObjects' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'coreObjects' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules coreObjects.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreObjects' -> () From: ( | {
         'ModuleInfo: Module: coreObjects InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreObjects' -> () From: ( | {
         'ModuleInfo: Module: coreObjects InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreObjects' -> () From: ( | {
         'ModuleInfo: Module: coreObjects InitialContents: FollowSlot'
        
         myComment <- '\'oldStyleRectangles will be removed in the near future\''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreObjects' -> () From: ( | {
         'ModuleInfo: Module: coreObjects InitialContents: InitializeToExpression: (\'30.13.0\')\x7fVisibility: public'
        
         revision <- '30.13.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreObjects' -> () From: ( | {
         'ModuleInfo: Module: coreObjects InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'errorHandling
block
nil
boolean
number
integer
smallInt
float
collection
indexable
vector
sequence
sortedSequence
sending
list
collector
string
priorityQueue
tree
orderedSet
setAndDictionary
annotation
moduleInfo
selector
message
time
pair
point
rectangle
oldStyleRectangle
visibility
mirror
slot
snapshotAction
hosts
caseStatement
systemOddballs
memoryState
bigInt
random
path
bytecodeFormat
profiling
profiler
shell
textLines
methodText
selectionText
activationText
fakeSlot
fakeSlotsIterator
absBCInterpreter
streams
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'errorHandling' From: 'core'
 bootstrap read: 'block' From: 'core'
 bootstrap read: 'nil' From: 'core'
 bootstrap read: 'boolean' From: 'core'
 bootstrap read: 'number' From: 'core'
 bootstrap read: 'integer' From: 'core'
 bootstrap read: 'smallInt' From: 'core'
 bootstrap read: 'float' From: 'core'
 bootstrap read: 'collection' From: 'core'
 bootstrap read: 'indexable' From: 'core'
 bootstrap read: 'vector' From: 'core'
 bootstrap read: 'sequence' From: 'core'
 bootstrap read: 'sortedSequence' From: 'core'
 bootstrap read: 'sending' From: 'core'
 bootstrap read: 'list' From: 'core'
 bootstrap read: 'collector' From: 'core'
 bootstrap read: 'string' From: 'core'
 bootstrap read: 'priorityQueue' From: 'core'
 bootstrap read: 'tree' From: 'core'
 bootstrap read: 'orderedSet' From: 'core'
 bootstrap read: 'setAndDictionary' From: 'core'
 bootstrap read: 'annotation' From: 'core'
 bootstrap read: 'moduleInfo' From: 'core'
 bootstrap read: 'selector' From: 'core'
 bootstrap read: 'message' From: 'core'
 bootstrap read: 'time' From: 'core'
 bootstrap read: 'pair' From: 'core'
 bootstrap read: 'point' From: 'core'
 bootstrap read: 'rectangle' From: 'core'
 bootstrap read: 'oldStyleRectangle' From: 'core'
 bootstrap read: 'visibility' From: 'core'
 bootstrap read: 'mirror' From: 'core'
 bootstrap read: 'slot' From: 'core'
 bootstrap read: 'snapshotAction' From: 'core'
 bootstrap read: 'hosts' From: 'core'
 bootstrap read: 'caseStatement' From: 'core'
 bootstrap read: 'systemOddballs' From: 'core'
 bootstrap read: 'memoryState' From: 'core'
 bootstrap read: 'bigInt' From: 'core'
 bootstrap read: 'random' From: 'core'
 bootstrap read: 'path' From: 'core'
 bootstrap read: 'bytecodeFormat' From: 'core'
 bootstrap read: 'profiling' From: 'core'
 bootstrap read: 'profiler' From: 'core'
 bootstrap read: 'shell' From: 'core'
 bootstrap read: 'textLines' From: 'core'
 bootstrap read: 'methodText' From: 'core'
 bootstrap read: 'selectionText' From: 'core'
 bootstrap read: 'activationText' From: 'core'
 bootstrap read: 'fakeSlot' From: 'core'
 bootstrap read: 'fakeSlotsIterator' From: 'core'
 bootstrap read: 'absBCInterpreter' From: 'core'
 bootstrap read: 'streams' From: 'core'



 '-- Side effects'

 globals modules coreObjects postFileIn
