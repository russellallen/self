#! /self/bin/svr4/perl5 -I${SELF_WORKING_DIR}/objects/ui3D/perlForXgl

# Copyright 1994 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

#---------------------------------------------------------------------------
# "printTemplates" package requires
#---------------------------------------------------------------------------
package printTemplates;
require 'utilFuncs.perl';

#---------------------------------------------------------------------------
# "printTemplates" package variables
#---------------------------------------------------------------------------
$printTemplates::inFile  = STDIN;
$printTemplates::outFile = STDOUT;

#---------------------------------------------------------------------------
# "printTemplates" main routine
#---------------------------------------------------------------------------
sub printTemplates::printAllTemplates {
   package printTemplates;

   $foo = '';
   while (<$inFile>) {
      chop;
      $foo .= $_;
   }
   eval($foo);

   foreach $name (sort(keys(%$cTypesRef))) {
      local($printFunc) = $cTypesRef->{$name}[0] . 'printSelfTemplate';
      if (defined(&$printFunc)) {
	 &$printFunc($name, $cTypesRef->{$name}[1]);
      }
   }
}


#---------------------------------------------------------------------------
# general print routines
#---------------------------------------------------------------------------
sub printTemplates::printDefintionHeader {
   package printTemplates;

   my($name)     = shift;
   my($selfName) = &CtoSelfName($name);
   my($lcName)   = &makeLowercase($name);

   print $outFile "traits: traits windowing xgl raw $selfName\n";
   print $outFile "  -- creation and deletion messages\n";
   print $outFile "  visibility: publicSlot\n";
   print $outFile "   void new: unsigned_int = $name {xgl $selfName deadCopy} call $lcName", "_new\n";
   print $outFile "   $name delete = void call $lcName", "_delete\n\n";

   print $outFile "  -- create nil proxy\n";
   print $outFile "  visibility: publicSlot\n";
   print $outFile "   void nil", &capitalize($selfName), " = proxy_null $name* $name", "_seal {xgl $selfName deadCopy} get NULL\n\n";

   print $outFile "  -- vector-ish messages\n";
   print $outFile "  visibility: publicSlot\n";
   print $outFile "   $name at: unsigned_int = proxy_null $name* $name", "_seal {xgl $selfName deadCopy} call $lcName", "_at\n";
   print $outFile "   $name at: unsigned_int Put: $name = void call $lcName", "_at_put\n\n";

   print $outFile "  -- accessor messages\n";
   print $outFile "  visibility: publicSlot\n";
}


#---------------------------------------------------------------------------
# printers for *_DEF types
#---------------------------------------------------------------------------
# sub printTemplates::ENUM_DEFprintSetParameter        {} # no-op
# sub printTemplates::ENUM_DEFprintSelfTemplate        {} # no-op

sub printTemplates::STRUCT_DEFprintSetParameter {
   package printTemplates;
 
   my($structName)   = shift;
   my($structFields) = shift;
   my(@parents)      = @_;
 
   my(@tmpFields)    = sort(keys(%$structFields));
   $field            = shift(@tmpFields);
   do {
      local($printFunc) = $structFields->{$field}[0] . 'printSetParameter';
      if (defined(&$printFunc)) {
	 &$printFunc($field, $structFields->{$field}[1], @parents, $structName);
	 print $outFile " \\\n\t" if ($field = shift(@tmpFields));
      }
   } while ($field);
 
   1;
}
 
