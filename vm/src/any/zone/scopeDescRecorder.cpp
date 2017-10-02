/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "label_inline.hh"
# include "nmethodScopes.hh"
# include "pcDesc.hh"
# include "scopeDescRecorder.hh"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


# define INITIAL_SLOT_SIZE     10
# define INITIAL_EXPR_SIZE     10
# define INITIAL_BLOCK_SIZE    10

# define INITIAL_OOPS_SIZE    100
# define INITIAL_VALUES_SIZE  100

const u_char nameDescHeaderByte::code_width     = 2;
const u_char nameDescHeaderByte::index_width    = 5;
const u_char nameDescHeaderByte::hasId_bit_num  = code_width+index_width;
const u_char nameDescHeaderByte::max_code       = nthMask(code_width);
const u_char nameDescHeaderByte::illegal_value  = nthMask(BitsPerByte);
const u_char nameDescHeaderByte::no_index       = nthMask(index_width) - 1;
const u_char nameDescHeaderByte::max_index      = nthMask(index_width) - 2;

const u_char scopeDescHeaderByte::code_width        = 3;
const u_char scopeDescHeaderByte::lookup_width      = 3;
const u_char scopeDescHeaderByte::lite_bit_num      = code_width+lookup_width;
const u_char scopeDescHeaderByte::nameDescs_bit_num = lite_bit_num+1;
const u_char scopeDescHeaderByte::max_code          = nthMask(code_width);
const u_char scopeDescHeaderByte::max_lookup        = nthMask(lookup_width);

class Vector: public ResourceObj {
 public:
  fint index;
  fint size;

  fint offset;

  int32* values;

  Vector(fint size);

  fint length() { return index; }
  void extend(fint newSize);
  fint insertIfAbsent(int32 value);  // returns index for value
  void copy_to(int32*& addr);
};

class ByteArray : public ResourceObj {
 private:
  char* array;
  fint  top;
  fint  max;

  void extend();

 public:
  fint size()   { return top; }
  char* start() { return array; }

  ByteArray(fint size);

  void appendByte(u_char p) {
    if (top+sizeof(u_char) > max) extend();
    array[top++] = p;
  }

  void appendHalf(fint p);
#ifdef UNUSED
  void appendWord(int32 p);
#endif

  void putByteAt(u_char p, fint offset) {
    assert( offset < max, "index out of bound");
    array[offset] = p;
  }

  void putHalfAt(fint p, fint offset) {
    assert(fits_in_halfword(p), "oops!");
    assert( offset + 1 < max, "index out of bound");
    array[offset    ] = p >> BYTE_WIDTH;
    array[offset + 1] = lowerBits(p, 8);
  }

  // Cut off some of the generated code.
  void setTop(fint offset) {
    assert( this->top >= offset, "A smaller top is expected");
    this->top = offset;
  }

  void alignToWord();
  void copy_to(int32*& addr);
};

NameNode* newValueName(oop value) {
  if (value->is_block()) {
    return new BlockValueName((blockOop)value);
  } else {
    return new ValueName(value);
  }
}

bool NameNode::genHeaderByte(ScopeDescRecorder* rec, u_char code,
                             fint index) {
  // Since id is most likely to be 0, the info part of the header byte
  // indicates if it is non zero.
  // Experiments show id is zero in at least 90% of the generated nameDescs.
  // returns true if index could be inlined in headerByte.
  nameDescHeaderByte b;
  bool   can_inline  = index <= b.max_index;
  u_char coded_index = can_inline ? index : b.no_index;
  b.pack(code, id != 0, coded_index);
  rec->codes->appendByte( b.value());
  if (id && code != ILLEGAL_CODE) rec->genValue(id);
  return can_inline;
} 

inline fint ScopeDescRecorder::getValueIndex(int32 v) {
  // if v fits into 7 bits inline the value instead of creating index
  if ( 0 <= v && v <= MAX_INLINE_VALUE) return v;
  return MAX_INLINE_VALUE + 1 + values->insertIfAbsent(v);
}

inline fint ScopeDescRecorder::getOopIndex(oop o) {
  return o == 0 ? 0 : oops->insertIfAbsent((int32)o) + 1;
}

void LocationName::generate(ScopeDescRecorder* rec) {
  fint index = rec->getValueIndex(l);
  if (!genHeaderByte(rec, LOCATION_CODE, index)) rec->genIndex(index);
}

void ValueName::generate(ScopeDescRecorder* rec) {
  fint index = rec->getOopIndex(value);
  if (!genHeaderByte(rec, VALUE_CODE, index)) rec->genIndex(index);
}

