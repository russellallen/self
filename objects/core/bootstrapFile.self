 'Sun-$Revision: 30.11 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         bootstrapFile = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapFile' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapFile' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules bootstrapFile.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapFile' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapFile' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapFile' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         myComment <- 'file used to write out bootstrappable self'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapFile' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapFile' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         bootstrapFile = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> () From: ( |
             {} = 'Comment: I am a file-like object with behavior for writing out bootstrap source files\x7fModuleInfo: Creator: globals transporter bootstrapFile.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: bootstrapFile InitialContents: InitializeToExpression: (nil)'
        
         file.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         indentation <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         module <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter bootstrapFile parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         block: block = ( |
            | 
            bracket: block Left: '[' Right: ']' Indent: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: private'
        
         bracket: block Left: left Right: right Indent: indentMore = ( |
            | 
            "execute block so it comes out in brackets, 
              indented by indentMore"

            token: left.
            indentMore ifTrue: [indent].
            block value.
            indentMore ifTrue: [outdent].
            write: right.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            file close.

            "make the original the backup"
            (file exists: module fileName) ifTrue: [
              os rename: module fileName To: module oldFileName.
            ].

            "Make the tmp file the output file"
            os rename: module tmpFileName To: module fileName.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         cr = ( |
            | "write cr and indent"
            write: '\n'.
            indentation do: [write: ' ']. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         inBars: block = ( |
            | 
            bracket: block Left: '|' Right: '| ' Indent: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         inCurlies: block = ( |
            | 
            bracket: block Left: '{' Right: '} ' Indent: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         inParenthesesAndBars: block = ( |
            | 
            bracket: block Left: '( |' Right: '| ) ' Indent: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: indenting\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         indent = ( |
            | indentation: indentation + tabWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: indenting\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            indentation: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         openForModule: mod Flags: unixFlags = ( |
             oldName <- ''.
             r.
            | 
            r: copy module: mod.
            "Remove the old backup file"            
            (os_file exists: r module oldFileName) ifTrue: [
               os unlink: r module oldFileName.
            ].
            (os_file exists: r module absolutePath) ifFalse: [
               os command: 'mkdir -p "', r module absolutePath, '"' IfFail: [].
            ].
            r file: os_file open: r module tmpFileName Flags: unixFlags).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         openForWritingModule: mod = ( |
            | 
            openForModule: mod Flags: os_file flags writeCreateTruncate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: indenting\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         outdent = ( |
            | indentation: indentation - tabWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: public'
        
         parenthesize: block = ( |
            | 
            bracket: block Left: '(' Right: ')' Indent: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: indenting\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         tabWidth = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         token: s = ( |
            | "write a token"
            write: ' '.
            write: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: writing different source entities\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         write: s = ( |
            | 
            file write: s.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: writing different source entities not used yet\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         writeBytes: bv = ( |
            | 
            file write: '\''.
            bv do: [|:b|
                file write: '\\d'.
                writeInteger: b asByte.
            ].
            file write: '\' '.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: writing different source entities\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         writeFloat: f = ( |
            | writeStoreString: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: writing different source entities\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         writeInteger: i = ( |
            | writeStoreString: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: writing out predefined chunks\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot\x7fVisibility: private'
        
         writeMethodsToRunInit = ( |
            | 
            "This is a kludge, but we must have init first!"
              write: 
               '[| var = \'SELF_WORKING_DIR\'. dir |\n',
               '  dir:  var _getenvenvironmentAtIfFail: [|:e. :n| nil].\n',
               '  dir:  dir _ByteVectorConcatenate: \'/objects\'        Prototype: byteVector IfFail: [|:e. :n| \'.\'].\n',
               '  dir:  dir _ByteVectorConcatenate: \'/core/init.self\' Prototype: byteVector.\n',
               '  dir _RunScript\n',
               '] value'.
              cr.
              cr.
              self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: writing different source entities\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         writeSource: s = ( |
             lines.
             sizeSansWhite <- 0.
             source.
            | 
                 "write source of a method, must worry about indentation"
            lines: selfMethodText copyLines: s.
            source: (lines indentation: indentation) asCode asString.

            "trim trailing period, tab, newlines, spaces"

            sizeSansWhite: source size.
            [   ( sizeSansWhite > 0)
             && [ '. \t\n' includes: source at: sizeSansWhite pred]]
                whileTrue: [sizeSansWhite: sizeSansWhite pred].
            source: source copySize: sizeSansWhite.

            write: source.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: writing different source entities\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         writeStoreString: b = ( |
            | 
            token: b storeString.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: writing different source entities\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         writeString: s = ( |
            | writeStoreString: s canonicalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'bootstrapFile' -> 'parent' -> () From: ( | {
         'Category: writing different source entities\x7fModuleInfo: Module: bootstrapFile InitialContents: FollowSlot'
        
         writeTitle: str = ( |
            | cr. cr. writeString: ('-- ', str). cr. cr).
        } | ) 



 '-- Side effects'

 globals modules bootstrapFile postFileIn
