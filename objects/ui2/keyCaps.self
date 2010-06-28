 '$Revision: 30.4 $'
 '
Copyright 1992-2009 AUTHORS, Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Keyboard\x7fModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         keyCaps = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> () From: ( |
             {} = 'Comment: Namespace of objects that represent particular keys on a keyboard.
-- dmu, aa, as 2/04\x7fModuleInfo: Creator: globals keyCaps.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         abstract = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'abstract' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps abstract.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         isArrow = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrintable = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         arrows = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps arrows.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         abstract = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'abstract' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps arrows abstract.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         isArrow = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         abstract = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs abstract.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         down = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'down' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps arrows down.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'down' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         downLeft = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'downLeft' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps arrows downLeft.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'downLeft' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         downRight = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'downRight' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps arrows downRight.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'downRight' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         left = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'left' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps arrows left.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'left' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         right = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'right' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps arrows right.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'right' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         up = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'up' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps arrows up.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'up' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         upLeft = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'upLeft' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps arrows upLeft.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'upLeft' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         upRight = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'upRight' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps arrows upRight.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'upRight' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'arrows' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         oddballs = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         cloningParent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         keyCapParent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'Category: modifiers\x7fModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         alt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'alt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs alt.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'alt' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         backspace = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'backspace' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs backspace.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'backspace' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'Category: modifiers\x7fModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         command = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'command' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs command.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'command' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'Category: modifiers\x7fModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         control = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'control' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs control.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'control' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         copy_cmd = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'copy_cmd' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs copy_cmd.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'copy_cmd' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         cut_cmd = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'cut_cmd' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs cut_cmd.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'cut_cmd' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'delete' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs delete.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'delete' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         end = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'end' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs end.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'end' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         enter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'enter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs enter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'enter' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         escape = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'escape' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs escape.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'escape' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         home = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'home' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs home.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'home' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         insert = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'insert' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs insert.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'insert' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'Category: modifiers\x7fModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         meta = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'meta' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs meta.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'meta' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'Category: modifiers\x7fModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         option = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'option' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs option.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'option' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         pageDown = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'pageDown' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs pageDown.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'pageDown' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         pageUp = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'pageUp' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs pageUp.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'pageUp' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         paste_cmd = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'paste_cmd' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs paste_cmd.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'paste_cmd' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'Category: modifiers\x7fModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         shift = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'shift' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs shift.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'shift' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         tab = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'tab' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs tab.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'tab' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrintable = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'tab' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'tab' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = '  '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         undo_cmd = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'undo_cmd' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps oddballs undo_cmd.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'undo_cmd' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         printableCharacter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'printableCharacter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps printableCharacter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'printableCharacter' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: InitializeToExpression: (\'a\')\x7fVisibility: public'
        
         character <- 'a'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'printableCharacter' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'printableCharacter' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps printableCharacter parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'printableCharacter' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         = o = ( |
            | 
            o isPrintable && [printString = o printString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'printableCharacter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         cloningParent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'printableCharacter' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            character hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'printableCharacter' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrintable = ( |
            | character isPrintable).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'printableCharacter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         keyCapParent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'printableCharacter' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | character).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         unknown = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'keyCaps' -> 'unknown' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals keyCaps unknown.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'keyCaps' -> 'unknown' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'keyCaps' -> 'oddballs' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         keyCaps = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'keyCaps' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'keyCaps' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules keyCaps.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'keyCaps' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'keyCaps' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'keyCaps' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'keyCaps' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'keyCaps' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.4 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'keyCaps' -> () From: ( | {
         'ModuleInfo: Module: keyCaps InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules keyCaps postFileIn