void MemoizedName::generate(ScopeDescRecorder* rec) {
  fint index = rec->getValueIndex(l);
  if (!genHeaderByte(rec, MEMOIZEDBLOCK_CODE, index)) rec->genIndex(index);
  rec->genOop(oop(blk));
}

void BlockValueName::generate(ScopeDescRecorder* rec) {
  fint index = rec->getOopIndex(oop(blk));
  if (!genHeaderByte(rec, BLOCKVALUE_CODE, index)) rec->genIndex(index);
}

void IllegalName::generate(ScopeDescRecorder* rec) {
  (void) genHeaderByte(rec, ILLEGAL_CODE, 0);
}


// Please encapsulate iterator.
static ScopeDesc*     _sd;
static nmethodScopes* _scopes;
static ScopeDesc*     _getNextScopeDesc() {
  _sd = _scopes->getNext(_sd);
  if (!_sd) fatal("out of scopeDescs");
  return _sd;
}

Vector::Vector(fint sz) {
  size   = sz;
  index  = 0;
  values = NEW_RESOURCE_ARRAY(int32, sz);
}

fint Vector::insertIfAbsent(int32 value){
  for (fint i = 0; i < index; i ++)
    if (values[i] == value)
      return i;
  if (index == size)
    extend(size*2 + 1);
  assert( index < size, "not big enough");
  values[index] = value;
  assert(index < 0x10000, "16 bit index overflow");
  return index++;
}

void Vector::extend(fint newSize) {
  int32* newValues = NEW_RESOURCE_ARRAY(int32, newSize);
  for(fint i=0;i < index; i++)
    newValues[i] = values[i];
  values = newValues;
  size   = newSize;
}

void Vector::copy_to(int32*& addr) {
  for(fint i=0;i < length(); i++) {
    *addr++ = values[i];
  }
}

ByteArray::ByteArray(fint size) {
  array = NEW_RESOURCE_ARRAY(char, size); 
  max   = size;
  top   = 0;
}

void ByteArray::extend() {
  fint  newMax = max*2 + 1;
  char* newArray = NEW_RESOURCE_ARRAY(char, newMax);
  for(fint i=0;i < top; i++)
    newArray[i] = array[i];
  array = newArray;
  max  = newMax;
}

void ByteArray::appendHalf(fint p) {
  assert(fits_in_halfword(p), "oops!");
  while (top+sizeof(int16) > max) extend();
  // Saving the half as two bytes to avoid alignment problem.
  array[top++] = p >> BYTE_WIDTH;
  array[top++] = lowerBits(p, 8);
}

#ifdef UNUSED
void ByteArray::appendWord(int32 p) {
  while (top+sizeof(int32) > max) extend();
  int32* s = (int32*) &array[top];
  *s = p;
  top += sizeof(int32);
}
#endif

void ByteArray::alignToWord() {
  fint fill_size = (sizeof(int32) - (size()%sizeof(int32))) % sizeof(int32);
  for(fint i = 0; i < fill_size; i++)
    appendByte(0); 
}

void ByteArray::copy_to(int32*& addr) {
  int32* fromAddr = (int32*) start();
  fint len = (size() + sizeof(int32) - 1) / sizeof(int32);
  for(fint i= 0; i < len; i++) {
    *addr++ = *fromAddr++;
  }
}

class NameList: public ResourceObj {
 public:
  fint end;
  fint size;
  fint count;

  NameNode** nodes;

  NameList(fint size);
  bool is_empty() { return end == 0; }
  void extend(fint newSize);
  void generate(ScopeDescRecorder* rec);
  void insert(fint index, NameNode* node);
};

NameList::NameList(fint sz) {
  size  = sz;
  end   = 0;
  nodes = NEW_RESOURCE_ARRAY(NameNode*, size);
  for(fint i= 0 ; i < sz; i++) nodes[i] = NULL;
  count = 0;
}

void NameList::extend(fint newSize) {
  NameNode** newNodes = NEW_RESOURCE_ARRAY(NameNode*, newSize);
  fint i;
  for (i= 0; i < size; i++) {
    newNodes[i] = nodes[i];
  }
  for (    ; i < newSize; i++) {
    newNodes[i] = NULL;
  }
  nodes = newNodes;
  size  = newSize;
}

void NameList::generate(ScopeDescRecorder* rec) {
  for(fint i=0;i < end; i++){
    if (nodes[i]) {
      nodes[i]->generate(rec);
    }
  }
}

