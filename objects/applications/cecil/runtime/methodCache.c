/* Sun-$Revision: 9.1 $ */

# pragma implementation "methodCache.c"

# include "cecil.h"
# include "methodCache.h"
# include "lookup.h"
# include <stdio.h>

// define the global method table

MethodCache theMethodCache;


// The CacheElement structure holds the information used to lookup methods
// in the cache.
BaseCacheElement::BaseCacheElement(int sel, OOPList& args, OOPList& privs,
				   int constrainedPositionsMask, c_proc res,
				   BaseCacheElement* n) {
  selector = sel;
  int nargs = args.length();
  for (int i=0; i<nargs; i++, constrainedPositionsMask >>= 1) {
    if (constrainedPositionsMask & 1) {
      maps.add(args[i]->map());
      if (privs.length() > 0) {
	privileges.add(privs[i]);
      }
    }
  }
  resender = res;
  next = n;
}

CacheElement::CacheElement(OOPList& args, OOPList& privs,
			   int constrainedPositionsMask, c_proc res,
			   CecilMethod* cm, BaseCacheElement* n):
  BaseCacheElement(cm->getSelector(), args, privs, constrainedPositionsMask, 
		   res, n) {
    cmeth = cm;
  }

PredicateCacheElement::PredicateCacheElement(int sel,
					     OOPList& args, OOPList& privs,
					     int constrainedPositionsMask, 
					     c_proc res,
					     BaseCacheElement* n):
  BaseCacheElement(sel, args, privs, constrainedPositionsMask, res, n) {
    decisionTree = NULL;
  }

bool BaseCacheElement::match(int sel, int nargs, OOPList& args, OOPList& privs,
			     int constrainedPositionsMask, c_proc res) {
  if (selector != sel) {
    return false;
  }
  if (resender != res) {
    return false;
  }
  for (int i=0, j=0; i<nargs; i++, constrainedPositionsMask >>= 1) {
    if (constrainedPositionsMask & 1) {
      if (maps[j] != args[i]->map()) {
	return false;
      }
      if (privileges.length() > 0 && privileges[j] != privs[i]) {
	return false;
      }
      j++;
    }
  }
  return true;
}

CecilMethod* LeafPredicateDecisionNode::navigateTree(OOPList& args) {
  visitCount++;
  return cmeth;
}
  
CecilMethod* InteriorPredicateDecisionNode::navigateTree(OOPList& args) {
  visitCount++;
  assert(predicateTest, "should have a predicate routine");
  assert(argPos < args.length(), "invalid argument position");
  PredicateDecisionNode* n = 
    ((*predicateTest)(args[argPos]) ? trueBranch : falseBranch);
  if (n) {
    return n->navigateTree(args);
  } else {
    return NULL;
  }
}

MethodCache::MethodCache() {
  for (int i=0; i<CACHE_SIZE; i++) {
    buckets[i] = NULL;
  }
}

int MethodCache::hash(int selector, int nargs, OOPList& args,
		      int constrainedPositionsMask, c_proc resender) {
  int h = selector ^ nargs ^ (((int) resender) >> 2);
  for (int i=0; i<nargs; i++, constrainedPositionsMask >>= 1) {
    if (constrainedPositionsMask & 1) {
      // hash in the map address, too
      h ^= ((int) args[i]->map()) >> 2;
    }
  }
  return h & CACHE_MASK;
}

CecilMethod* MethodCache::lookup(int selector, OOPList& args, OOPList& privs,
				 int constrainedPositionsMask,
				 c_proc resender) {
  int nargs = args.length();
  int hash_val = 
    hash(selector, nargs, args, constrainedPositionsMask, resender);
  BaseCacheElement* bucket = buckets[hash_val];
  while (bucket != NULL) {
    if (bucket->match(selector, nargs, args, privs, constrainedPositionsMask,
		      resender)) {
      return bucket->navigateTree(args);
    }
    bucket = bucket->next;
  }
  return NULL;
}

