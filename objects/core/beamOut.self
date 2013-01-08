 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         beamOut = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'beamOut' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'beamOut' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules beamOut.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'beamOut' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'beamOut' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'beamOut' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         myComment <- 'a beam-out er writes all objects reached from some initial set onto a file'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'beamOut' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'beamOut' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         binaryBeamOut = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter binaryBeamOut.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         binaryCodes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter binaryCodes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         codes = bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: override me\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         fileProto = bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: copied-down\x7fModuleInfo: Module: beamOut InitialContents: InitializeToExpression: ( dictionary copyRemoveAll )'
        
         mirrorIDs <-  dictionary copyRemoveAll .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: copy-down\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         outFile.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'transporter' -> 'objectScanner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         reattach: p = ( |
            | 
            ('writing reattachment for ', p fullName) printLine.
            writePath: p copyWithoutLast.
            scanSlot:
                p targetSlotIfAbsent: [error: 'path cache not current']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: copied-down\x7fModuleInfo: Module: beamOut InitialContents: InitializeToExpression: ( set copyRemoveAll )'
        
         rootMirrors <-  set copyRemoveAll .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanAlready: id = ( |
            | 
            writeCode: codes already.
            outFile writeInteger: id.
            resend.scanAlready: id).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot\x7fVisibility: public'
        
         scanApplication: app = ( | {
                 'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            outFile: fileProto openForWritingApplication: app.
            outFile  writeFullInteger: 0. "save room"
            outFile  writeFullInteger: 0. "save room"
            resend.scanApplication: app.
            outFile seekTo: 0.
            outFile writeFullInteger: mirrorIDs size.
            outFile writeFullInteger: rootMirrors size.
            outFile close).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanAssignment: m = ( |
            | 
            writeCode: codes assignment.
            resend.scanAssignment: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanBlock: m = ( |
            | 
            writeCode: codes block.
            resend.scanBlock: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanBlockActivation: m = ( |
            | 
            writeCode: codes blockActivation.       
            resend.scanBlockActivation: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanBlockMethod: m = ( |
            | 
            writeCode: codes blockMethod.
            resend.scanBlockMethod: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanByteVector: m = ( |
            | 
            writeCode: codes byteVector.
            outFile writeByteVector: m reflectee.
            resend.scanByteVector: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: lvl 2\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanCauseOfBirth: s = ( |
            | outFile writeString: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: lvl 2\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanCauseOfDeath: s = ( |
            | outFile writeString: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: lvl 2\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanCodes: bv = ( |
            | 
            outFile writeByteVector: bv.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanFctProxy: m = ( |
            | 
            writeCode: codes fctProxy.
            resend.scanFctProxy: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: lvl 2\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanFile: s = ( |
            | scan: reflect: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanFloat: m = ( |
            | 
            writeCode: codes float.
            outFile writeFloat: m reflectee.
            resend.scanFloat: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanInteger: m = ( |
            | 
            writeCode: codes integer.
            outFile writeInteger: m reflectee.
            resend.scanInteger: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: lvl 2\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanLine: i = ( |
            | 
            outFile writeInteger: i.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanMethodActivation: m = ( |
            | 
            writeCode: codes methodActivation.      
            resend.scanMethodActivation: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanMirror: m = ( |
            | 
            writeCode: codes mirror.
            resend.scanMirror: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanNew: m = ( | {
                 'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: resend.scanNew: m.
            writeCheck: m.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanOuterMethod: m = ( |
            | 
            writeCode: codes method.
            resend.scanOuterMethod: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanProcess: m = ( |
            | 
            writeCode: codes process.
            resend.scanProcess: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanProxy: m = ( |
            | 
            writeCode: codes proxy.
            resend.scanProxy: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanSlot: s = ( |
            | 
            scan: reflect: s name.
            outFile writeBoolean: s isArgument.
            s isArgument ifFalse: [
                outFile writeByte: s parentPriority.
                outFile writeByte: s visibility asPrefix first asByte.
            ].
            resend.scanSlot: s. "get anno & contents").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanSlotsObject: m = ( |
            | 
            writeCode: codes slotsObject.
            resend.scanSlotsObject: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanSlotsOf: m = ( |
            | 
            m areReflecteesSlotsMutable ifFalse: [
                outFile writeInteger: -1.
                ^ self.
            ].
            outFile writeInteger: m size.
            resend.scanSlotsOf: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: lvl 2\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanSource: s = ( |
            | 
            outFile writeString: s.
            resend.scanSource: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanString: m = ( |
            | 
            writeCode: codes string.
            outFile writeString: m reflectee.
            resend.scanString: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanVector: m = ( |
            | 
            writeCode: codes vector.
            resend.scanVector: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: lvl 2\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanVectorBody: v = ( |
            | 
            outFile writeInteger: v size.
            resend.scanVectorBody: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Category: dispatched\x7fComment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         scanWellKnown: p = ( |
            | 
            writeCode: codes wellKnown.
            writePath: p.
            resend.scanWellKnown: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | 
            copy scanApplication: 'primitiveMaker'.
            removeApplication: 'primitiveMaker'.
            transporter binaryBeamIn test.
            primitiveMaker reader test).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         writeCheck: m = ( |
            | 
            codes useChecks ifTrue: [
                writeCode: codes postCheck.
                outFile writeInteger: mirrorIDs at: m.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         writeCode: c = ( |
            | outFile writeByte: c.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryBeamOut' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         writePath: p = ( |
            | 
            outFile writeInteger: p size.
            p do: [|:n| scan: reflect: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         already = 58.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         assignment = 97.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         block = 108.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         blockActivation = 113.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         blockMethod = 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         byteVector = 98.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         fctProxy = 106.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         float = 102.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         integer = 105.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         method = 104.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         methodActivation = 99.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         mirror = 109.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         postCheck = 122.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         preCheck = 121.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         process = 112.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         proxy = 101.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         slotsObject = 115.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         string = 116.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'Comment: for debugging\x7fModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         useChecks = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         vector = 118.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryCodes' -> () From: ( | {
         'ModuleInfo: Module: beamOut InitialContents: FollowSlot'
        
         wellKnown = 119.
        } | ) 



 '-- Side effects'

 globals modules beamOut postFileIn