void NameList::insert(fint index, NameNode* node){
  if (index>=size) extend( index >= size*2 ? index*2 : size*2);
  if (index>=end)  end = index +1;
  assert( index < size, "did not extend enough");
  assert( nodes[index] == NULL,"overlapping name desc");
  nodes[index] = node;
}

// Class hierarchy for nodes generating scopeDescs.
// ScopeInfoClass
// -- CodeScopeNode
//    -- MethodScopeNode
//    -- TopLevelBlockScopeNode
//     -- BlockScopeNode
//    -- DeadBlockScopeNode
// -- AccessScopeNode
//    --DataAccessScopeNode
//    --DataAssignmentScopeNode
// -- RemoteAccessScopeNode
//    --RemoteDataAccessScopeNode
//    --RemoteDataAssignmentScopeNode

# define INVALID_OFFSET -1

class ScopeInfoClass: public ResourceObj {
public:
  ScopeLookupKey* key;
  int32      senderBCI;
  NameList*  slotList;
  NameList*  exprList;
  NameList* blockList;

  fint offset; // byte offset to the encoded scopeDesc
               // Initial value is  INVALID_OFFSET
  bool lite;
  bool usedInPcs;
  bool visible;

  bool hasNameDescs() {
    return !lite && 
          (   ! slotList->is_empty() 
           || ! exprList->is_empty() 
           || !blockList->is_empty());
  }

  ScopeInfo scopesHead;
  ScopeInfo scopesTail;
  ScopeInfo next;

  ScopeInfoClass(ScopeLookupKey* key, bool lite, fint senderBCI, bool vis);

  void addNested(ScopeInfo scope);

  virtual u_char code() = 0;

  virtual void generate(ScopeDescRecorder* rec, fint senderScopeOffset);
  void generateBody(ScopeDescRecorder* rec, fint senderScopeOffset);

  bool computeVisibility();

  virtual void verify(ScopeDesc* sd);
  void verifyBody();
};

class PcDescNode: public ResourceObj {
public:
  int32     pcOffset;
  ScopeInfo scope;
  int32     bci;
};

class PcDescInfoClass : public ResourceObj {
public:
  PcDescNode*   nodes;
  fint          end;
  fint          size;

  PcDescInfoClass(fint size);
  fint length() { return end; }
  void extend(fint newSize);
  void add(fint pcOffset, ScopeInfo scope, fint bci);
  void mark_scopes();
  void copy_to(int32*& addr);
};

ScopeInfoClass::ScopeInfoClass(ScopeLookupKey* k, bool lte,
                               fint sBCI, bool vis) {
  key        = k;
  lite       = lte;
  senderBCI  = sBCI;
  slotList   = new NameList(INITIAL_SLOT_SIZE);
  exprList   = new NameList(INITIAL_EXPR_SIZE);
  blockList  = new NameList(INITIAL_BLOCK_SIZE);
  offset     = INVALID_OFFSET;
  scopesHead = NULL;
  scopesTail = NULL;
  usedInPcs  = false;
  visible    = vis;
}

void ScopeInfoClass::addNested(ScopeInfo scope) {
  scope->next = NULL;
  if (scopesHead == NULL) {
    scopesHead = scopesTail = scope; 
  } else {
    scopesTail->next = scope;
    scopesTail = scope;
  }
}

void ScopeInfoClass::generate(ScopeDescRecorder* rec, fint senderScopeOffset) {
  offset = rec->codes->size();
  if (offset == 0) {
    // Since the lookupKey information for this scope is the same for
    // the compiled nmethod omit saving it.
    rec->genScopeDescHeader(code(), 0, lite, hasNameDescs());
  } 
  else {
    u_char index = getCommonLookupTypeIndex(key->lookupType);
    rec->genScopeDescHeader(code(), index, lite, hasNameDescs());
    if (index == 0) rec->genValue(key->lookupType);
    
    rec->genOop(key->selector);

    if (needsDelegatee(key->lookupType)) { 
      // delegatee is only used in less the 1% in the generated scopeDescs.
      rec->genOop(key->delegatee);
    }

    rec->genValue(offset - senderScopeOffset);
    rec->genValue(senderBCI);
  }
}

void ScopeInfoClass::generateBody(ScopeDescRecorder* rec, 
                                  fint senderScopeOffset) {
  if (hasNameDescs()) {
    slotList->generate(rec);
    
    fint exprStart = rec->codes->size();
    exprList->generate(rec);

    fint blockStart = rec->codes->size();
    blockList->generate(rec);
    
    rec->updateScopeDescHeader( offset, 
                                exprStart, 
                                blockStart,
                                rec->codes->size());
  }
  
  for(ScopeInfo p = scopesHead; p  != NULL; p = p->next) {
    if (p->visible) {
      p->generate(rec, offset);
      p->generateBody(rec, offset);
    }
  }
}

