 'Sun-$Revision: 30.73 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: reflection\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         mirrors = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mirrors' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mirrors.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         assignment = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'assignment' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors assignment.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'assignment' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'assignment' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'assignment' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors assignment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         block = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors block.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         blockMethod = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors blockMethod.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors blockMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         blockMethodActivation = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethodActivation' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors blockMethodActivation.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'blockMethodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         liveParent = bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethodActivation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'blockMethodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: InitializeToExpression: (process)\x7fVisibility: public'
        
         myProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'blockMethodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         number <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         deadActivation = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'deadActivation' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors deadActivation.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'blockMethodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'mirrors' -> 'deadActivation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'blockMethodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors blockMethodActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         byteVector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'byteVector' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors byteVector.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors byteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         canonicalString = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'canonicalString' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors canonicalString.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'canonicalString' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'canonicalString' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'canonicalString' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors canonicalString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         deadActivation = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mirrors' -> 'deadActivation' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mirrors deadActivation.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'deadActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: InitializeToExpression: (process)\x7fVisibility: public'
        
         myProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'deadActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         number <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'deadActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'deadActivation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'deadActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | mirrors deadActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         fctProxy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'fctProxy' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors fctProxy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'fctProxy' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'fctProxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'fctProxy' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors fctProxy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         float = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'float' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors float.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'float' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors float).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         method = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors method.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors method).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         methodActivation = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'methodActivation' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors methodActivation.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'methodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         liveParent = bootstrap stub -> 'traits' -> 'mirrors' -> 'methodActivation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'methodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: InitializeToExpression: (process)\x7fVisibility: public'
        
         myProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'methodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         number <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'methodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'mirrors' -> 'deadActivation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'methodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors methodActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         mirror = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'mirror' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors mirror.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'mirror' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'mirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'mirror' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         process = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'process' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors process.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors process).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         profiler = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'profiler' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors profiler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'profiler' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'profiler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'profiler' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors profiler).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         proxy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'proxy' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors proxy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors proxy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         slots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'slots' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors slots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'slots' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors slots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         smallInt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'smallInt' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors smallInt.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'smallInt' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors smallInt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         vector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'vector' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors vector.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'vector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | mirrors vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot'
        
         mirror = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'mirror' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'mirror' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules mirror.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mirror' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mirror' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mirror' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot'
        
         myComment <- 'Behavior for reflection objects
Mirrors behave like vectors of slots.
Prototypical reflection objects.

