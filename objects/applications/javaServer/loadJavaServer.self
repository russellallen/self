"$Revision: 30.1 $"
"Reads in the javaInterface module.  Not strictly necessary to use this
 if you know what you are doing, but recommended -- Andy"

desktop stop.
'destop stopped.  Reading in javaInterface' printLine.
bootstrap read: 'javaInterface' From: 'applications/javaServer'.

'interface read in.  Creating oidToObjectMap (may take a while)' printLine.
javaDaemon oidToObjectMap: javaDaemon fillOidMapAll.

'oidToObjectMap created.  Starting desktop (might crash, desktop go again)' printLine.
'To start server:' printLine.
'   1] \"get\" a new daemon by executing' printLine.
'        javaDaemon copy' printLine.
'   2] Add your javaDaemon morph to the world' printLine.
'   3] Set the port (e.g.: port: 1430) -- the default is 1420.' printLine.
'      This must match what clients select through their java viewers.' printLine.
'   4] Send this javaDaemon morph the message' printLine.
'        start.' printLine.
   

desktop go.
