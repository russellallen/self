/* Sun-$Revision: 9.1 $ */

#ifndef cecil_h
#define cecil_h
							      
# pragma interface

# include "array.h"

extern void breakpoint();
extern void error_breakpoint();
extern void fatalHandler();

const int IntTag = 0;
const int MemTag = 1;

const int TagSize = 1;
const int TagMask = 0x1;

# define asTaggedPointer(x) ((OOP) (((int)x) | TagMask))
# define asTaggedInteger(x) ((OOP) (x << 1))
# define unBoxInteger(x) ((int) x >> 1)


enum ObjectRelation {ir_same, ir_not_related, ir_ancestor, ir_descendant};

// these operations apply to all tagged oops
class CecilTaggedPointerClass {
 public:
  int tag() { return (int(this) & TagMask); } 
  CecilMap* map();
  CecilTaggedPointerClass* untag() { 
    return (CecilTaggedPointerClass*)(int(this)-tag());
  }
  bool isInt() { return (tag() == IntTag); }
  int asIntegerObj() { return (int) untag(); }
  CecilBaseObject* asBaseObj() { return (CecilBaseObject*)untag(); }
  CecilMemoryObject* asMemObj() { return (CecilMemoryObject*)untag(); }
  CecilFloatObject* asFloatObj();
  CecilCharObject* asCharObj();
  CecilStringObject* asStringObj();
  CecilArrayObject* asArrayObj();
  CecilClosureObject* asClosureObj();

  ObjectRelation relationTo(OOP obj);

  void print();
  void printShort();
};

// abstract base class
class OOPList: public Printable {
 protected:
  int len;
  OOPList(int l) { len = l; }
  OOP& index(int i) { return ((OOP*) (this + 1))[i]; }
 public:
  inline OOP& operator[](int i) { return index(i); }
  int length() { return len; }
  void printShort();
};

overload newOOPList;

class OOPList0: public OOPList {
 public:
  OOPList0() :OOPList(0) {}
};
inline OOPList* newOOPList() { return new OOPList0(); }

class OOPList1: public OOPList {
 private:
  OOP elems[1];
 public:
  OOPList1(OOP p0) :OOPList(1) { elems[0] = p0; }
};
inline OOPList* newOOPList(OOP p0) { return new OOPList1(p0); }

class OOPList2: public OOPList {
 private:
  OOP elems[2];
 public:
  OOPList2(OOP p0, OOP p1) :OOPList(2) { elems[0] = p0; elems[1] = p1; }
};
inline OOPList* newOOPList(OOP p0, OOP p1) { return new OOPList2(p0, p1); }

class OOPList3: public OOPList {
 private:
  OOP elems[3];
 public:
  OOPList3(OOP p0, OOP p1, OOP p2) :OOPList(3) {
    elems[0] = p0; elems[1] = p1; elems[2] = p2; }
};
inline OOPList* newOOPList(OOP p0, OOP p1, OOP p2) {
  return new OOPList3(p0, p1, p2); }

class OOPList4: public OOPList {
 private:
  OOP elems[4];
 public:
  OOPList4(OOP p0, OOP p1, OOP p2, OOP p3) :OOPList(4) {
    elems[0] = p0; elems[1] = p1; elems[2] = p2; elems[3] = p3; }
};
inline OOPList* newOOPList(OOP p0, OOP p1, OOP p2, OOP p3) {
  return new OOPList4(p0, p1, p2, p3); }

class OOPList5: public OOPList {
 private:
  OOP elems[5];
 public:
  OOPList5(OOP p0, OOP p1, OOP p2, OOP p3, OOP p4) :OOPList(5) {
    elems[0] = p0; elems[1] = p1; elems[2] = p2; elems[3] = p3; elems[4] = p4; }
};
inline OOPList* newOOPList(OOP p0, OOP p1, OOP p2, OOP p3, OOP p4) {
  return new OOPList5(p0, p1, p2, p3, p4); }