sub printTemplates::STRUCT_DEFprintSelfTemplate {
   package printTemplates;

   my($structName)     = shift;
   my($structFields)   = shift;
   my(@parents)        = @_;

   if (!@parents) {
      &printDefintionHeader($structName);
   }

   my($fieldCount)     = 0;
   foreach $field (sort(keys(%$structFields))) {
      local($printFunc) = $structFields->{$field}[0] . 'printSelfTemplate';
      if (defined(&$printFunc)) {
	 $fieldCount += &$printFunc($field, $structFields->{$field}[1], @parents, $structName);
      }
   }

   if (!@parents) {
      if (($fieldCount < 9) && ($fieldCount > 2)) {
         local($done) = 1;
	 print $outFile "  -- efficiency message: set a bunch of fields at once\n";
	 print $outFile "  visibility: publicSlot\n";
         do {
            $done = 1;
	    print $outFile "   $structName set_";
	    foreach $field (sort(keys(%$structFields))) {
	       local($printFunc) = $structFields->{$field}[0] . 'printSetParameter';
	       if (defined(&$printFunc)) {
		  $done &= &$printFunc($field, $structFields->{$field}[1], @parents, $structName);
		  print $outFile " \\\n\t";
	       }
	    }
	    print $outFile " = void call ", &makeLowercase($structName), "_set\n\n";
         } while (!$done);
      }
      print $outFile "\n";
   }

   $fieldCount;
}


# sub printTemplates::TYPE_DEFprintSetParameter {} # no-op
sub printTemplates::TYPE_DEFprintSelfTemplate {
   package printTemplates;

   my($typeName)  = shift;
   my($typeField) = shift;
   my(@parents)   = @_;

   if (!@parents) {
      local($lcTypeName) =  &makeLowercase($typeName);
      $typeField         =~ s/\[\d+\]//g;

      &printDefintionHeader($typeName);

      print $outFile "   $typeName row: unsigned_int Column: unsigned_int = $typeField call $lcTypeName", "_row_column\n";
      print $outFile "   $typeName row: unsigned_int Column: unsigned_int Put: $typeField = void call $lcTypeName", "_row_column_put\n\n";
      print $outFile "\n";
   }

   1;
}


sub printTemplates::UNION_DEFprintSetParameter {
   package printTemplates;

   my($unionName)    = shift;
   my($unionFields)  = shift;
   my(@parents)      = @_;

   my($done)            = 1;
 
   my($unionFieldNames) = $unionName . 'Fields'; 
   eval("@$unionFieldNames = sort(keys(%\$unionFields)) if (!@$unionFieldNames)");
 
   if ($field = eval("shift(@$unionFieldNames)")) {
      local($printFunc) = $unionFields->{$field}[0] . 'printSetParameter';
      if (defined(&$printFunc)) {
         $done &= &$printFunc($field, $unionFields->{$field}[1], @parents, $unionName);
      }
   }
   else {
      eval("@$unionFieldNames = ()");
   }
 
   eval("$done & ((@$unionFieldNames) ? 0 : 1)");
}

