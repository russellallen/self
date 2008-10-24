/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "kinds.hh"
# include "_kinds.cpp.incl"

void printLookupType(LookupType l) {
  lprintf(lookupTypeName(l));
}

static void addFlag(bool& flag, char* name, const char* add) {
  if (!flag) strcat(name, " { ");
  flag = true;
  strcat(name, add);
}

char* lookupTypeName(LookupType l) {
  char* name = NEW_RESOURCE_ARRAY(char, 80);
  switch (l) {
   case NormalLookupType:
    strcpy(name, "NormalLookup");
    break;
   case StaticNormalLookupType:
    strcpy(name, "StaticNormalLookup");
    break;
   case ImplicitSelfLookupType:
    strcpy(name, "ImplicitSelfLookup");
    break;
   case ResendLookupType:
    strcpy(name, "ResendLookup");
    break;
   case DirectedResendLookupType:
    strcpy(name, "DirectedResendLookup");
    break;
   case NormalPerformType:
    strcpy(name, "NormalPerform");
    break;
   case ResendPerformType:
    strcpy(name, "ResendPerform");
    break;
   case DelegatedPerformType:
    strcpy(name, "DelegatedPerform");
    break;
   default:
    char* baseName;
    switch (baseLookupType(l)) {
     case NormalBaseLookupType:
      baseName ="NormalBaseLookup "; break;
     case ResendBaseLookupType:
      baseName ="ResendBaseLookup "; break;
     case DirectedResendBaseLookupType:
      baseName ="DirectedResendBaseLookup "; break;
     case DelegatedBaseLookupType:
      baseName ="DelegatedBaseLookup "; break;
     default: fatal("unexpected base lookup type");
    }
    strcpy(name, baseName);
    if (l & SelectorStaticBit) {
      strcat(name, "<selector static> ");
    }
    if (l & DelegateeStaticBit) {
      strcat(name, "<delegatee static> ");
    }
    if (l & ReceiverStaticBit) {
      strcat(name, "<receiver map static> ");
    }
  }
  bool hasFlag = false;
  switch (countType(l)) {
   case NonCounting: break;
   case Counting:    addFlag(hasFlag, name, "counting "); break;
   case Comparing:   addFlag(hasFlag, name, "comparing "); break;
   default:          fatal1("invalid count type %ld", countType(l));
  }
  if (isSet(l, DirtySendBit)) addFlag(hasFlag, name, "dirty ");
  if (isSet(l, OptimizedSendBit)) addFlag(hasFlag, name, "optimized ");
  if (isSet(l, UninlinableSendBit)) addFlag(hasFlag, name, "uninlinable ");
  if (hasFlag) strcat(name, "}");
    
  return name;
}

void kinds_init() {
  assert((LookupTypeMask >> LookupTypeSize) == 0, "wrong LookupTypeSize");
  assert((CountTypeMask >> CountTypeSize) == 0, "wrong CountTypeSize");
}  
