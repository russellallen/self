/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "branchSet_inline.hh"
# include "generation_inline.hh"
# include "labelSet_inline.hh"
# include "objVectorOop.hh"
# include "space_inline.hh"


bool BranchInfo::ResolveBranch( AbstractByteCode* b, 
                                LabelSet* labelSet, objVectorOop literals) {
  if (!isIndexed) {
    return labelSet->ResolveLabel(b, labelOrLabels,
                                  literals, literalIndex);
  }
  assert_objVector(labelOrLabels, "just checking");
  objVectorOop lbls= objVectorOop(labelOrLabels);
  for (int32 i = 0,  n = lbls->length();  i < n; ++i)
    if ( !labelSet->ResolveLabel( b, lbls->obj_at(i), lbls, i))
      return false;
  return true;
}


bool BranchSet::ResolveBranches(AbstractByteCode* b, LabelSet* labelSet, 
                                objVectorOop literals) {
  for ( int32 i = 0;  i < index;  ++i) {
    if (!branches[i]->ResolveBranch( b, labelSet, literals))
      return false;
  }
  return true;
}


void BranchSet::RecordBranch( bool isIndexed, int32 literalIndex, 
                              oop labelOrLabels) {
  if (index == maxIndex) {
    grow();
  }
  branches[index] = new BranchInfo(isIndexed, literalIndex, labelOrLabels );
  ++index;
}


void BranchSet::grow() {
  maxIndex <<= 1;
  BranchInfo** b = branches;
  allocateArrays();
  for ( int32 i = 0;  i < index; ++i ) {
    branches[i] = b[i];
  }
}


void BranchSet::oops_do(oopsDoFn f) {     
  for (int32 i = 0;  i < index;  ++i)
    (*f)(&branches[i]->labelOrLabels); 
}
