 '$Revision:$'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         fastCGI = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         application = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI application.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         buffersByRequestID <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         connection.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI application parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         copy = ( |
            | 
            resend.copy buffersByRequestID: buffersByRequestID copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForConnection: c = ( |
            | 
            copy connection: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> 'parent' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         createServer = ( |
            | 
            fastCGI server copyForSocket: openSocket Application: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> 'parent' -> () From: ( | {
         'Category: handling requests\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         handleRequests = ( |
             r.
            | 
            [r: connection readRecord.
             r isNotNil] whileTrue: [
              (r beHandledBy: self) ifTrue: [^ self].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> 'parent' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         openSocket = ( |
            | 
            os_file openTCPListenerOnPort: port).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> 'parent' -> () From: ( | {
         'Category: starting\x7fComment: Feel free to override.\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         port = 9000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> 'parent' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | 
            createServer start).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         sampleApplication = bootstrap define: bootstrap stub -> 'globals' -> 'fastCGI' -> 'sampleApplication' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals fastCGI application copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'sampleApplication' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI sampleApplication.

CopyDowns:
globals fastCGI application. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'sampleApplication' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'sampleApplication' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI sampleApplication parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'sampleApplication' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         handleRequest: r = ( |
             out.
            | 
            out: r outputStream.
            out write: 'Content-Type: text/plain\r\n'.
            out write: '\r\n'.
            out write: 'Self says the current time is: '.
            out write: time current asString.
            out write: '\r\n'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'sampleApplication' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fastCGI' -> 'application' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         server = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (fastCGI sampleApplication)\x7fVisibility: private'
        
         application <- bootstrap stub -> 'globals' -> 'fastCGI' -> 'sampleApplication' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> () From: ( | {
         'Category: handling requests\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         connection = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForSocket: s = ( |
            | 
            copy socket: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         onlyProtocolVersionIKnow = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         protocolVersion = ( |
            | 
            onlyProtocolVersionIKnow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: reading records\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeForRecordOfType: typeNumber = ( |
            | 
            [aaa]. "Don't hard-code the numbers, call typeNumber on each type."
            case
              if: [typeNumber = 1] Then: [records beginRequest]
              If: [typeNumber = 2] Then: [records abortRequest]
              If: [typeNumber = 3] Then: [records endRequest]
              If: [typeNumber = 4] Then: [records params]
              If: [typeNumber = 5] Then: [records stdin]
              If: [typeNumber = 6] Then: [records stdout]
              If: [typeNumber = 7] Then: [records stderr]
              If: [typeNumber = 8] Then: [records data]
              If: [typeNumber = 9] Then: [records getValues]
              If: [typeNumber = 10] Then: [records getValuesResult]
              If: [typeNumber = 11] Then: [records unknownType]
              Else: [error: 'unknown record type']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: reading records\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         readRecord = ( |
             content.
             contentBody.
             contentLength.
             padding.
             paddingLength.
             requestID.
             reserved.
             typeNumber.
             version.
            | 
            version:       socket readBigEndianIntegerOfByteCount: 1 Signed: false IfFail: [^ nil].
            typeNumber:    socket readBigEndianIntegerOfByteCount: 1 Signed: false IfFail: raiseError.
            requestID:     socket readBigEndianIntegerOfByteCount: 2 Signed: false IfFail: raiseError.
            contentLength: socket readBigEndianIntegerOfByteCount: 2 Signed: false IfFail: raiseError.
            paddingLength: socket readBigEndianIntegerOfByteCount: 1 Signed: false IfFail: raiseError.
            reserved:      socket readBigEndianIntegerOfByteCount: 1 Signed: false IfFail: raiseError.
            content:       socket readCount: contentLength.
            padding:       socket readCount: paddingLength.
            [version = onlyProtocolVersionIKnow] assert.
            (prototypeForRecordOfType: typeNumber) copyForRequestID: requestID Content: content).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: reading records\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         recordBuffer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent recordBuffer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         application.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         beginRequest.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         dataRecords <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         paramsRecords <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent recordBuffer parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         allData = ( |
             data <- ''.
            | 
            dataRecords do: [|:r| data: data & r bytes].
            data flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         allInput = ( |
             input <- ''.
            | 
            stdinRecords do: [|:r| input: input & r bytes].
            input flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         allParams = ( |
             d.
            | 
            d: dictionary copyRemoveAll.
            paramsRecords do: [|:r| d addAll: r valuesByName].
            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         copy = ( |
            | 
            ((resend.copy paramsRecords: paramsRecords copy)
                           stdinRecords:  stdinRecords copy)
                            dataRecords:   dataRecords copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForApplication: a BeginRequest: r = ( |
            | 
            (copy application: a) beginRequest: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'Category: responding\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         createRequest = ( |
            | 
            request copyForRequestID: requestID Params: allParams Input: allInput Data: allData).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'Category: responding\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         deleteFromApplication = ( |
            | 
            application buffersByRequestID removeKey: requestID.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'Category: responding\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         hasReceivedCompleteList: records = ( |
            | 
            records isEmpty not && [records last isEmpty]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'Category: responding\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         isReady = ( |
            | 
            beginRequest role isReady: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'Category: responding\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         request = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> 'request' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent recordBuffer parent request.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> 'request' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         dataBytes <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> 'request' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         errorStream.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> 'request' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         id <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> 'request' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         inputBytes <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> 'request' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         outputStream.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> 'request' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         paramValuesByName.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> 'request' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> 'request' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent recordBuffer parent request parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> 'request' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForRequestID: rid Params: ps Input: i Data: d = ( |
             c.
            | 
            c: copy.
            c id: rid.
            c paramValuesByName: ps.
            c inputBytes: i.
            c dataBytes: d.
            c outputStream:  writeStream copyOn: ''.
            c errorStream:   writeStream copyOn: ''.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> 'request' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         requestID = ( |
            | 
            beginRequest requestID).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'Category: responding\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         sendResponse: r = ( |
             c.
            | 
            c: application connection.
            c sendRecord: c records stdout     copyForRequestID: requestID Content: r outputStream contents.
            c sendRecord: c records stderr     copyForRequestID: requestID Content: r  errorStream contents.
            c sendRecord: c records endRequest copyForRequestID: requestID.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> 'parent' -> () From: ( | {
         'Category: responding\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         sendResponseIfReady = ( |
             r.
            | 
            isReady ifFalse: [^ false].
            [aaa].
            deleteFromApplication.
            r: createRequest.
            application handleRequest: r.
            sendResponse: r.
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'recordBuffer' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         stdinRecords <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: reading records\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         records = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         abstract = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records abstract.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records abstract parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForRequestID: id Content: content = ( |
            | 
            (copy requestID: id) parseContent: content).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parseContent: content = ( |
            | 
            parseStream: readStream copyOn: content).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         recordBufferForApp: app = ( |
            | 
            app buffersByRequestID at: requestID).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         serializeForConnection: c = ( |
             body.
             header.
             padding.
            | 
            body: serializeBody.
            padding: byteVector copySize: body size % 8 FillingWith: 0.
            header: serializeHeaderForConnection: c Length: body size PaddingLength: padding size.
            header, body, padding).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         serializeHeaderForConnection: c Length: contentLength PaddingLength: paddingLength = ( |
             s.
            | 
            s: writeStream copyOn: ''.
            s writeBigEndianInteger: c protocolVersion ByteCount: 1 Signed: false IfFail: raiseError.
            s writeBigEndianInteger: typeNumber        ByteCount: 1 Signed: false IfFail: raiseError.
            s writeBigEndianInteger: requestID         ByteCount: 2 Signed: false IfFail: raiseError.
            s writeBigEndianInteger: contentLength     ByteCount: 2 Signed: false IfFail: raiseError.
            s writeBigEndianInteger: paddingLength     ByteCount: 1 Signed: false IfFail: raiseError.
            s writeBigEndianInteger: 0                 ByteCount: 1 Signed: false IfFail: raiseError.
            s contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         requestID <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractByteStream = bootstrap define: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstractByteStream' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals fastCGI server parent connection parent records abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstractByteStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records abstractByteStream.

CopyDowns:
globals fastCGI server parent connection parent records abstract. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstractByteStream' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         bytes <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstractByteStream' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstractByteStream' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records abstractByteStream parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstractByteStream' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         isEmpty = ( |
            | 
            bytes isEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstractByteStream' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstractByteStream' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parseContent: content = ( |
            | 
            bytes: content.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstractByteStream' -> 'parent' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         serializeBody = ( |
            | 
            bytes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         beginRequest = bootstrap define: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals fastCGI server parent connection parent records abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records beginRequest.

CopyDowns:
globals fastCGI server parent connection parent records abstract. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         flags <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records beginRequest parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         beHandledBy: app = ( |
            | 
            app buffersByRequestID at: requestID Put: app connection recordBuffer copyForApplication: app BeginRequest: self.
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parseStream: s = ( |
            | 
            roleNumber: s readBigEndianIntegerOfByteCount: 2 Signed: false IfFail: raiseError.
            flags:      s readBigEndianIntegerOfByteCount: 1 Signed: false IfFail: raiseError.
            "reserved:" s readCount:                       5.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> 'parent' -> () From: ( | {
         'Category: roles\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         roleNumber: n = ( |
            | 
            role:
             case
              if: [n = 1] Then: [roles responder]
              If: [n = 2] Then: [roles authorizer]
              If: [n = 3] Then: [roles filter]
              Else: [error: 'unknown role']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> 'parent' -> () From: ( | {
         'Category: roles\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         roles = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> 'parent' -> 'roles' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records beginRequest parent roles.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> 'parent' -> 'roles' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         responder = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> 'parent' -> 'roles' -> 'responder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records beginRequest parent roles responder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> 'parent' -> 'roles' -> 'responder' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         isReady: r = ( |
            | 
               (r hasReceivedCompleteList: r paramsRecords)
            && [r hasReceivedCompleteList: r  stdinRecords]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> 'parent' -> 'roles' -> 'responder' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'beginRequest' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         role.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         endRequest = bootstrap define: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals fastCGI server parent connection parent records abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records endRequest.

CopyDowns:
globals fastCGI server parent connection parent records abstract. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         appStatus <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records endRequest parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForRequestID: id = ( |
            | 
            copyForRequestID: id AppStatus: 0 ProtocolStatus: protocolStatuses requestComplete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForRequestID: id AppStatus: as ProtocolStatus: ps = ( |
            | 
            ((copy requestID: id) appStatus: as) protocolStatus: ps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> 'parent' -> () From: ( | {
         'Category: protocol status\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         protocolStatuses = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> 'parent' -> 'protocolStatuses' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records endRequest parent protocolStatuses.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> 'parent' -> 'protocolStatuses' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         requestComplete = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> 'parent' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         serializeBody = ( |
             s.
            | 
            s: writeStream copyOn: ''.
            s writeBigEndianInteger:      appStatus ByteCount: 4 Signed: false IfFail: raiseError.
            s writeBigEndianInteger: protocolStatus ByteCount: 1 Signed: false IfFail: raiseError.
            s write:  byteVector copySize: 3 FillingWith: 0.
            s contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         typeNumber = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'endRequest' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         protocolStatus <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         values = bootstrap define: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'values' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals fastCGI server parent connection parent records abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'values' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records values.

CopyDowns:
globals fastCGI server parent connection parent records abstract. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'values' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'values' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records values parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'values' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         copy = ( |
            | 
            resend.copy valuesByName: valuesByName copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'values' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstract' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'values' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parseStream: s = ( |
            | 
            [s atEnd] whileFalse: [| nSize. vSize. n. v |
              nSize: readLengthFromStream: s.
              vSize: readLengthFromStream: s.
              n: s readCount: nSize.
              v: s readCount: vSize.
              valuesByName at: n Put: v.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'values' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         readLengthFromStream: s = ( |
             b.
            | 
            b: s readBigEndianIntegerOfByteCount: 1 Signed: false IfFail: raiseError.
            (b >> 7) == 0 ifTrue: [^ b].
            int32  add:  (b && 16r7f) << 24  With:  s readBigEndianIntegerOfByteCount: 3 Signed: false IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'values' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         valuesByName <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         params = bootstrap define: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'params' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals fastCGI server parent connection parent records values copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'params' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records params.

CopyDowns:
globals fastCGI server parent connection parent records values. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'params' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'params' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records params parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'params' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         beHandledBy: app = ( |
             r.
            | 
            r: recordBufferForApp: app.
            r paramsRecords add: self.
            r sendResponseIfReady).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'params' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         isEmpty = ( |
            | 
            valuesByName isEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'params' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'values' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         stderr = bootstrap define: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stderr' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals fastCGI server parent connection parent records abstractByteStream copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stderr' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records stderr.

CopyDowns:
globals fastCGI server parent connection parent records abstractByteStream. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stderr' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stderr' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records stderr parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stderr' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstractByteStream' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stderr' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         typeNumber = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         stdin = bootstrap define: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stdin' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals fastCGI server parent connection parent records abstractByteStream copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stdin' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records stdin.

CopyDowns:
globals fastCGI server parent connection parent records abstractByteStream. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stdin' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stdin' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records stdin parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stdin' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         beHandledBy: app = ( |
             r.
            | 
            r: recordBufferForApp: app.
            r stdinRecords add: self.
            r sendResponseIfReady).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stdin' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstractByteStream' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         stdout = bootstrap define: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stdout' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals fastCGI server parent connection parent records abstractByteStream copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stdout' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records stdout.

CopyDowns:
globals fastCGI server parent connection parent records abstractByteStream. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stdout' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stdout' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fastCGI server parent connection parent records stdout parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stdout' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'abstractByteStream' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> 'records' -> 'stdout' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         typeNumber = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: sending records\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         sendRecord: r = ( |
            | 
            socket write: r serializeForConnection: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         socket.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForSocket: s Application: a = ( |
            | 
            (copy serverSocket: s) application: a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> () From: ( | {
         'Category: handling requests\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         ensureStopped = ( |
            | 
            serverSocket closeIfFail: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         log: s = ( |
            | 
            [aaa]. "Not sure what to do with it."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> 'parent' -> () From: ( | {
         'Category: handling requests\x7fModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | 
            log: 'FastCGI server starting.'.
            [
              [| c. a |
                serverSocket initialize: 'FastCGI server socket'.
                c: connection copyForSocket: serverSocket acceptConnection.
                a: application copyForConnection: c.
                [a handleRequests]. "browsing"
                (message copy receiver: a Selector: 'handleRequests') fork resume.
              ] loop.
            ] onNonLocalReturn: [
              [aaa]. "Never actually called yet."
              serverSocket close.
              log: 'FastCGI server terminated.'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fastCGI' -> 'server' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         serverSocket.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot'
        
         fastCGI = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'fastCGI' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'fastCGI' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules fastCGI.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fastCGI' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fastCGI' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fastCGI' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fastCGI' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fastCGI' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fastCGI' -> () From: ( | {
         'ModuleInfo: Module: fastCGI InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules fastCGI postFileIn
