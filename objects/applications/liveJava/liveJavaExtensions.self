 '$Revision: 1.2 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> () From: ( | {
         'Category: not really java\x7fModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         closure = bootstrap define: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'closure' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit parseNodes node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'closure' -> () From: ( |
             {} = 'Comment: The shared, abstract part of parseNode\'s.
A parseNode will typically have construction-specific
data slots, such as thenPart for an if-node.
It also behaves as a collection for its subnodes.
And, it knows the previous and next nodes.\x7fModuleInfo: Creator: globals javaParser parseNodes closure.

CopyDowns:
globals parseKit parseNodes node. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'closure' -> () From: ( | {
         'ModuleInfo: Module: liveJavaExtensions InitialContents: InitializeToExpression: (parseKit parseNodes node)'
        
         argumentList <- bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'closure' -> () From: ( | {
         'ModuleInfo: Module: liveJavaExtensions InitialContents: InitializeToExpression: (parseKit parseNodes node)'
        
         block <- bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'closure' -> () From: ( | {
         'ModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'closure' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals javaParser parseNodes closure parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'closure' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentList = ( |
            | 
            subnodes at: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'closure' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         block = ( |
            | subnodes last).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'closure' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         copyResultType: rt ArgumentList: al Block: b = ( |
            | 
            ((copy addSubnode: rt) addSubnode: al) addSubnode: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'closure' -> 'parent' -> () From: ( | {
         'Category: semantics\x7fModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         javaPrecedence = 200.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'closure' -> 'parent' -> () From: ( | {
         'Category: semantics\x7fModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         needJavaParenthesesFor: n = ( |
            | 
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'closure' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> 'closure' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         resultType = ( |
            | subnodes first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot'
        
         liveJavaExtensions = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaExtensions' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaExtensions' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules liveJavaExtensions.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaExtensions' -> () From: ( | {
         'ModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/liveJava'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaExtensions' -> () From: ( | {
         'ModuleInfo: Module: liveJavaExtensions InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaExtensions' -> () From: ( | {
         'ModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaExtensions' -> () From: ( | {
         'ModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaExtensions' -> () From: ( | {
         'ModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaExtensions' -> () From: ( | {
         'ModuleInfo: Module: liveJavaExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules liveJavaExtensions postFileIn
