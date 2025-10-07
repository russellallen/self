 '$Revision: 30.11 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         primitiveMaker = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'primitiveMaker' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'primitiveMaker' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules primitiveMaker.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'glue'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         myComment <- 'CAUTION: This file is not part of the documented Self world.  It may be
             be changed or removed at any time, and it will not be documented.  Don\'t
             try to learn good Self style from this file.

             This file can be removed from all.self without affecting the Self world,
             except for tests.wrappers.self which uses it for testing purposes.\"

            \"
                This program is an attempt to make it easier to add primitives to Self.
                It reads primitive templates and creates the self glue code, the
                primitive table entries, and the C++ headers, glue functions, and glue
                macros.

                To read primitive templates construct a file whose name ends with
                ``.self\'\'.
                The file should have the following format:

                    primitiveMaker  reader copy [staticLinking|dynamicLinking] 
                      create: \'fileNamePrefix\' From: \'

                    template1
                    template2
                    template3a \\
                    template3b
                    ...
                    templateN
                    \'

                Then use the _RunScript primitive from the shell to execute your file.
                This program will write out two files:
                    fileNamePrefix.{wrappers.self,primMaker.h}.

                Blank lines are ignored.
                Any line starting with ``//\'\' is ignored.
                Any line starting with ``--\'\' is inserted as a comment in the output files.

                A token is a sequence of nonwhite characters, or anything inside of
                  curly brackets ({}).

                Four special templates specify supplemental information:
                     traits: <self-path>

                          specifies the self traits object that will be the target of
                          the _AddSlots for the wrappers.

                     macroName: <macro-name>

                          specifies the base name of the macro that will be defined to
                          hold all the lines of glue or primitive entries
                          (macro-name_glue or macro-name_entries)

                     glueLibraryName: <glue-library-name>

                          (This template applies only to dynamic linking.)
                          specifies the file name of the glue library.

		     visibility: privateSlot|publicSlot

		          Must come after \"traits\" etc. Specifies visibility
			  of following slots.

                The syntax of the other templates is:
                [_|^] <wrapper-spec> = <resultType> <type-of-prim> <c-name> <primTableInfo>

                <wrapper-spec> gives the name of the Self-wrapper, and the argument
                    type conversion specs. It is a sequence of keywords, interspersed with 
                    type conversion specs. The first spec may be void to force the
                    wrapper to discard the receiver.

                Type conversion specs:
                  This package knows about the following type conversions:
		  (refer to vm/prims/glueDefs.h, line 1387 or so)

                       oop            any_oop           smi
                       void           any
                       bool

                       float          double            long_double

                       char           signed_char       unsigned_char
                       short          signed_short      unsigned_short
                       int            signed_int        unsigned_int      int_or_errno
                       long           signed_long       unsigned_long

                       string         string_len        string_null       string_len_null

                    *  bv             bv_len            bv_null           bv_len_null
                    *  cbv            cbv_len           cbv_null          cbv_len_null

                    +  proxy          proxy_null        proxy_or_errno
                    +  fct_proxy      fct_proxy_null

                    +  aClassName

                 * byteVectors require a pointer type, e.g., <bv_len char*>

                 + Using <aClassName> specifies a pointer to the class or structure.
                   So does <proxy aClassName* sealName>.
                   Using <proxy aClassName sealName> specifies the class or structure.
		   Proxy specs require a c-type name and a seal name.
		   But you can use the class name directly and omit the seal name.
		   See the test method in this file.

                <resultType> is the type conversion for the primitive result.

                <type-of-prim> = get[Member] | set[Member] | call[Member] | new | delete.

                <cname> is the name of the C function or varaible. Omitted for new, delete.

                <primTableInfo> = [canAWS] [cannotFail] [passFailHandle]
                  The next token may be cannotFail, if the C primitive cannotFail.
                  Or it may be canAWS, if the C primitive can abort, walk the stack or
                    scavenge.
                  Or it may be passFailHandle to pass a failure handle as the last
                    argument.


                To test this out, type ``primitiveMaker reader copy staticLinking test\'\'.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         primitiveMaker = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> () From: ( |
             {} = 'Comment: 
               This program is an attempt to make it easier to add primitives to Self.
                It reads primitive templates and creates the self glue code, the
                primitive table entries, and the C++ headers, glue functions, and glue
                macros.

                To read primitive templates construct a file whose name ends with
                ``.self\'\'.
                The file should have the following format:

                    primitiveMaker  reader copy [staticLinking|dynamicLinking] 
                      create: \'fileNamePrefix\' From: \'

                    template1
                    template2
                    template3a \\
                    template3b
                    ...
                    templateN
                    \'

                Then use the _RunScript primitive from the shell to execute your file.
                This program will write out two files:
                    fileNamePrefix.{wrappers.self,primMaker.h}.

                Blank lines are ignored.
                Any line starting with ``//\'\' is ignored.
                Any line starting with ``--\'\' is inserted as a comment in the output files.

                A token is a sequence of nonwhite characters, or anything inside of
                  curly brackets ({}). It is OK for a token to have embedded punctuation;
                  it will be changed to _ for glue names. For example \"...getMember box.top\"
                  can be used to get the top component of the box component of the proxy.

                Four special templates specify supplemental information:
                     traits: <self-path>

                          specifies the self traits object that will be the target of
                          the _AddSlots for the wrappers.

                     macroName: <macro-name>

                          specifies the base name of the macro that will be defined to
                          hold all the lines of glue or primitive entries
                          (macro-name_glue or macro-name_entries)

                     glueLibraryName: <glue-library-name>

                          (This template applies only to dynamic linking.)
                          specifies the file name of the glue library.

		     visibility: privateSlot|publicSlot

		          Must come after \"traits\" etc. Specifies visibility
			  of following slots.

                The syntax of the other templates is:
                [_|^] <wrapper-spec> = <resultType> <type-of-prim> <c-name> <primTableInfo>

                <wrapper-spec> gives the name of the Self-wrapper, and the argument
                    type conversion specs. It is a sequence of keywords, interspersed with 
                    type conversion specs. The first spec may be void to force the
                    wrapper to discard the receiver.

                Type conversion specs:
                  This package knows about the following type conversions:
		  (refer to vm/prims/glueDefs.h, line 1387 or so)

                       oop            any_oop           smi
                       void           any
                       bool

                       float          double            long_double

                       char           signed_char       unsigned_char
                       short          signed_short      unsigned_short
                       int            signed_int        unsigned_int      int_or_errno
                       long           signed_long       unsigned_long

                    -  string         string_len        string_null       string_len_null

                    -* bv             bv_len            bv_null           bv_len_null
                    -* cbv            cbv_len           cbv_null          cbv_len_null

                    +  proxy          proxy_null        proxy_or_errno
                    +  fct_proxy      fct_proxy_null

                    +  aClassName

                       specific_success_int  specific_failure_int
                       must_be_zero          must_be_nonzero

                 - String conversions copy, bv and cbv do not. bv does not allow canonical
                   strings to be passed. Warning: only use cbv conversion if the function
                   being called does not modify the argument.

                 
                 * byteVectors require a pointer type, e.g., <bv_len char*>. (String conversions assume char*.)

                 + Using <aClassName> specifies a pointer to the class or structure.
                   So does <proxy aClassName* sealName>.
                   Using <proxy aClassName sealName> specifies the class or structure.
		   Proxy specs require a c-type name and a seal name.
		   But you can use the class name directly and omit the seal name.
		   See the test method in this file.

                specific_sucess_int and specific_failure_int are only return types and
                by the int in question. The int result of the C func is returned from the wrapper.

                must_be_zero and must_be_nonzero fail the prim if need be, returning self on success.
               a following token 

                <resultType> is the type conversion for the primitive result.

                <type-of-prim> = get[Member] | set[Member] | call[Member] | new | delete.

                <cname> is the name of the C function or varaible. Omitted for new, delete.

                <primTableInfo> = [canAWS] [cannotFail] [passFailHandle]
                  The next token may be cannotFail, if the C primitive cannotFail.
                  Or it may be canAWS, if the C primitive can abort, walk the stack or
                    scavenge.
                  Or it may be passFailHandle to pass a failure handle as the last
                    argument.


                To test this out, type ``primitiveMaker reader copy staticLinking test\'\'.
                         \"\x7fModuleInfo: Creator: globals primitiveMaker.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cvts = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: miscellaneous\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         any = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'any' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts any.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         aux = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'aux' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker cvts aux.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'any' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'aux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'any' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cToSelfResultType = 'integer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'any' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         cType <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'any' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueifiedAux = ( |
            | cType).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'any' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'any'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'any' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         setFrom: tokList = ( |
            | 
            tokList isEmpty ifTrue: [^error: 'any needs C type'].
            cType: tokList removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'any' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         typeChar = ' i'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: miscellaneous\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         any_oop = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'any_oop' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts any_oop.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'any_oop' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         argCanFail = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         noAux = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'noAux' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker cvts noAux.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'any_oop' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'noAux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'any_oop' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'any_oop'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: proxies\x7fCategory: structure proxies\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         autoProxy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'autoProxy' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts autoProxy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         proxies = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker cvts proxies.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'autoProxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'autoProxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         className.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'autoProxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'proxy'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'autoProxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         parseArgFrom: tokList = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'autoProxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         parseResFrom: tokList = ( |
            | setResultProxyFrom: tokList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'autoProxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType = ( |
            | className, '*').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'autoProxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         resultProxy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'autoProxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         typeSeal = ( |
            | className, '_seal').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: miscellaneous\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         bool = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bool' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts bool.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bool' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'noAux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bool' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cToSelfResultType = 'boolean'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bool' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'bool'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bool' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptBaseType = 'Boolean'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bool' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         resCanFail = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: byte vectors\x7fCategory: mutable byte vectors\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         bv = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts bv.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         byteVectors = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker cvts byteVectors.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'bv'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: byte vectors\x7fCategory: mutable byte vectors\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         bv_len = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv_len' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts bv_len.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv_len' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv_len' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'bv_len'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv_len' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: byte vectors\x7fCategory: mutable byte vectors\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         bv_len_null = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv_len_null' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts bv_len_null.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv_len_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv_len_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'bv_len_null'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv_len_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: byte vectors\x7fCategory: mutable byte vectors\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         bv_null = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv_null' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts bv_null.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'bv_null'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'bv_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: byte vectors\x7fCategory: constant byte vectors\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         cbv = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts cbv.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'cbv'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: byte vectors\x7fCategory: constant byte vectors\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         cbv_len = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv_len' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts cbv_len.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv_len' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv_len' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'cbv_len'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv_len' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: byte vectors\x7fCategory: constant byte vectors\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         cbv_len_null = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv_len_null' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts cbv_len_null.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv_len_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv_len_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'cbv_len_null'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv_len_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: byte vectors\x7fCategory: constant byte vectors\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         cbv_null = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv_null' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts cbv_null.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'cbv_null'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'cbv_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: implicitly signed or unsigned\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         char = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'char' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts char.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'char' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'char'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'char' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         resCanFail = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         ints = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker cvts ints.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'char' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: floats\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         double = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'double' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts double.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         floats = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'floats' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker cvts floats.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'double' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'floats' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'double' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'double'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: proxies\x7fCategory: function proxies\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         fct_proxy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts fct_proxy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         argCount.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         fctProxies = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'fctProxies' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker cvts fctProxies.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'fctProxies' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'fct_proxy'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         resultProxy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         typeSeal.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: proxies\x7fCategory: function proxies\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         fct_proxy_null = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_null' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts fct_proxy_null.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         argCount.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'fctProxies' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'fct_proxy_null'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         resultProxy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         typeSeal.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: proxies\x7fCategory: function proxies\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         fct_proxy_or_errno = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_or_errno' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts fct_proxy_or_errno.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         argCount.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'fctProxies' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'fct_proxy_or_errno'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         resultProxy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'fct_proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         typeSeal.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: floats\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         float = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'float' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts float.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'floats' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'float'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: implicitly signed or unsigned\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         int = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'int' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts int.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'int'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: fail based on an int\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         int_or_errno = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'int_or_errno' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts int_or_errno.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'int_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cToSelfResultType = 'integer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'int_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         errorValue.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'int_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueifiedAux = ( |
            | errorValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'int_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'int_or_errno'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'int_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptBaseType = 'Integer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'int_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'aux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'int_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         selfConversion: a = ( |
            | a, ' asSmallInteger').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'int_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         setFrom: tokList = ( |
            | 
            tokList isEmpty ifTrue: [^error: main, ' needs errorValue'].
            errorValue: tokList removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'int_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         typeChar = 'i'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: implicitly signed or unsigned\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         long = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'long' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts long.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'long' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'long'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'long' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: floats\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         long_double = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'long_double' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts long_double.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'long_double' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'floats' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'long_double' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'long_double'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: fail based on an int\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         must_be_nonzero = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'must_be_nonzero' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts must_be_nonzero.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'must_be_nonzero' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cToSelfResultType = 'integer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'must_be_nonzero' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueifiedAux = '0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'must_be_nonzero' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'specific_failure_int'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'must_be_nonzero' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'noAux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'must_be_nonzero' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptBaseType = 'Integer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'must_be_nonzero' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         resCanFail = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'must_be_nonzero' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         typeChar = 'i'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: fail based on an int\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         must_be_zero = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'must_be_zero' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts must_be_zero.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'must_be_zero' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         like_must_be_nonzero* = bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'must_be_nonzero' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'must_be_zero' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'specific_success_int'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'must_be_zero' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         massageResult: r = ( |
            | r, '.\n    self').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: miscellaneous\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         none = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'none' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts none.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'none' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         isVoid = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'none' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'none' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         selfConversion: a = ( |
            | a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'none' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         typeChar = ' '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: miscellaneous\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         oop = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'oop' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts oop.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'oop' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'aux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'oop' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cToSelfResultType = 'unknown'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'oop' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueifiedAux = ( |
            | oopSubtype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'oop' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'oop'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'oop' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         oopSubtype <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'oop' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         parseResFrom: tokList = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'oop' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         setFrom: tokList = ( |
            | 
            tokList isEmpty ifTrue: [^error: 'oop needs oopSubtype'].
            oopSubtype:  tokList removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: proxies\x7fCategory: structure proxies\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         performTypeErrorSelector: sel Type: t Delegatee: d MethodHolder: mh Arguments: a = ( |
            | 
            proxyForClass: sel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: proxies\x7fCategory: structure proxies\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         proxy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts proxy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'proxy'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         resultProxy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         typeSeal.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: proxies\x7fCategory: structure proxies\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         proxyForClass: name = ( |
            | autoProxy copy className: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: proxies\x7fCategory: structure proxies\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         proxy_null = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_null' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts proxy_null.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'proxy_null'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         resultProxy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         typeSeal.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: proxies\x7fCategory: structure proxies\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         proxy_or_errno = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_or_errno' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts proxy_or_errno.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         errorValue.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueifiedAux = ( |
            | '(', ptrType, ',', typeSeal, ',', errorValue, ')').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'proxy_or_errno'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptrType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         resultProxy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         setFrom: tokList = ( |
            | 
            resend.setFrom: tokList.
            tokList isEmpty ifTrue: [^error: main, ' needs errorValue'].
            errorValue: tokList removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'proxy_or_errno' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         typeSeal.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: implicitly signed or unsigned\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         short = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'short' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts short.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'short' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'short'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'short' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         resCanFail = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'short' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: explicitly signed\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         signed_char = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_char' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts signed_char.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_char' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'signed_char'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_char' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         resCanFail = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_char' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: explicitly signed\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         signed_int = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_int' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts signed_int.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'signed_int'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: explicitly signed\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         signed_long = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_long' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts signed_long.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_long' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'signed_long'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_long' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: explicitly signed\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         signed_short = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_short' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts signed_short.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_short' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'signed_short'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_short' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         resCanFail = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'signed_short' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: implicitly signed or unsigned\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         smi = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'smi' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts smi.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'smi' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'smi'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'smi' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: fail based on an int\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         specific_failure_int = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_failure_int' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts specific_failure_int.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_failure_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cToSelfResultType = 'integer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_failure_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         failureValue.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_failure_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueifiedAux = ( |
            | 
            failureValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_failure_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'specific_failure_int'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_failure_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptBaseType = 'Integer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_failure_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'aux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_failure_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         selfConversion: a = ( |
            | 
            error: 'specific_failure_int is only a result type, not an argument type').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_failure_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         setFrom: tokList = ( |
            | 
            tokList isEmpty ifTrue: [^error: main, ' needs failure value'].
            failureValue: tokList removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_failure_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         typeChar = 'i'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: fail based on an int\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         specific_success_int = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_success_int' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts specific_success_int.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_success_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cToSelfResultType = 'integer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_success_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueifiedAux = ( |
            | 
            successValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_success_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'specific_success_int'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_success_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptBaseType = 'Integer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_success_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'aux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_success_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         selfConversion: a = ( |
            | 
            error: 'specific_failure_int is only a result type, not an argument type').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_success_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         setFrom: tokList = ( |
            | 
            tokList isEmpty ifTrue: [^error: main, ' needs success value'].
            successValue: tokList removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_success_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         successValue.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'specific_success_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         typeChar = 'i'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: strings\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         string = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'string' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts string.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         strings = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'strings' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker cvts strings.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'strings' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cToSelfResultType = 'byteVector'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'string'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: strings\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         string_len = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'string_len' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts string_len.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'string_len' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'strings' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'string_len' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'string_len'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: strings\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         string_len_null = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'string_len_null' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts string_len_null.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'string_len_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'strings' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'string_len_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'string_len_null'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: strings\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         string_null = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'string_null' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts string_null.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'string_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'strings' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'string_null' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'string_null'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: proxies\x7fCategory: structure proxies\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         undefinedSelector: sel Type: t Delegatee: d MethodHolder: mh Arguments: a = ( |
            | 
            proxyForClass: sel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: explicitly unsigned\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         unsigned_char = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_char' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts unsigned_char.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_char' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'unsigned_char'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_char' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         resCanFail = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_char' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: explicitly unsigned\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         unsigned_int = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_int' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts unsigned_int.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'unsigned_int'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_int' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: explicitly unsigned\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         unsigned_long = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_long' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts unsigned_long.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_long' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'unsigned_long'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_long' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: integers\x7fCategory: explicitly unsigned\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         unsigned_short = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_short' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts unsigned_short.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_short' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'unsigned_short'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_short' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         resCanFail = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'unsigned_short' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         rtp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: miscellaneous\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         void = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'void' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker cvts void.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'void' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         auxp* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'noAux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'void' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cToSelfResultType = 'integer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'void' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         isVoid = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'void' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         main = 'void'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'void' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         massageResult: r = ( |
            | r, '.\n    self').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'void' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptBaseType = 'Unknown'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'cvts' -> 'void' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         resCanFail = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         generator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker generator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         generator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker abstractLinking generator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         generatorTraits* <- bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         glueName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         msg = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'msg' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker msg.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         glueSend <- bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'msg' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         glueSendWiCvts <- bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'msg' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( | {
         'Comment: path to wrapper holder, ending in space\x7fModuleInfo: Module: primitiveMaker InitialContents: InitializeToExpression: (path copyWithAll: vector)'
        
         hostPath <- path copyWithAll: vector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         parser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'parser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker parser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         parser <- bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'parser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         primName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         reader = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker reader.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         reader <- bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         typeParent* <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> 'typeParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker generator typeParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         wrapper <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         wrapperFailDcl <- bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'msg' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         wrapperFailSend <- bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'msg' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         wrapperNoFailDcl <- bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'msg' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: InitializeToExpression: ( (collector copyFirst: \'snort\') asList )\x7fVisibility: publicReadPrivateWrite'
        
         args <-  (collector copyFirst: 'snort') asList .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'Comment: was list copy addLast: primitiveMaker cvts none\x7fModuleInfo: Module: primitiveMaker InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: publicReadPrivateWrite'
        
         cvts <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: InitializeToExpression: ( (collector copyFirst: \'not\') asList )\x7fVisibility: publicReadPrivateWrite'
        
         keywords <-  (collector copyFirst: 'not') asList .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         unary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'unary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker msg unary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         mode* <- bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'unary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         argCvts <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         cName <- 'open'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'Category: sendTo\'s\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         canAWS <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'Category: sendTo\'s\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         cannotFail <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         keywords <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         parser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'parser' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker parser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'parser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'Category: sendTo\'s\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         passFailHandle <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         primType <- 'call'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         resultCvt <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'parser' -> 'resultCvt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker parser resultCvt.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         tokenList <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         cDirectory <- 'self'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         entries <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         flag <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         generatorTraits <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> 'generatorTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals primitiveMaker reader generatorTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         glue <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueLibraryNameSlot <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'Comment: path to the traits object we are adding slots to\x7fModuleInfo: Module: primitiveMaker InitialContents: InitializeToExpression: (path copyWithAll: vector)\x7fVisibility: private'
        
         hostPath <- path copyWithAll: vector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         isInAddSlots <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         isInDefine <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         moduleName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         reader = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker reader.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         wrappers <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         primitiveMaker = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         abstractLinking = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker abstractLinking.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         argCvts = ( |
            | parser argCvts).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         buildGlueName = ( |
            | 
            glueName: gluePrefix.
            glueName isEmpty ifFalse: [glueName: glueName, '_'].
            parser keywords do: [|:k| 
                glueName: glueName, 
                    (k last = ':' ifTrue: [k copyWithoutLast, '_'] False: k) 
                      capitalize.
            ].
            glueName: glueName, '_glue').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         buildWrapper = ( |
            | 
            buildWrapperToDefaultFailBlock.
            buildWrapperToCallC).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         buildWrapperToCallC = ( |
            | 
            wrapperFailDcl: wrapperNoFailDcl copy addLastKeyword: 'IfFail' 
                                                             Arg: 'fb'.

            wrapper: wrapper, '  ', (wrapperFailDcl dcl: 4),
                     '= ('.

            glueSend: wrapperNoFailDcl copy.
            argCvts first isVoid ifTrue: [
                glueSend removeFirst.  
                argCvts  removeFirst.
            ].
            resultCvt isProxy  ifTrue: [
                glueSend addLastKeyword: 'ResultProxy'
                                    Arg: resultCvt resultArg.
            ].
            glueSend addSelectorPrefix: gluePrefix.
            primName: glueSend selector.
            glueSend addSelectorPrefix: '_'.

            fixupGlueSendForDynamicLinking.

            glueSend addLastKeyword: 'IfFail' Arg: wrapperFailDcl args last.
            fixupFailBlockForStaticLinking.

            wrapper: wrapper, '\n    |\n'.
            makeSlotForForeignFct: glueSend typeString. "uses glueSend"
            wrapper: wrapper, '\n    |\n'.

            "this HACK inserted by rcd 7-14-94"
            fixupGlueSendWithExtraZeroArgumentsForAnys.

            wrapper: wrapper, (glueSend send: 8).
            resultCvt isVoid ifTrue: [wrapper: wrapper, '.\n    self'].
            wrapper: wrapper, ').\n\n\n'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         buildWrapperToDefaultFailBlock = ( |
            | 
            wrapperNoFailDcl: wrapperNoFailDcl copy keywords: parser keywords 
                                                        Cvts: argCvts.

            wrapperFailSend: wrapperNoFailDcl copy.
            wrapperFailSend  addLastKeyword: 'IfFail'
                                        Arg: '[|:e| ^error: \'',
                                                wrapperNoFailDcl selector,
                                                ' failed: \', e]'.

            wrapper: '  ', (wrapperNoFailDcl dcl: 4), ' = (\n'. 

            wrapper: wrapper, (wrapperFailSend send: 8), ').\n\n'.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         cName = ( |
            | parser cName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'Category: allow :: and . in names\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         cNameWithoutPunctuation = ( |
            | 
            replacePunctuationIn: cName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'Category: allow :: and . in names\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         classNameWithoutPunctuation = ( |
            | 
            replacePunctuationIn: className).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         fixupGlueSendWithExtraZeroArgumentsForAnys = ( |
             i <- 0.
            | 
            argCvts do: [|:c|
               c main = 'any' ifTrue: [
                  i: i successor.                                  

                  "insert: 'With:' in keywords"
                  glueSend keywords: (glueSend keywords asSequence insert: 'With:' At: i) asList.
                  "insert: '0' in args - note there is one more arg than keyword (the fctObj)"
                  glueSend args: (glueSend args asSequence insert: '0' At: i successor) asList.
               ].
               i: i successor.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         gen = ( |
            | 
            'ordering is essential'.
            buildGlueName.
            buildWrapper.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         generate = ( |
            | 
            typeParent: parser primType sendTo: traits primitiveMaker typeTraits.
            generatorTraits: reader generatorTraits.
            gen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueArgCvts: start = ( | {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 r <- ''.
                }  {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 v.
                } 
            | 
            v: argCvts asVector.
            start upTo: v size Do: [|:i. a|
                a: v at: i.
                r: r, ', ', a glueify.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueCount: offset = ( |
            | '_', (argCvts size - offset) printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         gluePrefix = ( |
            | 
                cName = ''         ifTrue: [classNameWithoutPunctuation            ] False: [
            className = ''         ifTrue: [    cNameWithoutPunctuation            ] False: [
                cName = className  ifTrue: [    cNameWithoutPunctuation            ] False: [
                                            classNameWithoutPunctuation, '_', cNameWithoutPunctuation]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         primOrGlueCanFail = ( |
            | 
            parser cannotFail not || [resultCvt resCanFail  ||  [
                resultCvt isProxy || [
                argCvts anySatisfy: [|:cvt| cvt argCanFail]]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'Category: allow :: and . in names\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         replacePunctuationIn: aString = ( |
             r.
            | 
            r: aString copyMutable mapBy: [|:c| c isLetter || [c isDigit]  ifTrue: c False: '_'].
            r first = '_'  ifTrue: [ r copyWithoutFirst ] False: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         resultCvt = ( |
            | parser resultCvt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cvts = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker cvts.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'aux' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         cloning* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> () From: ( | {
         'Category: general methods\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         general = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker cvts general.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'aux' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         p2* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'aux' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         parseFrom: tokList = ( |
            | copy setFrom: tokList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueifiedAux = ( |
            | ptrType).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'aux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptBaseType = 'ByteVector'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         selfConversion: a = ( |
            | a, ' asVMByteVector').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         setFrom: tokList = ( |
            | 
            tokList isEmpty ifTrue: [^error: 'byteVectors need ptr type'].
            ptrType: tokList removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'byteVectors' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         typeChar = 'b'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'fctProxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueifiedAux = ( |
            | '(', ptrType, ',', typeSeal, ',', argCount, ')').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'fctProxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'fctProxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         setFrom: tokList = ( |
            | 
            resend.setFrom: tokList.
            tokList isEmpty ifTrue: [^error: 'fctProxies need argCount'].
            argCount:  tokList removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'floats' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cToSelfResultType = 'float'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'floats' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'noAux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'floats' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptBaseType = 'Float'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'floats' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         selfConversion: a = ( |
            | a, ' asFloat').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'floats' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         typeChar = 'f'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         argCanFail = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         className = ( |
            | 
            error: 'cannot deduce class name from ', main, ' conversion').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         glueify = ( |
            | main, ',', glueifiedAux).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         isProxy = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         isVoid = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         massageResult: r = ( |
            | r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         parseArgFrom: tokList = ( |
            | parseFrom: tokList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         parseResFrom: tokList = ( |
            | parseFrom: tokList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         primTableRetType = ( |
            | ptBaseType, 'PrimType').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptBaseType = 'Unknown'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         resCanFail = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         selfConversion: a = ( |
            | a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         typeChar = ' '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cToSelfResultType = 'integer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'noAux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ptBaseType = 'Integer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         selfConversion: a = ( |
            | a, ' asSmallInteger').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'ints' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         typeChar = 'i'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'noAux' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         cloning* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'noAux' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueifiedAux = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'noAux' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         p2* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'general' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'noAux' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         parseFrom: tokList = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         cToSelfResultType = 'resultProxy'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueifiedAux = ( |
            | '(', ptrType, ',', typeSeal, ')').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         isProxy = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'aux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         parseArgFrom: tokList = ( |
            | copy setFrom: tokList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         parseResFrom: tokList = ( |
            | 
            (parseArgFrom: tokList)  setResultProxyFrom: tokList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         resultArg = ( |
            | resultProxy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         selfConversion: a = ( | {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 rcvr <- ''.
                } 
            | 
            a = 'self' ifFalse: [ rcvr: a ].
            '(', rcvr, ' reviveIfFail: [|:e| ^ fb value: e])').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         setFrom: tokList = ( |
            | 
            tokList size < 2
                ifTrue: [^error: 'proxies need ptr type and type seal'].
            ptrType:  tokList removeFirst.
            typeSeal: tokList removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         setResultProxyFrom: tokList = ( |
            | 
            tokList isEmpty ifTrue: [
                ^error: 'returned proxy need result proxy'
            ].
            resultProxy: tokList removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'proxies' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         typeChar = 'p'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'strings' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'noAux' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'strings' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         selfConversion: a = ( |
            | a, ' asVMByteVector').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'cvts' -> 'strings' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         typeChar = 'b'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         dynamicLinking = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'dynamicLinking' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker dynamicLinking.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'dynamicLinking' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         generator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'dynamicLinking' -> 'generator' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker dynamicLinking generator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'dynamicLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         entry = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'dynamicLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         fct = 'myFctObj'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'dynamicLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         fixupFailBlockForStaticLinking = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'dynamicLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         fixupGlueSendForDynamicLinking = ( |
            | 
            glueSend addFirstReceiver: fct  Keyword: 'call'.
            glueSend callWithify.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'dynamicLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         makeSlotForForeignFct: argCoercions = ( |
             dummySel.
             resType.
            | 
            dummySel: glueSend copy.
            dummySel makeArgs.
            dummySel args removeLast.
            dummySel args addLast: 'fb'.
            resType: resultCvt cToSelfResultType.
            'resultProxy' = resType ifTrue: [
                resType: 'arg', (dummySel args size - 2) printString.
            ].
            wrapper: wrapper, 
                     '\n      ', fct, ' =',
                     ((primitiveMaker msg copy 
                       receiver: 'foreignFct'
                              K: 'copyName:'     A: '\'', glueName, '\''
                              K: 'ArgCoercions:' A: argCoercions printString
                              K: 'ResultType:'   A: resType printString
                              K: 'Path:'         A: reader glueLibraryName
                      ) send: 8),
                     '.\n'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'dynamicLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         msg = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker msg.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         addSelectorPrefix: p = ( |
            | 
            (p isPrefixOf: keywords first) ifTrue: [^self].
            keywords addFirst: p, keywords removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         applyCvts = ( | {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 a.
                }  {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            a: args.
            c: cvts.
            args: a copyRemoveAll.
            cvts: c copyRemoveAll.
            a with: c Do: [|:a. :c|
                args addLast: c selfConversion: a.
                cvts addLast: primitiveMaker cvts none.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | ((
            resend.copy keywords:  keywords copy)
                        cvts:      cvts     copy)
                        args:      args     copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         hasCoercions = ( |
            | 
            cvts anySatisfy: [|:a| (a selfConversion: 'fisk') != 'fisk']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ignored = '\"ignored\"'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         keywords: ks Cvts: cs = ( |
            | 
            keywords: ks copy.
            cvts:     cs copy.
            makeArgs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         lotsOargs = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'lotsOargs' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker msg lotsOargs.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'lotsOargs' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         addFirstReceiver: rcv Keyword: k = ( |
            | 
            args     addFirst: rcv.
            keywords addFirst: k, ':'.
            cvts     addFirst: primitiveMaker cvts none.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'lotsOargs' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         addLastKeyword: k Arg: a = ( |
            | 
            args     addLast: a.
            keywords addLast: k, ':'.
            cvts     addLast: primitiveMaker cvts none.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'lotsOargs' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         callWithify = ( |
            | 
            keywords removeFirst.
            keywords: keywords copyMappedBy: ['With:'].
            keywords addFirst: 'call:'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'lotsOargs' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         dcl: indent = ( | {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 a.
                }  {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 col <- 0.
                }  {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 in <- ''.
                }  {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 r <- ''.
                }  {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 toks.
                } 
            | 
            in: in copySize: indent.
            a: args copy.
            a removeFirst.
            toks: list copyRemoveAll.
            keywords with: a Do: [|:k. :a|  
                toks addLast: k.
                toks addLast: a.
            ].
            toks do: [|:t|
                (t size succ + col)  >  width ifTrue: [
                    r: r, '\n', in.
                    col: in size.
                ].
                r: r, t, ' '.
                col: col + t size succ.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'lotsOargs' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'lotsOargs' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirst = ( |
            | 
            args removeFirst.
            cvts removeFirst.
            keywords addFirst:
                args size = 1  
                  ifTrue: [ keywords removeFirst copyWithoutLast]
                   False: [ keywords removeFirst copyWithoutLast, 
                            keywords removeFirst].
            setMode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'lotsOargs' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         width = 60.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         makeArgs = ( |
            | 
            args removeAll.
            cvts size pred do: [|:i| args addLast: 't', i printString].
            args addFirst: 'self'.
            setMode.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         nullary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'nullary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker msg nullary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'nullary' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         addFirstReceiver: rcv Keyword: k = ( |
            | 
            args     removeFirst.
            cvts     removeFirst.
            keywords removeFirst.
            args     addFirst: rcv.
            cvts     addFirst: primitiveMaker cvts none.
            keywords addFirst: k.
            setMode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'nullary' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         addLastKeyword: k Arg: a = ( |
            | 
            k = 'IfFail'  ifTrue: [^resend.addLastKeyword: k Arg: a].
            args removeFirst. args addLast: a.
            cvts removeFirst. cvts addLast: primitiveMaker cvts none.
            keywords addFirst: keywords removeFirst, k.
            setMode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'nullary' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'unary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'nullary' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirst = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver: r K: k1 A: a1 K: k2 A: a2 K: k3 A: a3 K: k4 A: a4 = ( |
            | 
            args removeAll.
            args addLast: r.
            args addLast: a1.
            args addLast: a2.
            args addLast: a3.
            args addLast: a4.

            keywords removeAll.
            keywords addLast: k1.
            keywords addLast: k2.
            keywords addLast: k3.
            keywords addLast: k4.

            cvts removeAll.
            args size do: [cvts addLast: primitiveMaker cvts none].
            setMode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceLastArgWith: a = ( |
            | 
            args removeLast. 
            args addLast: a.  
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         selector = ( | {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 r <- ''.
                } 
            | 
            keywords do: [|:k| r: r, k].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         send: indent = ( | {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 rcvr <- ''.
                } 
            | 
            'indent is indent of rest of line'.
              args first = 'self' ifFalse: [ rcvr: args first ].
              '\n', ('' copySize: (indent - 2) max: 0), rcvr, ' ',
              (dcl: indent)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         setMode = ( |
            | 
            mode:  args size > 1         ifTrue: [lotsOargs] False: [
                   args first = ignored  ifTrue: [nullary]   False: [unary]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         typeString = ( | {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 result <- ''.
                } 
            | 
            cvts doFirstLast: [] Middle: [|:c| result: result, c typeChar ].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'unary' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         addFirstReceiver: rcv Keyword: k = ( |
            | 
            args     addFirst: rcv.
            cvts     addFirst: primitiveMaker cvts none.
            keywords removeFirst.
            keywords addFirst: k, ':'.
            setMode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'unary' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         addLastKeyword: k Arg: a = ( |
            | 
            args     addLast: a.
            cvts     addLast: primitiveMaker cvts none.
            keywords addFirst: keywords removeFirst, k, ':'.
            setMode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'unary' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         callWithify = ( |
            | 
            keywords removeFirst.
            keywords addFirst: 'call'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'unary' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         dcl: indent = ( |
            | 
            keywords first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'unary' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'msg' -> 'unary' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirst = ( |
            | 
            args removeFirst.  args addFirst: ignored.
            cvts removeFirst.  cvts addFirst: primitiveMaker cvts none.
            setMode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | (
            resend.copy   keywords:           keywords         copyRemoveAll)
                          argCvts:            argCvts          copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         parse = ( |
            | 
            [|:exit|
                argCvts addLast: selectCvt parseArgFrom: tokenList.
                tokenList first = '='  ifTrue: exit.
                keywords addLast: tokenList removeFirst.
                tokenList first = '='  ifTrue: exit.
            ] loopExit.
            tokenList removeFirst. "rm = "

            resultCvt:  selectCvt parseResFrom: tokenList.
            primType:   tokenList removeFirst.
            cName:   (primType = 'new'   ) ifTrue: 'new'     False: [
                     (primType = 'delete') ifTrue: 'delete'  False: [
                     tokenList removeFirst]].

            [tokenList isEmpty] whileFalse: [
                | performDecl = (|
                    acceptSelector: s = ( 
                        ('canAWS:' = s) || ['cannotFail:' = s] || 
                        ['passFailHandle:' = s].
                      ).
                  |). |
                _Perform: (tokenList removeFirst, ':') canonicalize With: true.
                "tokenList removeFirst, ':' sendTo: self With: true. OLD VERS."
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         selectCvt = ( | {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 c <- ''.
                } 
            | 
            c: tokenList removeFirst.
            '_' = c  ifTrue: [primitiveMaker cvts proxyForClass: c]
                      False: [c sendTo: primitiveMaker cvts]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         addModuleInfoToWrappers = ( |
            | 

            wrappers: wrappers &
              'modules _AddSlots: ( |\n' & 
                '\t' &  (slotAnnoLineVisibility: publicSlot) &
                '\t\t' &  moduleName & ' = ()\n\t}\n| )\n\n'.

            wrappers: wrappers & 'modules ' & moduleName & 
                      ' _AddSlots: (\n'.

            typicalModuleMirror copyDowns first slotsToOmit asVector sortedDo: [|:n|
                wrappers: wrappers &  '\tbootstrap remove: ' &
                          n storeString & ' From:\n'.
              ].

             wrappers: wrappers & '\tglobals modules init copy) _AddSlots: ( |\n'.
             wrappers: wrappers &  '\t' &
                       moduleObjectAnnoLine &
                  '\n' &
                  '\t' &  (slotAnnoLineVisibility: (typicalModuleMirror at: 'fileInTimeString') visibility
                                     Expression: '_CurrentTimeString') &

                  '\t\tfileInTimeString <- _CurrentTimeString.\n' &

                  '\t}\n' &
                  '\t' & (slotAnnoLineVisibility: (typicalModuleMirror at: 'myComment') visibility) &

                  '\t\tmyComment <- \'\n\t\t' &
                    warningMessage & '.\'.\n' &

                  '\t}\n' &
                  '\t' & (slotAnnoLineVisibility: (typicalModuleMirror at: 'directory') visibility) &

                  '\t\tdirectory <- \'glue\'.\n' &

                  '\t}\n' &
                  '\t' & (slotAnnoLineVisibility: (typicalModuleMirror at: 'revision') visibility) &

                  '\t\trevision <- \'No revision; generated file\'.\n' &

                  '\t}\n' &

                  '\t' & (slotAnnoLineVisibility: (typicalModuleMirror at: 'subpartNames') visibility) &

                  '\t\tsubpartNames <- \'\'.\n' &

                  '\t}\n| )\n\n'.
              self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         appendFrom: gen = ( |
            | 
            wrappers:          wrappers &     gen wrapper.
            glue:              glue     &     gen glue.
            entries:           entries  &     gen entry).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         appendToMacros: s = ( |
            | 
            entries: entries &  s.   
            glue:    glue    &  s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         beNoisy = ( |
            | feedingBack: noisy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         beQuiet = ( |
            | feedingBack: quiet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         benchmark: buf = ( | {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 reader.
                } 
            | 
            reader: copy.
            reader beQuiet.
            reader dynamicLinking.
            reader cDirectory: ''.
            reader create: 'test' From: buf Writing: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         cComment: c = ( |
            | '/* ', c, ' */\\\n\\\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         cleanupFileHeaders = ( |
            | 
            "must reset this macro for other primitives"
            flag = '' ifFalse: [
              appendToMacros: '\n# undef PRIMITIVE_GLUE_FLAG_CODE', '\n'.
              appendToMacros: '# define PRIMITIVE_GLUE_FLAG_CODE', '\n'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         comment: c = ( |
            | 
            wrappers: wrappers &  sComment: c.
            appendToMacros: cComment: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         create: filePrefix Flag: flag From: inputString = ( |
            | 
            create: filePrefix From: inputString Writing: true Flag: flag).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         create: filePrefix From: inputString = ( |
            | 
            create: filePrefix From: inputString Writing: true Flag: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         create: filePrefix From: in Writing: doWrite = ( |
            | 
            create: filePrefix From: in Writing: doWrite Flag: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         create: filePrefix From: in Writing: doWrite Flag: f = ( |
            | 
            moduleName: filePrefix, '_wrappers'.
            flag: f.
            setupFileHeaders.
            read: in.
            cleanupFileHeaders.
            doWrite ifTrue: [ write: filePrefix ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         dynamicLinking = ( |
            | 
            generatorTraits:  traits primitiveMaker dynamicLinking generator.
            cDirectory:       'objects/glue').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         endOfMacros = ( |
            | 
            isInDefine   ifTrue: [appendToMacros: '\n\n'.  isInDefine:   false].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         endOfSlotAnnotation = ( |
            | 
            wrappers: wrappers & '\t}\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         endOfWrappers = ( |
            | 
            isInAddSlots ifTrue: [
                  endOfSlotAnnotation.
                  wrappers: wrappers &  '| )\n\n'.
                  isInAddSlots: false.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         noisy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> 'noisy' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker reader noisy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         feedingBack* <- bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> 'noisy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         glueLibraryName = ( |
            | 
            glueLibraryNameSlot = noGlueLibraryName
              ifFalse: [glueLibraryNameSlot] 
                 True: [
                error: 
                  'You must include a \"glueLibraryName:\" template',
                  '  for dyanamic linking. ',
                  'The library name gives the name of the .so file containing the',
                  ' glue.'
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         glueLibraryName: n = ( |
            | glueLibraryNameSlot: '\'', n, '\'').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         ignoredCommentPrefix = '//'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         in: in WithoutEscNLDo: b = ( | {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 lastWasBackslash <- bootstrap stub -> 'globals' -> 'false' -> ().
                } 
            | 
            in do: [|:c|
                lastWasBackslash ifFalse: [b value: c] True: [
                    '\n' = c ifFalse: [
                        b value: '\n' first.
                        b value: c.
                    ].
                ].
                lastWasBackslash: '\\' = c
            ].
            b value: '\n' first. "needed for tokenize"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         includedCommentPrefix = '--'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeGlueLibraryName = ( |
            | glueLibraryNameSlot: noGlueLibraryName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         macroName: n = ( |
            | 
            glue:    glue    &  '# define '  & n &  '_glue    \\\n\\\n'.
            entries: entries &  '# define '  & n &  '_entries \\\n\\\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         moduleObjectAnnoLine = ( |
             an.
            | 
             an: typicalModuleObjectAnno.
             an: an copyForComment: warningMessage.
             an: an copyForModuleInfo: [|:mi|
              mi copyForCreatorSlotHint: 
               (reflect: modules) 
                 at: moduleName 
                 IfAbsent: [mi prototype creatorSlotHint]].
            '{} = ',
            an asString canonicalize storeString,
            '.\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         noGlueLibraryName = 'user must specify me'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> 'noisy' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         feedback: string = ( |
            | string printLine.   self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         objectAnnoLineNames: path = ( |
            | 
            '{} = ',
            ( 
              objectAnnotation copyForModuleInfo: [|:mi| 
                mi copyForCreatorSlotHint: path targetSlotIfAbsent: [
                  mi prototype creatorSlotHint]]
            ) asString canonicalize storeString,
            '.\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         processEnd = ( |
            | 
            endOfWrappers.
            addModuleInfoToWrappers).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         processGlueLibraryName: line = ( |
            | 
            line removeFirst.
            glueLibraryName: line first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         processMacroName: line = ( |
            | 
            line removeFirst.
            endOfMacros.
            macroName: line first.
            line removeFirst.
            isInDefine: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         processTemplate: line = ( |
             c <- ''.
             g.
             p.
            | 
            c: c & 'Processing: '.
            line do: [|:s| c: c & ' ' & s].
            feedback: c flatString.

            line isEmpty                       ifTrue: [^self].
            line first = ignoredCommentPrefix  ifTrue: [^self].
            line first = includedCommentPrefix ifTrue: [| s <- ''. |
                line doFirst: [] MiddleLast: [|:t| s: s, t, ' '] IfEmpty: []. 
                ^ comment: s.
            ].
            line first = 'traits:'           ifTrue: [^processTraits:          line].
            line first = 'macroName:'        ifTrue: [^processMacroName:       line].
            line first = 'glueLibraryName:'  ifTrue: [^processGlueLibraryName: line].
            line first = 'visibility:'       ifTrue: [^processVisibility:      line].
            p: primitiveMaker parser copy.
            p tokenList: line.
            p parse.

            g: primitiveMaker generator copy.
            g reader: self.
            g parser: p.
            g hostPath: hostPath.
            g generate.

            appendFrom: g.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         processTraits: line = ( |
            | 
            line removeFirst.
            endOfWrappers.
            hostPath: path copyWithAll: vector.
            line do: [|:tok| hostPath: hostPath extendedBy: tok].
            wrappers: wrappers & hostPath fullName &  ' _AddSlots: ( |\n\n'.
            startOfVisibility: undeclaredSlot.
            isInAddSlots: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         processVisibility: line = ( |
             vis.
            | 
            line removeFirst.
            vis: (
              (reflect: visibility) at: line first IfAbsent: [
                error: 'token after "visibility:" must be a slot in visibility but is: ', line first.
              ]) contents reflectee.
            endOfSlotAnnotation.
            startOfVisibility: vis).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         quiet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> 'quiet' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker reader quiet.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> 'quiet' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         feedback: string = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         read: in = ( | {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 inList.
                }  {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 line.
                }  {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 r.
                }  {
                 'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
                
                 token.
                } 
            | 
            inList: list copyRemoveAll.
            r:      list copyRemoveAll.

            in: in  WithoutEscNLDo: [|:c| inList addLast: c].

            line:   list copyRemoveAll.
            [|:exit|
                [ 
                    inList isEmpty  ||  ['\n' = inList first]   ifTrue: [
                        processTemplate: line.
                        inList isEmpty ifTrue: exit.    
                        line: list copyRemoveAll.           
                    ].
                    '\t \n' includes: inList first
                ] whileTrue: [inList removeFirst].

                token: list copyRemoveAll.
                inList first = '{' ifTrue: [
                    inList removeFirst.
                    [|:exitBracketToken. c |
                        inList isEmpty ifTrue: [^error: 'open { but no closing }'].
                        c: inList removeFirst.
                        c = '}' ifTrue: exitBracketToken.
                        token addLast: c.
                    ] loopExit.
                ] False: [
                    [|:exitToken. |
                        inList isEmpty  ifTrue: exitToken.
                        ('\t \n' includes: inList first)  ifTrue: exitToken.
                        token addLast: inList removeFirst.
                    ] loopExit.
                ].
                line addLast: token asString.
            ] loopExit.

            processEnd).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         sComment: c = ( |
            | '" ' , c, ' "\n\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         setupFileHeaders = ( |
             pragma = '# ifdef INTERFACE_PRAGMAS
# pragma interface
# endif
'.
            | 
            comment: warningMessage.
            appendToMacros: pragma.
            flag = '' ifFalse: [
                appendToMacros: '# undef PRIMITIVE_GLUE_FLAG_CODE', '\n'.
                appendToMacros:
                   '# define PRIMITIVE_GLUE_FLAG_CODE BlockGlueFlag gf(',flag, ');\n'
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         slotAnnoLineVisibility: vis = ( |
            | 
            slotAnnoLineVisibility: vis Expression: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         slotAnnoLineVisibility: vis Expression: expr = ( |
            | 
            '{ ', 
            (
              ((slotAnnotation 
                copyForVisibility: vis)
                copyForCategory: 'generated by primitiveMaker' )
                copyForModuleInfo: [|:mi|
                   (mi copyForModule: moduleName)
                       copyForInitialContents: 
                        expr isEmpty 
                          ifTrue: transporter moduleInfo followSlot 
                           False: [
                            transporter moduleInfo initializeToExpression 
                              copyForExpression: expr]]
            ) asString canonicalize storeString, 
            '\n\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         startOfVisibility: vis = ( |
            | 
            wrappers: wrappers & 
              slotAnnoLineVisibility: vis).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         staticLinking = ( |
            | 
            generatorTraits:  traits primitiveMaker staticLinking generator.
            cDirectory:       'vm/prims').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | test: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         test: doWrite = ( |
             reader.
            | 
            reader: copy.
            reader staticLinking.
            reader cDirectory: '/tmp'.
            reader create: 'test' From: '

             // a comment that is ignored
             -- a comment that is included in the output

             traits:    fribble frabble
             macroName: smortlehoffer

             void copy_color: color Shape: shape = iNode {inodeProto deadCopy} new

             visibility: privateSlot
             iNode delete = void delete

             visibility: publicSlot
             void errorNumber      = int get errno
             visibility: undeclaredSlot
             void errorNumber: int = void set errno

             pixrect pr_zap      = frob frobToSideEffect getMember bark
             pixrect pr_zap: int = frob frobToSideEffect setMember bark
             pixrect pr_zap: int = frob {frob xroto} callMember bark


             void time = int call ftime

             visibility: publicSlot
             void open: string Mode: int = int call open
             void open: string \
             Mode: int = proxy int int_seal pToSideEffect call open

             visibility: privateSlot
             void exit: int     = void call exit canAWS cannotFail
             void exit: any_oop = void call exit canAWS cannotFail passFailHandle

            void fribble = specific_failure_int 17 call fail_if_17
            void frobble = specific_success_int 21 call ok_if_21
            void kreplach = must_be_nonzero call snort
            void blintz = must_be_zero call cheese

             ' Writing: doWrite.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         typicalModuleMirror = ( |
            | 
            reflect: transporter moduleDictionary at: 'primitiveMaker').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         typicalModuleObjectAnno = ( |
            | typicalModuleMirror annotation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         warningMessage = 'This information was generated by the primitive maker (primitiveMaker.self).
Please do not change it manually. -- dmu 12/91 '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         write: prefix = ( |
             glueDir.
            | 
            ' convert to strings so each character is not output individually '.
            " (eliminate when printOnFile: uses buffered files) "

            glueDir: bootstrap selfObjectsWorkingDir, '/glue/'.

            wrappers flatString printOnFile: glueDir, moduleName, '.self'.

            (entries &  '\n\n' & glue & '\n') flatString printOnFile: 
               glueDir, prefix, '.primMaker.hh'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         staticLinking = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'staticLinking' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker staticLinking.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'staticLinking' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         generator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'staticLinking' -> 'generator' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker staticLinking generator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'staticLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         entry = ( |
            | 
            '{ \"', primName, '\", \\\n',
            'fntype(&', glueName, '), \\\n',
            'ExternalPrimitive, \\\n',
            resultCvt primTableRetType, ', \\\n',

            primOrGlueCanFail  printString, ', /* can fail               */ \\\n',
            parser canAWS      printString, ', /* can scavenge           */ \\\n',
            false              printString, ', /* can be constant folded */ \\\n',
            true               printString, ', /* cannot be moved or cut */ \\\n',
            parser canAWS      printString, ', /* can walk stack         */ \\\n',
            parser canAWS      printString, ', /* can abort process      */ \\\n',
            '"Generated by the primitive maker" },\\\n',
            ' \\\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'staticLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         fixupFailBlockForStaticLinking = ( |
            | 
            glueSend hasCoercions ifTrue: [
                glueSendWiCvts: glueSend copy applyCvts.
                glueSend replaceLastArgWith:
                      '\n      [|:e| (\'badTypeError\'   isPrefixOf: e)',
                      '\n        ||  [\'deadProxyError\' isPrefixOf: e]',
                      '\n           ifFalse: [^fb value: e] ',
                      '\n              True: [', 
                                        (glueSendWiCvts send: 20), 
                      '\n           ]]'.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'staticLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         fixupGlueSendForDynamicLinking = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'staticLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         makeSlotForForeignFct: argCoercions = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'staticLinking' -> 'generator' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'abstractLinking' -> 'generator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot'
        
         typeTraits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker typeTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         call = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'call' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker typeTraits call.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'call' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         className = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'call' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         glue = ( |
             start = 0.
            | 
            ' C_func', (glueCount: start),
            '( ', resultCvt glueify, ', ', cName, ', ',
                glueName, ', ',
                (parser passFailHandle ifTrue: 'fail' False: ''),
                (glueArgCvts: start), ') \\\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         callMember = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'callMember' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker typeTraits callMember.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'callMember' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         className = ( |
            | argCvts first className).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'callMember' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         glue = ( |
             hack = 1.
            | 
            ' CC_mber', (glueCount: hack),
            '( ', resultCvt glueify, ', ', 
                argCvts first glueify, ', ', 
                cName, ', ',
                glueName, ', ',
                (parser passFailHandle ifTrue: 'fail' False: ''),
                (glueArgCvts: hack), ') \\\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'delete' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker typeTraits delete.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'delete' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         className = ( |
            | argCvts first className).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'delete' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         glue = ( |
            | 
            ' CC_delete( ', argCvts first glueify, ', ',  glueName, ') \\\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         get = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'get' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker typeTraits get.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'get' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         className = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'get' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         glue = ( |
            | 
            ' C_get_var( ', resultCvt glueify, ', ',
                         cName, ', ', glueName, ') \\\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         getMember = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'getMember' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker typeTraits getMember.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'getMember' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         className = ( |
            | argCvts first className).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'getMember' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         glue = ( |
            | 
            ' C_get_comp( ', resultCvt glueify, ', ', 
                          argCvts first glueify,
                          ', ', '.', cName, ', ', glueName, ') \\\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         new = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'new' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker typeTraits new.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'new' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         className = ( |
            | resultCvt className).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'new' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         glue = ( |
             start = 0.
            | 
            ' CC_new', (glueCount: start), 
                '( ', resultCvt glueify, ', ', 
                className, ', ',
                glueName,
                (glueArgCvts: start), ') \\\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         performTypeErrorSelector: sel Type: t Delegatee: d MethodHolder: mh Arguments: a = ( |
            | 
            sel error: 'is a bad template type: ', sel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         set = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'set' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker typeTraits set.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         className = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         glue = ( |
            | 
            ' C_set_var( ',  cName, ', ', argCvts first glueify, ', ',
                        glueName, ') \\\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         setMember = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'setMember' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits primitiveMaker typeTraits setMember.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'setMember' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         className = ( |
            | argCvts first className).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> 'setMember' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         glue = ( |
            | 
            ' C_set_comp( ',  argCvts first glueify, 
                          ', ', '.', cName, ', ',
                          argCvts last glueify, ', ',  
                          glueName, ') \\\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'primitiveMaker' -> 'typeTraits' -> () From: ( | {
         'ModuleInfo: Module: primitiveMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         undefinedSelector: sel Type: t Delegatee: d MethodHolder: mh Arguments: a = ( |
            | 
            sel error: 'is a bad template type: ', sel).
        } | ) 



 '-- Side effects'

 globals modules primitiveMaker postFileIn
