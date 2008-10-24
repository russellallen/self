#! /self/bin/svr4/perl5 -I${SELF_WORKING_DIR}/objects/ui3D/perlForXgl

# Copyright 1994 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

#---------------------------------------------------------------------------
# "printWrappers" package requires
#---------------------------------------------------------------------------
package printWrappers;
require 'utilFuncs.perl';

#---------------------------------------------------------------------------
# "printWrappers" package variables
#---------------------------------------------------------------------------
$printWrappers::inFile  = STDIN;
$printWrappers::outFile = STDOUT;

#---------------------------------------------------------------------------
# "printWrappers" main routine
#---------------------------------------------------------------------------
sub printWrappers::printAllWrappers {
   package printWrappers;

   $foo = '';
   while (<$inFile>) {
      chop;
      $foo .= $_;
   }
   eval($foo);

   print $outFile "// These are seals for the Xgl types that will become proxies.\n";
   foreach $name (sort(keys(%$cTypesRef))) {
      if ($cTypesRef->{$name}[0] =~ /^(STRUCT|UNION|TYPE)_DEF$/) { 
	 print $outFile "char* $name", "_seal = \"$name", "_seal\";\n";
      }
   }

   print $outFile "\n\n";
   print $outFile "// accessor wrappers for various xgl structures\n";
   foreach $name (sort(keys(%$cTypesRef))) {
      local($printFunc) = $cTypesRef->{$name}[0] . 'printCWrapper';
      if (defined(&$printFunc)) {
	 &$printFunc($name, $cTypesRef->{$name}[1]);
      }
   }
}


#---------------------------------------------------------------------------
# general print routines
#---------------------------------------------------------------------------
sub printWrappers::printDefinitionHeader {
   package printWrappers;

   my($name)     = shift;
   my($selfName) = &CtoSelfName($name);
   my($lcName)   = &makeLowercase($name);

   print $outFile "// for $name\n";
   print $outFile "$name* $lcName", "_new (fint count) {\n";
   print $outFile "  return NEW_C_HEAP_ARRAY($name, count);\n";
   print $outFile "}\n";
   print $outFile "void $lcName", "_delete ($name* rcvr) {\n";
   print $outFile "  delete [] rcvr;\n";
   print $outFile "}\n\n";
   print $outFile "$name* $lcName", "_at ($name* rcvr, fint which) {\n";
   print $outFile "  return &(rcvr[which]);\n";
   print $outFile "}\n";
   print $outFile "void $lcName", "_at_put ($name* rcvr, fint which, $name* $selfName) {\n";
   print $outFile "  rcvr[which] = *$selfName;\n";
   print $outFile "}\n\n";
}

sub printWrappers::PTRprintSetParameter {
   package printWrappers;

   my($name)       = shift;
   my($type)       = shift;
   my(@parents)    = @_;

   my($fieldParam) = &CtoSelfName($name);

   print $outFile "$type* $fieldParam";

   1;
}

sub printWrappers::PTRprintSetter {
   package printWrappers;

   my($name)         = shift;
   my($type)         = shift;
   my(@parents)      = @_;

   my($receiver)     = shift(@parents);
   my($fieldParam)   = &CtoSelfName($name);

   if (@parents) {
      my($fieldPath) = join('.', @parents);
      print $outFile "rcvr->$fieldPath.$name = $fieldParam";
   }
   else {
      print $outFile "rcvr->$name = $fieldParam";
   }
}

sub printWrappers::PTRprintCWrapper {
   package printWrappers;

   my($name)     = shift;
   my($type)     = shift;
   my(@parents)  = @_;

   my($receiver) = shift(@parents);

   if (@parents) {
      my($fieldParam) = &CtoSelfName($name);
      my($cFuncName)  = &makeLowercase($receiver . '_' . join('_', @parents)) . "_$name";
      my($fieldPath)  = join('.', @parents);

      print $outFile "$type* $cFuncName ($receiver* rcvr) {\n";
      print $outFile "   return rcvr->$fieldPath.$name;\n";
      print $outFile "}\n";
      print $outFile "void $cFuncName ($receiver* rcvr, $type* $fieldParam) {\n";
      print $outFile "   rcvr->$fieldPath.$name = $fieldParam;\n";
      print $outFile "}\n\n";
   }

   1;
}


