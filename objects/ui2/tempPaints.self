 '$Revision: 30.1 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: tempPaints InitialContents: FollowSlot'
        
         tempPaints = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'tempPaints' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'tempPaints' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules tempPaints.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tempPaints' -> () From: ( | {
         'ModuleInfo: Module: tempPaints InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tempPaints' -> () From: ( | {
         'ModuleInfo: Module: tempPaints InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tempPaints' -> () From: ( | {
         'ModuleInfo: Module: tempPaints InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tempPaints' -> () From: ( | {
         'ModuleInfo: Module: tempPaints InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tempPaints' -> () From: ( | {
         'ModuleInfo: Module: tempPaints InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.1 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tempPaints' -> () From: ( | {
         'ModuleInfo: Module: tempPaints InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: weird color transformations\x7fCategory: false color\x7fModuleInfo: Module: tempPaints InitialContents: InitializeToExpression: ( ((paint copyRed: 0.277615 Green: 0.0  Blue: 1.0)
	& (paint copyRed: 0.0 Green: 0.556207  Blue: 1.0)
	& (paint copyRed: 0.0 Green: 0.884653  Blue: 1.0)
	& (paint copyRed: 0.056696 Green: 1.0  Blue: 0.0)
	& (paint copyRed: 1.0 Green: 0.665689  Blue: 0.0)
	& (paint copyRed: 1.0 Green: 0.394917  Blue: 0.0)
	& (paint copyRed: 1.0 Green: 0.333333  Blue: 0.0)
	& (paint named: \'red\')) asVector)\x7fVisibility: private'
        
         brightFalseColors =  ((paint copyRed: 0.277615 Green: 0.0  Blue: 1.0)
	& (paint copyRed: 0.0 Green: 0.556207  Blue: 1.0)
	& (paint copyRed: 0.0 Green: 0.884653  Blue: 1.0)
	& (paint copyRed: 0.056696 Green: 1.0  Blue: 0.0)
	& (paint copyRed: 1.0 Green: 0.665689  Blue: 0.0)
	& (paint copyRed: 1.0 Green: 0.394917  Blue: 0.0)
	& (paint copyRed: 1.0 Green: 0.333333  Blue: 0.0)
	& (paint named: 'red')) asVector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: weird color transformations\x7fCategory: false color\x7fModuleInfo: Module: tempPaints InitialContents: InitializeToExpression: (((paint copyRed: 0.277615 Green: 0.0  Blue: 1.0)
	& (paint copyRed: 0.0 Green: 0.556207  Blue: 1.0)
	& (paint copyRed: 0.0 Green: 0.884653  Blue: 1.0)
	& (paint copyRed: 0.056696 Green: 1.0  Blue: 0.0)
	& (paint named: \'yellow\')
	& (paint copyRed: 1.0 Green: 0.665689  Blue: 0.0)
	& (paint copyRed: 1.0 Green: 0.394917  Blue: 0.0)
	& (paint copyRed: 1.0 Green: 0.333333  Blue: 0.0)
	& (paint named: \'red\')) asVector)\x7fVisibility: private'
        
         brightFalseColorsWithYellow = ((paint copyRed: 0.277615 Green: 0.0  Blue: 1.0)
	& (paint copyRed: 0.0 Green: 0.556207  Blue: 1.0)
	& (paint copyRed: 0.0 Green: 0.884653  Blue: 1.0)
	& (paint copyRed: 0.056696 Green: 1.0  Blue: 0.0)
	& (paint named: 'yellow')
	& (paint copyRed: 1.0 Green: 0.665689  Blue: 0.0)
	& (paint copyRed: 1.0 Green: 0.394917  Blue: 0.0)
	& (paint copyRed: 1.0 Green: 0.333333  Blue: 0.0)
	& (paint named: 'red')) asVector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: weird color transformations\x7fCategory: false color\x7fComment: from cool to hot, where p is in [0, 1]\x7fModuleInfo: Module: tempPaints InitialContents: FollowSlot\x7fVisibility: public'
        
         forTemperature: p = ( |
             ap.
             cs.
             s.
             x.
            | 
            cs:
              false ifTrue: 
                [('blue' & 'green' & 'yellow' & 'pumpkin' & 'red') asVector copyMappedBy: [|:s| paint named: s]]
              False: [brightFalseColorsWithYellow].
            x: cs size asFloat inverse.
            ap: p * cs size pred.
            ((cs at: ap floor)) interpolate: (ap - ap floor) From: (cs at: ap ceil)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: weird color transformations\x7fCategory: false color\x7fModuleInfo: Module: tempPaints InitialContents: InitializeToExpression: (((paint copyRed: 0.521994 Green: 0.40567  Blue: 0.824047)
	& (paint copyRed: 0.312805 Green: 0.597263  Blue: 0.824047)
	& (paint copyRed: 0.381232 Green: 0.773216  Blue: 0.824047)
	& (paint copyRed: 0.352884 Green: 0.71261  Blue: 0.331378)
	& (paint copyRed: 0.71261 Green: 0.626588  Blue: 0.455523)
	& (paint copyRed: 0.778104 Green: 0.494624  Blue: 0.309873)
	& (paint copyRed: 0.778104 Green: 0.336266  Blue: 0.115347)
	& (paint copyRed: 0.778104 Green: 0.115347  Blue: 0.115347)) asVector)\x7fVisibility: private'
        
         mutedFalseColors = ((paint copyRed: 0.521994 Green: 0.40567  Blue: 0.824047)
	& (paint copyRed: 0.312805 Green: 0.597263  Blue: 0.824047)
	& (paint copyRed: 0.381232 Green: 0.773216  Blue: 0.824047)
	& (paint copyRed: 0.352884 Green: 0.71261  Blue: 0.331378)
	& (paint copyRed: 0.71261 Green: 0.626588  Blue: 0.455523)
	& (paint copyRed: 0.778104 Green: 0.494624  Blue: 0.309873)
	& (paint copyRed: 0.778104 Green: 0.336266  Blue: 0.115347)
	& (paint copyRed: 0.778104 Green: 0.115347  Blue: 0.115347)) asVector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: weird color transformations\x7fCategory: false color\x7fModuleInfo: Module: tempPaints InitialContents: InitializeToExpression: (((paint copyRed: 0.228739 Green: 0.0  Blue: 0.824047)
	& (paint copyRed: 0.0 Green: 0.458456  Blue: 0.824047)
	& (paint copyRed: 0.0 Green: 0.729228  Blue: 0.824047)
	& (paint copyRed: 0.0400782 Green: 0.71261  Blue: 0.0)
	& (paint copyRed: 0.71261 Green: 0.474096  Blue: 0.0)
	& (paint copyRed: 0.778104 Green: 0.30694  Blue: 0.0)
	& (paint copyRed: 0.778104 Green: 0.259042  Blue: 0.0)
	& (paint copyRed: 0.778104 Green: 0.0  Blue: 0.0)) asVector)\x7fVisibility: private'
        
         saturatedFalseColors = ((paint copyRed: 0.228739 Green: 0.0  Blue: 0.824047)
	& (paint copyRed: 0.0 Green: 0.458456  Blue: 0.824047)
	& (paint copyRed: 0.0 Green: 0.729228  Blue: 0.824047)
	& (paint copyRed: 0.0400782 Green: 0.71261  Blue: 0.0)
	& (paint copyRed: 0.71261 Green: 0.474096  Blue: 0.0)
	& (paint copyRed: 0.778104 Green: 0.30694  Blue: 0.0)
	& (paint copyRed: 0.778104 Green: 0.259042  Blue: 0.0)
	& (paint copyRed: 0.778104 Green: 0.0  Blue: 0.0)) asVector.
        } | ) 



 '-- Side effects'

 globals modules tempPaints postFileIn