void ScopeInfoClass::verify(ScopeDesc* sd) {
  if (key->lookupType != sd->key.lookupType) fatal("lookupType is wrong");
  if (key->selector   != sd->key.selector)   fatal("selector is wrong");
  if (key->delegatee  != sd->key.delegatee)  fatal("delegatee is wrong");
  if (senderBCI != IllegalBCI && senderBCI != sd->senderByteCodeIndex())
    fatal("senderBCI is wrong");
}

void ScopeInfoClass::verifyBody() {
  for(ScopeInfo p = scopesHead; p  != NULL; p = p->next) {
    if (p->visible) {
      p->verify(_getNextScopeDesc());
      p->verifyBody();
    }
  }
}

bool ScopeInfoClass::computeVisibility() {
  for(ScopeInfo p = scopesHead; p  != NULL; p = p->next) {
    visible = p->computeVisibility() || visible;
  }
  visible = visible || (usedInPcs && GenerateLiteScopeDescs) || !lite;
  return visible;
}

class CodeScopeNode: public ScopeInfoClass {
 public:
  oop  method;
  fint scopeID;

  CodeScopeNode(ScopeLookupKey* k, oop meth, 
                bool lte, fint scopID, fint sBCI, bool vis)
    : ScopeInfoClass(k, lte, sBCI, vis) { 
      method    = meth;
      scopeID   = scopID;
    }

  void generate(ScopeDescRecorder* rec, fint senderScopeOffset);

  void verify(ScopeDesc* sd);
};

void CodeScopeNode::generate(ScopeDescRecorder* rec,
                                  fint senderScopeOffset) {
  ScopeInfoClass::generate(rec, senderScopeOffset);
  rec->genOop(method);
  rec->genValue(scopeID);
}

void CodeScopeNode::verify(ScopeDesc* sd) {
  ScopeInfoClass::verify(sd);
  if (!sd->isCodeScope()) fatal("CodeScope expected");
  if (senderBCI != IllegalBCI && senderBCI != sd->senderByteCodeIndex())
    fatal("senderBCI is wrong");
  if (method    != sd->method())              fatal("method is wrong");
  if (scopeID   != sd->scopeID())             fatal("scopeID is wrong");
}  

class MethodScopeNode: public CodeScopeNode {
 public:
  NameNode* self_name;
  oop       self_map;
  oop  methodHolder_or_map;

  u_char code() { return METHOD_CODE; }

  MethodScopeNode(ScopeLookupKey* k, oop meth, 
                  NameNode* self_nm, oop self_mp, oop meth_holder, 
                  bool lte, fint sID, fint sBCI, bool vis)
    : CodeScopeNode(k, meth, lte, sID, sBCI, vis) {
      assert(lte || !self_nm->isIllegal(), "self is always visible");
      self_name = self_nm;
      self_map  = self_mp;
      methodHolder_or_map = meth_holder;
  }

  void generate(ScopeDescRecorder* rec, fint senderScopeOffset);

  void verify(ScopeDesc* sd);
};

void MethodScopeNode::generate(ScopeDescRecorder* rec,
                               fint senderScopeOffset) {
  CodeScopeNode::generate(rec,senderScopeOffset);
  self_name->generate(rec);
  rec->genOop(self_map);
  rec->genOop(methodHolder_or_map);
}

void MethodScopeNode::verify(ScopeDesc* sd) {
  CodeScopeNode::verify(sd);
  if (!sd->isMethodScope()) fatal("MethodScope expected");
  if (methodHolder_or_map != sd->methodHolder_or_map())
    fatal("method holder is wrong");
}  

class TopLevelBlockScopeNode: public CodeScopeNode {
 public:
  NameNode* self_name;
  NameNode* cachedSelf_name; // cached copy  (for PPC)
  oop       self_map;
  oop       methodHolder_or_map;
  NameNode* block_name;
  NameNode* cachedBlock_name; // cached copy (for PPC)
  mapOop    _receiverMapOop;

  u_char code() { return TOPLEVELBLOCK_CODE; }

