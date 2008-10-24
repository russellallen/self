 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         beamIn = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'beamIn' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'beamIn' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules beamIn.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'beamIn' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'beamIn' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'beamIn' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'beamIn' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'beamIn' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         binaryBeamIn = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter binaryBeamIn.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         atID: id Put: m = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 defer = bootstrap stub -> 'globals' -> 'true' -> ().
                } 
            | 
            (mustPreserveIdentity at: id) ifTrue: [ | oldM |
                oldM: mirrorsByID at: id.
                defer ifTrue: [ deferredDefines at: oldM Put: m. ] 
                       False: [ oldM define: m. ].
                oldM "cause define clones arg!"
            ] False: [
                mirrorsByID at: id Put: m.
                m
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         checkID: m = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 i.
                } 
            | 
            codes useChecks ifTrue: [
                [readCode = codes postCheck] assert.
                i: inFile readInteger.
                nextID reverseDo: [|:id|
                    (mirrorsByID at: id) = m ifTrue: [
                        [i = id] assert.
                        ^ self
                    ].
                ].
                error: 'did not find it'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         codes = bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | (((
                resend.copy rootMirrors: rootMirrors copy)
                mirrorsByID:         mirrorsByID copy)
                deferredDefines:    deferredDefines copy)
            mustPreserveIdentity:        mustPreserveIdentity copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Category: copy-down\x7fModuleInfo: Module: beamIn InitialContents: InitializeToExpression: ( dictionary copyRemoveAll )'
        
         deferredDefines <-  dictionary copyRemoveAll .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Category: copy-down\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         inFile <- bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Category: copy-down\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         mirrorsByID <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Category: copy-down\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         mustPreserveIdentity <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Category: copy-down\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         nextID <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         outOfSync = ( |
            | 
            error: 'out of sync with file at position ', 
                inFile currentPosition printString,
                ' =  octal 0',
                (inFile currentPosition printStringBase: 8)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: FollowSlot\x7fVisibility: public'
        
         printIDs: n = ( |
            | "for debugging"
            n do: [|:i| (i printString, ' ', (mirrorsByID at: i) name) printLine.].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: FollowSlot\x7fVisibility: public'
        
         readApplication: app = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 n.
                }  {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 nroots.
                }  {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            inFile: inFile openForReadingApplication: app.
            n:      inFile readFullInteger.
            nroots: inFile readFullInteger.
            mirrorsByID:  mirrorsByID  copySize: n.
            mustPreserveIdentity: 
                mustPreserveIdentity copySize: n FillingWith: false.
            rootMirrors: rootMirrors copySize: nroots.
            t: [
                nroots do: [|:i| rootMirrors at: i Put: scan].
                deferredDefines do: [|:v. :k| k define: v].
                [inFile atEOF] whileFalse: [scanReattachment].
            ] time.
            inFile close.
            (
                mirrorsByID size printString, ' objects in ', t printString, ' ms.'
            ) printLine.
            rootMirrors).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         readCode = ( |
            | inFile readByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         remember: x = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 i.
                } 
            | 
            i: nextID.
            mirrorsByID at: i Put: x.
            nextID: nextID succ.
            i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         remember: proto Then: resultb = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 id.
                } 
            | 
            id: remember: proto.
            atID: id Put: resultb value.
            id).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Category: copy-down\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         rootMirrors <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scan = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 c.
                }  {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            c: readCode.
            c = codes already        ifTrue: [ ^ scanPrevious ].
            m: scanNew: c.
            checkID: m.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanAnon: c = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 id.
                }  {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            id: scanByType: c.
            m: scanSlotsInto: id.
            m annotation: scan reflectee.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanAssignment = ( |
            | remember: mirrors assignment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanBlock = ( |
            | 
            remember: mirrors block Then: [mirrors block copyForMethod: scan]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanBlockActivation = ( |
            | 
            "cannot do live ones, do not even try"
            remember: mirrors deadActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanBlockMethod = ( |
            | scanMethodIsBlock: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanByType: c = ( |
            | 
            " sorted by frequency"
            " returns id "

            c = codes string         ifTrue: [ ^ scanString      ].
            c = codes method         ifTrue: [ ^ scanMethod ].
            c = codes assignment     ifTrue: [ ^ scanAssignment ].
            c = codes slotsObject    ifTrue: [ ^ scanSlotsObject ].
            c = codes block          ifTrue: [ ^ scanBlock       ].
            c = codes blockMethod    ifTrue: [ ^ scanBlockMethod ].
            c = codes byteVector     ifTrue: [ ^ scanByteVector  ].
            c = codes integer        ifTrue: [ ^ scanInteger ].
            c = codes float          ifTrue: [ ^ scanFloat  ].
            c = codes mirror         ifTrue: [ ^ scanMirror ].
            c = codes vector         ifTrue: [ ^ scanVector      ].
            c = codes process        ifTrue: [ ^ scanProcess     ].
            c = codes methodActivation  ifTrue: [ ^ scanMethodActivation  ].
            c = codes  blockActivation  ifTrue: [ ^ scanBlockActivation  ].
            c = codes proxy             ifTrue: [ ^ scanProxy ].
            c = codes fctProxy          ifTrue: [ ^ scanFctProxy ].

            outOfSync).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanByteVector = ( |
            | remember: reflect: inFile readByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanFctProxy = ( |
            | remember: reflect: fctProxy copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanFloat = ( |
            | remember: reflect: inFile readFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanInteger = ( |
            | remember: reflect: inFile readInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanMethod = ( |
            | scanMethodIsBlock: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanMethodActivation = ( |
            | 
            "cannot do live ones, do not even try"
            remember: mirrors deadActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanMethodIsBlock: isBlock = ( |
            | 
            remember: (
                isBlock ifTrue: [mirrors blockMethod] False: [mirrors method]
            ) Then: [
                | 
                source <- ''. 
                codes <- byteVector.
                literals <- vector.
                file <- ''.
                line <- 0.
                |
                source: inFile readString.
                file:   scan reflectee.
                line:   inFile readInteger.
                codes:  inFile readByteVector.
                literals: scanVectorBody.
                isBlock ifTrue: [
                    mirrors blockMethod createBlockMethod_Bytecodes: codes
                        Literals: literals
                        File: file
                        Line: line
                        Source: source
                ] False: [
                    mirrors method createOuterMethod_Bytecodes: codes
                        Literals: literals
                        File: file
                        Line: line
                        Source: source
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanMirror = ( |
            | remember: mirrors mirror Then: [reflect: scan]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanNew: c = ( |
            | 
            c = codes wellKnown    ifTrue: [^ scanWellKnown ].
            scanAnon: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanPath = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 v.
                } 
            | 
            v: vector copySize: inFile readInteger.
            v size do: [|:i| v at: i Put: scan reflectee].
            path copyWithAll: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanPrevious = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            i: inFile readInteger.
            r: mirrorsByID at: i.
            mustPreserveIdentity at: i Put: true.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanProcess = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 m.
                }  {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            remember: reflect: (
                process copy causeOfBirth: inFile readString
            )                causeOfBirth: inFile readString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanProxy = ( |
            | remember: reflect: proxy copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanReattachment = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 host.
                }  {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 path.
                } 
            | 
            path: scanPath.
            ('reattaching ', path fullName) printLine.
            host: path targetMirrorIfAbsent: [
                warning: 'could not find ', path fullName.
                reflect: () _Clone
            ].
            host define: scanSlotInto: host).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanSlotInto: m = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 anno.
                }  {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 isArg.
                }  {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 name.
                } 
            | 
            name: scan reflectee.
            isArg: inFile readBoolean.
            (
                isArg ifTrue: [
                  ((m copyAt: name PutContents: globals mirrors slots) 
                      at: name) copyHolderForIsArgument: true
                ] False: [ | pri. v. vis. contents |
                    isParent: inFile readByte.
                    v:   inFile readByte.
                    vis:  
                        v = '_' asByte ifTrue: [    privateSlot] False: [
                        v = '^' asByte ifTrue: [     publicSlot] False: [
                            undeclaredSlot]].
                    contents: scan.
                    ((
                      (m copyAt: name PutContents: contents) at: name)
                        copyHolderForVisibility: vis)
                        copyHolderForIsParent:   isParent
                ]
            ) copyHolderForAnnotation: scan reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanSlotsInto: id = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 m.
                }  {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            m: mirrorsByID at: id.
            n: inFile readInteger.
            n < 0 ifTrue: [^ m].
            m: m copyRemoveAll.
            n do: [m: scanSlotInto: m].
            atID: id Put: m. "atID clones if defines").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: need clone for checking code to work _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanSlotsObject = ( |
            | remember: reflect: () _Clone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanString = ( |
            | 
            remember: (reflect: '') Then: [reflect: inFile readString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanVector = ( |
            | 
            remember: (reflect: vector) Then: [reflect: scanVectorBody]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanVectorBody = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 n.
                }  {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 v.
                } 
            | 
            n: inFile readInteger.
            v: vector copySize: n.
            n do: [|:i| v at: i Put: scan reflectee].
            v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         scanWellKnown = ( | {
                 'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            " do it with mirrors to circumvent privacy "
            "need to get mirror from table cause remember:Then calls
             atID:Put: which calls define which clones"
            mirrorsByID at:
              remember: (reflect: () _Clone) Then: [
                p: scanPath.
                p targetMirror.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: FollowSlot'
        
         skipCheck = ( |
            | 
            codes useChecks ifTrue: [readCode. inFile readInteger].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamIn' -> () From: ( | {
         'ModuleInfo: Module: beamIn InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | 
            copy readApplication: 'primitiveMaker').
        } | ) 



 '-- Side effects'

 globals modules beamIn postFileIn