sub printTemplates::UNION_DEFprintSelfTemplate {
   package printTemplates;

   my($unionName)      = shift;
   my($unionFields)    = shift;
   my(@parents)        = @_;

   if (!@parents) {
      &printDefintionHeader($unionName);
   }

   my(@fieldCount) = ();
   foreach $field (sort(keys(%$unionFields))) {
      local($printFunc) = $unionFields->{$field}[0] . 'printSelfTemplate';
      if (defined(&$printFunc)) {
	 @fieldCount = (@fieldCount, 
			&$printFunc($field, $unionFields->{$field}[1], @parents, $unionName));
      }
   }

   if (!@parents) {
      print $outFile "\n";
   }
       
   (sort(@fieldCount))[$#fieldCount];
}


#---------------------------------------------------------------------------
# printers for *_PTR types
#---------------------------------------------------------------------------
sub printTemplates::BASIC_PTRprintSetParameter {
   package printTemplates;

   my($basicName)    = shift;
   my($basicType)    = shift;
   my(@parents)      = @_;

   my($receiver)     = shift(@parents);
   my($selfAccessor) = &capitalize(((@parents) ? join('_', @parents) . '_' : '') . $basicName);

   print $outFile "$selfAccessor: any $basicType*";

   1;
}

sub printTemplates::BASIC_PTRprintSelfTemplate {
   package printTemplates;

   my($basicName)     = shift;
   my($basicType)     = &capitalize(shift) . '_vec_proxy';
   my(@parents)       = @_;

   my($selfBasicType) = &CtoSelfName($basicType);

   my($receiver)      = shift(@parents);
   my($selfAccessor)  = &makeLowercase(((@parents) ? join('_', @parents) . '_' : '') . $basicName);
   my($cAccessor)     = &makeLowercase(((@parents) ? $receiver . '_' . join('_', @parents) . '_' : '')) . $basicName;
   my($primType)      = (@parents) ? 'call' : 'getMember';

   print $outFile "   $receiver $selfAccessor = $basicType {xgl $selfBasicType deadCopy} $primType $cAccessor\n";
   $primType =~ s/get/set/;
   print $outFile "   $receiver $selfAccessor: $basicType = void $primType $cAccessor\n";
   print $outFile "\n";

   1;
}


sub printTemplates::STRUCT_PTRprintSetParameter {
   package printTemplates;

   my($structName)   = shift;
   my($structType)   = shift;
   my(@parents)      = @_;

   my($receiver)     = shift(@parents);
   my($selfAccessor) = &capitalize(((@parents) ? join('_', @parents) . '_' : '') . $structName);

   print $outFile "$selfAccessor: proxy_null $structType* $structType", "_seal";

   1;
}

sub printTemplates::STRUCT_PTRprintSelfTemplate {
   package printTemplates;

   my($structName)     = shift;
   my($structType)     = shift;
   my(@parents)        = @_;

   my($selfStructName) = &CtoSelfName($structType);

   my($receiver)       = shift(@parents);
   my($selfAccessor)   = &makeLowercase(((@parents) ? join('_', @parents) . '_' : '') . $structName);
   my($cAccessor)      = &makeLowercase(((@parents) ? $receiver . '_' . join('_', @parents) . '_' : '')) . $structName;
   my($primType)       = (@parents) ? 'call' : 'getMember';

   print $outFile "   $receiver $selfAccessor = $structType {xgl $selfStructName deadCopy} $primType $cAccessor\n";
   $primType =~ s/get/set/;
   print $outFile "   $receiver $selfAccessor: proxy_null $structType* $structType", "_seal = void $primType $cAccessor\n";
   print $outFile "\n";

   1;
}


sub printTemplates::UNION_PTRprintSetParameter {
   package printTemplates;

   my($unionName)    = shift;
   my($unionType)    = shift;
   my(@parents)      = @_;

   my($receiver)     = shift(@parents);
   my($selfAccessor) = &capitalize(((@parents) ? join('_', @parents) . '_' : '') . $unionName);

   print $outFile "$selfAccessor: proxy_null $unionType* $unionType", "_seal";

   1;
}

sub printTemplates::UNION_PTRprintSelfTemplate {
   package printTemplates;

   my($unionName)      = shift;
   my($unionType)      = shift;
   my(@parents)        = @_;

   my($selfUnionName) = &CtoSelfName($unionType);

   my($receiver)       = shift(@parents);
   my($selfAccessor)   = &makeLowercase(((@parents) ? join('_', @parents) . '_' : '') . $unionName);
   my($cAccessor)      = &makeLowercase(((@parents) ? $receiver . '_' . join('_', @parents) . '_' : '')) . $unionName;
   my($primType)       = (@parents) ? 'call' : 'getMember';

   print $outFile "   $receiver $selfAccessor = $unionType {xgl $selfUnionName deadCopy} $primType $cAccessor\n";
   $primType =~ s/get/set/;
   print $outFile "   $receiver $selfAccessor: proxy_null $unionType* $unionType", "_seal = void $primType $cAccessor\n";
   print $outFile "\n";

   1;
}


sub printTemplates::VOID_PTRprintSetParameter {
   package printTemplates;

   my($name)         = shift;
   my($type)         = shift;
   my(@parents)      = @_;

   my($receiver)     = shift(@parents);
   my($selfAccessor) = &capitalize(((@parents) ? join('_', @parents) . '_' : '') . $name);

   my($param)        = ($name eq 'X_display') ? 'proxy void* Display_seal'        
                       : ($selfAccessor eq 'win_ras_desc') ? 'proxy void* Xgl_X_window_seal'   
                       : ($selfAccessor eq 'stream_desc') ? 'proxy void* Xgl_stream_info_seal'
		       : 'Xgl_object_obj'; 

   print $outFile "$selfAccessor: $param";

   1;
}

sub printTemplates::VOID_PTRprintSelfTemplate {
   package printTemplates;

   my($name)         = shift;
   my($type)         = shift;
   my(@parents)      = @_;

   my($receiver)     = shift(@parents);
   my($selfAccessor) = &makeLowercase(((@parents) ? join('_', @parents) . '_' : '') . $name);
   my($cAccessor)    = &makeLowercase(((@parents) ? $receiver . '_' . join('_', @parents) . '_' : '')) . $name;
   my($primType)     = (@parents) ? 'call' : 'getMember';

   my($param)        = ($name eq 'X_display') ? 'proxy void* Display_seal'        
                       : ($selfAccessor eq 'win_ras_desc') ? 'proxy void* Xgl_X_window_seal'   
                       : ($selfAccessor eq 'stream_desc') ? 'proxy void* Xgl_stream_info_seal'
		       : 'Xgl_object_obj'; 
   my($result)       = ($name eq 'X_display') ? "$param {xlib display deadCopy}"  
                       : ($selfAccessor eq 'win_ras_desc') ? "$param {xgl xWindow deadCopy}"
                       : ($selfAccessor eq 'stream_desc') ? "$param {xgl streamInfo deadCopy}"
		       : "$param {xgl genericObject deadCopy}"; 

   print $outFile "   $receiver $selfAccessor = $result $primType $cAccessor\n";
   $primType =~ s/get/set/;
   print $outFile "   $receiver $selfAccessor: $param = void $primType $cAccessor\n";
   print $outFile "\n";

   1;
}


#---------------------------------------------------------------------------
# printers for *_VEC types
#---------------------------------------------------------------------------
# sub printTemplates::BASIC_VECprintSetParameter {} # no-op
sub printTemplates::BASIC_VECprintSelfTemplate {
   package printTemplates;

   my($basicName)     = shift;
   my($basicType)     = &capitalize(shift) . '_vec_proxy';
   my(@parents)       = @_;

   my($selfBasicType) = &CtoSelfName($basicType);

   my($receiver)      = shift(@parents);
   my($selfAccessor)  = &makeLowercase(((@parents) ? join('_', @parents) . '_' : '') . $basicName);
   my($cAccessor)     = &makeLowercase($receiver . '_' . ((@parents) ? join('_', @parents) . '_' : '')) . $basicName;

   print $outFile "   $receiver $selfAccessor = $basicType {xgl $selfBasicType deadCopy} call $cAccessor\n";
   print $outFile "\n";

   0;
}


# sub printTemplates::STRUCT_VECprintSetParameter {} # no-op
sub printTemplates::STRUCT_VECprintSelfTemplate {
   package printTemplates;

   my($structName)     = shift;
   my($structType)     = shift;
   my(@parents)        = @_;
   
   my($selfStructType) = &CtoSelfName($structType);

   my($receiver)       = shift(@parents);
   my($selfAccessor)   = &makeLowercase(((@parents) ? join('_', @parents) . '_' : '') . $structName);
   my($cAccessor)      = &makeLowercase($receiver . '_' . ((@parents) ? join('_', @parents) . '_' : '')) . $structName;

   print $outFile "   $receiver $selfAccessor = $structType {xgl $selfStructType deadCopy} call $cAccessor\n";
   print $outFile "\n";

   0;
}


#---------------------------------------------------------------------------
# printers for non_PTR types
#---------------------------------------------------------------------------
sub printTemplates::BASICprintSetParameter {
   package printTemplates;

   my($basicName)    = shift;
   my($basicType)    = shift;
   my(@parents)      = @_;

   my($receiver)     = shift(@parents);
   my($selfAccessor) = &capitalize(((@parents) ? join('_', @parents) . '_' : '') . $basicName);

   print $outFile "$selfAccessor: $basicType";

   1;
}

sub printTemplates::BASICprintSelfTemplate {
   package printTemplates;

   my($basicName)    = shift;
   my($basicType)    = shift;
   my(@parents)      = @_;

   my($receiver)     = shift(@parents);
   my($selfAccessor) = &makeLowercase(((@parents) ? join('_', @parents) . '_' : '') . $basicName);
   my($cAccessor)    = &makeLowercase(((@parents) ? $receiver . '_' . join('_', @parents) . '_' : '')) . $basicName;
   my($primType)     = (@parents) ? 'call' : 'getMember';

   print $outFile "   $receiver $selfAccessor = $basicType $primType $cAccessor\n";
   $primType =~ s/get/set/;
   print $outFile "   $receiver $selfAccessor: $basicType = void $primType $cAccessor\n";
   print $outFile "\n";

   1;
}


sub printTemplates::ENUMprintSetParameter {
   package printTemplates;

   my($enumName)     = shift;
   my($enumType)     = shift;
   my(@parents)      = @_;

   my($receiver)     = shift(@parents);
   my($selfAccessor) = &capitalize(((@parents) ? join('_', @parents) . '_' : '') . $enumName);

   print $outFile "$selfAccessor: any $enumType";

   1;
}

sub printTemplates::ENUMprintSelfTemplate {
   package printTemplates;

   my($enumName)     = shift;
   my($enumType)     = shift;
   my(@parents)      = @_;

   my($receiver)     = shift(@parents);
   my($selfAccessor) = &makeLowercase(((@parents) ? join('_', @parents) . '_' : '') . $enumName);
   my($cAccessor)    = &makeLowercase(((@parents) ? $receiver . '_' . join('_', @parents) . '_' : '')) . $enumName;
   my($primType)     = (@parents) ? 'call' : 'getMember';

   print $outFile "   $receiver $selfAccessor = any $enumType $primType $cAccessor\n";
   $primType =~ s/get/set/;
   print $outFile "   $receiver $selfAccessor: any $enumType = void $primType $cAccessor\n";
   print $outFile "\n";

   2;
}


sub printTemplates::STRUCTprintSetParameter {
   package printTemplates;

   my($structName)   = shift;
   my($structType)   = shift;
   my(@parents)      = @_;

   my($receiver)     = shift(@parents);
   my($selfAccessor) = &capitalize(((@parents) ? join('_', @parents) . '_' : '') . $structName);

   print $outFile "$selfAccessor: $structType";

   1;
}

sub printTemplates::STRUCTprintSelfTemplate {
   package printTemplates;

   my($structName)     = shift;
   my($structType)     = shift;
   my(@parents)        = @_;

   my($selfStructName) = &CtoSelfName($structType);

   my($receiver)       = shift(@parents);
   my($selfAccessor)   = &makeLowercase(((@parents) ? join('_', @parents) . '_' : '') . $structName);
   my($cAccessor)      = &makeLowercase($receiver . '_' . ((@parents) ? join('_', @parents) . '_' : '')) . $structName;

   print $outFile "   $receiver $selfAccessor = $structType {xgl $selfStructName deadCopy} call $cAccessor\n";
   $primType =~ s/get/set/;
   print $outFile "   $receiver $selfAccessor: $structType = void call $cAccessor\n";
   print $outFile "\n";

   1;
}


# sub printTemplates::UNIONprintSetParameter           {} # no-op
# sub printTemplates::UNIONprintSelfTemplate           {} # no-op


#---------------------------------------------------------------------------
# internal routines
#---------------------------------------------------------------------------
sub printTemplates::parseCommandLine {
   package printTemplates;

   ($ARGV[0]) 
   && (open($inFile, "<$ARGV[0]") 
      || die "$0 error: Could not open $ARGV[0] for reading\n");
   ($ARGV[1]) 
   && (open($outFile, ">$ARGV[1]") 
      || die "$0 error: Could not open $ARGV[1] for writing\n");
}

sub printTemplates::printHeader {
   package printTemplates;

#    print $outFile <<EndOfHeader;
# "This file was generated from the xgl header file.
#  Do NOT edit this file by hand!
#  Note that because there is currently a fixed limit on the size of strings
#  in the parser, you will need to add a concatenation operator(,) every 1,000
#  lines (or so) for it to parse correctly."
# 
# "Copyright 1994 Sun Microsystems, Inc. and Stanford University.
#  See the LICENSE file for license information."
# 
# "CAUTION: This file is not part of the documented Self world.  It may be
#  be changed or removed at any time, and it will not be documented.
#  This file can be removed without affecting the Self world in any way."
# 
# "Templates used by primitiveMaker to create xgl primitives."
# 
# 
# primitiveMaker reader copy dynamicLinking create: 'xgl' From: '
#    -- Copyright 1994 Sun Microsystems, Inc. and Stanford University.
#    -- See the LICENSE file for license information.
# 
#    macroName:          xgl
#    glueLibraryName:    xgl_glue.so
    print $outFile <<EndOfHeader;


EndOfHeader
}

sub printTemplates::printFooter {
   package printTemplates;

   print $outFile <<EndOfFooter;
traits: traits windowing xgl raw intVecProxy
  -- creation/deletion messages
  visibility: publicSlot
   void new: unsigned_int = Int_vec_proxy {xgl intVecProxy deadCopy} call int_vec_proxy_new
   Int_vec_proxy delete = void call int_vec_proxy_delete

  -- vector-ish messages
  visibility: publicSlot
   Int_vec_proxy at: unsigned_int = int call int_vec_proxy_at
   Int_vec_proxy at: unsigned_int Put: int = void call int_vec_proxy_at_put
 
 
traits: traits windowing xgl raw longVecProxy
  -- creation/deletion messages
  visibility: publicSlot
   void new: unsigned_int = Long_vec_proxy {xgl longVecProxy deadCopy} call long_vec_proxy_new
   Long_vec_proxy delete = void call long_vec_proxy_delete

  -- vector-ish messages
  visibility: publicSlot
   Long_vec_proxy at: unsigned_int = long call long_vec_proxy_at
   Long_vec_proxy at: unsigned_int Put: long = void call long_vec_proxy_at_put
 
 
traits: traits windowing xgl raw floatVecProxy
  -- creation/deletion messages
  visibility: publicSlot
   void new: unsigned_int = Float_vec_proxy {xgl floatVecProxy deadCopy} call float_vec_proxy_new
   Float_vec_proxy delete = void call float_vec_proxy_delete

  -- vector-ish messages
  visibility: publicSlot
   Float_vec_proxy at: unsigned_int = float call float_vec_proxy_at
   Float_vec_proxy at: unsigned_int Put: float = void call float_vec_proxy_at_put
 
 
traits: traits windowing xgl raw doubleVecProxy
  -- creation/deletion messages
  visibility: publicSlot
   void new: unsigned_int = Double_vec_proxy {xgl doubleVecProxy deadCopy} call double_vec_proxy_new
   Double_vec_proxy delete = void call double_vec_proxy_delete

  -- vector-ish messages
  visibility: publicSlot
   Double_vec_proxy at: unsigned_int = double call double_vec_proxy_at
   Double_vec_proxy at: unsigned_int Put: double = void call double_vec_proxy_at_put
 
 
traits: traits windowing xgl raw unsignedCharVecProxy
  -- creation/deletion messages
  visibility: publicSlot
   void new: unsigned_int = Unsigned_char_vec_proxy {xgl unsignedCharVecProxy deadCopy} call unsigned_char_vec_proxy_new
   Unsigned_char_vec_proxy delete = void call unsigned_char_vec_proxy_delete

  -- vector-ish messages
  visibility: publicSlot
   Unsigned_char_vec_proxy at: unsigned_int = unsigned_char call unsigned_char_vec_proxy_at
   Unsigned_char_vec_proxy at: unsigned_int Put: unsigned_char = void call unsigned_char_vec_proxy_at_put
 
'
EndOfFooter
}


#---------------------------------------------------------------------------
# uncomment these lines to allow "printTemplates" package to be run from shell
 
&printTemplates::parseCommandLine();
&printTemplates::printHeader();
&printTemplates::printAllTemplates();
&printTemplates::printFooter();
 
1;
 
# end "notImplemented" package
#---------------------------------------------------------------------------