void MethodCache::add(int selector, OOPList& args, OOPList& privs,
		      int constrainedPositionsMask, c_proc resender,
		      PredDecisionArray& decisions, CecilMethod* cmeth) {
  int nargs = args.length();
  int hash_val = 
    hash(selector, nargs, args, constrainedPositionsMask, resender);
  BaseCacheElement** bucketLoc = &buckets[hash_val];
  BaseCacheElement* bucket = *bucketLoc;
  if (decisions.length() == 0) {
    // not affected by predicate objects; add a simple entry
    *bucketLoc = new CacheElement(args, privs, constrainedPositionsMask,
				  resender, cmeth, bucket);
    return;
  }
  // Message affected by predicates.
  // Search for an existing entry which contains a decision tree for this
  // message.
  PredicateCacheElement* predElem;
  while (bucket != NULL) {
    if (bucket->match(selector, nargs, args, privs, constrainedPositionsMask,
		      resender)) {
      // found a matching bucket
      assert(bucket->isPredicateCacheElement(), 
	     "matching entry should be a PredicateCacheElement");
      predElem = (PredicateCacheElement*) bucket;
      goto found;
    }
    bucket = bucket->next;
  }
  // not found; create a new cache entry
  *bucketLoc = predElem =
    new PredicateCacheElement(selector, args, privs, constrainedPositionsMask,
			      resender, *bucketLoc);
 found:
  extendTree(decisions, cmeth, predElem->decisionTree);
}

void MethodCache::extendTree(PredDecisionArray& decisions, CecilMethod* cm,
			     PredicateDecisionNode*& node, int pos) {
  // Traverse down the tree until we reach a branch that hasn't been filled 
  // in yet.
  if (node == NULL) {
    node = buildPath(decisions, pos, cm);
  } else {
    assert(node->isInterior(), "should be an interior node");
    InteriorPredicateDecisionNode* inode = 
      (InteriorPredicateDecisionNode*) node;
    assert(decisions[pos]->pTest == inode->predicateTest &&
	   decisions[pos]->argPos == inode->argPos,
	   "predicates in tree should be a prefix of those in decisions");
    PredicateDecisionNode*& nextNode = 
      (decisions[pos]->result ? inode->trueBranch : inode->falseBranch);
    extendTree(decisions, cm, nextNode, pos+1);
  }
}

PredicateDecisionNode* MethodCache::buildPath(PredDecisionArray& decisions, 
					      int startAt, CecilMethod* cm) {
  if (startAt >= decisions.length()) {
    return new LeafPredicateDecisionNode(cm);
  } else {
    InteriorPredicateDecisionNode* newNode = 
      new InteriorPredicateDecisionNode(decisions[startAt]->pTest, 
					decisions[startAt]->argPos);
    PredicateDecisionNode* newPath = buildPath(decisions, startAt+1, cm);
    if (decisions[startAt]->result) {
      newNode->trueBranch = newPath;
    } else {
      newNode->falseBranch = newPath;
    }
    return newNode;
  }
}

void MethodCache::printStats() {
  // Run through the cache and print out information on
  // the number of cached methods and the occupancy of rows
  // in the cache.
  
  const int cutoff = 10;
  int predNum = 0;
  
  int hist[cutoff + 1];
  for (int i=0; i<=cutoff; i++) {
    hist[i] = 0;
  }
  
  int num_methods = 0;
  for (i=0; i<CACHE_SIZE; i++) {
    BaseCacheElement* bucket = buckets[i];
    int len = 0;
    while (bucket != NULL) {
      len++;
      if (bucket->isPredicateCacheElement()) predNum++;
      bucket = bucket->next;
    }
    num_methods += len;
    hist[len < cutoff ? len : cutoff]++;
  }
  
  printf("There are %d methods (%d predicates) in the cache, in %d buckets:\n",
	 num_methods, predNum, CACHE_SIZE);
  for (i=0; i<cutoff; i++) {
    if (hist[i] > 0) {
      printf("\t%d lines with %d methods\n", hist[i], i);
    }
  }
  if (hist[cutoff] > 0) {
    printf("\t%d lines with %d or more methods\n", hist[cutoff], cutoff);
  }
} 
