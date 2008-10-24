 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: allOutliner InitialContents: FollowSlot'
        
         allOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'allOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'allOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules allOutliner.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allOutliner' -> () From: ( | {
         'ModuleInfo: Module: allOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allOutliner' -> () From: ( | {
         'ModuleInfo: Module: allOutliner InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allOutliner' -> () From: ( | {
         'ModuleInfo: Module: allOutliner InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allOutliner' -> () From: ( | {
         'ModuleInfo: Module: allOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allOutliner' -> () From: ( | {
         'ModuleInfo: Module: allOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'outlinerPreferences
larsText
motifWidgets
outlinerWidgets
outliner
moduleWidgets
browseMorphs
syntaxErrorMorph
debuggerWidgets
allPluggableOutliner
powerOperations
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'outlinerPreferences' From: 'ui2/outliner'
 bootstrap read: 'larsText' From: 'ui2/outliner'
 bootstrap read: 'motifWidgets' From: 'ui2/outliner'
 bootstrap read: 'outlinerWidgets' From: 'ui2/outliner'
 bootstrap read: 'outliner' From: 'ui2/outliner'
 bootstrap read: 'moduleWidgets' From: 'ui2/outliner'
 bootstrap read: 'browseMorphs' From: 'ui2/outliner'
 bootstrap read: 'syntaxErrorMorph' From: 'ui2/outliner'
 bootstrap read: 'debuggerWidgets' From: 'ui2/outliner'
 bootstrap read: 'allPluggableOutliner' From: 'ui2/outliner'
 bootstrap read: 'powerOperations' From: 'ui2/outliner'



 '-- Side effects'

 globals modules allOutliner postFileIn
