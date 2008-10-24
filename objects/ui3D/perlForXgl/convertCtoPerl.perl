#! /lab/bin/perl

# Copyright 1994 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

#---------------------------------------------------------------------------
#  "convertC" package variables
#---------------------------------------------------------------------------
$convertC'inFile       = STDIN;
$convertC'outFile      = STDOUT;

%convertC'cBaseTypes   = ('char',        'char',
                           'char*',       'string',
                           'short',       'short',
                           'int',         'int',
                           'long',        'long',
                           'float',       'float',
                           'double',      'double',
                           'unsigned',    'unsigned_int');
%convertC'xglBaseTypes = ('Xgl_sgn32',   'long',
                           'Xgl_fract',   'long',
                           'Xgl_usgn32',  'unsigned_long',
                           'Xgl_sgn16',   'short',
                           'Xgl_usgn16',  'unsigned_short',
                           'Xgl_sgn8',    'char',
                           'Xgl_usgn8',   'unsigned_char',
                           'Xgl_boolean', 'bool');

%convertC'structTypes  = ();
%convertC'unionTypes   = ();
%convertC'enumTypes    = ();
%convertC'otherTypes   = ();


#---------------------------------------------------------------------------
#  main algorithm
#---------------------------------------------------------------------------
sub convertC'parseFile {
   package convertC;

   while (<$inFile>) {
       next if &isNotImplemented($_);

       if (&startStruct($_)) {
	  @result                   = &parseStruct();
	  $structTypes{$result[0]} .= $result[1];
       }
       elsif (&startUnion($_)) {
	  @result                  = &parseStruct();
	  $unionTypes{$result[0]} .= $result[1];
       }
       elsif (&startEnum($_)) {
	  @result                 = &parseEnum();
	  $enumTypes{$result[0]} .= $result[1];
       }
       elsif (&isTypedef($_)) {
	  @result                  = &parseOthers($_);
	  $otherTypes{$result[0]} .= $result[1];
       }
       else {
	  print STDERR "Did not recognize line: $_";
      }
   }

   &printAll('deep');
}


#---------------------------------------------------------------------------
#  "convertC" package internal routines
#---------------------------------------------------------------------------
sub convertC'parseCommandLine {
   package convertC;
 
   ($ARGV[0]) 
   && (open($inFile, "<$ARGV[0]") 
      || die "$0 error: Could not open $ARGV[0] for reading\n");
   ($ARGV[1]) 
   && (open($outFile, ">$ARGV[1]") 
      || die "$0 error: Could not open $ARGV[1] for writing\n");
}


sub convertC'parseStruct {
   package convertC;
 
   local($fields)   = '';

   while (<$inFile>) {
      next if &isNotImplemented($_);

      if (&startStruct($_)) {
	 local(@result) =  &parseStruct();
	 $result[1]     =~ s/\n/\n  /g;
	 $fields       .=  "    '$result[0]' => [ STRUCT_DEF, {\n  $result[1]  } ],\n"; 
      }
      elsif (&startUnion($_)) {
	 local(@result) =  &parseStruct();
	 $result[1]     =~ s/\n/\n  /g;
	 $fields       .=  "    '$result[0]' => [ UNION_DEF, {\n  $result[1]  } ],\n"; 
      }
      elsif (/}\s+(\w+)/) {
         local($name) = $1;
         ($name eq 'Xgl_pt_position') && ($fields =~ s/VEC/PTR/g);
	 return ($name, $fields);
      }
      elsif (/(\w+)\s*(\*?)\s*([\w\s,]*)\s*([\[\d\]]*)/) {
	 ($3) && ($type = "$1$2" . (($4) ? "[" . &countArrayItems($4) . "]" : ''));
	 $whichOne          = &classifyType($type);
         ($type, $whichOne) = &expandType($type) if ($unionTypes{$type});

	 $foo = (($3) ? $3 : $1);
	 do {
	    $foo     =~ s/(\w+),*\s*(.*)/$2/;
	    $fields .=  "    '$1' => [ $whichOne, " . &cleanupType($type) . " ],\n";
	 } while ($2);
     }
   }
}


sub convertC'parseEnum {
   package convertC;
 
   local($enums)  = '';
   local($count)  = 0;

   while (<$inFile>) {
      next if &isNotImplemented($_);

      if (/}\s+(\w+)/) {
         return ($1, $enums);
      }
      elsif (/(\w+)\s*=?\s*([^,]*)/) {
	 if ($2) {
	     $foo   =  $2;
	     $foo   =~ s/(XGL_[A-Z_]+)/\$$1/g;
	     $count =  eval($foo);
	 }
	 $enums .= "   $1 => $count,\n";
	 eval("\$$1 = $count");
      }
   }
   continue {
      $count++;
   }
}


