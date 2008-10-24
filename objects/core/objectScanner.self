 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         objectScanner = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'objectScanner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'objectScanner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules objectScanner.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectScanner' -> () From: ( | {
         'ModuleInfo: Module: objectScanner InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectScanner' -> () From: ( | {
         'ModuleInfo: Module: objectScanner InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectScanner' -> () From: ( | {
         'ModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         myComment <- 'object scanner is some stuff to visit all fields in an object'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectScanner' -> () From: ( | {
         'ModuleInfo: Module: objectScanner InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectScanner' -> () From: ( | {
         'ModuleInfo: Module: objectScanner InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         objectScanner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter objectScanner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'ModuleInfo: Module: objectScanner InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | ((
            resend.copy mirrorIDs: mirrorIDs copy)
            rootMirrors: rootMirrors copy)
            pathsToReattach: pathsToReattach copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         debug = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: copy-down\x7fModuleInfo: Module: objectScanner InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         mirrorIDs <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: copy-down\x7fModuleInfo: Module: objectScanner InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         pathsToReattach <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         reattach: p = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'ModuleInfo: Module: objectScanner InitialContents: FollowSlot\x7fVisibility: public'
        
         removeApplication: app = ( |
            | 
            suspects do: [|:m. | 
                ( m lookupKey: app ) do: [|:s| s remove].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: copy-down\x7fModuleInfo: Module: objectScanner InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         rootMirrors <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scan: m = ( |
            | 
            [|:xit. i |
                i: mirrorIDs at: m IfAbsent: xit.
                scanAlready: m ID: i.
                ^ self
            ] exit.
            mirrorIDs at: m Put: mirrorIDs size.
            scanNew: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanActivation: m = ( |
            | 
            m isLive ifTrue: [
                warning: 'Cannot save live activation: ', m printString.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanAlready: m ID: i = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanAnnotation: a = ( |
            | scan: reflect: a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanAnon: m = ( |
            | 
            scanByType: m.
            scanSlotsOf: m.
            scanAnnotation: m annotationIfFail: [^self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'ModuleInfo: Module: objectScanner InitialContents: FollowSlot\x7fVisibility: public'
        
         scanApplication: name = ( | {
                 'ModuleInfo: Module: objectScanner InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            rootMirrors: set copyRemoveAll.
            suspects do: [|:m| 
                ( m lookupKey: name ) do: [|:s| rootMirrors add: s contents].
            ].
            t: [scanRoots] time.
            (
                mirrorIDs size printString, ' objects in ', t printString, ' ms.'
            ) printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanAssignment: m = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanBlock: m = ( |
            | 
            m lexicalParent isLive ifTrue: [
                warning: 'cannot save live block: ', m printString.
            ].
            scanValueMethod: m valueSlot contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanBlockActivation: m = ( |
            | scanActivation: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanBlockMethod: m = ( |
            | scanMethod: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanByType: m = ( |
            | 
            " must preceeed method "
            m isReflecteeMethodActivation ifTrue: [^ scanMethodActivation: m ].
            m isReflecteeBlockMethodActivation  ifTrue: [^ scanBlockActivation: m ].
            m isReflecteeBlockMethod     ifTrue: [^ scanBlockMethod:  m ].
            m isReflecteeMethod          ifTrue: [^ scanOuterMethod:  m ].
            m isReflecteeAssignment      ifTrue: [^ scanAssignment: m].

            " string must preceed bytevector "
            m isReflecteeString     ifTrue: [ ^ scanString:      m ].
            m isReflecteeByteVector ifTrue: [ ^ scanByteVector:  m ].

            m isReflecteeSlots      ifTrue: [ ^ scanSlotsObject: m ].
            m isReflecteeInteger    ifTrue: [ ^ scanInteger:         m ].
            m isReflecteeFloat      ifTrue: [ ^ scanFloat:       m ].
            m isReflecteeMirror     ifTrue: [ ^ scanMirror:      m ].
            m isReflecteeVector     ifTrue: [ ^ scanVector:      m ].

            m isReflecteeBlock      ifTrue: [^ scanBlock: m ].
            m isReflecteeProcess    ifTrue: [^ scanProcess:    m ].

            m isReflecteeFctProxy ifTrue: [^ scanFctProxy:    m ].
            m isReflecteeProxy    ifTrue: [^ scanProxy:       m ].

            error: 'what?').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanByteVector: m = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanCauseOfBirth: s = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanCauseOfDeath: s = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanCodes: bv = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanFctProxy = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanFile: s = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanFloat: m = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanInteger: m = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanLine: i = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanLiterals: v = ( |
            | scanVectorBody: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanMethod: m = ( |
            | 
            scanSource: m source.
            scanFile:   m file.
            scanLine:   m line.
            scanCodes:  m codes.

            scanLiterals: m literals.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanMethodActivation: m = ( |
            | scanActivation: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanMirror: m = ( |
            | scan: m reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanNew: m = ( | {
                 'ModuleInfo: Module: objectScanner InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            p: m creatorPathIfPresent: [|:c| p: c] IfAbsent: [
                ^ scanAnon: m.
            ].
            (rootMirrors includes: m) ifTrue: [
                pathsToReattach add: p.
                ^ scanAnon: m.
            ].
            p slotsDo: [|:slot. :i. h |
                h: slot holder.
                "if m is reachable via rootMirrors,
                 it will get reattached automatically."
                (rootMirrors includes: h) ifTrue: [ 
                    ^ scanAnon: m.
                ].
            ] IfAbsent: [error: 'path cache must be current'].
            "path does not cross a rootMirror, must be well known"
            scanWellKnown: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanOuterMethod: m = ( |
            | scanMethod: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanProcess: m = ( | {
                 'ModuleInfo: Module: objectScanner InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            p: m reflectee.
            p isActive ifTrue: [
                warning: 'cannot save active process: ', p printString.
            ].
            scanCauseOfBirth: p causeOfBirth.
            scanCauseOfDeath: p causeOfDeath).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanProxy = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'ModuleInfo: Module: objectScanner InitialContents: FollowSlot\x7fVisibility: public'
        
         scanRoots = ( |
            | 
            rootMirrors do: [|:m| scan: m].
            pathsToReattach do: [|:p| reattach: p].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanSlot: s = ( |
            | 
            s isArgument ifFalse: [scan: s contents].
            scan: reflect: s annotation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanSlotsObject: m = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: xxx check for std object like vector? _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanSlotsOf: m = ( |
            | 
            m do: [|:s| scanSlot: s]. "xxx making slots slower?"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanSource: s = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanString: m = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanValueMethod: m = ( |
            | scan: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanVector: m = ( |
            | scanVectorBody: m reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: level 2\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanVectorBody: v = ( |
            | 
            v do: [|:lit| scan: reflect: lit].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'Category: scanning\x7fComment: _\x7fModuleInfo: Module: objectScanner InitialContents: FollowSlot'
        
         scanWellKnown: p = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'ModuleInfo: Module: objectScanner InitialContents: InitializeToExpression: (
       (vector copyAddLast: reflect: globals) copyAddLast: reflect: traits
       )\x7fVisibility: private'
        
         suspects = 
       (vector copyAddLast: reflect: globals) copyAddLast: reflect: traits
       .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> () From: ( | {
         'ModuleInfo: Module: objectScanner InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | 
            copy scanApplication: 'primitiveMaker').
        } | ) 



 '-- Side effects'

 globals modules objectScanner postFileIn
