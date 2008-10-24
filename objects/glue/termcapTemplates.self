'Sun-$Revision: 30.6 $'

"Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
 See the LICENSE file for license information."

"CAUTION: This file is not part of the documented Self world.  It may be
 be changed or removed at any time, and it will not be documented.

 This file can be removed without affecting the Self world in any way.
"
  "Template used by primitiveMaker to create termcap primitives."

primitiveMaker reader copy staticLinking  create: 'termcap' From: '

    -- Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
    -- See the LICENSE file for license information.
 
    traits: traits termcap
    macroName:   termcap
    glueLibraryName: termcap_glue.o

    visibility: publicSlot
    void  primGetenv: string  = string call tgetenv_wrapper passFailHandle

    void  getstr: string      = string call tgetstr_wrapper passFailHandle

    void  goto: string  Col: int  Row: int  = \
		   string call tgoto_wrapper passFailHandle


    void  getnum:  string = int_or_errno -1  call tgetnum
    void  getflag: string = bool	       call tgetflag
'

