 '$Revision: 30.6 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot'
        
         bufferedBootstrapFile = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'bufferedBootstrapFile' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'bufferedBootstrapFile' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules bufferedBootstrapFile.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bufferedBootstrapFile' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bufferedBootstrapFile' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bufferedBootstrapFile' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bufferedBootstrapFile' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bufferedBootstrapFile' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bufferedBootstrapFile' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot'
        
         bufferedBootstrapFile = bootstrap define: bootstrap stub -> 'globals' -> 'transporter' -> 'bufferedBootstrapFile' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals transporter bootstrapFile copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'bufferedBootstrapFile' -> () From: ( |
             {} = 'Comment: I am a file-like object with behavior for writing out bootstrap source files\x7fModuleInfo: Creator: globals transporter bufferedBootstrapFile.

CopyDowns:
globals transporter bootstrapFile. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bufferedBootstrapFile' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: bufferedBootstrapFile InitialContents: InitializeToExpression: (byteVector)'
        
         buffer <- bootstrap stub -> 'globals' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bufferedBootstrapFile' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: bufferedBootstrapFile InitialContents: InitializeToExpression: (0)'
        
         bufferUsed <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bufferedBootstrapFile' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'bufferedBootstrapFile' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter bufferedBootstrapFile parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bufferedBootstrapFile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            flush.
            resend.close).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bufferedBootstrapFile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot\x7fVisibility: private'
        
         flush = ( |
            | 
            file writeFrom: buffer Count: bufferUsed.
            bufferUsed: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bufferedBootstrapFile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot\x7fVisibility: private'
        
         initBuffer = ( |
            | 
            buffer: buffer copySize: 4096.
            bufferUsed: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bufferedBootstrapFile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         openForModule: mod Flags: unixFlags = ( |
             r.
            | 
            r: resend.openForModule: mod Flags: unixFlags.
            r initBuffer.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bufferedBootstrapFile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bufferedBootstrapFile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: bufferedBootstrapFile InitialContents: FollowSlot'
        
         write: s = ( |
            | 
            (bufferUsed + s size)  >  buffer size  ifTrue: [
              flush.
              ^ resend.write: s.
            ].
            s do: [|:c. :i| buffer at: i + bufferUsed Put: c asByte].
            bufferUsed: bufferUsed + s size.
            self).
        } | ) 



 '-- Side effects'

 globals modules bufferedBootstrapFile postFileIn