class OOPList6: public OOPList {
 private:
  OOP elems[6];
 public:
  OOPList6(OOP p0, OOP p1, OOP p2, OOP p3, OOP p4, OOP p5) :OOPList(6) {
    elems[0] = p0; elems[1] = p1; elems[2] = p2; elems[3] = p3; elems[4] = p4;
    elems[5] = p5; }
};
inline OOPList* newOOPList(OOP p0, OOP p1, OOP p2, OOP p3, OOP p4, OOP p5) {
  return new OOPList6(p0, p1, p2, p3, p4, p5); }

class OOPList7: public OOPList {
 private:
  OOP elems[7];
 public:
  OOPList7(OOP p0, OOP p1, OOP p2, OOP p3, OOP p4, OOP p5, OOP p6) :OOPList(7) {
    elems[0] = p0; elems[1] = p1; elems[2] = p2; elems[3] = p3; elems[4] = p4;
    elems[5] = p5; elems[6] = p6; }
};
inline OOPList* newOOPList(OOP p0, OOP p1, OOP p2, OOP p3, OOP p4, OOP p5,
			   OOP p6) {
  return new OOPList7(p0, p1, p2, p3, p4, p5, p6); }

class OOPList8: public OOPList {
 private:
  OOP elems[8];
 public:
  OOPList8(OOP p0, OOP p1, OOP p2, OOP p3, OOP p4, OOP p5, OOP p6,
	   OOP p7) :OOPList(8) {
    elems[0] = p0; elems[1] = p1; elems[2] = p2; elems[3] = p3; elems[4] = p4;
    elems[5] = p5; elems[6] = p6; elems[7] = p7; }
};
inline OOPList* newOOPList(OOP p0, OOP p1, OOP p2, OOP p3, OOP p4, OOP p5,
			   OOP p6, OOP p7) {
  return new OOPList8(p0, p1, p2, p3, p4, p5, p6, p7); }

class OOPList9: public OOPList {
 private:
  OOP elems[9];
 public:
  OOPList9(OOP p0, OOP p1, OOP p2, OOP p3, OOP p4, OOP p5, OOP p6, OOP p7,
	   OOP p8) :OOPList(9) {
    elems[0] = p0; elems[1] = p1; elems[2] = p2; elems[3] = p3; elems[4] = p4;
    elems[5] = p5; elems[6] = p6; elems[7] = p7; elems[8] = p8; }
};
inline OOPList* newOOPList(OOP p0, OOP p1, OOP p2, OOP p3, OOP p4, OOP p5,
			   OOP p6, OOP p7, OOP p8) {
  return new OOPList9(p0, p1, p2, p3, p4, p5, p6, p7, p8); }

class OOPList10: public OOPList {
 private:
  OOP elems[10];
 public:
  OOPList10(OOP p0, OOP p1, OOP p2, OOP p3, OOP p4, OOP p5, OOP p6, OOP p7,
	    OOP p8, OOP p9) :OOPList(10) {
    elems[0] = p0; elems[1] = p1; elems[2] = p2; elems[3] = p3; elems[4] = p4;
    elems[5] = p5; elems[6] = p6; elems[7] = p7; elems[8] = p8; elems[9] = p9; }
};
inline OOPList* newOOPList(OOP p0, OOP p1, OOP p2, OOP p3, OOP p4, OOP p5,
			   OOP p6, OOP p7, OOP p8, OOP p9) {
  return new OOPList10(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9); }

# define UNINITIALIZED_OOP asTaggedPointer(4)

struct CecilBaseObject: Printable {
  CecilMap* _map;
  
  CecilBaseObject(CecilMap* m) { _map = m; }
  CecilMap* map() { return _map; }  // Function that returns appropriate map
  char* name();
  
  OOP asTaggedObject() {return (OOP) ((int) this | TagMask);}
  
  virtual bool isIntOop() { return false; }
  virtual bool isMemOop() { return false; }
  virtual bool isArrayOop() { return false; }
  virtual bool isStringOop() { return false; }
  virtual bool isImmutableStringOop() { return false; }
  virtual bool isMutableStringOop() { return false; }
  virtual bool isFloatOop() { return false; }
  virtual bool isCharOop() { return false; }
  virtual bool isClosureOop() { return false; }

