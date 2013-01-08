#! /self/bin/svr4/perl5 -I${SELF_WORKING_DIR}/objects/ui3D/perlForXgl

# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.

#---------------------------------------------------------------------------
# "printDefinitions" package requires
#---------------------------------------------------------------------------
package printDefinitions;
require 'utilFuncs.perl';

#---------------------------------------------------------------------------
# "printDefinitions" package variables
#---------------------------------------------------------------------------
$printDefinitions::inFile  = STDIN;
$printDefinitions::outFile = STDOUT;

#---------------------------------------------------------------------------
# "printDefinitions" main routine
#---------------------------------------------------------------------------
sub printDefinitions::printAllDefinitions {
   package printDefinitions;

   $foo = '';
   while (<$inFile>) {
      chop;
      $foo .= $_;
   }
   eval($foo);

   foreach $name (sort(keys(%$cTypesRef))) {
      local($printFunc) = $cTypesRef->{$name}[0] . 'printSelfDefinition';
      if (defined(&$printFunc)) {
	 &$printFunc($name, $cTypesRef->{$name}[1]);
      }
   }
}


#---------------------------------------------------------------------------
# general print routines
#---------------------------------------------------------------------------
sub printDefinitions::printTraits {
   package printDefinitions;

   my($name)   = shift;
   my($notNew) = shift;
   
   print $outFile "bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|\n";
   print $outFile "  $name = (|\n";
   print $outFile "    parent* = bootstrap stub -> 'traits' -> 'system' -> 'foreign' -> 'proxy' -> ().\n";
   print $outFile "    whichProxy = 'xgl-$name'.\n";
   print $outFile "    new = ( new: 1 ).\n" unless ($notNew);
   print $outFile "  |).\n";
   print $outFile "|).\n\n";
}

sub printDefinitions::printPrototype {
   package printDefinitions;

   my($name) = shift;
   
   print $outFile "bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: (|\n";
   print $outFile "  $name = (\n";
   print $outFile "    bootstrap remove: 'parent' From: proxy deadCopy) _AddSlots: (|\n";
   print $outFile "    {} = 'ModuleInfo: Creator: globals windowing xgl raw $name.\n\n";
   print $outFile "CopyDowns:\n";
   print $outFile "globals system foreign proxy. deadCopy\n";
   print $outFile "SlotsToOmit: parent.\n\n";
   print $outFile "'.\n\n";
   print $outFile "    parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'raw' -> '$name' -> ().\n";
   print $outFile "  |).\n";
   print $outFile "|).\n\n";
}


#---------------------------------------------------------------------------
# printers for *_DEF types
#---------------------------------------------------------------------------
sub printDefinitions::ENUM_DEFprintSelfDefinition {
   package printDefinitions;

   my($enumName)   = &CtoSelfName(shift);
   my($enumValues) = shift;

   print $outFile "bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> 'constants' -> () _AddSlots: (|\n";
   print $outFile "  $enumName = (|\n";
   foreach $enum (sort(keys(%$enumValues))) {
      print $outFile "    ", &CtoSelfName($enum), " = $enumValues->{$enum}.\n";
   }
   print $outFile "  |).\n";
   print $outFile "|).\n\n\n";
}

sub printDefinitions::STRUCT_DEFprintSelfDefinition {
   package printDefinitions;

   my($structName) = &CtoSelfName(shift);
   
   &printTraits($structName);
   &printPrototype($structName);
   print $outFile "\n";
}

sub printDefinitions::TYPE_DEFprintSelfDefinition {
   package printDefinitions;

   my($typeName) = &CtoSelfName(shift);
   
   &printTraits($typeName);
   &printPrototype($typeName);
   print $outFile "\n";
}

sub printDefinitions::UNION_DEFprintSelfDefinition {
   package printDefinitions;

   my($unionName) = &CtoSelfName(shift);

   &printTraits($unionName);
   &printPrototype($unionName);
   print $outFile "\n";
}


#---------------------------------------------------------------------------
# printers for *_PTR types
#---------------------------------------------------------------------------
# sub printDefinitions::STRUCT_PTRprintSelfDefinition {} # no-op
# sub printDefinitions::UNION_PTRprintSelfDefinition  {} # no-op
# sub printDefinitions::BASIC_PTRprintSelfDefinition  {} # no-op
# sub printDefinitions::VOID_PTRprintSelfDefinition   {} # no-op


#---------------------------------------------------------------------------
# printers for STRUCT types
#---------------------------------------------------------------------------
# sub printDefinitions::STRUCTprintSelfDefinition     {} # no-op
# sub printDefinitions::UNIONprintSelfDefinition      {} # no-op
# sub printDefinitions::ENUMprintSelfDefinition       {} # no-op
# sub printDefinitions::BASICprintSelfDefinition      {} # no-op


#---------------------------------------------------------------------------
# utility routines
#---------------------------------------------------------------------------
sub printDefinitions::parseCommandLine {
   package printDefinitions;

   ($ARGV[0]) 
   && (open($inFile, "<$ARGV[0]") 
      || die "$0 error: Could not open $ARGV[0] for reading\n");
   ($ARGV[1]) 
   && (open($outFile, ">$ARGV[1]") 
      || die "$0 error: Could not open $ARGV[1] for writing\n");
}

sub printDefinitions::printHeader {
   package printDefinitions;

   print $outFile <<EndOfHeader;
'-- This file was generated from the xgl header file and contains
    self level definitions for all Xgl types and enumerated constants.
    Do NOT edit this file by hand!'

'-- Copyright 1992-2012 AUTHORS.
    See the LICENSE file for license information.'

'-- CAUTION: This file is not part of the documented Self world.  It may be
    be changed or removed at any time, and it will not be documented.
    This file can be removed without affecting the Self world in any way.'


EndOfHeader

   &printTraits('systemState', 1);
   &printPrototype('systemState');
   &printTraits('genericObject', 1);
   &printPrototype('genericObject');

   print $outFile "\n\n";
}

sub printDefinitions::printFooter {
   package printDefinitions;

   &printTraits('streamInfo', 1);
   &printPrototype('streamInfo');
   &printTraits('intVecProxy', 1);
   &printPrototype('intVecProxy');
   &printTraits('longVecProxy', 1);
   &printPrototype('longVecProxy');
   &printTraits('floatVecProxy', 1);
   &printPrototype('floatVecProxy');
   &printTraits('doubleVecProxy', 1);
   &printPrototype('doubleVecProxy');
   &printTraits('unsignedCharVecProxy', 1);
   &printPrototype('unsignedCharVecProxy');

   print $outFile <<EndOfFooter;
EndOfFooter
}


#---------------------------------------------------------------------------
# uncomment these lines to allow "printDefinitions" package to be run from shell
 
&printDefinitions::parseCommandLine();
&printDefinitions::printHeader();
&printDefinitions::printAllDefinitions();
&printDefinitions::printFooter();
 
1;
 
# end "notImplemented" package
#---------------------------------------------------------------------------
