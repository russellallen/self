/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "labelSet.hh"
# pragma implementation "labelSet_inline.hh"
# include "_labelSet.cpp.incl"


LabelSet::LabelSet() {
  maxIndex = 32; 
  index = 0;
  allocateArrays();
}


LabelInfo* LabelSet::at( oop label) {
  for ( int32 i = 0;  i < index; ++i)
    if ( labels[i]->label == label )
      return labels[i];
  return NULL;
}


// called by label def, simple branch, indexed branch
// defines label record, allocates literal if needed,
//  checks stack_depth
// returns literal index (or 0 if not needed) or -1 for error
 
int32 LabelSet::RecordLabelInfo( AbstractByteCode* b, oop label, int32 sd, 
                              LabelOccurrence why,  int32 bci) {
  static char buf[BUFSIZ];                       
  LabelInfo* li= at(label);
  if ( li == NULL ) {
    if (index == maxIndex)
      grow();
    labels[index++] = li= new LabelInfo(label, sd, bci, -1);
    li->isDefined = why == defineLabel;
  }
  else {
    if ( li->stack_depth != sd ) {
      b->errorMessage = buf;
      char psb[BUFSIZ];
      label->print_string(psb);
      sprintf(buf,
              "Label %s has stack depth %d at bytecode %d, "
              "but has differing stack depth %d at bytecode %d",
              psb,
              li->stack_depth, li->bci,
              sd, bci);
      return -1;
    }
    if ( why == defineLabel ) {
      if ( li->isDefined ) { 
        b->errorMessage = buf;
        char psb[BUFSIZ];
        label->print_string(psb);
        sprintf(buf,
          "Label %s is multiply defined at bytecodes %d and %d",
          psb,
          li->bci, bci);
        return -1;
      }
      li->bci = bci;
      li->isDefined = true;
    }
  }
  // dont alloc lit for label def, might be used in case only
  if (li->literalIndex == -1  &&  why == simpleBranch)
    li->literalIndex= b->GenLabelLiteral();
  return why == simpleBranch  ?  li->literalIndex  :  0;
}


// called for indexed branch; check labels, gen pc vector

int32 LabelSet::RecordLabelVectorInfo( AbstractByteCode* b, objVectorOop labels,
                                       int32 sd, int32 bci) {
  objVectorOop pcs= labels->clone(); // want same size as labels
  for (int32 i = 0,  n = labels->length();  i < n;  ++i)
    if ( RecordLabelInfo( b, labels->obj_at(i), sd, indexedBranch, bci ) == -1)
      return -1;
  return b->GenLiteral(pcs);
}  


void LabelSet::grow() {
  maxIndex <<= 1;
  LabelInfo** ol = labels;
  allocateArrays();
  for ( int32 i = 0;  i < index; ++i ) {
    labels[i] = ol[i];
  }
}



bool LabelSet::ResolveLabel( AbstractByteCode* b,
                             oop lbl, objVectorOop pcs, int32 i) {
  static char buf[BUFSIZ];
  LabelInfo* li = at(lbl);
  if ( li == NULL  ||  !li->isDefined) { 
      char psb[BUFSIZ];
      lbl->print_string(psb);
      b->errorMessage = buf;
      sprintf(buf, "Label %s is undefined", psb);
    return false;
  }
  pcs->obj_at_put(i, as_smiOop(li->bci));
  return true;
}


void LabelSet::oops_do(oopsDoFn f) {     
  for (int32 i = 0;  i < index;  ++i)
    (*f)(&labels[i]->label); 
  resort();
}
