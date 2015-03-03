 '
SELF WORLD BUILDER
Copyright 1992-2014 AUTHORS.
See the LICENSE file for license information.

Version: 0.2.0

This is not a module and not managed by Transporter.
'
[| var = 'SELF_WORKING_DIR'. dir. i. graphicsLoadedFlag <- false |
  dir:  var _getenvenvironmentAtIfFail: [|:e. :n| nil].
  dir:  dir _ByteVectorConcatenate: '/objects'        Prototype: byteVector IfFail: [|:e. :n| '.'].
  dir:  dir _ByteVectorConcatenate: '/core/init.self' Prototype: byteVector.
  dir _RunScript

  bootstrap read: 'allCore' From: 'core'.
  bootstrap read: 'primitiveMaker' From: 'glue'.
  bootstrap read: 'crypto' From: 'applications'.
  bootstrap read: 'allTests' From: 'tests'.
  bootstrap read: 'programmingExamples' From: 'misc'.

  "Load optional components after asking user" 

  'Load UI2 (Morphic)? (y/N)\n> ' print.
  i: stdin readLine.
  i = 'y' 
     ifTrue: [ bootstrap read: 'allGraphics' From: 'graphics'.
               graphicsLoadedFlag: true.
               bootstrap read: 'allUI2' From: 'ui2'.
               bootstrap read: 'allOutliner' From: 'ui2/outliner']
      False: [ ('You chose: ', i, '.') printLine ].

  'Load UI1 (X11 only)? (y/N)\n> ' print.
  i: stdin readLine.
  i = 'y' 
      ifTrue: [  graphicsLoadedFlag ifFalse: [
                     bootstrap read: 'allGraphics' From: 'graphics'.
                     graphicsLoadedFlag: true].
                 bootstrap read: 'allUI' From: 'ui1']
      False: [ ('You chose: ', i, '.') printLine ].

  _Verify.
  "throw away code strings for the little dinky doIts"
  memory quickCleanup.
  transporter moduleDictionary refill.
  "start the scheduler"
  scheduler start.
  _Verify

] value
