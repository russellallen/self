'Sun-$Revision: 30.8 $'

"Copyright 1992-2012 AUTHORS.
 See the LICENSE file for license information."
 
 
primitiveMaker reader copy staticLinking create: 'transcendental' From: '
 
  -- Copyright 1992-2012 AUTHORS.
  -- See the LICENSE file for license information.

  glueLibraryName: transcendental_glue.o
  macroName:       transcendental


traits: traits number
  visibility: publicSlot
   float sin = float call sin
   float cos = float call cos
   float tan = float call tan

   float arcSin = float call asin
   float arcCos = float call acos
   float arcTan = float call atan
   float arcTan: float = float call atan2

   float sinh = float call sinh
   float cosh = float call cosh
   float tanh = float call tanh

   float arcSinh = float call asinh
   float arcCosh = float call acosh
   float arcTanh = float call atanh

   float squareRoot = float call sqrt
   float raisedTo: float = float call pow

   float exp = float call exp

   float naturalLog = float call log
   float base10Log = float call log10
   float base2Log = float call log2


'