  TopLevelBlockScopeNode(ScopeLookupKey* k, oop meth, mapOop rm,
                         NameNode* self_nm, NameNode* self_nm2, oop self_mp, 
                         oop meth_holder, NameNode* receiver, NameNode* receiver2,
                         bool lte, fint scpID, fint sndrBCI, bool vis)
    : CodeScopeNode(k, meth, lte, scpID, sndrBCI, vis) { 
      assert(lte || !self_nm->isIllegal(), "self is always visible");
      assert(lte || !receiver ->isIllegal(), "receiver is always visible");
      self_name = self_nm;
      cachedSelf_name = self_nm2;
      self_map  = self_mp;
      methodHolder_or_map = meth_holder;
      block_name    = receiver;
      cachedBlock_name = receiver2;
      _receiverMapOop = rm;
  }

  void generate(ScopeDescRecorder* rec, fint senderScopeOffset);

  void verify(ScopeDesc* sd);

  mapOop receiverMapOop() { return _receiverMapOop; }
  Map*   receiverMap() { return receiverMapOop()->map_addr(); }
};

void TopLevelBlockScopeNode::generate(ScopeDescRecorder* rec, 
                                      fint senderScopeOffset) {
  CodeScopeNode::generate(rec, senderScopeOffset);
  self_name->generate(rec);
  cachedSelf_name->generate(rec);
  rec->genOop(self_map);
  rec->genOop(methodHolder_or_map);
  block_name->generate(rec);
  cachedBlock_name->generate(rec);
  assert(receiverMapOop()->is_map(), "receiver map should be a map");
  rec->genOop(receiverMapOop());
}

void TopLevelBlockScopeNode::verify(ScopeDesc* sd) {
  CodeScopeNode::verify(sd);
  if (!sd->isTopLevelBlockScope()) fatal("TopLevelBlockScope expected");
  if (methodHolder_or_map != sd->methodHolder_or_map())
    fatal("method holder is wrong");
}  

class BlockScopeNode: public CodeScopeNode {
 public:
  NameNode* blockName;
  mapOop _receiverMapOop;
  ScopeInfo parent;

  BlockScopeNode(ScopeLookupKey* k, oop meth, mapOop rm,
                 NameNode* receiver, ScopeInfo parnt,
                 bool lte, fint scpID, fint sndrBCI, bool vis) 
    : CodeScopeNode(k, meth, lte, scpID, sndrBCI, vis) { 
    assert(lte || !receiver ->isIllegal(), "receiver is always visible");
    blockName = receiver;
    _receiverMapOop = rm;
    parent    = parnt;
  }

  u_char code() { return BLOCK_CODE; }

  void generate(ScopeDescRecorder* rec, fint senderScopeOffset);

  void verify(ScopeDesc* sd);

  mapOop receiverMapOop() { return _receiverMapOop; }
  Map*   receiverMap() { return receiverMapOop()->map_addr(); }
};

void BlockScopeNode::generate(ScopeDescRecorder* rec, fint senderScopeOffset) {
  CodeScopeNode::generate(rec, senderScopeOffset);
  rec->genValue(offset - parent->offset);
  blockName->generate(rec);
  assert(receiverMapOop()->is_map(), "receiver map should be a map");
  rec->genOop(receiverMapOop());
}

void BlockScopeNode::verify(ScopeDesc* sd) {
  CodeScopeNode::verify(sd);
  if (!sd->isLiveBlockScope()) fatal("BlockScope expected");
} 

class DeadBlockScopeNode: public CodeScopeNode {
 public:
  NameNode* block_name;

  u_char code() { return DEADBLOCK_CODE; }

  DeadBlockScopeNode(ScopeLookupKey* k, oop meth, NameNode* block_nm,
                     bool lte, fint scpID, fint sndrBCI, bool vis)
    : CodeScopeNode(k, meth, lte, scpID, sndrBCI, vis) { 
      block_name    = block_nm;
  }

  void generate(ScopeDescRecorder* rec, fint senderScopeOffset);

  void verify(ScopeDesc* sd);
};

void DeadBlockScopeNode::generate(ScopeDescRecorder* rec,
                                  fint senderScopeOffset) {
  CodeScopeNode::generate(rec, senderScopeOffset);
  block_name->generate(rec);
}

void DeadBlockScopeNode::verify(ScopeDesc* sd) {
  CodeScopeNode::verify(sd);
  if (!sd->isDeadBlockScope()) fatal("DeadBlockScope expected");
}  

class AccessScopeNode: public ScopeInfoClass {
 public:
  NameNode* self_name;
  oop self_map;
  oop methodHolder_or_map;

