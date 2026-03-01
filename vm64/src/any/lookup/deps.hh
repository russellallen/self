/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



const int32 DependentsArraySize = 10000;

class dependencyList: public ResourceObj {
private:
  static nmln* dependentsArrayS;
  nmln* top;
  
public:
  dependencyList() {
    if (dependentsArrayS == NULL)
      dependentsArrayS = (nmln*)
        AllocateHeap(DependentsArraySize * sizeof(nmln), "dependents buffer");
    top = dependentsArrayS; }
  
# if GENERATE_DEBUGGING_AIDS
public:
  bool includes(nmln* dep);
# endif
  
private:
  bool isInDependentsArray(nmln* dep) {
    return dep >= dependentsArrayS && dep < top; }

public:
  bool alreadyThere(nmln* dep) {
    bool b = (isInDependentsArray(dep->next) || isInDependentsArray(dep->prev));
    // if it's already there, it'll be adjacent to the current nmln
    // uncommented assert below because it's slow  -Urs 9/92
    // assert(b == includes(dep), "auugh!");
    return b; }

  nmln *start() { return dependentsArrayS; }
  nmln *end() { return top; }

  void add(nmln* dep);
  void add(slotsMapDeps *m, slotDesc* s) {
    add(m->dependents_for_slot(s)); }
  void add(Map* m) {
    if (m->can_have_dependents()) {
      add(((slotsMapDeps*) m)->add_slot_dependents());
    }
  }
  
  void remove();
  
  int32 length() { return top - dependentsArrayS; }
  
  bool isEmpty() { return length() == 0; }
  bool nonEmpty() { return ! isEmpty(); }
};


const int32 AssignableDependentsArraySize = 100;

class assignableDependencyList: public ResourceObj {
 public:
  static objectLookupTarget** dependentsArrayS;
  objectLookupTarget** top;
  
  assignableDependencyList() {
    if (dependentsArrayS == NULL)
      dependentsArrayS = (objectLookupTarget**)
        AllocateHeap(AssignableDependentsArraySize *
                     sizeof(objectLookupTarget*),
                     "assignable dependents buffer");
    top = dependentsArrayS; }
  
  objectLookupTarget** start() { return dependentsArrayS; }
  void add(objectLookupTarget* target);
  
  void remove() {}
  
  int32 length() { return top - dependentsArrayS; }
  
  bool isEmpty() { return length() == 0; }
  bool nonEmpty() { return ! isEmpty(); }
};
