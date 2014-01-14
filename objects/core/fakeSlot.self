 'Sun-$Revision: 30.24 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: fake slots\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         fakeSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         codes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'codes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot codes.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         codes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'codes' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot codes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot codes)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'codes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         expressionStack = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'expressionStack' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot expressionStack.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'expressionStack' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'methodActivation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         expressionStack = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'expressionStack' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot expressionStack.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'expressionStack' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot expressionStack)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'expressionStack' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         file = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'file' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot file.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'file' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         file = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'file' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot file.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'file' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot file)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'file' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'lexicalParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot lexicalParent.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'lexicalParent' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'blockMethodActivation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'lexicalParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot lexicalParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'lexicalParent' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot lexicalParent)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'lexicalParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         line = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'line' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot line.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'line' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         line = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'line' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot line.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'line' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot line)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'line' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         literals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'literals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot literals.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'literals' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         literals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'literals' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot literals.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'literals' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot literals)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'literals' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         methodHolder = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'methodHolder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot methodHolder.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'methodHolder' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'methodActivation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         methodHolder = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'methodHolder' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot methodHolder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'methodHolder' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot methodHolder)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'methodHolder' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         methodPointer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'methodPointer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot methodPointer.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'methodPointer' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: ((vector copyAddLast: \'first element\') _Mirror)\x7fVisibility: private'
        
         mirror <- (vector copyAddLast: 'first element') _Mirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         methodPointer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'methodPointer' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot methodPointer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'methodPointer' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot methodPointer)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'methodPointer' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         position = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'position' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot position.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'position' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'methodActivation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         position = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'position' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot position.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'position' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot position)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'position' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'receiver' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot receiver.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'receiver' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'methodActivation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'receiver' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot receiver.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'receiver' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot receiver)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'receiver' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         reflectee = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'reflectee' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot reflectee.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'mirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         reflectee = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'reflectee' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot reflectee.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot reflectee)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'reflectee' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         selector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'selector' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot selector.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'methodActivation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         selector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'selector' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot selector.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot selector)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'selector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         sender = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'sender' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot sender.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'sender' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'methodActivation' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         sender = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sender' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot sender.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'sender' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot sender)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sender' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceLength = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'sourceLength' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot sourceLength.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'sourceLength' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceLength = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceLength' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot sourceLength.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'sourceLength' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot sourceLength)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceLength' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceOffset = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'sourceOffset' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot sourceOffset.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'sourceOffset' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceOffset = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceOffset' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot sourceOffset.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'sourceOffset' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot sourceOffset)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceOffset' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceString = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'sourceString' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot sourceString.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'sourceString' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceString = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceString' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot sourceString.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'sourceString' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot sourceString)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceString' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         stack = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'stack' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot stack.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'stack' -> () From: ( | {
         'Comment: process.self not defined yet\x7fModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (reflect: process)\x7fVisibility: private'
        
         mirror <- reflect: process.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         stack = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'stack' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot stack.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'stack' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot stack)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'stack' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         vectorElement = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'vectorElement' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fakeSlot vectorElement.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         elementIndex <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: ((vector copySize: 1) asMirror)'
        
         mirror <- (vector copySize: 1) asMirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: the fake slots\' traits\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         vectorElement = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot vectorElement.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot vectorElement)'
        
         parent* <- bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot'
        
         fakeSlot = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlot' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules fakeSlot.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot'
        
         myComment <- 'A fake slot mimics the behavior of a slot.  These include codes,
             literals, source, file, and line for methods,
             reflectee for mirrors, and elements for vectors.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.24 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: fake slots\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         fakeSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fakeSlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (slotAnnotation parse: \'Category: PseudoSlots\')\x7fVisibility: public'
        
         annotation = slotAnnotation parse: 'Category: PseudoSlots'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         annotationIfFail: fb = ( |
            | annotation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: programming environment\x7fCategory: changing the contents\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         changeContentsInHolderAndDescendantsTo: mir = ( |
            | 
            childShouldImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | mirror codesMirrorIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | mirror isReflecteeMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         isCodes = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'codes'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (traits fakeSlot)\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHolderForAnnotation: x = ( |
            | error: 'Fake slots cannot be annotated').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMirror: m = ( |
            | clone mirror: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         exists = ( |
            | 
            isApplicable ifFalse: [^ false].
            valueIfFail: [^ false]. true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'expressionStack' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | reflect: mirror expressionStackIfFail: [|:e| ^ failBlock value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'expressionStack' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | 
            mirror isReflecteeActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'expressionStack' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'expressionStack'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'expressionStack' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'file' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | 
            mirror fileMirrorIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'file' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | mirror isReflecteeMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'file' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         isSourceFile = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'file' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'file'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'file' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         index = ( |
            | error: 'Fake slots have no index').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         isAssignable = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         isFake = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'lexicalParent' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | 
            mirror lexicalParentIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'lexicalParent' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | 
               mirror isReflecteeActivation
            || mirror isReflecteeBlockMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'lexicalParent' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         isLexicalParent = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'lexicalParent' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'lexicalParent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'lexicalParent' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'line' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | 
            mirror lineMirrorIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'line' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | mirror isReflecteeMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'line' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         isSourceLine = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'line' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'line'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'line' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'literals' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | mirror literalsMirrorIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'literals' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | mirror isReflecteeMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'literals' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         isLiterals = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'literals' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'literals'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'literals' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         longKey = ( |
            | '<', key, '>').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         longNakedKey = ( |
            | longKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'methodHolder' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | mirror methodHolderIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'methodHolder' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | 
            mirror isReflecteeActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'methodHolder' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'methodHolder'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'methodHolder' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'methodPointer' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | mirror reflecteeMethodPointerIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'methodPointer' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | 
            mirror isReflecteeVector && [mirror reflecteeHasMethodPointer]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'methodPointer' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'methodHolder'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'methodPointer' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         module = ( |
            | mirror creatorSlotIfPresent: [|:s| s module] IfAbsent: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | 
            key).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'position' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | reflect: mirror positionIfFail: [|:e| ^ failBlock value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'position' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | 
            mirror isReflecteeActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'position' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'position'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'position' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'receiver' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | mirror receiverIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'receiver' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | 
            mirror isReflecteeActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'receiver' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'receiver'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'receiver' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'receiver' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         value = ( |
            | mirror receiver).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | mirror reflecteeIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | 
            mirror isReflecteeMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         isReflectee = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'reflectee'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | 
            mirror selectorMirrorIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | 
            mirror isReflecteeActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'selector'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'selector' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sender' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | mirror senderIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sender' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | 
            mirror isReflecteeActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sender' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'sender'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sender' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         sortingOrder = 300.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceLength' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | 
            mirror sourceLengthMirrorIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceLength' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | mirror isReflecteeMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceLength' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         isSourceLength = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceLength' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'sourceLength'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceLength' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceOffset' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | 
            mirror sourceOffsetMirrorIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceOffset' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | mirror isReflecteeMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceOffset' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         isSourceOffset = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceOffset' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'sourceOffset'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceOffset' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceString' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | 
            mirror sourceStringMirrorIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceString' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | mirror isReflecteeMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceString' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         isSourceString = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceString' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'sourceString'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'sourceString' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'stack' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | reflect: mirror stackIfFail: [|:e| ^ failBlock value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'stack' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         isApplicable = ( |
            | 
            mirror isReflecteeProcess).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'stack' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = 'stack'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'stack' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         valueName = ( |
            | exists ifTrue: [resend.valueName] False: '<invalid slot>').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         actualValueIfFail: failBlock = ( |
            | mirror reflecteeMirrorAt: elementIndex IfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: InitializeToExpression: (
slotAnnotation parse: \'Category: Indexable\'
)\x7fVisibility: public'
        
         annotation = 
slotAnnotation parse: 'Category: Indexable'
.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'Category: programming environment\x7fCategory: changing the contents\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         changeContentsInHolderAndDescendantsTo: mir = ( |
            | 
            holder reflecteeAt: elementIndex Put: mir reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         compareKeys: x IfLess: lb Equal: eb Greater: gb = ( |
            | 
            elementIndex compare: x elementIndex
                IfLess: lb  Equal: eb  Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMirror: m ElementIndex: i = ( |
            | (clone mirror: m) elementIndex: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot'
        
         isApplicable = ( |
            | mirror isReflecteeVectorish).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         isVectorElement = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         key = ( |
            | elementIndex printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         keyLessThanKeyOf: s = ( |
            | elementIndex < s elementIndex).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'Comment: Make all names the same length so they will sort--dmu.\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         longKey = ( |
             r.
            | 
            r: key padOnLeft: mirror reflecteeSize pred printString size.
            '<', r, '> ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         menuKey = ( |
            | 
            (longKey, (value nameSize: menuKeySize half))
             copyAtMostWithEllipsis: menuKeySize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fakeSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: private'
        
         sortingOrder = 400.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fakeSlot' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: fakeSlot InitialContents: FollowSlot\x7fVisibility: public'
        
         visibility = bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> ().
        } | ) 



 '-- Side effects'

 globals modules fakeSlot postFileIn
