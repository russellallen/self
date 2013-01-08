/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// bounded lists: approx. length is know at creation time; allow efficient
// access to ith element.  Not much more than a glorified growable array.


template<class data_type> class BoundedListTemplate : public ResourceObj {
 protected:
  int32 len;            /* current length */
  int32 max;            /* maximum length */
  data_type* data;       /* data array     */
  bool on_C_heap;       /* allocated on C heap?     */

  void grow();          /* grow data array (double length) */
  
 public:
  BoundedListTemplate(int32 maxLen);
  BoundedListTemplate(int32 maxLen, bool on_c_heap);
  ~BoundedListTemplate() { if (on_C_heap) selfs_free((char*)data); } 

  void  clear()         { len = 0; }
  int32 length()        { return len; }
  int32 capacity()      { return max; }
  bool  isEmpty()       { return len == 0; }
  bool  nonEmpty()      { return len != 0; }
  bool  isFull()        { return len == max; }

  void append(data_type elem) {
    if (len == max) grow();
    data[len++] = elem;
  }
  void appendList(BoundedListTemplate* l) {
    for (fint i = 0; i < l->length(); i++) append(l->nth(i));
  }
  void push(data_type elem) { append(elem); }

  data_type nth(int32 i) {
    if (i < 0 || i >= len) fatal("accessing nonexisting list element");
    return data[i];
  }
  data_type first() {
    if (!len) fatal("list is empty");
    return data[0];
  }
  data_type last() {
    if (!len) fatal("list is empty");
    return data[len-1];
  }

  data_type pop() {
    if (len <= 0) fatal("popping from empty list");
    return data[--len];
  }

  data_type top() {
    if (len <= 0) fatal("empty list");
    return data[len-1];
  }

  void nthPut(int32 i, data_type elem, bool okGrow = true) {
    if (i < 0 || i > len || (!okGrow && i == len))
      fatal("accessing nonexisting list element");
    if (okGrow && i == len) {
      append(elem);   /* data array needs to grow */
    } else {
      data[i] = elem;
    }
  }

  bool contains(data_type elem);
  fint find(data_type elem);      /* returns index or -1 */
  fint find(data_type elem, bool (* f)(data_type, data_type));
  void remove(data_type elem);    /* preserves ordering */
  void removeFast(data_type elem); /* doesnt preserve ordering */
  void apply(void f(data_type));

  data_type* data_addr()  { return data; }
  void print_short() { lprintf("List %#lx", this); }
  virtual void print();
};

template<class data_type> BoundedListTemplate<data_type>::BoundedListTemplate(int32 maxLen) {
  len = 0;
  assert(maxLen >= 0, "awfully short list");
  max = maxLen;
  data = NEW_RESOURCE_ARRAY( data_type, maxLen);
  on_C_heap = false;
}

template<class data_type> BoundedListTemplate<data_type>::BoundedListTemplate(int32 maxLen, bool c_heap) { // for static lists
  len = 0;
  max = maxLen;
  on_C_heap = c_heap;
  if (c_heap) {
    data = (data_type*)AllocateHeap(maxLen * sizeof(data_type), "bounded list");
  } else {
    data = NEW_RESOURCE_ARRAY( data_type, maxLen);
  }
}

template<class data_type> void BoundedListTemplate<data_type>::grow() {
  data_type* newData;
  if (on_C_heap) {
    newData = (data_type*)AllocateHeap(2 * max * sizeof(data_type), "bounded list");
  } else {
    newData = NEW_RESOURCE_ARRAY( data_type, max * 2);
  }
  for (fint i = 0; i < length(); i++) newData[i] = data[i];
  if (on_C_heap) selfs_free(data);
  data = newData;
  max *= 2;
}

template<class data_type> bool BoundedListTemplate<data_type>::contains(data_type elem) {
  for (fint i = 0; i < length(); i++) {
    if (data[i] == elem) return true;
  }
  return false;
}


template<class data_type> fint BoundedListTemplate<data_type>::find(data_type elem) {
  for (fint i = 0; i < length(); i++) {
    if (data[i] == elem) return i;
  }
  return -1;
}


template<class data_type> fint BoundedListTemplate<data_type>::find(data_type token, bool (*f)(data_type, data_type)) {
  for (fint i = 0; i < length(); i++) {
    if (f(token, data[i])) return i;
  }
  return -1;
}


template<class data_type> void BoundedListTemplate<data_type>::remove(data_type elem) {
  for (fint i = 0; i < length(); i++) {
    if (data[i] == elem) {
      for (fint j = i + 1; j < length(); j++) data[j-1] = data[j];
      --len;
      return;
    }
  }
  ShouldNotReachHere();
}


template<class data_type> void BoundedListTemplate<data_type>::removeFast(data_type elem) {
  for (fint i = 0; i < length(); i++) {
    if (data[i] == elem) {
      if (len > 0)
        // don't need to preserve order- just replace with last elem
        data[i] = data[--len];
      else
        --len;
      return;
    }
  }
  ShouldNotReachHere();
}

template<class data_type> void BoundedListTemplate<data_type>::apply(void f(data_type)) {
  for (fint i = 0; i < length(); i++) f(data[i]);
}


template<class data_type> void BoundedListTemplate<data_type>::print() {
  print_short();
  lprintf(": length %ld (max %ld) { ", (void*)len, (void*)max);
  for (fint i = 0; i < length(); i++) lprintf("%#lx ", (void*)nth(i));
  lprintf("}\n");
}


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)


typedef BoundedListTemplate<char*>     AddressList;
typedef BoundedListTemplate<Location> LocationList;
typedef BoundedListTemplate<nmethod*> nmethodBList;

# endif

typedef BoundedListTemplate<bool>             BoolBList;

typedef BoundedListTemplate<oop>              OopBList;
typedef BoundedListTemplate<preservedVmObj*>  preservedVmObjBList;
typedef BoundedListTemplate<Token*>           TokenList;