#---------------------------------------------------------------------------
# printers for *_DEF types
#---------------------------------------------------------------------------
# sub printWrappers::ENUM_DEFprintSetParameter    {} # no-op
# sub printWrappers::ENUM_DEFprintSetter          {} # no-op
# sub printWrappers::ENUM_DEFprintCWrapper        {} # no-op


sub printWrappers::STRUCT_DEFprintSetParameter {
   package printWrappers;

   my($structName)   = shift;
   my($structFields) = shift;
   my(@parents)      = @_;

   my(@tmpFields)    = sort(keys(%$structFields));
   $field            = shift(@tmpFields);
   do {
      local($printFunc) = $structFields->{$field}[0] . 'printSetParameter';
      if (defined(&$printFunc)) {
	 &$printFunc($field, $structFields->{$field}[1], @parents, $structName);
	 print $outFile ",\n\t" if ($field = shift(@tmpFields));
      }
   } while ($field);

   1;
}

sub printWrappers::STRUCT_DEFprintSetter {
   package printWrappers;

   my($structName)   = shift;
   my($structFields) = shift;
   my(@parents)      = @_;

   my(@tmpFields)    = sort(keys(%$structFields));
   $field            = shift(@tmpFields);
   do {
      local($printFunc) = $structFields->{$field}[0] . 'printSetter';
      if (defined(&$printFunc)) {
	 &$printFunc($field, $structFields->{$field}[1], @parents, $structName);
	 print $outFile ";\n  " if ($field = shift(@tmpFields));
      }
   } while ($field);

}

sub printWrappers::STRUCT_DEFprintCWrapper {
   package printWrappers;

   my($structName)     = shift;
   my($structFields)   = shift;
   my(@parents)        = @_;

   if (!@parents) {
      &printDefinitionHeader($structName);
   }

   my($fieldCount) = 0;
   foreach $field (sort(keys(%$structFields))) {
      local($printFunc) = $structFields->{$field}[0] . 'printCWrapper';
      if (defined(&$printFunc)) {
	 $fieldCount += &$printFunc($field, $structFields->{$field}[1], @parents, $structName);
      }
   }

   if (!@parents) {
      if (($fieldCount < 9) && ($fieldCount > 2)) {
	 local($done) = 1;
	 do {
	    $done = 1;
	    print $outFile "void ", &makeLowercase($structName), "_set ($structName* rcvr";
	    foreach $field (sort(keys(%$structFields))) {
	       local($printFunc) = $structFields->{$field}[0] . 'printSetParameter';
	       if (defined(&$printFunc)) {
		  print $outFile ",\n\t";
		  $done &= &$printFunc($field, $structFields->{$field}[1], $structName);
	       }
	    }
	    print ") {\n";
	    foreach $field (sort(keys(%$structFields))) {
	       local($printFunc) = $structFields->{$field}[0] . 'printSetter';
	       if (defined(&$printFunc)) {
		  print $outFile "  ";
		  &$printFunc($field, $structFields->{$field}[1], $structName);
		  print $outFile ";\n";
	       }
	    }
	    print "}\n\n";
	 } while (!$done);
      }
      print $outFile "\n";
   }

   $fieldCount;
}


# sub printWrappers::TYPE_DEFprintSetParameter {} # no-op
# sub printWrappers::TYPE_DEFprintSetter {} # no-op
sub printWrappers::TYPE_DEFprintCWrapper {
   package printWrappers;

   my($typeName)      = shift;
   my($typeField)     = shift;
   my(@parents)       = @_;

   my($selfTypeName)  = &CtoSelfName($typeName);
   my($lcTypeName)    = &makeLowercase($typeName);

   if ($typeField =~ s/\[\d+\]//g) {
      &printDefinitionHeader($typeName);
      print $outFile "$typeField $lcTypeName", "_row_column ($typeName* $selfTypeName, fint row, fint column) {\n";
      print $outFile "  return (*$selfTypeName)[row][column];\n";
      print $outFile "}\n";
      print $outFile "void $lcTypeName", "_row_column_put ($typeName* $selfTypeName, fint row, fint column, $typeField data) {\n";
      print $outFile "  (*$selfTypeName)[row][column] = data;\n";
      print $outFile "}\n\n";
      print $outFile "\n";
   }
}


