 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         snapshotOptionsMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotOptionsMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotOptionsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules snapshotOptionsMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotOptionsMorph' -> () From: ( | {
         'ModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotOptionsMorph' -> () From: ( | {
         'ModuleInfo: Module: snapshotOptionsMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotOptionsMorph' -> () From: ( | {
         'ModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotOptionsMorph' -> () From: ( | {
         'ModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            snapshotOptionsMorph initializePrototype.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotOptionsMorph' -> () From: ( | {
         'ModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotOptionsMorph' -> () From: ( | {
         'ModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         snapshotOptionsMorph = bootstrap define: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals snapshotOptionsMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph state\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: InitializeToExpression: (nil)'
        
         acceptButton <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph state\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: InitializeToExpression: (recursiveSemaphore copyBinary)'
        
         acceptSema <- recursiveSemaphore copyBinary.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fCategory: construction\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         buildActionButtons = ( |
             lbl.
             r.
            | 
            r: newItemRow.
            lbl: newLabel.
            lbl fontSpec: globals fontSpec copyName: 'helvetica' Style: 'bold'.
            acceptButton:
              ( ( ui2Button copy addMorph: lbl copy label: 'Accept' )
                  scriptBlock: [target setOptionsFromMorphs. 
                          target safelyDo: [target acceptSema signal.  target delete].] )
                 target: self.
            r addMorphLast: acceptButton.
            r addMorphLast:
              ((( ui2Button copy addMorph: lbl copy label: 'Set expert options' )
                  scriptBlock: [target snapshotOptions spaceSizes askUserForObjectHeapSizes] )
                 isAsynchronous: true )
                 target: self.
            r addMorphLast:
              ( ( ui2Button copy addMorph: lbl copy label: 'Reset' )
                  scriptBlock: [target setMorphsFromOptions.] )
                 target: self.
            r morphsDo: [|:m| m beFlexible].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fCategory: construction\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         buildOptionsDefaultsRow = ( |
             r.
            | 
            r: columnMorph copy borderWidth: newItemRow borderWidth.
            r addMorphLast:
              ( ( ui2Button copy addMorph: newLabel label: 'Set for local disk & short sessions' )
                  scriptBlock: [target compressCheckBox unpress.
                                target saveCodeCheckBox   press.
                                target codeSizeEditor value: 10.] )
                 target: self .
            r addMorphLast:
              ( ( ui2Button copy addMorph: newLabel label: 'Set for local disk & long sessions' )
                  scriptBlock: [target compressCheckBox unpress.
                                target saveCodeCheckBox unpress.
                                target codeSizeEditor value: 10.] )
                 target: self .
            r addMorphLast:
              ( ( ui2Button copy addMorph: newLabel label: 'Set for remote disk & fast CPU' )
                  scriptBlock: [target compressCheckBox press.
                                target saveCodeCheckBox unpress.
                                target codeSizeEditor value: 10.] )
                 target: self .
            r addMorphLast:
              ( ( ui2Button copy addMorph: newLabel label: 'Use less memory' )
                  scriptBlock: [target codeSizeEditor value: 4.] )
                 target: self .
            r addMorphLast:
              ( ( ui2Button copy addMorph: newLabel label: 'Run faster' )
                  scriptBlock: [target codeSizeEditor value: 15.] )
                 target: self .
            r morphsDo: [|:m| m leftJustify beFlexible].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fCategory: construction\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         buildRowLabelled: lbl Widget: widget Explanation: ex = ( |
             r.
             xb.
            | 
            r: newItemRow.
            r addMorphLast: newLabel label: lbl, ' '.
            r addMorphLast: spacerMorph copy beFlexible.
            r addMorphLast: widget.
            xb: ((( ui2Button copy addMorph: newLabel label: 'Explain' )
                  buttonArgs: vector copyAddLast: ex )
                  target: self )
                  scriptBlock: [
                       button morphs first morphTypeName = 'labelMorph'
                             ifFalse: [ button removeAllMorphs addMorph: target newLabel label: 'Explain' ]
                                True: [ button removeAllMorphs addMorph: target newEditor appendString: buttonArgs first ]].
            r addMorphLast: newLabel label: ' '.
            r addMorphLast: xb.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph state\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: InitializeToExpression: (nil)'
        
         codeSizeEditor <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fCategory: setting and getting options\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         codeSizeScaleFactor = ( |
            | 1024 * 1024).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph state\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: InitializeToExpression: (nil)'
        
         compressCheckBox <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         copy = ( |
            | resend.copy acceptSema: acceptSema copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            resend.delete.
            acceptSema waiters do: [|:w| w abort: 'Cancelled'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph state\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: InitializeToExpression: (nil)'
        
         fileNameEditor <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fCategory: construction\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         initializePrototype = ( |
             fm.
            | 

              saveCodeCheckBox: checkBoxMorph copy.
              compressCheckBox: checkBoxMorph copy.

              fm: frameMorph copy beShrinkWrap borderWidth: 3.

              fm addAllMorphs: (
                ((newLabel label: 'Snapshot Options:' ) 
                        fontSpec: (globals fontSpec copyName: 'helvetica' 
                                                        Size: newLabel fontSpec size + 2
                                                        Style: 'bold' ) )

              & ( spacerMorph copyV: 10 Color: color )

              & ( buildRowLabelled: 'File:' 
                    Widget: (newEditorIn: [|:x| fileNameEditor: x] )
                    Explanation: 'The name of the snapshot file.' )

              & ( buildRowLabelled: 'Save object code:'
                    Widget: saveCodeCheckBox
                    Explanation: 
            'Include object code in the snapshot.\n',
            'Enabling this saves machine code in the\n',
            'snapshot.  This increases the size of the\n',
            'snapshot, and makes saving it somewhat\n',
            'slower, but when started the snapshot will\n',
            'run as fast as it did when saved.\n',
            'Object code is not portable across different\n',
            'operating systems, nor is it relocatable,\n',
            'hence it will be discarded if the snapshot\n',
            'is started under a different OS, and will\n',
            'not be saved if relocation is required.'
             )

              & ( buildRowLabelled: 'Compression:'
                            Widget: compressCheckBox
                       Explanation: 'Compress the snapshot while saving.\nShrinks snapshot file, slows reading & writing.' )

              & ( buildRowLabelled: 'Code size (MB):'
                            Widget: (newSliderWidgetIn: [|:x|  codeSizeEditor: x] Min: 4 Max: 30)
                       Explanation: 'Sets the initial size of the code cache used when the snapshot is started.\n',
                                    'Total real memory footprint cost is approx. double this number.\n',
                                    'Changing this means saved code will be ignored, as it cannot be relocated.\n',
                                    'If this number is too small, there will be many annoying compilation pauses.\n',
                                    'If too big, it may cause thrashing.\n',
                                    '4 is the minimum (suitable for a 32-48 Mb machine),\n',
                                    '10 is good for a 48-64 Mb machine,\n',
                                    '20 gives great performance, but you need a machine with 64 Mb.' )

              & buildOptionsDefaultsRow
              & buildActionButtons

            ) asVector.

            safelyDo: [
              color: paint named: 'lightGray'.
              removeAllMorphs.
              beShrinkWrap.
              addMorph: fm.
              colorAll: color.
            ].
            snapshotOptions: memory snapshotOptions copy.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: w Event: evt = ( |
            | 
            allMorphs do: [|:m|
              m morphTypeName = 'updatingLabelMorph'
               ifTrue: [m startGettingStepped].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            "Because these need not be visible we must force the copy if necessary"
            fileNameEditor:   dict at: fileNameEditor.
            codeSizeEditor:   dict at: codeSizeEditor.
            compressCheckBox: dict at: compressCheckBox.
            saveCodeCheckBox: dict at: saveCodeCheckBox.
            acceptButton:     dict at: acceptButton.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         morphTypeName = 'snapshotOptionsMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fCategory: construction\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         newEditor = ( |
             e.
            | 
            e: editorMorph copy.
            e typer fontSpec: globals fontSpec copyName: 'helvetica' Size: 12.
            e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fCategory: construction\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         newEditorIn: storeBlock = ( |
             e.
             fm.
            | 
            fm: ( frameMorph copy beFlexible borderWidth: 2 )
                  frameStyle: frameMorph insetBezelStyle.
            e: newEditor.
            storeBlock value: e.
            fm addMorph: e.
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fCategory: construction\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         newItemRow = ( |
            | 
            ( rowMorph copy beShrinkWrapVertically beFlexibleHorizontally ) borderWidth: 3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fCategory: construction\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         newLabel = ( |
             lbl.
            | 
            lbl: labelMorph copy fontSpec: globals fontSpec copyName: 'helvetica' Size: 12.
            lbl).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fCategory: construction\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         newSliderWidgetIn: storeBlock Min: min Max: max = ( |
             fm.
             slider.
             ulm.
            | 
            fm: ( frameMorph copy beFlexible borderWidth: 2 )
                  frameStyle: frameMorph insetBezelStyle.
            slider: sliderMorph copy.
            storeBlock value: slider.
            slider resizeRect: (0 @ 0) ## (8 @ 60).
            slider minValue: min.
            slider maxValue: max.
            slider beRigidVertically.
            fm addMorph: slider.
            ulm: updatingLabelMorph copyTarget: slider Expression: '( ( value * 10 ) round /= 10 ) printString'.
            ulm fontSpec: newLabel fontSpec.
            ulm step.
            fm addMorphLast: ulm.
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'ModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         prototype = ( |
            | snapshotOptionsMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph state\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: InitializeToExpression: (nil)'
        
         rawSnapshotOptions <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph state\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: InitializeToExpression: (nil)'
        
         saveCodeCheckBox <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fCategory: setting and getting options\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         setMorphsFromOptions = ( |
            | 
            safelyDo: [
              codeSizeEditor value: snapshotOptions spaceSizes code_size /= codeSizeScaleFactor.
              saveCodeCheckBox press: snapshotOptions saveObjectCode.
              compressCheckBox press: snapshotOptions useCompression.
              fileNameEditor clear appendString: snapshotOptions fileName.
              step. "for code size updating label"
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fCategory: setting and getting options\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot'
        
         setOptionsFromMorphs = ( |
            | 
            snapshotOptions spaceSizes scaleCodeSizesFor: codeSizeEditor value * codeSizeScaleFactor.
            snapshotOptions fileName: fileNameEditor contentsString.
            snapshotOptions saveObjectCode: saveCodeCheckBox isDown.
            snapshotOptions useCompression: compressCheckBox isDown.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         snapshotOptions = ( |
            | rawSnapshotOptions).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotOptionsMorph' -> () From: ( | {
         'Category: snapshotOptionsMorph behavior\x7fModuleInfo: Module: snapshotOptionsMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         snapshotOptions: so = ( |
            | 
            rawSnapshotOptions: so.
            setMorphsFromOptions).
        } | ) 



 '-- Side effects'

 globals modules snapshotOptionsMorph postFileIn