  AccessScopeNode(ScopeLookupKey* k, NameNode* self_nm, oop self_mp,
                  oop meth_holder, fint sndrBCI, bool vis)
    : ScopeInfoClass(k, false, sndrBCI, vis) {
    self_name = self_nm;
    self_map  = self_mp;
    methodHolder_or_map = meth_holder;
  }

  void generate(ScopeDescRecorder* rec, fint senderScopeOffset);

  void verify(ScopeDesc* sd);
};

void AccessScopeNode::generate(ScopeDescRecorder* rec,
                               fint senderScopeOffset) {
  ScopeInfoClass::generate(rec, senderScopeOffset);
  self_name->generate(rec);
  rec->genOop(self_map);
  rec->genOop(methodHolder_or_map);
}

void AccessScopeNode::verify(ScopeDesc* sd) {
  ScopeInfoClass::verify(sd);
  if (!sd->isAccessScope())                fatal("AccessScope expected");
  if (methodHolder_or_map != sd->methodHolder_or_map())
    fatal("method holder is wrong");
}

class DataAccessScopeNode: public AccessScopeNode {
 public:
  DataAccessScopeNode(ScopeLookupKey* k, NameNode* self_nm, oop self_mp,
                      oop meth_holder, fint sndrBCI, bool vis)
    : AccessScopeNode(k, self_nm, self_mp, meth_holder, sndrBCI, vis){}
  u_char code() { return DATAACCESS_CODE; }
};

class DataAssignmentScopeNode: public AccessScopeNode {
 public:
  DataAssignmentScopeNode(ScopeLookupKey* k, NameNode* self_nm,
                          oop self_mp, oop meth_holder, fint sndrBCI,
                          bool vis)
    : AccessScopeNode(k, self_nm, self_mp, meth_holder, sndrBCI, vis){}
  u_char code() { return DATAASSIGNMENT_CODE; }
};


void ScopeDescRecorder::generate() {
  assert(root, "root scope must be present");
  // Generate the bytecodes for the ScopeDescs and their NameDescs.

  pcs->mark_scopes();
  (void) root->computeVisibility();
  root->generate(this, 0);
  root->generateBody(this, 0);
  codes->alignToWord();
  _hasCodeBeenGenerated = true;
}

ScopeInfo ScopeDescRecorder::addScope(ScopeInfo scope, ScopeInfo senderScope){
  if (root == NULL) {
    assert( senderScope == NULL, "Root scope must be the first"); 
    root = scope;
  } else {
    assert( senderScope != NULL, "More than one root scope is generated"); 
    senderScope->addNested(scope);
  }
  return scope;
}

int32 ScopeDescRecorder::offset(ScopeInfo scope) {
  assert(scope->offset != INVALID_OFFSET, "uninitialized offset");
  return scope->offset;
}

ScopeInfo ScopeDescRecorder::addMethodScope(ScopeLookupKey* k, 
                                            oop meth,
                                            NameNode* self_nm,
                                            oop self_mp,
                                            oop meth_holder,
                                            bool lte,
                                            int32 scpID,
                                            ScopeInfo senderScope, 
                                            fint sndrBCI,
                                            bool vis) {
  return addScope(new MethodScopeNode(k, meth, self_nm, self_mp,
                                      meth_holder, lte, scpID, sndrBCI, vis),
                                      
                  senderScope);
}

ScopeInfo ScopeDescRecorder::addTopLevelBlockScope(ScopeLookupKey* k,
                                                   oop meth,
                                                   mapOop rm,
                                                   NameNode* self_nm,
                                                   NameNode* self_nm2, // cached value for PPC
                                                   oop self_mp,
                                                   oop meth_holder,
                                                   NameNode* receiver,
                                                   NameNode* receiver2, // cached value for PPC
                                                   bool lte,
                                                   int32 scpID,
                                                   ScopeInfo senderScope, 
                                                   fint sndrBCI,
                                                   bool vis) {
  return addScope(new TopLevelBlockScopeNode(k, meth, rm,
                                             self_nm, self_nm2, self_mp, 
                                             meth_holder, receiver, receiver2, lte,
                                             scpID, sndrBCI, vis),
                                             senderScope);
}

ScopeInfo ScopeDescRecorder::addBlockScope(ScopeLookupKey* k, 
                                           oop meth,
                                           mapOop rm,
                                           NameNode* receiver,
                                           ScopeInfo parnt,
                                           bool lte,
                                           int32 scpID,
                                           ScopeInfo senderScope, 
                                           fint sndrBCI,
                                           bool vis) {
  return addScope(new BlockScopeNode(k, meth, rm, receiver, parnt, lte,
                                     scpID, sndrBCI, vis), senderScope);
}

