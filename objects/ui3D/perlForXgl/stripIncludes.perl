#! /lab/bin/perl

# Copyright 1994 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

#---------------------------------------------------------------------------
# "include" package variables
#---------------------------------------------------------------------------
$include'inFile  = STDIN;
$include'outFile = STDOUT;


#---------------------------------------------------------------------------
# "include" package interface
#---------------------------------------------------------------------------
sub include'stripFromFile {
   package include;

   ($_[0]) && ($inFile  = $_[0]);
   ($_[1]) && ($outFile = $_[1]);

   while (<$inFile>) {
      print $outFile $_ unless (/^\#include/);
   }
}


#---------------------------------------------------------------------------
# "include" package internal routines
#---------------------------------------------------------------------------
sub include'parseCommandLine {
   package include;

   ($ARGV[0]) 
   && (open($inFile, "<$ARGV[0]") 
      || die "$0 error: Could not open $ARGV[0] for reading\n");
   ($ARGV[1]) 
   && (open($outFile, ">$ARGV[1]") 
      || die "$0 error: Could not open $ARGV[1] for writing\n");
}


#---------------------------------------------------------------------------
# uncomment these lines to allow "include" package to be run from shell

&include'parseCommandLine();
&include'stripFromFile();

1;

# end "include" package
#---------------------------------------------------------------------------
