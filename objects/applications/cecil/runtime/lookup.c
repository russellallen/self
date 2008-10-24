/* Sun-$Revision: 9.1 $ */

# pragma implementation "lookup.h"

# include "cecil.h"
# include "lookup.h"
# include "methodCache.h"
# include "methodTable.h"
# include <stdio.h>
# include <string.h>

# ifdef ASSERT
  bool printDebugging = false;
# else
# define printDebugging false
# endif

// OOP::relationTo(OOP b) returns the inheritance relationship between objects
// this and b. It has the sense of "this" is X of "b". This relationship
// is determined by seeing whether one object's map includes the 
// other.
// The relationship is one of:
//          "this" is the same object as "arg"
//          "this" is not related to "arg"
//          "this" is an ancestor of "arg"
//          "this" is a descendant of "arg"

ObjectRelation CecilTaggedPointerClass::relationTo(OOP b) {
  CecilMap* Amap =    map();
  CecilMap* Bmap = b->map();
  
  if (Amap == Bmap) return ir_same;
  if (Amap->descendsFrom(Bmap)) return ir_descendant;
  if (Bmap->descendsFrom(Amap)) return ir_ancestor;
  return ir_not_related;
}


// Map::descendsFrom(map) returns true if this map or one of its parents is 
// identical to the argument. The comparison is done by comparing pointers.

bool CecilMap::descendsFrom(CecilMap* map) {
  if (this == map) return true;
  int len = parents->length();
  for (int i=0; i<len; i++) {
    if ((*parents)[i]->map()->descendsFrom(map)) return true;
  }
  return false;
}


// CecilMethod class definition


// CecilMethod::match(sel, nargs) returns true if this method has
// the same name and number of arguments as the parameters.

bool CecilMethod::match(int sel, int nargs) {
  return selector == sel && specializers.length() == nargs;
}


// CecilMethod::applies(args) returns true if the specializers of this
// method are no more specific than the arguments. This is used to select
// those methods which might possibly be invoked by a method.

bool CecilMethod::applies(OOPList& args, bool testPredicates,
			  bool isResend, PredDecisionArray& predTests) {
  OOPList& specs =
    isResend && !testPredicates ? getSpecializers() : specializers;
  int nargs = args.length();
  for (int i=0; i<nargs; i++) {
    ObjectRelation relation = specs[i]->relationTo(args[i]);
    if (relation == ir_not_related || relation == ir_descendant) {
      return false;
    }
  }
  if (&realSpec && testPredicates) {   
    // It's a method attached to a predicate object
    for (int i = 0; i<nargs; i++) {
      CecilMap* m = realSpec[i]->map();
      if (m->predicateTest != NULL) {
	bool predResult = (*(m->predicateTest))(args[i]);
	predTests.add(new PredDecision(m->predicateTest, predResult, i));
	if (! predResult) {
	  return false;
	}
      }
    }
  }
  return true;
}

// CecilMethod::relationTo(meth) returns one of 4 possible answers.
// Either this method is exactly as specific as the argument, which is
// true only if all of the argument specializers are the same. Or this
// method is uniformly more specific than "meth", which is true if all
// of its specializers are descendants (or the same as) "meth"'s 
// specializers. Or this method is uniformly less specific than "meth",
// in case its specializers are ancestors (or the same as) "meth"'s
// specializers. Or we cannot decide which is more specific, either
// because some specializers are more specific and others are less specific,
// or because some specializers are not related to each other.

MethodRelation CecilMethod::relationTo(CecilMethod* meth) {
  MethodRelation relation = same_args;
  
  OOPList& specs = getSpecializers();
  int len = specs.length();
  for (int i=0; i<len; i++) {
    switch (specs[i]->relationTo(meth->getArg(i))) {
     case ir_not_related:
      return dont_know;
      break;
     case ir_same:
      break;
     case ir_ancestor:
      if (relation == more_specific) {
	return dont_know;
      } else {
	relation = less_specific;
	break;
      }
     case ir_descendant:
      if (relation == less_specific) {
	return dont_know;
      } else {
	relation = more_specific;
	break;
      }
    }
  }
  
  return relation;
}