sub convertC'parseOthers {
   package convertC;

   local($string) = $_[0];
 
   $string =~ s/typedef\s+//;
   $string =~ /(\w+)\s*(\*?)\s*(\w+)\s*([\[\d*\]]*)/;
   $name   =  $3;
   $data   =  "$1$2$4";

   ($name, $data);
}


sub convertC'classifyType {
   package convertC;

   local($type) = $_[0];
   local($ptr)  = '';

   ($type eq 'char*')                   && return 'BASIC';
   ($type eq 'void*')                   && return 'VOID_PTR';
   ($type eq 'Xgl_object')              && return 'VOID_PTR'; 

   ($type =~ s/\*$//)                   && ($ptr = '_PTR');
   ($type =~ s/\[(\d+)\]//)             && ($ptr = '_VEC'); 

   ($cBaseTypes{$type})                 && return "BASIC$ptr";
   ($xglBaseTypes{$type})               && return "BASIC$ptr";
   ($enumTypes{$type})                  && return "ENUM$ptr";
   ($structTypes{$type})                && return "STRUCT$ptr";
   ($unionTypes{$type})                 && return "UNION$ptr";

   &classifyType($otherTypes{$type});
}


sub convertC'cleanupType {
   package convertC;

   local($type) = $_[0];

   ($type eq 'char*')       && return "'string'";
   ($type eq 'Xgl_object')  && return "'Xgl_object_obj'"; 

   ($type =~ s/\*$//);
   ($type =~ s/\[\d+\]//);

   ($cBaseTypes{$type})     && return "'$cBaseTypes{$type}'";
   ($xglBaseTypes{$type})   && return "'$xglBaseTypes{$type}'";
   ($otherTypes{$type})     && return &cleanupType($otherTypes{$type});

   ($type =~ /{/) ? $type : "'$type'";
}


sub convertC'expandType {
   package convertC;

   local($type) = $_[0];

   $type =  "{\n$unionTypes{$type}  }";
   $type =~ s/\n/\n  /g;
   ($type, 'UNION_DEF');
}

#---------------------------------------------------------------------------
#  utility functions
#---------------------------------------------------------------------------
sub convertC'startStruct {
   $_[0] =~ /^(typedef)*\s+struct\s+/;
}

sub convertC'startUnion {
   $_[0] =~ /^(typedef)*\s+union\s+/;
}

sub convertC'startEnum {
   $_[0] =~ /^typedef\s+enum\s+/;
}

sub convertC'isTypedef {
   $_[0] =~ /^typedef\s+/;
}

sub convertC'isNotImplemented {
   $_[0] =~ /^NotImplemented!/;
}

sub convertC'countArrayItems {
   package convertC;

   local($type)   = $_[0];
   local($result) = 0;

   ($type =~ s/\[(\d+)\]//) && ($result = $1);
   while ($type =~ s/\[(\d+)\]//) {
      $result *= $1;
   }

   $result;
}


#---------------------------------------------------------------------------
#  debugging routines
#---------------------------------------------------------------------------
sub convertC'printAll {
   package convertC;

   local($printType)   = shift;

   print $outFile "\$cTypesRef = {\n";
   &printStuff('structTypes', 'STRUCT_DEF', $printType);
   # unions cause problems, so only print the ones we need
   &printStuff('unionTypes', 'UNION_DEF', $printType, 'Xgl_color');
   &printStuff('unionTypes', 'UNION_DEF', $printType, 'Xgl_facet');
   &printStuff('unionTypes', 'UNION_DEF', $printType, 'Xgl_obj_desc');
   &printStuff('enumTypes', 'ENUM_DEF', $printType);
   foreach $key (sort(keys(%otherTypes))) {
      if ($otherTypes{$key} =~ /\[\d+\]/) {
	 print $outFile "  $key => [ TYPE_DEF, ";
	 if ($printType eq 'deep') { 
	    ($tmpType = $otherTypes{$key}) =~ s/Xgl_sgn32/long/;
	    print $outFile "'$tmpType'";
	 }
	 print $outFile " ],\n";
      }
   }
   print $outFile "};\n";
}

sub convertC'printStuff {
   package convertC;

   local($whatToPrint) = shift;
   local($header)      = shift;
   local($printType)   = shift;
   local($filterKey)   = shift;
   local(%assocArray)  = eval("%$whatToPrint");

   foreach $key (sort(keys(%assocArray))) {
      if (!$filterKey || ($key =~ /$filterKey/)) {
	 print $outFile "  $key => [ $header, {\n";
	 ($printType eq 'deep') && print $outFile $assocArray{$key};
	 print $outFile "  } ],\n";
      }
   }
}


#---------------------------------------------------------------------------
# uncomment these lines to allow "convertC" package to be run from shell
 
&convertC'parseCommandLine();
&convertC'parseFile();
 
1;
 
# end "notImplemented" package
#---------------------------------------------------------------------------
