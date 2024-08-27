 '0.0.2'
 '
Copyright 2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: about InitialContents: FollowSlot\x7fVisibility: public'
        
         about = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'about' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals about.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> () From: ( | {
         'Category: info\x7fModuleInfo: Module: about InitialContents: FollowSlot'
        
         about = 'Self is a community driven, open source project and includes this VM
objects, documentation and materials.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> () From: ( | {
         'Category: info\x7fModuleInfo: Module: about InitialContents: FollowSlot'
        
         authors = '(In alphabetical order by surname)
Russell Allen
Jan-Paul Bultmann
Chris Double
Tobias Pape
Randall B. Smith
Adam Spitz
Stanford University
Sun Microsystems, Inc.  
Valery Ushakov
David Ungar'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> () From: ( | {
         'Category: info\x7fModuleInfo: Module: about InitialContents: FollowSlot'
        
         licence = '
WORK:
The WORK comprises the software, documentation and related materials.

LICENSE:
You may use the WORK internally, modify it, make copies and distribute the WORK to third parties, provided each copy of the WORK you make contains both the copyright notice set forth above and the disclaimer below.

DISCLAIMER:
The AUTHORS make no representations about the suitability of the WORK for any purpose. It is provided to you \"AS IS\", without express or implied warranties of any kind. The AUTHORS disclaim all implied warranties of merchantability, fitness for a particular purpose and non-infringement of third party rights. The AUTHORS\' liability for claims relating to the WORK shall be limited to the amount, if any of the fees paid by you for the WORK.  In no event will the AUTHORS be liable for any special, indirect, incidental, consequential or punitive damages in connection with or arising out of this license (including loss of profits, use, data, or other economic advantage), however it arises, whether for breach of warranty or in tort, even if the AUTHORS have been advised of the possibility of such damage.

INCLUDED WORK:
The WORK is based on the Self 4.3 release, Copyright 1993-2006 Sun Microsystems, Inc. and Stanford University. See the 43LICENCE'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> () From: ( | {
         'Category: info\x7fModuleInfo: Module: about InitialContents: FollowSlot'
        
         licence43 = 'Copyright  1993-2006 Sun Microsystems, Inc. and Stanford University.

All Rights Reserved. RESTRICTED RIGHTS LEGEND: Use, duplication, or
disclosure by the government is subject to restrictions as set forth in
subparagraph (c) (1) (ii) of the Rights in Technical Data and Computer
Software Clause at DFARS 252.227-7013 (Oct. 1988) and FAR 52.227-19(c)
(June 1987).

Sun Microsystems, Inc.  2600 Casey Avenue, Mountain View, CA 94043 USA

LICENSE:
You may use the software internally, modify it, make copies and distribute 
the software to third parties, provided each copy of the software you make 
contains both the copyright notice set forth above and the disclaimer below.

DISCLAIMER:
Sun Microsystems, Inc. makes no representations about the suitability
of this software for any purpose. It is provided to you \"AS IS\",
without express or implied warranties of any kind. Sun Microsystems,
Inc. disclaims all implied warranties of merchantability, fitness for a
particular purpose and non-infringement of third party rights. Sun
Microsystems, Inc.\'s liability for claims relating to the software
shall be limited to the amount, if any of the fees paid by you for the
software.  In no event will Sun Microsystems, Inc. be liable for any
special, indirect, incidental, consequential or punitive damages in
connection with or arising out of this license (including loss of
profits, use, data, or other economic advantage), however it arises,
whether for breach of warranty or in tort, even if Sun Microsystems,
Inc. has been advised of the possibility of such damage.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> () From: ( | {
         'Category: (private)\x7fModuleInfo: Module: about InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'about' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals about parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> () From: ( | {
         'Category: (private)\x7fModuleInfo: Module: about InitialContents: FollowSlot'
        
         systemVersion = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals about systemVersion.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: InitializeToExpression: (false)'
        
         development <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals about systemVersion parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( | {
         'Category: ordering\x7fModuleInfo: Module: about InitialContents: FollowSlot\x7fVisibility: public'
        
         < v = ( |
            | 
            release < v release).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: about InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | 
            release = x release).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOn: s = ( |
             e.
             n.
            | 
            n: copy.
            e: s asTokensSeparatedByCharactersIn: ' /.()'.
            e first = 'Development' 
             ifTrue: [
                n development: true.
                n year: (e at: 3) asInteger.
                n point: (e at: 4) asInteger.
                n release: (e at: 1) asInteger]
              False: [
                n development: false.
                n year: (e at: 0) asInteger.
                n point: (e at: 1) asInteger.
                n release: (e at: 2) asInteger].
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: about InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            release hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot\x7fVisibility: public'
        
         isImmutableForFilingOut = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( | {
         'Category: ordering\x7fModuleInfo: Module: about InitialContents: FollowSlot'
        
         ordered* = bootstrap stub -> 'mixins' -> 'ordered' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | 
            (development ifTrue: ['Development/', release asString, ' (after '] False: ''),
            year asString, '.', point asString,
            (development ifTrue: ')' False: ['/', release asString])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot'
        
         prototype = ( |
            | about systemVersion).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( | {
         'Comment: reads a version from a file
relative to the Self working dir\x7fModuleInfo: Module: about InitialContents: FollowSlot'
        
         readFrom: fn = ( |
             f.
            | 
            [
            f: os_file openForReading: bootstrap selfObjectsWorkingDir, '/', fn.
            copyOn: f readLine.
            ] onReturn: [f close]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            'about systemVersion copyOn: \'',
             printString, '\'').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | 
            about systemVersion).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot'
        
         test = ( |
            | 
            [((copyOn: 'Development/0 (after 2000.0)') printString = 'Development/0 (after 2000.0)') &&
            ((copyOn: '2016.1/34') printString = '2016.1/34')] assert. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: InitializeToExpression: (0)'
        
         point <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot'
        
         release <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'systemVersion' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot'
        
         year <- 2000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> () From: ( | {
         'Category: info\x7fModuleInfo: Module: about InitialContents: FollowSlot'
        
         thanks = 'Self is a continuation of the Self system as developed at Xerox Parc, Stanford University and Sun Microsystems.

The first version of the Self language was designed in 1986 by David Ungar and Randall B. Smith at Xerox PARC. 

A series of Self implementations and a graphical programming environment were built at Stanford University by Craig Chambers, Urs Hozle,  Ole Agesen, Elgin Lee, Bay-Wei Chang, and David Ungar. 

The project continued at Sun Microsystems Laboratories, where it benefited  from the efforts of Randall B. Smith, Mario Wolczko, John Maloney, and  Lars Bak under the joint leadership of Smith and Ungar. 

Since then, it has continued as an open source project.

The Self Group would like to thank Elgin Lee, James Noble, Christine Ahrens, Jeff Dean, Erik Ernst, Ivan Moore, and Michael Abd-El-Malek for their contributions.

Finally, thanks go to Sun Microsystems Laboratories, Stanford University, and all other organizations that supported Self (in alphabetical order): Aarhus University, Apple, Cray, the Danish Research Academy, DEC, IBM, the National Science Foundation, NCR, the Swiss Nationalfonds, Tandem, Texas Instruments, and Xerox.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> () From: ( | {
         'Category: versions\x7fModuleInfo: Module: about InitialContents: FollowSlot'
        
         vm = ( |
             v.
            | 
            v: _VMversion.
            systemVersion copyOn: 
            (v at: 0) printString, '.',
            (v at: 1) printString, '/',
            (v at: 2) printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot'
        
         about = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'about' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'copyright' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'about' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules about.

CopyDowns:
globals modules init. copy 
SlotsToOmit: copyright directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'about' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: about InitialContents: InitializeToExpression: (\'
Copyright 2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
\')\x7fVisibility: public'
        
         copyright <- '
Copyright 2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'about' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'about' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'about' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'about' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'about' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: InitializeToExpression: (\'0.0.2\')\x7fVisibility: public'
        
         revision <- '0.0.2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'about' -> () From: ( | {
         'ModuleInfo: Module: about InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'coreVersion
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'coreVersion' From: 'core'



 '-- Side effects'

 globals modules about postFileIn
