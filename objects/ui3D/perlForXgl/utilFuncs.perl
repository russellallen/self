# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.
 
#---------------------------------------------------------------------------
# utility routines
#---------------------------------------------------------------------------
sub CtoSelfName {
   local($name) = &cutXglName($_[0]);

   # change Xgl style names to Self style names 
   # (_ separated words to capitalized words)
   $name =~ tr[A-Z][a-z];
   $name =~ s/^(\d+[a-z]*)_([a-z]+)/$2_$1/;
   $name =~ s/_(\d)/$1/g;
   while ($name =~ s/_([a-z])/_/) {
      $foo  =  $1;
      $foo  =~ tr[a-z][A-Z];
      $name =~ s/_/$foo/;
   }

   $name;
}

sub capitalize {
   local($name) = $_[0];

   substr($name, 0, 1) =~ tr/a-z/A-Z/;
   $name;
}

sub cutTypeName {
   local($name) = $_[0];

   $name =~ s/\*$//;
   $name =~ s/\[\d+\]$//;
   $name;
}

sub cutXglName {
   local($name) = $_[0];
 
   $name =~ s/[Xx][Gg][Ll]_//;
   $name;
}

sub makeLowercase {
   local($name) = $_[0];

   $name =~ tr[A-Z][a-z];
   $name;
}
 
sub makeSingular {
   local($name) = $_[0];

   $name =~ s/([^u])s$/$1/;
   $name;
}


1;

# end utility routines
#---------------------------------------------------------------------------
