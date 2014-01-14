/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "deps.hh"
# include "_deps.cpp.incl"

nmln* dependencyList::dependentsArrayS;

# if GENERATE_DEBUGGING_AIDS
  bool dependencyList::includes(nmln* dep) {
    for (nmln* d = dependentsArrayS; d < top; d ++) {
      // check to see if already in dependents array
      if (d->next == dep || d->prev == dep) {
        return true;
      }
    }
    return false;
  }
# endif

void dependencyList::add(nmln* dep) {
  if (alreadyThere(dep)) {
    return;
  }
  if (length() >= DependentsArraySize) {
    fatal("dependency list overflow");
  }
  top->init();
  top->check_alignment(); // for Intel
  dep->add(top);
  top++;
}

void dependencyList::remove() {
  for (nmln* d = dependentsArrayS; d < top; d ++) {
    d->remove();
  }
}

objectLookupTarget** assignableDependencyList::dependentsArrayS;

void assignableDependencyList::add(objectLookupTarget* target) {
  for (objectLookupTarget** t = dependentsArrayS; t < top; t ++) {
    if (*t == target) {
      // already in dependency list; ignore this one
      return;
    }
  }
  if (length() >= AssignableDependentsArraySize) {
    ShouldNotReachHere(); // assignable dependency list overflow
  }
  *top++ = target;
}