  CecilMemoryObject* asMemoryOop() { return (CecilMemoryObject*)this; }
  CecilArrayObject* asArrayOop() { return (CecilArrayObject*)this; }
  CecilStringObject* asStringOop() { return (CecilStringObject*)this; }
  CecilFloatObject* asFloatOop() { return (CecilFloatObject*)this; }
  CecilCharObject* asCharOop() { return (CecilCharObject*)this; }
  CecilClosureObject* asClosureOop() { return (CecilClosureObject*)this; }

  virtual bool equal(CecilBaseObject* r) {
    return (this == r);
  }

  void printShort();
  void print();
  void printHeader(char* typeString);
  OOP basicPrintString();
};

struct CecilEnv: Printable {
  CecilEnv* dynamicEnv;
  CecilEnv* staticEnv;
  int numLocals;
  
  OOP* locals() {
    return (OOP*)(((int)&(this->numLocals))+sizeof(numLocals));
  }
  CecilEnv(CecilEnv* dEnv, CecilEnv* sEnv, int nL = 0) {
    dynamicEnv = dEnv;  staticEnv = sEnv, numLocals = nL;
    OOP* l = locals();
    for (int i = 0; i < numLocals; i++) {
      l[i] = UNINITIALIZED_OOP;
    }
  }
  void printShort();
  void print();
};

# define GLOBAL(file,var)   (file##_env->var)

// Global environment
struct CecilInitialEnv: CecilEnv {
  // Object declarations
  OOP 	_any;
  OOP 	_void;
  OOP 	_closure;
  OOP 	_true;
  OOP 	_false;
  OOP 	_integer;
  OOP 	_float;
  OOP 	_char;
  OOP 	_array;
  OOP 	_string;
  OOP 	_mutable__string;

  // Map declarations
  CecilMap* cecilMap_any;
  CecilMap* cecilMap_void;
  CecilMap* cecilMap_closure;
  CecilMap* cecilMap_true;
  CecilMap* cecilMap_false;
  CecilMap* cecilMap_integer;
  CecilMap* cecilMap_integer_obj;
  CecilMap* cecilMap_float;
  CecilMap* cecilMap_float_obj;
  CecilMap* cecilMap_char;
  CecilMap* cecilMap_char_obj;
  CecilMap* cecilMap_array;
  CecilMap* cecilMap_array_obj;
  CecilMap* cecilMap_string;
  CecilMap* cecilMap_string_obj;
  CecilMap* cecilMap_mutable__string;
  CecilMap* cecilMap_mutable__string_obj;

  CecilInitialEnv(CecilEnv* d, CecilEnv* s) :
    CecilEnv(d,s,(sizeof(CecilInitialEnv) - sizeof(CecilEnv))/sizeof(OOP)) {};
};

extern CecilInitialEnv* base_env;
extern CecilEnv* currentEnv;     // Points to top of environment stack

// use this as the address of the global env
# define GLOBAL_ENV NULL


////////////////////////////////////////////////////////////////////////////
// Record object.  The compiler will generate subclasses of this class,
// which have instance variables defined for each field.  The numFields
// instance variable defines the number of words to examine for the 
// garbage collector
////////////////////////////////////////////////////////////////////////////
struct CecilMemoryObject: CecilBaseObject {
  int numFields;
  
  OOP* fields() { return (OOP*)(this + 1); }
  CecilMemoryObject(CecilMap* m, int nF): CecilBaseObject(m) {
    numFields = nF;
    OOP* f = fields();
    for (int i = 0; i < numFields; i++) {
      f[i] = UNINITIALIZED_OOP;
    }
  }
  bool isMemOop() { return true; }
  void printShort();
  void print();
};

struct CecilFloatObject: CecilBaseObject {
  float value;
  
  CecilFloatObject(float v): CecilBaseObject(GLOBAL(base,cecilMap_float_obj)) {
    value = v;
  }
  bool isFloatOop() { return true; }
  bool equal(CecilBaseObject* r) {
    return (r->isFloatOop() && value == r->asFloatOop()->value);
  }
  void printShort();
  OOP basicPrintString();
};

struct CecilCharObject: CecilBaseObject {
  char ch;
  
