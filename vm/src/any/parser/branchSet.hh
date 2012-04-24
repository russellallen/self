/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// I implement a set for recording the branches.
// Right now this is a very slow set.

class LabelSet;

class BranchInfo: public ResourceObj {
public:
  bool isIndexed;
  int32 literalIndex;
  oop   labelOrLabels;
  
  BranchInfo(bool isI, int32 litI, oop lls) 
  : ResourceObj() {
    isIndexed= isI;  literalIndex = litI;  labelOrLabels= lls; 
  }
  bool ResolveBranch( AbstractByteCode* b, 
                      LabelSet* labelSet, objVectorOop literals);
};

class BranchSet: public ResourceObj {
 public:
  
  // instance variables
  BranchInfo**   branches;
  int32 index;
  int32 maxIndex;


  // constructor
  BranchSet() {
    maxIndex = 32; 
    index = 0;
    allocateArrays();
  }
  
    
  void RecordBranch( bool isIndexed, 
                     int32 literalIndex, oop labelOrLabels);
  
  bool ResolveBranches( AbstractByteCode* b, LabelSet* labelSet, 
                        objVectorOop literals);
  
  void grow();
  
  void allocateArrays() {
    branches= NEW_RESOURCE_ARRAY(BranchInfo*,   maxIndex); 
  }
    
  // preserve operation
  void oops_do(oopsDoFn f);
  
 protected:
};

