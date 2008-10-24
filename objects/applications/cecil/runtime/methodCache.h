/* Sun-$Revision: 9.1 $ */

# ifndef methodCache_h
# define methodCache_h

# pragma interface

  class MethodCache;

  class BaseCacheElement {
   protected:
    int selector;
    CecilMapArray maps;
    CecilOopArray privileges;
    c_proc resender;
    BaseCacheElement* next;

   public:
    BaseCacheElement(int sel, OOPList& args, OOPList& privs,
		       int constrainedPositionsMask, c_proc resender,
		       BaseCacheElement* n);

    virtual bool isPredicateCacheElement() { return false; };

    bool match(int selector, int nargs, OOPList& args, OOPList& privs,
		 int constrainedPositionsMask, c_proc resender);

    virtual CecilMethod* navigateTree(OOPList& args) = 0;

    friend MethodCache;
  };

  class CacheElement: public BaseCacheElement {
   protected:
    CecilMethod* cmeth;
    
   public:
    CacheElement(OOPList& args, OOPList& privs, int constrainedPositionsMask,
		   c_proc resender, CecilMethod* cmeth, BaseCacheElement* n);

    CecilMethod* navigateTree(OOPList& args) { return cmeth; }
  };

  class PredicateDecisionNode {
   protected:
    int visitCount;
   public:
    PredicateDecisionNode() { visitCount = 0; }

    virtual bool isLeaf() { return false; }
    virtual bool isInterior() { return false; }

    virtual CecilMethod* navigateTree(OOPList& args) = 0;
  };

  class LeafPredicateDecisionNode: public PredicateDecisionNode {
   protected:
    CecilMethod* cmeth;

   public:
    LeafPredicateDecisionNode(CecilMethod* cm) { cmeth = cm; }

    bool isLeaf() { return true; }

    CecilMethod* navigateTree(OOPList& args);
  };

  class InteriorPredicateDecisionNode: public PredicateDecisionNode {
   protected:
    PredicateTestProc predicateTest;
    int argPos;
    PredicateDecisionNode* trueBranch;
    PredicateDecisionNode* falseBranch;

   public:
    InteriorPredicateDecisionNode(PredicateTestProc pTest, int pos) {
      predicateTest = pTest; argPos = pos; trueBranch = falseBranch = NULL; }

    bool isInterior() { return true; }

    CecilMethod* navigateTree(OOPList& args);

    friend MethodCache;
  };
    
  class PredicateCacheElement: public BaseCacheElement {
   protected:
    PredicateDecisionNode* decisionTree;

   public:
    PredicateCacheElement(int sel, OOPList& args, OOPList& privs,
			  int constrainedPositionsMask, c_proc resender, 
			  BaseCacheElement* n);

    bool isPredicateCacheElement() { return true; };

    CecilMethod* navigateTree(OOPList& args) { 
      return decisionTree->navigateTree(args); }

    friend MethodCache;
  };

  class PredDecision {
   protected:
    PredicateTestProc pTest;
    bool result;
    int argPos;

   public:
    PredDecision(PredicateTestProc pt, bool r, int pos) { 
      pTest = pt; result = r; argPos = pos; }

    friend MethodCache;
  };
  
  // make the size of the cache a power of two for faster hashing
# define CACHE_SIZE 1024
# define CACHE_MASK (CACHE_SIZE - 1)
  
  class MethodCache {
   protected:
    BaseCacheElement* buckets[CACHE_SIZE];

    int hash(int selector, int nargs, OOPList& args,
	     int constrainedPositionsMask, c_proc resender);

    void extendTree(PredDecisionArray& decisions, CecilMethod* cm,
		    PredicateDecisionNode*& node, int pos = 0);
    PredicateDecisionNode* buildPath(PredDecisionArray& decisions, 
				     int startAt, CecilMethod* cm);
    
   public:
    MethodCache();
    
    CecilMethod* lookup(int selector, OOPList& args, OOPList& privileges,
			int constrainedPositionsMask, c_proc resender);

    void add(int selector, OOPList& args, OOPList& privileges,
	     int constrainedPositionsMask, c_proc resender,
	     PredDecisionArray& decisions, CecilMethod* cmeth);

    void printStats();
  };
  
  // declare one global method cache
  extern MethodCache theMethodCache;
  
#endif
