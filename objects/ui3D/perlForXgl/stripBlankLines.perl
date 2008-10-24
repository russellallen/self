#! /lab/bin/perl

# Copyright 1994 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

#---------------------------------------------------------------------------
# "blankLine" package variables
#---------------------------------------------------------------------------
$blankLine'inFile  = STDIN;
$blankLine'outFile = STDOUT;


#---------------------------------------------------------------------------
# "blankLine" package interface
#---------------------------------------------------------------------------
sub blankLine'stripFromFile {
   package blankLine;

   ($_[0]) && ($inFile  = $_[0]);
   ($_[1]) && ($outFile = $_[1]);

   while (<$inFile>) {
      print $outFile $_ unless (!$_ || /^\n$/ || /^\s+\n*$/);
   }
}


#---------------------------------------------------------------------------
# "blankLine" package internal routines
#---------------------------------------------------------------------------
sub blankLine'parseCommandLine {
   package blankLine;

   ($ARGV[0]) 
   && (open($inFile, "<$ARGV[0]") 
      || die "$0 error: Could not open $ARGV[0] for reading\n");
   ($ARGV[1]) 
   && (open($outFile, ">$ARGV[1]") 
      || die "$0 error: Could not open $ARGV[1] for writing\n");
}


#---------------------------------------------------------------------------
# allow "blankLine" package to be run from shell

&blankLine'parseCommandLine();
&blankLine'stripFromFile();

1;

# end "blankLine" package
#---------------------------------------------------------------------------
