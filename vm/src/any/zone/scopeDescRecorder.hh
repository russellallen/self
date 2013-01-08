/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// ScopeDescRecorder provides the interface to generate scopeDescs for
// compiled methods (nmethods).
// To retrieve the generated information, use nmethodScopes

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class  Vector;
class  ByteArray;

// Interface to generate scope information for an nmethod
class ScopeDescRecorder: public ResourceObj {
 private:
  bool          _hasCodeBeenGenerated;
  Vector*       oops;
  Vector*       values;
  ByteArray*    codes;
  PcDescInfo    pcs;

 public:
  ScopeInfo      root;
  
  // Returns the offset for a scopeDesc after generation of the scopeDesc info.
  int32 offset(ScopeInfo scope);

  ScopeDescRecorder(fint scopeSize, // estimated size of scopes (in bytes)
                    fint npcDesc);  // estimated number of PcDescs

  // Interface for adding scopeDesc's.
  ScopeInfo addMethodScope(ScopeLookupKey* key, 
                           oop method,
                           NameNode* self_name,
                           oop self_map,
                           oop methodHolder_or_map,
                           bool lite = false,
                           int32 scopeID = 0,
                           ScopeInfo senderScope = NULL, 
                           fint senderBCI = IllegalBCI,
                           bool visible = false);

  ScopeInfo addTopLevelBlockScope(ScopeLookupKey* key,
                                  oop method,
                                  mapOop rm,
                                  NameNode* self_name,
                                  NameNode* cachedSelf_name,
                                  oop self_map,
                                  oop methodHolder_or_map,
                                  NameNode* receiver,
                                  NameNode* cachedReceiver_name,
                                  bool lite = false,
                                  int32 scopeID = 0,
                                  ScopeInfo senderScope = NULL, 
                                  fint senderBCI = IllegalBCI,
                                  bool visible = false);

  ScopeInfo addBlockScope(ScopeLookupKey* key,
                          oop method,
                          mapOop rm,
                          NameNode* receiver,
                          ScopeInfo parent,
                          bool lite = false,
                          int32 scopeID = 0,
                          ScopeInfo senderScope = NULL, 
                          fint senderBCI = IllegalBCI,
                          bool visible = false);

  ScopeInfo addDeadBlockScope(ScopeLookupKey* key,
                              oop method,
                              NameNode* block_name,
                              bool lite = false,
                              int32 scopeID = 0,
                              ScopeInfo senderScope = NULL, 
                              fint senderBCI = IllegalBCI,
                              bool visible = false);

  ScopeInfo addDataAccessScope(ScopeLookupKey* key, 
                               NameNode* self_name,
                               oop self_type,
                               oop methodHolder_or_map,
                               ScopeInfo senderScope = NULL, 
                               fint senderBCI = IllegalBCI,
                               bool visible = false);

  ScopeInfo addDataAssignmentScope(ScopeLookupKey* key, 
                                   NameNode* self_name,
                                   oop self_type,
                                   oop methodHolder_or_map,
                                   ScopeInfo senderScope = NULL, 
                                   fint senderBCI = IllegalBCI,
                                   bool visible = false);

  ScopeInfo addRemoteDataAccessScope(ScopeLookupKey* key, 
                                     NameNode* self_name,
                                     oop self_type,
                                     oop methodHolder_or_map,
                                     ScopeInfo senderScope = NULL,
                                     fint senderBCI = IllegalBCI,
                                     bool visible = false);

  ScopeInfo addRemoteDataAssignmentScope(ScopeLookupKey* key, 
                                         NameNode* self_name,
                                         oop self_type,
                                         oop methodHolder_or_map,
                                         ScopeInfo senderScope = NULL, 
                                         fint senderBCI = IllegalBCI,
                                         bool visible = false);

  // Interface for adding nameDescs.
  void addSlot(ScopeInfo scope, fint slotIndex, NameNode* l);

  void addExprStack( ScopeInfo scope, fint index, NameNode* l);
  void addBlock(     ScopeInfo scope, fint index, NameNode* l);

  // Interface for creating the pc-offset <-> (ScopeDesc, bci) mapping.
  void addPcDesc(fint pcOffset, ScopeInfo scope, fint bci);
  void addIllegalPcDesc(fint pcOffset);

  // Returns the size of the generated scopeDescs.
  fint size();

  // Copy the generated scopeDescs to 'addr'
  void copyTo(VtblPtr_t* addr, int32 backPointer);

# if  GENERATE_DEBUGGING_AIDS
  void verify(nmethodScopes* scopes);
# endif

  // Generates the the scopeDesc information.
  void generate();

 private:
  ScopeInfo addScope(ScopeInfo scope, ScopeInfo senderScope);

  void genScopeDescHeader(u_char code, u_char lookupIndex, 
                          bool lite, bool noNameDescs);

  void  updateScopeDescHeader(fint offset, fint startOfExpr, 
                              fint startOfBlocks, fint next);

  inline fint getValueIndex(int32 v);
  inline fint getOopIndex(oop o);
  
  inline void genIndex(fint index);
  void genValue(int32 v);
  void genOop(oop o);

  // Make the private stuff reachable from the internal nodes
  friend class NameNode;
  friend class LocationName;
  friend class ValueName;
  friend class MemoizedName;
  friend class BlockValueName;
  friend class IllegalName;

  friend class ScopeInfoClass;
  friend class CodeScopeNode;
  friend class MethodScopeNode;
  friend class TopLevelBlockScopeNode;
  friend class BlockScopeNode;
  friend class DeadBlockScopeNode;
  friend class AccessScopeNode;
  friend class DataAccessScopeNode;
  friend class DataAssignmentScopeNode;
  friend class RemoteAccessScopeNode;
  friend class RemoteDataAccessScopeNode;
  friend class RemoteDataAssignmentScopeNode;
};

