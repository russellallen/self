 '
SELF WORLD BUILDER
Copyright 1992-2016 AUTHORS.
See the LICENSE file for license information.

Version: 0.4.0

This is not a module and not managed by Transporter.
'
(| 
  env*.
  
  dir.      " Directory of object tree "
  initFile. " Path to init.self "
  
  setupMinimalEnvironment = (
    true  _AddSlots: (| parent* = ()  |).
    true  parent _AddSlots: (| ifTrue: a False: b = ( a value ) |).
    false  _AddSlots: (| parent* = () |).
    false parent _AddSlots: (| ifTrue: a False: b = ( b value ) |).
    '' parent _AddSlots: (| 
      , b = (| e = systemObjects | (_ByteVectorConcatenate: b Prototype: e byteVector IfFail: [|:e. :m| 'CONCAT FAIL\n' _StringPrint. _Quit ]) _StringCanonicalize ) |).
    0 parent _AddSlots: (|
      + n = (_IntAdd: n IfFail: [|:e. :m| 'INTEGER ADD ERROR\n' _StringPrint. _Quit ]). 
      countdown: blk = (blk value: self. (_Eq: 0) ifTrue: [self] False: [(+ -1) countdown: blk])
    |). 
  ).
  
  cleanupMinimalEnvironment = (| fb |
    fb: [|:e. :m| '\nREMOVE SLOT ERROR\n' _StringPrint. _Quit ].
    true      _RemoveSlot: 'parent'     IfFail: fb.
    false     _RemoveSlot: 'parent'     IfFail: fb.
    '' parent _RemoveSlot: ','          IfFail: fb.
    0 parent  _RemoveSlot: '+'          IfFail: fb.
    0 parent  _RemoveSlot: 'countdown:' IfFail: fb.
  ).
  
  inMinimalEnvironment: blk = (setupMinimalEnvironment. blk value. cleanupMinimalEnvironment).
    
  valueForCommandLineFlag: f IfAbsent: a = (| v |
    v: a.
    _CommandLine _Size countdown: [|:p| v: valueForCommandLineFlag: f AtPosition: p IfAbsent: v ].
    v
  ).
  
  valueForCommandLineFlag: f AtPosition: p IfAbsent: a = (
    '' _StringPrint. " RCA 16-02-10. Just for fun, try commenting this out and watch everything break... "
    ( (_CommandLine _At: p IfFail: [|:e. :m| a]) _Eq: f) 
        ifTrue: [ _CommandLine _At: p + 1 IfFail: [|:e. :m| a] ] 
         False: [ a ] ).
         
  selfWorkingDirFromEnvironmentIfAbsent: a = (('SELF_WORKING_DIR' _getenvenvironmentAtIfFail: [|:e. :m| ^ a ]), '/objects' ).
  
  setupPaths = (
    " Self Working Dir from Environment Variable.
      This is legacy, please use the -b flag instead.
      Note that the SELF_WORKING_DIR environment variable points to the 
      top of a tree with an objects subdirectory (for legacy compatability 
      reasons) while the -b flag points to the object subdirectory itself.
    "
    dir: selfWorkingDirFromEnvironmentIfAbsent: '.'.
  
    " Self Working Dir from -b Flag
      -b must be within the first four flags, eg
      Self -f ../mydir/worldbuilder.self -b ../mydir
    "
    dir: valueForCommandLineFlag: '-b' IfAbsent: dir.
    ('\nBuilding from base: ', dir) _StringPrint.
          
    initFile:  dir, '/core/init.self'. 
    ('\n         init file: ', initFile, '\n') _StringPrint.

   ).
   
  loadBasicWorld = (
    'About to load basic world\n' _StringPrint.
    initFile _RunScript.
    bootstrap selfObjectsWorkingDir: dir.
    bootstrap read: 'allCore' From: 'core'.
    bootstrap read: 'primitiveMaker' From: 'glue'.
    bootstrap read: 'crypto' From: 'applications'.
    bootstrap read: 'allTests' From: 'tests'.
    bootstrap read: 'programmingExamples' From: 'misc'.
  ).
  
  graphicsLoadedFlag <- false.
  
  loadGraphics = (
    graphicsLoadedFlag ifFalse: [
      graphicsLoadedFlag: true.
      bootstrap read: 'allGraphics' From: 'graphics'.
    ]
  ).

  optionalLoad: blk IfFlag: f OrQuery: q = (| i. c. flg = '-o' |
    c: _CommandLine.
    (c includes: flg)
      ifTrue: [
        (((c at: (c keyAt: flg) succ IfAbsent: '') splitOn: ',') includes: f)
          ifTrue: [ ('Reading ', q) printLine. blk value ]
           False: [ (q, ' not chosen on command line') printLine. ]]
       False: [       
        ('Load ', q, '? (y/N)\n> ') print. 
        i: stdin readLine.
        i = 'y' 
           ifTrue: blk
            False: [ ('You chose: ', i, '.') printLine ]].
  ).
  
  optionalLoadMorphic = (
    optionalLoad: [ loadGraphics.
                    bootstrap read: 'allUI2' From: 'ui2'.
                    bootstrap read: 'allOutliner' From: 'ui2/outliner']
          IfFlag: 'morphic'
         OrQuery: 'UI2 (Morphic)'
  ).
  
  optionalLoadUI1 = (
     optionalLoad: [ loadGraphics. bootstrap read: 'allUI' From: 'ui1']
           IfFlag: 'ui1'
          OrQuery: 'UI1 (X11 Only)'
  ).

  startup = (
    _Verify.
    "throw away code strings for any little dinky doIts"
    memory quickCleanup.
    transporter moduleDictionary refill.
    "start the scheduler"
    scheduler start.
    _Verify
  ).
  
  optionalRunSecondarySetupScript = (| flg = '-f2'. c |
    c: _CommandLine.
    (c includes: flg)
      ifTrue: [| f2 |
        f2: (c at: (c keyAt: flg) succ IfAbsent: [^ 'Could not find argument to flag -f2' printLine]).
        f2 runScript ]
  ).

  boot: lobby = (
    env: lobby.
    inMinimalEnvironment: [setupPaths].
    loadBasicWorld.
    optionalLoadMorphic.
    optionalLoadUI1.
    optionalRunSecondarySetupScript.
    startup.
  )
  
|) boot: self.