  CecilCharObject(char c): CecilBaseObject(GLOBAL(base,cecilMap_char_obj)) {
    ch = c;
  }
  bool isCharOop() { return true; }
  bool equal(CecilBaseObject* r) {
    return (r->isCharOop() && ch == r->asCharOop()->ch);
  }
  void printShort();
  OOP basicPrintString();
};

struct CecilStringObject: CecilBaseObject {
  int numBytes;
  
  CecilStringObject(int nB, CecilMap* mp)
    : CecilBaseObject(mp) { numBytes = nB; }

  void* operator new(size_t x) {
    fatal("Shouldn't be calling operator new() for CecilStringObject\n");
  }
  void* operator new(size_t baseSize, int numBytes) {
    return ::operator new(baseSize+numBytes);  // Change if new overridden
  }
  bool isStringOop() { return true; }

  char* bytes() { return (char *)(this + 1); }
  char getElement(int i) { return bytes()[i]; }
  void setElement(int i, char c) { bytes()[i] = c; }

  void print();
  OOP basicPrintString() { return asTaggedPointer(this); }
};

struct CecilImmutableStringObject: CecilStringObject {
  CecilImmutableStringObject(int nB)
  : CecilStringObject(nB, GLOBAL(base,cecilMap_string_obj)) {}
  bool isImmutableStringOop() { return true; }
  bool equal(CecilBaseObject* r) {
    if (r->isImmutableStringOop()) {
      CecilStringObject* rStr = r->asStringOop();
      return (numBytes == rStr->numBytes && 
	      (bcmp(bytes(), rStr->bytes(), numBytes) == 0));
    };
    return false;
  }
  void printShort();
};

CecilImmutableStringObject* newCecilImmutableStringObject(char *s);
CecilImmutableStringObject* newCecilImmutableStringObject(int len, char filler);

# define makeStringObj(x) asTaggedPointer(newCecilImmutableStringObject(x))

struct CecilMutableStringObject: CecilStringObject {
  CecilMutableStringObject(int nB)
  : CecilStringObject(nB, GLOBAL(base,cecilMap_mutable__string_obj)) {}
  bool isMutableStringOop() { return true; }
  void printShort();
};

CecilMutableStringObject* newCecilMutableStringObject(int len, char filler);

struct CecilArrayObject: CecilBaseObject {
  int numElements;
  
  CecilArrayObject(int nE): CecilBaseObject(GLOBAL(base,cecilMap_array_obj)) {
    numElements = nE; } 
  void* operator new(size_t x) {
    fatal("Shouldn't be calling operator new() for CecilArrayObject\n");
  }
  void* operator new(size_t baseSize, int numElems) {
    return ::operator new(baseSize+(4*numElems));
      // Change this call if new is ever overridden in an ancestor
  }
  bool isArrayOop() { return true; }

  OOP* elements() { return (OOP *)(this + 1); }
  OOP getElement(int i) { return elements()[i]; }
  void setElement(int i, OOP v) { elements()[i] = v; }

  void printShort();
  void print();
};

CecilArrayObject* newCecilArrayObject(int len, OOP filler);

struct CecilClosureObject: CecilBaseObject {
  CecilEnv* environment;
  
  CecilClosureObject(CecilMap* m, CecilEnv* e): CecilBaseObject(m) {
    environment = e;
  }
  bool isClosureOop() { return true; }
  void printShort();
  void print();
};


// A CecilMap is just a list of parents maps. The includes function returns
// true if the argument map is either this map or one of the parent's maps.

typedef bool (*PredicateTestProc)(OOP);

struct CecilMap: Printable {
  char* mapName;
  OOPList* parents;
  PredicateTestProc predicateTest;
  FieldEntryArray fields;

  CecilMap(char* n, OOPList* p, PredicateTestProc pTest = NULL)
    : fields(2) { parents = p; mapName = n; predicateTest = pTest; }
  char* name() { return mapName; }

  void setParents(OOPList* ps) { parents = ps; }

  void addField(FieldEntry* newField) { fields.add(newField); }
  int fieldOffset(char* fieldName);

  bool descendsFrom(CecilMap*);

  void printParents();
  void printShort();
  void print();
};