ScopeInfo ScopeDescRecorder::addDeadBlockScope(ScopeLookupKey* k,
                                               oop meth,
                                               NameNode* block_nm,
                                               bool lte,
                                               int32 scpID,
                                               ScopeInfo senderScope, 
                                               fint sndrBCI,
                                               bool vis) {
  return addScope(new DeadBlockScopeNode(k, meth, block_nm, lte,
                                         scpID, sndrBCI, vis), senderScope);
}

ScopeInfo ScopeDescRecorder::addDataAccessScope(ScopeLookupKey* k,
                                                NameNode* self_nm,
                                                oop self_type,
                                                oop meth_holder,
                                                ScopeInfo senderScope, 
                                                fint sndrBCI,
                                                bool vis) {
  return addScope(new DataAccessScopeNode(k, self_nm, self_type,
                                          meth_holder, sndrBCI, vis),
                  senderScope);
}

ScopeInfo ScopeDescRecorder::addDataAssignmentScope(ScopeLookupKey* k, 
                                                    NameNode* self_nm,
                                                    oop self_type,
                                                    oop meth_holder,
                                                    ScopeInfo senderScope, 
                                                    fint sndrBCI,
                                                    bool vis) {
  return addScope(new DataAssignmentScopeNode(k, self_nm, self_type,
                                              meth_holder, sndrBCI, vis),
                  senderScope);
}

void ScopeDescRecorder::addSlot(ScopeInfo scope, fint slotIndex, NameNode* l){
  assert(!scope->lite, "cannot add slot to lite scopeDesc");
  scope->slotList->insert(slotIndex, l);
}

void ScopeDescRecorder::addExprStack(ScopeInfo scope, fint index, 
                                     NameNode* l) {
  assert(!scope->lite, "cannot add expression to lite scopeDesc");
  scope->exprList->insert(index, l);
}



// When a method includes a block, the code must hold
// onto that block from the time it is created to the time it
// is zapped. The live block descs record those locations.
// index is the bci of the literal code that pushes the block.

void ScopeDescRecorder::addBlock( ScopeInfo scope, fint index, 
                                  NameNode* l) {
  assert(!scope->lite, "cannot add expression to lite scopeDesc");
  scope->blockList->insert(index, l);
}

void ScopeDescRecorder::genScopeDescHeader(u_char code, 
                                           u_char lookupIndex, 
                                           bool lte,
                                           bool nameDescs) {
  scopeDescHeaderByte b;
  b.pack(code, lookupIndex, lte, nameDescs);
  codes->appendByte(b.value());
  if (nameDescs) {
    // refer to updateScopeDescHeader
    codes->appendHalf(0); // placeholder for expression offset
    codes->appendHalf(0); // placeholder for block      offset
    codes->appendHalf(0); // placeholder for next       offset
  }
}

void ScopeDescRecorder::updateScopeDescHeader( fint offset,
                                               fint startOfExpr,
                                               fint startOfBlocks,
                                               fint next) {
  if (!fits_in_halfword(startOfExpr) ||
      !fits_in_halfword(startOfBlocks) ||
      !fits_in_halfword(next))
    fatal("Can't fit index in preallocated half-word slot");

  // refer to genScopeDescHeader
  codes->putHalfAt(startOfExpr,   offset+1);
  codes->putHalfAt(startOfBlocks, offset+3);
  codes->putHalfAt(next,          offset+5);
}

inline void ScopeDescRecorder::genIndex(fint index) {
  if (index < EXTENDED_INDEX) {
    // generate 1 byte indexing the oop.
    codes->appendByte(index);
  } else {
    codes->appendByte(EXTENDED_INDEX);
    codes->appendHalf(index);
  }
}

void ScopeDescRecorder::genValue(int32 v) {
  genIndex(getValueIndex(v));
}

void ScopeDescRecorder::genOop(oop o) {
  genIndex(getOopIndex(o));
}

PcDescInfoClass::PcDescInfoClass(fint sz) {
  nodes = NEW_RESOURCE_ARRAY(PcDescNode, sz); 
  end   = 0;
  size  = sz;
}

void PcDescInfoClass::extend(fint newSize) {
  PcDescNode* newNodes = NEW_RESOURCE_ARRAY(PcDescNode, newSize);
  for(fint i=0;i < end; i++)
    newNodes[i] = nodes[i];
  nodes = newNodes;
  size  = newSize;
}

