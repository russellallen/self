/* Sun-$Revision: 9.1 $ */

#ifndef Array_h
#define Array_h

# pragma interface

# include "types.h"
# include "printable.h"

// An Array is a dynamic array which means that it expands when it fills up
// and contracts when it empties.

typedef void* T;

class Array: public Printable {
 protected:
  int size;
  int point;
  T* data;

  void enlargeArray();
  void reduceArray();
 public:
  Array(int init_size = 2) {
    size = init_size;
    data = new T [size];
    point = 0;
  }

  virtual ~Array() { delete [] data; }

  void add(T a) {
    if (point == size) enlargeArray();
    data[point++] = a;
  }
  void remove(T a);

  void clear();
  void fastClear() { point = 0; }

  int length() { return this == NULL ? 0 : point; }

  T& operator[](int i) { return data[i]; }

  void printShort();
};

# define ArrayOf(name,type)						      \
class name##Array: public Printable {					      \
 protected:								      \
  Array array;								      \
 public:								      \
  name##Array(int init_size = 2) : array(init_size) {}			      \
  void add(type a) { array.add((T) a); }				      \
  void remove(type a) { array.remove((T) a); }				      \
  void clear() { array.clear(); }					      \
  void fastClear() { array.fastClear(); }				      \
  int length() { return this == NULL ? 0 : array.length(); }		      \
  type& operator[](int i) { return (type&) array[i]; }			      \
  void printShort() { return array.printShort(); }			      \
}

ArrayOf(CecilOop,OOP);
ArrayOf(CecilMap,CecilMap*);
ArrayOf(CecilMethod,CecilMethod*);
ArrayOf(FieldEntry,FieldEntry*);
ArrayOf(PredDecision,PredDecision*);

#endif
