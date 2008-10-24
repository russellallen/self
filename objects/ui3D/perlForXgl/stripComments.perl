#! /lab/bin/perl

# Copyright 1994 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

#---------------------------------------------------------------------------
# "comments" package variables
#---------------------------------------------------------------------------
$comments'inFile   = STDIN;
$comments'outFile  = STDOUT;
$comments'startSym = '\/\*'; 
$comments'endSym   = '\*\/';


#---------------------------------------------------------------------------
# "comments" interface
#---------------------------------------------------------------------------
sub comments'config {
   package comments;

   $startSym = $_[0];
   $endSym   = $_[1];
}


sub comments'stripFromFile {
   package comments;

   ($_[0]) && ($inFile  = $_[0]);
   ($_[1]) && ($outFile = $_[1]);

   while (<$inFile>) {
      if ($result = &stripFromLine()) {
	 print $outFile $result;
	 print $outFile "\n" unless ($result =~ /\n$/);
      }
   }
}


sub comments'stripFromLine {
   package comments;

   local($line)   = ($_[0] ? $_[0] : $_);
   local($file)   = ($_[1] ? $_[1] : $inFile); 
   local($result) = $line;

   # look for beginning of comment and keep reading until end
   if ($line =~ /(.*)$startSym(.*)/) {
      local($rest) = $2;

      $result = $1;
      ($result =~ /$startSym/) && ($result = &stripFromLine($result, $file));
      $line = $result . $rest;

      if ($line =~ /$endSym(.*)/) {
	 $result .= $1;
      }
      else {
	 do {
	    $line = <$file>;
 	 } while (!($line =~ /$endSym/));
      }
   }

   &isEmpty($result) && return '';
   $result;
}


#---------------------------------------------------------------------------
# "comments" internal routines
#---------------------------------------------------------------------------
sub comments'parseCommandLine {
   package comments;

   ($ARGV[0])
   && (open($inFile, "<$ARGV[0]") 
      || die "$0 error: Could not open $ARGV[0] for reading\n");
   ($ARGV[1])
   && (open($outFile, ">$ARGV[1]") 
      || die "$0 error: Could not open $ARGV[1] for writing\n");
}


sub comments'isEmpty {
   (!$_[0]) || ($_[0] =~ /^\n/) || ($_[0] =~ /^\s+\n*$/);
}


#---------------------------------------------------------------------------
# allow "comments" package to be run from shell

&comments'parseCommandLine();
&comments'stripFromFile();

1;

# end "comments" package
#---------------------------------------------------------------------------
