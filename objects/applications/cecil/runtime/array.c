/* Sun-$Revision: 9.1 $ */

# pragma implementation "array.h"

# include "array.h"

void Array::enlargeArray() {
  int vec_size = size*2;
  T* temp = new T [vec_size];
  for (int i=0; i<size; i++) temp[i] = data[i];
  delete [] data;
  size = vec_size;
  data = temp;
}

void Array::reduceArray() {
  int vec_size = size/2;
  T* temp = new T [vec_size];
  for (int i=0; i < vec_size; i++) {
    temp[i] = data[i];
  }
  delete [] data;
  size = vec_size;
  data = temp;
}

void Array::clear() {
  if (size > 2) {
    T* temp = new T [2];
    delete [] data;
    size = 2;
    data = temp;
  }
  point=0;
}

void Array::remove(T a) {
  int i=0;
  for(; i<point && data[i]!=a; i++);
  if (i==point) return;
  for(; i<point-1; i++) data[i] = data[i+1];
  point--;
  if (point<=(size/4)&&size>2) reduceArray();
}

void Array::printShort() {
  int len = length();
  if (len == 0) {
    printf("{}");
  } else {
    printf("{ ");
    for (int i = 0; i < len; i++) {
      pp_short(data[i]);
      if (i < len-1) {
	printf(", ");
      }
    }
    printf(" }");
  }
}