sub printWrappers::UNION_DEFprintSetParameter {
   package printWrappers;

   my($unionName)        = shift;
   my($unionFields)      = shift;
   my(@parents)          = @_;
 
   my($done)             = 1;

   my($currentFieldName) = $unionName . 'CurrentField';
   my($unionFieldNames)  = $unionName . 'Fields'; 
   eval("if (!@$unionFieldNames) {
            local(%fieldTypes) = ();
            foreach \$field (sort(keys(%\$unionFields))) {
               if (!\$fieldTypes{\$unionFields->{\$field}[1]}) {
                  \$fieldTypes{\$unionFields->{\$field}[1]} = \$field;
               }
            }
            @$unionFieldNames = sort(values(%fieldTypes));
         }");

   if (eval("\$$currentFieldName = shift(@$unionFieldNames)")) {
      local($printFunc) = $unionFields->{eval("\$$currentFieldName")}[0] . 'printSetParameter';
      if (defined(&$printFunc)) {
	 $done &= 
	     &$printFunc(eval("\$$currentFieldName"), 
			 $unionFields->{eval("\$$currentFieldName")}[1], @parents, $unionName);
      }
   }
   else {
      eval("@$unionFieldNames = ()");
   }
 
   eval("$done & ((@$unionFieldNames) ? 0 : 1)");
}

sub printWrappers::UNION_DEFprintSetter {
   package printWrappers;

   my($unionName)   = shift;
   my($unionFields) = shift;
   my(@parents)     = @_;
 
   my($currentFieldName) = $unionName . 'CurrentField';

   local($printFunc) = $unionFields->{eval("\$$currentFieldName")}[0] . 'printSetter';
   if (defined(&$printFunc)) {
      &$printFunc(eval("\$$currentFieldName"), 
		  $unionFields->{eval("\$$currentFieldName")}[1], @parents, $unionName);
   }
}

