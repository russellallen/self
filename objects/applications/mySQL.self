 '$Revision:$'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         mySQL = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'mySQL' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'mySQL' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules mySQL.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mySQL' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mySQL' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mySQL' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mySQL' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mySQL' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mySQL' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: databases\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         mySQL = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         connection = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         moreScrambleBuff <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         packetNumber <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: capabilities\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         capabilities = ( |
             r.
            | 
            r: list copyRemoveAll.
            (reflect: capabilityFlags) do: [|:s|
              (hasCapability: s contents reflectee) ifTrue: [r add: s name].
            ].
            r asVector copySort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: capabilities\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         capabilityFlags = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent capabilityFlags.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         compress = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         connectWithDB = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         foundRows = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         ignoreSigpipe = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         ignoreSpace = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         interactive = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         localFiles = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         longFlag = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         longPassword = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         multiResults = 17.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         multiStatements = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         noSchema = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         odbc = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         protocol41 = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         reserved = 14.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         secureConnection = 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         ssl = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'capabilityFlags' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         transactions = 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         characterSetNumber = ( |
            | 
            [aaa]. "I think Squeak does 8. I have no idea what it means."
            8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         clientFlags = ( |
            | 
               (1 << capabilityFlags interactive)
            || (1 << capabilityFlags localFiles)
            || (1 << capabilityFlags longFlag)
            || (1 << capabilityFlags longPassword)
            || (1 << capabilityFlags multiResults)
            || (1 << capabilityFlags multiStatements)
            || (1 << capabilityFlags protocol41)
            || (1 << capabilityFlags secureConnection)
            || (1 << capabilityFlags transactions)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: tables\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         column = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'column' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent column.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'column' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         default.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'column' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         extra.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'column' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isNullable <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'column' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         key.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'column' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'column' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'column' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent column parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'column' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'column' -> 'parent' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         setFieldNamed: n To: v = ( |
             s <- ''.
             words.
            | 
            words: n asTokensSeparatedByCharactersIn: '_'.
            words first = 'COLUMN' ifTrue: [words removeFirst].
            words doFirst: [|:w| s: s & w uncapitalizeAll]
               MiddleLast: [|:w| s: s & w uncapitalizeAll capitalize].
            (s flatString, ':') sendTo: self With: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'column' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         type.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: executing queries\x7fCategory: particular kinds of queries\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         columnsForTableNamed: n IfFail: fb = ( |
             r.
            | 
            r: executeQuery: 'SHOW FIELDS FROM ', n.
            r isError ifTrue: [^ fb value: r message With: r].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: commands\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         command = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent command.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         argument <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (mySQL connection)\x7fVisibility: private'
        
         connection <- bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent command parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForConnection: c Query: q = ( |
            | 
            ((copy connection: c) argument: q) type: types query).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForConnection: c ToInitializeDatabaseNamed: d = ( |
            | 
            ((copy connection: c) argument: d) type: types init_db).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> () From: ( | {
         'Category: executing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         execute = ( |
            | 
            connection writePacketOfType: connection packetFormats command From: self.
            isExpectingResultSet ifTrue: [connection readResultSet]
                                  False: [connection readResultPacket]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         isExpectingResultSet = ( |
             queryCommand.
            | 
            type = types query ifFalse: [^ false].
            queryCommand: argument asTokensSeparatedByWhiteSpace first capitalizeAll.
            (queryCommand = 'SELECT') || [queryCommand = 'SHOW']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> () From: ( | {
         'Category: command types\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         types = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( |
             {} = 'Comment: Taken from include/mysql_com.h, the
enum_server_command enumeration.
-- Adam, Mar. 2009\x7fModuleInfo: Creator: globals mySQL connection parent command parent types.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         binlog_dump = 18.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         change_user = 17.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         connect = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         connect_out = 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         create_db = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         daemon = 29.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         debug = 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         delayed_insert = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         drop_db = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         field_list = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         init_db = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         ping = 14.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         process_info = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         process_kill = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         query = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         quit = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         refresh = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         register_slave = 21.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         set_option = 27.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         shutdown = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         sleep = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         statistics = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         stmt_close = 25.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         stmt_execute = 23.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         stmt_fetch = 28.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         stmt_prepare = 22.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         stmt_reset = 26.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         stmt_send_long_data = 24.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         table_dump = 19.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         time = 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'command' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (-1)\x7fVisibility: private'
        
         type <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: connecting\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         connect = ( |
             r.
            | 
            createSocket.
            r:  readPacketOfType: packetFormats handshakeInitialization.
               writePacketOfType: packetFormats clientAuthentication     Number: r packetNumber succ From: self.
            readResultPacket).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         copy = ( |
            | 
            resend.copy tablesByName: tablesByName copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForSpec: s = ( |
            | 
            copy spec: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: connecting\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         createSocket = ( |
            | 
            socket: unixGlobals os_file openTCPHost: spec host Port: spec port.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         cryptedPassword = ( |
            | 
            case
              if: [hasCapability: capabilityFlags secureConnection] Then: [cryptedPasswordForSecureConnection]
              If: [protocolVersion = 10]                            Then: [notWorkingProperlyYetAndMightNotBeNecessary. cryptedPasswordForProtocol10]
              Else:                                                       [notImplementedYet]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: password hashing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         cryptedPasswordForProtocol10 = ( |
             aSeed.
             hashedString.
             maxValue.
             num1.
             num2.
             num3.
             result.
            | 

            notWorkingYetAndMightNotBeNecessary.

            aSeed: scrambleBuff, moreScrambleBuff.
            hashedString: mutableString copySize: aSeed size.
            result: randomInit2: spec password Seed: aSeed.
            maxValue: result at: 0.
                num1: result at: 1.
                num2: result at: 2.

            hashedString size do: [|:i| 
              num1: int32 rem: (int32 add: (int32 mul: num1 With: 3) With: num2) With: maxValue IfFail: raiseError.
              num2: int32 rem: (int32 add: num1 With: int32 add: num2 With:  33) With: maxValue IfFail: raiseError.
              num3: int32 add: (int32 div: (int32 mul: num1 With: 31) With: maxValue IfFail: raiseError) With: 64.
              hashedString at: i Put: num3.
            ].
            num1: int32 rem: (int32 add: (int32 mul: num1 With: 3) With: num2) With: maxValue IfFail: raiseError.
            num2: int32 rem: (int32 add: num1 With: int32 add: num2 With:  33) With: maxValue IfFail: raiseError.
            num3: int32 div: (int32 mul: num1 With: 31) With: maxValue IfFail: raiseError.
            halt.
            hashedString bytesDo: [|:b. :i| hashedString at: i Put:  int32 xor: b With: num3].

            hashedString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: password hashing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         cryptedPasswordForSecureConnection = ( |
             hash1.
             hash2.
            | 
            hash1: sha1 hashMessage: spec password.
            hash2: sha1 hashMessage: hash1.
            hash1 ^^ (sha1 hashMessage: scrambleBuff, moreScrambleBuff, hash2)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         databaseName = ( |
            | 
            spec databaseName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: executing queries\x7fCategory: particular kinds of queries\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         dropTableNamed: n IfFail: fb = ( |
             r.
            | 
            r: executeQuery: 'DROP TABLE ', n.
            r isError ifTrue: [^ fb value: r message With: r].
            [r isOK] assert.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: packets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         eofResult = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'eofResult' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent eofResult.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'eofResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         packetNumber.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'eofResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'eofResult' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent eofResult parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'eofResult' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         isEOF = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'eofResult' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'eofResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         serverStatus.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'eofResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         warningCount.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: packets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         errorResult = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'errorResult' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent errorResult.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'errorResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         errorNumber <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'errorResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         message <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'errorResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (-1)\x7fVisibility: public'
        
         packetNumber <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'errorResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'errorResult' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent errorResult parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'errorResult' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         isError = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'errorResult' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         isOK = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'errorResult' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'errorResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         sqlState <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: executing queries\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         executeQuery: q = ( |
            | 
            (command copyForConnection: self Query: q) execute).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: result sets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         fieldDescriptor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent fieldDescriptor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         catalog.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         characterSetNumber.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         databaseName.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         decimals.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         default.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         flags.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         length.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         name.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         originalName.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         originalTableName.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         packetNumber.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent fieldDescriptor parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         isEOF = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         typeForNumber: n = ( |
            | 
            "Taken from enum_field_types in includes/mysql_com.h -- Mar. 2009"
            case
             if: [n = 16r00] Then: [types decimal]
             If: [n = 16r01] Then: [types tiny]
             If: [n = 16r02] Then: [types short]
             If: [n = 16r03] Then: [types long]
             If: [n = 16r04] Then: [types float]
             If: [n = 16r05] Then: [types double]
             If: [n = 16r06] Then: [types null]
             If: [n = 16r07] Then: [types timeStamp]
             If: [n = 16r08] Then: [types longLong]
             If: [n = 16r09] Then: [types int23]
             If: [n = 16r0a] Then: [types date]
             If: [n = 16r0b] Then: [types time]
             If: [n = 16r0c] Then: [types dateAndTime]
             If: [n = 16r0d] Then: [types year]
             If: [n = 16r0e] Then: [types newDate]
             If: [n = 16r0f] Then: [types varChar]
             If: [n = 16rf6] Then: [types newDecimal]
             If: [n = 16rf7] Then: [types enum]
             If: [n = 16rf8] Then: [types set]
             If: [n = 16rf9] Then: [types tinyBlob]
             If: [n = 16rfa] Then: [types mediumBlob]
             If: [n = 16rfb] Then: [types longBlob]
             If: [n = 16rfc] Then: [types blob]
             If: [n = 16rfd] Then: [types varString]
             If: [n = 16rfe] Then: [types string]
             If: [n = 16rfe] Then: [types geometry]
             Else: [error: 'unknown type']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         typeNumber: n = ( |
            | 
            type: typeForNumber: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         types = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent fieldDescriptor parent types.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         abstract = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'abstract' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent fieldDescriptor parent types abstract.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         blob = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'blob' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent fieldDescriptor parent types blob.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'blob' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         number = 253.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'blob' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'blob' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         valueFromBytes: bytes = ( |
            | 
            bytes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         date = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'date' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent fieldDescriptor parent types date.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'date' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         number = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'date' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'date' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         valueFromBytes: bytes = ( |
             tokens.
            | 
            tokens: bytes asTokensSeparatedByCharactersIn: '-'.
            [aaa]. "Does Self already have a Date object? If not, maybe make one."
            time copyYear: (tokens at: 0) asInteger
                    Month: (tokens at: 1) asInteger
                     Date: (tokens at: 2) asInteger
                    Hours: 0
                  Minutes: 0 
                  Seconds: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         long = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'long' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent fieldDescriptor parent types long.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'long' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         number = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'long' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'long' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         valueFromBytes: bytes = ( |
            | 
            [aaa]. "Is it really giving me the number as characters?"
            case
              if: bytes = '0' Then: [0]
              Else: [halt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         string = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'string' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent fieldDescriptor parent types string.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         number = 254.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         valueFromBytes: bytes = ( |
            | 
            bytes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         varString = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'varString' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent fieldDescriptor parent types varString.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'varString' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         number = 253.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'varString' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> 'types' -> 'varString' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         valueFromBytes: bytes = ( |
            | 
            bytes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> 'parent' -> () From: ( | {
         'Category: values\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         valueFromBytes: bytes = ( |
            | 
            type valueFromBytes: bytes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         tableName.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         type.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: capabilities\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         hasCapability: bit = ( |
            | 
            0 != (int32 and: serverCapabilities With: 1 << bit)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         maxPacketSize = ( |
            | 
            1 << 24).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: packets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         okResult = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'okResult' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent okResult.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'okResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         affectedRows <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'okResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         insertID <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'okResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         message <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'okResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (-1)\x7fVisibility: public'
        
         packetNumber <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'okResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'okResult' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent okResult parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'okResult' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         isError = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'okResult' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         isOK = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'okResult' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'okResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         serverStatus <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'okResult' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         warningCount <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: password hashing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         oldPasswordHash: aString = ( |
             num1.
             num2.
             num3.
            | 
            num1: int32 fromHigh16Bits: 16r5030 Low16Bits: 16r5735.
            num2: 305419889.
            num3: 7.
            aString bytesDo: [|:b|
              (b = ' ' asByte) || [b = '\t' asByte] ifFalse: [
                num1: int32 xor: num1 With:  int32 add: (int32 mul: (int32 add: (int32 and: num1 With: 63) With: num3) With: b) With:  int32 shl: num1 With: 8.
                num2: int32 add: num2 With:  int32 xor: (int32 shl: num2 With: 8) With: num1.
                num3: int32 add: num3 With:  b.
              ].
            ].
            ((int32 and: num1 With: int32 fromHigh16Bits: 16r7FFF Low16Bits: 16rFFFF) & (int32 and: num2 With: int32 fromHigh16Bits: 16r7FFF Low16Bits: 16rFFFF)) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: packets\x7fCategory: formats\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         packetFormats = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent packetFormats.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         clientAuthentication = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'clientAuthentication' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent packetFormats clientAuthentication.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'clientAuthentication' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'clientAuthentication' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         processFor: x = ( |
            | 
            x target: x connection.
            x integerFieldNamed:              'clientFlags'        ByteCount: 4.  [clientFlags.        clientFlags:        0].
            x integerFieldNamed:              'maxPacketSize'      ByteCount: 4.  [maxPacketSize.      maxPacketSize:      0].
            x integerFieldNamed:              'characterSetNumber' ByteCount: 1.  [characterSetNumber. characterSetNumber: 0].
            x unusedFieldOfByteCount:                                         23.
            x nullTerminatedStringFieldNamed: 'userName'.                         [userName.           userName:           ''].
            x    lengthCodedStringFieldNamed: 'cryptedPassword'.                  [cryptedPassword.    cryptedPassword:    ''].
            x unusedFieldOfByteCount:                                         1.
            [x nullTerminatedStringFieldNamed: 'databaseName'.]. [aaa].           [databaseName.       databaseName:       ''].
            x target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         command = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'command' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent packetFormats command.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'command' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'command' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         processFor: x = ( |
            | 
            x integerFieldNamed:              'type'       ByteCount: 1.
            x nullTerminatedStringFieldNamed: 'argument'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         eof = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'eof' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent packetFormats eof.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'eof' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'eof' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         processRemainingFieldsFor: x = ( |
            | 
            x target: x connection eofResult copy.
            x constantFieldContainingInteger: 16rfe               ByteCount: 1.
            x integerFieldNamed:              'warningCount'      ByteCount: 2.  [warningCount. warningCount: 0 ]. "browsing"
            x integerFieldNamed:              'serverStatus'      ByteCount: 2.  [serverStatus. serverStatus: 0 ]. "browsing"
            x target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         error = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'error' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent packetFormats error.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'error' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'error' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         processRemainingFieldsFor: x = ( |
            | 
            x target: x connection errorResult copy.
            x constantFieldContainingInteger: 16rff         ByteCount: 1.
            x integerFieldNamed:              'errorNumber' ByteCount: 2.  [errorNumber. errorNumber: 0 ]. "browsing"
            x constantFieldContainingString:  '#'.
            x stringFieldNamed:               'sqlState'    ByteCount: 5.  [sqlState.    sqlState:    '']. "browsing"
            x restOfPacketStringFieldNamed:   'message'.                   [message.     message:     '']. "browsing"
            x target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         fieldDescriptor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'fieldDescriptor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent packetFormats fieldDescriptor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         result = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'result' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent packetFormats result.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'result' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'fieldDescriptor' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         processRemainingFieldsFor: x = ( |
            | 
            x target: x connection fieldDescriptor copy.
            x lengthCodedStringFieldNamed:    'catalog'.                           [catalog.            catalog:            '']. "browsing"
            x lengthCodedStringFieldNamed:    'databaseName'.                      [databaseName.       databaseName:       '']. "browsing"
            x lengthCodedStringFieldNamed:    'tableName'.                         [tableName.          tableName:          '']. "browsing"
            x lengthCodedStringFieldNamed:    'originalTableName'.                 [originalTableName.  originalTableName:  '']. "browsing"
            x lengthCodedStringFieldNamed:    'name'.                              [name.               name:               '']. "browsing"
            x lengthCodedStringFieldNamed:    'originalName'.                      [originalName.       originalName:       '']. "browsing"
            x unusedFieldOfByteCount:                                          1.
            x integerFieldNamed:              'characterSetNumber'  ByteCount: 2.  [characterSetNumber. characterSetNumber: 0]. "browsing"
            x integerFieldNamed:              'length'              ByteCount: 4.  [length.             length:             0]. "browsing"
            x integerFieldNamed:              'typeNumber'          ByteCount: 1.  [typeNumber.         typeNumber:         0]. "browsing"
            x integerFieldNamed:              'flags'               ByteCount: 2.  [flags.              flags:              0]. "browsing"
            x integerFieldNamed:              'decimals'            ByteCount: 1.  [decimals.           decimals:           0]. "browsing"
            x constantFieldContainingInteger: 0                     ByteCount: 2.
            [aaa "won't work for writing"]. x atEnd ifFalse: [
              x lengthCodedBinaryFieldNamed:  'default'.
            ].
            x target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         handshakeInitialization = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'handshakeInitialization' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent packetFormats handshakeInitialization.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'handshakeInitialization' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'handshakeInitialization' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         processFor: x = ( |
            | 
            x target: x connection.
            x integerFieldNamed:              'protocolVersion'    ByteCount: 1.  [protocolVersion.    protocolVersion:    0 ]. "browsing"
            x nullTerminatedStringFieldNamed: 'serverVersion'.                    [serverVersion.      serverVersion:      '']. "browsing"
            x integerFieldNamed:              'threadID'           ByteCount: 4.  [threadID.           threadID:           0 ]. "browsing"
            x stringFieldNamed:               'scrambleBuff'       ByteCount: 8.  [scrambleBuff.       scrambleBuff:       '']. "browsing"
            x constantFieldContainingInteger: 0                    ByteCount: 1.
            x integerFieldNamed:              'serverCapabilities' ByteCount: 2.  [serverCapabilities. serverCapabilities: 0 ]. "browsing"
            x integerFieldNamed:              'serverLanguage'     ByteCount: 1.  [serverLanguage.     serverLanguage:     0 ]. "browsing"
            x integerFieldNamed:              'serverStatus'       ByteCount: 2.  [serverStatus.       serverStatus:       0 ]. "browsing"
            x constantFieldContainingInteger: 0                    ByteCount: 13.
            x nullTerminatedStringFieldNamed: 'moreScrambleBuff'.                 [moreScrambleBuff.   moreScrambleBuff:   '']. "browsing"
            x target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         ok = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'ok' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent packetFormats ok.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'ok' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'result' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'ok' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         processRemainingFieldsFor: x = ( |
            | 
            x target: x connection okResult copy.
            x constantFieldContainingInteger: 0                    ByteCount: 1.
            x    lengthCodedBinaryFieldNamed: 'affectedRows'.                     [affectedRows. affectedRows: 0 ]. "browsing"
            x    lengthCodedBinaryFieldNamed: 'insertID'.                         [insertID.     insertID:     0 ]. "browsing"
            x integerFieldNamed:              'serverStatus'       ByteCount: 2.  [serverStatus. serverStatus: 0 ]. "browsing"
            x integerFieldNamed:              'warningCount'       ByteCount: 2.  [warningCount. warningCount: 0 ]. "browsing"
            x   restOfPacketStringFieldNamed: 'message'.                          [message.      message:      '']. "browsing"
            x target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'result' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         isRowData = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'result' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'result' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         processFor: x = ( |
             realPacketFormat.
             status.
            | 
            status: x peekAtNextByte.
            realPacketFormat:
              case
                if: [ status  = 16rff]                          Then: [x connection packetFormats error]
                If: [(status  = 16rfe) && [x packetLength < 9]] Then: [x connection packetFormats eof]
                If: [ status <= 16rfa]                          Then: [self]
                Else: [notImplementedYet].
            realPacketFormat processRemainingFieldsFor: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         resultSetHeader = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'resultSetHeader' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent packetFormats resultSetHeader.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'resultSetHeader' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'result' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'resultSetHeader' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         processRemainingFieldsFor: x = ( |
            | 
            x target: x connection resultSet copyForConnection: x connection.
            x lengthCodedBinaryFieldNamed: 'fieldCount'.  [fieldCount. fieldCount: 0].
            [aaa "won't work for writing"]. x atEnd ifFalse: [
              x lengthCodedBinaryFieldNamed: 'extra'.     [extra.      extra:      0].
            ].
            x target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         rowData = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'rowData' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent packetFormats rowData.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'rowData' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         isRowData = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'rowData' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'result' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'packetFormats' -> 'rowData' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         processRemainingFieldsFor: x = ( |
            | 
            x target: x holder startReceivingRowData.
            [x atEnd] whileFalse: [
              x lengthCodedStringFieldNamed: 'nextFieldBytes'.
            ].
            x holder doneReceivingRowData.
            x target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: executing queries\x7fCategory: particular kinds of queries\x7fCategory: quoting\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         quoteColumnName: n = ( |
            | 
            '`', n, '`').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: executing queries\x7fCategory: particular kinds of queries\x7fCategory: quoting\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         quoteTableName: n = ( |
            | 
            '`', (n replace: '.' With: '`.`'), '`').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: executing queries\x7fCategory: particular kinds of queries\x7fCategory: quoting\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         quoteValue: v = ( |
            | 
            quoteValue: v ForColumn: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: executing queries\x7fCategory: particular kinds of queries\x7fCategory: quoting\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         quoteValue: v ForColumn: c = ( |
             m.
            | 
            m: reflect: v.
            case
              if: [m isReflecteeInteger] Then: [v asString]
              If: [m isReflecteeByteVector ] Then: [[aaa]. "Not right." '\'', v asString, '\'']
              If: [c isNotNil && [c type = 'date']] Then: ['\'', v dateStringForMySQL, '\'']
              Else: [
                [aaa]. "See quoting.rb in the ActiveRecord code"
                notImplementedYet
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: password hashing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         randomInit2: aString Seed: aSeed = ( |
             array1.
             array2.
             result.
            | 
            result: vector copySize: 3.
            array1: oldPasswordHash: aString.
            array2: oldPasswordHash: aSeed.
            result at: 0 Put: int32 fromHigh16Bits: 16r3FFF Low16Bits: 16rFFFF.
            result at: 1 Put: int32 rem: (int32 xor: (array1 at: 0) With: (array2 at: 0)) With: (result at: 0) IfFail: raiseError.
            result at: 2 Put: int32 rem: (int32 xor: (array1 at: 1) With: (array2 at: 1)) With: (result at: 0) IfFail: raiseError.
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: packets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         readPacketOfType: type = ( |
            | 
            (mySQL packetReader copyForConnection: self) processPacketOfType: type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: packets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         readPacketOfType: type Into: holder = ( |
            | 
            (mySQL packetReader copyForConnection: self Holder: holder) processPacketOfType: type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: packets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         readPacketsOfType: type Into: holder = ( |
            | 
            [|p|
             p: readPacketOfType: type Into: holder.
             p isEOF ifTrue: [^ self].
             holder add: p.
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: packets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         readResultPacket = ( |
            | 
            readPacketOfType: packetFormats ok).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: packets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         readResultSet = ( |
             resultSet.
            | 
            resultSet: readPacketOfType: packetFormats resultSetHeader.
            resultSet isResultSet ifTrue: [
              readPacketsOfType: packetFormats fieldDescriptor Into: resultSet fieldDescriptors.
              resultSet gotAllTheFieldDescriptors.
              readPacketsOfType: packetFormats rowData         Into: resultSet.
            ] False: [
              whatIsThis.
            ].
            resultSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: result sets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         resultSet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent resultSet.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         connection.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         currentFieldIndex <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         extra.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         fieldCount.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         fieldDescriptors <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         objectBuilder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         objectsByTableName.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (-1)\x7fVisibility: public'
        
         packetNumber <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent resultSet parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: building objects\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot'
        
         add: blah = ( |
            | 
            "What a mess."
            [aaa]. "Remove this method. Then fix what breaks."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: building objects\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         atFieldWithDescriptor: fd PutBytes: bytes = ( |
             o.
            | 
            o: objectsByTableName at: fd tableName IfAbsentPut: [createObjectForTableNamed: fd originalTableName].
            o setFieldNamed: fd originalName To: fd valueFromBytes: bytes.
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         copy = ( |
            | 
            (resend.copy fieldDescriptors: fieldDescriptors copy)
                                     rows: rows copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForConnection: c = ( |
            | 
            copy connection: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: building objects\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         createObjectForTableNamed: n = ( |
            | 
            n isEmpty ifFalse: [
              (modelPrototypeForTableNamed: n) copyForResultSetWithConnection: connection
            ] True: [
              connection column copy
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: building objects\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         doneReceivingRowData = ( |
            | 
            rows addLast: objectsByTableName.
            objectsByTableName: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: building objects\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         gotAllTheFieldDescriptors = ( |
            | 
            fieldDescriptors: fieldDescriptors asVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         isEOF = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         isError = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         isResultSet = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: building objects\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         modelPrototypeForTableNamed: n = ( |
            | 
            n sendTo: connection spec modelNamespace).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: building objects\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         nextFieldBytes: bytes = ( |
            | 
            atFieldWithDescriptor: nextFieldDescriptor PutBytes: bytes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: building objects\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         nextFieldDescriptor = ( |
             fd.
            | 
            currentFieldIndex = fieldDescriptors size ifTrue: [
              [aaa]. "Confused. I need a spec for how the result sets for these SHOW queries work."
              [
              doneReceivingRowData.
              startReceivingRowData.
              ].
              currentFieldIndex: 0.
            ].
            fd: fieldDescriptors at: currentFieldIndex.
            currentFieldIndex: currentFieldIndex succ.
            fd).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> 'parent' -> () From: ( | {
         'Category: building objects\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         startReceivingRowData = ( |
            | 
            objectsByTableName: dictionary copyRemoveAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'resultSet' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         rows <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: tables\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         table = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'table' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent table.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'table' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         connection.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'table' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'table' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'table' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connection parent table parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'table' -> 'parent' -> () From: ( | {
         'Category: columns\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         columns = ( |
             rs.
            | 
            rs: connection columnsForTableNamed: name IfFail: raiseError.
            [rs rows allSatisfy: [|:row| row size = 1]] assert.
            rs rows copyMappedBy: [|:row| row first]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'table' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForConnection: c Name: n = ( |
            | 
            (copy connection: c) name: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> 'table' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: tables\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         tableNamed: n = ( |
            | 
            tablesByName at: n IfAbsentPut: [table copyForConnection: self Name: n]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: executing queries\x7fCategory: particular kinds of queries\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         updateTableNamed: n SetColumns: cs To: vs Where: pkName Is: pk IfFail: fb = ( |
             pairs.
             pairsString <- ''.
             r.
            | 
            pairs: list copyRemoveAll.
            cs with: vs Do: [|:c. :v|
              pairs add: (quoteColumnName: c name) & ' = ' & (quoteValue: v ForColumn: c).
            ].
            pairs do: [|:p| pairsString: pairsString & p] SeparatedBy: [pairsString: pairsString & ', '].

            r: executeQuery: 'UPDATE ', (quoteTableName: n),
                             'SET ', pairsString flatString,
                             'WHERE ', (quoteColumnName: pkName), ' = ', (quoteValue: pk).

            r isError ifTrue: [^ fb value: r message With: r].
            [r isOK] assert.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         userName = ( |
            | 
            spec user).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: packets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         writePacketOfType: type From: source = ( |
            | 
            writePacketOfType: type Number: 0 From: source).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> 'parent' -> () From: ( | {
         'Category: packets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         writePacketOfType: type Number: n From: source = ( |
            | 
            (mySQL packetWriter copyForConnection: self Source: source)
               processPacketOfType: type Number: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         protocolVersion <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         scrambleBuff <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         serverCapabilities <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         serverLanguage <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         serverStatus <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         serverVersion <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         socket.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         connectionSpec = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connectionSpec' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connectionSpec.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (mySQL connectionSpec)\x7fVisibility: public'
        
         spec <- bootstrap stub -> 'globals' -> 'mySQL' -> 'connectionSpec' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         tablesByName <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         threadID <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connectionSpec' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (\'self_test\')\x7fVisibility: public'
        
         databaseName <- 'self_test'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connectionSpec' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (\'localhost\')\x7fVisibility: public'
        
         host <- 'localhost'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connectionSpec' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         modelNamespace.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connectionSpec' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'connectionSpec' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL connectionSpec parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connectionSpec' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         createConnection = ( |
            | 
            mySQL connection copyForSpec: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connectionSpec' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connectionSpec' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         password <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connectionSpec' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (3306)\x7fVisibility: public'
        
         port <- 3306.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'connectionSpec' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         user <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         model = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL model.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> () From: ( | {
         'Category: database\x7fModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         databaseConnection.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> () From: ( | {
         'Category: database\x7fModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         id.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> () From: ( | {
         'Category: database\x7fModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         isNewRecord <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL model parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForResultSetWithConnection: c = ( |
            | 
            [aaa]. "Is there a way to avoid having a databaseConnection field in every model?"
            (copy databaseConnection: c) isNewRecord: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( | {
         'Category: saving\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         createDatabaseRecord = ( |
            | 
            halt.
            isNewRecord: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( | {
         'Category: saving\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         createOrUpdateDatabaseRecord = ( |
            | 
            isNewRecord ifTrue: [createDatabaseRecord]
                         False: [updateDatabaseRecord]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( | {
         'Category: accessing the database\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         databaseTable = ( |
            | 
            databaseConnection tableNamed: databaseTableName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( | {
         'Category: accessing the database\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         databaseTableName = ( |
            | 
            "Feel free to override this in children."
            asMirror creatorSlotHint name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         fieldNamed: n = ( |
            | 
            n sendTo: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( | {
         'Category: accessing the database\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         primaryKey = ( |
            | 
            id).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( | {
         'Category: accessing the database\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         primaryKeyName = 'id'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( | {
         'Category: saving\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         save = ( |
            | 
            createOrUpdateDatabaseRecord).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         setFieldNamed: n To: v = ( |
            | 
            (n, ':') sendTo: self With: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( | {
         'Category: saving\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         updateDatabaseRecord = ( |
             cs.
             r.
            | 
            cs: databaseTable columns.
            cs isEmpty ifTrue: [^ self].
            r: databaseConnection updateTableNamed: databaseTableName SetColumns: cs To: (valuesForColumns: cs) Where: primaryKeyName Is: primaryKey IfFail: raiseError.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> () From: ( | {
         'Category: accessing the database\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         valuesForColumns: cs = ( |
            | 
            cs copyMappedBy: [|:c| fieldNamed: c name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> () From: ( | {
         'Category: packets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         packetReaderOrWriter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReaderOrWriter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL packetReaderOrWriter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReaderOrWriter' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (mySQL connection)\x7fVisibility: private'
        
         connection <- bootstrap stub -> 'globals' -> 'mySQL' -> 'connection' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReaderOrWriter' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReaderOrWriter' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL packetReaderOrWriter parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReaderOrWriter' -> 'parent' -> () From: ( | {
         'Category: failure handling\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         failure = bootstrap stub -> 'globals' -> 'raiseError' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReaderOrWriter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReaderOrWriter' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> () From: ( | {
         'Category: packets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         packetReader = bootstrap define: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals mySQL packetReaderOrWriter copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL packetReader.

CopyDowns:
globals mySQL packetReaderOrWriter. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         holder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         inputStream.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         packetFormat.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         packetLength.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         packetNumber.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL packetReader parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         atEnd = ( |
            | 
            inputStream atEnd).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         constantFieldContainingInteger: expected ByteCount: bc = ( |
             actual.
            | 
            actual: integerFieldOfByteCount: bc.
            [actual = expected] assert.
            expected).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         constantFieldContainingString: expected = ( |
             actual.
            | 
            actual: inputStream readCount: expected size IfFail: failure.
            [actual = expected] assert.
            expected).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForConnection: c = ( |
            | 
            copy connection: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForConnection: c Holder: h = ( |
            | 
            (copyForConnection: c) holder: h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         integerFieldNamed: n ByteCount: bc = ( |
             result.
            | 
            result: integerFieldOfByteCount: bc.
            justReadFieldNamed: n Value: result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         integerFieldOfByteCount: bc = ( |
            | 
            integerFieldOfByteCount: bc FromStream: inputStream).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         integerFieldOfByteCount: bc FromStream: s = ( |
             bytes.
             result <- 0.
            | 
            bytes: s readCount: bc IfFail: failure.
            [bytes size = bc] assert.
            bytes bytesDo: [|:b. :i|
              result: result + (b * (1 << (i * 8))).
            ].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         justReadFieldNamed: n Value: v = ( |
            | 
            (n, ':') sendTo: target With: v.
            v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         lengthCodedBinaryField = ( |
            | 
            lengthCodedBinaryFieldWithFirstByte: integerFieldOfByteCount: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         lengthCodedBinaryFieldNamed: n = ( |
            | 
            lengthCodedBinaryFieldNamed: n FirstByte: integerFieldOfByteCount: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         lengthCodedBinaryFieldNamed: n FirstByte: firstByte = ( |
             v.
            | 
            v: lengthCodedBinaryFieldWithFirstByte: firstByte.
            justReadFieldNamed: n Value: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         lengthCodedBinaryFieldWithFirstByte: firstByte = ( |
            | 
            case
              if: [firstByte <= 250] Then: [
                firstByte
              ]
              If: [firstByte = 251] Then: [
                [packetFormat isRowData] assert.
                nil
              ]
              If: [firstByte = 252] Then: [
                integerFieldOfByteCount: 2
              ]
              If: [firstByte = 253] Then: [
                integerFieldOfByteCount: 3
              ]
              If: [firstByte = 254] Then: [
                integerFieldOfByteCount: 8
              ]
              Else: [
                halt
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         lengthCodedStringFieldNamed: n = ( |
             bc.
            | 
            bc: lengthCodedBinaryField.
            bc ifNil: [
              [packetFormat isRowData] assert.
              ^ justReadFieldNamed: n Value: nil
            ].
            stringFieldNamed: n ByteCount: bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         nullTerminatedStringFieldNamed: n = ( |
             s <- ''.
            | 
            [aaa performance]. "This'll be hideously inefficient."
            [|:exit. c|
             c: inputStream readNextOneIfFail: failure.
             c = '\0' ifTrue: exit False: [s: s, c]. [aaa]. "Oy."
            ] loopExit.
            justReadFieldNamed: n Value: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReaderOrWriter' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         peekAtNextByte = ( |
            | 
            (inputStream peek: 1) byteAt: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: processing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         processPacketOfType: t = ( |
             result.
            | 
            packetFormat: t.
            packetLength: integerFieldOfByteCount: 3 FromStream: connection socket.
            packetNumber: integerFieldOfByteCount: 1 FromStream: connection socket.
            inputStream:  readStream copyOn:  connection socket readMin: 0 Max: packetLength IfFail: failure.
            result: t processFor: self.
            result packetNumber: packetNumber.
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         restOfPacketStringFieldNamed: n = ( |
             bytes.
            | 
            bytes: inputStream readMin: 0 IfFail: failure.
            justReadFieldNamed: n Value: bytes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         stringFieldNamed: n ByteCount: bc = ( |
             bytes.
             result <- 0.
            | 
            bytes: inputStream readCount: bc IfFail: failure.
            [bytes size = bc] assert.
            justReadFieldNamed: n Value: bytes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReader' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         unusedFieldOfByteCount: bc = ( |
            | 
            "Ignore it because the documentation says it's unused."
            integerFieldOfByteCount: bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> () From: ( | {
         'Category: packets\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         packetWriter = bootstrap define: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals mySQL packetReaderOrWriter copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL packetWriter.

CopyDowns:
globals mySQL packetReaderOrWriter. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)'
        
         outputStream.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL packetWriter parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         constantFieldContainingInteger: i ByteCount: bc = ( |
            | 
            integerFieldForValue: i ByteCount: bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForConnection: c Source: s = ( |
            | 
            [aaa]. "Rename target to source."
            (copy connection: c) target: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         integerFieldForValue: v ByteCount: bc = ( |
            | 
            integerFieldForValue: v ByteCount: bc ToStream: outputStream).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         integerFieldForValue: v ByteCount: bc ToStream: s = ( |
             bytes.
            | 
            [bc <= 4] assert.
            bytes: int32 asLittleEndianByteVectorFrom: v.
            s writeFrom: bytes Count: bc IfFail: failure.
            v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         integerFieldNamed: n ByteCount: bc = ( |
            | 
            integerFieldForValue: (valueOfFieldNamed: n) ByteCount: bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         lengthCodedBinaryFieldForValue: v = ( |
             bytes.
            | 

            "Remove trailing zeroes."
            bytes: v copyFrom: 0 UpTo: [|:exit| v reverseDo: [|:b. :i| b = 0 ifFalse: [exit value: i succ]]] exitValue.

            case
              if: [bytes size = 1] Then: [
                outputStream write: bytes IfFail: failure.
              ]
              If: [bytes size = 2] Then: [
                outputStream write: 252 asCharacter IfFail: failure.
                outputStream write: bytes           IfFail: failure.
              ]
              If: [bytes size = 3] Then: [
                outputStream write: 253 asCharacter IfFail: failure.
                outputStream write: bytes           IfFail: failure.
              ]
              If: [bytes size = 8] Then: [
                outputStream write: 254 asCharacter IfFail: failure.
                outputStream write: bytes           IfFail: failure.
              ]
              Else: [
                halt. "how does this work?"
              ].
            v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         lengthCodedBinaryFieldNamed: n = ( |
            | 
            lengthCodedBinaryFieldForValue: valueOfFieldNamed: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         lengthCodedStringFieldNamed: n = ( |
             s.
            | 
            s: valueOfFieldNamed: n.
            lengthCodedBinaryFieldForValue: int32 asLittleEndianByteVectorFrom: s size.
            outputStream writeFrom: s Count: s size IfFail: failure.
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         nullTerminatedStringFieldNamed: n = ( |
             v.
            | 
            v: valueOfFieldNamed: n.
            outputStream writeFrom: v    Count: v size IfFail: failure.
            outputStream writeFrom: '\0' Count: 1      IfFail: failure.
            v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'mySQL' -> 'packetReaderOrWriter' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( | {
         'Category: processing\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         processPacketOfType: t Number: n = ( |
             s.
            | 
            outputStream:  writeStream copyOn: byteVector copyRemoveAll.
            t processFor: self.
            s: outputStream contents.
            integerFieldForValue: s size ByteCount: 3 ToStream: connection socket.
            integerFieldForValue: n      ByteCount: 1 ToStream: connection socket.
            connection socket writeFrom: s Count: s size IfFail: failure).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         unusedFieldOfByteCount: bc = ( |
             bytes.
            | 
            bytes: string copySize: bc FillingWith: '\0'.
            outputStream writeFrom: bytes Count: bc IfFail: failure.
            bytes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'packetWriter' -> 'parent' -> () From: ( | {
         'Category: different kinds of fields\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         valueOfFieldNamed: n = ( |
            | 
            n sendTo: target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         tests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL tests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> () From: ( | {
         'Category: assertions\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: b = ( |
            | 
            b assert).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> () From: ( | {
         'Category: assertions\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: b Message: m = ( |
            | 
            b assert: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> () From: ( | {
         'Category: setting up\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         connectionSpec = ( |
            | 
            (((mySQL connectionSpec copy
                databaseName: 'self_test')
                user: 'self')
                password: 'wobulate')
                modelNamespace: models).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> () From: ( | {
         'Category: setting up\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         createConnection = ( |
             c.
             r.
            | 
            c: connectionSpec createConnection.
            r: c connect.
            assert: [r isOK] Message: r message.
            r: (c command copyForConnection: c ToInitializeDatabaseNamed: c spec databaseName) execute.
            assert: [r isOK] Message: r message.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> () From: ( | {
         'Category: setting up\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         models = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> 'models' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL tests models.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> 'models' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         arglebargle = bootstrap define: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> 'models' -> 'arglebargle' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals mySQL model copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> 'models' -> 'arglebargle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL tests models arglebargle.

CopyDowns:
globals mySQL model. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> 'models' -> 'arglebargle' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         argle.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> 'models' -> 'arglebargle' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         bargle.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> 'models' -> 'arglebargle' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         birthday.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> 'models' -> 'arglebargle' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> 'models' -> 'arglebargle' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mySQL tests models arglebargle parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> 'models' -> 'arglebargle' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'mySQL' -> 'model' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            testHandshake.
            testCreatingTable.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         testCreatingTable = ( |
             c.
             m.
             r.
            | 
            c: createConnection.

            r: c executeQuery: 'CREATE TABLE arglebargle (id integer, argle char(50), bargle char(50), birthday date)'.
            assert: [r isOK] Message: r message.

            r: c executeQuery: 'INSERT INTO arglebargle (id, argle, birthday) VALUES (0, \'apple\', \'2020-02-15\')'.
            assert: [r isOK] Message: r message.

            r: c executeQuery: 'SELECT * FROM arglebargle'.
            assert: [r fieldCount = 4].
            assert: [r rows size = 1].
            m: r rows first at: 'arglebargle'.
            assert: [m id = 0].
            assert: [m argle = 'apple'].
            assert: [m bargle isNil].
            assert: [m birthday dateStringForMySQL = '2020-2-15'].

            m bargle: 'banana'.
            [m birthday year: 2009.]. [aaa]. "Do this later. I think we're gonna need a whole new Date class."
            m save.
            r: c executeQuery: 'SELECT * FROM arglebargle'.
            assert: [r fieldCount = 4] Message: r message.
            assert: [r rows size = 1].
            m: r rows first at: 'arglebargle'.
            assert: [m id = 0].
            assert: [m argle = 'apple'].
            assert: [m bargle = 'banana'].
            [assert: [m birthday dateStringForMySQL = '2009-2-15'].]. "Later."

            c dropTableNamed: 'arglebargle' IfFail: raiseError.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         testHandshake = ( |
            | 
            createConnection.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mySQL' -> 'tests' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: private'
        
         testInitializingConnectionForDatabase = ( |
             c.
             r.
            | 
            c: createConnection.
            r: c executeQuery: 'CREATE TABLE arglebargle (argle char(50), bargle char(50), birthday date)'.
            assert: [r isOK] Message: r message.
            halt. "Are we done?"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: printing\x7fCategory: local time\x7fModuleInfo: Module: mySQL InitialContents: FollowSlot\x7fVisibility: public'
        
         dateStringForMySQL = ( |
            | 
            year printString, '-', month printString, '-', date printString).
        } | ) 



 '-- Side effects'

 globals modules mySQL postFileIn