void PcDescInfoClass::add(fint pcOffset, ScopeInfo scope, fint bci) {
  if (scope->lite && !GenerateLiteScopeDescs) return;
  assert( end == 0 || pcOffset >= nodes[end-1].pcOffset, 
         "pcDesc in wrong order");
  if (end == size) extend(size*2 + 1);
  if (end > 0) {
    // skip if the previous had the same scope and bci.
    if (scope == nodes[end-1].scope && bci == nodes[end-1].bci) return;
    // overwrite if the previous had the same pcOffset.
    if (pcOffset == nodes[end-1].pcOffset) end--;
  }
  nodes[end].pcOffset = pcOffset;
  nodes[end].scope    = scope;
  nodes[end].bci      = bci;
  end++;
}

void PcDescInfoClass::mark_scopes() {
  for(fint i=0;i < end; i++) {
    if (nodes[i].scope) nodes[i].scope->usedInPcs = true;
  }
}
  
void PcDescInfoClass::copy_to(int32*& addr) {
  for(fint i = 0; i < end; i++) {
    PcDesc* pc = (PcDesc*) addr;
    pc->pc       = nodes[i].pcOffset;
    pc->scope    = nodes[i].scope ? nodes[i].scope->offset : IllegalBCI;
    pc->byteCode = nodes[i].bci;
    addr += sizeof(PcDesc)/sizeof(int32);
  }
}

fint ScopeDescRecorder::size() {
  return   sizeof(nmethodScopes)
         + codes->size()
         + oops->length()   * sizeof(oop)
         + values->length() * sizeof(int32)
         + pcs->length()    * sizeof(PcDesc);
}

ScopeDescRecorder::ScopeDescRecorder(fint byte_size, fint pcDesc_size) {
  // size is the initial size of the byte vector.
  root = 0;
  oops   = new Vector(INITIAL_OOPS_SIZE);
  values = new Vector(INITIAL_VALUES_SIZE);
  codes  = new ByteArray(byte_size);
  pcs    = new PcDescInfoClass(pcDesc_size);
  _hasCodeBeenGenerated = false;
}

void ScopeDescRecorder::copyTo(VtblPtr_t* addr, int32 backPointer) {
  { nmethodScopes d;
    addr[0] = d.vtbl_value();
  }
  { nmethodScopes*          d = (nmethodScopes*) addr;
    d->_nmethod_backPointer  = (nmethod*) backPointer;

    // Copy the body part of the nmethodScopes
    int32* start = (int32*)(d+1);
    int32* p     = start;

    codes->copy_to( p);

    d->set_oops_offset((char*) p - (char*) start);
    oops->copy_to( p);

    d->set_value_offset((char*) p - (char*) start);
    values->copy_to( p);

    d->set_pcs_offset((char*) p - (char*) start);
    pcs->copy_to( p);

    d->set_length((char*) p - (char*) start);

    assert( (char*) d + size() == (char*) p, "wrong size of nmethodScopes");
  }
}

void ScopeDescRecorder::addPcDesc(fint pcOffset, ScopeInfo scope, fint bci) {
  assert( scope, "scope must be specified in addPcDesc");
  assert( root, "root must be present");
  pcs->add(pcOffset, scope, bci);
}

#ifdef UNUSED
void ScopeDescRecorder::addIllegalPcDesc(fint pcOffset) {
  assert( root, "root must be present");
  pcs->add(pcOffset);
}
#endif

# if  GENERATE_DEBUGGING_AIDS
void ScopeDescRecorder::verify(nmethodScopes* scopes) {
  // Initialize iterator
  _scopes = scopes;
  _sd     = NULL;

  assert( root, "root must be present to verify");
  root->verify(_getNextScopeDesc());
  root->verifyBody();
}
#endif

// Contains the most common lookupTypes for scopeDescs.
// the percentages may no longer be accurate --MIW 12/14/94
static const LookupType commonLookupTypeTable[] = {
    NormalLookupType,                                // 47%
    ImplicitSelfLookupType,                          // 46%
    StaticNormalLookupType                           //  5%
};

static const fint commonLookupTypeTableSize =
  sizeof(commonLookupTypeTable)/sizeof(LookupType);

u_char getCommonLookupTypeIndex(LookupType l) {
  fint index;
  for(index = 0;
      index < commonLookupTypeTableSize && commonLookupTypeTable[index] != l;
      index++) {
  }
  return (index < commonLookupTypeTableSize) ? index + 1 : 0;
}

LookupType getCommonLookupTypeAt(u_char index) {
  assert( index <= commonLookupTypeTableSize, "index out of range");
  return commonLookupTypeTable[index-1];
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
