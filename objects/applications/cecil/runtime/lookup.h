/* Sun-$Revision: 9.1 $ */

# ifndef lookup_h
# define lookup_h
  
# pragma interface

# include "methodCache.h"

  // A CecilMethod has a name and list of argument specifier objects.
  // The Match function returns true if the name and number of arguments
  // is the same as this method. The Applies function determines whether
  // the specializers of this method are uniformly more general than the
  // argument list of objects. And CompareSpec compares this method to another
  // and returns whether it specializes on the same objects, whether it is
  // uniformly more specific or less specific or whether neither is more
  // specific.
  
  // compiler-generated table mapping selector #'s to msg names
  extern char* MsgNames[];

  enum MethodRelation {more_specific, less_specific, same_args, dont_know};
  
  class CecilMethod: Printable {
   protected:
    int selector;
    OOPList& specializers;
    OOPList& realSpec;  // For methods attached to predicate objects
    MethodVisibility vis;
    
   public:
    CecilMethod(int sel, OOPList* specs, OOPList* realS, MethodVisibility v)
      : specializers(*specs), realSpec(*realS) { selector = sel; vis = v; }    

    inline int getSelector() { return selector; }
    inline char* getName() { return MsgNames[selector]; }
    inline OOPList& getSpecializers() {
      return (&realSpec ? realSpec : specializers);
    }
    inline OOP getArg(int i) { return getSpecializers()[i]; }
    inline int getNumArgs() { return getSpecializers().length(); }

    inline MethodVisibility visibility() { return vis; }
    inline bool isPublic()  { return vis == PublicMethod; }
    inline bool isPrivate() { return vis == PrivateMethod; }
    
    virtual void* getCode() = 0;

    virtual ReturnCode invoke(OOP* result_addr, OOPList& args) = 0;
    
    bool match(int selector, int argc);
    bool applies(OOPList& args, bool testPredicates, bool isResend,
		 PredDecisionArray& predTests);
    MethodRelation relationTo(CecilMethod* method);

    bool checkEncapsulation(OOPList& privileges);
    
    virtual CecilMethod* cachedVersion(OOPList& args) = 0;

    void prettyPrint(bool doCR = true);
    void printShort();
    void print();
  };

  class CecilNormalMethod: public CecilMethod {
   protected:
    c_proc code;
    
   public:
    CecilNormalMethod(int sel, OOPList* specializers, OOPList* realS,
		      MethodVisibility v, c_proc c)
      : CecilMethod(sel, specializers, realS, v) { code = c; }
    
    void* getCode() { return code; }
    
    ReturnCode invoke(OOP* result_addr, OOPList& args);

    CecilMethod* cachedVersion(OOPList& args) { return this; }
  };
  
  class CecilAccessorMethod : public CecilMethod {
   protected:
    ca_proc code;

   public:
    CecilAccessorMethod(int selector, OOPList* specializers, OOPList* realS,
			MethodVisibility v, ca_proc c)
      : CecilMethod(selector, specializers, realS, v) { code = c; }

    void* getCode() { return code; }
  };
  
  class CecilUncachedAccessorMethod : public CecilAccessorMethod {
   protected:
    char* field_name;

    int fieldOffset(OOP obj) { return obj->map()->fieldOffset(field_name); }

   public:
    CecilUncachedAccessorMethod(int selector,
				OOPList* specializers, OOPList* realS,
				MethodVisibility v, ca_proc c, char* fieldName)
      : CecilAccessorMethod(selector, specializers, realS, v, c) {
	field_name = fieldName; }

    ReturnCode invoke(OOP* returnAddr, OOPList& args);

    CecilMethod* cachedVersion(OOPList& args);
  };
  
  class CecilCachedAccessorMethod : public CecilAccessorMethod {
   protected:
    int offset;

   public:
    CecilCachedAccessorMethod(int selector,
			      OOPList* specializers, OOPList* realS,
			      MethodVisibility v, ca_proc c, int off)
      : CecilAccessorMethod(selector, specializers, realS, v, c) {
	offset = off; }

    ReturnCode invoke(OOP* returnAddr, OOPList& args);

    CecilMethod* cachedVersion(OOPList& args) {
      fatal("shouldn't be recomputing cached version of this method");
      return NULL; }
  };
  
# endif
