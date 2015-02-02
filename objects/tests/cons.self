 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fCategory: benchmarking\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         cons = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'cons' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals cons.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'cons' -> () From: ( | {
         'ModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         car.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'cons' -> () From: ( | {
         'ModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         cdr.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> () From: ( | {
         'ModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         cons = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits bench cons.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'cons' -> () From: ( | {
         'ModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: cons InitialContents: FollowSlot'
        
         cons = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'cons' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'cons' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules cons.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cons' -> () From: ( | {
         'ModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cons' -> () From: ( | {
         'ModuleInfo: Module: cons InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cons' -> () From: ( | {
         'ModuleInfo: Module: cons InitialContents: FollowSlot'
        
         myComment <- 'A Lisp-like cons cell.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cons' -> () From: ( | {
         'ModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cons' -> () From: ( | {
         'ModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         < x = ( |
            | 
                == x     ifTrue:  [^ false].
            car compare: x car
                IfLess: true
                Equal: [
                cdr ifNil: [ x cdr isNotNil] IfNotNil: [ cdr <  x cdr ]
            ] Greater: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | 
                == x     ifTrue:  [^ true].
            car =  x car ifFalse: [^ false].
            cdr          ifNil:   [^ x cdr isNil].
            cdr =  x cdr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         caaar = ( |
            | caar car).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         caadr = ( |
            | cadr car).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         caar = ( |
            | car  car).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         cadar = ( |
            | cdar car).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         caddr = ( |
            | cddr car).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         cadr = ( |
            | cdr  car).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         cdaar = ( |
            | caar cdr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         cdadr = ( |
            | cadr cdr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         cdar = ( |
            | car  cdr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         cddar = ( |
            | cdar cdr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         cdddr = ( |
            | cddr cdr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         cddr = ( |
            | cdr  cdr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: x IfLess: lb Equal: eb Greater: gb = ( |
            | 
            car compare: x car  
                IfLess: lb  
                Equal: [
                 cdr ifNil: [ 
                    x cdr  ifNil: eb IfNotNil: lb
                 ] IfNotNil: [ 
                    cdr compare: x cdr IfLess: lb  Equal: eb  Greater: gb 
                 ]
            ]   Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | (clone car: car copy) cdr: cdr copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | car hash ^^ cdr hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'ModuleInfo: Module: cons InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'orderedClonable' -> ().
        } | ) 



 '-- Side effects'

 globals modules cons postFileIn