struct FieldEntry: Printable {
  char* fieldName;
  int offset;
  FieldEntry(char* n, int o) {
    int len = strlen(n);
    fieldName = (char *)malloc(len+1);
    strcpy(fieldName, n);
    offset = o;
  }
  void printShort();
};


// Message sending entry points

// internal entry point common to sends and resends
ReturnCode lookupCache(int selector, OOP* resultAddr,
		       OOPList& lookupArgs, OOPList& invokeArgs,
		       OOPList& privileges,
		       int constrainedPositionsMask, bool isResend,
		       bool testPreds, c_proc senderAddr = NULL);

// normal message send entry point
ReturnCode send(int selector, OOP* resultAddr, int constrainedPositionsMask,
		OOPList& args, OOPList& privileges,
		bool testPredicates = true) {
  return lookupCache(selector, resultAddr, args, args, privileges,
		     constrainedPositionsMask, false, testPredicates);
}

// resend needs two sets of arguments. The actuals which get passed to
// the method when we invoke it, and the directed arg's which determine
// what method applies. They need not be the same, although they often
// will be. If we make a cecil method point to the set containing all
// methods with the same name and number of arguments, then we would not
// have to call getMatchingSet here.
ReturnCode resend(int selector, OOP* resultAddr, int constrainedPositionsMask,
		  OOPList& args, OOPList& directees, OOPList& privileges,
		  c_proc senderAddr, bool testPredicates = true) {
  return lookupCache(selector, resultAddr, directees, args, privileges,
		     constrainedPositionsMask, true, testPredicates,
		     senderAddr);
}

void addMethod(int selector, c_proc code, MethodVisibility v,
	       OOPList* specializers, OOPList* realSpec = NULL);
void addAccessorMethod(int selector, ca_proc code, char* fieldName,
		       MethodVisibility v,
		       OOPList* specializers, OOPList* realSpec = NULL);

# define TEST_NLR(returnCode,resultOOP,cFuncEnv)			      \
    if (returnCode != NORMAL_RETURN) {					      \
      *_result = (resultOOP);						      \
      if (returnCode == (cFuncEnv)) {					      \
	returnCode = NORMAL_RETURN;					      \
      }									      \
      currentEnv = (cFuncEnv)->dynamicEnv;				      \
      return returnCode;						      \
    }

# define PROP_NLR(returnCode,resultOOP,cFuncEnv)			      \
    if (returnCode != NORMAL_RETURN) {					      \
      *_result = (resultOOP);						      \
      currentEnv = (cFuncEnv)->dynamicEnv;				      \
      return returnCode;						      \
    }

# define ACCESS(p,off) ((p)->asMemObj()->fields()[off])

inline CecilMap* CecilTaggedPointerClass::map() {
  if (isInt()) {
    return GLOBAL(base,cecilMap_integer_obj);
  } else {
    return asBaseObj()->map();
  }
}

inline CecilFloatObject* CecilTaggedPointerClass::asFloatObj() {
#ifdef ASSERT
  CecilBaseObject* p = asBaseObj();
  assert(p->isFloatOop(), "should be a float");
#endif
  return (CecilFloatObject*)untag();
}

inline CecilCharObject* CecilTaggedPointerClass::asCharObj() {
#ifdef ASSERT
  CecilBaseObject* p = asBaseObj();
  assert(p->isCharOop(), "should be a char");
#endif
  return (CecilCharObject*)untag();
}

inline CecilStringObject* CecilTaggedPointerClass::asStringObj() {
#ifdef ASSERT
  CecilBaseObject* p = asBaseObj();
  assert(p->isStringOop(), "should be a string");
#endif
  return (CecilStringObject*)untag();
}

inline CecilArrayObject* CecilTaggedPointerClass::asArrayObj() {
#ifdef ASSERT
  CecilBaseObject* p = asBaseObj();
  assert(p->isArrayOop(), "should be an array");
#endif
  return (CecilArrayObject*)untag();
}

inline CecilClosureObject* CecilTaggedPointerClass::asClosureObj() {
#ifdef ASSERT
  CecilBaseObject* p = asBaseObj();
  assert(p->isClosureOop(), "should be a closure");
#endif
  return (CecilClosureObject*)untag();
}

inline char* CecilBaseObject::name() { return _map->name(); }

# endif