sub printWrappers::UNION_DEFprintCWrapper {
   package printWrappers;

   my($unionName)      = shift;
   my($unionFields)    = shift;
   my(@parents)        = @_;

   if (!@parents) {
      &printDefinitionHeader($unionName);
   }

   my(@fieldCount) = ();
   foreach $field (sort(keys(%$unionFields))) {
      local($printFunc) = $unionFields->{$field}[0] . 'printCWrapper';
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
sub printWrappers::BASIC_PTRprintSetParameter {
   &printWrappers::PTRprintSetParameter(@_);
}

sub printWrappers::BASIC_PTRprintSetter {
   &printWrappers::PTRprintSetter(@_);
}

sub printWrappers::BASIC_PTRprintCWrapper {
   &printWrappers::PTRprintCWrapper(@_);
}


sub printWrappers::STRUCT_PTRprintSetParameter {
   &printWrappers::PTRprintSetParameter(@_);
}

sub printWrappers::STRUCT_PTRprintSetter {
   &printWrappers::PTRprintSetter(@_);
}

sub printWrappers::STRUCT_PTRprintCWrapper {
   &printWrappers::PTRprintCWrapper(@_);
}


sub printWrappers::UNION_PTRprintSetParameter {
   &printWrappers::PTRprintSetParameter(@_);
}

sub printWrappers::UNION_PTRprintSetter {
   &printWrappers::PTRprintSetter(@_);
}

sub printWrappers::UNION_PTRprintCWrapper {
   &printWrappers::PTRprintCWrapper(@_);
}


sub printWrappers::VOID_PTRprintSetParameter {
   &printWrappers::PTRprintSetParameter(@_);
}

sub printWrappers::VOID_PTRprintSetter {
   &printWrappers::PTRprintSetter(@_);
}

sub printWrappers::VOID_PTRprintCWrapper {
   &printWrappers::PTRprintCWrapper(@_);
}


#---------------------------------------------------------------------------
# printers for *_VEC types
#---------------------------------------------------------------------------
# sub printWrappers::BASIC_VECprintSetParameter {} # no-op
# sub printWrappers::BASIC_VECprintSetter       {} # no-op
sub printWrappers::BASIC_VECprintCWrapper {
   package printWrappers;

   my($basicName)  = shift;
   my($basicType)  = shift;
   my(@parents)    = @_;

   my($receiver)   = shift(@parents);
   my($fieldParam) = &CtoSelfName($basicName);

   my($cFuncName)  = &makeLowercase($receiver . '_' . ((@parents) ? join('_', @parents) . '_' : '')) . $basicName;
   my($fieldPath)  = ((@parents) ? join('.', @parents) . '.' : '');

   $basicType      =~ s/_/ /g;
   print $outFile "$basicType* $cFuncName ($receiver* rcvr) {\n";
   print $outFile "   return rcvr->$fieldPath$basicName;\n";
   print $outFile "}\n";

   0;
}


# sub printWrappers::STRUCT_VECprintSetParameter {} # no-op
# sub printWrappers::STRUCT_VECprintSetter       {} # no-op
sub printWrappers::STRUCT_VECprintCWrapper {
   package printWrappers;

   my($structName) = shift;
   my($structType) = shift;
   my(@parents)    = @_;

   my($receiver)   = shift(@parents);
   my($fieldParam) = &CtoSelfName($structName);

   my($cFuncName)  = &makeLowercase($receiver . '_' . ((@parents) ? join('_', @parents) . '_' : '')) . $structName;
   my($fieldPath)  = ((@parents) ? join('.', @parents) . '.' : '');

   print $outFile "$structType* $cFuncName ($receiver* rcvr) {\n";
   print $outFile "   return rcvr->$fieldPath$structName;\n";
   print $outFile "}\n";

   0;
}


#---------------------------------------------------------------------------
# printers for non_PTR types
#---------------------------------------------------------------------------
sub printWrappers::BASICprintSetParameter {
   package printWrappers;

   my($basicName)  = shift;
   my($basicType)  = shift;
   my(@parents)    = @_;

   my($receiver)   = shift(@parents);
   my($fieldParam) = (($#parents >= 0) ? $parents[$#parents] . '_' : '') . &CtoSelfName($basicName);

   $basicType      =~ s/_/ /g;
   $basicType      =~ s/string/char\*/;
   print $outFile "$basicType $fieldParam";

   1;
}

sub printWrappers::BASICprintSetter {
   package printWrappers;

   my($basicName)  = shift;
   my($basicType)  = shift;
   my(@parents)    = @_;

   my($receiver)   = shift(@parents);
   my($fieldParam) = (($#parents >= 0) ? $parents[$#parents] . '_' : '') . &CtoSelfName($basicName);

   if (@parents) {
      my($fieldPath) = join('.', @parents);
      print $outFile "rcvr->$fieldPath.$basicName = $fieldParam";
   }
   else {
      print $outFile "rcvr->$basicName = $fieldParam";
   }
}

sub printWrappers::BASICprintCWrapper {
   package printWrappers;

   my($basicName) = shift;
   my($basicType) = shift;
   my(@parents)   = @_;

   my($receiver)  = shift(@parents);

   if (@parents) {
      my($fieldParam) = &CtoSelfName($basicName);
      my($fieldPath)  = join('.', @parents);
      my($cFuncName)  = &makeLowercase($receiver . '_' . join('_', @parents)) . "_$basicName";

      $basicType      =~ s/_/ /;
      $basicType      =~ s/string/char\*/;
      print $outFile "$basicType $cFuncName ($receiver* rcvr) {\n";
      print $outFile "   return rcvr->$fieldPath.$basicName;\n";
      print $outFile "}\n";
      print $outFile "void $cFuncName ($receiver* rcvr, $basicType $fieldParam) {\n";
      print $outFile "   rcvr->$fieldPath.$basicName = $fieldParam;\n";
      print $outFile "}\n\n";
   }

   1;
}


sub printWrappers::ENUMprintSetParameter {
   package printWrappers;

   my($enumName)   = shift;
   my($enumType)   = shift;
   my(@parents)    = @_;

   my($receiver)   = shift(@parents);
   my($fieldParam) = (($#parents >= 0) ? $parents[$#parents] . '_' : '') . &CtoSelfName($enumName);

   print $outFile "$enumType $fieldParam";

   1;
}

sub printWrappers::ENUMprintSetter {
   package printWrappers;

   my($enumName)   = shift;
   my($enumType)   = shift;
   my(@parents)    = @_;

   my($receiver)   = shift(@parents);
   my($fieldParam) = (($#parents >= 0) ? $parents[$#parents] . '_' : '') . &CtoSelfName($enumName);

   if (@parents) {
      my($fieldPath)  = join('.', @parents);
      print $outFile "rcvr->$fieldPath.$enumName = $fieldParam";
   }
   else {
      print $outFile "rcvr->$enumName = $fieldParam";
   }
}

sub printWrappers::ENUMprintCWrapper {
   package printWrappers;

   my($enumName) = shift;
   my($enumType) = shift;
   my(@parents)  = @_;

   my($receiver) = shift(@parents);

   if (@parents) {
      my($fieldParam) = &CtoSelfName($enumName);
      my($cFuncName)  = &makeLowercase($receiver . '_' . join('_', @parents)) . "_$enumName";
      my($fieldPath)  = join('.', @parents);

      print $outFile "$enumType $cFuncName ($receiver* rcvr) {\n";
      print $outFile "   return rcvr->$fieldPath.$enumName;\n";
      print $outFile "}\n";
      print $outFile "void $cFuncName ($receiver* rcvr, $enumType $fieldParam) {\n";
      print $outFile "   rcvr->$fieldPath.$enumName = $fieldParam;\n";
      print $outFile "}\n\n";
   }

   2;
}


sub printWrappers::STRUCTprintSetParameter {
   package printWrappers;

   my($structName) = shift;
   my($structType) = shift;
   my(@parents)    = @_;

   my($receiver)   = shift(@parents);
   my($fieldParam) = (($#parents >= 0) ? $parents[$#parents] . '_' : '') . &CtoSelfName($structName);

   print $outFile "$structType* $fieldParam";

   1;
}

sub printWrappers::STRUCTprintSetter {
   package printWrappers;

   my($structName) = shift;
   my($structType) = shift;
   my(@parents)    = @_;

   my($receiver)   = shift(@parents);
   my($fieldParam) = (($#parents >= 0) ? $parents[$#parents] . '_' : '') . &CtoSelfName($structName);

   my($fieldPath)  = ((@parents) ? join('.', @parents) . '.' : '');

   print $outFile "rcvr->$fieldPath$structName = *$fieldParam";
}

sub printWrappers::STRUCTprintCWrapper {
   package printWrappers;

   my($structName) = shift;
   my($structType) = shift;
   my(@parents)    = @_;

   my($receiver)   = shift(@parents);
   my($fieldParam) = &CtoSelfName($structName);

   my($cFuncName)  = &makeLowercase($receiver . '_' . ((@parents) ? join('_', @parents) . '_' : '')) . $structName;
   my($fieldPath)  = ((@parents) ? join('.', @parents) . '.' : '');

   print $outFile "$structType* $cFuncName ($receiver* rcvr) {\n";
   print $outFile "   return &(rcvr->$fieldPath$structName);\n";
   print $outFile "}\n";
   print $outFile "void $cFuncName ($receiver* rcvr, $structType* $fieldParam) {\n";
   print $outFile "   rcvr->$fieldPath$structName = *$fieldParam;\n";
   print $outFile "}\n\n";

   1;
}


# sub printWrappers::UNIONprintSetParameter       {} # no-op
# sub printWrappers::UNIONprintSetter             {} # no-op
# sub printWrappers::UNIONprintCWrapper           {} # no-op


#---------------------------------------------------------------------------
# internal routines
#---------------------------------------------------------------------------
sub printWrappers::parseCommandLine {
   package printWrappers;

   ($ARGV[0])
   && (open($inFile, "<$ARGV[0]") 
      || die "$0 error: Could not open $ARGV[0] for reading\n");
   ($ARGV[1])
   && (open($outFile, ">$ARGV[1]") 
      || die "$0 error: Could not open $ARGV[1] for writing\n");
}

sub printWrappers::printHeader {
   package printWrappers;

   print $outFile <<EndOfHeader;
// This file was generated from the xgl header file and contains
// C++ wrapper functions around xgl structure accesses from Self.
// Do NOT edit this file by hand!

// Copyright 1994 Sun Microsystems, Inc. and Stanford University.
// See the LICENSE file for license information.

#include <X11/Xlib.h>             // for Window and Display definitions
#include <xgl/xgl.h>              // duh
#include <incls/_glueDefs.c.incl> // for glue preprocessor macros
#include "xgl.primMaker.h"        // definitions generated by primitiveMaker

VERIFYCHECKSUM

#define WHAT_GLUE C_DECLS
   // xgl_entries (apparently this prints the C comments in your templates)
#undef WHAT_GLUE

// apparently the C_DECLS preprocessor macro is supposed to do this
extern char * Display_seal;
char * Window_seal = "Window_seal";  // this seal will not actually match 
                                     // Window_seal defined in xlib


// these are simple here to make it easier to template these things 
// - should match those in <xgl/xgl.h>
typedef void Xgl_object_obj;
typedef Xgl_object_obj Xgl_sys_state_obj;

// these are the seals for the previous types - names must match
char* Xgl_object_seal = "Xgl_object_seal";
char* Xgl_object_obj_seal = "Xgl_object_obj_seal";
char* Xgl_sys_state_obj_seal = "Xgl_sys_state_obj_seal";


// these are convenience typedefs so we can have c-style vectors
// - they are not as powerful as byteVectors, but they remove one 
// layer of extra copying
typedef int Int_vec_proxy;
typedef long Long_vec_proxy;
typedef float Float_vec_proxy;
typedef double Double_vec_proxy;
typedef unsigned char Unsigned_char_vec_proxy;

// These are seals for the previous types - names must match
char* Int_vec_proxy_seal = "Int_vec_proxy_seal";
char* Long_vec_proxy_seal = "Long_vec_proxy_seal";
char* Float_vec_proxy_seal = "Float_vec_proxy_seal";
char* Double_vec_proxy_seal = "Double_vec_proxy_seal";
char* Unsigned_char_vec_proxy_seal = "Unsigned_char_vec_proxy_seal";


// this is a hack, but I do not know what stream info xgl is expecting here
char * Xgl_stream_info_seal = "Xgl_stream_info_seal";

EndOfHeader
}

sub printWrappers::printFooter {
   package printWrappers;

   print $outFile <<EndOfFooter;
// accessors for c-style vector proxies
// for Int_vec_proxy
int* int_vec_proxy_new (fint count) {
  return new int[count];
}
void int_vec_proxy_delete (int* intVec) {
  delete [] intVec;
}

int int_vec_proxy_at (int* intVec, fint which) {
  return intVec[which];
}
void int_vec_proxy_at_put (int* intVec, fint which, int data) {	
    intVec[which] = data;
}


// for Long_vec_proxy
long* long_vec_proxy_new (fint count) {
  return new long[count];
}
void long_vec_proxy_delete (long* longVec) {
  delete [] longVec;
}

long long_vec_proxy_at (long* longVec, fint which) {
  return longVec[which];
}
void long_vec_proxy_at_put (long* longVec, fint which, long data) {	
    longVec[which] = data;
}


// for Float_vec_proxy
float* float_vec_proxy_new (fint count) {
  return new float[count];
}
void float_vec_proxy_delete (float* floatVec) {
  delete [] floatVec;
}

float float_vec_proxy_at (float* floatVec, fint which) {
  return floatVec[which];
}
void float_vec_proxy_at_put (float* floatVec, fint which, float data) {	
    floatVec[which] = data;
}


// for Double_vec_proxy
double* double_vec_proxy_new (fint count) {
  return new double[count];
}
void double_vec_proxy_delete (double* doubleVec) {
  delete [] doubleVec;
}

double double_vec_proxy_at (double* doubleVec, fint which) {
  return doubleVec[which];
}
void double_vec_proxy_at_put (double* doubleVec, fint which, double data) {	
    doubleVec[which] = data;
}


// for Unsigned_char_vec_proxy
unsigned char* unsigned_char_vec_proxy_new (fint count) {
  return new unsigned char[count];
}
void unsigned_char_vec_proxy_delete (unsigned char* unsignedCharVec) {
  delete [] unsignedCharVec;
}

unsigned char unsigned_char_vec_proxy_at (unsigned char* unsignedCharVec, fint which) {
  return unsignedCharVec[which];
}
void unsigned_char_vec_proxy_at_put (unsigned char* unsignedCharVec, fint which, unsigned char data) {	
    unsignedCharVec[which] = data;
}


// for Xgl_objects
Xgl_object* xgl_object_new (fint count) {
  return new Xgl_object[count];
}
void xgl_object_delete (Xgl_object* objectVec, fint count) {
  for (int i = 0; i < count; i++) xgl_object_destroy(objectVec[i]);
}

Xgl_object xgl_object_at (Xgl_object* objectVec, fint which) {
  return objectVec[which];
}
void xgl_object_at_put (Xgl_object* objectVec, fint which, Xgl_object object) {	
    objectVec[which] = object;
}


// This is a silly wrapper - but I hate having to pass a trailing 0.
Xgl_sys_state xgl_open_no_args () { return xgl_open(XGL_UNUSED); }


#define WHAT_GLUE FUNCTIONS
   xgl_glue
#undef WHAT_GLUE
EndOfFooter
}


#---------------------------------------------------------------------------
# uncomment these lines to allow "printWrappers" package to be run from shell
 
&printWrappers::parseCommandLine();
&printWrappers::printHeader();
&printWrappers::printAllWrappers();
&printWrappers::printFooter();
 
1;
 
# end "notImplemented" package
#---------------------------------------------------------------------------