Warning!!!!!!!
The _Define primitive currently replaces mirrors when their reflectees
are _Defined. Do not put any state in mirrors -- dmu 2/93'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mirror' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.73 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mirror' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'metaCollections
mirrorProgramming
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: reflection\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflectionPrimitives = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( |
             {} = 'Comment: This object encapsulates all the low-level reflection
functionality - all the calls to primitives like
_MirrorNames, etc.

This makes it possible to create different kinds of
mirrors (e.g. mirrors that reflect on remote objects
in another image) that share the same traits objects
as regular Self mirrors.

-- Adam, 4/06\x7fModuleInfo: Creator: globals reflectionPrimitives.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m AnnotationAt: n IfFail: fb = ( |
            | 
            m _MirrorAnnotationAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m CodesIfFail: fb = ( |
            | 
            m _MirrorCodesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m CodesMirrorIfFail: fb = ( |
            | 
            reflect: forActivationMirror: m CodesIfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m ContentsAt: n IfFail: fb = ( |
            | 
            m _MirrorContentsAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m ExpressionStackIfFail: fb = ( |
            | 
            m _MirrorExpressionStackIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m IfDead: blk = ( |
            | 
            forActivationMirror: m NamesIfFail: [|:error|
                ('noActivationError' isPrefixOf: error) ifTrue: [
                    m parent: traits mirrors deadActivation.
                    ^ blk value.
                ].
            ].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m IsArgumentAt: n IfFail: fb = ( |
            | 
            m _MirrorIsArgumentAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m IsAssignableAt: n IfFail: fb = ( |
            | 
            m _MirrorIsAssignableAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m IsAssignmentAt: n IfFail: fb = ( |
            | 
            (forActivationMirror: m ContentsAt: n IfFail: [|:e| ^ fb value: e]) isReflecteeAssignment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m IsParentAt: n IfFail: fb = ( |
            | 
            m _MirrorIsParentAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m LexicalParentIfFail: fb = ( |
            | 
            m _MirrorLexicalParentIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m LiteralsIfFail: fb = ( |
            | 
            m _MirrorLiteralsIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m LiteralsMirrorIfFail: fb = ( |
            | 
            reflect: forActivationMirror: m LiteralsIfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m MethodHolderIfFail: fb = ( |
            | 
            m _MirrorMethodHolderIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m NamesIfFail: fb = ( |
            | 
            m _MirrorNamesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m PositionIfFail: fb = ( |
            | 
            m _MirrorByteCodePositionIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m ReceiverIfFail: fb = ( |
            | 
            m _MirrorReceiverIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m ReflecteeEq: x IfFail: fb = ( |
            | 
            m _MirrorReflecteeEq: x IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m ReflecteeIdentityHashIfFail: fb = ( |
            | 
            m _MirrorReflecteeIdentityHashIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m SelectorIfFail: fb = ( |
            | 
            m _MirrorSelectorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m SelectorMirrorIfFail: fb = ( |
            | 
            reflect: forActivationMirror: m SelectorIfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m SenderIfFail: fb = ( |
            | 
            m _MirrorSenderIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m SourceIfFail: fb = ( |
            | 
            m _MirrorSourceIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: activations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forActivationMirror: m SourceMirrorIfFail: fb = ( |
            | 
            reflect: forActivationMirror: m SourceIfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fCategory: block methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forBlockMethodMirror: m CreateBlockIfFail: fb = ( |
            | 
            m _MirrorCreateBlockIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fCategory: block methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forBlockMethodMirror: m LexicalParentIfFail: fb = ( |
            | 
            m _MirrorLexicalParentIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: blocks\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forBlockMirror: m LexicalParentIfFail: fb = ( |
            | 
            m _MirrorLexicalParentIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: byte vectors\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forByteVectorMirror: m ReflecteeAt: idx IfFail: fb = ( |
            | 
            m reflectee _ByteAt: idx IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: byte vectors\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forByteVectorMirror: m ReflecteeAt: idx Put: val IfFail: fb = ( |
            | 
            m reflectee _ByteAt: idx Put: val IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: byte vectors\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forByteVectorMirror: m ReflecteeBytesIfFail: fb = ( |
            | 
            m reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: byte vectors\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forByteVectorMirror: m ReflecteeMirrorAt: idx IfFail: fb = ( |
            | 
            reflect: forByteVectorMirror: m ReflecteeAt: idx IfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: byte vectors\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forByteVectorMirror: m ReflecteeSizeIfFail: fb = ( |
            | 
            m reflectee _ByteSizeIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m AllSlotsOnThisMethodIfFail: fb = ( |
            | 
            m asList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m CodesIfFail: fb = ( |
            | 
            m _MirrorCodesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m CodesMirrorIfFail: fb = ( |
            | 
            reflect: forMethodMirror: m CodesIfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m FileIfFail: fb = ( |
            | 
            m _MirrorFileIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m FileMirrorIfFail: fb = ( |
            | 
            reflect: forMethodMirror: m FileIfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m LineIfFail: fb = ( |
            | 
            m _MirrorLineIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m LineMirrorIfFail: fb = ( |
            | 
            reflect: forMethodMirror: m LineIfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m LiteralsIfFail: fb = ( |
            | 
            m _MirrorLiteralsIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m LiteralsMirrorIfFail: fb = ( |
            | 
            reflect: forMethodMirror: m LiteralsIfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m NameAt: index IfFail: fb = ( |
            | 
            m _MirrorNameAt: index IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: not exactly primitives\x7fComment: return the pc, subtracting out
index bytecodes
-- Ungar, 1/1/95

 Need position for position table, does not take into account
 local access optimization, or index bytecodes.
 So the lexicalLevel bytecode needs to be ignored,
 but the read/write local codes correspond to 1 send each,
 and can be counted like regular bytecodes--dmu\"

 This is an ugly little method. Mario advocates
 redoing the position table primitive to take an 
 additional argument, the method\'s codes.
 Then by parsing the source and looking at the codes in
 the method, the primitive could correct the position table
 in the VM.
 The primitive could just take the method and get the
 source from it, but that would be less flexible than
 taking source and codes arguments separately.

-- Ungar 7/29/96

And now, I have hacked it further to compensate for the
instruction set selection bytecode. Also, must omit
arg count bytecodes since local accesors do not use them.

-- Ungar 10/6/2001\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m PositionForPositionTableAtBCI: bci = ( |
             c.
             i.
             noSlotsNonILBCs <- 0.
             origIS.
             origNonILBCs <- 0.
             reparseHasFmtBC.
             reparseIS.
            | 

            "Not exactly a primitive operation, but this needs to
             be different between Self and Klein/Yoda. -- Adam, 5/06"

            c: m codes.
            origIS: bytecodeFormat instructionSetForCodes: c.
            i: origIS firstBCI.

            [|:exit. bc. n|
              i <= bci  ifFalse: exit.
              bc: c byteAt: i.
              n: origIS opcodeNameOf: bc.
                  (n = 'lexicalLevel') 
              || [(n = 'index')
              || [ n = 'argumentCount']]
                ifFalse: [origNonILBCs: origNonILBCs succ].
              i: i succ.
            ] loopExit.

            c: m source parseObjectBody codes.
            reparseIS: bytecodeFormat instructionSetForCodes: c.
            i: reparseIS firstBCI.

            [|:exit. bc. n|
              i < c size  ifFalse: exit.
              bc: c byteAt: i.
              n: reparseIS opcodeNameOf: bc.
                  (n = 'lexicalLevel') 
              || [(n = 'index')
              || [ n = 'argumentCount']]
               ifFalse: [ 
                  noSlotsNonILBCs: noSlotsNonILBCs succ.
                origNonILBCs = noSlotsNonILBCs ifTrue: [^ i ].
              ].
              i: i succ.
            ] loopExit.
            c size pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m ReflecteeAt: i IfFail: fb = ( |
            | 
            "Added for Klein and Yoda, where methods are vectors."
            fb value: 'not a vector').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m ReflecteeAt: i Put: val IfFail: fb = ( |
            | 
            "Added for Klein and Yoda, where methods are vectors."
            fb value: 'not a vector').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m ReflecteeMirrorAt: i IfFail: fb = ( |
            | 
            "Added for Klein and Yoda, where methods are vectors."
            fb value: 'not a vector').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m ReflecteeSizeIfFail: fb = ( |
            | 
            "Added for Klein and Yoda, where methods are vectors."
            fb value: 'not a vector').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m SourceIfFail: fb = ( |
            | 
            m _MirrorSourceIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m SourceLengthIfFail: fb = ( |
            | 
            m _MirrorSourceLengthIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m SourceLengthMirrorIfFail: fb = ( |
            | 
            reflect: forMethodMirror: m SourceLengthIfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m SourceMirrorIfFail: fb = ( |
            | 
            reflect: forMethodMirror: m SourceIfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m SourceOffsetIfFail: fb = ( |
            | 
            m _MirrorSourceOffsetIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: methods\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMethodMirror: m SourceOffsetMirrorIfFail: fb = ( |
            | 
            reflect: forMethodMirror: m SourceOffsetIfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: slot-like primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m AnnotationAt: n IfFail: fb = ( |
            | 
            m _MirrorAnnotationAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: annotation\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m AnnotationIfFail: fb = ( |
            | 
            m _MirrorAnnotationIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: slot-like primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m ContentsAt: n IfFail: fb = ( |
            | 
            m _MirrorContentsAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: annotation\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m CopyAnnotation: a IfFail: fb = ( |
            | 
            m _MirrorCopyAnnotation: a IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: programming primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m CopyAt: n Put: objMirr IsParent: p IsArgument: isA Annotation: a IfFail: fb = ( |
            | 
            m  _MirrorCopyAt:  n
                         Put:  objMirr
                    IsParent:  p
                  IsArgument:  isA
                  Annotation:  a
                      IfFail:  fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: programming primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m CopyRemoveSlot: n IfFail: fb = ( |
            | 
            m _MirrorCopyRemoveSlot: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: replacing one object with another\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m Define: newObjMir IfFail: fb = ( |
            | 
            m _MirrorDefine: newObjMir IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: not exactly primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m EvalNameIfNoStoreStringOrCreatorNameIfFail: fb = ( |
            | 
            "Not exactly a primitive operation, but this needs to
             be different between Self and Klein/Yoda. -- Adam, 5/06"

            [ 0 _AsObject ]. "browsing"
            ( m reflecteeID printString, ' _AsObject' ),
            ( ( m isOKToSend: 'printString' )  
                    ifFalse: ''
                    True: [' "', (m reflectee printStringSize: 10), '"'])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: evaluating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m Evaluate: otherMir = ( |
            | 
            m _MirrorEvaluate: otherMir).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: slot-like primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m IsArgumentAt: n IfFail: fb = ( |
            | 
            m _MirrorIsArgumentAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: slot-like primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m IsAssignableAt: n IfFail: fb = ( |
            | 
            m _MirrorIsAssignableAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: not exactly primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m IsAssignmentAt: n IfFail: fb = ( |
            | 
            "Not exactly a primitive operation, but this needs to
             be different between Self and Klein/Yoda. -- Adam, 5/06"

            (forMirror: m ContentsAt: n IfFail: [|:e| ^ fb value: e]) isReflecteeAssignment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: not exactly primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m IsOKToSend: selector = ( |
            | 
            "Not exactly a primitive operation, but this needs to
             be different between Self and Klein/Yoda. -- Adam, 5/06"

            m isComplete && [ m completeObjectSelectors includes: selector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: slot-like primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m IsParentAt: n IfFail: fb = ( |
            | 
            m _MirrorIsParentAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: not exactly primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m NameSuffixIfFail: fb = ( |
            | 
            "Not exactly a primitive operation, but this needs to
             be different between Self and Klein/Yoda. -- Adam, 5/06"

            '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: names\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m NamesIfFail: fb = ( |
            | 
            m _MirrorNamesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m ReflecteeEq: x IfFail: fb = ( |
            | 
            m _MirrorReflecteeEq: x IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m ReflecteeIDIfFail: fb = ( |
            | 
            m reflectee _ObjectIDIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m ReflecteeIdentityHashIfFail: fb = ( |
            | 
            m _MirrorReflecteeIdentityHashIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: reflectee\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forMirror: m ReflecteeIfFail: fb = ( |
            | 
            m _MirrorReflecteeIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: object vectors\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forVectorMirror: m ReflecteeAt: idx IfFail: fb = ( |
            | 
            m reflectee _At: idx IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: object vectors\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forVectorMirror: m ReflecteeAt: idx Put: val IfFail: fb = ( |
            | 
            m reflectee _At: idx Put: val IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: object vectors\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forVectorMirror: m ReflecteeMethodPointerIfFail: fb = ( |
            | 
            m reflectee _MethodPointerIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: object vectors\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forVectorMirror: m ReflecteeMirrorAt: idx IfFail: fb = ( |
            | 
            reflect: forVectorMirror: m ReflecteeAt: idx IfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: different kinds of objects\x7fCategory: object vectors\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         forVectorMirror: m ReflecteeSizeIfFail: fb = ( |
            | 
            m reflectee _SizeIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'Category: not exactly primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToTransformAnnotationOfAbstractMirrorAfterParsing = ( |
            | 
            "Not exactly a primitive operation, but this needs to
             be different between Self and Klein/Yoda. -- Adam, 5/06"

            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectionPrimitives' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractMirror = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( |
             {} = 'Comment: 

These were restructured by David Ungar June, 1994.
Most programming changes are done with slot objects instead of mirrors,
but here is a summary of the public things mirros do:

 Each of these messages can take an optional \"IfFail: failBlock\"
 argument at the end if the user wishes to catch fail blocks.

 Each of them cann be prefixed
 by the word copy (e.g. at:PutContents: vs. copyAt:PutContents:)
 in order to leave the reciever alone but obtain a clone with the desired
 change. (The copy versions are faster.)

 at: slotName PutContents: aMirror -- change the contents of an existing slot,
				      or make a new slot with given contents

 addSlot: aSlot -- add or replace a slot (same as add:)
 addSlots: collectionOfSlots -- add or replace all slots in the collection (same as addAll:)
 addSlotsIfAbsent: collectionOfSlots -- add only those slots not in the receiver

 copyDowns: collectionOfCopyDowns -- set copyDowns in module info 
 comment: aString -- set comment in annotation
 creatorSlot: aSlot -- set creator slot in module info
 creatorPath: aPath -- set creator path in module info

 moduleInfo: anObjectInfo -- set moduleInfo (see transporter moduleInfo objectInfo)
			     (moduleInfo objects are immutable)

 annotation: anObjectAnnotation -- set annotation, (annos are immutable)
			    
 removeAllSlots -- (same as removeAll)

The following messages have no function (copy-) versions:

 define: aMirror -- redirect all pointers to receiver to point to a clone of aMirror instead,
		    return the clone

frozenDefine: aMirror -- like define, but do not advance ProgrammingTimestamp
	      (used for things that should not obsolete the module dictionary)

defineAndSave: aMirror -- like define, but also incrementally updates the
	       module dictionary, and someday will incrementally fileout
	       the change. (used by the nonfunctional programming methods
	        here and in traits slots plain)

 cloneReflectee -- return a mirror containing a clone of the reflectee

The following applies only to block mirrors:

copyForMethod: blockMethodMirror -- returns a mirror on a copy of the block 
				    with its value slot set to the argument

The following may be sent to \"mirrors blockMethod\":

 createBlockMethod_Bytecodes: aByteVector Literals: aVector File: aString Line: aSmallInt Source: aString
  -- creates a new blockMethod (eturns a mirror on it)			     


The following may be sent to \"mirrors method\":

 createOuterMethod_Bytecodes: aByteVector Literals: aVector File: aString Line: aSmallInt Source: aString
  -- creates a new outerMethod (eturns a mirror on it)			     

The following may be sent to either an outerMethod mirror or a blockMethod mirror to
create the same kind of method:

 copyBytecodes: aByteVector Literals: aVector File: aString Line: aSmallInt Source: aString
\x7fModuleInfo: Creator: traits mirrors abstractMirror.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         < x = ( |
            | error: 'mirrors are not ordered').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: comparing\x7fComment: avoid the performance hit of collection =\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | == x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: comparing\x7fComment: Two different mirrors on the same object are indistinguishable; that
          is, they are both == and = to each other. The hash of a mirror is the
          identity hash of its reflectee.\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         == x = ( |
            | 
            reflecteeEq: x IfFail: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: changing objects preserving copy-downs\x7fCategory: adding\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         addCopiedDownSlotsToMeAndDescendants: slots From: parent = ( |
             cdToChange.
             copiedParent.
             copiedParentIsAParent.
             newMe.
             slotsToAdd.
             slotsToAsk.
             slotsToOmit.
            | 

            slots isEmpty ifTrue: [^ self]. "optimization"

            cdToChange: copyDownForParent: parent IfAbsent: [^ self].

            slotsToAdd:        list copyRemoveAll.
            slotsToOmit:       list copyRemoveAll.
            slotsToAsk:        list copyRemoveAll.

            copiedParent: cdToChange copiedParentMirror.

            "Do not copy methods or other constants"
            " of cd parent is same as a regular parent"

            copiedParentIsAParent: 
              anySatisfy: [|:s| s isParent && [s contents = cdToChange parentMirror]].

            (removeRedundantAssignmentSlotsFrom: slots) do: [| :s. n. | 
              n: s name.

              ( includesKey: n )  ifTrue: [ | ss | ss: at: n.
                ( ss isCopiedDown && [ss couldBeACopiedDownCopyOf:  parent at: n] )
                   ifTrue: [ slotsToAdd addLast: s ]
                    False: [ slotsToAsk addLast: s ].
              ] False: [
                copiedParentIsAParent && [s isAssignable not]
                  ifTrue: [ slotsToOmit addLast: s ]
                   False: [ slotsToAdd  addLast: s ].
              ].
            ].
            slotsToAdd copy do: [|:s| 
              s isAssignable  && [slots includes: s correspondingAssignmentSlot] 
                ifTrue: [slotsToAdd addLast: s correspondingAssignmentSlot]].
            newMe: copyAddSlots: slotsToAdd.

            cdToChange:
              cdToChange copyForSlotsToOmit: [| :sto |  
                sto asSet addAll: ( slotsToOmit copy addAll: slotsToAsk )
                                    copyMappedBy: [| :s |  s name]].

            newMe replaceCopyDownForParent: parent With: cdToChange IfAbsent: [error: 'Where is it?'].

            defineAndSave: newMe.

            ( transporter moduleDictionary copyDownChildrenOf: self )  do: [| :c | 
              c addCopiedDownSlotsToMeAndDescendants: slotsToAdd From: self.
            ].

            slotsToAsk do: [| :s. n. a | 
              n: s name.
              a:  userQuery askMultipleChoice: 'Slot "', n, '" is already present in "', name, '.'
                                      Choices: ('Add it anyway' & 'Omit from copying-down') asVector
                                      Results: ('add' & 'omit') asVector.
              a = 'add' ifTrue: [ |ss|
                ss: copiedParent at: n.
                addSlot: ss.
                cdToChange: cdToChange copyForSlotsToOmit: [| :sto |  sto asSet remove: n IfAbsent: [sto]].
                replaceCopyDownForParent: parent With: cdToChange IfAbsent: [error: 'Where is it?'].
                ( transporter moduleDictionary copyDownChildrenOf: self )  do: [| :c | 
                  c addCopiedDownSlotsToMeAndDescendants: (vector copyAddFirst: ss) From: self.
                ].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: changing objects preserving copy-downs\x7fCategory: adding\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         addSlotsToMeAndDescendants: slots = ( |
             newCDs.
             newMe.
            | 

            slots isEmpty ifTrue: [^ self]. "optimization"

            newCDs: copyDowns copy asVector.

            (removeRedundantAssignmentSlotsFrom: slots) do: [|:s|
              [|:exit|
                (at: s name IfAbsent: exit) copyDownInfoIfPresent: [|:cd. :i|
                   newCDs:  newCDs at: i Put: 
                              (newCDs at: i) copyForSlotsToOmit: [|:sto| sto asSet add: s name].
                ] IfAbsent: [].
              ] exit.
            ].
            newMe: self.
            copyDowns = newCDs ifFalse: [newMe: newMe copyCopyDowns: newCDs].
            newMe: newMe copyAddSlots: slots.
            defineAndSave: newMe.

            (transporter moduleDictionary copyDownChildrenOf: self) do: [|:c|
              c addCopiedDownSlotsToMeAndDescendants: slots From: self
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         allBlockLiteralsDo: blk = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         allLiteralsDo: b = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: ancestors\x7fComment: Return all my ancestors, up to but not including stopHere.
-- Ungar, 2/4/95\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         ancestorsUpTo: stopHere = ( |
             objs.
            | 
            objs: set copyRemoveAll.
            ancestorsUpTo: stopHere Into: objs Do: [].
            objs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: ancestors\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         ancestorsUpTo: stopHere Into: aSet Do: aBlock = ( |
            | 
            do: [|:s. a|
              s isParent  &&  [ a: s contents.  a != stopHere ]
                ifTrue: [
                  aSet if: a  IsPresentDo: []  
                              IfAbsentPut:  [a]  AndDo: [ aBlock value: a.
                                                          a ancestorsUpTo: stopHere Into: aSet Do: aBlock ].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         annotation = ( |
            | annotationIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         annotationIfFail: fb = ( |
             a.
             s.
            | 
            s: unparsedAnnotationIfFail: [|:e| ^ fb value: e].
            s isAnnotation ifTrue: [a: s]  False: [
                a: objectAnnotation parse: s IfFail: [|:e|
                  warning: 'In reflectee of mirror ', objectID, ' could not parse annotation: ',
                           s, ', reason: ', e,
                           '\nIt will be ignored.'.
                  ^ objectAnnotation
                ].
                isOKToTransformAnnotationAfterParsing ifTrue: [
                  frozenDefine: (
                    copyAnnotation: a IfFail: [|:e|    
                      ^ fb value: 'could not set annotation: ', e
                    ]
                  ) IfFail: [|:e| ^ fb value: 'could not set annotation: ', e]
                ]
            ].
            a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fComment: does a mirror support adding/removing/changing constant slots?\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         areReflecteesSlotsMutable = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCount = ( |
            | arguments size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fComment: return names of arguments\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         arguments = ( |
             r <- bootstrap stub -> 'globals' -> 'list' -> ().
            | 
            r: r copy.
            do: [| :s |
                (s isArgument) ifTrue: [r addLast: s name].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         at: n = ( |
            | slotAt: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         at: n IfAbsent: fb = ( |
            | slotAt: n IfAbsent: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         at: n IfFail: fb = ( |
            | at: n IfAbsent: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         blockLiterals = ( |
             r.
            | 
            r: list copyRemoveAll.
            blockLiteralsDo: [|:b| r add: b].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         blockLiteralsDo: blk = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: changing objects preserving copy-downs\x7fCategory: changing\x7fComment: Used for changing a method,
changes the contents of a slot,
respecting copy-downs.
-- Ungar, 1/24/95\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         changeContentsOfSlotInMeAndDescendantsTo: newSlot = ( |
            | 
            changeContentsOfSlotInMeAndDescendantsToName: newSlot name
                                                Contents: newSlot contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: changing objects preserving copy-downs\x7fCategory: changing\x7fComment: Used for changing a method,
changes the contents of a slot,
respecting copy-downs.
-- Ungar, 1/24/95\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         changeContentsOfSlotInMeAndDescendantsToName: n Contents: mir = ( |
             s.
            | 
            s: at: n.
            s copyDownInfoIfPresent: [|:cd. :i|
              copyDowns: copyDowns at: i Put: 
                cd copyForSlotsToOmit: [|:sto| sto asSet add: s name]
            ] IfAbsent: [].
            ( 
             (
               transporter moduleDictionary copiesOfSlot: s
             ) addFirst: (at: n)
            ) do: [|:s| s contents: mir].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: verifying\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         checkMethodStructure = ( |
            | checkMethodStructureIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: verifying\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         checkMethodStructureIfFail: fb = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: verifying\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         checkMethodStructureOuterMethod: outerMethod EnclosingMethod: enclosingMethod IfFail: fb = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflective cloning \x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         cloneReflectee = ( |
            | 
            cloneReflecteeIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflective cloning \x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         cloneReflecteeIfFail: fb = ( |
            | 
            reflect: (reflecteeIfFail: [ | n <- 'snort' |
                    [includesKey: n] whileTrue: [n: n, n].
                    ^ (
                        copyAt: n PutContents: mirrors slots 
                        IfFail: [|:e| ^ fb value: e]
                      ) primitiveCopyRemoveSlot: n IfFail: [|:e| ^ fb value: e]
                    ]) _CloneIfFail: [|:e|
                        'outOfMemoryError' == e ifFalse: [^ fb value: e].
                        memory allocationFailed.
                        _CloneIfFail: [|:e| ^ fb value: e]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         comment = ( |
            | 
            ( annotationIfFail: objectAnnotation ) comment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: completeness\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         completeObjectSelectors = bootstrap setObjectAnnotationOf: ( (('asOutliner')
	& ('isImmutableForFilingOut')
	& ('isMorph')
	& ('isShowableAsMorph')
	& ('printString')
	& ('printStringSize:')
	& ('storeString')
	& ('storeStringIfFail:')
	& ('storeStringNeeds')) asSet) From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors abstractMirror completeObjectSelectors.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: changing objects preserving copy-downs\x7fCategory: adding\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         copyDownForParent: parent IfAbsent: blk = ( |
            | 
            copyDowns asVector 
              findFirst: [| :cd |  cd parentMirror = parent] 
              IfPresent: [| :cd. :i |  ^ cd]
               IfAbsent: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDowns = ( |
            | moduleInfo copyDowns).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fComment: Need a string which will evaluate to a slot holding me.
If one exists, invoke presentBlcok with it as argument,
else invoke absentBlock with me as argument.\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         creatorNameIfPresent: presentBlock IfAbsent: absentBlock = ( |
            | 
            creatorPathIfPresent: [|:p| presentBlock value: p shortName] 
                       IfAbsent:  [      absentBlock value: self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         creatorPath = ( |
            | creatorPathIfPresent: [|:p| p] IfAbsent: nullPath).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         creatorPathIfPresent: pb IfAbsent: ab = ( |
             cycleSet.
             length <- 0.
             lm.
             m.
             names.
            | 

            names: list copyRemoveAll.
            m: self.
            lm: reflect: lobby. "transporter will not let me init this in slot list (sigh!)"
            [ m = lm ]  whileFalse: [
              m creatorSlotIfPresent: [| :s. |
                names addFirst: s key. "cannot use name for vector element fake slots"
                m: s holder.
              ] IfAbsent: [ | :why |  ^ ab value: why ].
              length: length succ.
              length > 100 ifTrue: [ 
                cycleSet ifNil: [ cycleSet: set copyRemoveAll ].
                cycleSet if: m
                  IsPresentDo: [ ^ ab value: 'Creator annotations form a cycle including reflectee of ', 
                                              m objectID printString.
                ] IfAbsentPut: m AndDo: [].
                length > 1000000 ifTrue: [ ^ ab value: 'Creator annotations path back to lobby is absurdly long.'].
              ].
            ].

            " 
              don't like to use the empty path for the lobby,
              though it MIGHT work
            "
            names isEmpty ifTrue: [names addLast: 'lobby'].

            pb value:  path copyWithAll: names).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         creatorSlotHint = ( |
            | moduleInfo creatorSlotHint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         creatorSlotIfPresent: pb IfAbsent: ab = ( |
             s.
            | 
            s: creatorSlotHint.
            = s contents  ifFalse: [
              ^ ab value: 
                (reflect: ()) creatorSlotHint = s
                   ifTrue: 'creator has never been set'
                    False: 'must be a clone'
            ].
            pb value: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fComment: Used to suggest a default module for
a new slot before adding it.
-- dmu\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultModuleIfFail: blk = ( |
             r <- ''.
            | 
            "if all slots with nonblank module agree, return that one"
            "else use module of creator slot"
            "else invoke blk"

            effectivelyAnnotatedSlotsDo: [|:s|
              case if: [r isEmpty    ]  Then: [ r: s module]
                   If: [r != s module]  Then: [ ^ blk value].
            ].
            r isEmpty ifFalse: [^ r].
            creatorSlotIfPresent: [|:s| s module]
                        IfAbsent: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         do: b = ( |
            | 
            "Klein and Yoda mirrors might fail, and this is called by
             moduleSummaryString, so fail softly. -- Adam, 4/06"
            (namesIfFail: [^ self]) do: [|:n. | 
              [|:exit| b value: (slotAt: n IfAbsent: exit) With: n] exit.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fComment: iterates through slots whose annotations matter\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         effectivelyAnnotatedSlotsDo: blk = ( |
            | 
            do: [|:s| 
              s isAnnotationIgnored  ifFalse: [blk value: s].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fComment: return a string that, when evaluated, will result in the reflectee\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         evalName = ( |
            | 
            storeStringOfReflecteeIfPresent: [|:s| ^ s] IfAbsent: [].
            creatorNameIfPresent: [|:n| ^ n] IfAbsent: [].
            evalNameIfNoStoreStringOrCreatorName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         evalNameIfNoStoreStringOrCreatorName = ( |
            | 
            reflectionPrimitives forMirror: self EvalNameIfNoStoreStringOrCreatorNameIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: evaluating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         evaluate: m = ( |
            | reflectionPrimitives forMirror: self Evaluate: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: ancestors\x7fComment: Returns a collection of all the selectors that the reflectee
responds to.\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         everyMessageReflecteeUnderstands = ( |
            | 
            keysInMeAndAncestorsUpTo: reflect: ()).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         fakeSlots = ( |
             r.
            | 
            r: list copyRemoveAll.
            fakeSlotsDo: [|:s| r addLast: s].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         fakeSlotsDo: blk = ( |
            | 
            fakeSlotsIterator mirror: self Do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         filedOutCreatorPathIfPresent: pb IfAbsent: ab = ( |
            | 
            filedOutCreatorSlotIfPresent: [|:s|
              creatorPathIfPresent: pb IfAbsent: ab
            ] IfAbsent: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         filedOutCreatorSlotIfPresent: pb IfAbsent: ab = ( |
            | 
            "creator must exist, and creatorSlot must be filedOut"
            creatorSlotIfPresent: [|:s|
              s isContentsFiledOutIfTrue: [pb value: s] False: ab
            ] IfAbsent: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         filedOutSlotsDo: blk = ( |
            | 
            do: [|:s| 
              s isFiledOut ifTrue: [blk value: s].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         firstKey = ( |
            | names first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: incremental changes\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         frozenDefine: newMir = ( |
            | frozenDefine: newMir IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: incremental changes\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         frozenDefine: newMir IfFail: fb = ( |
            | 
            freezeProgrammingTimestampDo: [define: newMir IfFail: fb]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         hasCreator = ( |
            | 
            creatorPathIfPresent: true IfAbsent: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: comparing\x7fComment: The hash of a mirror is the identity hash of its reflectee\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            reflecteeIdentityHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         idName = ( |
            | 
            '<', reflecteeID printString, '>').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: extended keys (like vector indices)\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         includesExtendedKey: n = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: extended keys (like vector indices)\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         includesExtendedName: n = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         includesKey: n = ( |
            | primitiveContentsAt: n IfFail: [^false]. true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         includesName: n = ( |
            | includesKey: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         indexedSlotsDo: block = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: ancestors\x7fComment: Based on the reference manual\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         inheritsFrom: objMirror = ( |
            | (= objMirror) || [
            parentsDo: [|:slot|
              (slot contents inheritsFrom: objMirror) ifTrue: [^true]].
            false]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isComplete = ( |
            | 
            (annotationIfFail: [^ false]) isComplete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isImmutableForFilingOut = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: completeness\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToSend: selector = ( |
            | 
            reflectionPrimitives forMirror: self IsOKToSend: selector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToTransformAnnotationAfterParsing = ( |
            | 
            reflectionPrimitives isOKToTransformAnnotationOfAbstractMirrorAfterParsing).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeActivation = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeAssignment = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeBlock = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeBlockMethod = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeBlockMethodActivation = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeByteVector = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeEmptyBlock = ( |
            | 
            "[] not a block, probably for performance reasons. -- Adam, 9/04"

               isReflecteeSlots
            && [(size = 2)
            && [(primitiveContentsAt: 'value'  IfFail: [^ false]) isEmpty
            && [(primitiveContentsAt: 'parent' IfFail: [^ false]) = (reflect: traits block)]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeFctProxy = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeFloat = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeImmutable = ( |
            | 
             "used for filing out w/o maintaining identity"
            (isOKToSend: 'isImmutableForFilingOut') && [reflectee isImmutableForFilingOut]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeInteger = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeMachineLevelForeignActivation = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeMethod = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeMethodActivation = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeMirror = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeProcess = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeProfiler = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeProxy = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeSlots = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeString = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeVector = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeVectorish = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: ancestors\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         keysInMeAndAncestorsUpTo: stopHere = ( |
             r.
            | 
            r: orderedSet copyRemoveAll.
            slotsInMeAndAncestorsUpTo: stopHere Do: [|:s| r add: s key].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lastKey = ( |
            | names last).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParents = ( |
             r.
            | 
            r: list copyRemoveAll.
            lexicalParentsDo: [|:lp| r addLast: lp ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParentsDo: blk = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: lookup\x7fComment: Based on the reference manual\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupKey: sel = ( |
            | 
            (slotFinder copyForMirror: self Selector: sel) findSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: lookup\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupSoleSlotInParentsNamed: name = ( |
            | 
            (slotFinder copyForMirror: self Selector: name) findSoleSlotInParents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: lookup\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupSoleSlotNamed: name = ( |
             sf.
            | 
            sf: slotFinder copyForMirror: self Selector: name.
            sf findSoleSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         messages = ( | {
                 'ModuleInfo: Module: mirror InitialContents: FollowSlot'
                
                 s <- bootstrap stub -> 'globals' -> 'set' -> ().
                } 
            | s: s copy.  messagesDo: [|:m| s add: m].  s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesDo: b = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleInfo = ( |
             mi = bootstrap stub -> 'globals' -> 'transporter' -> 'moduleInfo' -> ().
            | 
            "For Klein, we don't want to have to map over
             the transporter just so that we can have
             moduleInfo. -- Adam, 11/04"
            moduleInfoIfFail: [mi objectInfo]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleInfoIfFail: fb = ( |
            | 
            (annotationIfFail: [|:e| ^ fb value: e]) 
              moduleInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleNameBag = ( |
            | 
            moduleNameBagForSlotsFilteredBy: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleNameBagForSlotsFilteredBy: blk = ( |
             d.
            | 
            "ugh, no bags!"
            d: dictionary copyRemoveAll.
            effectivelyAnnotatedSlotsDo: [|:s|
              (blk value: s) ifTrue: [
                d if: s module
                  IsPresentPut: [|:n| n succ]  AndDo: []
                  IfAbsentPut:  0              AndDo: [].
              ].
            ].
            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleNames = ( |
             r.
            | 
            r: set copyRemoveAll.
            effectivelyAnnotatedSlotsDo: [|:s| r add: s module].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fComment: Returns a nice string summarizing
my modules, sorted by frequency.
-- dmu\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleSummaryString = ( |
            | 
            moduleSummaryStringForSlotsFilteredBy: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fComment: Returns a nice string summarizing
my modules, sorted by frequency.
But only for slots for whick blk evaluates to true.
-- dmu\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleSummaryStringForSlotsFilteredBy: blk = ( |
             bs.
             d.
             r.
             smns.
            | 
            d: moduleNameBagForSlotsFilteredBy: blk.

            d size > 7 ifTrue: [^ d size printString, ' Modules'].
            d size = 0 ifTrue: [^ 'No filed-out slots' ].
            d size = 1 ifTrue: [^ 'Module: ', d keys first ].

            "sort by frequency, highest first"
            smns: d keys asVector  copySortBy: 
            ( |
             d.
             p* = traits clonable.
             element: m1 Precedes: m2 = (
               (d at: m1) compare: (d at: m2)
                  IfLess: false
                    Equal: [m1 < m2]
                    Greater: true)
            | ) copy d: d.

            smns: smns copyMappedBy: [|:n|  n isEmpty ifTrue: '-' False: n ].

            r: 'Modules:  ', (
                smns reduceWith: [|:n1. :n2| n1, ', ', n2]
                    IfSingleton: [|:n| error: 'already checked that' ]
                    IfEmpty:     [ error: 'already checked this' ]
            ).
            r size <= 50  ifTrue: r  False: [ d size printString, ' Modules']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fComment: best-efforts naming,
including the object\'s printString\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | 
            nameSize: maxSmallInt PrintString:
                (isOKToSend: 'printString') ifTrue: [
                    reflectee printString.
                ] False: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fComment: like name, but tries for size s\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         nameSize: s = ( |
            | 
            nameSize: s PrintString:
                (isOKToSend: 'printStringSize:')  ifTrue: [
                    reflectee printStringSize: s.
                ] False: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         nameSize: s PrintString: ps = ( |
             n.
             suffix.
            | 
            n: safeName.
            suffix: nameSuffix.
            (
             (
              case if: [ ps isEmpty]  Then: [ n ]
                   If: [n isPrefixOf: ps ] Then: [ "suppress redundant name" ps ]
                   Else: [ "show both"          n, '(', ps, ')' ]
             ) copyAtMostWithLeadingEllipsis: s - suffix size
            ), suffix).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         nameSuffix = ( |
            | 
            reflectionPrimitives forMirror: self NameSuffixIfFail: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: primitives with default failure blocks\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         names = ( |
            | 
            namesIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         namesIfFail: fb = ( |
            | reflectionPrimitives forMirror: self NamesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'objectToDisplayMissingSlots' -> () From: ( | {
         'Comment: The object that was the subject of the Find Missing Slots
operation.\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         objectWithMissingSlots* = bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         oneOfEachFakeSlot = ( |
             r.
            | 
            r: list copyRemoveAll.
            oneOfEachFakeSlotDo: [|:s| r addLast: s].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: fake slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         oneOfEachFakeSlotDo: blk = ( |
            | 
            fakeSlotsIterator mirror: self OneOfEachDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'collection' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: iterating\x7fComment: iterate over each parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parentsDo: blk = ( |
            | 
            do: [ | :s |
              s isParent ifTrue: [ blk value: s With: s name ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fCategory: performance hacks\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         parseAnnotations = ( |
             r.
            | 
            "used by programs that scan objects to save on define's"
            "parse all the annotations in one swell foop"
                 areReflecteesSlotsMutable not
            || [ isEmpty 
            || [ first unparsedAnnotation isAnnotation "already did this obj"
            ]]  ifTrue: [^ self].

            freezeProgrammingTimestampDo: [
              r: copyAnnotation: 
                objectAnnotation parse: unparsedAnnotation IfFail: [ ^ self].
              names do: [|:n|
               r: r  primitiveCopyAt: n
                         PutContents: (primitiveContentsAt: n IfFail: [^ self])
                           IsParent:  (primitiveIsParentAt: n IfFail: [^self])
                         IsArgument:  (primitiveIsArgumentAt: n IfFail: [^self])
                         Annotation:  (
                              slotAnnotation 
                                parse: (primitiveAnnotationAt: n IfFail: [^self])
                               IfFail: [ ^ self ] )
                            IfFail: [^ self].
              ].
              frozenDefine: r IfFail: [self]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: extended keys (like vector indices)\x7fComment: \"extended\" handles things like array indices,
not just selectors\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         pathToExtendedKey: sel Multiple: ambiguousBlock None: notFoundBlock = ( |
            | 
            pathToKey: sel
            Multiple: ambiguousBlock
            None: [
              (includesExtendedKey: sel) 
                ifTrue: [path extendedBy: sel]
                 False: notFoundBlock
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: paths\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         pathToKey: sel Multiple: ambiguousBlock None: notFoundBlock = ( | {
                 'ModuleInfo: Module: mirror InitialContents: FollowSlot'
                
                 paths.
                } 
            | 
            paths: pathsToKey: sel.
            paths size = 0 
              ifTrue: notFoundBlock False: [
            paths size = 1
              ifTrue: [paths first]
               False: [ambiguousBlock value: paths]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: paths\x7fComment: Unlike pathToKey:Multiple:None: this one follows Self\'s rule about ambiguity.
It only invokes the ambiguous block if the paths find different slots.
-- dmu 6/03\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         pathToKey: sel MultipleSlots: ambiguousBlock None: notFoundBlock = ( |
            | 
            pathToKey: sel
              Multiple: [|:paths|
                         (paths asSet copyMappedBy: [|:p| 
                            p slotsDo: [] IfAbsent: raiseError StartingFrom: self]) size = 1
                           ifTrue: [paths first]
                            False: [ambiguousBlock value: paths]
            ] None: notFoundBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: paths\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         pathsToKey: sel = ( |
            | pathsToKey: sel Receiver: self Visited: set copy Path: path copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: paths\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         pathsToKey: sel Receiver: rec Visited: v Path: path = ( |
             m <- bootstrap stub -> 'globals' -> 'set' -> ().
             visited.
            | 
            m: m copy.
            (v includes: self) ifTrue: [^ m ].
            (names includes: sel) 
              ifTrue: [ m add: path extendedBy: sel].

            visited: v copy add: self.

            m isEmpty ifFalse: [^ m].
            parentsDo: [| :slot. :name |
              m addAll: 
                slot contents pathsToKey: sel 
                                Receiver: rec 
                                 Visited: visited 
                                    Path: path extendedBy: name.
            ].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slot-like primitives\x7fComment: call only from slot\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveAnnotationAt: n IfFail: fb = ( |
            | reflectionPrimitives forMirror: self AnnotationAt: n asString canonicalize IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: primitives with default failure blocks\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         primitiveContentsAt: n = ( |
            | primitiveContentsAt: n IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slot-like primitives\x7fComment: call only from slot\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveContentsAt: n IfFail: fb = ( |
            | reflectionPrimitives forMirror: self ContentsAt: n asString canonicalize  IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slot-like primitives\x7fComment: call only from slot\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveIsArgumentAt: n IfFail: fb = ( |
            | reflectionPrimitives forMirror: self IsArgumentAt: n asString canonicalize  IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slot-like primitives\x7fComment: call only from slot\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveIsAssignableAt: n IfFail: fb = ( |
            | reflectionPrimitives forMirror: self IsAssignableAt: n asString canonicalize  IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slot-like primitives\x7fComment: call only from slot\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveIsParentAt: n IfFail: fb = ( |
            | reflectionPrimitives forMirror: self IsParentAt: n asString canonicalize  IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fComment: Exploit annotation info to attempt to find prototype.
If found, invoke pb block with prototype mirror as argument.
Else, invoke ab block with reason string as argument.
-- dmu\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         prototypeIfPresent: pb IfAbsent: ab = ( |
             cs.
             myProto.
             n1.
             n2.
            | 
            cs: creatorSlotHint.
            cs exists ifFalse: [^ ab value: 'no creator'].
            myProto: cs contents.
            "check for same set of slots"
            n1: namesIfFail: [|:e| ^ ab value: 'names failed: ', e].
            n2: myProto names.
                 ( n1 = n2 ) "optimization"
            || [   n1 asSet  =  n2 asSet  ]    ifFalse: [
                ^ ab value: 'different slots'
            ].
            pb value: myProto).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: primitives with default failure blocks\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflectee = ( |
            | reflecteeIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeAt: idx = ( |
            | reflecteeAt: idx IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeAt: idx Put: val = ( |
            | 
            reflecteeAt: idx Put: val IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeEq: x IfFail: fb = ( |
            | reflectionPrimitives forMirror: self ReflecteeEq: x IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflecteePrimitives\x7fComment: Does the vector have a reference to a method (ie
is it a literal vector of some method)? -- Mario, 1/13/95\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeHasMethodPointer = ( |
            | 
            "changed methodPointerIfFail to call primitive directly
            so that this works with orphan vectors.
            -- dmu 3/02"
            reflecteeMethodPointerIfFail: [^false].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeID = ( |
            | 
            reflectionPrimitives forMirror: self ReflecteeIDIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeIdentityHash = ( |
            | reflectionPrimitives forMirror: self ReflecteeIdentityHashIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeIfFail: errBlk = ( |
            | reflectionPrimitives forMirror: self ReflecteeIfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeMethodPointerIfFail: fb = ( |
            | 
            fb value: 'badTypeError: not a vector').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeMirrorAt: idx = ( |
            | 
            reflecteeMirrorAt: idx IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeSize = ( |
            | reflecteeSizeIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: changing objects preserving copy-downs\x7fCategory: removing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         removeCopiedDownSlotsFromMeAndDescendants: slots From: parent = ( |
             cdToChange.
             fs.
             newMe.
             slotsToAsk.
             slotsToNotOmit.
             slotsToRemove.
             which.
            | 

            fs: removeRedundantAssignmentSlotsFrom: slots.

            fs isEmpty ifTrue: [^ self]. "optimization"

            copyDowns asVector 
              findFirst: [|:cd| cd parentMirror = parent] 
              IfPresent: [|:cd. :i| which: i.  cdToChange: cd]
               IfAbsent: [ ^ self ].

            slotsToRemove:     list copyRemoveAll.
            slotsToNotOmit:    list copyRemoveAll.
            slotsToAsk:        list copyRemoveAll.

            fs do: [|:s. n|
              n: s name.
              case if: [ cdToChange slotsToOmit includes: n ]  Then: [ slotsToNotOmit addLast: n ]
                   If: [ (includesKey: n) not ]  Then: []
                   If: [ (at: n) couldBeACopiedDownCopyOf: s ]  Then: [ slotsToRemove addLast: s ]
                   Else: [ slotsToAsk addLast: s ].
            ].
            (transporter moduleDictionary copyDownChildrenOf: self) do: [|:c|
              c removeCopiedDownSlotsFromMeAndDescendants: slotsToRemove From: self.
            ]. 
            newMe: self.
            slotsToRemove do: [|:s. | [|:exit| newMe: (newMe at: s name IfAbsent: exit) copyHolderForRemove] exit. ].

            newMe: newMe copyCopyDowns: copyDowns copy asVector at: which Put: 
                         cdToChange copyForSlotsToOmit: [|:sto| sto asSet removeAll: slotsToNotOmit].
            defineAndSave: newMe.

            slotsToAsk do: [|:s|
                   (includesKey: s name)  
              && [ userQuery askYesNo: 'Slot "', s name, '" in object "', name, '"\n',
                                  'may have been changed since it was copied down.\n',
                                  'Remove it anyway?'
                 ] ifTrue: [ 
                    (at: s name) remove.
                    (transporter moduleDictionary copyDownChildrenOf: self) do: [|:c|
                      c removeCopiedDownSlotsFromMeAndDescendants: (vector copyAddFirst: s)
                                                             From: self.
                ].
              ].
            ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: changing objects preserving copy-downs\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         removeRedundantAssignmentSlotsFrom: slots = ( |
            | 
            slots asList copyFilteredBy: [|:s|
              ( s isAssignment  &&  [ slots includes: s correspondingDataSlot ] ) not
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: changing objects preserving copy-downs\x7fCategory: removing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         removeSlotsFromMeAndDescendants: slots = ( |
             fs.
             newCDs.
             newMe.
            | 

            fs: removeRedundantAssignmentSlotsFrom: slots.

            fs isEmpty ifTrue: [^ self]. "optimization"

            newCDs: copyDowns copy asVector.
            fs do: [|:s|
              [|:exit|
                (at: s name IfAbsent: exit) copyDownInfoIfPresent: [|:cd. :i|
                  newCDs:  newCDs at: i Put:
                             (newCDs at: i) copyForSlotsToOmit: [|:sto| sto asSet add: s name].
                ] IfAbsent: [].
              ] exit.
            ].

            (transporter moduleDictionary copyDownChildrenOf: self) do: [|:c|
             c removeCopiedDownSlotsFromMeAndDescendants: fs From: self
            ].

            newMe: self.
            copyDowns = newCDs ifFalse: [newMe: newMe copyCopyDowns: newCDs].

            fs do: [|:s| 
              [|:exit|
                newMe: (newMe at: s name IfAbsent: exit) copyHolderForRemove.
              ] exit.
            ].
            = newMe ifFalse: [defineAndSave: newMe].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: changing objects preserving copy-downs\x7fCategory: adding\x7fModuleInfo: Module: mirror InitialContents: FollowSlot'
        
         replaceCopyDownForParent: parent With: newCopyDown IfAbsent: blk = ( |
            | 
            copyDowns asVector 
              findFirst: [| :cd     |  cd parentMirror = parent] 
              IfPresent: [| :cd. :i |  copyDowns: copyDowns asVector copy at: i Put: newCopyDown]
               IfAbsent: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fComment: only computes an objects place in the name space,
or what it was cloned from;
does NOT run any non-reflective code.
Can be used on broken objects.\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         safeName = ( |
            | 
            creatorPathIfPresent: [|:p. |
            " Try it without the the
              (
                (p contents includes: 'globals') ifTrue: 'The ' False: ''
              ), 
            "
              p shortName
            ] IfAbsent: [
              suggestiveNameIfPresent: [|:n| n ] IfAbsent: [type prependAOrAn, ' object']]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         safeNameAndID = ( |
            | idName, ' ', safeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         safeNameAndIDSize: s = ( |
             ss.
            | 
            ss: safeNameAndID.
            ss size <= s  ifTrue: ss False: [idName]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fComment: Like safeName, 
but tries to fit in s characters.\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         safeNameSize: s = ( |
             sn.
            | 
            sn: safeName.
            sn size  <=  s  
              ifTrue: sn
              False: [idName]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: debugging help\x7fComment: Bring an outliner on this mirror to the user\'s hand.\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         showMe = ( |
             evt.
             m.
             w.
            | 
            evt: process this birthEvent.
            w: evt sourceHand world.
            m: w outlinerForMirror: self.
            evt sourceHand attach: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fComment: # of slots in the mirrored object\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | names size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         slotAt: n = ( |
            | 
            slotAt: n IfAbsent: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         slotAt: n IfAbsent: block = ( |
            | 
            (slotProtoFor: n IfAbsent: [|:e| ^ block value: e]) 
            copyMirror: self Name: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: lookup\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         slotFinder = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors abstractMirror slotFinder.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         assignableParentBlock.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: InitializeToExpression: (list)\x7fVisibility: private'
        
         leftToVisit <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         mirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( |
             {} = 'Comment: Implements the standard Self slot lookup algorithm.\x7fModuleInfo: Creator: traits mirrors abstractMirror slotFinder parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         copy = ( |
            | 
            (resend.copy
                  leftToVisit: leftToVisit copy)
                      visited: visited     copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForMirror: m = ( |
            | 
            copy mirror: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForMirror: m Selector: s = ( |
            | 
            (copyForMirror: m) selector: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( | {
         'Category: finding slots\x7fComment: Based on the reference manual\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         findSlots = ( |
            | 
            leftToVisit add: mirror.
            findSlotsAndAddResultsTo: set copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( | {
         'Category: finding slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         findSlotsAndAddResultsTo: aSet = ( |
            | 
            [leftToVisit isEmpty] whileFalse: [| mir |
              mir: leftToVisit removeFirst.
              visited if: mir IsAbsentAddAndDo: [
                [|:exit|
                 slotIn: mir IfPresent: [|:s|
                   (isInterestedInSlot: s) ifTrue: [aSet add: s. exit value].
                 ].
                 followParentSlotsOf: mir.
                ] exit.
              ].
            ].
            aSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( | {
         'Category: finding slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         findSlotsInParents = ( |
            | 
            followParentSlotsOf: mirror.
            findSlotsAndAddResultsTo: set copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( | {
         'Category: finding slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         findSoleSlot = ( |
            | 
            soleSlotFrom: findSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( | {
         'Category: finding slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         findSoleSlotInParents = ( |
            | 
            soleSlotFrom: findSlotsInParents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( | {
         'Category: finding slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         followParentSlotsOf: aMirror = ( |
            | 
            aMirror parentsDo: [|:parentSlot|
              parentSlot isAssignable ifTrue: [assignableParentBlock value: parentSlot].
              leftToVisit add: parentSlot contents.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( | {
         'Category: filtering out slots\x7fComment: The normal Self lookup algorithm is interested in every slot,
but children can override this to allow some slots to be
filtered out.\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         isInterestedInSlot: s = ( |
            | true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( | {
         'Category: finding slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         slotIn: aMirror IfPresent: presentBlock = ( |
             s.
            | 
            s:  aMirror slotAt: selector IfAbsent: [^ self].
            presentBlock value: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> 'parent' -> () From: ( | {
         'Category: finding slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         soleSlotFrom: slots = ( |
            | 
            slots 
              ifNone: [error: 'No slot named \'', selector, '\' was found on \'', mirror safeName, '\''] 
               IfOne: [|:e| e]
              IfMany: [error: 'Ambiguous resend: multiple slots named \'', selector, '\' were found on \'', mirror safeName, '\''.]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         selector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'slotFinder' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: InitializeToExpression: (set)\x7fVisibility: private'
        
         visited <- bootstrap stub -> 'globals' -> 'set' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         slotProtoFor: n IfAbsent: failBlock = ( |
            | 
            case
             if: [primitiveIsArgumentAt: n IfFail: [|:e| ^failBlock value: e]]
             Then: [slots argument]

             If: [primitiveIsParentAt:   n IfFail: [|:e| ^ failBlock value: e]]
             Then: [slots parent]

             If: [(primitiveContentsAt:  n IfFail: [|:e| ^ failBlock value: e]) isReflecteeMethod
             &&  [(primitiveIsAssignableAt: n IfFail: true) not]] "_NakedMethods"
             Then: [slots method]
             Else: [slots plain]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: ancestors\x7fComment: Returns a collection of all slots in me and my ancestors,
stopping the lookup at stopHere (a mirror), which is
not included.
-- Ungar, 2/4/95\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsInMeAndAncestorsUpTo: stopHere = ( |
             slots.
            | 
            slots: list copyRemoveAll.
            slotsInMeAndAncestorsUpTo: stopHere Do: [|:s| slots add: s].
            slots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: reflection\x7fCategory: ancestors\x7fComment: Iterates through all slots in me and my ancestors,
stopping the lookup at stopHere (a mirror), which is
not included.
-- aaa, 2/18/04\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsInMeAndAncestorsUpTo: stopHere Do: aBlock = ( |
             aSet.
             remaining.
            | 
            "Iterative instead of recursive because sometimes we run out
             of stack space. -- Adam, 5/04"
            aSet: set copyRemoveAll.
            remaining: list copyRemoveAll.
            remaining add: self.
            [remaining isEmpty] whileFalse: [|current|
              current: remaining removeFirst.
              current do: [|:s. a|
                s isParent  &&  [ a: s contents.  a != stopHere ]
                  ifTrue: [
                    aSet if: a  IsPresentDo: []  
                                IfAbsentPut:  [a]  AndDo: [ remaining addFirst: a ].
                ].
                aBlock value: s.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sortedModuleNames = ( |
             d.
            | 
            "ugh, no bags!"
            d: moduleNameBag.
            "sort by frequency, highest first"
            d keys asVector copySortBy: ( |
             d.
             p* = traits clonable.
             element: m1 Precedes: m2 = (
               (d at: m1) compare: (d at: m2)
                  IfLess: false
                    Equal: [m1 < m2]
                    Greater: true)
            | ) copy d: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            'on ', safeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            storeStringOfReflecteeIfPresent: [|:s| '(', s, ') _Mirror']
              IfAbsent: [|:e| fb value: 'storeString of reflectee failed: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringOfReflecteeIfPresent: pb IfAbsent: ab = ( |
             obj.
            | 
            (isOKToSend: 'storeStringIfFail:') ifFalse: [^ ab value: 'not concrete'].
            obj: reflectee.
            "someday, try xxx
              hasCreator
              instead of storeStringNeeds
            "
            = (reflect: obj storeStringNeeds) ifTrue: [^ ab value: 'store string needs me'].
            pb value: obj storeStringIfFail: [|:e| ^ ab value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         suggestiveNameIfPresent: presentBlock IfAbsent: absentBlock = ( |
            | 
            prototypeIfPresent: [|:myProto|
              myProto creatorNameIfPresent: [|:n|  ^ presentBlock value: n prependAOrAn]
                                 IfAbsent:  []
            ] IfAbsent: [].
            absentBlock value: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         unparsedAnnotation = ( |
            | unparsedAnnotationIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         unparsedAnnotationIfFail: fb = ( |
            | reflectionPrimitives forMirror: self AnnotationIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         with: m Do: b = ( |
            | 
            "should be double-dispatched"
            names with: m names Do: [|:n1. :n2.| 
                b value: (slotAt: n1) With: (m slotAt: n2)
                    With: n1 With: n2]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         withoutAssignmentSlotsDo: blk = ( |
             r.
            | 
            r: do: [|:s| s isAssignment ifFalse: [blk value: s]].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         activation = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors activation.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         = m = ( |
            | 
            ifDead: [^ equalsDeadActivationMirror: m].
            resend.= m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         areReflecteesSlotsMutable = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         codesIfFail: fb = ( |
            | ifDead: [^ byteVector].  resend.codesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         codesMirrorIfFail: fb = ( |
            | 
            ifDead: [^ reflect: byteVector].  resend.codesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: activation primitives with default fail blocks\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         expressionStack = ( |
            | expressionStackIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         expressionStackIfFail: fb = ( |
            | 
            ifDead: [^ vector].  resend.expressionStackIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         fileIfFail: fb = ( |
            | ifDead: [^ ''].  resend.fileIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         fileMirrorIfFail: fb = ( |
            | 
            ifDead: [^ reflect: ''].  resend.fileMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: activation primitives with default fail blocks\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         hasSender = ( |
            | hasSenderIfFail:       raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         hasSenderIfFail: fb = ( |
            | ifDead: [^ false]. resend.hasSenderIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | ifDead: [^ 0].      resend.hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         ifDead: blk = ( |
            | 
            reflectionPrimitives forActivationMirror: self IfDead: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         initNumber: i Process: p = ( |
            | 
            number: i.
            myProcess: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isLive = ( |
            | ifDead: [^ false].  resend.isLive).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToTransformAnnotationAfterParsing = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeActivation = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeMethodActivation = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Comment: answer true if the effect of sending selector is trivial\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isSendingNameSimple: aString = ( |
             found.
             rc.
             s.
            | 
            (resend.isSendingNameSimple: aString) ifTrue: [^ true].
            rc: receiverIfFail: [^ false].

            found: rc lookupKey: aString.
            found size = 1 ifFalse: [^ false].
            s: found first.

            s isAssignment || [s contents isReflecteeMethod not]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: activation primitives with default fail blocks\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParent = ( |
            | lexicalParentIfFail:   raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParentIfFail: fb = ( |
            | 
            ifDead: [^ mirrors deadActivation]. 
            resend.lexicalParentIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lineIfFail: fb = ( |
            | ifDead: [^ 0].  resend.lineIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lineMirrorIfFail: fb = ( |
            | 
            ifDead: [^ reflect: 0].  resend.lineMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fComment: Returns a vector containing the literals of this method. (May be
a copy of the original vector of literals.) -- Adam, 4/06\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         literalsIfFail: fb = ( |
            | ifDead: [^ vector].     resend.literalsIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         literalsMirrorIfFail: fb = ( |
            | 
            ifDead: [^ reflect: vector].     resend.literalsMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         liveOnes* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( |
             {} = 'Comment: put these here so they can be targets of resend after ifDead: [^]\'\x7fModuleInfo: Creator: traits mirrors activation liveOnes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         codesIfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self CodesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         codesMirrorIfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self CodesMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         expressionStackIfFail: fb = ( |
            | reflectionPrimitives forActivationMirror: self ExpressionStackIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         hasSenderIfFail: fb = ( |
            | 
            " perhaps a _MirrorHasSender primitive would be better "
            senderIfFail: [|:error|
                ('noSenderError' isPrefixOf: error) ifTrue: [ ^ false ].
              ^ fb value: error.
            ].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isLive = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeOuterMethod = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParentIfFail: fb = ( |
            | (reflectionPrimitives forActivationMirror: self LexicalParentIfFail: [|:e| ^ fb value: e]) initNumber: maxSmallInt Process: myProcess).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'Comment: Returns a vector containing the literals of this method. (May be
a copy of the original vector of literals.) -- Adam, 4/06\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         literalsIfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self LiteralsIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         literalsMirrorIfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self LiteralsMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         meAndSendersDo: blk = ( |
             a.
            | 
            a: self.
            [|:exit|
              blk value: a.
              a: a senderIfFail: exit.
            ] loopExit.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         methodHolderIfFail: fb = ( |
            | reflectionPrimitives forActivationMirror: self MethodHolderIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         namesIfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self NamesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         positionIfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self PositionIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'Comment: call only from slot\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveAnnotationAt: n IfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self AnnotationAt: n asString canonicalize IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'Comment: call only from slot\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveContentsAt: n IfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self ContentsAt: n asString canonicalize  IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'Comment: call only from slot\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveIsArgumentAt: n IfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self IsArgumentAt: n asString canonicalize  IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'Comment: call only from slot\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveIsAssignableAt: n IfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self IsAssignableAt: n asString canonicalize  IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'Comment: call only from slot\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveIsParentAt: n IfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self IsParentAt: n asString canonicalize  IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         receiverIfFail: fb = ( |
            | reflectionPrimitives forActivationMirror: self ReceiverIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeEq: x IfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self ReflecteeEq: x IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeIdentityHash = ( |
            | 
            reflectionPrimitives forActivationMirror: self ReflecteeIdentityHashIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorIfFail: fb = ( |
            | reflectionPrimitives forActivationMirror: self SelectorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorMirrorIfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self SelectorMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         senderIfFail: fb = ( |
            | ( reflectionPrimitives forActivationMirror: self SenderIfFail: [|:e| ^ fb value: e] ) initNumber: number succ Process: myProcess).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceStringIfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self SourceIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> 'liveOnes' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceStringMirrorIfFail: fb = ( |
            | 
            reflectionPrimitives forActivationMirror: self SourceMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: activation primitives with default fail blocks\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         methodHolder = ( |
            | 
            methodHolderIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         methodHolderIfFail: fb = ( |
            | 
            ifDead: [^ self].  resend.methodHolderIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         namesIfFail: fb = ( |
            | ifDead: [^ vector].  resend.namesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: activation primitives with default fail blocks\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         position = ( |
            | 
            positionIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         positionIfFail: fb = ( |
            | ifDead: [^ 0].  resend.positionIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Comment: return the pc, subtracting out
index bytecodes
-- Ungar, 1/1/95\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         positionWithoutIndexBytecodes = ( |
             ext <- 0.
             is.
             r.
            | 
            is: instructionSet.
            r: position.
            ( codes copyAtMost: r)  bytesDo: [|:bc|
              (is opcodeNameOf: bc) = 'index'  ifTrue: [ r: r pred ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveAnnotationAt: n IfFail: fb = ( |
             a.
            | 
            "only call from slot"
            ifDead: [^ slotAnnotation ].
            resend.primitiveAnnotationAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveContentsAt: n IfFail: fb = ( |
            | 
            "only call from slot"
            ifDead: [^ reflect: ()].
            resend.primitiveContentsAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveIsArgumentAt: n IfFail: fb = ( |
            | 
            ifDead: [^ false].
            resend.primitiveIsArgumentAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveIsAssignableAt: n IfFail: fb = ( |
            | 
            ifDead: [^ false].
            resend.primitiveIsAssignableAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveIsParentAt: n IfFail: fb = ( |
            | 
            ifDead: [^ false].
            resend.primitiveIsParentAt: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: activation primitives with default fail blocks\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = ( |
            | 
            receiverIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         receiverIfFail: fb = ( |
            | 
            ifDead: [^ reflect: ()].  resend.receiverIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflectee = ( |
            | 
            error: 'Cannot access an activation reflected in a mirror').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot'
        
         safeName = ( |
            | 
            '(', (receiverIfFail: [|:e| ^ 'safeName failed: ', e]) safeName,
             ') ', selectorAndArguments).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: activation primitives with default fail blocks\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         selector = ( |
            | 
            selectorIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorAndArguments = ( |
            | 
            (globals selector copyStr: selector)
              intersperse: arguments).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorIfFail: fb = ( |
            | 
            ifDead: [^ ''].  resend.selectorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorMirrorIfFail: fb = ( |
            | 
            ifDead: [^ reflect: ''].  resend.selectorMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: activation primitives with default fail blocks\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sender = ( |
            | senderIfFail:          raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         senderIfFail: fb = ( |
            | 
            ifDead: [^ mirrors deadActivation].  resend.senderIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceIfFail: fb = ( |
            | ifDead: [^ ''].  resend.sourceIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Comment: return the source position as a point,
x = start, y = end
-- Ungar, 1/1/95\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourcePosition = ( |
            | 
            sourcePositionAtBCI: position).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot'
        
         suggestiveNameIfPresent: presentBlock IfAbsent: absentBlock = ( |
            | 
            isLive ifFalse: [ 
              ^ mirrors deadActivation suggestiveNameIfPresent: presentBlock IfAbsent: [absentBlock value: self].
            ].
            selectorAndArguments, ' = ',
            ( resend.suggestiveNameIfPresent: presentBlock IfAbsent: [^ absentBlock value: self] )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> () From: ( | {
         'Category: intercept all primitives here to check for death and switch parent\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         unparsedAnnotationIfFail: fb = ( |
            | 
            ifDead: [^ objectAnnotation ].  resend.unparsedAnnotationIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'assignment' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         areReflecteesSlotsMutable = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'assignment' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCount = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'assignment' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         idName = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'assignment' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         isComplete = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'assignment' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeAssignment = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'assignment' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeImmutable = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'assignment' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         objectIDName = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'assignment' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'assignment' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot'
        
         suggestiveNameIfPresent: presentBlock IfAbsent: absentBlock = ( |
            | 
            presentBlock value: '<-').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'assignment' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'assignment'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         allLiteralsDo: b = ( |
            | valueSlot value allLiteralsDo: b.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         areReflecteesSlotsMutable = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'Category: verifying\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         checkMethodStructureOuterMethod: outerMethod EnclosingMethod: enclosingMethod IfFail: fb = ( |
            | 
            valueSlot contents checkMethodStructureOuterMethod: outerMethod EnclosingMethod: enclosingMethod IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'Category: programming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForMethod: blockMeth = ( |
            | 
            copyForMethod: blockMeth IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'Category: programming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForMethod: blockMeth IfFail: fb = ( |
            | reflect: reflectionPrimitives forBlockMethodMirror: blockMeth CreateBlockIfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         getSelectorFromSource = ( |
            | 
            [getSelectorFromExpression]. "see also for explanation"
            method literals last).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         isComplete = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeBlock = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeImmutable = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParent = ( |
            | 
            lexicalParentIfFail: [^mirrors deadActivation]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParentIfFail: failBlock = ( |
            | (reflectionPrimitives forBlockMirror: self LexicalParentIfFail: [| :e | ^failBlock value: e]) initNumber: maxSmallInt Process: process).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         messages = ( |
            | 
            valueSlot value messages).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesDo: b = ( |
            | valueSlot value messagesDo:    b.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         method = ( |
            | valueSlot contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         methodSource = ( |
            | 
            method source).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot'
        
         suggestiveNameIfPresent: presentBlock IfAbsent: absentBlock = ( |
             blkMeth.
            | 
            blkMeth: (valueSlotIfFail: [^ absentBlock value: self]) value.

            presentBlock value: 
              '<a block defined in ', 
              (blkMeth fileIfFail: 'an unknown file'),
              ', line ', 
              (blkMeth lineIfFail: 'unknown') printString, 
              '>').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'block'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         valueSlot = ( |
            | 
            valueSlotIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         valueSlotIfFail: fb = ( |
            | 
            slotAt: (valueSlotNameIfFail: [|:e| ^ fb value: e]) IfAbsent: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         valueSlotName = ( |
            | 
            valueSlotNameIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         valueSlotNameIfFail: fb = ( |
            | 
            (namesIfFail: [|:e| ^ fb value: e])
               at: 1
               IfAbsent: [fb value: 'block has fewer than two slots']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'Category: verifying\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         checkMethodStructureOuterMethod: outerMethod EnclosingMethod: enclosingMethod IfFail: fb = ( |
            | 
            lexicalParent = enclosingMethod ifFalse: [^ fb value: 'bad lexical parent' With: self].
            resend.checkMethodStructureOuterMethod: outerMethod EnclosingMethod: enclosingMethod IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'Category: programming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         copyBytecodes: bc Literals: lits File: f Line: li Source: s = ( |
            | 
            createBlockMethod_Bytecodes: bc 
                               Literals: lits 
                                   File: f 
                                   Line: li     
                                 Source: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'Category: programming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         copyBytecodes: bc Literals: lits File: f Line: li Source: s IfFail: fb = ( |
            | 
            createBlockMethod_Bytecodes: bc 
                               Literals: lits 
                                   File: f 
                                   Line: li     
                                 Source: s 
                                 IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'Category: programming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         createBlockMethod_Bytecodes: bc Literals: lits File: f Line: li Source: s = ( |
            | 
            createBlockMethod_Bytecodes: bc 
                               Literals: lits 
                                   File: f 
                                   Line: li
                                 Source: s 
                                 IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'Category: programming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         createBlockMethod_Bytecodes: bc Literals: lits File: f Line: li Source: s IfFail: fb = ( |
            | 
            _CreateBlockMethodBytecodes: bc 
                               Literals: lits 
                                   File: f asString canonicalize
                                   Line: li
                                 Source: s asString canonicalize
                                 IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeBlockMethod = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeOuterMethod = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParent = ( |
            | 
            lexicalParentIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParentBlockLiteral = ( |
            | 
            "used by Klein"
            lexicalParent blockLiteralsDo: [|:blkLit|
              = blkLit asMirror method  ifTrue: [
                ^ blkLit
              ].
            ].
            error: 'could not find block receiver').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'Comment: returns lexically-enclosing method\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParentIfFail: failBlock = ( |
            | 
            reflectionPrimitives forBlockMethodMirror: self LexicalParentIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParentsDo: blk = ( |
             lp.
            | 
            lp: lexicalParent.
            blk value: lp With: self.
            lp lexicalParentsDo: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         safeNamePrefix = 'a block method'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceIfFail: fb = ( |
            | 
            blockSourceIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethod' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'blockMethod'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeBlockMethodActivation = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         methodHolderIfFail: fb = ( |
             r.
            | 
            "workaround VM bug in primitive"
            r: receiverIfFail: [|:e| ^ fb value: e].
            (selectorIfFail: [|:e| ^ fb value: e]) = r valueSlotName
             ifTrue: [r]
              False: [resend.methodHolderIfFail: fb]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceIfFail: fb = ( |
            | 
            blockSourceIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'blockMethodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'blockMethodActivation'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeByteVector = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         vectorish = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'vectorish' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrors vectorish.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'vectorish' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'byteVector' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeAt: idx IfFail: errBlk = ( |
            | 
            reflectionPrimitives forByteVectorMirror: self ReflecteeAt: idx asSmallInteger IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'byteVector' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeAt: idx Put: val IfFail: errBlk = ( |
            | 
            reflectionPrimitives
              forByteVectorMirror: self
                      ReflecteeAt: idx asSmallInteger
                              Put: val asSmallInteger
                           IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'byteVector' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeBytesIfFail: fb = ( |
            | 
            reflectionPrimitives forByteVectorMirror: self ReflecteeBytesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'byteVector' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeMirrorAt: idx IfFail: errBlk = ( |
            | 
            reflectionPrimitives forByteVectorMirror: self ReflecteeMirrorAt: idx asSmallInteger IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'byteVector' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeSizeIfFail: errBlk = ( |
            | 
            reflectionPrimitives forByteVectorMirror: self ReflecteeSizeIfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeStringIfFail: fb = ( |
            | 
            reflecteeBytesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'byteVector'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'canonicalString' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         areReflecteesSlotsMutable = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'canonicalString' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         evalName = ( |
            | 
            (reflecteeStringIfFail: [^ 'unknown']) storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'canonicalString' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         idAndNameSize: size = ( |
            | 
            nameSize: size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'canonicalString' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         isComplete = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'canonicalString' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeImmutable = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'canonicalString' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeString = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'canonicalString' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | 
            evalName, nameSuffix).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'canonicalString' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         objectIDName = ( |
            | evalName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'canonicalString' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'canonicalString' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         safeName = ( |
            | evalName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'canonicalString' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'string'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'deadActivation' -> () From: ( | {
         'Comment: all dead activations are equal to each other\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | x equalsDeadActivationMirror: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'deadActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         beLive = ( |
            | 
            parent: liveParent.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'deadActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsDeadActivationMirror: x = ( |
            | true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'deadActivation' -> () From: ( | {
         'Category: optimizations\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         ifDead: blk = ( |
            | blk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'deadActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         initNumber: n Process: p = ( |
            | 
            resend.initNumber: n Process: p.
            beLive.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'deadActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToTransformAnnotationAfterParsing = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'deadActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'deadActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         safeName = '<a dead activation>'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'deadActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'deadActivation'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'fctProxy' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToTransformAnnotationAfterParsing = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'fctProxy' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeFctProxy = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'fctProxy' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'fctProxy' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'fctProxy'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         areReflecteesSlotsMutable = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'float' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         evalName = ( |
            | 
            reflectee storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'float' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         idAndNameSize: size = ( |
            | 
            evalName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         isComplete = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeFloat = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeImmutable = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'float' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         objectIDName = ( |
            | evalName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'float' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         safeName = ( |
            | 
            (reflecteeIfFail: [^ '']) _FloatPrintString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'float'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         allBlockLiteralsDo: b = ( |
            | 
            blockLiteralsDo: [|:blk|
              b value: blk With: self.
              (reflect: blk) method allBlockLiteralsDo: b
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         allImplicitSelfSendsDo: b = ( |
             alreadySeen.
            | 
            alreadySeen: set copyRemoveAll.
            meAndAllBlockMethodsDo: [|:m|
              m implicitSelfSendsDo: [|:n|
                alreadySeen if: n IsAbsentAddAndDo: b.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         allLiteralsDo: b = ( |
            | 
            literalsDo: [|:lit|
                b value: lit With: self.
                (reflect: lit) allLiteralsDo: b.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: lists of slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         allSlotsOnThisMethod = ( |
            | 
            allSlotsOnThisMethodIfFail: vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: lists of slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         allSlotsOnThisMethodIfFail: fb = ( |
            | 
            reflectionPrimitives forMethodMirror: self AllSlotsOnThisMethodIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: lists of slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentSlots = ( |
            | allSlotsOnThisMethod copyFilteredBy: [|:s| s isArgument]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: lists of slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         arguments = ( |
            | 
            argumentSlots copyMappedBy: [|:s| s name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: lists of slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         assignableLocalSlots = ( |
            | allSlotsOnThisMethod copyFilteredBy: [|:s| s isAssignable]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         blockLiteralsDo: b = ( |
            | 
            literalsDo: [|:lit. :i|
              (reflect: lit) isReflecteeBlock ifTrue: [ b value: lit With: i ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         blockSourceIfFail: fb = ( |
             off.
             src.
            | 
            src: sourceStringIfFail: [| :e | ^ fb value: e].
            off: sourceOffsetIfFail: [| :e | ^ fb value: e].
            0 = off
              ifTrue: src
               False: [src copyFrom: off UpTo: off + (sourceLengthIfFail: [| :e | ^ fb value: e])]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: byte codes\x7fComment: Return vector of the bytecode indices that are the target of a branch.\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         branchTargets = ( |
            | 
            branchTargetFinder copyInterpretMethod: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: verifying\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         checkMethodStructureIfFail: fb = ( |
            | 
             "check all of my back pointers"
            checkMethodStructureOuterMethod: self EnclosingMethod: self IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: verifying\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         checkMethodStructureOuterMethod: outerMethod EnclosingMethod: enclosingMethod IfFail: fb = ( |
             lits.
            | 
            lits: literals.
            outerMethod = lits methodPointer ifFalse: [ ^ fb value: 'bad method pointer in literals' With: self].
            lits do: [|:lit| ( reflect: lit) checkMethodStructureOuterMethod: outerMethod EnclosingMethod: self IfFail: fb ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         codes = ( |
            | codesIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         codesIfFail: fb = ( |
            | reflectionPrimitives forMethodMirror: self CodesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         codesMirrorIfFail: fb = ( |
            | 
            reflectionPrimitives forMethodMirror: self CodesMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: programming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         copyBytecodes: bc Literals: lits File: f Line: li Source: s = ( |
            | 
            copyBytecodes: bc Literals: lits File: f Line: li Source: s IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: programming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         copyBytecodes: bc Literals: lits File: f Line: li Source: s IfFail: fb = ( |
            | 
            createOuterMethod_Bytecodes: bc 
                               Literals: lits 
                                   File: f 
                                   Line: li     
                                 Source: s 
                                 IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: programming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         createOuterMethod_Bytecodes: bc Literals: lits File: f Line: li Source: s = ( |
            | 
            createOuterMethod_Bytecodes: bc 
                               Literals: lits 
                                   File: f 
                                   Line: li     
                                 Source: s 
                                 IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: programming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         createOuterMethod_Bytecodes: bc Literals: lits File: f Line: li Source: s IfFail: fb = ( |
            | 
            _CreateOuterMethodBytecodes: bc 
                               Literals: lits 
                                   File: f asString canonicalize
                                   Line: li
                                 Source: s asString canonicalize
                                 IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         creatorNameIfPresent: presentBlock IfAbsent: absentBlock = ( |
            | 
            absentBlock value: self
            "in case of lingering creators").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: byte codes\x7fComment: return a string with one bytecode per line
-- dmu 10/12/96\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         disassemble = ( |
            | 
            methodDisassembler copyInterpretMethod: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: byte codes\x7fComment: return a mirror on a string with one bytecode per line
-- Adam 4/06\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         disassembledCodesIfFail: fb = ( |
             codes.
             lits.
            | 
            codes:    codesIfFail: [|:e| ^ fb value: e].
            lits:  literalsIfFail: [|:e| ^ fb value: e].
            (methodDisassembler copyForCodes: codes Literals: lits
            ) interpretMethod asMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         doLexicalScopes: blk = ( |
            | doLexicalScopes: blk IfFail: [^nil]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: iterating\x7fComment: Evaluates blk in each lexical scope of this activation
and returns the receiver of the outermost method activation.\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         doLexicalScopes: blk IfFail: failBlk = ( |
             activation.
            | 
            activation: self.
            [ activation isLive ifFalse: [^ failBlk value: 'dead activation'].
              blk value: activation. 
              activation isReflecteeBlockMethodActivation
            ] whileTrue: [ activation: activation lexicalParentIfFail: [|:e| ^ failBlk value: e]].
            activation receiverIfFail: failBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot'
        
         evalName = ( |
            | 
            ( selfMethodText copyForMethod: self) asSlotContents asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         evalStringsForLocalSlots = ( |
            | 
            localSlots copyMappedBy: [|:s| s evalStringAssignable leftShrinkwrapped]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: evaluating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         evaluate: aMethodMirror = ( |
            | 
            error: 'eval doesn\'t work for methods yet').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         file = ( |
            | fileIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         fileIfFail: fb = ( |
            | reflectionPrimitives forMethodMirror: self FileIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         fileMirrorIfFail: fb = ( |
            | 
            reflectionPrimitives forMethodMirror: self FileMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         hasBlocks = ( |
            | 
            blockLiteralsDo: [^ true].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         idAndNameSize: size = ( |
            | 
            nameSize: size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         implicitSelfSendsDo: b = ( |
            | 
            ((implicitSelfSendFinder copyInterpretMethod: self) asSet remove: '') do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         indexOfLiteral: lit IfFail: fb = ( |
             litMir.
            | 
            litMir: reflect: lit.
            (literalsIfFail: [|:e| ^ fb value: e]) findFirst: [|:x| litMir = (reflect: x)]
                                                   IfPresent: [|:x. :i| i]
                                                    IfAbsent: [fb value: 'literal not found']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         indexOfLocalNamed: n IfFail: fb = ( |
             i <- 0.
            | 
            [n = (nameAt: i IfFail: [|:e| ^ fb value: e])] whileFalse: [i: i succ].
            i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         instructionSet = ( |
            | 
            bytecodeFormat instructionSetForCodes: codes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isBeginningOfStatement: bci = ( |
             is.
            | 
            is: instructionSet.

               ( bci = is firstBCI )
            || [ 'pop' = ( is opcodeNameOf: codes at: bci pred ) ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         isComplete = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: testing\x7fComment: Returns true if name is local to this activation or
one of the lexical scopes, false is returned otherwise.\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isNameInLexicalScopes: n = ( |
            | 
            doLexicalScopes: [|:act | (act names includes: n) ifTrue: [^true]].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeImmutable = ( |
            | 
            true "dont try to maintain method identity").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeMethod = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeOuterMethod = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: testing\x7fComment: answer true if the effect of sending selector is trivial\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isSendingNameSimple: aString = ( |
            | 
            isNameInLexicalScopes: aString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: byte codes\x7fComment: Determines if the bytecode referred by index is simple, that is 
the debugger should not stop here during a step command.
\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isSimpleBytecodeAt: index = ( |
             b.
             n.
            | 
            b: codes byteAt: index IfAbsent: [^ false].
            n: instructionSet opcodeNameOf: b.
             'send'   =           n   ifTrue:  [^ false].
            ('branch' isPrefixOf: n)  ifTrue:  [^ false].
            n = 'implicitSelfSend'    ifFalse: [^ true].

            isSendingNameSimple:
              (selectorFinder copyInterpretMethod: self To: index) at: index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParentsDo: blk = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         line = ( |
            | lineIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lineIfFail: fb = ( |
            | reflectionPrimitives forMethodMirror: self LineIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         lineMirrorIfFail: fb = ( |
            | 
            reflectionPrimitives forMethodMirror: self LineMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         literalString: i = ( | {
                 'ModuleInfo: Module: mirror InitialContents: FollowSlot'
                
                 lit <- ''.
                } 
            | 
            lit: literals at: i.
            (reflect: lit) isReflecteeString ifTrue: lit False: [
                (reflect: lit) name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fComment: Returns a vector containing the literals of this method. (May be
a copy of the original vector of literals.) -- Adam, 4/06\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         literals = ( |
            | literalsIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         literalsDo: b = ( |
            | 
            literals do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fComment: Returns a vector containing the literals of this method. (May be
a copy of the original vector of literals.) -- Adam, 4/06\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         literalsIfFail: fb = ( |
            | reflectionPrimitives forMethodMirror: self LiteralsIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         literalsMirrorIfFail: fb = ( |
            | 
            reflectionPrimitives forMethodMirror: self LiteralsMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: byte codes\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         localReadSelectorLexicalLevel: ll Index: i = ( |
             m.
            | 
            m: self.
            ll do: [m: m lexicalParent].
            m nameAt: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: byte codes\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         localSlotLexicalLevel: ll Index: i = ( |
             m.
            | 
            m: self.
            ll do: [m: m lexicalParent].
            m at: m nameAt: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: lists of slots\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         localSlots = ( |
            | allSlotsOnThisMethod copyFilteredBy: [ |:s| s isAssignment not && [s isArgument not] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: byte codes\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         localWriteSelectorLexicalLevel: ll Index: i = ( |
            | 
            (localReadSelectorLexicalLevel: ll Index: i), ':').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         meAndAllBlockMethodsDo: b = ( |
            | 
            b value: self.
            allBlockLiteralsDo: [|:blockLit| b value: (reflect: blockLit) method].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesDo: b = ( |
             locals <- bootstrap stub -> 'globals' -> 'set' -> ().
             useLocs <- bootstrap stub -> 'globals' -> 'true' -> ().
            | 
            useLocs: _UseLocalAccessBytecodes.

            useLocs ifFalse: [
              locals: locals copy.
              names do: [|:n| locals add: n].
            ].

            (selectorFinder copyInterpretMethod: self) do: [|:sel|
              sel = '' ifFalse: [b value: sel].
            ].

            literalsDo: [|:lit|
                (reflect: lit) messagesDo: [|:m|
                    useLocs || [(locals includes: m) not]
                     ifTrue: [b value: m].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: byte codes\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         mustBeDisassembled = ( |
            | 
            ( sourceIfFail: '') isEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         nameAt: index = ( |
            | nameAt: index IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fComment: map index of local access bytecode to name\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         nameAt: index IfFail: fb = ( |
            | reflectionPrimitives forMethodMirror: self NameAt: index IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot'
        
         objectIDName = ( |
            | 
            safeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         outermostLexicalScope = ( |
             r.
            | 
            r: self.
            doLexicalScopes: [|:s| r: s].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: mapping bci\'s to source position\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         positionForPositionTableAtBCI: bci = ( |
            | 
            reflectionPrimitives forMethodMirror: self PositionForPositionTableAtBCI: bci).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: byte codes\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         positionTableIfFail: fb = ( |
            | 
             source parseObjectIntoPositionTableIfFail: [|:e|
                ^ fb value: e.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflectee = ( |
            | 
             _NakedMethods ifFalse: [
              error: 'Cannot access a method reflected in a mirror'
            ].
            resend.reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeAt: idx IfFail: errBlk = ( |
            | 
            "Added for Klein and Yoda, where methods are vectors."
            reflectionPrimitives forMethodMirror: self ReflecteeAt: idx asSmallInteger IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeAt: idx Put: val IfFail: errBlk = ( |
            | 
            "Added for Klein and Yoda, where methods are vectors."
            reflectionPrimitives
              forMethodMirror: self
                  ReflecteeAt: idx asSmallInteger
                          Put: val
                       IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeID = ( |
            | error: 'Methods do not have object IDs').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeMirrorAt: idx IfFail: errBlk = ( |
            | 
            "Added for Klein and Yoda, where methods are vectors."
            reflectionPrimitives forMethodMirror: self ReflecteeMirrorAt: idx asSmallInteger IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeSizeIfFail: errBlk = ( |
            | 
            "Added for Klein and Yoda, where methods are vectors."
            reflectionPrimitives forMethodMirror: self ReflecteeSizeIfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         safeName = ( |
            | 
            "Make sure it is safe to ask for my literals and codes. -- Adam, 4/06"
            literalsIfFail: [^ safeNamePrefix].
               codesIfFail: [^ safeNamePrefix].

            safeNamePrefix, evalName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         safeNamePrefix = 'a method'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         source = ( |
            | 
            sourceIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceIfFail: fb = ( |
            | 
            sourceStringIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceLength = ( |
            | sourceLengthIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceLengthIfFail: fb = ( |
            | reflectionPrimitives forMethodMirror: self SourceLengthIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceLengthMirrorIfFail: fb = ( |
            | 
            reflectionPrimitives forMethodMirror: self SourceLengthMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceOffset = ( |
            | sourceOffsetIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceOffsetIfFail: fb = ( |
            | reflectionPrimitives forMethodMirror: self SourceOffsetIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceOffsetMirrorIfFail: fb = ( |
            | 
            reflectionPrimitives forMethodMirror: self SourceOffsetMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: mapping bci\'s to source position\x7fComment: return the source position as a point,
x = start, y = end
-- Ungar, 1/1/95\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourcePositionAtBCI: bci = ( |
             end.
             length <- 0.
             start.
             table <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
             tableIndex.
            | 
            table: positionTableIfFail: [|:e|
              ('badTypeError' isPrefixOf: e) ifTrue: [
              ^ error: e.
              ].
              "If The parser fails to parse the string, assume
               the source is VM-generated, e.g. an error method"
              "Then select whole method, after leading newline."

              ^   case if: [source isEmpty] Then: [ 0@0 ]
                       If: [source size = 1] Then: [ 0@1 ]
                       If: [source first = '\n'] Then: [ source firstKey succ @ source lastKey succ ]
                       Else: [ source firstKey @ source lastKey succ ].
            ].
            tableIndex: (positionForPositionTableAtBCI: bci) double.
            start:  table at: tableIndex.
            length: table at: tableIndex succ.
            end: start + length.

            start @ end).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceString = ( |
            | 
            sourceStringIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceStringIfFail: fb = ( |
            | reflectionPrimitives forMethodMirror: self SourceIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: primitive method state\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceStringMirrorIfFail: fb = ( |
            | 
            reflectionPrimitives forMethodMirror: self SourceMirrorIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: mapping bci\'s to source position\x7fComment: Returns startCharIndex @ endCharIndex
(Not sure if end is inclusive. -- dmu 11/04)\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceStringPositionAtBCI: bci = ( |
            | 
            (sourcePositionAtBCI: bci) + sourceOffset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot'
        
         suggestiveNameIfPresent: presentBlock IfAbsent: absentBlock = ( |
            | 
            presentBlock value: safeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         topLevelExprName = '<top level expr>'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'method'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'methodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeMethodActivation = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'methodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'activation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'methodActivation' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'methodActivation'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'mirror' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         isComplete = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'mirror' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeImmutable = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'mirror' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeMirror = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'mirror' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'mirror' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'mirror'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         isComplete = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToTransformAnnotationAfterParsing = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeProcess = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         stack = ( |
            | reflectee stack).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         stackIfFail: fb = ( |
            | 
            stack).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'process'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'profiler' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToTransformAnnotationAfterParsing = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'profiler' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeProfiler = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'profiler' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'slots' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'profiler' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'profiler'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToTransformAnnotationAfterParsing = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeProxy = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'slots' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'proxy' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeIsLive = ( |
            | reflectee _ForeignIsLive).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'proxy' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeIsNull = ( |
            | reflectee _ForeignIsNull).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'proxy' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeKill = ( |
            | reflectee _ForeignKill. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'proxy' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeTypeSeal = ( |
            | reflecteeTypeSealIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'proxy' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeTypeSealIfFail: errBlk = ( |
            | 
            reflectee _TypeSealResultProxy: proxy deadCopy IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'proxy'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeSlots = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'slots' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'slots'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         areReflecteesSlotsMutable = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'smallInt' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         idAndNameSize: size = ( |
            | 
            name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         isComplete = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeImmutable = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeInteger = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'smallInt' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         nameSize: s PrintString: ps = ( |
            | 
            (isOKToSend: 'printString') ifTrue: [
              reflectee printString, nameSuffix.
            ] False: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'smallInt' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         safeName = ( |
            | name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'integer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeVector = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'vectorish' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'vector' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeAt: idx IfFail: errBlk = ( |
            | 
            reflectionPrimitives forVectorMirror: self ReflecteeAt: idx asSmallInteger IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'vector' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeAt: idx Put: val IfFail: errBlk = ( |
            | 
            reflectionPrimitives
              forVectorMirror: self
                  ReflecteeAt: idx asSmallInteger
                          Put: val
                       IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'vector' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeMethodPointerIfFail: fb = ( |
            | 
            reflectionPrimitives forVectorMirror: self ReflecteeMethodPointerIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'vector' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeMirrorAt: idx IfFail: errBlk = ( |
            | 
            reflectionPrimitives forVectorMirror: self ReflecteeMirrorAt: idx asSmallInteger IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'vector' -> () From: ( | {
         'Category: reflecteePrimitives\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         reflecteeSizeIfFail: errBlk = ( |
            | 
            reflectionPrimitives forVectorMirror: self ReflecteeSizeIfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         type = 'vector'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'vectorish' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         includesExtendedKey: n = ( |
             i.
            | 
            i: n asIntegerIfFail: [^ false].
            (0 <= i) && [i < reflecteeSize]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'vectorish' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         indexedSlotsDo: block = ( |
            | 
            reflecteeSize do: [|:i|
              block value:  (fakeSlot vectorElement copyMirror: self ElementIndex: i)
                     With:  i
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'vectorish' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflecteeVectorish = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'vectorish' -> () From: ( | {
         'ModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'vectorish' -> () From: ( | {
         'Category: slotAccess\x7fModuleInfo: Module: mirror InitialContents: FollowSlot\x7fVisibility: public'
        
         slotAt: n IfAbsent: block = ( |
            | 
            resend.slotAt: n 
                 IfAbsent: [|:e.  | "optimized"
                   case
                     if: [n isEmpty]      Then: [block value: e]
                     Else: [ | i |
                       i: n asIntegerIfFail: [ ^ block value: e ].
                       ( 0 <= i ) && [ i < reflecteeSize ] 
                         ifFalse: [ ^ block value: 'bad index: ', i printString].
                       fakeSlot vectorElement  copyMirror: self ElementIndex: i.
                     ]
            ]).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'metaCollections' From: 'core'
 bootstrap read: 'mirrorProgramming' From: 'core'



 '-- Side effects'

 globals modules mirror postFileIn