// CecilMethod::checkEncapsulation(privileges) checks whether a call of this
// method is legal, given that the call site has privileged access to the
// objects listed in privileges.

bool CecilMethod::checkEncapsulation(OOPList& privileges) {
  if (isPublic()) {
    // access granted
    return true;
  }
  // need to check encapsulation
  int nargs = privileges.length();
  for (int i=0; i<nargs; i++) {
    OOP specializer = specializers[i];
    if (specializer == GLOBAL(base,_any)) {
      // access always granted to an unconstrained formal
      break;
    }
    OOP privilege = privileges[i];
    if (privilege == GLOBAL(base,_any)) {
      // access from an unprivileged formal always denied
      return false;
    }
    ObjectRelation rel = privilege->relationTo(specializer);
    if (rel == ir_not_related) {
      // access denied unless one is a descendant of the other
      return false;
    }
  }
  // access granted to all arguments
  return true;
}


void CecilMethod::prettyPrint(bool doCR) {
  if (isPrivate()) {
    printf("private ");
  }
  printf("%s(", getName());
  
  OOPList& specs = getSpecializers();
  int len = specs.length();
  for (int i=0; i<len; i++) {
    printf("@%s", specs[i]->asBaseObj()->name());
    if (i < len-1) {
      printf(", ");
    }
  }
  printf(")");
  if (&realSpec) {
    printf("  Predicate method: (");
    int len = specializers.length();
    for (int i=0; i<len; i++) {
      printf("@%s", specializers[i]->asBaseObj()->name());
      if (i < len-1) {
	printf(", ");
      }
    }
    printf(")");
  }
  
  if (doCR) printf("\n");
}

void CecilMethod::printShort() {
  printf("CecilMethod 0x%x: ", this);
  prettyPrint(false);
}

void CecilMethod::print() {
  printShort();
  printf("\nSelector: \"%s\" (%d)", getName(), selector);
  printf("\nSpecializers: ");
  specializers.printShort();
  printf("\nrealSpec: ");
  realSpec.printShortZero();
  printf("\nvisibility: %s", isPrivate() ? "private" : "public");
}

// CecilNormalMethod::invoke() will in the future call the method and return
// its result. At present we have not integrated the method lookup
// with the compiled methods.

ReturnCode CecilNormalMethod::invoke(OOP* result, OOPList& args) {
  assert(code, "function has no code!");
  return (*code)(result, args);
}

ReturnCode CecilUncachedAccessorMethod::invoke(OOP* result, OOPList& args) {
  int offset = fieldOffset(args[0]);
  assert(code, "function has no code!");
  return (*code)(result, offset, args);
}

CecilMethod* CecilUncachedAccessorMethod::cachedVersion(OOPList& args) {
  int offset = fieldOffset(args[0]);
  return new CecilCachedAccessorMethod(selector, &specializers, &realSpec,
				       vis, code, offset);
}

ReturnCode CecilCachedAccessorMethod::invoke(OOP* result, OOPList& args) {
  assert(code, "function has no code!");
  return (*code)(result, offset, args);
}

// lookup(message, args, resenderAddr) finds the method in the set which
// applies to the current arguments.
// The algorithm is, consider each method. If it applies to the arguments,
// then remove each method from the applicable list which is less specific.
// If it does not apply then forget it. If there are 0 or > 1 methods left
// standing at the end, then return error condition.
// For resends, the resender arg is non-Null.  A method equal to the 
// resender is considered inapplicable.

