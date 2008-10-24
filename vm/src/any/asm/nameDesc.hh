/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// A NameDesc describes the source-level value of a name in some Self scope
// (e.g. an argument, local, or expression stack entry).  NameDescs are usually
// stored in the zone as part of the debugging information.

typedef BoundedListTemplate<NameDesc*> NameDescBList;


class NameDesc: public ResourceObj {
  // are ResourceObj because some are created on-the-fly
 protected:
  int32 _id;

  NameDesc(int32 id) { _id = id; }

 public:
  virtual bool isLocation()     { return false; }
  virtual bool isValue()        { return false; }
  virtual bool isBlockValue()   { return false; }
  virtual bool isMemoizedBlock(){ return false; }
  virtual bool isIllegal()      { return false; }
  virtual bool isValueLocation(){ return false; }

  virtual bool hasLocation()    { return false; }
  virtual Location location() { SubclassResponsibility(); return Location(0); }
  virtual oop value()   { SubclassResponsibility(); return NULL; } 
  
  virtual bool verify() { return true; }
  virtual void print() = 0;

  fint           offset;
  fint           next;
};

class LocationNameDesc: public NameDesc {
public:
  Location l;

  LocationNameDesc(Location ln, int32 id) : NameDesc(id) { l = ln; }

  bool isLocation() { return true; }
  
  Location location() { return l; }
  bool hasLocation()  { return true; }
  
  void print();
};

class ValueNameDesc: public NameDesc {
 public:
  oop v;

  ValueNameDesc(oop value, int32 id = 0) : NameDesc(id) { v = value; }
  
  bool isValue() { return true; }
  
  oop value() { return v; }
  
  void print();
};

class BlockValueNameDesc: public NameDesc {
 public:
  blockOop v;
  
  BlockValueNameDesc(oop val, int32 id) : NameDesc(id) {
    assert(val->is_block(), "must be a blockOop");
    v = blockOop(val);
  }

  bool isBlockValue() { return true; }
  
  oop value() { return (oop)v; }
  
  void print();
};

class MemoizedBlockNameDesc: public NameDesc {
 public:
  Location l;
  blockOop v;

  MemoizedBlockNameDesc(Location ln, oop val, int32 id) : NameDesc(id) {
    l = ln;
    v = blockOop(val);
    assert(val->is_block(), "must be a blockOop");
  }

  bool isMemoizedBlock() { return true; }
  
  Location location() { return l; }
  bool hasLocation()  { return true; }
  oop value()         { return (oop)v; }
  
  void print();
};

class IllegalNameDesc: public NameDesc {
 public:
  IllegalNameDesc() : NameDesc(0) {}
  bool isIllegal() { return true; }
  
  void print();
};

# ifdef SIC_COMPILER
  // a ValueLocationNameDesc is a (value, location) pair used when initializing
  // an optimized stack frame
  class ValueLocationNameDesc: public NameDesc {
   public:
    oop v;
    Location loc;
    blockOop block;     // new prototype block (for blocks only; needed
                        // because of block remapping) or badOop if no
                        // remapping necessary  
    
    ValueLocationNameDesc(Location l, oop val, blockOop blk);
    bool isValueLocation()  { return true; }
    oop value()             { return v; }
    bool hasLocation()      { return true; }
    Location location()     { return loc; }
    
    void print();
  };
# endif


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
