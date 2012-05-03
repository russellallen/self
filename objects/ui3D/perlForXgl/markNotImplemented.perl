#! /lab/bin/perl

# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.

#---------------------------------------------------------------------------
# "notImplemented" package variables
#---------------------------------------------------------------------------
$notImplemented'inFile  = STDIN;
$notImplemented'outFile = STDOUT;
$notImplemented'NImark  = 'NotImplemented!';


#---------------------------------------------------------------------------
# "notImplemented" package interface
#---------------------------------------------------------------------------
sub notImplemented'config {
   package notImplemented;

   $NImark = $_[0];
}


sub notImplemented'markFile {
   package notImplemented;

   ($_[0]) && ($inFile  = $_[0]);
   ($_[1]) && ($outFile = $_[1]);

   while (<$inFile>) {
      (m|/\*\s*\(*NI\)*|) && print $outFile $NImark;   
   }
   continue {
      print $outFile $_;
   }
}


sub notImplemented'isMarked {
   package notImplemented;

   local($string) = ($_[0]) ? $_[0] : $_; 

   $string =~ /^$NImark/;
}


#---------------------------------------------------------------------------
# "notImplemented" package internal routines
#---------------------------------------------------------------------------
sub notImplemented'parseCommandLine {
   package notImplemented;

   ($ARGV[0]) 
   && (open($inFile, "<$ARGV[0]") 
      || die "$0 error: Could not open $ARGV[0] for reading\n");
   ($ARGV[1]) 
   && (open($outFile, ">$ARGV[1]") 
      || die "$0 error: Could not open $ARGV[1] for writing\n");
}


#---------------------------------------------------------------------------
# allow "notImplemented" package to be run from shell

&notImplemented'parseCommandLine();
&notImplemented'markFile();

1;

# end "notImplemented" package
#---------------------------------------------------------------------------