CecilMethod* lookup(int selector, OOPList& args, OOPList& privileges,
		    bool isResend, bool testPreds, 
		    PredDecisionArray& predTests,
		    c_proc senderAddr = NULL) {
  int nargs = args.length();
  CecilMethodArray* mset = theMethodTable.getMatchingSet(selector, nargs);
  
  // This routine must be re-entrant, for predicate evaluation routines,
  // so candidates can't be static
  CecilMethodArray candidates(8);  
  candidates.fastClear(); // erase any candidates from past lookups
  
  int len = mset->length();
  for (int i=0; i<len; i++) {
    CecilMethod* cmeth = (*mset)[i];
    if (cmeth->getCode() != senderAddr &&
	cmeth->applies(args, testPreds, isResend, predTests)) {
      if (candidates.length() == 0) {
	candidates.add(cmeth);
      } else {
	for (int j=0; j<candidates.length(); j++) {
	  MethodRelation relative_spec = cmeth->relationTo(candidates[j]);
	  switch (relative_spec) {
	   case more_specific:
	    candidates.remove(candidates[j]);
	    j--;
	    break;
	   case less_specific:
	   case same_args:
	    goto do_not_add;
	   case dont_know:
	    break;
	  }
	}
	candidates.add(cmeth);
       do_not_add: ;
      }
    }
  }
  
  switch (candidates.length()) {
   case 0:
    printf("error: message \"%s\" not understood.\n", MsgNames[selector]);
    fatalHandler();
    exit(-1);
   case 1:
    // success!
    break;
   default:
    printf("error: message \"%s\" ambiguous. Could not decide among:\n", 
	   MsgNames[selector]);
    len = candidates.length();
    for (i=0; i<len; i++) {
      candidates[i]->prettyPrint();
    }
    fatalHandler();
    exit(-1);
  }

  CecilMethod* cmeth = candidates[0];

  if (!cmeth->checkEncapsulation(privileges)) {
    printf("error: message \"%s\" accessing private method.\n",
	   MsgNames[selector]);
    fatalHandler();
    exit(-1);
  }

  return cmeth;
}


// lookupCache first checks the methodCache for a matching entry, and does
// a slow lookup if it misses in the cache.

ReturnCode lookupCache(int selector, OOP* resultAddr,
		       OOPList& lookupArgs, OOPList& invokeArgs,
		       OOPList& privileges,
		       int constrainedPositionsMask, bool isResend,
		       bool testPreds, c_proc senderAddr = NULL) {
  if (printDebugging) {
    printf("%s %s... ", senderAddr ? "Resending" : "Sending", 
	   MsgNames[selector]);
    fflush(stdout);
  }
  
  // First probe the cache
  CecilMethod* cmeth = theMethodCache.lookup(selector, lookupArgs, privileges,
					     constrainedPositionsMask,
					     senderAddr);

  if (cmeth) {
    // hit in cache!
    if (printDebugging) {
      printf("hit in cache: ");
      cmeth->prettyPrint();
    }
  
  } else {
    // Probe missed.  Do slow lookup.
    if (printDebugging) {
      printf("missed in cache; doing lookup... ");
      fflush(stdout);
    }

    PredDecisionArray predTests;
    cmeth = lookup(selector, lookupArgs, privileges,
		   isResend, testPreds, predTests, 
		   senderAddr);

    if (printDebugging) {
      printf("found: ");
      cmeth->prettyPrint();
    }

    // Add to cache.
    
    // compute a faster method to put in the cache
    CecilMethod* cachedVersion = cmeth->cachedVersion(invokeArgs);

    if (printDebugging) {
      if (cachedVersion != cmeth) {
	printf("\tcaching: ");
	cachedVersion->prettyPrint();
      }
    }

    if (cmeth->isPublic()) {
      // privileges don't matter, so put it in the cache that way
      OOPList0 noPrivileges;
      theMethodCache.add(selector, lookupArgs, noPrivileges,
			 constrainedPositionsMask, senderAddr, predTests,
			 cachedVersion);
    } else {
      // need to remember what the privileges were that allowed this lookup
      theMethodCache.add(selector, lookupArgs, privileges,
			 constrainedPositionsMask, senderAddr, predTests,
			 cachedVersion);
    }
  }
  
  // invoke the method
  return cmeth->invoke(resultAddr, invokeArgs);
}


// addMethod puts a new method in the table.

void addMethod(int selector, c_proc func, MethodVisibility v,
	       OOPList* specializers, OOPList* realSpec = NULL) {
  CecilMethod* cmeth =
    new CecilNormalMethod(selector, specializers, realSpec, v, func);
  theMethodTable.add(cmeth);
}

void addAccessorMethod(int selector, ca_proc func, char* fieldName,
		       MethodVisibility v,
		       OOPList* specializers, OOPList* realSpec = NULL) {
  CecilMethod* cmeth =
    new CecilUncachedAccessorMethod(selector, specializers, realSpec, v,
				    func, fieldName);
  theMethodTable.add(cmeth);
}