// NameNode
//  - LocationName
//  - ValueName
//  - MemoizedName
//  - BlockValueName
//  - IllegalName

class NameNode: public ResourceObj {
public:
  int32 id;

  bool genHeaderByte(ScopeDescRecorder* rec, u_char code, fint index);

  virtual bool hasLocation()    { return false; }
  virtual bool isIllegal()      { return false; }
  virtual Location location()   { ShouldNotCallThis(); return UnAllocated; }
  virtual void generate(ScopeDescRecorder* rec) = 0;
};

class LocationName: public NameNode {
 private:
  Location l;

  void generate(ScopeDescRecorder* rec);

 public:
  LocationName(Location ln, int32 i_d = 0) { l = ln; id = i_d; }
  bool hasLocation()    { return true; }
  Location location()   { return l; }
};

class ValueName: public NameNode {
 private:
  oop value;
  
  void generate(ScopeDescRecorder* rec);

 public:
  ValueName(oop val, int32 i_d = 0) {
    value = val; id = i_d;
    assert(!val->is_block(), "should use BlockValueName");
  }
};

class MemoizedName: public NameNode {
 private:
  Location l;
  blockOop blk;

  void generate(ScopeDescRecorder* rec);

 public:
  MemoizedName(Location ln, blockOop blck, int32 i_d = 0) {
    l = ln; blk = blck; id  = i_d;
    assert( blck->is_block(), "must be a blockOop");
  }
  bool hasLocation()    { return true; }
  Location location()   { return l; }
};

class BlockValueName: public NameNode {
 private:
  blockOop blk;

  void generate(ScopeDescRecorder* rec);

 public:
  BlockValueName(blockOop blck, int32 i_d = 0) {
    assert(oop(blck)->is_block(), "should be a block");
    blk = blck;
    id  = i_d;
  }
};

// newValueName creates a ValueName or BlockValueName (if value is a block)
NameNode* newValueName(oop value);      

class IllegalName: public NameNode {
 private:
  bool isIllegal()  { return true; }
  void generate(ScopeDescRecorder* rec);
};

// commonLookupTypesTable is used to compact the lookupType of the scopeDesc
u_char     getCommonLookupTypeIndex(LookupType l);
LookupType getCommonLookupTypeAt(u_char index);


enum {
  LOCATION_CODE, VALUE_CODE, BLOCKVALUE_CODE, MEMOIZEDBLOCK_CODE, ILLEGAL_CODE
};

// helper data structures used during packing and unpacking
class nameDescHeaderByte {
 private:
  u_char byte; 
  static const u_char code_width;
  static const u_char index_width;
  static const u_char hasId_bit_num;
  static const u_char max_code;
  static const u_char illegal_value;
  
 public:
  static const u_char no_index;
  static const u_char max_index;

  u_char value() { return byte; }

  u_char code()  {
    if (byte==illegal_value) return ILLEGAL_CODE;
    return lowerBits(byte, code_width); 
  }
  u_char index()   { return lowerBits(byte >> code_width, index_width); }
  bool   hasId()   { return isSet(byte, hasId_bit_num); }
  bool   isIndexInlined() { return index() != no_index; }
  
#ifdef UNUSED
  u_char info()  { return byte >> code_width; }
#endif

  void pack(u_char code, bool has_id, u_char i) {
    if (code==ILLEGAL_CODE) {
      byte = illegal_value;
    } else {
      assert( code <= max_code, "code too high");
      assert( i <= no_index, "index too high");
      byte = addBits(i << code_width, code);
      if (has_id) byte = setNth(byte, hasId_bit_num);
    }
  }

  void unpack(u_char value) { byte = value; }
};

class scopeDescHeaderByte {
 private:
  u_char byte;
  static const u_char code_width;
  static const u_char lookup_width;
  static const u_char lite_bit_num;
  static const u_char nameDescs_bit_num;
  static const u_char max_code;
  static const u_char max_lookup;
 public:
  u_char value()        { return byte; }
  u_char code()         { return lowerBits(byte, code_width); }
  u_char lookupIndex()  { return lowerBits(byte >> code_width, lookup_width); }
  bool   lite()         { return isSet(byte, lite_bit_num); }
  bool   nameDescs()    { return isSet(byte, nameDescs_bit_num); }

  void pack(u_char code, u_char lookupIndex, bool lite, bool nameDescs) {
    assert( code <= max_code, "code too high");
    assert( lookupIndex <= max_lookup, "lookup index too high");
    byte = addBits(lookupIndex << code_width, code);
    if (lite)      byte = setNth(byte, lite_bit_num);
    if (nameDescs) byte = setNth(byte, nameDescs_bit_num);
  }

  void unpack(u_char value) { byte = value; }
};

# define BYTE_WIDTH       8 
# define EXTENDED_INDEX   nthMask(BYTE_WIDTH)
# define MAX_INLINE_VALUE nthMask(BYTE_WIDTH-1)

#define fits_in_halfword(x) ((x) > -0x10000  &&  (x) < 0x10000)

enum {
  METHOD_CODE, TOPLEVELBLOCK_CODE, BLOCK_CODE, DEADBLOCK_CODE,
  DATAACCESS_CODE,       DATAASSIGNMENT_CODE, 
  REMOTEDATAACCESS_CODE, REMOTEDATAASSIGNMENT_CODE
};


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
