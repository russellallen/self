#! /lab/bin/perl

# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.

#---------------------------------------------------------------------------
# "convertDefines" package variables
#---------------------------------------------------------------------------
$convertDefines'inFile  = STDIN;
$convertDefines'outFile = STDOUT;


#---------------------------------------------------------------------------
# "convertDefines" package interface
#---------------------------------------------------------------------------
sub convertDefines'stripFromFile {
   package convertDefines;

   ($_[0]) && ($inFile  = $_[0]);
   ($_[1]) && ($outFile = $_[1]);

   local($duringConversion) = 0;
   local($functionDefined)  = 0;
   local($prevLine)         = '';
   local($enumName)         = '';

   while (<$inFile>) {
      if (&isImplemented($_)) {
	 if (/^\#define/ && ($prevLine =~ /typedef\s+\w+\s+(\w+);/)) {
	    $_ = &removeBackSlashes(&eatLinesWhile('&endsWithBackSlash($string)'));
	    $addOn            = ($duringConversion) ? '' : "typedef enum {\n";
	    $enumName         = $1;
	    $duringConversion = 1;
	 }
	 else {
	    $prevLine         = "} $enumName;\n" if $duringConversion;
	    $duringConversion = 0;
	 }
      }

      if ($duringConversion) {
	 print $outFile $addOn, (/^\#define\s+(\w+)\s+(.+)/) ? "    $1 = $2\n" : "$_" unless !(&isImplemented($_));
	 !(&isImplemented($_)) && print $outFile $_;
      }
      else {
	 print $outFile $prevLine;
	 $prevLine = $_;
      }
   }
}


#---------------------------------------------------------------------------
# "convertDefines" package internal routines
#---------------------------------------------------------------------------
sub convertDefines'eatLinesWhile {
   package convertDefines;

   local($expr)   = "while ($_[0]) { chop(\$string); \$string .= <\$inFile>; }";
   local($string) = ($_[1]) ? $_[1] : $_;
 
   eval($expr);
   $string;
}


sub convertDefines'endsWithBackSlash {
   $_[0] =~ /\\\s*$/;
}


sub convertDefines'removeBackSlashes {
   package convertDefines;

   local($string) = $_[0];

   $string =~ s/\\//g;
   $string;
}


sub convertDefines'isImplemented {
   package convertDefines;

   !($_[0] =~ /^NotImplemented!/);
}
 
sub convertDefines'parseCommandLine {
   package convertDefines;

   ($ARGV[0]) 
   && (open($inFile, "<$ARGV[0]") 
      || die "$0 error: Could not open $ARGV[0] for reading\n");
   ($ARGV[1]) 
   && (open($outFile, ">$ARGV[1]") 
      || die "$0 error: Could not open $ARGV[1] for writing\n");
}


#---------------------------------------------------------------------------
# uncomment these lines to allow "convertDefines" package to be run from shell

&convertDefines'parseCommandLine();
&convertDefines'stripFromFile();

1;

# end "convertDefines" package
#---------------------------------------------------------------------------
