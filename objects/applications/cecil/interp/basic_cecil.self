"Sun-$Revision: 9.1 $"

" name spaces "

traits  applications _AddSlotsIfAbsent: ( | ^ cecil_interp* = () | )
globals applications _AddSlotsIfAbsent: ( | ^ cecil_interp* = () | )
mixins		     _AddSlotsIfAbsent: ( | ^ applications* = () | )
mixins  applications _AddSlotsIfAbsent: ( | ^ cecil_interp* = () | )

'errMsg.self'       _RunScript

'type.self'         _RunScript
'sig.self'	    _RunScript
'specObjects.self'  _RunScript
'cecilObject.self'  _RunScript
'cecilMethod.self'  _RunScript
'ast.self'	    _RunScript

'cecilContext.self' _RunScript
'binding.self'      _RunScript

'partialOrder.self' _RunScript
'methodLookup.self' _RunScript
'methodCache.self'  _RunScript

'interface.self'    _RunScript
'token.self'        _RunScript
'scanner.self'      _RunScript
'cecilParser.self'  _RunScript
'cecilInterp.self'  _RunScript

'resolve.self'      _RunScript
'typeCheck.self'    _RunScript
'interpreter.self'  _RunScript
'compiler.self'     _RunScript

pathCache refill
memory releaseObjectIDs
history freeResults

cecil_interpreter
