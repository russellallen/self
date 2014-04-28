/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// I implement a set for recording the defined labels.
// Then with parallel arrays, I store stack_depths and pcs for code generation.
// Right now this is a very slow set.

class LabelInfo: public ResourceObj {
public:
  oop label;
  int32 stack_depth;
  int32 bci;
  int32 literalIndex;
  bool isDefined;
  
  LabelInfo(oop l, int32 sd, int32 b, int32 li) : ResourceObj() {
    label= l;  stack_depth= sd;  bci= b;  literalIndex= li;
    isDefined = false;
  }
};

enum LabelOccurrence {
  defineLabel, simpleBranch, indexedBranch
};


class AbstractByteCode;

class LabelSet: public ResourceObj {
 public:
  
  // instance variables
  LabelInfo**   labels;
  int32 index;
  int32 maxIndex;


  // constructor
  LabelSet();
  
  LabelInfo* at( oop label);
  
  int32 RecordLabelInfo( AbstractByteCode* b, oop label, int32 sd, 
                         LabelOccurrence why,  int32 bci);
  
  int32 RecordLabelVectorInfo( AbstractByteCode* b, objVectorOop labels,
                               int32 sd, int32 bci);
  
  bool ResolveLabel( AbstractByteCode* b, oop lbl, objVectorOop pcs, int32 i);

    
  
  // preserve operation
  void oops_do(oopsDoFn f);
  
 protected:
  void resort() {} /* would be real if I were faster */
  void grow();
  
  void allocateArrays() {
    labels= NEW_RESOURCE_ARRAY(LabelInfo*,   maxIndex); 
  }
};

